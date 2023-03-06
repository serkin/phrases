from flask_mysqldb import MySQL
from flask import Flask, redirect, g, url_for
import os
from routes import words, api, dialogs


app = Flask(__name__)
app.config["MYSQL_USER"] = os.getenv('MYSQL_USER', 'root')
app.config["MYSQL_DB"] = os.getenv('MYSQL_DB', 'phrases')
app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST', '0.0.0.0')
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'


def create_app():

    mysql = MySQL(app)

    @app.before_request
    def set_global_locale():
        g.mysql = mysql

    @app.route("/")
    def home():
        cur = mysql.connection.cursor()
        cur.execute(
            "SELECT id, base FROM words WHERE hidden_at IS NULL AND is_active = 1 ORDER BY answered_at LIMIT 1;")
        rv = cur.fetchall()
        word = None
        if rv:
            word = rv[0]
        cur.close()
        return redirect(url_for('words.word', word_id=word["id"]))

    app.register_blueprint(words.bp)
    app.register_blueprint(api.bp)
    app.register_blueprint(dialogs.bp)

    return app


if __name__ == '__main__':
    app = create_app()
    app.run('0.0.0.0')

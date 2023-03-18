from flask_mysqldb import MySQL
from flask import Flask, redirect, g, session, url_for, request
import os
from flask_session import Session
from models import Word
from routes import words, api, dialogs
from db import db

app = Flask(__name__)
# app.config["MYSQL_USER"] = os.getenv('MYSQL_USER', 'root')
# app.config["MYSQL_DB"] = os.getenv('MYSQL_DB', 'phrases')
# app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST', '0.0.0.0')
# app.config['MYSQL_HOST'] = os.getenv('SQLALCHEMY_DATABASE_URI', "mysql://root:@127.0.0.1:3306/phrases")
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('SQLALCHEMY_DATABASE_URI', "mysql://root:@127.0.0.1:3306/phrases")
app.secret_key = "AW3[-498WM239D84]"
app.config['SESSION_TYPE'] = 'filesystem'


def create_app():

    mysql = MySQL(app)
    sess = Session()
    sess.init_app(app)
    db.init_app(app)

    @app.before_request
    def set_global_locale():
        g.mysql = mysql

    @app.route("/")
    def home():
        if request.args.get('category'):
            session['category'] = request.args.get('category')
        if request.args.get('all'):
            del session['category']
        query = db.session.query(Word).filter(
            Word.hidden_at.is_(None), Word.is_active == 1)

        if session.get('category'):
            query = query.filter(Word.category == session.get('category'))
        word = query.first()

        return redirect(url_for('words.word', word_id=word.id))

    app.register_blueprint(words.bp)
    app.register_blueprint(api.bp)
    app.register_blueprint(dialogs.bp)

    return app


if __name__ == '__main__':
    app = create_app()
    app.run('0.0.0.0', '8081', debug=True)

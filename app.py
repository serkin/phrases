from flask_mysqldb import MySQL
from flask import Flask, render_template, request, redirect, url_for
import os

app = Flask(__name__)
app.config["MYSQL_USER"] = os.getenv('MYSQL_USER', 'root')
app.config["MYSQL_DB"] = os.getenv('MYSQL_DB', 'phrases')
app.config['MYSQL_HOST'] = os.getenv('MYSQL_HOST', '0.0.0.0')
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

mysql = MySQL(app)


def create_app():

    @app.route("/")
    def index():
        cur = mysql.connection.cursor()
        cur.execute(
            """SELECT id, base FROM words WHERE hidden_at IS NULL ORDER BY RAND() limit 1""")
        rv = cur.fetchall()
        question = None
        if rv:
            question = rv[0]
        cur.close()
        return render_template("index.html", stat=_stat(), question=question)

    @app.route("/answer", methods=['POST', 'GET'])
    def answer():
        result = "fail"
        form = request.form
        word_id = form.get('word_id')
        answer = form.get('answer')
        cur = mysql.connection.cursor()
        cur.execute(
            """SELECT base, th FROM words WHERE id=%s LIMIT 1""", (word_id,))
        rv = cur.fetchall()
        if answer and rv[0]["th"] == answer:
            result = "success"
            answer = None

        if answer:
            cur.execute("""INSERT INTO log (word_id, status, answer) values(%s, %s, %s);""",
                        (form.get('word_id'), result, answer))
            mysql.connection.commit()
        cur.close()
        return render_template("answer.html", stat=_stat(), result=result, question=rv[0]["base"], answer=answer, word_id=word_id, correct_answer=rv[0]["th"])

    @app.route("/never")
    def never():
        cur = mysql.connection.cursor()

        cur.execute("""UPDATE words SET hidden_at = current_timestamp WHERE id = %s;""",
                    (request.args.get("word_id"),))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for("index"))

    def _stat():
        stat = {
            "fail": 0,
            "success": 0
        }
        cur = mysql.connection.cursor()

        cur.execute(
            "SELECT count(*) as total, status FROM `log` WHERE DATE(timestamp) = CURDATE() GROUP by status;")
        for row in cur.fetchall():
            stat[row["status"]] = row["total"]
        cur.close()
        return stat

    return app


if __name__ == '__main__':
    app = create_app()
    app.run('0.0.0.0')

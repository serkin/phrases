from collections import defaultdict
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
        cur.execute("""
SELECT
    words.id,
    base
FROM
    `words`
LEFT JOIN log ON log.word_id = words.id
WHERE
    hidden_at IS NULL AND is_active = 1
ORDER BY
    log.timestamp
LIMIT 1;""")
        rv = cur.fetchall()
        word = None
        if rv:
            word = rv[0]
        cur.close()
        return render_template("index.html", stat=_stat(), word=word)

    @app.route("/dialogs")
    def dialogs():
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM dialogs;")
        dialogs = cur.fetchall()
        cur.close()
        return render_template("dialogs.html", stat=_stat(), dialogs=dialogs)

    @app.route("/dialogs/<dialog_id>")
    def dialog(dialog_id):
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM dialogs where id = %s;", (dialog_id))
        _dialog = cur.fetchall()[0]
        cur.execute("""SELECT
    dialog_persons.name as dialog_person_name,
    words.id as word_id,
    words.base
FROM
    dialogs
LEFT JOIN dialog_words on dialog_words.dialog_id = dialogs.id
LEFT JOIN dialog_persons on dialog_persons.id = dialog_words.dialog_person_id
LEFT JOIN words on words.id = dialog_words.word_id
WHERE
    dialogs.id = %s
ORDER BY dialog_words.id;""", (dialog_id))
        dialog_words = cur.fetchall()
        cur.close()
        return render_template("dialog.html", stat=_stat(), dialog=_dialog, dialog_words=dialog_words)

    @app.route("/words")
    def words():
        cur = mysql.connection.cursor()
        show_all_words = request.args.get('show_all_words')
        cur.execute(f"""
SELECT
    words.id,
    base,
    th,
    is_active,
    log.status,
    COUNT(*) as total
FROM
    words
LEFT JOIN log ON words.id = log.word_id
WHERE
    words.hidden_at IS NULL {"AND DATE(log.timestamp) = CURDATE()" if not show_all_words else ""}
GROUP BY
    log.status, base, words.id, th, is_active
ORDER BY
    is_active desc, base;""")
        words = defaultdict(dict)
        for word in cur.fetchall():
            words[word["id"]] = dict(
                th=word["th"], base=word["base"], fail=0, success=0, is_active=word["is_active"])
            words[word["id"]][word["status"]] = word["total"]
        cur.close()
        return render_template("words.html", stat=_stat(), words=words)

    @app.route("/answer", methods=['POST', 'GET'])
    def answer():
        result = None
        form = request.form
        word_id = form.get('word_id', request.args.get("word_id"))
        user_answer = form.get('user_answer')

        cur = mysql.connection.cursor()
        cur.execute(
            """SELECT  id, base, th, spelling FROM words WHERE id=%s LIMIT 1""", (word_id,))
        rv = cur.fetchall()
        if user_answer:
            if rv and rv[0]["th"] == user_answer:
                result = "success"
            else:
                result = "fail"
        if user_answer and not form.get('second_attempt'):
            cur.execute("""INSERT INTO log (word_id, status, answer) values(%s, %s, %s);""",
                        (form.get('word_id'), result, user_answer))
            mysql.connection.commit()
        cur.close()
        return render_template("answer.html", stat=_stat(), result=result, word=rv[0], user_answer=user_answer)

    @app.route("/<word_id>/activate")
    def activate(word_id):
        cur = mysql.connection.cursor()

        cur.execute(
            """UPDATE words SET is_active = 1 WHERE id = %s;""", (word_id,))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for("words"))

    @app.route("/<word_id>/deactivate")
    def deactivate(word_id):
        cur = mysql.connection.cursor()

        cur.execute(
            """UPDATE words SET is_active = 0 WHERE id = %s;""", (word_id,))
        mysql.connection.commit()
        cur.close()
        return redirect(url_for("words", show_all_words=1))

    @app.route("/<word_id>/hide")
    def never(word_id):
        cur = mysql.connection.cursor()

        cur.execute(
            """UPDATE words SET hidden_at = current_timestamp WHERE id = %s;""", (word_id,))
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

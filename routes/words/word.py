from flask import redirect, render_template, request, url_for
from flask import Blueprint, g


bp = Blueprint('word', __name__, url_prefix='/<word_id>')


@bp.route("/edit", methods=['POST', 'GET'])
def edit(word_id):
    if request.method == "POST":
        form = request.form
        cur = g.mysql.connection.cursor()

        cur.execute(
            """UPDATE words SET base = %s, th =%s, spelling = %s, comment = %s WHERE id = %s;""", (form.get("base"), form.get("th") or None, form.get("spelling") or None, form.get("comment") or None, word_id))
        g.mysql.connection.commit()
        cur.close()
        return redirect(url_for("words.word", word_id=word_id))
    if request.method == "GET":
        cur = g.mysql.connection.cursor()
        cur.execute("SELECT * FROM words WHERE id = %s LIMIT 1;", (word_id,))
        rv = cur.fetchall()
        word = rv[0]
        return render_template("words/form.html", word=word)


@bp.route("/activate")
def activate(word_id):
    cur = g.mysql.connection.cursor()

    cur.execute(
        """UPDATE words SET is_active = 1 WHERE id = %s;""", (word_id,))
    g.mysql.connection.commit()
    cur.close()
    return redirect(url_for("words.index"))


@bp.route("/bind", methods=['POST'])
def bind(word_id):
    form = request.form
    cur = g.mysql.connection.cursor()
    try:
        cur.execute("INSERT INTO words_composition (word_id, child_word_id) VALUES(%s, %s)",
                    (word_id, form.get("word_id")))
        g.mysql.connection.commit()
    except:
        pass
    finally:
        cur.close()
    return redirect(url_for("words.word", word_id=word_id))


@bp.route("/deactivate")
def deactivate(word_id):
    cur = g.mysql.connection.cursor()

    cur.execute(
        """UPDATE words SET is_active = 0 WHERE id = %s;""", (word_id,))
    g.mysql.connection.commit()
    cur.close()
    return redirect(url_for("words.index"))


@bp.route("/hide")
def never(word_id):
    cur = g.mysql.connection.cursor()

    cur.execute(
        """UPDATE words SET hidden_at = current_timestamp WHERE id = %s;""", (word_id,))
    g.mysql.connection.commit()
    cur.close()
    return redirect(url_for("home"))

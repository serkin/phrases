from flask import redirect, request, url_for
from flask import Blueprint, g


bp = Blueprint('word', __name__, url_prefix='/<word_id>')


@bp.route("/edit")
def edit(word_id):
    pass


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
    return redirect(url_for("words.index", show_all_words=1))


@bp.route("/hide")
def never(word_id):
    cur = g.mysql.connection.cursor()

    cur.execute(
        """UPDATE words SET hidden_at = current_timestamp WHERE id = %s;""", (word_id,))
    g.mysql.connection.commit()
    cur.close()
    return redirect(url_for("home"))

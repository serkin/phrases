from flask import redirect, render_template, request, Blueprint, g, url_for

from ..words import word as word_bp

bp = Blueprint('words', __name__, url_prefix='/words')


@bp.route("/create", methods=['POST', 'GET'])
def create():
    if request.method == "POST":
        form = request.form
        cur = g.mysql.connection.cursor()
        cur.execute("INSERT INTO words (base, th, spelling,comment ) VALUES(%s, %s, %s, %s)",
                    (form.get("base"), form.get("th") or None, form.get("spelling") or None, form.get("comment") or None))
        g.mysql.connection.commit()

        cur.close()
        return redirect(url_for("words.word", word_id=cur.lastrowid))
    return render_template("words/form.html")


@bp.route("/<word_id>", methods=['POST', 'GET'])
def word(word_id):
    user_result = None
    form = request.form
    user_answer = form.get('user_answer')
    cur = g.mysql.connection.cursor()
    cur.execute("SELECT * FROM words WHERE id = %s LIMIT 1;", (word_id,))
    rv = cur.fetchall()
    word = rv[0]

    cur.execute("""
SELECT
    words.base,
    words.th,
    words.id
FROM
    words_composition
LEFT JOIN words ON words_composition.child_word_id = words.id
WHERE
    word_id = %s;""", (word_id,))
    children = cur.fetchall()

    cur.execute("""
SELECT
    words.base,
    words.th,
    words.id
FROM
    words_composition
LEFT JOIN words ON words_composition.word_id = words.id
WHERE
    word_id = %s;""", (word_id,))
    parents = cur.fetchall()

    # Handling User Response
    if user_answer:
        if word["th"] == user_answer:
            user_result = "success"
        else:
            user_result = "fail"

        # and not form.get('second_attempt'):
        cur.execute(
            "UPDATE words SET answered_at = now() WHERE id = %s", (word_id,))
        g.mysql.connection.commit()
    cur.close()
    return render_template("words/word.html", word=word, parents=parents, children=children, user_answer=user_answer, user_result=user_result)


@bp.route("")
def index():
    cur = g.mysql.connection.cursor()
    cur.execute("""
SELECT
    id,
    base,
    th,
    is_active
FROM
    words
WHERE
    hidden_at IS NULL
ORDER BY
    is_active desc, base;""")
    words = cur.fetchall()
    cur.close()
    return render_template("words/index.html", words=words)


bp.register_blueprint(word_bp.bp)

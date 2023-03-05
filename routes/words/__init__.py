from collections import defaultdict
from flask import redirect, render_template, request, Blueprint, g, url_for

from ..words import word as word_bp

bp = Blueprint('words', __name__, url_prefix='/words')


@bp.route("/create", methods=['POST', 'GET'])
def create():
    if request.method == "POST":
        form = request.form
        cur = g.mysql.connection.cursor()
        cur.execute("INSERT INTO words (base, th, spelling,comment ) VALUES(%s, %s, %s, %s)",
                    (form.get("base"), form.get("th"), form.get("spelling"), form.get("comment")))
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

    # Handling User Response
    if user_answer:
        if word["th"] == user_answer:
            user_result = "success"
        else:
            user_result = "fail"

        # and not form.get('second_attempt'):
        cur.execute("""INSERT INTO log (word_id, status, answer) values(%s, %s, %s);""",
                    (word_id, user_result, user_answer))
        g.mysql.connection.commit()
    cur.close()
    return render_template("words/word.html", word=word, children=children, user_answer=user_answer, user_result=user_result)


@bp.route("")
def index():
    cur = g.mysql.connection.cursor()
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
    return render_template("words/index.html", words=words)


bp.register_blueprint(word_bp.bp)

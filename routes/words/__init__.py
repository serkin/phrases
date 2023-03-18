from datetime import datetime
from flask import redirect, render_template, request, Blueprint, url_for

from models import Word, WordsComposition

from ..words import word as word_bp
from db import db
bp = Blueprint('words', __name__, url_prefix='/words')


@bp.route("/create", methods=['POST', 'GET'])
def create():
    if request.method == "POST":
        form = request.form

        word = Word()
        word.base = form.get("base")
        word.comment = form.get("comment") or None
        word.spelling = form.get("spelling") or None
        word.th = form.get("th") or None
        word.category = form.get("category") or None

        db.session.add(word)
        db.session.commit()

        return redirect(url_for("words.word", word_id=word.id))
    return render_template("words/form.html")


@bp.route("/<word_id>", methods=['POST', 'GET'])
def word(word_id):
    user_result = None
    form = request.form
    user_answer = form.get('user_answer')

    word = db.session.query(Word).filter(Word.id == word_id).first()

    query = db.session.query(Word.base, Word.th, Word.id) \
        .select_from(WordsComposition) \
        .join(Word, WordsComposition.child_word_id == Word.id) \
        .filter(WordsComposition.word_id == word_id) \
        .order_by(WordsComposition.id)

    children = query.all()

    query = db.session.query(Word.base, Word.th, Word.id) \
        .select_from(WordsComposition) \
        .join(Word, WordsComposition.word_id == Word.id) \
        .filter(WordsComposition.child_word_id == word_id) \
        .order_by(WordsComposition.id)

    parents = query.all()

    # Handling User Response
    if user_answer:
        if word.th == user_answer:
            user_result = "success"
        else:
            user_result = "fail"

        word.answered_at = datetime.now()
        db.session.commit()
    return render_template("words/word.html", word=word, parents=parents, children=children, user_answer=user_answer, user_result=user_result)


@bp.route("")
def index():
    query = db.session.query(Word).filter(Word.hidden_at.is_(
        None)).order_by(Word.is_active.desc(), Word.base)
    return render_template("words/index.html", words=query.all())


bp.register_blueprint(word_bp.bp)

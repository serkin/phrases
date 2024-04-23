from datetime import datetime
from flask import redirect, render_template, request, Blueprint, url_for, session

from models import Word, Attempt

from ..words import word as word_bp
from db import db
bp = Blueprint('words', __name__, url_prefix='/words')


@bp.route("/create", methods=['POST', 'GET'])
def create():
    if request.method == "POST":
        form = request.form

        word = Word()
        word.en = form.get("en")
        word.spelling = form.get("spelling") or None
        word.vi = form.get("vi") or None
        word.tags = form.get("tags") or None

        db.session.add(word)
        try:
            db.session.commit()
        except:
            db.session.rollback()
            word = db.session.query(Word).filter(
                Word.en == word.en, Word.vi == word.vi).first()
            return redirect(url_for("words.word", word_id=word.id))

        return redirect(url_for("words.word", word_id=word.id))
    return render_template("words/form.html")


@bp.route("/<word_id>", methods=['POST', 'GET'])
def word(word_id):
    user_result = None
    form = request.form
    user_answer = form.get('user_answer')

    word = db.session.query(Word).filter(Word.id == word_id).first()

    # Handling User Response
    if user_answer:
        word.last_attempt_at = datetime.now()
        
        attempt = Attempt()
        attempt.word_id = word.id
        attempt.is_correct = 'yes' if word.vi == user_answer else 'no'

        db.session.add(attempt)        
        db.session.commit()
    return render_template("words/word.html", word=word, parents=[], children=[], user_answer=user_answer, user_result=user_result)


@bp.route("")
def index():
    if "favourites" not in session:
        session["favourites"] = []
    query = db.session.query(Word).filter(Word.hidden_at.is_(
        None)).order_by(Word.is_active.desc(), Word.en)
    
    if request.args.get("favourites") and session["favourites"]:
        query = query.filter(Word.id.in_(session["favourites"]))

    return render_template("words/index.html", words=query.all(), favourites=session['favourites'])


bp.register_blueprint(word_bp.bp)

from datetime import datetime
from flask import redirect, render_template, request, url_for
from flask import Blueprint
from sqlalchemy import delete
from models import Word, WordsComposition
from db import db

bp = Blueprint('word', __name__, url_prefix='/<word_id>')


@bp.route("/edit", methods=['POST', 'GET'])
def edit(word_id):
    word = db.session.query(Word).get_or_404(word_id)
    if request.method == "POST":
        form = request.form

        word.base = form.get("base")
        word.comment = form.get("comment") or None
        word.spelling = form.get("spelling") or None
        word.th = form.get("th") or None
        word.tags = form.getlist("tags") or None
        db.session.commit()

        return redirect(url_for("words.word", word_id=word_id))

    if request.method == "GET":
        return render_template("words/form.html", word=word)


@bp.route("/activate")
def activate(word_id):
    word = db.session.query(Word).get_or_404(word_id)
    word.is_active = 1
    db.session.commit()
    return redirect(url_for("words.index", word_id=word_id))


@bp.route("/bind", methods=['POST'])
def bind(word_id):
    form = request.form
    words_composition = WordsComposition(word_id=word_id, child_word_id=form.get("word_id"))
    db.session.add(words_composition)
    db.session.commit()
    return redirect(url_for("words.word", word_id=word_id))


@bp.route("/unbind")
def unbind(word_id):
    form = request.args
    db.session.execute(delete(WordsComposition).where(WordsComposition.word_id == word_id, WordsComposition.child_word_id == form.get("child_word_id")))
    db.session.commit()
    return redirect(url_for("words.word", word_id=word_id))


@bp.route("/deactivate")
def deactivate(word_id):
    word = db.session.query(Word).get_or_404(word_id)
    word.is_active = 0
    db.session.commit()
    return redirect(url_for("words.word", word_id=word_id))


@bp.route("/hide")
def never(word_id):
    word = db.session.query(Word).get_or_404(word_id)
    word.hidden_at = datetime.now()
    db.session.commit()
    return redirect(url_for("home"))

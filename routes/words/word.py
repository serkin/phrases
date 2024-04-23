from datetime import datetime
from flask import redirect, render_template, request, url_for, session, jsonify
from flask import Blueprint
from sqlalchemy import delete
from models import Word
from db import db

bp = Blueprint('word', __name__, url_prefix='/<word_id>')


@bp.route("/edit", methods=['POST', 'GET'])
def edit(word_id):
    word = db.session.query(Word).get_or_404(word_id)
    if request.method == "POST":
        form = request.form

        word.en = form.get("en")
        word.spelling = form.get("spelling") or None
        word.priority = form.get("priority") or 1
        word.vi = form.get("vi") or None
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

from flask import render_template, request
from flask import Blueprint
from db import db
from models import Dialog, DialogPerson, Word, DialogWord
# from werkzeug import ImmutableMultiDict
bp = Blueprint('dialogs', __name__, url_prefix='/dialogs')


@bp.route("")
def index():
    query = db.session.query(Dialog)
    return render_template("dialogs/index.html", dialogs=query.all())


@bp.route("/<dialog_id>", methods=['POST', 'GET'])
def dialog(dialog_id):
    _dialog = db.session.query(Dialog).get_or_404(dialog_id)
    answers = {}

    query = db.session.query(DialogPerson.name.label("dialog_person_name"), Word.id.label("word_id"), Word.base, Word.th, Word.spelling) \
        .select_from(Dialog) \
        .join(DialogWord, DialogWord.dialog_id == Dialog.id) \
        .join(DialogPerson, DialogPerson.id == DialogWord.dialog_person_id) \
        .join(Word, Word.id == DialogWord.word_id) \
        .filter(Dialog.id == dialog_id) \
        .order_by(DialogWord.id)

    dialog_words = query.all()

    if request.method == "POST":
        for key, value in request.form.items():
            if key.startswith("word_id"):
                answers[int(key.split('__')[1])] = value
    return render_template("dialogs/dialog.html", method=request.method, answers=answers, dialog=_dialog, dialog_words=dialog_words, initiator=dialog_words[0][0])

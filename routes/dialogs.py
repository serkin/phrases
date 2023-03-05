from flask import render_template
from flask import Blueprint, g


bp = Blueprint('dialogs', __name__, url_prefix='/dialogs')


@bp.route("")
def index():
    cur = g.mysql.connection.cursor()
    cur.execute("SELECT * FROM dialogs;")
    dialogs = cur.fetchall()
    cur.close()
    return render_template("dialogs/index.html", dialogs=dialogs)


@bp.route("/<dialog_id>")
def dialog(dialog_id):
    cur = g.mysql.connection.cursor()
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
    return render_template("dialog.html", dialog=_dialog, dialog_words=dialog_words)

from flask import jsonify
from flask import Blueprint
from sqlalchemy import func
from db import db
from models import Word

bp = Blueprint('api', __name__, url_prefix='/api')


@bp.route("/words")
def words():
    result = []
    query = db.session.query(Word).order_by(func.length(Word.vi))

    for word in query.all():
        result.append(
            {
                "value": str(word.id),
                "name": word.en + f" - {word.vi}" if word.vi else ''
            }
        )
    return jsonify({"results": result, "success": True})

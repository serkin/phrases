from flask import jsonify
from flask import Blueprint, g


bp = Blueprint('api', __name__, url_prefix='/api')


@bp.route("/words")
def words():
    result = []
    cur = g.mysql.connection.cursor()
    cur.execute("SELECT id, base, th FROM  words")

    for word in cur.fetchall():
        result.append(
            {
                "value": str(word["id"]),
                "name": word["base"] + " - " + word["th"]
            }
        )

    cur.close()
    return jsonify({"results": result, "success": True})

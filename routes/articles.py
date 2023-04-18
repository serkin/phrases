from flask import render_template
from flask import Blueprint
import markdown


bp = Blueprint('articles', __name__, url_prefix='/articles')


@bp.route("")
def index():
    articles = []
    with open("articles/contents.txt") as file:
        while line := file.readline():
            arr = line.split(',')
            articles.append((arr[0], arr[1]))

    return render_template("articles/index.html", articles=articles)


@bp.route("/<article_id>")
def article(article_id):

    article = ""

    with open(f"articles/{article_id}") as file:
        article = file.read()
    return render_template("articles/article.html", article=markdown.markdown(article))

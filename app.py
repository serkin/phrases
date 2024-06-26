from flask import Flask, redirect, session, url_for, request
import os
import click
from models import Word
from routes import words, api, articles
from db import db

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv(
    'SQLALCHEMY_DATABASE_URI', "mysql://root:@127.0.0.1:3306/phrases")
app.secret_key = "AW3[-498WM239D84]"


def create_app():

    db.init_app(app)

    @app.route("/")
    def home():
        if request.args.get('tag'):
            session['tag'] = request.args.get('tag')
        if request.args.get('all'):
            del session['tag']
        query = db.session.query(Word).filter(
            Word.hidden_at.is_(None), Word.is_active == 1).order_by(Word.last_attempt_at)

        if session.get('tag'):
            query = query.filter(Word.tags.in_([session.get('tag')]))
        word = query.first()

        return redirect(url_for('words.word', word_id=word.id))
    
    @app.cli.command("recreate-db")
    def recreate_db():
        db.create_all()

    app.register_blueprint(words.bp)
    app.register_blueprint(api.bp)
    app.register_blueprint(articles.bp)

    return app


if __name__ == '__main__':
    app = create_app()
    app.run('0.0.0.0', '8080', debug=True)

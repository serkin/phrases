from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


def recreate_tables():
    db.drop_all()
    db.create_all()


def seed():
    recreate_tables()


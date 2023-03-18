# coding: utf-8
from sqlalchemy import Column, ForeignKey, Index, Integer, String, TIMESTAMP, Text, text
from sqlalchemy.dialects.mysql import ENUM, TEXT, TINYINT, VARCHAR
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()
metadata = Base.metadata


class DialogPerson(Base):
    __tablename__ = 'dialog_persons'

    id = Column(Integer, primary_key=True)
    name = Column(String(255))
    description = Column(Text)


class Dialog(Base):
    __tablename__ = 'dialogs'

    id = Column(Integer, primary_key=True)
    description = Column(Text)


class Vowel(Base):
    __tablename__ = 'vowels'

    id = Column(Integer, primary_key=True)
    spelling = Column(String(255, 'utf8mb4_general_ci'), nullable=False)
    th = Column(String(255, 'utf8mb4_general_ci'), nullable=False)
    type = Column(ENUM('short', 'long', 'long-short'), nullable=False)


class Word(Base):
    __tablename__ = 'words'
    __table_args__ = (
        Index('base', 'base', 'th', unique=True),
    )

    id = Column(Integer, primary_key=True)
    base = Column(VARCHAR(255), nullable=False)
    th = Column(VARCHAR(255), nullable=False)
    spelling = Column(VARCHAR(255))
    hidden_at = Column(TIMESTAMP)
    is_active = Column(TINYINT, nullable=False, server_default=text("'0'"))
    comment = Column(TEXT)
    answered_at = Column(TIMESTAMP)
    category = Column(ENUM('vowels', 'consonants', 'colors', 'numbers'))


class DialogWord(Base):
    __tablename__ = 'dialog_words'

    id = Column(Integer, primary_key=True)
    dialog_id = Column(ForeignKey('dialogs.id', ondelete='CASCADE',
                       onupdate='RESTRICT'), nullable=False, index=True)
    dialog_person_id = Column(ForeignKey(
        'dialog_persons.id', ondelete='CASCADE', onupdate='RESTRICT'), nullable=False, index=True)
    word_id = Column(ForeignKey('words.id', ondelete='CASCADE',
                     onupdate='RESTRICT'), nullable=False, index=True)

    dialog = relationship('Dialog')
    dialog_person = relationship('DialogPerson')
    word = relationship('Word')


class WordsComposition(Base):
    __tablename__ = 'words_composition'
    __table_args__ = (
        Index('word_id_2', 'word_id', 'child_word_id', unique=True),
    )

    id = Column(Integer, primary_key=True)
    word_id = Column(ForeignKey('words.id', ondelete='CASCADE',
                     onupdate='RESTRICT'), nullable=False, index=True)
    child_word_id = Column(ForeignKey(
        'words.id', ondelete='CASCADE', onupdate='RESTRICT'), nullable=False, index=True)

    child_word = relationship(
        'Word', primaryjoin='WordsComposition.child_word_id == Word.id')
    word = relationship(
        'Word', primaryjoin='WordsComposition.word_id == Word.id')

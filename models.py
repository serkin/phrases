# coding: utf-8
from sqlalchemy import Column, ForeignKey, Index, Integer, TIMESTAMP, text
from sqlalchemy.dialects.mysql import SET, TINYINT, VARCHAR, ENUM
from sqlalchemy.orm import relationship
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.sql import func

Base = declarative_base()
metadata = Base.metadata

class Word(Base):
    __tablename__ = 'words'
    __table_args__ = (
        Index('base', 'en', 'vi', unique=True),
    )

    id = Column(Integer, primary_key=True)
    en = Column(VARCHAR(255), nullable=False)
    vi = Column(VARCHAR(255), nullable=False)
    spelling = Column(VARCHAR(255))
    hidden_at = Column(TIMESTAMP)
    is_active = Column(TINYINT, nullable=False, server_default=text("'0'"))
    priority = Column(TINYINT, nullable=False, server_default=text("'1'"))
    tags = Column(SET('vowels', 'consonants', 'colors', 'numbers'))
    last_attempt_at = Column(TIMESTAMP)


class Attempt(Base):
    __tablename__ = 'attempts'

    id = Column(Integer, primary_key=True)
    word_id = Column(ForeignKey('words.id', ondelete='CASCADE',
                     onupdate='CASCADE'), nullable=False, index=True)
    is_correct = Column(ENUM('no', 'yes'), nullable=False)
    answered_at = Column(TIMESTAMP, default=func.current_timestamp())
    word = relationship('Word')


# Phrases

## Todo
- **Тесты**
- Бекапы базы данных
- Отрезать в конце краб при вставке
- **Проверка диалога**
- Диалоги отображать по бокам
- Показывать слова попорядку
- Проверять наличие слова при написании в base
- Заменить чан на кун при вставке
- Количество слов в списке
- При добавлении слова из диалога или словаря через импорт, если слово уже есть в базе проверять заполнены ли по spelling,comment
- Слишком длинные слова без разбивки. Или если есть разбивка где то в предложении то остальная разбивка где
- Искать неправильнуюю транслитерацию
- Показывать скрыто или нет - 159.69.208.209:8080/words/98.
- Предлагать проставлять транслитерацию
- Правила отдельно с привязкой к словам https://nhn.github.io/tui.editor/latest/tutorial-example01-editor-basic
- Слова не в диалоге и не привязанные но активные
- **Комментарий открытый**
- **Отображать транслитерацию в аккордеоне**
- Показывать входящие слова с транслитерацией
- Если слово есть но нет транслитерации то не выбрасывать исключение а заменять транслитерацию
- Скрипт предложения вариантов вхождения
- Отвязка слова - http://159.69.208.209:8080/words/74
- Огласовки отображать в тексте
- Вопросы к словам
- На странице /words фильтровать слова по категориям
- На странице / запрашивать слова по категориям
- Огласовки отдельно
- **Теги сделать SET**
- Показывать входящие слова - http://159.69.208.209:8080/words/199/edit
- Отображать гласные согласные загадкой С реверсом
- Кнопка базовая фраза - http://159.69.208.209:8080/words/135
- Типы слов
    phrase
    class
    category 
    Word
    Color
    Number
    Vowel
    Consonant


This app helps me to learn Thai
- [figma](https://www.figma.com/file/okoaQC85mWsw2W7aBZY9Hv/Phrases?node-id=0%3A1&t=sHIDdoooyc8nmOxC-0)
- [flask-mysqldb](https://github.com/alexferl/flask-mysqldb)
- [3000 most common words in English](https://www.ef.com/wwen/english-resources/english-vocabulary/top-3000-words/)
- [google-10000-english.txt](https://github.com/first20hours/google-10000-english/blob/master/google-10000-english.txt)
- [Most Common Thai Words](https://github.com/frekwencja/most-common-words-multilingual/blob/main/data/wordfrequency.info/th.txt)
- [most-common-english-words](https://github.com/edthrn/most-common-english-words/blob/master/nouns.txt)
- [high-frequency-vocabulary](https://github.com/arstgit/high-frequency-vocabulary)
- [Thai 1000 Common Words (incl. Audio, Phonetics, Examples)](https://ankiweb.net/shared/info/588542997)
- [Thai Tones](https://ankiweb.net/shared/info/951524269)
- [Pocket Thai Vocabulary](https://ankiweb.net/shared/info/293019843)
- [1000 Most Common Thai Words [TH,EN,DE,MP3,HiddenPhonetic]](https://ankiweb.net/shared/info/2201805440)
- [1000 Most Common Thai Words [EN/TH/EN, Sound, Examples] v2](https://ankiweb.net/shared/info/416262160)
- []()


## MySQL
```bash
docker run --name mysql -d --restart always -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=seo -p 306:3306 mysql:8
docker run --name myadmin -d --link mysql:db --restart always -p 8090:80 phpmyadmin/phpmyadmin
```


## Run locally

```python
python3 -m venv venv

sudo apt-get install python3-dev default-libmysqlclient-dev build-essential
pip install -r requirements.txt
```


## Run on server

```bash
docker build -f Dockerfile -t phrases . && \
docker rm -f phrases || true && \
docker run -d --name phrases --link mysql:mysql  -e 'SQLALCHEMY_DATABASE_URI=mysql://root:@mysql/phrases' -p 8080:8081 --restart always phrases
```

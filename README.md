# Phrases

## Todo
- **Тесты**
- **Комментарий открытый**
- **Проверять наличие слова при написании в base**
- Бекапы базы данных
- Отрезать в конце краб при вставке(чан, ка)
- Диалоги отображать по бокам
- После ответа сессия слетает
- После замены кун чан в транслитерации осталось старое
- Заменить чан на кун при вставке
- Fix http://159.69.208.209:8081/words/305/edit
- Количество слов в списке
- При добавлении слова из диалога или словаря через импорт, если слово уже есть в базе проверять заполнены ли по spelling,comment
- Слишком длинные слова без разбивки. Или если есть разбивка где то в предложении то остальная разбивка где
- Искать неправильнуюю транслитерацию
- Показывать скрыто или нет - 159.69.208.209:8080/words/98.
- Приоритет к словам
- Правила отдельно с привязкой к словам https://nhn.github.io/tui.editor/latest/tutorial-example01-editor-basic
- Слова не в диалоге и не привязанные но активные
- Показывать входящие слова с транслитерацией
- Если слово есть но нет транслитерации то не выбрасывать исключение а заменять транслитерацию
- Скрипт предложения вариантов вхождения
- Огласовки отображать в тексте
- Вопросы к словам
- На странице /words фильтровать слова по категориям
- На странице / запрашивать слова по категориям
- Огласовки отдельно
- Показывать входящие слова - http://159.69.208.209:8080/words/199/edit
- Отображать гласные согласные загадкой С реверсом
- Кнопка базовая фраза - http://159.69.208.209:8080/words/135
- Типы слов
    phrase
    class 
    Word
    Color
    Number
    Vowel
    Consonant
## ChatGPT
I want to learn vietnamese. I write a beginner-friendly 300 words story

This app helps me to learn Thai
- [figma](https://www.figma.com/file/okoaQC85mWsw2W7aBZY9Hv/Phrases?node-id=0%3A1&t=sHIDdoooyc8nmOxC-0)
- [flask-mysqldb](https://github.com/alexferl/flask-mysqldb)
- [3000 most common words in English](https://www.ef.com/wwen/english-resources/english-vocabulary/top-3000-words/)
- [google-10000-english.txt](https://github.com/first20hours/google-10000-english/blob/master/google-10000-english.txt)
- [most-common-english-words](https://github.com/edthrn/most-common-english-words/blob/master/nouns.txt)
- [high-frequency-vocabulary](https://github.com/arstgit/high-frequency-vocabulary)

- []()


## MySQL
```bash
docker run --name mysql -d --restart always -e MYSQL_ALLOW_EMPTY_PASSWORD=yes -e MYSQL_DATABASE=phrases -p 3306:3306 mysql:8
docker run --name myadmin -d --link mysql:db --restart always -p 8090:80 phpmyadmin/phpmyadmin
```


## Run locally

Look [Dockefile](Dockefile)


## Run on server

Look [update.sh](update.sh)


## Cron
* */3 * * * /root/phrases/update.sh

import mysql.connector

cnx = mysql.connector.connect(user='root',
                              host='127.0.0.1',
                              database='phrases')

cursor = cnx.cursor()


def _get_word_id(word: str) -> id or None:

    cursor.execute(
        "SELECT id FROM words WHERE base = %s LIMIT 1;", (word,))
    rv = cursor.fetchall()
    if rv:
        return rv[0][0]
    return None


def _get_users(lines: list) -> dict:
    users = set()
    result = {}
    for line in lines:
        user = line.split(":")[0]
        users.add(user)

    for user_name in users:

        cursor.execute(
            "SELECT id FROM dialog_persons WHERE name = %s LIMIT 1;", (user_name,))
        rv = cursor.fetchall()
        if rv:
            result[user_name] = rv[0][0]
        else:
            cursor.execute(
                "INSERT INTO dialog_persons (name) VALUES(%s)", (user_name,))
            cnx.commit()
            result[user_name] = cursor.lastrowid
    return result


text = """
Tom:Hello
Pan:Hello
Tom:My name is Tom
Pan:Nice to meet you
Tom:How are you?
Pan:I'm fine
Pan:Where are you from?
Tom:I'm from Kenya
Pan:How old are you?
Tom:I'm 38 years old
Pan:What are you doing?
Tom:I'm working now
Tom:What is your Line ID?"""


lines = text.splitlines()

# Check all words present in db
check_result = ""
for line in lines[1:]:
    word = line.split(':')[1]
    word_id = _get_word_id(word)
    if not word_id:
        check_result += f"{word} - missing\r\n"

if len(check_result) > 1:
    print(check_result)
    exit(0)

users = _get_users(lines)
cursor.execute("INSERT INTO dialogs (description) VALUES('New dialog')")
cnx.commit()
dialog_id = cursor.lastrowid

for line in lines[1:]:
    user_name = line.split(':')[0]
    word = line.split(':')[1]
    word_id = _get_word_id(word)
    cursor.execute(
        "INSERT INTO dialog_words (dialog_id, dialog_person_id, word_id) VALUES(%s, %s, %s)", (dialog_id, users[user_name], word_id))
    cnx.commit()


cursor.close()
cnx.close()

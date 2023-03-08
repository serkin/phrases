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
Tom:I'm Tom
Pan:Nice to meet you
Pan:I'm Pan
Tom:How are you doing?
Pan:I'm fine
Pan:Where are you from?
Tom:I'm from Kenya
Tom:How old are you?
Pan:I'm 28 years old.
Pan:Where do you live?
Tom:I live in a hotel
Tom:What are you doing?
Pan:I'm watching TV
Pan:Do you want to meet?
Tom:Yes"""


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

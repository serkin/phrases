import mysql.connector

cnx = mysql.connector.connect(user='root',
                              host='127.0.0.1',
                              database='phrases')

cursor = cnx.cursor()


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


def _save_word(base: str, th: str, spelling: str = None, comment: str = None) -> int:
    cursor.execute(
        "SELECT id FROM words WHERE base = %s and th = %s LIMIT 1;", (base, th))
    rv = cursor.fetchall()
    if rv:
        return rv[0][0]

    cursor.execute(
        "INSERT INTO words (base, th, spelling, comment) VALUES(%s, %s, %s, %s)", (base, th, spelling, comment))
    cnx.commit()
    return cursor.lastrowid

# def save_dialog_word(base: str, th: str, spelling: str = None, comment: str = None) -> int:


with open("dialog.txt") as file:

    lines = file.readlines()
    users = _get_users(lines)
    cursor.execute("INSERT INTO dialogs (description) VALUES('New dialog')")
    cnx.commit()
    dialog_id = cursor.lastrowid

    for line in lines:
        user_name = line.split(':')[0]
        base, th, spelling = line.split(':')[1].split('/')
        word_id = _save_word(base, th, spelling)
        cursor.execute(
            "INSERT INTO dialog_words (dialog_id, dialog_person_id, word_id) VALUES(%s, %s, %s)", (dialog_id, users[user_name], word_id))
        cnx.commit()


cursor.close()
cnx.close()

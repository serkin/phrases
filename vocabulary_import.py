import mysql.connector

cnx = mysql.connector.connect(user='root',
                              host='127.0.0.1',
                              database='phrases')

mycursor = cnx.cursor()

text = """"""

for line in text.readlines():
    th, spelling, en, comment = line.split("/")
    mycursor.execute(
        "INSERT IGNORE INTO words (th, spelling, en, comment) VALUES (%s, %s, %s, %s);", (th, spelling, en, comment))
    cnx.commit()

mycursor.close()
cnx.close()

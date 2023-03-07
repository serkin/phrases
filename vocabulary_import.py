import mysql.connector

cnx = mysql.connector.connect(user='root',
                              host='127.0.0.1',
                              database='phrases')

mycursor = cnx.cursor()

with open("vocabulary.txt") as file:

    for line in file.readlines():
        th, spelling, base, comment = line.split("/")
        mycursor.execute("INSERT IGNORE INTO words (th, spelling, base, comment) VALUES (%s, %s, %s, %s);", (th, spelling, base, comment))
        cnx.commit()

mycursor.close()
cnx.close()

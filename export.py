import mysql.connector

cnx = mysql.connector.connect(user='root',
                              host='127.0.0.1',
                              database='phrases')

mycursor = cnx.cursor()

with open("export.txt") as file:

    for line in file.readlines():
        data = line.split("	")
        mycursor.execute("INSERT IGNORE INTO words (base, th, comment) VALUES (%s, %s, %s);", (data[0], data[1], data[2]))
        cnx.commit()

mycursor.close()
cnx.close()

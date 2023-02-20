import mysql.connector

cnx = mysql.connector.connect(user='root',
                              host='127.0.0.1',
                              database='phrases')

mycursor = cnx.cursor()

with open("export.txt") as file:

    for line in file.readlines():
        data = line.split("	")
        mycursor.execute("INSERT IGNORE INTO words (base, th, spelling) VALUES (%s, %s, %s);", (data[0], data[1], data[2] if len(data[2]) > 1 else None))
        cnx.commit()

mycursor.close()
cnx.close()

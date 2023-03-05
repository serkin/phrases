from flask import g


def _stat():
    stat = {
        "fail": 0,
        "success": 0
    }
    cur = g.mysql.connection.cursor()

    cur.execute(
        "SELECT count(*) as total, status FROM `log` WHERE DATE(timestamp) = CURDATE() GROUP by status;")
    for row in cur.fetchall():
        stat[row["status"]] = row["total"]
    cur.close()
    return stat

import sys
import base64
import MySQLdb
import urllib.request
import getpass

db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd=getpass.getpass("Insira senha\n"),  # your password
                     db="GameMultiple")        # name of the data base

cur = db.cursor()

cur.execute("SELECT ID, HeaderImage FROM Game")

result = cur.fetchall()

rowcount = cur.rowcount

i = 1

for row in result :
    print(i, "/", rowcount)
    i+=1
    try :
        db.ping(True)
        filename = urllib.request.urlretrieve(row[1])[0]
        blob_value = open(filename, 'rb').read()
        # encoded_string = base64.b64encode(blob_value)
        sql = "INSERT INTO Image VALUES (%s,%s)"
        args = (row[0], blob_value)
        cur = db.cursor()
        cur.execute(sql, args)
        db.commit()
    except (MySQLdb.Error, MySQLdb.Warning) as e:
        print(e)
    except:
        print("URL inválida: ", row[1])

db.close()

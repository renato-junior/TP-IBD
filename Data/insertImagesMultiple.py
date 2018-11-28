#!/usr/bin/python3
import MySQLdb, getpass, os

db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                     user="root",         # your username
                     passwd=getpass.getpass("Insira senha\n"),  # your password
                     db="GameMultiple")        # name of the data base

cur = db.cursor()

folder = "img"
files = os.listdir(folder)

cur.execute("SELECT ID from Image")

for row in cur.fetchall():
	if (row[0]+'.jpg' in files):
		files.remove(row[0]+'.jpg')


# Use all the SQL you like
for file in files:
	with open(folder+'/'+file, "rb") as f:
		image = f.read()
		try:
			ID = file.split('.')[0]
			args = (ID, image)
			cur.execute("INSERT INTO Image (ID, HeaderImage) VALUES (%s, %s)", args)
			db.commit()
		except Exception as e:
			print (e)


db.close()
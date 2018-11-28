#!/usr/bin/python3
import urllib.request
import csv, sys, random, collections


with open('database.csv') as csvfile:
	file = csv.DictReader(csvfile)

	for line in file:
		if (int(line["ID"]) > 451230):
			try:
				urllib.request.urlretrieve(line["HeaderImage"], "./img/"+line["ID"] + ".jpg")
			except:
				pass
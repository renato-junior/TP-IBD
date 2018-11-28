#!/usr/bin/python3
import csv, sys, random, collections

numUsers = 10000
maxGames = 50
ownedGames = []

outputFile = open('owners.csv', 'w')
fieldnames = ['OwnerID','GameID']
writer = csv.DictWriter(outputFile, fieldnames= fieldnames)

writer.writeheader()

with open('database.csv') as csvfile:
	file = csv.DictReader(csvfile)

	for line in file:
		numOwners = int(line["SteamSpyOwners"])

		if (int(line["SteamSpyOwners"]) > maxGames):
			numOwners = maxGames

		ownersList = random.sample(range(numUsers), numOwners)
		gameId = int(line["ID"])

		for i in ownersList:
			ownedGame = collections.OrderedDict([('OwnerID', i), ('GameID', gameId)])
			writer.writerow(ownedGame)

outputFile.close()
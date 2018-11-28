#!/usr/bin/python3
import csv, sys, random, collections


outputFile = open('database.csv', 'w')
fieldnames = ["ID","Name","ReleaseDate","RequiredAge","DemoCount","DeveloperCount","DLCCount","Metacritic","MovieCount","PackageCount","RecommendationCount","PublisherCount","ScreenshotCount","SteamSpyOwners","SteamSpyOwnersVariance","SteamSpyPlayersEstimate","SteamSpyPlayersVariance","AchievementCount","AchievementHighlightedCount","ControllerSupport","IsFree","FreeVerAvail","PurchaseAvail","SubscriptionAvail","PlatformWindows","PlatformLinux","PlatformMac","PCReqsHaveMin","PCReqsHaveRec","LinuxReqsHaveMin","LinuxReqsHaveRec","MacReqsHaveMin","MacReqsHaveRec","CategorySinglePlayer","CategoryMultiplayer","CategoryCoop","CategoryMMO","CategoryInAppPurchase","CategoryIncludeSrcSDK","CategoryIncludeLevelEditor","CategoryVRSupport","GenreIsNonGame","GenreIsIndie","GenreIsAction","GenreIsAdventure","GenreIsCasual","GenreIsStrategy","GenreIsRPG","GenreIsSimulation","GenreIsEarlyAccess","GenreIsFreeToPlay","GenreIsSports","GenreIsRacing","GenreIsMassivelyMultiplayer","PriceCurrency","PriceInitial","PriceFinal","SupportEmail","SupportURL","AboutText","Background","ShortDescrip","DetailedDescrip","DRMNotice","ExtUserAcctNotice","HeaderImage","LegalNotice","Reviews","SupportedLanguages","Website","PCMinReqsText","PCRecReqsText","LinuxMinReqsText","LinuxRecReqsText","MacMinReqsText","MacRecReqsText"]

ids = []

writer = csv.DictWriter(outputFile, fieldnames= fieldnames)

writer.writeheader()

with open('steamData.csv') as csvfile:
	file = csv.DictReader(csvfile)

	for line in file:

		if(line["QueryID"] in ids):
			continue
		else:
			ids.append(line["QueryID"])
			line.pop("QueryID")
			line.pop("QueryName")
			ID = line.pop("ResponseID")
			name = line.pop("ResponseName")
			line["ID"] = ID
			line["Name"] = name
			writer.writerow(line)

outputFile.close()
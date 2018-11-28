#!/usr/bin/python3
import csv

outputFile = open('database.csv', 'w')
fieldnames = ["ID","Name","ReleaseDate","RequiredAge","DemoCount","DeveloperCount","DLCCount","Metacritic","MovieCount","PackageCount","RecommendationCount","PublisherCount","ScreenshotCount","SteamSpyOwners","SteamSpyOwnersVariance","SteamSpyPlayersEstimate","SteamSpyPlayersVariance","AchievementCount","AchievementHighlightedCount","ControllerSupport","IsFree","FreeVerAvail","PurchaseAvail","SubscriptionAvail","PlatformWindows","PlatformLinux","PlatformMac","PCReqsHaveMin","PCReqsHaveRec","LinuxReqsHaveMin","LinuxReqsHaveRec","MacReqsHaveMin","MacReqsHaveRec","CategorySinglePlayer","CategoryMultiplayer","CategoryCoop","CategoryMMO","CategoryInAppPurchase","CategoryIncludeSrcSDK","CategoryIncludeLevelEditor","CategoryVRSupport","GenreIsNonGame","GenreIsIndie","GenreIsAction","GenreIsAdventure","GenreIsCasual","GenreIsStrategy","GenreIsRPG","GenreIsSimulation","GenreIsEarlyAccess","GenreIsFreeToPlay","GenreIsSports","GenreIsRacing","GenreIsMassivelyMultiplayer","PriceCurrency","PriceInitial","PriceFinal","SupportEmail","SupportURL","AboutText","Background","ShortDescrip","DetailedDescrip","DRMNotice","ExtUserAcctNotice","HeaderImage","LegalNotice","Reviews","SupportedLanguages","Website","PCMinReqsText","PCRecReqsText","LinuxMinReqsText","LinuxRecReqsText","MacMinReqsText","MacRecReqsText"]

ids = set()

writer = csv.DictWriter(outputFile, fieldnames= fieldnames)

writer.writeheader()

with open('steamData.csv') as csvfile:
	file = csv.DictReader(csvfile)

	for line in file:

		if(int(line["QueryID"]) not in ids):
			ids.add(int(line["QueryID"]))
			ID = line.pop("QueryID")
			name = line.pop("QueryName")
			line.pop("ResponseID")
			line.pop("ResponseName")
			line["ID"] = ID
			line["Name"] = name
			writer.writerow(line)

		else:
			print (line["QueryID"])

outputFile.close()



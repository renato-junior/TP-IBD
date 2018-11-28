#!/usr/bin/python3
import csv, sys, random, collections

game = open('game.csv', 'w')
pc = open('pc.csv', 'w')
mac = open('mac.csv', 'w')
linux = open('linux.csv', 'w')
genre = open('genre.csv', 'w')
category = open('category.csv', 'w')

fieldnamesGame = ["ID","Name","ReleaseDate","RequiredAge","DemoCount","DeveloperCount","DLCCount","Metacritic","MovieCount","PackageCount","RecommendationCount","PublisherCount","ScreenshotCount","SteamSpyOwners","SteamSpyOwnersVariance","SteamSpyPlayersEstimate","SteamSpyPlayersVariance","AchievementCount","AchievementHighlightedCount","ControllerSupport","IsFree","FreeVerAvail","PurchaseAvail","SubscriptionAvail","PCReqsHaveMin","PCReqsHaveRec","LinuxReqsHaveMin","LinuxReqsHaveRec","MacReqsHaveMin","MacReqsHaveRec","PriceCurrency","PriceInitial","PriceFinal","SupportEmail","SupportURL","AboutText","Background","ShortDescrip","DetailedDescrip","DRMNotice","ExtUserAcctNotice","HeaderImage","LegalNotice","Reviews","SupportedLanguages","Website"]
fieldnamesPc = ["ID","MinReqsText","RecReqsText"]
fieldnamesMac = ["ID", "MinReqsText","RecReqsText"]
fieldnamesLinux = ["ID","MinReqsText","RecReqsText"]
fieldnamesGenre = ["ID","GenreIsNonGame","GenreIsIndie","GenreIsAction","GenreIsAdventure","GenreIsCasual","GenreIsStrategy","GenreIsRPG","GenreIsSimulation","GenreIsEarlyAccess","GenreIsFreeToPlay","GenreIsSports","GenreIsRacing","GenreIsMassivelyMultiplayer"]
fieldnamesCategory = ["ID","CategorySinglePlayer","CategoryMultiplayer","CategoryCoop","CategoryMMO","CategoryInAppPurchase","CategoryIncludeSrcSDK","CategoryIncludeLevelEditor","CategoryVRSupport"]

writerGames = csv.DictWriter(game, fieldnames= fieldnamesGame)
writerPC = csv.DictWriter(pc, fieldnames= fieldnamesPc)
writerMac = csv.DictWriter(mac, fieldnames= fieldnamesMac)
writerLinux = csv.DictWriter(linux, fieldnames= fieldnamesLinux)
writerGenre = csv.DictWriter(genre, fieldnames= fieldnamesGenre)
writerCategory = csv.DictWriter(category, fieldnames= fieldnamesCategory)

writerGames.writeheader()
writerPC.writeheader()
writerMac.writeheader()
writerLinux.writeheader()
writerGenre.writeheader()
writerCategory.writeheader()

with open('database.csv') as csvfile:
	file = csv.DictReader(csvfile)

	for line in file:

		if(line["PlatformWindows"] == 'True'):
			pw = collections.OrderedDict([('ID', line["ID"])])
			if(line["PCReqsHaveMin"] == 'True'):
				pw["MinReqsText"] = line["PCMinReqsText"]
			else:
				pw["MinReqsText"] = ''

			if(line["PCReqsHaveRec"] == 'True'):
				pw["RecReqsText"] = line["PCRecReqsText"]
			else:
				pw["RecReqsText"] = ''
			writerPC.writerow(pw)

		if(line["PlatformMac"] == 'True'):
			pm = collections.OrderedDict([('ID', line["ID"])])
			if(line["MacReqsHaveMin"] == 'True'):
				pm["MinReqsText"] = line["MacMinReqsText"]
			else:
				pm["MinReqsText"] = ''

			if(line["MacReqsHaveRec"] == 'True'):
				pm["RecReqsText"] = line["MacRecReqsText"]
			else:
				pm["RecReqsText"] = ''
			writerMac.writerow(pm)

		if(line["PlatformLinux"] == 'True'):
			pl = collections.OrderedDict([('ID', line["ID"])])
			if(line["LinuxReqsHaveMin"] == 'True'):
				pl["MinReqsText"] = line["LinuxMinReqsText"]
			else:
				pl["MinReqsText"] = ''

			if(line["LinuxReqsHaveRec"] == 'True'):
				pl["RecReqsText"] = line["LinuxRecReqsText"]
			else:
				pl["RecReqsText"] = ''
			writerLinux.writerow(pl)

		g = collections.OrderedDict([("ID", line["ID"]), ("GenreIsNonGame", line["GenreIsNonGame"]),("GenreIsIndie", line["GenreIsIndie"]),("GenreIsAction", line["GenreIsAction"]),("GenreIsAdventure", line["GenreIsAdventure"]),("GenreIsCasual", line["GenreIsCasual"]),("GenreIsStrategy", line["GenreIsStrategy"]),("GenreIsRPG", line["GenreIsRPG"]),("GenreIsSimulation", line["GenreIsSimulation"]),("GenreIsEarlyAccess", line["GenreIsEarlyAccess"]),("GenreIsFreeToPlay", line["GenreIsFreeToPlay"]),("GenreIsSports", line["GenreIsSports"]),("GenreIsRacing", line["GenreIsRacing"]),("GenreIsMassivelyMultiplayer", line["GenreIsMassivelyMultiplayer"])])

		c = collections.OrderedDict([("ID", line["ID"]),("CategorySinglePlayer", line["CategorySinglePlayer"]),("CategoryMultiplayer", line["CategoryMultiplayer"]),("CategoryCoop", line["CategoryCoop"]),("CategoryMMO", line["CategoryMMO"]),("CategoryInAppPurchase", line["CategoryInAppPurchase"]),("CategoryIncludeSrcSDK", line["CategoryIncludeSrcSDK"]),("CategoryIncludeLevelEditor", line["CategoryIncludeLevelEditor"]),("CategoryVRSupport", line["CategoryVRSupport"])])

		line.pop('CategoryIncludeLevelEditor')
		line.pop('CategoryMultiplayer')
		line.pop('GenreIsFreeToPlay')
		line.pop('PCMinReqsText')
		line.pop('LinuxMinReqsText')
		line.pop('PlatformWindows')
		line.pop('LinuxRecReqsText')
		line.pop('GenreIsSimulation')
		line.pop('GenreIsIndie')
		line.pop('GenreIsAction')
		line.pop('PlatformLinux')
		line.pop('CategoryIncludeSrcSDK')
		line.pop('CategoryCoop')
		line.pop('GenreIsEarlyAccess')
		line.pop('MacMinReqsText')
		line.pop('GenreIsNonGame')
		line.pop('GenreIsRacing')
		line.pop('GenreIsStrategy')
		line.pop('GenreIsAdventure')
		line.pop('GenreIsCasual')
		line.pop('PCRecReqsText')
		line.pop('GenreIsSports')
		line.pop('GenreIsMassivelyMultiplayer')
		line.pop('GenreIsRPG')
		line.pop('CategorySinglePlayer')
		line.pop('PlatformMac')
		line.pop('MacRecReqsText')
		line.pop('CategoryMMO')
		line.pop('CategoryInAppPurchase')
		line.pop('CategoryVRSupport')
		writerGenre.writerow(g)
		writerCategory.writerow(c)
		writerGames.writerow(line)

game.close()
pc.close()
mac.close()
linux.close()
genre.close()
category.close()
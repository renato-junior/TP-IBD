
CREATE TABLE `Game` (
  `ID` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `ReleaseDate` varchar(255) DEFAULT NULL,
  `RequiredAge` varchar(255) DEFAULT NULL,
  `DemoCount` varchar(255) DEFAULT NULL,
  `DeveloperCount` varchar(255) DEFAULT NULL,
  `DLCCount` varchar(255) DEFAULT NULL,
  `Metacritic` varchar(255) DEFAULT NULL,
  `MovieCount` varchar(255) DEFAULT NULL,
  `PackageCount` varchar(255) DEFAULT NULL,
  `RecommendationCount` varchar(255) DEFAULT NULL,
  `PublisherCount` varchar(255) DEFAULT NULL,
  `ScreenshotCount` varchar(255) DEFAULT NULL,
  `SteamSpyOwners` varchar(255) DEFAULT NULL,
  `SteamSpyOwnersVariance` varchar(255) DEFAULT NULL,
  `SteamSpyPlayersEstimate` varchar(255) DEFAULT NULL,
  `SteamSpyPlayersVariance` varchar(255) DEFAULT NULL,
  `AchievementCount` varchar(255) DEFAULT NULL,
  `AchievementHighlightedCount` varchar(255) DEFAULT NULL,
  `ControllerSupport` varchar(255) DEFAULT NULL,
  `IsFree` varchar(255) DEFAULT NULL,
  `FreeVerAvail` varchar(255) DEFAULT NULL,
  `PurchaseAvail` varchar(255) DEFAULT NULL,
  `SubscriptionAvail` varchar(255) DEFAULT NULL,
  `PriceCurrency` varchar(255) DEFAULT NULL,
  `PriceInitial` varchar(255) DEFAULT NULL,
  `PriceFinal` varchar(255) DEFAULT NULL,
  `SupportEmail` varchar(255) DEFAULT NULL,
  `SupportURL` varchar(255) DEFAULT NULL,
  `AboutText` varchar(255) DEFAULT NULL,
  `Background` varchar(255) DEFAULT NULL,
  `ShortDescrip` varchar(255) DEFAULT NULL,
  `DetailedDescrip` varchar(255) DEFAULT NULL,
  `DRMNotice` varchar(255) DEFAULT NULL,
  `ExtUserAcctNotice` varchar(255) DEFAULT NULL,
  `HeaderImage` varchar(255) DEFAULT NULL,
  `LegalNotice` varchar(255) DEFAULT NULL,
  `Reviews` varchar(255) DEFAULT NULL,
  `SupportedLanguages` varchar(255) DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL
  PRIMARY KEY (ID)
);

CREATE TABLE RequirementsPC (
  `ID` varchar(255) DEFAULT NULL,
  `MinReqsText` varchar(255) DEFAULT NULL,
  `RecReqsText` varchar(255) DEFAULT NULL
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
);

CREATE TABLE RequirementsMac (
  `ID` varchar(255) DEFAULT NULL,
  `MinReqsText` varchar(255) DEFAULT NULL,
  `RecReqsText` varchar(255) DEFAULT NULL
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
);

CREATE TABLE RequirementsLinux (
  `ID` varchar(255) DEFAULT NULL,
  `MinReqsText` varchar(255) DEFAULT NULL,
  `RecReqsText` varchar(255) DEFAULT NULL
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
);

CREATE TABLE Category(
  `ID` varchar(255) DEFAULT NULL,
  `CategorySinglePlayer` varchar(255) DEFAULT NULL,
  `CategoryMultiplayer` varchar(255) DEFAULT NULL,
  `CategoryCoop` varchar(255) DEFAULT NULL,
  `CategoryMMO` varchar(255) DEFAULT NULL,
  `CategoryInAppPurchase` varchar(255) DEFAULT NULL,
  `CategoryIncludeSrcSDK` varchar(255) DEFAULT NULL,
  `CategoryIncludeLevelEditor` varchar(255) DEFAULT NULL,
  `CategoryVRSupport` varchar(255) DEFAULT NULL
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
);

CREATE TABLE Genre(
  `ID` varchar(255) DEFAULT NULL,
  `GenreIsNonGame` varchar(255) DEFAULT NULL,
  `GenreIsIndie` varchar(255) DEFAULT NULL,
  `GenreIsAction` varchar(255) DEFAULT NULL,
  `GenreIsAdventure` varchar(255) DEFAULT NULL,
  `GenreIsCasual` varchar(255) DEFAULT NULL,
  `GenreIsStrategy` varchar(255) DEFAULT NULL,
  `GenreIsRPG` varchar(255) DEFAULT NULL,
  `GenreIsSimulation` varchar(255) DEFAULT NULL,
  `GenreIsEarlyAccess` varchar(255) DEFAULT NULL,
  `GenreIsFreeToPlay` varchar(255) DEFAULT NULL,
  `GenreIsSports` varchar(255) DEFAULT NULL,
  `GenreIsRacing` varchar(255) DEFAULT NULL,
  `GenreIsMassivelyMultiplayer` varchar(255) DEFAULT NULL
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
);

CREATE TABLE User (
  `ID` varchar(255) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
);

CREATE TABLE Owner (
  `UserID` varchar(255) DEFAULT NULL,
  `GameID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (UserID,GameID)
  FOREIGN KEY (UserID) REFERENCES User(ID)
  FOREIGN KEY (GameID) REFERENCES Game(ID)
);

LOAD DATA INFILE 'names.csv'
INTO TABLE User
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID, Name);

LOAD DATA INFILE 'owners.csv'
INTO TABLE Owner
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (UserID, GameID);

LOAD DATA INFILE 'category.csv'
INTO TABLE Category
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,CategorySinglePlayer,CategoryMultiplayer,CategoryCoop,CategoryMMO,CategoryInAppPurchase,CategoryIncludeSrcSDK,CategoryIncludeLevelEditor,CategoryVRSupport);

LOAD DATA INFILE 'game.csv'
INTO TABLE Game
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,Name,ReleaseDate,RequiredAge,DemoCount,DeveloperCount,DLCCount,Metacritic,MovieCount,PackageCount,RecommendationCount,PublisherCount,ScreenshotCount,SteamSpyOwners,SteamSpyOwnersVariance,SteamSpyPlayersEstimate,SteamSpyPlayersVariance,AchievementCount,AchievementHighlightedCount,ControllerSupport,IsFree,FreeVerAvail,PurchaseAvail,SubscriptionAvail,PriceCurrency,PriceInitial,PriceFinal,SupportEmail,SupportURL,AboutText,Background,ShortDescrip,DetailedDescrip,DRMNotice,ExtUserAcctNotice,HeaderImage,LegalNotice,Reviews,SupportedLanguages,Website);

LOAD DATA INFILE 'genre.csv'
INTO TABLE Owner
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,GenreIsNonGame,GenreIsIndie,GenreIsAction,GenreIsAdventure,GenreIsCasual,GenreIsStrategy,GenreIsRPG,GenreIsSimulation,GenreIsEarlyAccess,GenreIsFreeToPlay,GenreIsSports,GenreIsRacing,GenreIsMassivelyMultiplayer);

LOAD DATA INFILE 'linux.csv'
INTO TABLE RequirementsLinux
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,MinReqsText,RecReqsText);

LOAD DATA INFILE 'mac.csv'
INTO TABLE RequirementsMac
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,MinReqsText,RecReqsText);

LOAD DATA INFILE 'pc.csv'
INTO TABLE RequirementsPC
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,MinReqsText,RecReqsText);
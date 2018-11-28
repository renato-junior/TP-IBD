-- DROP DATABASE IF EXISTS `GameMultiple`;
CREATE DATABASE IF NOT EXISTS `GameMultiple` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `GameMultiple`;

CREATE TABLE `Game` (
  `ID` varchar(255) NOT NULL,
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
  `HeaderImage` TEXT DEFAULT NULL,
  `LegalNotice` TEXT DEFAULT NULL,
  `Reviews` TEXT DEFAULT NULL,
  `SupportedLanguages` varchar(255) DEFAULT NULL,
  `Website` TEXT DEFAULT NULL,
  PRIMARY KEY (ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE RequirementsPC (
  `ID` varchar(255) NOT NULL,
  `PCMinReqsText` varchar(255) DEFAULT NULL,
  `PCRecReqsText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE RequirementsMac (
  `ID` varchar(255) NOT NULL,
  `MacMinReqsText` varchar(255) DEFAULT NULL,
  `MacRecReqsText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE RequirementsLinux (
  `ID` varchar(255) NOT NULL,
  `LinuxMinReqsText` varchar(255) DEFAULT NULL,
  `LinuxRecReqsText` varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Category(
  `ID` varchar(255) NOT NULL,
  `CategorySinglePlayer` varchar(255) DEFAULT NULL,
  `CategoryMultiplayer` varchar(255) DEFAULT NULL,
  `CategoryCoop` varchar(255) DEFAULT NULL,
  `CategoryMMO` varchar(255) DEFAULT NULL,
  `CategoryInAppPurchase` varchar(255) DEFAULT NULL,
  `CategoryIncludeSrcSDK` varchar(255) DEFAULT NULL,
  `CategoryIncludeLevelEditor` varchar(255) DEFAULT NULL,
  `CategoryVRSupport` varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Genre(
  `ID` varchar(255) NOT NULL,
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
  `GenreIsMassivelyMultiplayer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE User (
  `ID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Owner (
  `UserID` varchar(255) NOT NULL,
  `GameID` varchar(255) NOT NULL,
  PRIMARY KEY (UserID,GameID),
  FOREIGN KEY (UserID) REFERENCES User(ID),
  FOREIGN KEY (GameID) REFERENCES Game(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE Image(
  `ID` varchar(255) NOT NULL,
  `HeaderImage` LONGBLOB DEFAULT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (ID) REFERENCES Game(ID)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

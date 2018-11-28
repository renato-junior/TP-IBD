-- SET @@global.sql_mode= 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
USE `GameMultiple`;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE RequirementsPC;
TRUNCATE TABLE RequirementsLinux;
TRUNCATE TABLE RequirementsMac;
TRUNCATE TABLE Genre;
TRUNCATE TABLE Category;
TRUNCATE TABLE Owner;
TRUNCATE TABLE User;
TRUNCATE TABLE Game;

LOAD DATA INFILE 'game.csv'
INTO TABLE Game
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,Name,ReleaseDate,RequiredAge,DemoCount,DeveloperCount,DLCCount,Metacritic,MovieCount,PackageCount,RecommendationCount,PublisherCount,ScreenshotCount,SteamSpyOwners,SteamSpyOwnersVariance,SteamSpyPlayersEstimate,SteamSpyPlayersVariance,AchievementCount,AchievementHighlightedCount,ControllerSupport,IsFree,FreeVerAvail,PurchaseAvail,SubscriptionAvail,PriceCurrency,PriceInitial,PriceFinal,SupportEmail,SupportURL,AboutText,Background,ShortDescrip,DetailedDescrip,DRMNotice,ExtUserAcctNotice,HeaderImage,LegalNotice,Reviews,SupportedLanguages,Website);

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

LOAD DATA INFILE 'genre.csv'
INTO TABLE Genre
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,GenreIsNonGame,GenreIsIndie,GenreIsAction,GenreIsAdventure,GenreIsCasual,GenreIsStrategy,GenreIsRPG,GenreIsSimulation,GenreIsEarlyAccess,GenreIsFreeToPlay,GenreIsSports,GenreIsRacing,GenreIsMassivelyMultiplayer);

LOAD DATA INFILE 'linux.csv'
INTO TABLE RequirementsLinux
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,LinuxMinReqsText,LinuxRecReqsText);

LOAD DATA INFILE 'mac.csv'
INTO TABLE RequirementsMac
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,MacMinReqsText,MacRecReqsText);

LOAD DATA INFILE 'pc.csv'
INTO TABLE RequirementsPC
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES (ID,PCMinReqsText,PCRecReqsText);


SET FOREIGN_KEY_CHECKS = 1;
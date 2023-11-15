--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,	CultureEra)
VALUES		('CIVILIZATION_OW_PRC_MAO',	'PACIFIC',		'ANY');
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_OW_PRC_MAO',		80,		63);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_OW_PRC_MAO',		102,	52);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_OW_PRC_MAO',		55,		40);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_OW_PRC_MAO',		83,		50);
------------------------------------------------------------	
-- Civilizations_EastAsiaStartPosition (East Asia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EastAsiaStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_OW_PRC_MAO',		35,		61);
------------------------------------------------------------	
-- Civilizations_PacificStartPosition (Pacific)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_OW_PRC_MAO',		28,		58);
------------------------------------------------------------
-- Civilizations_NorthEastAsiaStartPosition (North-East Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthEastAsiaStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_OW_PRC_MAO',		3,		38);
------------------------------------------------------------
-- Civilizations_AsiaStartPosition (Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_OW_PRC_MAO',		63,		49);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_OW_PRC_MAO'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_OW_PRC_MAO'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_GreatestEarthRequestedResource (Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AsiaRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_OW_PRC_MAO'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_EastAsiaRequestedResource (East Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EastAsiaRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_OW_PRC_MAO'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EastAsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_PacificRequestedResource (Pacific)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_PacificRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_PacificRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_OW_PRC_MAO'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_PacificRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
------------------------------------------------------------
-- Civilizations_NorthEastAsiaRequestedResource (North-East Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthEastAsiaRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_OW_PRC_MAO'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthEastAsiaRequestedResource WHERE Type = 'CIVILIZATION_CHINA';
--==========================================================================================================================
-- JFD's Cultural Diversity
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	CultureType 								text										default null,
	SplashScreenTag								text										default	null,
	SoundtrackTag								text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_CultureTypes
			(CivilizationType,					CultureType,		SplashScreenTag,			SoundtrackTag)
VALUES		('CIVILIZATION_OW_PRC_MAO',	'JFD_Oriental',		'JFD_Totalitarian',		'JFD_Oriental');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_Oriental' )
	THEN 'JFD_Oriental'
	ELSE 'China' END) 
WHERE Type = 'CIVILIZATION_OW_PRC_MAO';
--==========================================================================================================================
-- JFD's Exploration Continued Expanded
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 					ColonyName,									LinguisticType)
VALUES		('CIVILIZATION_OW_PRC_MAO',	null,										'JFD_Oriental'),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_01',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_02',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_03',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_04',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_05',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_06',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_07',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_08',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_09',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_10',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_11',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_12',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_13',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_14',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_15',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_16',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_17',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_18',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_19',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_20',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_21',	null),
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_COLONY_NAME_OW_PRC_MAO_22',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_CHINA',				'CIVILIZATION_OW_PRC_MAO'),
			('CIVILIZATION_OW_PRC_MAO',	'CIVILIZATION_CHINA');

--==========================================================================================================================	
-- JFD's Piety & Prestige
--==========================================================================================================================	
-- Civilization_JFD_Governments
------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  	text 		REFERENCES Civilizations(Type) 				default null,
	CultureType	  		text 		 											default null,
	GovernmentType		text													default	null,
	GovernmentName		text													default	null,
	Weight				integer													default	0);

INSERT INTO Civilization_JFD_Governments
			(CivilizationType,					GovernmentType,					GovernmentName, 						Weight)
VALUES		('CIVILIZATION_OW_PRC_MAO',	'GOVERNMENT_JFD_REPUBLIC',		'TXT_KEY_JFD_GOVERNMENT_NAME_CHINA',	50);
------------------------------	
-- Civilization_JFD_Titles
------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  	text 		REFERENCES Civilizations(Type) 				default null,
	CultureType			text 		 											default null,
	ReligionType		text 		REFERENCES Religions(Type) 					default null,
	DefaultTitle		text 		 											default null,
	UniqueTitle			text 		 											default null,
	UseAdjective		boolean													default 0);

INSERT INTO Civilization_JFD_Titles
			(CivilizationType,					DefaultTitle,											UniqueTitle, 												UseAdjective)
VALUES		('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER_JAPAN',	0),	
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_JAPAN',		0),	
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT_JAPAN',	1),	
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_JAPAN',		0),	
			('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER_JAPAN',	0);
------------------------------	
-- Civilization_JFD_PrimeMinisters
------------------------------	  
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_PrimeMinisters (
	CivilizationType  	text 		REFERENCES Civilizations(Type) 				default null,
	CultureType			text 		 											default null,
	OfficeTitle			text 		 											default null,
	PrimeMinisterName	text 		 											default null);
	
INSERT INTO Civilization_JFD_PrimeMinisters
            (CivilizationType,					PrimeMinisterName)
VALUES		('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_1'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_2'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_3'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_4'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_5'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_6'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_7'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_8'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_9'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_10'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_11'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_12'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_13'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_14'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_15'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_16'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_17'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_18'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_19'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_20'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_21'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_22'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_23'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_24'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_25'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_26'),
            ('CIVILIZATION_OW_PRC_MAO',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_27');
------------------------------					
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_OW_PRC)AMO',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5);

--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_CHINA' )
	THEN '_CHINA'
	ELSE '_MED' END) 
WHERE Type = 'CIVILIZATION_OW_PRC_MAO';
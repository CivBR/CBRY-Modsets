--=======================================================================================================================
-- Bingle's Civ IV Traits
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,             TraitOne,                  TraitTwo)
VALUES      ('LEADER_JFD_MEIJI',	 'POLICY_IMPERIALISTIC_X',	'POLICY_INDUSTRIOUS_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Meiji [ICON_CITY_STATE][ICON_PRODUCTION]'
	ELSE 'TXT_KEY_LEADER_JFD_MEIJI' END) 
WHERE Type = 'LEADER_JFD_MEIJI';

CREATE TRIGGER CivIVTraitsJapanMeiji
AFTER INSERT ON Leaders WHEN 'LEADER_JFD_MEIJI' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Meiji [ICON_CITY_STATE][ICON_PRODUCTION]'
		ELSE 'TXT_KEY_LEADER_JFD_MEIJI' END) 
	WHERE Type = 'LEADER_JFD_MEIJI';
END;	
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_JAPAN' )
	THEN '_JAPAN'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_JAPAN_MEIJI';
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',		97,		59);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',		115,	51);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',		59,		47);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',		99,		49);
------------------------------------------------------------	
-- Civilizations_EastAsiaStartPosition (East Asia)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EastAsiaStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',		63,		61);
------------------------------------------------------------	
-- Civilizations_PacificStartPosition (Pacific)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_PacificStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_PacificStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',		45,		57);
------------------------------------------------------------
-- Civilizations_NorthEastAsiaStartPosition (North-East Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_NorthEastAsiaStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',		50,		29);
------------------------------------------------------------
-- Civilizations_AsiaStartPosition (Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AsiaStartPosition
			(Type,									X,		Y)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',		94,		52);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_JAPAN';
------------------------------------------------------------
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_JAPAN';
------------------------------------------------------------
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_JAPAN_TOJO'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_JAPAN';
------------------------------------------------------------
-- Civilizations_GreatestEarthRequestedResource (Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AsiaRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AsiaRequestedResource WHERE Type = 'CIVILIZATION_JAPAN';
------------------------------------------------------------
-- Civilizations_EastAsiaRequestedResource (East Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_EastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EastAsiaRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EastAsiaRequestedResource WHERE Type = 'CIVILIZATION_JAPAN';
------------------------------------------------------------
-- Civilizations_PacificRequestedResource (Pacific)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_PacificRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_PacificRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_PacificRequestedResource WHERE Type = 'CIVILIZATION_JAPAN';
------------------------------------------------------------
-- Civilizations_NorthEastAsiaRequestedResource (North-East Asia)
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_NorthEastAsiaRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_NorthEastAsiaRequestedResource
			(Type, 								Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'),	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_NorthEastAsiaRequestedResource WHERE Type = 'CIVILIZATION_JAPAN';
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,							CultureType,	CultureEra)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',	'PACIFIC',		'ANY');
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
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',	'JFD_Oriental',		'JFD_OrientalJapanese',		'JFD_OrientalJapanese');
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = (CASE WHEN EXISTS(SELECT SoundtrackTag FROM Civilizations WHERE SoundtrackTag = 'JFD_OrientalJapanese' )
	THEN 'JFD_OrientalJapanese'
	ELSE 'Japan' END) 
WHERE Type = 'CIVILIZATION_JFD_JAPAN_MEIJI';
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
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',	null,										'JFD_Oriental'),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_01',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_02',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_03',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_04',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_05',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_06',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_07',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_08',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_09',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_10',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_11',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_12',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_13',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_14',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_15',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_16',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_17',	null),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_COLONY_NAME_JFD_JAPAN_MEIJI_18',	null);
------------------------------	
-- Civilization_JFD_RevolutionaryCivilizationsToSpawn
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_JAPAN',				'CIVILIZATION_JFD_JAPAN_MEIJI'),
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'CIVILIZATION_JAPAN');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'),	('CIVILIZATION_JFD_JAPAN_TOJO')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_JFD_JAPAN_TOJO');
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
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',	'GOVERNMENT_JFD_MONARCHY',		'TXT_KEY_JFD_GOVERNMENT_NAME_JAPAN',	50);
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
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER_JAPAN',	0),	
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_JAPAN',		0),	
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT_JAPAN',	1),	
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_JAPAN',		0),	
			('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER_JAPAN',	0);
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
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_1'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_2'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_3'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_4'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_5'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_6'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_7'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_8'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_9'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_10'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_11'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_12'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_13'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_14'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_15'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_16'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_17'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_18'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_19'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_20'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_21'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_22'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_23'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_24'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_25'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_26'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_27'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_28'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_29'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_30'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_31'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_32'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_33'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_34'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_35'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_36'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_37'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_38'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_39'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_40'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_41'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_42'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_43'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_44'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_45'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_46'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_47'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_48'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_49'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_50'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_51'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_52'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_53'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_54'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_55'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_56'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_57'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_58'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_59'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_60'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_61'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_62'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_63'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_64'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_65'),
            ('CIVILIZATION_JFD_JAPAN_MEIJI',	'TXT_KEY_PRIME_MINISTER_JFD_JAPAN_66');
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
VALUES		('LEADER_JFD_MEIJI',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		5);
--==========================================================================================================================	
-- JFD's Dynamic TopPanel
--==========================================================================================================================			
-- JFD_TopPanelIncludes
------------------------------	
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelIncludes (
	FileName				text		default null);
	
INSERT OR REPLACE INTO JFD_TopPanelIncludes
		(FileName)
VALUES	('JFD_JapanMeiji_TopPanel.lua');
------------------------------		
-- JFD_TopPanelAdditions
------------------------------		
CREATE TABLE IF NOT EXISTS 
	JFD_TopPanelAdditions (
	CivilizationType		text		REFERENCES Civilizations(Type) 	default null,
	YieldType  				text 										default null,
	YieldSourceFunction 	text										default null,
	YieldSourceToolTip		text										default	null,
	MiscToolTipFunction		text										default	null);
	
INSERT OR REPLACE INTO JFD_TopPanelAdditions
		(CivilizationType,					YieldType,			YieldSourcefunction,				YieldSourceToolTip)
VALUES	('CIVILIZATION_JFD_JAPAN_MEIJI',	'YIELD_CULTURE',	'JFD_GetJapanMeijiCultureBonus',	'TXT_KEY_JFD_JAPAN_MEIJI_CULTURE_BONUS_TOP_PANEL');
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_JapanMeiji_Decisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies
			(Type, 									Description)
VALUES		('POLICY_JFD_JAPAN_MEIJI_ZAIBATSU', 	'TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ZAIBATSU');
------------------------------
-- Policy_BuildingClassYieldChanges
------------------------------
INSERT INTO Policy_BuildingClassYieldChanges
			(PolicyType, 							BuildingClassType, 			YieldType, 		YieldChange)
VALUES		('POLICY_JFD_JAPAN_MEIJI_ZAIBATSU', 	'BUILDINGCLASS_FACTORY', 	'YIELD_GOLD',  	1);
------------------------------
-- Policy_BuildingClassYieldModifiers
------------------------------
INSERT INTO Policy_BuildingClassYieldModifiers
			(PolicyType, 							BuildingClassType, 			YieldType, 		YieldMod)
VALUES		('POLICY_JFD_JAPAN_MEIJI_ZAIBATSU', 	'BUILDINGCLASS_FACTORY', 	'YIELD_GOLD',  	15);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_JapanMeiji_Events.lua');
--==========================================================================================================================
--==========================================================================================================================
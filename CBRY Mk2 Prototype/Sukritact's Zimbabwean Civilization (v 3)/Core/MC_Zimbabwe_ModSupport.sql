--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------  
CREATE TABLE IF NOT EXISTS
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(TYPE)        DEFAULT NULL,
    TraitOne            text    REFERENCES Policies(TYPE)       DEFAULT NULL,
    TraitTwo            text    REFERENCES Policies(TYPE)       DEFAULT NULL);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,                		TraitOne,               TraitTwo)
SELECT  'LEADER_MC_NYATSIMBA_MUTOTA',       'POLICY_PROTECTIVE_X',   'POLICY_INDUSTRIOUS_X'
WHERE EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
------------------------------  
-- Leaders
------------------------------  
UPDATE Leaders
SET Description = 'Nyatsimba Mutota [ICON_STRENGTH][ICON_PRODUCTION]'
WHERE TYPE = 'LEADER_MC_NYATSIMBA_MUTOTA'
AND EXISTS (SELECT * FROM Policies WHERE TYPE = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 				text 			default null,
	Value 				integer 		default 1);
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType, 						ColonyName,								LinguisticType)
VALUES	('CIVILIZATION_MC_ZIMBABWE', 			null,									'JFD_Bantu');
--==========================================================================================================================	
-- JFD's CITIES IN DEVELOPMENT: SLAVERY (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
--==========================================================================================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the proclivity a civ has toward enslaving a captured city and toward spending Slavery on Units.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,					Flavor)
VALUES	('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_SLAVERY',		7);
--==========================================================================================================================
-- JFD's CULTURAL DIVERSITY (31a31d1c-b9d7-45e1-842c-23232d66cd47)
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	DefeatScreenEarlyTag						text											default	null,
	DefeatScreenMidTag							text											default	null,
	DefeatScreenLateTag							text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,			ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_MC_ZIMBABWE',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ZULU';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Bantu'
WHERE Type = 'CIVILIZATION_MC_ZIMBABWE'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Bantu');
--==========================================================================================================================	
-- JFD's AND POUAKAI's MERCENARIES (a19351c5-c0b3-4b07-8695-4affaa199949)
--==========================================================================================================================
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the likelihood that a leader will take out Mercenary Contracts (provided they have the funds).
--A value of 10 means this civilization will always take a Contract if available. A value of 0 means this civilization will never take out a contract.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,					Flavor)
VALUES	('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_MERCENARY',		0);
--==========================================================================================================================	
-- JFD's RISE TO POWER: PIETY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-12 may be set. This value determines the diplomatic penalty/bonus with civilizations of a different/same state religion
--A value higher than 9 means this civilization will never secularise. A value of 0 means this civilization has no interest in State Religion.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,								Flavor)
VALUES	('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		7);
--==========================================================================================================================	
-- JFD's RISE TO POWER: PROSPERITY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================	
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies
		(CivilizationType,					CurrencyType)
SELECT	'CIVILIZATION_MC_ZIMBABWE',			CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_AMERICA';	
--==========================================================================================================================	
-- JFD's RISE TO POWER: SOVEREIGNTY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Governments (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType	  					text 		 												default null,
	LegislatureName					text														default	null,
	OfficeTitle						text														default	null,
	GovernmentType					text														default	null,
	Weight							integer														default	0);

--This table determines a variety of things relating to your Government.
--The LegislatureName refers to the name of your Legislature (e.g. the Imperial Diet). 
--The OfficeTitle refers to the title of your Head of Government (if a Const. Monarchy) (e.g. Vizier. Default is Prime Minister)
--GovernmentType and Weight prefer to a Government preference (GOVERNMENT_JFD_MONARCHY or GOVERNMENT_JFD_REPUBLIC) and how strong that preference is.
INSERT INTO Civilization_JFD_Governments
		(CivilizationType,						GovernmentType, 			Weight)
VALUES	('CIVILIZATION_MC_ZIMBABWE',			'GOVERNMENT_JFD_MONARCHY', 	100);
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,      				HeadOfGovernmentName)
VALUES  ('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_1'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_2'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_3'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_4'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_5'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_6'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_7'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_8'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_9'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_10'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_11'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_12'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_13'	),
		('CIVILIZATION_MC_ZIMBABWE',			'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_14'	);

INSERT OR REPLACE INTO Language_en_US (Tag, Text) 
VALUES
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_1', 	'Matope Nyanhehwe Nebedza'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_2', 	'Mavura Maobwe'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_3', 	'Nyahuma Mukombero'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_4', 	'Changamire'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_5', 	'Chikuyo Chisamarengu'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_6', 	'Neshangwe Munembire'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_7', 	'Chivere Nyasoro'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_8', 	'Negomo Chirisamhuru'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_9', 	'Gatsi Rusere'),
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_10', 	'Nyambu Kapararidze'),
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_11', 	'Kamharapasu Mukombwe'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_12', 	'Nyakambira'),	
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_13', 	'Nyamaende Mhande'),
	('TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_MC_ZIMBABWE_14', 	'Samatambira Nyamhandu');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Titles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	ReligionType					text 		REFERENCES Religions(Type) 						default null,
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	

INSERT INTO Civilization_JFD_Titles
		(CivilizationType,					DefaultTitle,									UniqueTitle)
VALUES	('CIVILIZATION_MC_ZIMBABWE',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_MC_ZIMBABWE'),
		('CIVILIZATION_MC_ZIMBABWE',		'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER',	'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER_MC_ZIMBABWE');

INSERT OR REPLACE INTO Language_en_US (Tag, Text) 
VALUES	('TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_MC_ZIMBABWE', 	'Mwene'),	
		('TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER_MC_ZIMBABWE', 		'Mwenemutapa');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

--This lists all the unique names for a civ's political parties.
--Political Parties are as follows:
----PARTY_JFD_CLERGY
----PARTY_JFD_NOBILITY
----PARTY_JFD_REVOLUTIONARY
----PARTY_JFD_CONSERVATIVE
----PARTY_JFD_LIBERAL
----PARTY_JFD_REACTIONARY
----PARTY_JFD_SOCIALIST
----PARTY_JFD_COMMUNIST
----PARTY_JFD_FASCIST
----PARTY_JFD_LIBERTARIAN
INSERT INTO Civilization_JFD_Politics
		(CivilizationType,					PoliticsType, 				UniqueName)
VALUES	('CIVILIZATION_MC_ZIMBABWE',		'PARTY_JFD_CLERGY',			'TXT_KEY_JFD_PARTY_JFD_CLERGY_MC_ZIMBABWE');

INSERT OR REPLACE INTO Language_en_US (Tag, Text) 
VALUES	('TXT_KEY_JFD_PARTY_JFD_CLERGY_MC_ZIMBABWE', 	'Mhondoros');
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_CULTURE'),
		('FLAVOR_JFD_REFORM_ECONOMIC'),
		('FLAVOR_JFD_REFORM_FOREIGN'),
		('FLAVOR_JFD_REFORM_INDUSTRY'),
		('FLAVOR_JFD_REFORM_MILITARY'),
		('FLAVOR_JFD_REFORM_RELIGION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--Each flavour corresponds to one of the seven Reform Categories, and how likely a civ is to take a reform in either the Right, Centre, or Left column.
--A value of 1-3 will favour Left Reforms. A value of 4-6 will value Centre Reforms. A value of 7-10 will value Right Reforms. The strength of the value will determine how soon a Leader will implement that Reform.
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							Flavor)
VALUES	('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_REFORM_GOVERNMENT',		9),
		('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_REFORM_CULTURE',		5),
		('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_REFORM_ECONOMIC',		4),
		('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_REFORM_FOREIGN',		5),
		('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_REFORM_INDUSTRY',		5),
		('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_REFORM_MILITARY',		7),
		('LEADER_MC_NYATSIMBA_MUTOTA',	'FLAVOR_JFD_REFORM_RELIGION',		8);
--==========================================================================================================================
-- R.E.D. / Ethnic Units
--==========================================================================================================================
-- Civilizations
------------------------------  
UPDATE Civilizations
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ZULU' )
    THEN '_ZULU'
    ELSE '_AFRI' END)
WHERE TYPE = 'CIVILIZATION_MC_ZIMBABWE';
--==========================================================================================================================
-- RYOGA's UNIQUE CULTURAL INFLUENCE
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text)
VALUES(
		'TXT_KEY_GENERIC_MC_ZIMBABWE_INFLUENTIAL_ON_AI_1',
		'Our people are now building gigantic stone houses without using mortar. I worry the rest of the world will also succumb to the influence of your culture.'
	);
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,					CultureType,			CultureEra)
VALUES	('CIVILIZATION_MC_ZIMBABWE',		'AFRICAN',				'ANY');
--=======================================================================================================================	
-- Historical Religions Support
--=======================================================================================================================	
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_AMATONGO'
WHERE CivilizationType = 'CIVILIZATION_MC_ZIMBABWE' AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_AMATONGO');

UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_MWARI'
WHERE CivilizationType = 'CIVILIZATION_MC_ZIMBABWE' AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_MWARI');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,								CivilizationType,				CultureType)
VALUES	('TXT_KEY_EVENT_CULDEV_MC_ZIMBABWE_01',		'CIVILIZATION_MC_ZIMBABWE',		'JFD_Bantu'),
		('TXT_KEY_EVENT_CULDEV_MC_ZIMBABWE_02',		'CIVILIZATION_MC_ZIMBABWE',		'JFD_Bantu');

INSERT INTO Language_en_US 
		(Tag, 										Text) 
VALUES	('TXT_KEY_EVENT_CULDEV_MC_ZIMBABWE_01',		'Architects from {1_City}, have developed a way to build large walls without the use of motar.'),
		('TXT_KEY_EVENT_CULDEV_MC_ZIMBABWE_02',		'Craftsmen in {1_City}, have begun carving statues from soapstone.');

--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_MC_ZIMBABWE',	33,		15);
------------------------------
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_MC_ZIMBABWE',	71,		20);
------------------------------
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_MC_ZIMBABWE',	40,		5);
------------------------------
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_MC_ZIMBABWE',	59,		9);
------------------------------
-- Civilizations_AfricaLargeStartPosition (Africa Large)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
			(Type,							X,		Y)
VALUES		('CIVILIZATION_MC_ZIMBABWE',	43,		15);
------------------------------
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
			(Type, 							Req1,				 Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_ZIMBABWE'),	('RESOURCE_COW'),	 Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_ZULU';
------------------------------
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
			(Type, 							Req1,				 Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_ZIMBABWE'),	('RESOURCE_COW'),	 Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_ZULU';
------------------------------
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
			(Type, 							Req1,				 Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_ZIMBABWE'),	('RESOURCE_COW'),	 Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_ZULU';
------------------------------
-- Civilizations_AfricaLargeRequestedResource (Africa Large)
------------------------------
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfricaLargeRequestedResource
			(Type, 							Req1,				 Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT		('CIVILIZATION_MC_ZIMBABWE'),	('RESOURCE_COW'),	 Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfricaLargeRequestedResource WHERE Type = 'CIVILIZATION_ZULU';
--==========================================================================================================================
--==========================================================================================================================
--=======================================================================================================================
-- BINGLES CIV IV TRAITS
--=======================================================================================================================
-- Leader_SharedTraits
------------------------------	
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT INTO Leader_SharedTraits
        (LeaderType,             	TraitOne,               TraitTwo)
VALUES  ('LEADER_JFD_HANNIBAL', 	'POLICY_AGGRESSIVE_X',	'POLICY_CHARISMATIC_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = 'Hannibal [ICON_WAR][ICON_HAPPINESS_1]'
WHERE Type = 'LEADER_JFD_HANNIBAL'
AND EXISTS (SELECT * FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');
--==========================================================================================================================
-- GAZEBO COMMUNITY PATCH
--==========================================================================================================================
-- COMMUNITY
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS COMMUNITY (Type TEXT, Value INTEGER);
--==========================================================================================================================
-- GEDEMON R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = '_CARTHAGE'
WHERE Type = 'CIVILIZATION_JFD_CARTHAGE_HANNIBAL'
AND EXISTS (SELECT * FROM Civilizations WHERE ArtStyleSuffix = '_CARTHAGE');
--==========================================================================================================================
-- GEDEMON YNAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,									X, Y)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	X, Y
FROM Civilizations_YagemStartPosition WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,									X, Y)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	X, Y
FROM Civilizations_YahemStartPosition WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,									X, Y)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	X, Y
FROM Civilizations_CordiformStartPosition WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,									X, Y)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	X, Y
FROM Civilizations_GreatestEarthStartPosition WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroGiantStartPosition
		(Type,									X, Y)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	X, Y
FROM Civilizations_EuroGiantStartPosition WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_EuroLargeStartPosition (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_EuroLargeStartPosition
		(Type,									X, Y)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	X, Y
FROM Civilizations_EuroLargeStartPosition WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_AfricaLargeStartPosition (Africa Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
		(Type,									X, Y)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	X, Y
FROM Civilizations_AfricaLargeStartPosition WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_MediterraneanStartPosition (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_MediterraneanStartPosition
		(Type,									X, Y)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	X, Y
FROM Civilizations_MediterraneanStartPosition WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YagemRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_YahemRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_GreatestEarthRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroGiantRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroGiantRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_EuroLargeRequestedResource (Europe Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_EuroLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_EuroLargeRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_EuroLargeRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_AfricaLargeRequestedResource (Africa Large)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfricaLargeRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_AfricaLargeRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilizations_MediterraneanRequestedResource (Mediterranean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_MediterraneanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_MediterraneanRequestedResource
		(Type, 									Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4
FROM Civilizations_MediterraneanRequestedResource WHERE Type = 'CIVILIZATION_CARTHAGE';
--==========================================================================================================================
-- HAZEL MAP LABELS
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,								CultureType,		CultureEra)
VALUES	('CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	'MEDITERRANEAN',	'ANY');
--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================
-- JFD COLONIES
--==========================================================================================================================
-- Civilization_JFD_ColonialCityNames
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT INTO Civilization_JFD_ColonialCityNames
		(CivilizationType,						LinguisticType, ColonyName)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	LinguisticType, ColonyName
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
--==========================================================================================================================
-- JFD CULTURAL DIVERSITY
--==========================================================================================================================
-- Civilization_JFD_CultureTypes
------------------------------	
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	IdealsTag									text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Classical'
WHERE Type = 'CIVILIZATION_JFD_CARTHAGE_HANNIBAL'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Classical')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);
--==========================================================================================================================	
-- JFD AND POUAKAI MERCENARIES
--==========================================================================================================================
-- Traits
------------------------------------------------------------
UPDATE Traits
SET Description = 'TXT_KEY_TRAIT_JFD_CARTHAGE_HANNIBAL_MERCENARIES', ShortDescription = 'TXT_KEY_TRAIT_JFD_CARTHAGE_HANNIBAL_SHORT_MERCENARIES'
WHERE Type = 'TRAIT_JFD_CARTHAGE_HANNIBAL'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GAESATAE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_MERCENARY_UA' AND Value = 1);
-------------------------------------
-- Trait_JFD_ContractModifiers
-------------------------------------	
CREATE TABLE IF NOT EXISTS 
Trait_JFD_ContractModifiers (
	TraitType 										text 	REFERENCES Traits(Type)				default null,
	CostModifier 									integer 									default 0,
	MaintenanceModifier 							integer 									default 0,
	TurnsModifier 									integer 									default 0);

INSERT INTO Trait_JFD_ContractModifiers
		(TraitType,						TurnsModifier)
SELECT	'TRAIT_JFD_CARTHAGE_HANNIBAL',	50
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GAESATAE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_MERCENARY_UA' AND Value = 1);
------------------------------------------------------------
-- Trait_FreePromotionUnitCombats
------------------------------------------------------------	
DELETE FROM Trait_FreePromotionUnitCombats WHERE TraitType = 'TRAIT_JFD_CARTHAGE_HANNIBAL'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GAESATAE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_MERCENARY_UA' AND Value = 1);
------------------------------------------------------------
-- JFD_GlobalUserSettings
------------------------------------------------------------	
UPDATE JFD_GlobalUserSettings
SET Value = 0
WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_MERCENARY_UA'
AND EXISTS (SELECT * FROM Units WHERE Type = 'UNIT_JFD_GAESATAE');
------------------------------------------------------------
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_MERCENARY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
INSERT INTO Leader_Flavors
		(LeaderType,				FlavorType,					Flavor)
VALUES	('LEADER_JFD_HANNIBAL',		'FLAVOR_JFD_MERCENARY',		10);
--==========================================================================================================================	
-- JFD PIETY
--==========================================================================================================================	
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,							 Flavor)
VALUES	('LEADER_JFD_HANNIBAL',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',	 0);
--==========================================================================================================================
-- JFD PROSPERITY
--==========================================================================================================================
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Currencies (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 	default null,
	CurrencyType	  				text 		  								default null);

INSERT INTO Civilization_JFD_Currencies	
		(CivilizationType,						CurrencyType)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
--==========================================================================================================================	
-- JFD SOVEREIGNTY
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

INSERT INTO Civilization_JFD_Governments
		(CivilizationType,					  LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL', LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------	
-- Civilization_JFD_HeadsOfGovernment	
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 	
	Civilization_JFD_HeadsOfGovernment (	
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	CultureType						text 		 												default null,
	HeadOfGovernmentName			text 		 												default null);

INSERT INTO Civilization_JFD_HeadsOfGovernment
		(CivilizationType,						HeadOfGovernmentName)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
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
		(CivilizationType,						DefaultTitle,	UniqueTitle)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	DefaultTitle,	UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_Politics (
	CivilizationType  					text 		REFERENCES Civilizations(Type) 					default null,
	PoliticsType  						text 														default null,
	UniqueName							text														default	null);

INSERT INTO Civilization_JFD_Politics
		(CivilizationType,						PoliticsType, UniqueName)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
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
INSERT INTO Leader_Flavors
		(LeaderType,			FlavorType,						 Flavor)
VALUES	('LEADER_JFD_HANNIBAL',	'FLAVOR_JFD_REFORM_GOVERNMENT',	 5),
		('LEADER_JFD_HANNIBAL',	'FLAVOR_JFD_REFORM_CULTURE',	 6),
		('LEADER_JFD_HANNIBAL',	'FLAVOR_JFD_REFORM_ECONOMIC',	 5),
		('LEADER_JFD_HANNIBAL',	'FLAVOR_JFD_REFORM_FOREIGN',	 6),
		('LEADER_JFD_HANNIBAL',	'FLAVOR_JFD_REFORM_INDUSTRY',	 6),
		('LEADER_JFD_HANNIBAL',	'FLAVOR_JFD_REFORM_MILITARY',	 9),
		('LEADER_JFD_HANNIBAL',	'FLAVOR_JFD_REFORM_RELIGION',	 3);
--==========================================================================================================================
-- SUKRITACT DECISIONS
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('JFD_CarthageHannibal_Decisions.lua');
------------------------------	
-- Policies
------------------------------	
INSERT INTO Policies
		(Type,								Description)
VALUES	('POLICY_DECISIONS_JFD_SUFFETES',	'TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES');
------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,						BuildingClassType,				ProductionModifier)
VALUES	('POLICY_DECISIONS_JFD_SUFFETES',	'BUILDINGCLASS_COURTHOUSE',		100);

UPDATE Policy_BuildingClassProductionModifiers
SET ProductionModifier = 50
WHERE PolicyType = 'POLICY_DECISIONS_JFD_SUFFETES'
AND EXISTS (SELECT * FROM BuildingClasses WHERE Type = 'BUILDINGCLASS_JFD_MAGISTRATE_COURT');

INSERT INTO Policy_BuildingClassProductionModifiers
		(PolicyType,						BuildingClassType,				ProductionModifier)
SELECT	'POLICY_DECISIONS_JFD_SUFFETES',	Type,							50
FROM BuildingClasses WHERE Type IN ('BUILDINGCLASS_JFD_MAGISTRATE_COURT', 'BUILDINGCLASS_JFD_HIGH_COURT');
------------------------------
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 											Description, 											Help, 														Sound, 				IgnoreZoC,	VisibilityChange,	MovesChange,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_DECISIONS_JFD_SHOPHET_TRIBUNAL',	'TXT_KEY_PROMOTION_DECISIONS_JFD_SHOPHET_TRIBUNAL',		'TXT_KEY_PROMOTION_DECISIONS_JFD_SHOPHET_TRIBUNAL_HELP', 	'AS2D_IF_LEVELUP',	1,			1,					2, 				1, 				33, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_JFD_SHOPHET_TRIBUNAL');
--==========================================================================================================================
-- SUKRITACT EVENTS
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('JFD_CarthageHannibal_Events.lua');
------------------------------
-- Events_CulturalDevelopments
------------------------------
INSERT INTO UnitPromotions 
		(Type, 									Description, 									Help, 												Sound, 				ExperiencePercent,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_DECISIONS_JFD_XANTHIPPUS',	'TXT_KEY_PROMOTION_DECISIONS_JFD_XANTHIPPUS',	'TXT_KEY_PROMOTION_DECISIONS_JFD_XANTHIPPUS_HELP', 	'AS2D_IF_LEVELUP',	10,					1, 				59, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_DECISIONS_JFD_XANTHIPPUS');
------------------------------
-- Events_CulturalDevelopments
------------------------------
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
		(Description,										CivilizationType,						CultureType)
VALUES	('TXT_KEY_EVENT_CULDEV_JFD_CARTHAGE_HANNIBAL_01',	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	'JFD_Classical');
--==========================================================================================================================
-- TOMATEKH HISTORICAL RELIGIONS
--==========================================================================================================================
-- Civilization_Religions
------------------------------
UPDATE Civilization_Religions 
SET ReligionType = 'RELIGION_CANAANISM'
WHERE CivilizationType = 'CIVILIZATION_JFD_CARTHAGE_HANNIBAL'
AND EXISTS (SELECT * FROM Religions WHERE Type = 'RELIGION_CANAANISM');
--==========================================================================================================================
--==========================================================================================================================
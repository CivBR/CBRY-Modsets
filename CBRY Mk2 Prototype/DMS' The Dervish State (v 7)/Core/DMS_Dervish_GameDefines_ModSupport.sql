--==========================================================================================================================
-- USER SETTINGS (THIS IS NEEDED IN MOST CASES)
--==========================================================================================================================
-- JFD_GlobalUserSettings
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                text            default null,
    Value               integer         default 1);
--==========================================================================================================================
-- Sukritact's Decisions
--==========================================================================================================================
-- DecisionsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('DervishStateDecisions.lua');
------------------------------
-- Policies
------------------------------
INSERT INTO Policies 
		(Type,									Description) 
VALUES	('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'TXT_KEY_POLICY_DMS_DERVISH_FORTIFY_TALEH');
------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------
INSERT INTO Policy_BuildingClassProductionModifiers
 		(PolicyType,							BuildingClassType,					ProductionModifier) 
VALUES	('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'BUILDINGCLASS_WALLS',				25),
		('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'BUILDINGCLASS_BARRACKS',			25),
		('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'BUILDINGCLASS_ARMORY',				25),
		('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'BUILDINGCLASS_MILITARY_ACADEMY',	25),
		('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'BUILDINGCLASS_ARSENAL',			25),
		('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'BUILDINGCLASS_CASTLE',				25),
		('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'BUILDINGCLASS_MILITARY_BASE',		25);
------------------------------
-- Policy_BuildingClassProductionModifiers
------------------------------
INSERT INTO Policy_ImprovementYieldChanges
 		(PolicyType,							ImprovementType,					YieldType,			Yield) 
VALUES	('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'IMPROVEMENT_FORT',					'YIELD_PRODUCTION',	1),
		('POLICY_DMS_DERVISH_FORTIFY_TALEH',	'IMPROVEMENT_CITADEL',				'YIELD_PRODUCTION',	2);
------------------------------
-- BuildingClasses
------------------------------	
INSERT INTO BuildingClasses
		(Type, 											DefaultBuilding, 						Description, 										MaxGlobalInstances)													
VALUES	('BUILDINGCLASS_DMS_DERVISH_FORTIFY_TALEH',		'BUILDING_DMS_DERVISH_FORTIFY_TALEH', 	'TXT_KEY_BUILDING_DMS_DERVISH_FORTIFY_TALEH', 		-1);
------------------------------
-- Buildings
------------------------------
INSERT INTO Buildings
 		(Type,									BuildingClass,								SpecialistType,			SpecialistCount,	Cost, 	FaithCost,	GreatWorkCount, GoldMaintenance,	PrereqTech, 	Description,									Help,												Civilopedia,										Strategy,												ArtDefineTag,				MinAreaSize,	IconAtlas,		PortraitIndex) 
VALUES	('BUILDING_DMS_DERVISH_FORTIFY_TALEH',	'BUILDINGCLASS_DMS_DERVISH_FORTIFY_TALEH',	'SPECIALIST_ENGINEER',	1,					-1, 	-1,			-1, 			0,  				null,			'TXT_KEY_BUILDING_DMS_DERVISH_FORTIFY_TALEH',	'TXT_KEY_BUILDING_DMS_DERVISH_FORTIFY_TALEH_HELP',	'TXT_KEY_BUILDING_DMS_DERVISH_FORTIFY_TALEH_PEDIA',	'TXT_KEY_BUILDING_DMS_DERVISH_FORTIFY_TALEH_STRATEGY',	'ART_DEF_BUILDING_CASTLE',	-1,				'BW_ATLAS_1',	39);
------------------------------
-- Building_SpecialistYieldChanges
------------------------------
INSERT INTO Building_SpecialistYieldChanges
 		(BuildingType,							SpecialistType,						YieldType,			Yield) 
VALUES	('BUILDING_DMS_DERVISH_FORTIFY_TALEH',	'SPECIALIST_ENGINEER',				'YIELD_PRODUCTION',	1);
--==========================================================================================================================
-- Sukritact's Events
--==========================================================================================================================
-- EventsAddin_Support
------------------------------
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('DervishStateEvents.lua');
------------------------------
-- BuildingClasses
------------------------------
INSERT INTO BuildingClasses
		(Type, 													DefaultBuilding)
VALUES	('BUILDINGCLASS_DMS_DERVISH_STATE_EVENT_SPY_DUMMY',		'BUILDING_DMS_DERVISH_STATE_EVENT_SPY_DUMMY');
------------------------------	
-- Buildings
------------------------------
INSERT INTO Buildings
		(Type, 													BuildingClass,										GlobalEspionageModifier,	Cost,	FaithCost,	PrereqTech,	MinAreaSize,	GreatWorkCount,	HurryCostModifier,	NeverCapture,	NukeImmune,	IconAtlas,				PortraitIndex)
VALUES	('BUILDING_DMS_DERVISH_STATE_EVENT_SPY_DUMMY',			'BUILDINGCLASS_DMS_DERVISH_STATE_EVENT_SPY_DUMMY',	-10,						-1,		-1,			null,		-1,				-1,				-1,					1,				1,			'ATLAS_AOI_DERVISH',	0);
--==========================================================================================================================
-- Hazel's Map Labels
--==========================================================================================================================
-- ML_CivCultures
------------------------------	
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
		(CivType,									CultureType,	CultureEra)
VALUES	('CIVILIZATION_AOI_DERVISH',				'AFRICAN',		'ANY');
--==========================================================================================================================
-- BrutalSamurai's Ethnic Units/Gedemon's R.E.D.
--==========================================================================================================================
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_ARABIA' )
	THEN '_ARABIA'
	ELSE '_AFRI' END) 
WHERE Type = 'CIVILIZATION_AOI_DERVISH';
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
        (LeaderType,           			TraitOne,					TraitTwo)
VALUES	('LEADER_AOI_ABDULLAH_HASSAN',	'POLICY_PROTECTIVE_X',		'POLICY_PHILOSOPHICAL_X');
------------------------------	
-- Leaders
------------------------------	
UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PROTECTIVE_X' )
	THEN 'Abdullah Hassan [ICON_WAR][ICON_GREAT_PEOPLE]'
	ELSE 'TXT_KEY_LEADER_AOI_ABDULLAH_HASSAN' END) 
WHERE Type = 'LEADER_AOI_ABDULLAH_HASSAN';

CREATE TRIGGER CivIVTraitsDervishState
AFTER INSERT ON Leaders WHEN 'LEADER_AOI_ABDULLAH_HASSAN' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PROTECTIVE_X' )
		THEN 'Abdullah Hassan [ICON_WAR][ICON_GREAT_PEOPLE]'
		ELSE 'TXT_KEY_LEADER_AOI_ABDULLAH_HASSAN' END) 
	WHERE Type = 'LEADER_AOI_ABDULLAH_HASSAN';
END;
--==========================================================================================================================
-- Historical Religions
--==========================================================================================================================
UPDATE Civilization_Religions SET ReligionType = 
	( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type="RELIGION_ISLAM" )
		THEN "RELIGION_ISLAM"
		ELSE "RELIGION_ISLAM" END
	) WHERE CivilizationType = "CIVILIZATION_AOI_DERVISH";

CREATE TRIGGER ReligionDervishStateTrigger
AFTER INSERT ON Religions WHEN 'RELIGION_ISLAM' = NEW.Type
BEGIN
	UPDATE Civilization_Religions 
	SET ReligionType = 'RELIGION_ISLAM'
	WHERE CivilizationType IN ('CIVILIZATION_AOI_DERVISH');
END;
--==========================================================================================================================
-- Gedemon's YnAEMP
--==========================================================================================================================
-- Civilizations_YagemStartPosition (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YagemStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AOI_DERVISH',			42,		34,		null,	null);
------------------------------------------------------------	
-- Civilizations_YahemStartPosition (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_YahemStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AOI_DERVISH',			78,		37,		null,	null);
------------------------------------------------------------	
-- Civilizations_CordiformStartPosition (Earth Standard)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_CordiformStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_CordiformStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AOI_DERVISH',			49,		13,		null,	null);
------------------------------------------------------------	
-- Civilizations_GreatestEarthStartPosition (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_GreatestEarthStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AOI_DERVISH',			67,		27,		null,	null);
------------------------------------------------------------	
-- Civilizations_AfricaLargeStartPosition (Africa)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfricaLargeStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AOI_DERVISH',			59,		47,		null,	null);
------------------------------------------------------------	
-- Civilizations_AfriAsiaAustStartPosition (Africa, Asia & Oceania)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriAsiaAustStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AOI_DERVISH',			54,		44,		null,	null);
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroStartPosition (Africa + Southern Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriSouthEuroStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AOI_DERVISH',			61,		37,		null,	null);
------------------------------------------------------------	
-- Civilizations_IndianOceanStartPosition (Indian Ocean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_IndianOceanStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_IndianOceanStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AOI_DERVISH',			21,		48,		null,	null);
------------------------------------------------------------	
-- Civilizations_AfriGiantStartPosition (Africa Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantStartPosition(Type, X, Y, AltX, AltY);
INSERT INTO Civilizations_AfriGiantStartPosition
		(Type,									X,		Y,		AltX,	AltY)
VALUES	('CIVILIZATION_AOI_DERVISH',			123,	87,		null,	null);
------------------------------------------------------------	
-- Civilizations_YagemRequestedResource (Earth Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YagemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YagemRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_AOI_DERVISH',				'RESOURCE_HORSE',	4,		'RESOURCE_SHEEP',	0,		'RESOURCE_IRON',	2);
------------------------------------------------------------	
-- Civilizations_YahemRequestedResource (Earth Huge)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YahemRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_YahemRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_AOI_DERVISH',				'RESOURCE_HORSE',	4,		'RESOURCE_SHEEP',	0,		'RESOURCE_IRON',	2);
------------------------------------------------------------	
-- Civilizations_GreatestEarthRequestedResource (Earth Greatest)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_GreatestEarthRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_GreatestEarthRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_AOI_DERVISH',				'RESOURCE_HORSE',	4,		'RESOURCE_SHEEP',	0,		'RESOURCE_IRON',	2);
------------------------------------------------------------	
-- Civilizations_AfricaLargeRequestedResource (Africa)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfricaLargeRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfricaLargeRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_AOI_DERVISH',				'RESOURCE_HORSE',	4,		'RESOURCE_SHEEP',	0,		'RESOURCE_IRON',	2);
------------------------------------------------------------	
-- Civilizations_AfriAsiaAustRequestedResource (Africa, Asia & Oceania)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriAsiaAustRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriAsiaAustRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_AOI_DERVISH',				'RESOURCE_HORSE',	4,		'RESOURCE_SHEEP',	0,		'RESOURCE_IRON',	2);
------------------------------------------------------------	
-- Civilizations_AfriSouthEuroRequestedResource (Africa + Southern Europe)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriSouthEuroRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriSouthEuroRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_AOI_DERVISH',				'RESOURCE_HORSE',	4,		'RESOURCE_SHEEP',	0,		'RESOURCE_IRON',	2);
------------------------------------------------------------	
-- Civilizations_IndianOceanRequestedResource (Indian Ocean)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_IndianOceanRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_IndianOceanRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_AOI_DERVISH',				'RESOURCE_HORSE',	4,		'RESOURCE_SHEEP',	0,		'RESOURCE_IRON',	2);
------------------------------------------------------------	
-- Civilizations_AfriGiantRequestedResource (Africa Giant)
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_AfriGiantRequestedResource(Type, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4);
INSERT INTO Civilizations_AfriGiantRequestedResource
		(Type, 										Req1,				Yield1, Req2,				Yield2, Req3,				Yield3)
VALUES	('CIVILIZATION_AOI_DERVISH',				'RESOURCE_HORSE',	4,		'RESOURCE_SHEEP',	0,		'RESOURCE_IRON',	2);
--==========================================================================================================================
-- JFD CIVILOPEDIA
--==========================================================================================================================
-- JFD_Civilopedia_HideFromPedia
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_Civilopedia_HideFromPedia (Type text default null);
 
--Any items entered into this table will not show into the Civilopedia. There is no technical limitation as to what can be hidden (I think).
INSERT INTO JFD_Civilopedia_HideFromPedia
        (Type)
VALUES  ('POLICY_DMS_DERVISH_FORTIFY_TALEH'),
		('BUILDING_DMS_DERVISH_FORTIFY_TALEH'),
		('BUILDING_AOI_SHARIA_HIDDEN');
 
-- For a leader to appear as belonging to another civilization, fill in the tag: "DerivativeCiv" e.g.
UPDATE Civilizations
SET DerivativeCiv = 'CIVILIZATION_AOI_DERVISH'
WHERE Type = 'CIVILIZATION_AOI_DERVISH';   
-- Thanks to Sukritact, you can also fill this tag in with a text string, which will group this civ with others that also have this text string.
--UPDATE Civilizations
--SET DerivativeCiv = 'TXT_KEY_JFD_RUSSIA_MASTER_RACE'
--WHERE Type = 'CIVILIZATION_AOI_DERVISH';   
--==========================================================================================================================
-- JFD's CITIES IN DEVELOPMENT (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
-- Please Note: it is NOT necessary to make any changes to this if you had supported Colony Names under the ExCE ID. 
-- You will only need to add support for Claims if you wish some of your Decisions to cost Dignitaries instead of Magistrates. Examples TBD.
--==========================================================================================================================
-- BuildingClass_ConstructionAudio
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
BuildingClass_ConstructionAudio (
    BuildingClassType                           text    REFERENCES BuildingClasses(Type)        default null,
    ConstructionAudio                           text											default null);
	
--The following will override any entries for the above.
CREATE TABLE IF NOT EXISTS
Building_ConstructionAudio (
    BuildingType                                text    REFERENCES Buildings(Type)              default null,
    ConstructionAudio                           text											default null);
	
--If you wish to add your own unique sounds, the beginning Jingle can be found here:
--https://www.dropbox.com/s/p5llo4y55ym4toa/StarterSfx.wav?dl=0
------------------------------------------------------------
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    ColonyName                                  text                                        default null,
    LinguisticType                              text                                        default null,
    CultureType                                 text                                        default null);
/*
JFD_Germanic, JFD_Latinate, JFD_Tai_Khmer, JFD_Austronesian, JFD_Arabic, JFD_Slavic, JFD_Mesopotamian, JFD_Mesoamerican, JFD_Oriental,
JFD_Finno_Ugric, JFD_Semitic, JFD_Hellenic, JFD_Bantu, JFD_Songhay, JFD_Indo_Iranian, JFD_Altaic, JFD_Celtic, JFD_NorthAmerican, JFD_Quechumaran
*/
INSERT INTO Civilization_JFD_ColonialCityNames
        (CivilizationType,                     ColonyName,								LinguisticType)
VALUES  ('CIVILIZATION_AOI_DERVISH',           null,									'JFD_Arabic');
------------------------------------------------------------		
-- Flavors
------------------------------------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_DECOLONIZATION');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------	
--A value of 0-10 may be set. This value determines the proclivity a civ has toward annexing a colony, where 0 means never, and 10 means as soon as possible.
INSERT INTO Leader_Flavors
		(LeaderType,					FlavorType,						Flavor)
VALUES	('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_JFD_DECOLONIZATION',	8);
--==========================================================	
-- PROVINCES 
--==========================================================	
-- Civilization_JFD_ProvinceTitles
------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS 
	Civilization_JFD_ProvinceTitles (
	CivilizationType  				text 		REFERENCES Civilizations(Type) 					default null,
	ReligionType  					text 		REFERENCES Religions(Type) 						default null, -- ignore this
	DefaultTitle					text 		 												default null,
	UniqueTitle						text 		 												default null,
	UseAdjective					boolean														default 0);	
	
/*
Default Titles:
TXT_KEY_PROVINCE_JFD_BARONY_DESC_MONARCHY -- Barony
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_MONARCHY -- County
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_RULER_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_MONARCHY -- Duchy
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_COLONY_DESC_MONARCHY -- Colony
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_MONARCHY
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_MONARCHY_FEMININE 

(Generally, Republics do not have unique titles)
TXT_KEY_PROVINCE_JFD_BARONY_DESC_REPUBLIC -- Municipality
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_REPUBLIC
TXT_KEY_PROVINCE_JFD_BARONY_DESC_RULER_REPUBLIC_FEMININE
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_REPUBLIC -- County
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_REPUBLIC_MONARCHY
TXT_KEY_PROVINCE_JFD_COUNTY_DESC_REPUBLIC_MONARCHY_FEMININE
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_REPUBLIC -- State
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_REPUBLIC
TXT_KEY_PROVINCE_JFD_DUCHY_DESC_RULER_REPUBLIC_FEMININE
TXT_KEY_PROVINCE_JFD_COLONY_DESC_REPUBLIC -- Colony
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_REPUBLIC
TXT_KEY_PROVINCE_JFD_COLONY_DESC_RULER_REPUBLIC_FEMININE 
*/	
--This is an example of support which copies all attributes from an existing civ (i.e. Denmark). For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_SCOTLAND' to the
--tag of your custom civ. 
INSERT INTO Civilization_JFD_ProvinceTitles
		(CivilizationType,				DefaultTitle, UniqueTitle, UseAdjective)
SELECT	'CIVILIZATION_AOI_DERVISH',		DefaultTitle, UniqueTitle, UseAdjective
FROM Civilization_JFD_ProvinceTitles WHERE CivilizationType = 'CIVILIZATION_ARABIA';
--==========================================================================================================================    
-- JFD's CITIES IN DEVELOPMENT: SLAVERY (10e9728f-d61c-4317-be4f-7d52d6bae6f4)
--==========================================================================================================================    
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_SLAVERY');
------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------    
--A value of 0-10 may be set. This value determines the proclivity a civ has toward enslaving a captured city and toward spending Slavery on Units.
INSERT INTO Leader_Flavors
        (LeaderType,						FlavorType,                 Flavor)
VALUES  ('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_SLAVERY',       5);
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
/*
CultureTypes:
  CULTURE_JFD_ABORIGINAL, CULTURE_JFD_ANDEAN, CULTURE_JFD_BANTU, CULTURE_JFD_BHARATA, CULTURE_JFD_CENTRAL, CULTURE_JFD_CLASSICAL, CULTURE_JFD_COLONIAL, CULTURE_JFD_EASTERN, CULTURE_JFD_EAST_INDIES, CULTURE_JFD_GREAT_PLAINS, CULTURE_JFD_HIMALAYAN, CULTURE_JFD_ISLAMIC, CULTURE_JFD_KATUJE, CULTURE_JFD_MANDALA, CULTURE_JFD_MESOAMERICAN, CULTURE_JFD_MESOPOTAMIC, CULTURE_JFD_NORTHERN, CULTURE_JFD_OCEANIC, CULTURE_JFD_ORIENTAL, CULTURE_JFD_PACIFIC, CULTURE_JFD_POLAR, CULTURE_JFD_SAHARAN, CULTURE_JFD_SEMITIC, CULTURE_JFD_STEPPE, CULTURE_JFD_SOUTHERN, CULTURE_JFD_TOTALITARIAN, CULTURE_JFD_WEST_AFRICAN, CULTURE_JFD_WESTERN, CULTURE_JFD_WOODLANDS

SplashScreenTags (As above, unless otherwise specified):
   As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
   JFD_ClassicalRoman, JFD_ColonialLatin, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal
  
SoundtrackTag (As above, unless otherwise specified):
  As above in single word lower-case, e.g. CULTURE_JFD_CENTRAL = JFD_Central, CULTURE_JFD_WEST_AFRICAN = JFD_WestAfrican
  JFD_ClassicalRoman, JFD_ColonialLatin, JFD_MesopotamicEgyptian, JFD_NorthernCeltic, JFD_OrientalJapanese, JFD_SemiticEthiopic, JFD_SouthernPapal
  
 UnitDialogueTag:
	AS2D_SOUND_JFD_AMERICAN, AS2D_SOUND_JFD_AMERICAN_WEST, AS2D_SOUND_JFD_ALBANIAN*, AS2D_SOUND_JFD_ARABIC, AS2D_SOUND_JFD_AZTEC, AS2D_SOUND_JFD_BABYLONIAN, AS2D_SOUND_JFD_BERBER*, AS2D_SOUND_JFD_BYZANTINE, AS2D_SOUND_JFD_CARTHAGINIAN, AS2D_SOUND_JFD_CELTIC, AS2D_SOUND_JFD_CHINESE, AS2D_SOUND_JFD_COMANCHE*, AS2D_SOUND_JFD_DUTCH, AS2D_SOUND_JFD_EGYPTIAN, AS2D_SOUND_JFD_ENGLISH, AS2D_SOUND_JFD_ETHIOPIAN, AS2D_SOUND_JFD_FINNISH*, AS2D_SOUND_JFD_FRENCH, AS2D_SOUND_JFD_GAELIC*, AS2D_SOUND_JFD_GERMAN, AS2D_SOUND_JFD_GREEK, AS2D_SOUND_JFD_HOLY_ROMAN, AS2D_SOUND_JFD_HUNNIC, AS2D_SOUND_JFD_INCAN, AS2D_SOUND_JFD_INDIAN, AS2D_SOUND_JFD_ITALIAN, AS2D_SOUND_JFD_JAPANESE, AS2D_SOUND_JFD_KHMER, AS2D_SOUND_JFD_KOREAN, AS2D_SOUND_JFD_LATINO, AS2D_SOUND_JFD_MALINESE, AS2D_SOUND_JFD_MAMLUKE*, AS2D_SOUND_JFD_MAYAN, AS2D_SOUND_JFD_MOHAWK, AS2D_SOUND_JFD_MONGOL, AS2D_SOUND_JFD_OTTOMAN, AS2D_SOUND_JFD_PERSIAN, AS2D_SOUND_JFD_POLISH, AS2D_SOUND_JFD_PORTUGUESE, AS2D_SOUND_JFD_ROMAN, AS2D_SOUND_JFD_RUSSIAN, AS2D_SOUND_JFD_SIAMESE, AS2D_SOUND_JFD_SIOUX, AS2D_SOUND_JFD_SPANISH, AS2D_SOUND_JFD_SUMERIAN, AS2D_SOUND_JFD_SWEDISH, AS2D_SOUND_JFD_TUPI*, AS2D_SOUND_JFD_VIKING, AS2D_SOUND_JFD_ZAPOTEC*, AS2D_SOUND_JFD_ZULU
	
	*Recommended to only use for Mercenary Units, as these have fewer tracks.
*/

--This is an example of support which copies all attributes from an existing civ (i.e. Denmark). For the most part, this is probably all you'll need; just change 'CIVILIZATION_JFD_SCOTLAND' to the
--tag of your custom civ. 
INSERT INTO Civilization_JFD_CultureTypes
        (CivilizationType,        				ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT  'CIVILIZATION_AOI_DERVISH',				ArtDefineTag, CultureType, IdealsTag, SplashScreenTag, SoundtrackTag, 'AS2D_SOUND_JFD_ETHIOPIAN'
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_ARABIA';
------------------------------	
-- Civilizations
------------------------------	
UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Arabic'
WHERE Type = 'CIVILIZATION_AOI_DERVISH'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Islamic');
--==========================================================================================================================
-- JFD's EXPLORATION CONTINUED EXPANDED (6676902b-b907-45f1-8db5-32dcb2135eee)
--==========================================================================================================================
--==========================================================================================================================    
-- JFD's AND POUAKAI's MERCENARIES (a19351c5-c0b3-4b07-8695-4affaa199949)
--==========================================================================================================================
-- Flavors
------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');
------------------------------
-- Leader_Flavors
------------------------------ 
INSERT INTO Leader_Flavors
        (LeaderType,						FlavorType,                 Flavor)
VALUES  ('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_MERCENARY',     5);
--==========================================================================================================================    
-- JFD's RISE TO POWER: PIETY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================    
-- Flavors
------------------------------	
INSERT OR REPLACE INTO Flavors 
		(Type)
VALUES	('FLAVOR_JFD_RELIGIOUS_INTOLERANCE'),
		('FLAVOR_JFD_STATE_RELIGION');
------------------------------
-- Leader_Flavors
------------------------------
INSERT INTO Leader_Flavors
		(LeaderType,						FlavorType,								Flavor)
VALUES	('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		9),
		('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_STATE_RELIGION',			8);
--==========================================================================================================================    
-- JFD's RISE TO POWER: PROSPERITY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================    
-- Civilization_JFD_Currencies
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Currencies (
    CivilizationType                text        REFERENCES Civilizations(Type)  default null,
    CurrencyType                    text                                        default null);
 
INSERT INTO Civilization_JFD_Currencies
        (CivilizationType,                  CurrencyType)
SELECT  'CIVILIZATION_AOI_DERVISH',			CurrencyType
FROM Civilization_JFD_Currencies WHERE CivilizationType = 'CIVILIZATION_ARABIA';    
--==========================================================================================================================    
-- JFD's RISE TO POWER: SOVEREIGNTY (eea66053-7579-481a-bb8d-2f3959b59974)
--==========================================================================================================================
-- Civilization_JFD_Governments
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    LegislatureName                 text                                                        default null,
    OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);
 
--This table determines a variety of things relating to your Government.
--The LegislatureName refers to the name of your Legislature (e.g. the Imperial Diet). 
--The OfficeTitle refers to the title of your Head of Government (if a Const. Monarchy) (e.g. Vizier. Default is Prime Minister)
--GovernmentType and Weight prefer to a Government preference (GOVERNMENT_JFD_MONARCHY or GOVERNMENT_JFD_REPUBLIC) and how strong that preference is.
INSERT INTO Civilization_JFD_Governments
        (CivilizationType,              LegislatureName,						OfficeTitle,						GovernmentType,             Weight)
VALUES  ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_LEGISLATURE_DMS_DERVISH',	'TXT_KEY_JFD_OFFICE_DMS_DERVISH',	'GOVERNMENT_JFD_MONARCHY',  75);
------------------------------------------------------------    
-- Civilization_JFD_HeadsOfGovernment   
------------------------------------------------------------    
CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);
 
--These are the Heads of your Government, which are randomly chosen when a new Legislature is formed.
--The standard number for each civ is 25. However, you may leave this table empty and your civ will call
--from a cultural list (so long as you have Cultural Diversity support).

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,              HeadOfGovernmentName)
VALUES  ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_1'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_2'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_3'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_4'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_5'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_6'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_7'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_8'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_9'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_10'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_11'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_12'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_13'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_14'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_15'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_16'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_17'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_18'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_19'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_20'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_21'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_22'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_23'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_24'),
        ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_JFD_HEAD_OF_GOVERNMENT_TITLE_CIVILIZATION_AOI_DERVISH_25');
------------------------------------------------------------
-- Civilization_JFD_Titles
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 
 
--This lists all the unique titles that a civilization should use instead of a standard one. If left blank, a culture-specific title will be used instead (if CulDiv support).
--The default titles are as follows:
----TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT (Tribe)
----TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER (Chief/Chieftess)
----TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER (Grand Prince)
----TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT (Grand Principality)
----TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER (King/Queen)
----TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT (Kingdom)
----TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER (Emperor/Empress)
----TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT (Empire)
----TXT_KEY_GOVERNMENT_JFD_COMMONWEALTH_TITLE_GOVERNMENT (Commonwealth)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER (Consul)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE (President)
----TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT (Republic)
----TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER (Dictator)
----TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT (Federation)
 
--For 'LEADER' titles, just include the title in the text, e.g. "Pharoah." 
--For 'GOVERNMENT' titles, include a placeholder for your civ's short description, e.g. "Kingdom of {1_CivName}"
--Use 'UseAdjective' when you want the 'GOVERNMENT' title to read (e.g.): "{1_CivAdj} Kingdom" instead of "Kingdom of {1_CivName}"
INSERT INTO Civilization_JFD_Titles
        (CivilizationType,				DefaultTitle,											UniqueTitle)
VALUES  ('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_GOVERNMENT_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_TRIBE_TITLE_LEADER_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_GOVERNMENT_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_PRINCIPALITY_TITLE_LEADER_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_GOVERNMENT_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_MONARCHY_TITLE_LEADER_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_GOVERNMENT_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_EMPIRE_TITLE_LEADER_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_COMMONWEALTH_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_COMMONWEALTH_TITLE_GOVERNMENT_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT',		'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_GOVERNMENT_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER',			'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE',	'TXT_KEY_GOVERNMENT_JFD_REPUBLIC_TITLE_LEADER_LATE_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT',	'TXT_KEY_GOVERNMENT_JFD_FEDERATION_TITLE_GOVERNMENT_DMS_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER',		'TXT_KEY_GOVERNMENT_JFD_DICTATORSHIP_TITLE_LEADER_DMS_DERVISH');
------------------------------------------------------------
-- JFD_PrivyCouncillor_UniqueNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	JFD_PrivyCouncillor_UniqueNames (
	PrivyCouncillorType  				text 										 	default null,
	PolicyType  						text 	REFERENCES Policies(Type) 				default null,
	CivilizationType					text	REFERENCES Civilizations(Type) 			default	null,
	CultureType							text											default	null,
	GovernmentType  					text 	 										default null,
	ReligionType						text	REFERENCES Religions(Type) 				default	null,
	UniqueName							text											default	null);

--This table handles all unique Privy Councillor titles. Note that Chaplain titles will override religion-specific ones.	
INSERT INTO JFD_PrivyCouncillor_UniqueNames	
		(PrivyCouncillorType,				CivilizationType,						UniqueName)
VALUES	('COUNCILLOR_JFD_CHANCELLOR',		'CIVILIZATION_AOI_DERVISH',				'TXT_KEY_COUNCILLOR_JFD_CHANCELLOR_DESC_AOI_DERVISH'),
		('COUNCILLOR_JFD_MARSHAL',			'CIVILIZATION_AOI_DERVISH',				'TXT_KEY_COUNCILLOR_JFD_MARSHAL_DESC_AOI_DERVISH'),
		('COUNCILLOR_JFD_HERALD',			'CIVILIZATION_AOI_DERVISH',				'TXT_KEY_COUNCILLOR_JFD_HERALD_DESC_AOI_DERVISH'),
		('COUNCILLOR_JFD_STEWARD',			'CIVILIZATION_AOI_DERVISH',				'TXT_KEY_COUNCILLOR_JFD_STEWARD_DESC_AOI_DERVISH');
------------------------------------------------------------
-- Civilization_JFD_Politics
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);
 
--This lists all the unique names for a civ's political parties.
--Political Parties are as follows:
----FACTION_JFD_NATIONALIST
----FACTION_JFD_POPULARIST
----PARTY_JFD_BURGHERS
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
VALUES	('CIVILIZATION_AOI_DERVISH',		'FACTION_JFD_NATIONALIST',	'TXT_KEY_JFD_FACTION_JFD_NATIONALIST_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'FACTION_JFD_POPULARIST',	'TXT_KEY_JFD_FACTION_JFD_POPULARIST_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_REVOLUTIONARY',	'TXT_KEY_JFD_PARTY_JFD_REVOLUTIONARY_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_BURGHERS',		'TXT_KEY_JFD_PARTY_JFD_BURGHERS_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_CLERGY',			'TXT_KEY_JFD_PARTY_JFD_CLERGY_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_NOBILITY',		'TXT_KEY_JFD_PARTY_JFD_NOBILITY_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_COMMUNIST',		'TXT_KEY_JFD_PARTY_JFD_COMMUNIST_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_CONSERVATIVE',	'TXT_KEY_JFD_PARTY_JFD_CONSERVATIVE_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_FASCIST',		'TXT_KEY_JFD_PARTY_JFD_FASCIST_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_LIBERAL',		'TXT_KEY_JFD_PARTY_JFD_LIBERAL_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_LIBERTARIAN',	'TXT_KEY_JFD_PARTY_JFD_LIBERTARIAN_AOI_DERVISH'),
		('CIVILIZATION_AOI_DERVISH',		'PARTY_JFD_SOCIALIST',		'TXT_KEY_JFD_PARTY_JFD_SOCIALIST_AOI_DERVISH');
------------------------------------------------------------
-- Flavors
------------------------------------------------------------    
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
		('FLAVOR_JFD_REFORM_LEGAL'),
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
        (LeaderType,						FlavorType,                         Flavor)
VALUES  ('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_REFORM_GOVERNMENT',     8),
		('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_REFORM_LEGAL',			9),
        ('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_REFORM_CULTURE',        3),
        ('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_REFORM_ECONOMIC',       6),
        ('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_REFORM_FOREIGN',        7),
        ('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_REFORM_INDUSTRY',       6),
        ('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_REFORM_MILITARY',       8),
        ('LEADER_AOI_ABDULLAH_HASSAN',		'FLAVOR_JFD_REFORM_RELIGION',       9);
--------------------------------------------------------------------------------------------------------------------------
-- Leader_JFD_Reforms
--------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS 
	Leader_JFD_Reforms (
	LeaderType  												text 	REFERENCES Leaders(Type) 				default	null,
	ReformType													text											default	null);
	
--Although Leader_Flavors will support, the following table will allow you to assign Reforms to leaders that they will be more likely to take. 
--For specific Reforms, see My Games\Sid Meier's Civilization 5\MODS\JFD's Rise to Power\Components\Sovereignty\Core\Sovereignty_Reforms.sql
--==========================================================================================================================
--==========================================================================================================================
--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
CREATE TABLE IF NOT EXISTS JFD_GlobalUserSettings (Type text, Value integer default 1);
--=======================================================================================================================
-- BUILDINGS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Buildings
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings
		(Type, 						TradeRouteRecipientBonus, TradeRouteTargetBonus, BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, Happiness, GoldMaintenance, MinAreaSize, ConquestProb, NeverCapture, Description, 							Help, 									  Strategy,										Civilopedia, 							  ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_US_COLUMN',	TradeRouteRecipientBonus, TradeRouteTargetBonus, BuildingClass, PrereqTech, Cost, SpecialistType, SpecialistCount, FaithCost, 1, GoldMaintenance, MinAreaSize, ConquestProb, 1, 			'TXT_KEY_BUILDING_US_COLUMN', 	'TXT_KEY_BUILDING_US_COLUMN_HELP',  'TXT_KEY_BUILDING_US_COLUMN_STRATEGY',	'TXT_KEY_BUILDING_US_COLUMN_TEXT',  ArtDefineTag, 2, 			   'US_ROME_TRAJAN_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_MONUMENT';
------------------------------------------------------------------------------------------------------------------------
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_US_COLUMN',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_MONUMENT';
------------------------------------------------------------------------------------------------------------------------
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_Flavors
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_US_COLUMN',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_MONUMENT';
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_US_COLUMN', YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_MONUMENT';
------------------------------------------------------------------------------------------------------------------------
-- Building_YieldModifiers
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Building_YieldModifiers
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_US_COLUMN', YieldType, Yield
FROM Building_YieldModifiers WHERE BuildingType = 'BUILDING_MONUMENT';
--------------------------------------------------------------------------------------------------------------------------
-- Dummy_SQL   BUILDING_US_TRAJAN_OWNERSHIP
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO BuildingClasses
        (Type,                                 Description,                             DefaultBuilding,                NoLimit)
VALUES    ('BUILDINGCLASS_ER_TRAJANUADUMMY',    'TXT_KEY_BUILDING_ER_TRAJANUADUMMY',    'BUILDING_ER_TRAJANUADUMMY',    1),
		  ('BUILDINGCLASS_US_TRAJAN_OWNERSHIP',    'TXT_KEY_BUILDING_ER_TRAJANUADUMMY',    'BUILDING_US_TRAJAN_OWNERSHIP',    1),
          ('BUILDINGCLASS_URD_HAPPYTRAJAN',    'TXT_KEY_BUILDING_ER_TRAJANUADUMMY',    'BUILDING_URD_HAPPYTRAJAN',    1);

INSERT INTO Buildings
        (Type,                             BuildingClass,                      PrereqTech,    Cost,     FaithCost,    GreatWorkCount,    PlotCultureCostModifier, PortraitIndex, IconAtlas,    Description,                             Help,                                    NeverCapture,    Happiness,    NukeImmune)
VALUES    ('BUILDING_ER_TRAJANUADUMMY',    'BUILDINGCLASS_ER_TRAJANUADUMMY',        null,        -1,        -1,            -1,                0,                         19,     'BW_ATLAS_1',    'TXT_KEY_BUILDING_ER_TRAJANUADUMMY',    'TXT_KEY_BUILDING_ER_TRAJANUADUMMY_HELP',    1,        0,         1),
		  ('BUILDING_US_TRAJAN_OWNERSHIP',    'BUILDINGCLASS_US_TRAJAN_OWNERSHIP',        null,        -1,        -1,            -1,                0,                         19,     'BW_ATLAS_1',    'TXT_KEY_BUILDING_ER_TRAJANUADUMMY',    'TXT_KEY_BUILDING_ER_TRAJANUADUMMY_HELP',    1,        0,         1),
          ('BUILDING_URD_HAPPYTRAJAN',    'BUILDINGCLASS_ER_TRAJANUADUMMY',        null,        -1,        -1,            -1,                0,                         19,     'BW_ATLAS_1',    'TXT_KEY_BUILDING_ER_TRAJANUADUMMY',    'TXT_KEY_BUILDING_ER_TRAJANUADUMMY_HELP',    1,            1,         1);

INSERT INTO Building_DomainFreeExperiences
        (BuildingType,                     DomainType,     Experience)
VALUES    ('BUILDING_ER_TRAJANUADUMMY',    'DOMAIN_LAND', 1),
        ('BUILDING_ER_TRAJANUADUMMY',    'DOMAIN_SEA',    1),
        ('BUILDING_ER_TRAJANUADUMMY',    'DOMAIN_AIR',    1);
--=======================================================================================================================
-- UNITS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units
		(Type, 						Class, PrereqTech, Combat, Cost, Moves, HurryCostModifier, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, Mechanized, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate, Description, 						Help, 									 Strategy, 									Civilopedia, 							UnitArtInfo, 						UnitFlagAtlas,									 UnitFlagIconOffset,	IconAtlas,									PortraitIndex)
SELECT	'UNIT_US_SINGULARES',	Class, PrereqTech, Combat, Cost, Moves, HurryCostModifier, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, Mechanized, AdvancedStartCost, MinAreaSize, XPValueAttack, XPValueDefense, MoveRate, 'TXT_KEY_UNIT_US_SINGULARES',	'TXT_KEY_UNIT_US_SINGULARES_HELP', 	 'TXT_KEY_UNIT_US_SINGULARES_STRATEGY', 'TXT_KEY_UNIT_US_SINGULARES_TEXT',	'ART_DEF_UNIT_US_SINGULARES',	'US_ROME_TRAJAN_UNIT_FLAG_ATLAS',  0,						'US_ROME_TRAJAN_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes
		(UnitType, 					UnitAIType)
SELECT	'UNIT_US_SINGULARES', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ClassUpgrades
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ClassUpgrades
		(UnitType, 					UnitClassType)
SELECT	'UNIT_US_SINGULARES',	UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors
		(UnitType, 					FlavorType, Flavor)
SELECT	'UNIT_US_SINGULARES', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------
-- Unit_ResourceQuantityRequirements
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_ResourceQuantityRequirements
		(UnitType, 					ResourceType, Cost)
SELECT	'UNIT_US_SINGULARES', 	ResourceType, Cost
FROM Unit_ResourceQuantityRequirements WHERE UnitType = 'UNIT_HORSEMAN';
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts
		(UnitType, 					SelectionSound,	FirstSelectionSound)
SELECT	'UNIT_US_SINGULARES', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_HORSEMAN';
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitPromotions
        (Type,                                    MovesChange,    CombatPercent,    Description,                                 Help,                                                 Sound,                     CannotBeChosen, LostWithUpgrade, PortraitIndex,     IconAtlas,                         PediaType,             PediaEntry)
VALUES    ('PROMOTION_US_SINGULARES',             1,            15,                    'TXT_KEY_PROMOTION_US_SINGULARES',            'TXT_KEY_PROMOTION_US_SINGULARES_HELP',                'AS2D_IF_LEVELUP',         1,                 0,                  59,                 'ABILITY_ATLAS',                 'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_US_SINGULARES');
--=======================================================================================================================
-- LEADERS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leaders
		(Type, 										ArtDefineTag, 							Description, 									Civilopedia, 										 CivilopediaTag, 												IconAtlas, 									PortraitIndex)
VALUES	('LEADER_US_ROME_TRAJAN', 	'JFD_TwoSiciliesFerdinandI_Scene.xml',	'TXT_KEY_LEADER_US_ROME_TRAJAN',	'TXT_KEY_LEADER_US_ROME_TRAJAN_PEDIA', 'TXT_KEY_CIVILOPEDIA_LEADERS_US_ROME_TRAJAN',	'US_ROME_TRAJAN_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 9,
WonderCompetitiveness = 5,
MinorCivCompetitiveness = 4,
Boldness = 9,
DiploBalance = 2,
WarmongerHate = 1,
DenounceWillingness = 2,
DoFWillingness = 1,
Loyalty = 3,
Neediness = 3,
Forgiveness = 1,
Chattiness = 2,
Meanness = 9
WHERE Type = 'LEADER_US_ROME_TRAJAN';
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_MajorCivApproachBiases
		(LeaderType, 								MajorCivApproachType, 				Bias)
VALUES	('LEADER_US_ROME_TRAJAN', 	'MAJOR_CIV_APPROACH_WAR', 			9),
		('LEADER_US_ROME_TRAJAN', 	'MAJOR_CIV_APPROACH_HOSTILE', 		9),
		('LEADER_US_ROME_TRAJAN', 	'MAJOR_CIV_APPROACH_DECEPTIVE',		1),
		('LEADER_US_ROME_TRAJAN', 	'MAJOR_CIV_APPROACH_GUARDED', 		7),
		('LEADER_US_ROME_TRAJAN', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_US_ROME_TRAJAN', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_US_ROME_TRAJAN', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		1);
------------------------------------------------------------------------------------------------------------------------
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_MinorCivApproachBiases
		(LeaderType, 								MinorCivApproachType, 				Bias)
VALUES	('LEADER_US_ROME_TRAJAN', 	'MINOR_CIV_APPROACH_IGNORE', 		2),
		('LEADER_US_ROME_TRAJAN', 	'MINOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_US_ROME_TRAJAN', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	7),
		('LEADER_US_ROME_TRAJAN', 	'MINOR_CIV_APPROACH_CONQUEST', 		9),
		('LEADER_US_ROME_TRAJAN', 	'MINOR_CIV_APPROACH_BULLY', 		6);
------------------------------------------------------------------------------------------------------------------------
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Flavors
		(LeaderType, 								FlavorType, 						Flavor)
VALUES	('LEADER_US_ROME_TRAJAN', 	'FLAVOR_OFFENSE', 					9),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_CITY_DEFENSE', 				2),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_MILITARY_TRAINING', 		9),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_RECON', 					3),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_RANGED', 					7),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_MOBILE', 					9),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_NAVAL', 					5),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_NAVAL_GROWTH', 				6),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_AIR', 						9),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_EXPANSION', 				9),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_GROWTH', 					4),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_INFRASTRUCTURE', 			5),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_GOLD', 						1),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_CULTURE', 					2),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_HAPPINESS', 				1),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_GREAT_PEOPLE', 				2),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_WONDER', 					6),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_RELIGION', 					2),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_DIPLOMACY', 				1),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_NUKE', 						9),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_USE_NUKE', 					9),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_ESPIONAGE', 				2),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		4),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_US_ROME_TRAJAN', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 								ResponseType, 							 			Response, 																	 			Bias)
VALUES 	('LEADER_US_ROME_TRAJAN',		'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_US_ROME_TRAJAN_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_US_ROME_TRAJAN_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_US_ROME_TRAJAN_DEFEATED%', 					 			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_US_ROME_TRAJAN_DOW_GENERIC%', 				 			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_US_ROME_TRAJAN_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_US_ROME_TRAJAN_FIRSTGREETING%', 				 			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_US_ROME_TRAJAN_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_US_ROME_TRAJAN_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_US_ROME_TRAJAN_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_US_ROME_TRAJAN_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_US_ROME_TRAJAN_LUXURY_TRADE%', 		  					500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_US_ROME_TRAJAN_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_US_ROME_TRAJAN_REQUEST%', 		  						500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_US_ROME_TRAJAN_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_US_ROME_TRAJAN_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_WINWAR', 		 							'TXT_KEY_LEADER_US_ROME_TRAJAN_WINWAR%', 					  				500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_US_ROME_TRAJAN_DENOUNCE%', 					  			500),
		('LEADER_US_ROME_TRAJAN',		'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_US_ROME_TRAJAN_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Leader_Traits
		(LeaderType, 								TraitType)
VALUES	('LEADER_US_ROME_TRAJAN', 	'TRAIT_US_ROME_TRAJAN');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Traits
		(Type, 										Description, 									ShortDescription)
VALUES	('TRAIT_US_ROME_TRAJAN', 		'TXT_KEY_TRAIT_US_ROME_TRAJAN',	'TXT_KEY_TRAIT_US_ROME_TRAJAN_SHORT');
--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilizations
		(Type, 											DerivativeCiv,				SoundtrackTag,  MapImage, 								DawnOfManQuote, 										DawnOfManImage,							Description,										ShortDescription,										Adjective,												Civilopedia,										CivilopediaTag,									DefaultPlayerColor,							ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,									PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_JFD_TAL_ITALY',	'Rome', 		'Trajan_Map.dds',	'TXT_KEY_CIV_DAWN_US_ROME_TRAJAN_TEXT',	'Trajan_DoM.dds',	'TXT_KEY_CIV_US_ROME_TRAJAN_DESC', 	'TXT_KEY_CIV_US_ROME_TRAJAN_SHORT_DESC',	'TXT_KEY_CIV_US_ROME_TRAJAN_ADJECTIVE',	'TXT_KEY_CIV_US_ROME_TRAJAN_TEXT_1',  'TXT_KEY_CIV_US_ROME_TRAJAN',		'PLAYERCOLOR_US_ROME_TRAJAN',	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'US_ROME_TRAJAN_ICON_ATLAS',	0,				'US_ROME_TRAJAN_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_ROME';

UPDATE Civilizations
SET DerivativeCiv = 'TXT_KEY_JFD_TAL_ITALY'
WHERE Type = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_CityNames
		(CivilizationType, 								CityName)
VALUES	('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_1'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_2'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_3'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_4'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_5'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_6'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_7'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_8'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_9'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_10'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_11'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_12'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_13'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_14'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_15'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_16'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_17'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_18'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_19'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_20'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_21'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_22'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_CITY_NAME_US_ROME_TRAJAN_23');

INSERT INTO Civilization_CityNames
		(CivilizationType, 									CityName)
SELECT	'CIVILIZATION_US_ROME_TRAJAN', 	CityName
FROM Civilization_CityNames WHERE (CivilizationType = 'CIVILIZATION_ROME');

INSERT INTO Civilization_CityNames
		(CivilizationType, 									CityName)
SELECT	'CIVILIZATION_US_ROME_TRAJAN', 	CityName
FROM Civilization_CityNames WHERE (CivilizationType = 'CIVILIZATION_CARTHAGE');

INSERT INTO Civilization_CityNames
		(CivilizationType, 									CityName)
SELECT	'CIVILIZATION_US_ROME_TRAJAN', 	CityName
FROM Civilization_CityNames WHERE (CivilizationType = 'CIVILIZATION_BYZANTIUM');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeBuildingClasses
		(CivilizationType, 								BuildingClassType)
SELECT	'CIVILIZATION_US_ROME_TRAJAN', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeTechs
		(CivilizationType, 								TechType)
SELECT	'CIVILIZATION_US_ROME_TRAJAN', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_FreeUnits
		(CivilizationType, 								UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_US_ROME_TRAJAN', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_ROME';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Leaders
		(CivilizationType, 								LeaderheadType)
VALUES	('CIVILIZATION_US_ROME_TRAJAN',	'LEADER_US_ROME_TRAJAN');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_BuildingClassOverrides
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType, 								BuildingClassType, 		BuildingType)
VALUES	('CIVILIZATION_US_ROME_TRAJAN',	'BUILDINGCLASS_MONUMENT',	'BUILDING_US_COLUMN');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_UnitClassOverrides
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_UnitClassOverrides
		(CivilizationType, 								UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_US_ROME_TRAJAN',	'UNITCLASS_HORSEMAN',	'UNIT_US_SINGULARES');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Religions
		(CivilizationType, 								ReligionType)
VALUES	('CIVILIZATION_US_ROME_TRAJAN',	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_SpyNames
		(CivilizationType, 								SpyName)
VALUES	('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_0'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_1'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_2'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_3'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_4'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_5'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_6'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_7'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_8'),
		('CIVILIZATION_US_ROME_TRAJAN',	'TXT_KEY_SPY_NAME_US_ROME_TRAJAN_9');
------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Along_Ocean
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 								StartAlongOcean)
VALUES	('CIVILIZATION_US_ROME_TRAJAN',	1);
--=======================================================================================================================
--=======================================================================================================================
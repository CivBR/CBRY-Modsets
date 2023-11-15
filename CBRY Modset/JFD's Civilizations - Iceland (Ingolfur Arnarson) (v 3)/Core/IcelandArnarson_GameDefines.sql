--=======================================================================================================================
-- MASTER TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
INSERT OR REPLACE INTO CustomModOptions(Name, Value) VALUES('EVENTS_UNIT_FOUNDED', 1);
--=======================================================================================================================	
-- BUILDINGS
--=======================================================================================================================		
------------------------------------------------------------------------------------------------------------------------	
-- Buildings
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Buildings 	
		(Type, 						FreeStartEra, BuildingClass, Cost, GoldMaintenance, PrereqTech, GreatWorkSlotType, GreatWorkCount, ConquestProb, MinAreaSize, HurryCostModifier, NeverCapture, Description, 						Help, 										Strategy,										Civilopedia, 							 ArtDefineTag, PortraitIndex, IconAtlas)
SELECT	'BUILDING_JFD_THINGSTEAD',	FreeStartEra, BuildingClass, Cost, GoldMaintenance, PrereqTech, GreatWorkSlotType, GreatWorkCount, ConquestProb, MinAreaSize, HurryCostModifier, 1, 			'TXT_KEY_BUILDING_JFD_THINGSTEAD',	'TXT_KEY_BUILDING_JFD_THINGSTEAD_HELP',		'TXT_KEY_BUILDING_JFD_THINGSTEAD_STRATEGY',		'TXT_KEY_BUILDING_JFD_THINGSTEAD_TEXT',  ArtDefineTag, 4, 			   'JFD_ICELAND_ARNARSON_ICON_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';

UPDATE Buildings
SET AllowsWaterRoutes = 1
WHERE Type = 'BUILDING_JFD_THINGSTEAD';
------------------------------------------------------------------------------------------------------------------------	
-- Building_ClassesNeededInCity
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 				BuildingClassType)
SELECT	'BUILDING_JFD_THINGSTEAD',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_AMPHITHEATER';	
------------------------------------------------------------------------------------------------------------------------	
-- Building_Flavors
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_JFD_THINGSTEAD',	FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_AMPHITHEATER';

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,					Flavor)
VALUES	('BUILDING_JFD_THINGSTEAD',	'FLAVOR_WATER_CONNECTION',	15),
		('BUILDING_JFD_THINGSTEAD',	'FLAVOR_HAPPINESS',			10),
		('BUILDING_JFD_THINGSTEAD',	'FLAVOR_EXPANSION',			20);
------------------------------------------------------------------------------------------------------------------------	
-- Building_YieldChanges
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Building_YieldChanges 	 
		(BuildingType, 				YieldType, Yield)
SELECT	'BUILDING_JFD_THINGSTEAD',	YieldType, Yield
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_AMPHITHEATER';
------------------------------------------------------------------------------------------------------------------------
-- BuildingClasses
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO BuildingClasses
		(Type, 									DefaultBuilding, 					Description)
VALUES	('BUILDINGCLASS_DUMMY_JFD_THINGSTEAD',  'BUILDING_DUMMY_JFD_THINGSTEAD',	'TXT_KEY_BUILDING_DUMMY_JFD_THINGSTEAD');
--------------------------------------------------------------------------------------------------------------------------
-- Buildings
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Buildings 	
		(Type, 						 		BuildingClass, 							Happiness,  GreatWorkCount, Cost, FaithCost, PrereqTech, NeverCapture,	Description, 							 Help)
VALUES	('BUILDING_DUMMY_JFD_THINGSTEAD', 	'BUILDINGCLASS_DUMMY_JFD_THINGSTEAD', 	2,			-1, 			-1,   -1, 		 null, 		 1,				'TXT_KEY_BUILDING_DUMMY_JFD_THINGSTEAD', 'TXT_KEY_BUILDING_DUMMY_JFD_THINGSTEAD_HELP');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- UnitPromotions
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO UnitPromotions 
		(Type, 						LostWithUpgrade,  Description, 					 Help, 								  Sound, 			  CannotBeChosen, PortraitIndex, IconAtlas, 		 PediaType, 		 PediaEntry)
VALUES	('PROMOTION_JFD_SKALD', 	0,				  'TXT_KEY_PROMOTION_JFD_SKALD', 'TXT_KEY_PROMOTION_JFD_SKALD_HELP',  'AS2D_IF_LEVELUP',  1, 			  59, 			 'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SKALD');
------------------------------------------------------------------------------------------------------------------------	
-- Units
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Units 	
		(Type, 				Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, AdvancedStartCost, WorkRate, CombatLimit, BaseCultureTurnsToCount, MoveRate, Description, 				Help, 							 Strategy, 							 Civilopedia, 					UnitArtInfo, 				UnitFlagAtlas,							 UnitFlagIconOffset,	IconAtlas,							PortraitIndex)
SELECT	'UNIT_JFD_SKALD',	Class, Cost, Moves, CivilianAttackPriority, Special, Domain, DefaultUnitAI, AdvancedStartCost, WorkRate, CombatLimit, BaseCultureTurnsToCount, MoveRate, 'TXT_KEY_UNIT_JFD_SKALD',	'TXT_KEY_UNIT_JFD_SKALD_HELP', 	 'TXT_KEY_UNIT_JFD_SKALD_STRATEGY',  'TXT_KEY_UNIT_JFD_SKALD_TEXT',	'ART_DEF_UNIT_JFD_SKALD',	'JFD_ICELAND_ARNARSON_UNIT_FLAG_ATLAS',  0,						'JFD_ICELAND_ARNARSON_ICON_ATLAS',	3
FROM Units WHERE Type = 'UNIT_WRITER';	

UPDATE Units
SET FoundAbroad = 1
WHERE Type = 'UNIT_JFD_SKALD';
------------------------------------------------------------------------------------------------------------------------
-- Unit_AITypes
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_SKALD', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_WRITER';

INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_SKALD', 		UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_SETTLER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_Flavors
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_SKALD', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_WRITER';

INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_SKALD', 		FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_SETTLER';
------------------------------------------------------------------------------------------------------------------------
-- Unit_FreePromotions
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_SKALD', 		PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_WRITER';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_SKALD',		'PROMOTION_JFD_SKALD'),
		('UNIT_JFD_SKALD',		'PROMOTION_ALLWATER_EMBARKATION'),
		('UNIT_JFD_SKALD',		'PROMOTION_DEFENSIVE_EMBARKATION');		
------------------------------------------------------------------------------------------------------------------------
-- Unit_UniqueNames
------------------------------------------------------------------------------------------------------------------------
INSERT INTO Unit_UniqueNames 	
		(UnitType, 				UniqueName,								GreatWorkType)
VALUES	('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_1',		'GREAT_WORK_SKALD_1'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_2',		'GREAT_WORK_SKALD_2'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_3',		'GREAT_WORK_SKALD_3'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_4',		'GREAT_WORK_SKALD_4'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_5',		'GREAT_WORK_SKALD_5'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_6',		'GREAT_WORK_SKALD_6'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_7',		'GREAT_WORK_SKALD_7'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_8',		'GREAT_WORK_SKALD_8'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_9',		'GREAT_WORK_SKALD_9'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_10',		'GREAT_WORK_SKALD_10'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_11',		'GREAT_WORK_SKALD_11'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_12',		'GREAT_WORK_SKALD_12'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_13',		'GREAT_WORK_SKALD_13'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_14',		'GREAT_WORK_SKALD_14'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_15',		'GREAT_WORK_SKALD_15'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_16',		'GREAT_WORK_SKALD_16'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_17',		'GREAT_WORK_SKALD_17'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_18',		'GREAT_WORK_SKALD_18'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_19',		'GREAT_WORK_SKALD_19'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_20',		'GREAT_WORK_SKALD_20'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_21',		'GREAT_WORK_SKALD_21'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_22',		'GREAT_WORK_SKALD_22'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_23',		'GREAT_WORK_SKALD_23'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_24',		'GREAT_WORK_SKALD_24'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_25',		'GREAT_WORK_SKALD_25'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_26',		'GREAT_WORK_SKALD_26'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_27',		'GREAT_WORK_SKALD_27'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_28',		'GREAT_WORK_SKALD_28'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_29',		'GREAT_WORK_SKALD_29'),
		('UNIT_JFD_SKALD',		'TXT_KEY_JFD_SKALD_UNIQUE_NAME_30',		'GREAT_WORK_SKALD_30');	
------------------------------------------------------------------------------------------------------------------------
-- UnitGameplay2DScripts
------------------------------------------------------------------------------------------------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SKALD', 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_WRITER';		
------------------------------------------------------------------------------------------------------------------------	
-- GreatWorks
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO GreatWorks 
		(Type, 					GreatWorkClassType,			Description,								Quote,												Audio,							Image)
VALUES	('GREAT_WORK_SKALD_1',	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_1',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_1',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_2',	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_2',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_2',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_3',	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_3',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_3',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_4',	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_4',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_4',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_5',	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_5',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_5',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_6',	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_6',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_6',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_7',	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_7',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_7',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_8',	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_8',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_8',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_9',	'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_9',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_9',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_10', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_10',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_10',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_11', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_11',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_11',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_12', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_12',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_12',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_13', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_13',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_13',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_14', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_14',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_14',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_15', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_15',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_15',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_16', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_16',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_16',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_17', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_17',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_17',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_18', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_18',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_18',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_19', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_19',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_19',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_20', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_20',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_20',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_21', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_21',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_21',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_22', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_22',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_22',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_23', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_23',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_23',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_24', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_24',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_24',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_25', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_25',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_25',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_26', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_26',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_26',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_27', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_27',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_27',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_28', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_28',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_28',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_29', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_29',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_29',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds'),
		('GREAT_WORK_SKALD_30', 'GREAT_WORK_LITERATURE',	'TXT_KEY_GREAT_WORK_SKALD_GREAT_WORK_30',	'TXT_KEY_GREAT_WORK_QUOTE_SKALD_GREAT_WORK_30',		'AS2D_SOUND_JFD_SKALD_WRITING',	'GreatWriter_Background.dds');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Leaders 
		(Type, 								Description, 							Civilopedia, 									CivilopediaTag, 										ArtDefineTag, 						IconAtlas, 							PortraitIndex)
VALUES	('LEADER_JFD_ICELAND_ARNARSON', 	'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON', 	'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_ICELAND_ARNARSON', 	'JFD_IcelandArnarson_Scene.xml',	'JFD_ICELAND_ARNARSON_ICON_ATLAS', 	1);

UPDATE Leaders
SET VictoryCompetitiveness = 6,
WonderCompetitiveness = 3,
MinorCivCompetitiveness = 4,
Boldness = 7,
DiploBalance = 5,
WarmongerHate = 2,
DenounceWillingness = 3,
DoFWillingness = 4,
Loyalty = 4,
Neediness = 3,
Forgiveness = 5,
Chattiness = 2,
Meanness = 4
WHERE Type = 'LEADER_JFD_ICELAND_ARNARSON';	
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ICELAND_ARNARSON', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MAJOR_CIV_APPROACH_HOSTILE', 		6),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MAJOR_CIV_APPROACH_AFRAID', 		3),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_MajorCivApproachBiases
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_ICELAND_ARNARSON', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MINOR_CIV_APPROACH_CONQUEST', 		4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'MINOR_CIV_APPROACH_BULLY', 		6);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Flavors
------------------------------------------------------------------------------------------------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 						FlavorType, 						Flavor)
VALUES	('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_OFFENSE', 					6),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_DEFENSE', 					3),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_CITY_DEFENSE', 				4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_MILITARY_TRAINING', 		5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_RECON', 					6),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_RANGED', 					5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_MOBILE', 					4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_NAVAL', 					6),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_NAVAL_RECON', 				7),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_NAVAL_GROWTH', 				4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_AIR', 						2),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_EXPANSION', 				8),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_GROWTH', 					6),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_PRODUCTION', 				4),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_GOLD', 						5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_SCIENCE', 					5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_CULTURE', 					7),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_HAPPINESS', 				7),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_GREAT_PEOPLE', 				7),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_WONDER', 					3),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_RELIGION', 					3),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_DIPLOMACY', 				3),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_SPACESHIP', 				5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_WATER_CONNECTION', 			6),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_NUKE', 						5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_ESPIONAGE', 				3),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_AIRLIFT', 					5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_ICELAND_ARNARSON', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------------------------------------------------------------------------------------------------
-- Diplomacy_Responses
--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Diplomacy_Responses
		(LeaderType, 						ResponseType, 							 			Response, 																	 	Bias)
VALUES 	('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_AI_DOF_BACKSTAB', 			 			'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_DENOUNCE_FRIEND%', 			 			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_ATTACKED_HOSTILE', 			 			'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_ATTACKED_HOSTILE%', 			 			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_DEFEATED', 					 			'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_DEFEATED%', 					 			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_DOW_GENERIC', 				 			'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_DOW_GENERIC%', 				 			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_EXPANSION_SERIOUS_WARNING', 				'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_EXPANSION_SERIOUS_WARNING%', 	 			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_FIRST_GREETING', 				 			'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_FIRSTGREETING%', 				 			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_GREETING_HOSTILE_HELLO', 					'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_GREETING_HOSTILE_HELLO%', 		 			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_GREETING_NEUTRAL_HELLO', 					'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_GREETING_NEUTRAL_HELLO%', 		 			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_GREETING_POLITE_HELLO', 					'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_GREETING_POLITE_HELLO%', 		 			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_HOSTILE_AGGRESSIVE_MILITARY_WARNING', 	'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_HOSTILE_AGGRESSIVE_MILITARY_WARNING%', 	500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_LUXURY_TRADE', 							'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_LUXURY_TRADE%', 		  					500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_OPEN_BORDERS_EXCHANGE', 					'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_OPEN_BORDERS_EXCHANGE%', 		  			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_REQUEST', 								'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_REQUEST%', 		  						500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_TOO_SOON_NO_PEACE', 			 			'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_TOO_SOON_NO_PEACE%', 			  			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_RESPONSE_TO_BEING_DENOUNCED',  			'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_RESPONSE_TO_BEING_DENOUNCED%',   			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_WINWAR', 		 							'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_WINWAR%', 					  				500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_WORK_AGAINST_SOMEONE', 		 			'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_DENOUNCE%', 					  			500),
		('LEADER_JFD_ICELAND_ARNARSON',		'RESPONSE_WORK_WITH_US', 				 			'TXT_KEY_LEADER_JFD_ICELAND_ARNARSON_DEC_FRIENDSHIP%', 			  	  			500);
------------------------------------------------------------------------------------------------------------------------	
-- Leader_Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_JFD_ICELAND_ARNARSON', 	'TRAIT_JFD_ICELAND_ARNARSON');
------------------------------------------------------------------------------------------------------------------------
-- Traits
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Traits 
		(Type, 								Description, 								ShortDescription)
VALUES	('TRAIT_JFD_ICELAND_ARNARSON',		'TXT_KEY_TRAIT_JFD_ICELAND_ARNARSON',		'TXT_KEY_TRAIT_JFD_ICELAND_ARNARSON_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Civilizations
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,				SoundtrackTag,  MapImage, 							DawnOfManQuote, 								DawnOfManImage,					Description,								ShortDescription,								Adjective,										Civilopedia,												CivilopediaTag,										DefaultPlayerColor,					 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,							PortraitIndex,	AlphaIconAtlas)
SELECT	'CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_JFD_TAL_ICELAND',	'Denmark', 		'JFD_MapIcelandArnarson512.dds',	'TXT_KEY_CIV_DAWN_JFD_ICELAND_ARNARSON_TEXT',	'JFD_DOM_IcelandArnarson.dds',	'TXT_KEY_CIV_JFD_ICELAND_ARNARSON_DESC', 	'TXT_KEY_CIV_JFD_ICELAND_ARNARSON_SHORT_DESC',	'TXT_KEY_CIV_JFD_ICELAND_ARNARSON_ADJECTIVE',	'TXT_KEY_CIVILOPEDIA_CIVS_JFD_ICELAND_ARNARSON_TEXT_1',		'TXT_KEY_CIVILOPEDIA_CIVS_JFD_ICELAND_ARNARSON',	 'PLAYERCOLOR_JFD_ICELAND_ARNARSON',	 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_ICELAND_ARNARSON_ICON_ATLAS',	0,				'JFD_ICELAND_ARNARSON_ALPHA_ATLAS'
FROM Civilizations WHERE Type = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_CityNames
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_1'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_2'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_3'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_4'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_5'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_6'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_7'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_8'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_9'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_10'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_11'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_12'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_13'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_14'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_15'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_16'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_17'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_18'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_19'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_20'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_21'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_22'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_23'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_24'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_25'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_26'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_27'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_28'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_29'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'TXT_KEY_CITY_NAME_JFD_ICELAND_ARNARSON_30');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeBuildingClasses
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_ICELAND_ARNARSON',	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeTechs
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_ICELAND_ARNARSON',	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_FreeUnits
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_FreeUnits	
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_ICELAND_ARNARSON',	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_GERMANY';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Leaders
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON',	'LEADER_JFD_ICELAND_ARNARSON');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_UnitClassOverrides 
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON',	'UNITCLASS_WRITER',				'UNIT_JFD_SKALD');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_BuildingClassOverrides
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 						BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON',	'BUILDINGCLASS_AMPHITHEATER',	'BUILDING_JFD_THINGSTEAD');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Religions
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Religions 
		(CivilizationType, 						ReligionType)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'RELIGION_CHRISTIANITY');
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_SpyNames
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_0'),	
		('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_1'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_2'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_3'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_4'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_5'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_6'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_7'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_8'),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',	'TXT_KEY_SPY_NAME_JFD_ICELAND_ARNARSON_9');
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Along_Ocean
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON', 	1);
--------------------------------------------------------------------------------------------------------------------------
-- Civilization_Start_Region_Priority
--------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Civilization_Start_Region_Priority 
		(CivilizationType, 						RegionType)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON', 	'REGION_TUNDRA');
--==========================================================================================================================
--==========================================================================================================================
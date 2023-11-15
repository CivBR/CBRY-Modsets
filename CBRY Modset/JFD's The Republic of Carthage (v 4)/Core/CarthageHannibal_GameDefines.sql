--==========================================================================================================================
-- BUILDING CLASSES
--==========================================================================================================================
-- BuildingClasses
--------------------------------
INSERT INTO BuildingClasses
		(Type,							DefaultBuilding)
VALUES	('BUILDINGCLASS_JFD_CARTHAGE',	'TXT_KEY_BUILDING_JFD_CARTHAGE_HANNIBAL_DESC');
--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================
-- Buildings
------------------------------	
INSERT INTO Buildings
		(Type, 								Cost, 	FaithCost, 	GreatWorkCount,	 BuildingClass, 				Description, 									Help, 											NukeImmune, NeverCapture)
VALUES	('BUILDING_JFD_CARTHAGE_HANNIBAL',	-1,		-1,			-1,				 'BUILDINGCLASS_JFD_CARTHAGE',	'TXT_KEY_BUILDING_JFD_CARTHAGE_HANNIBAL_DESC',	'TXT_KEY_BUILDING_JFD_CARTHAGE_HANNIBAL_HELP', 	1,			1);
--------------------------------
-- Building_YieldChanges
--------------------------------
INSERT INTO Building_YieldChanges
		(BuildingType,						YieldType,			Yield)
VALUES	('BUILDING_JFD_CARTHAGE_HANNIBAL',	'YIELD_PRODUCTION',	1);
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
		(Type, 								Description, 									Help, 												Sound, 				IgnoreZoC,  CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_HUNDRED_AND_FOUR',	'TXT_KEY_PROMOTION_JFD_HUNDRED_AND_FOUR',		'TXT_KEY_PROMOTION_JFD_HUNDRED_AND_FOUR_HELP', 		'AS2D_IF_LEVELUP',	0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_HUNDRED_AND_FOUR'),
		('PROMOTION_JFD_SHOPHET',			'TXT_KEY_PROMOTION_JFD_SHOPHET',				'TXT_KEY_PROMOTION_JFD_SHOPHET_HELP', 				'AS2D_IF_LEVELUP',	0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SHOPHET'),
		('PROMOTION_JFD_SHOPHET_ADMIRAL',	'TXT_KEY_PROMOTION_JFD_SHOPHET_ADMIRAL',		'TXT_KEY_PROMOTION_JFD_SHOPHET_ADMIRAL_HELP', 		'AS2D_IF_LEVELUP',	0, 			1, 				48, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SHOPHET_ADMIRAL'),
		('PROMOTION_JFD_SHOPHET_GENERAL',	'TXT_KEY_PROMOTION_JFD_SHOPHET_GENERAL',		'TXT_KEY_PROMOTION_JFD_SHOPHET_GENERAL_HELP', 		'AS2D_IF_LEVELUP',	0, 			1, 				48, 			'PROMOTION_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SHOPHET_GENERAL'),
		('PROMOTION_JFD_SHOPHET_ZOC',		'TXT_KEY_PROMOTION_JFD_SHOPHET_ZOC',			'TXT_KEY_PROMOTION_JFD_SHOPHET_ZOC_HELP',			'AS2D_IF_LEVELUP',	1, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_SHOPHET_ZOC');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
------------------------------	
INSERT INTO Units 	
		(Type, 				Class, Cost, Moves, Special, MoveAfterPurchase, Domain, DefaultUnitAI, Description,					Civilopedia,						Strategy,								Help,								AdvancedStartCost,	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, UnitArtInfo,  				 UnitFlagIconOffset,	UnitFlagAtlas,					MoveRate, PortraitIndex, IconAtlas)
SELECT	'UNIT_JFD_SHOPHET',	Class, Cost, Moves, Special, MoveAfterPurchase,	Domain, DefaultUnitAI, 'TXT_KEY_UNIT_JFD_SHOPHET',	'TXT_KEY_UNIT_JFD_SHOPHET_TEXT',	'TXT_KEY_UNIT_JFD_SHOPHET_STRATEGY',	'TXT_KEY_UNIT_JFD_SHOPHET_HELP',	AdvancedStartCost, 	WorkRate, CombatLimit, DontShowYields, UnitArtInfoEraVariation, 'ART_DEF_UNIT_JFD_SHOPHET',  0,					'JFD_UNIT_FLAG_SHOPHET_ATLAS',	MoveRate, 2, 			 'JFD_CARTHAGE_HANNIBAL_ATLAS'
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT	'UNIT_JFD_SHOPHET', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_GREAT_GENERAL';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	'UNIT_JFD_SHOPHET', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType, Flavor)
SELECT	'UNIT_JFD_SHOPHET', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_GREAT_GENERAL';
--------------------------------
-- Unit_Builds
--------------------------------
INSERT INTO Unit_Builds 	
		(UnitType, 				BuildType)
VALUES	('UNIT_JFD_SHOPHET', 	'BUILD_CITADEL');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	'UNIT_JFD_SHOPHET', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_GREAT_GENERAL';

INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
VALUES	('UNIT_JFD_SHOPHET', 	'PROMOTION_JFD_SHOPHET_GENERAL'),
		('UNIT_JFD_SHOPHET', 	'PROMOTION_JFD_SHOPHET');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
		(UnitType, 				UniqueName)
VALUES	('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_1'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_2'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_3'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_4'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_5'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_6'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_7'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_8'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_9'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_10'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_11'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_12'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_13'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_14'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_15'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_16'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_17'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_18'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_19'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_20'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_21'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_22'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_23'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_24'),
		('UNIT_JFD_SHOPHET',	'TXT_KEY_GREAT_PERSON_JFD_SHOPHET_25');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 						PortraitIndex)
VALUES	('LEADER_JFD_HANNIBAL', 	'TXT_KEY_LEADER_JFD_HANNIBAL', 		'TXT_KEY_LEADER_JFD_HANNIBAL_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_HANNIBAL', 	'Hannibal_Scene.xml',	8, 						2, 						3, 							7, 			6, 				4, 				4, 						2, 				6, 			2, 			4, 				2, 			3, 			'JFD_CARTHAGE_HANNIBAL_ATLAS',	1);	
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_WAR', 			6),
		('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_HOSTILE', 		4),
		('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_DECEPTIVE', 	1),
		('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_GUARDED', 		1),
		('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_AFRAID', 		2),
		('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
		('LEADER_JFD_HANNIBAL', 	'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
		('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_CONQUEST', 		6),
		('LEADER_JFD_HANNIBAL', 	'MINOR_CIV_APPROACH_BULLY', 		4);
--------------------------------	
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_JFD_HANNIBAL', 	'FLAVOR_OFFENSE', 					7),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_DEFENSE', 					6),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_CITY_DEFENSE', 				6),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_MILITARY_TRAINING', 		8),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_RECON', 					4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_RANGED', 					3),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_MOBILE', 					5),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_NAVAL', 					6),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_NAVAL_GROWTH', 				5),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_AIR', 						4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_EXPANSION', 				5),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_GROWTH', 					3),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_TILE_IMPROVEMENT', 			4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_INFRASTRUCTURE', 			4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_PRODUCTION', 				8),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_GOLD', 						4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_SCIENCE', 					3),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_CULTURE', 					4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_HAPPINESS', 				4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_WONDER', 					2),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_RELIGION', 					2),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_DIPLOMACY', 				2),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_SPACESHIP', 				2),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_WATER_CONNECTION', 			4),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_NUKE', 						2),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_USE_NUKE', 					2),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_ESPIONAGE', 				2),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_AIRLIFT', 					2),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_ARCHAEOLOGY', 				5),
		('LEADER_JFD_HANNIBAL', 	'FLAVOR_AIR_CARRIER', 				5);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_JFD_HANNIBAL', 	'TRAIT_JFD_CARTHAGE_HANNIBAL');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							CrossesMountainsAfterGreatGeneral,	Description, 							ShortDescription)
VALUES	('TRAIT_JFD_CARTHAGE_HANNIBAL', 1,									'TXT_KEY_TRAIT_JFD_CARTHAGE_HANNIBAL', 	'TXT_KEY_TRAIT_JFD_CARTHAGE_HANNIBAL_SHORT');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Trait_FreePromotionUnitCombats
		(TraitType,						UnitCombatType, PromotionType)
SELECT	'TRAIT_JFD_CARTHAGE_HANNIBAL',	Type,			'PROMOTION_JFD_HUNDRED_AND_FOUR'
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_ARMOR', 'UNITCOMBAT_RECON', 'UNITCOMBAT_ARCHER', 'UNITCOMBAT_MELEE', 'UNITCOMBAT_GUN', 'UNITCOMBAT_MOUNTED');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
		(Type, 									DerivativeCiv,			 Description, ShortDescription, Adjective,									   Civilopedia, CivilopediaTag, DefaultPlayerColor,					 ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,						PortraitIndex,	AlphaIconAtlas,						 SoundtrackTag,  MapImage, 						DawnOfManQuote, 						DawnOfManImage)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	'CIVILIZATION_CARTHAGE', Description, ShortDescription, 'TXT_KEY_CIV_JFD_CARTHAGE_HANNIBAL_ADJECTIVE', Civilopedia, CivilopediaTag, 'PLAYERCOLOR_JFD_CARTHAGE_HANNIBAL', ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, 'JFD_CARTHAGE_HANNIBAL_ATLAS',	0,				'JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 'Carthage', 	 'MapCarthageHannibal512.dds',	'TXT_KEY_CIV5_DOM_JFD_HANNIBAL_TEXT',	'DOM_Hannibal.dds'
FROM Civilizations WHERE Type = 'CIVILIZATION_CARTHAGE';
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames 
		(CivilizationType, 						CityName)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 	CityName
FROM Civilization_CityNames WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 						BuildingClassType)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
--------------------------------		
-- Civilization_FreeTechs
--------------------------------			
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 						TechType)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 	TechType
FROM Civilization_FreeTechs WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 						UnitClassType, Count, UnitAIType)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
--------------------------------	
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
		(CivilizationType, 						LeaderheadType)
VALUES	('CIVILIZATION_JFD_CARTHAGE_HANNIBAL',	'LEADER_JFD_HANNIBAL');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------		
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 						UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 	'UNITCLASS_HORSEMAN', 		'UNIT_CARTHAGINIAN_FOREST_ELEPHANT'),
		('CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_SHOPHET');
--------------------------------	
-- Civilization_Religions
--------------------------------			
INSERT INTO Civilization_Religions
		(CivilizationType, 						ReligionType)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 	ReligionType
FROM Civilization_Religions WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
--------------------------------	
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 						SpyName)
SELECT	'CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 	SpyName
FROM Civilization_SpyNames WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
--------------------------------	
-- Civilization_Start_Along_Ocean
--------------------------------			
INSERT INTO Civilization_Start_Along_Ocean
		(CivilizationType, 						StartAlongOcean)
VALUES	('CIVILIZATION_JFD_CARTHAGE_HANNIBAL', 	1);
--==========================================================================================================================
--==========================================================================================================================
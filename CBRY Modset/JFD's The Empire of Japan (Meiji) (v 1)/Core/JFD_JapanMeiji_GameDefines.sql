--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
--------------------------------
INSERT INTO BuildingClasses 	
			(Type, 								DefaultBuilding, 									Description)
VALUES		('BUILDINGCLASS_JFD_JAPAN_MEIJI',	'BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION',	'TXT_KEY_BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
			(Type, 						 						BuildingClass, 						GreatWorkCount, Cost,	FaithCost,	NeverCapture,	 Description, 												Help)
VALUES		('BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION', 	'BUILDINGCLASS_JFD_JAPAN_MEIJI',	-1, 			-1,		-1, 		1,				'TXT_KEY_BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION', 	'TXT_KEY_BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION_HELP'),
			('BUILDING_JFD_DAIMYO_MELEE_BONUSES', 				'BUILDINGCLASS_JFD_JAPAN_MEIJI',	-1, 			-1,		-1, 		1,				'TXT_KEY_BUILDING_JFD_DAIMYO_MELEE_BONUSES', 				'TXT_KEY_BUILDING_JFD_DAIMYO_MELEE_BONUSES_HELP');
--------------------------------	
-- Building_YieldModifiers
--------------------------------	
INSERT INTO Building_YieldModifiers 	
			(BuildingType, 										YieldType,				Yield)
VALUES		('BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION',	'YIELD_PRODUCTION',		20);
--------------------------------	
-- Building_UnitCombatFreeExperiences
--------------------------------	
INSERT INTO Building_UnitCombatFreeExperiences 	
			(BuildingType, 								UnitCombatType,			Experience)
VALUES		('BUILDING_JFD_DAIMYO_MELEE_BONUSES',		'UNITCOMBAT_MELEE',		10);
--------------------------------	
-- Building_UnitCombatProductionModifier
--------------------------------	
INSERT INTO Building_UnitCombatProductionModifiers
			(BuildingType, 								UnitCombatType,			Modifier)
VALUES		('BUILDING_JFD_DAIMYO_MELEE_BONUSES',		'UNITCOMBAT_MELEE',		15);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 		VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_MEIJI', 		'TXT_KEY_LEADER_JFD_MEIJI', 		'TXT_KEY_LEADER_JFD_MEIJI_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_MEIJI', 	'Meiji_Scene.xml',	6, 						2, 						2, 							2, 			8, 				6, 				4, 						4, 				6, 			3, 			6, 				3, 			3, 			'JFD_JAPAN_MEIJI_ATLAS',	1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_MEIJI', 		'MAJOR_CIV_APPROACH_WAR', 			5),
			('LEADER_JFD_MEIJI', 		'MAJOR_CIV_APPROACH_HOSTILE', 		3),
			('LEADER_JFD_MEIJI', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	5),
			('LEADER_JFD_MEIJI', 		'MAJOR_CIV_APPROACH_GUARDED', 		7),
			('LEADER_JFD_MEIJI', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
			('LEADER_JFD_MEIJI', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JFD_MEIJI', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------					
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_MEIJI', 		'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_JFD_MEIJI', 		'MINOR_CIV_APPROACH_FRIENDLY', 		3),
			('LEADER_JFD_MEIJI', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	4),
			('LEADER_JFD_MEIJI', 		'MINOR_CIV_APPROACH_CONQUEST', 		4),
			('LEADER_JFD_MEIJI', 		'MINOR_CIV_APPROACH_BULLY', 		2);
--------------------------------
-- Leader_Flavors
--------------------------------						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_JFD_MEIJI', 		'FLAVOR_OFFENSE', 					5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_DEFENSE', 					4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_CITY_DEFENSE', 				3),
			('LEADER_JFD_MEIJI', 		'FLAVOR_MILITARY_TRAINING', 		6),
			('LEADER_JFD_MEIJI', 		'FLAVOR_RECON', 					4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_RANGED', 					4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_MOBILE', 					3),
			('LEADER_JFD_MEIJI', 		'FLAVOR_NAVAL', 					6),
			('LEADER_JFD_MEIJI', 		'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_NAVAL_GROWTH', 				6),
			('LEADER_JFD_MEIJI', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_AIR', 						3),
			('LEADER_JFD_MEIJI', 		'FLAVOR_EXPANSION', 				5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_GROWTH', 					5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_TILE_IMPROVEMENT', 			4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_INFRASTRUCTURE', 			6),
			('LEADER_JFD_MEIJI', 		'FLAVOR_PRODUCTION', 				8),
			('LEADER_JFD_MEIJI', 		'FLAVOR_GOLD', 						7),
			('LEADER_JFD_MEIJI', 		'FLAVOR_SCIENCE', 					4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_CULTURE', 					6),
			('LEADER_JFD_MEIJI', 		'FLAVOR_HAPPINESS', 				4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_GREAT_PEOPLE', 				4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_WONDER', 					3),
			('LEADER_JFD_MEIJI', 		'FLAVOR_RELIGION', 					5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_DIPLOMACY', 				3),
			('LEADER_JFD_MEIJI', 		'FLAVOR_SPACESHIP', 				4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_WATER_CONNECTION', 			4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_NUKE', 						2),
			('LEADER_JFD_MEIJI', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_MEIJI', 		'FLAVOR_ESPIONAGE', 				4),
			('LEADER_JFD_MEIJI', 		'FLAVOR_AIRLIFT', 					5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_MEIJI', 		'FLAVOR_AIR_CARRIER', 				5);
--------------------------------
-- Leader_Traits
--------------------------------					
INSERT INTO Leader_Traits 
			(LeaderType, 				TraitType)
VALUES		('LEADER_JFD_MEIJI', 		'TRAIT_JFD_JAPAN_MEIJI');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)
VALUES		('TRAIT_JFD_JAPAN_MEIJI', 	'TXT_KEY_TRAIT_JFD_JAPAN_MEIJI', 	'TXT_KEY_TRAIT_JFD_JAPAN_MEIJI_SHORT');	
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
			(Type, 						Description, 						Help, 									Sound, 				FriendlyLandsModifier,	CannotBeChosen, PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_JFD_DAIMYO', 	'TXT_KEY_PROMOTION_JFD_DAIMYO', 	'TXT_KEY_PROMOTION_JFD_DAIMYO_HELP', 	'AS2D_IF_LEVELUP', 	0,						1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_DAIMYO'),
			('PROMOTION_JFD_MIKASA', 	'TXT_KEY_PROMOTION_JFD_MIKASA', 	'TXT_KEY_PROMOTION_JFD_MIKASA_HELP', 	'AS2D_IF_LEVELUP', 	25,						1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_MIKASA');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------	
INSERT INTO Units 	
			(Type, 					GoldenAgeTurns, Special, Class, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, WorkRate, Domain, DefaultUnitAI, Description, 					Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, UnitArtInfo, 				 UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		('UNIT_JFD_DAIMYO'), 	8,				Special, Class, Combat, Cost, FaithCost, RequiresFaithPurchaseEnabled, Moves, HurryCostModifier, WorkRate, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_JFD_DAIMYO'), 	('TXT_KEY_UNIT_JFD_DAIMYO_TEXT'), 	('TXT_KEY_UNIT_JFD_DAIMYO_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_DAIMYO'), 	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfoEraVariation, ('ART_DEF_UNIT_JFD_DAIMYO'), 0,					 ('JFD_UNIT_FLAG_DAIMYO_ATLAS'),	2, 				('JFD_JAPAN_MEIJI_ATLAS'),	MoveRate
FROM Units WHERE Type = 'UNIT_GREAT_GENERAL';

INSERT INTO Units 	
			(Type, 					PrereqTech,					Class, Combat,	RangedCombat, CombatClass, Cost, Moves, Range, Domain, DefaultUnitAI,	Description, 					Civilopedia, 						Strategy, 								Help, 								Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, UnitArtInfo, 				 UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas,					MoveRate)
SELECT		('UNIT_JFD_MIKASA'),	('TECH_REPLACEABLE_PARTS'),	Class, Combat,	RangedCombat, CombatClass, Cost, Moves, Range, Domain, DefaultUnitAI,	('TXT_KEY_UNIT_JFD_MIKASA'), 	('TXT_KEY_UNIT_JFD_MIKASA_TEXT'), 	('TXT_KEY_UNIT_JFD_MIKASA_STRATEGY'), 	('TXT_KEY_UNIT_HELP_JFD_MIKASA'), 	Pillage, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, AdvancedStartCost, RangedCombatLimit, CombatLimit, XPValueDefense, ('ART_DEF_UNIT_JFD_MIKASA'), 0,					 ('JFD_UNIT_FLAG_MIKASA_ATLAS'),	3, 				('JFD_JAPAN_MEIJI_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_BATTLESHIP');	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_DAIMYO'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_GENERAL');	

INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 				SelectionSound, FirstSelectionSound)
SELECT		('UNIT_JFD_MIKASA'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_BATTLESHIP');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_DAIMYO'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_GENERAL');	

INSERT INTO Unit_AITypes 	
			(UnitType, 				UnitAIType)
SELECT		('UNIT_JFD_MIKASA'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 				ResourceType)
SELECT		('UNIT_JFD_MIKASA'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_DAIMYO'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_Flavors 	
			(UnitType, 				FlavorType, Flavor)
SELECT		('UNIT_JFD_MIKASA'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------
-- Unit_Builds
--------------------------------
INSERT INTO Unit_Builds 	
			(UnitType, 				BuildType)
SELECT		('UNIT_JFD_DAIMYO'), 	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_GREAT_GENERAL');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 				UnitClassType)
SELECT		('UNIT_JFD_MIKASA'), 	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_DAIMYO'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_GENERAL');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
VALUES		('UNIT_JFD_DAIMYO', 	'PROMOTION_JFD_DAIMYO');

INSERT INTO Unit_FreePromotions 	
			(UnitType, 				PromotionType)
SELECT		('UNIT_JFD_MIKASA'), 	PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_BATTLESHIP');
--------------------------------
-- Unit_UniqueNames
--------------------------------
INSERT INTO Unit_UniqueNames 
			(UnitType, 				UniqueName)
VALUES		('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_1'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_2'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_3'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_4'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_5'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_6'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_7'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_8'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_9'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_10'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_11'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_12'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_13'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_14'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_15'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_16'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_17'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_18'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_19'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_20'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_21'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_22'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_23'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_24'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_25'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_26'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_27'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_28'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_29'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_30'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_31'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_32'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_33'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_34'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_35'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_36'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_37'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_38'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_39'),
			('UNIT_JFD_DAIMYO', 	'TXT_KEY_GREAT_PERSON_JFD_DAIMYO_40');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 	
			(Type, 								Description, ShortDescription, Adjective, Civilopedia, CivilopediaTag, DefaultPlayerColor, 				ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					AlphaIconAtlas, 				 PortraitIndex,	SoundtrackTag, 	MapImage, 					DawnOfManQuote, 					  DawnOfManImage)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'), 	Description, ShortDescription, Adjective, Civilopedia, CivilopediaTag, ('PLAYERCOLOR_JFD_JAPAN_MEIJI'),	ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('JFD_JAPAN_MEIJI_ATLAS'),  ('JFD_JAPAN_MEIJI_ALPHA_ATLAS'), 0, 			('Japan'), 		('JapanMeijiMap512.dds'),	('TXT_KEY_CIV5_DOM_JFD_MEIJI_TEXT'),  ('Meiji_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_JAPAN');
--------------------------------
-- Civilization_CityNames
--------------------------------		
INSERT INTO Civilization_CityNames 
			(CivilizationType, 					CityName)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_1'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_2'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_3'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_4'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_5'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_6'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_7'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_8'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_9'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_10'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_11'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_12'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_13'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_14'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_15'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_16'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_17'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_18'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_19'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_20'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_21'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_22'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_23'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_24'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_25'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_26'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_27'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_28'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_29'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_30'),	
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_31'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_32'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_33'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_34'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_35'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_36'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_37'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_CITY_NAME_JFD_JAPAN_MEIJI_38');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------		
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--------------------------------
-- Civilization_FreeTechs
--------------------------------	
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--------------------------------
-- Civilization_FreeUnits
--------------------------------	
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_JAPAN_MEIJI'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_JAPAN');
--------------------------------
-- Civilization_Leaders
--------------------------------		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI', 	'LEADER_JFD_MEIJI');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------	
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI', 	'UNITCLASS_GREAT_GENERAL', 	'UNIT_JFD_DAIMYO'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'UNITCLASS_BATTLESHIP', 	'UNIT_JFD_MIKASA');
--------------------------------
-- Civilization_Religions
--------------------------------	
INSERT INTO Civilization_Religions
			(CivilizationType, 					ReligionType)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI',	'RELIGION_SHINTO');
--------------------------------
-- Civilization_SpyNames
--------------------------------	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_0'),	
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_1'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_2'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_3'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_4'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_5'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_6'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_7'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_8'),
			('CIVILIZATION_JFD_JAPAN_MEIJI', 	'TXT_KEY_SPY_NAME_JFD_JAPAN_MEIJI_9');
--------------------------------
-- Civilization_Start_Along_Ocean
--------------------------------	
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
VALUES		('CIVILIZATION_JFD_JAPAN_MEIJI', 	1);
--==========================================================================================================================
--==========================================================================================================================
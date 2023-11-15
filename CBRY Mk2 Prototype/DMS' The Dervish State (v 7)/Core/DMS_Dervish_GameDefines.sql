--ALTER TABLE Buildings			ADD 'ShowInPedia'		BOOLEAN DEFAULT 1;
--ALTER TABLE Improvements		ADD 'ShowInPedia'		BOOLEAN DEFAULT 1;
--ALTER TABLE UnitPromotions	ADD 'ShowInPedia'		BOOLEAN DEFAULT 1;
--ALTER TABLE UnitPromotions	ADD 'ShowInUnitPanel'	BOOLEAN DEFAULT 1;
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 					Type, 									Description)
VALUES	('BUILDING_AOI_SHARIA_HIDDEN', 		'BUILDINGCLASS_AOI_SHARIA_HIDDEN', 		'TXT_KEY_BUILDING_AOI_SHARIA_HIDDEN');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 								BuildingClass,	Cost,	HurryCostModifier,	GoldMaintenance,	PrereqTech,			Description, 						Civilopedia, 							Help, 									Strategy,									NeverCapture,	NukeImmune,	MinAreaSize,	AllowsRangeStrike,	Defense,	ExtraCityHitPoints,	ArtDefineTag,	PortraitIndex, 	IconAtlas)
SELECT	('BUILDING_AOI_QALCAD'),			BuildingClass,	500,	HurryCostModifier,	GoldMaintenance,	'TECH_RAILROAD',	('TXT_KEY_BUILDING_AOI_QALCAD'),	('TXT_KEY_BUILDING_AOI_QALCAD_PEDIA'),	('TXT_KEY_BUILDING_AOI_QALCAD_HELP'),	('TXT_KEY_BUILDING_AOI_QALCAD_STRATEGY'),	1,				1,			MinAreaSize,	AllowsRangeStrike,	800,		15,					ArtDefineTag,	3, 				('ATLAS_AOI_DERVISH')
FROM Buildings WHERE (Type = 'BUILDING_MILITARY_BASE');

INSERT INTO Buildings
		(Type, 						 		BuildingClass, 						GreatWorkCount,		Cost,	FaithCost,	PrereqTech,	ReligiousPressureModifier,	Description)
VALUES	('BUILDING_AOI_SHARIA_HIDDEN', 		'BUILDINGCLASS_AOI_SHARIA_HIDDEN',	-1,					-1,		-1,			null,		10,							'TXT_KEY_BUILDING_AOI_SHARIA_HIDDEN');
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 							FlavorType,					Flavor)
SELECT	('BUILDING_AOI_QALCAD'),				FlavorType,					Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_MILITARY_BASE');

INSERT INTO Building_Flavors
		(BuildingType, 							FlavorType,					Flavor)
VALUES	('BUILDING_AOI_QALCAD',					'FLAVOR_CITY_DEFENSE',		25),
		('BUILDING_AOI_QALCAD',					'FLAVOR_MILITARY_TRAINING',	20),
		('BUILDING_AOI_QALCAD',					'FLAVOR_RELIGION',			15);
------------------------------	
-- Building_ClassesNeededInCity
------------------------------	
INSERT INTO Building_ClassesNeededInCity 	
		(BuildingType, 							BuildingClassType)
SELECT	('BUILDING_AOI_QALCAD'),				BuildingClassType
FROM Building_ClassesNeededInCity WHERE (BuildingType = 'BUILDING_MILITARY_BASE');
--==========================================================================================================================
-- BUILDS
--==========================================================================================================================
-- Builds
--------------------------------
INSERT INTO Builds 
		(Type,				PrereqTech, Time, ImprovementType,					Description,	Help, Recommendation, EntityEvent, HotKey, OrderPriority, CtrlDown, IconIndex, IconAtlas)
SELECT	('BUILD_AOI_FORT'),	PrereqTech, Time, 'IMPROVEMENT_AOI_DERVISH_FORT',	Description,	Help, Recommendation, EntityEvent, HotKey, OrderPriority, CtrlDown, IconIndex, IconAtlas
FROM Builds WHERE Type = 'BUILD_FORT';
--------------------------------
-- BuildFeatures
--------------------------------
INSERT INTO BuildFeatures 
		(BuildType,			FeatureType, PrereqTech, Time)
SELECT	('BUILD_AOI_FORT'),	FeatureType, PrereqTech, Time
FROM BuildFeatures WHERE BuildType = 'BUILD_FORT';
--==========================================================================================================================
-- IMPROVEMENTS
--==========================================================================================================================
-- Improvements
--------------------------------
INSERT INTO Improvements 
		(Type,								Description, Help, ArtDefineTag, Permanent,	DestroyedWhenPillaged, BuildableOnResources, OutsideBorders, InAdjacentFriendly, CreatedByGreatPerson, DefenseModifier, NearbyEnemyDamage, CultureBombRadius, IconAtlas, PortraitIndex)
SELECT	('IMPROVEMENT_AOI_DERVISH_FORT'),	Description, Help, ArtDefineTag, 1,			DestroyedWhenPillaged, BuildableOnResources, OutsideBorders, InAdjacentFriendly, CreatedByGreatPerson, DefenseModifier, NearbyEnemyDamage, CultureBombRadius, IconAtlas, PortraitIndex
FROM Improvements WHERE Type = 'IMPROVEMENT_FORT';

INSERT INTO Improvements 
		(Type,								Description, Help, ArtDefineTag, Permanent,	DestroyedWhenPillaged, BuildableOnResources, OutsideBorders, InAdjacentFriendly, CreatedByGreatPerson, DefenseModifier, NearbyEnemyDamage, CultureBombRadius, IconAtlas, PortraitIndex)
SELECT	('IMPROVEMENT_AOI_DERVISH_CITADEL'),Description, Help, ArtDefineTag, 1,			DestroyedWhenPillaged, BuildableOnResources, OutsideBorders, InAdjacentFriendly, CreatedByGreatPerson, DefenseModifier, NearbyEnemyDamage, CultureBombRadius, IconAtlas, PortraitIndex 
FROM Improvements WHERE Type = 'IMPROVEMENT_CITADEL';
--------------------------------
-- Improvement_ResourceTypes
--------------------------------
INSERT INTO Improvement_ResourceTypes 
		(ImprovementType,						ResourceType)
SELECT	('IMPROVEMENT_AOI_DERVISH_CITADEL'),	ResourceType 
FROM Improvement_ResourceTypes WHERE ImprovementType = 'IMPROVEMENT_CITADEL';
--------------------------------
-- Improvement_ValidTerrains
--------------------------------
INSERT INTO Improvement_ValidTerrains 
		(ImprovementType,						TerrainType)
SELECT	('IMPROVEMENT_AOI_DERVISH_FORT'),		TerrainType 
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_FORT';

INSERT INTO Improvement_ValidTerrains 
		(ImprovementType,						TerrainType)
SELECT	('IMPROVEMENT_AOI_DERVISH_CITADEL'),	TerrainType 
FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_CITADEL';
--------------------------------
-- Improvement_Yields
--------------------------------
INSERT INTO Improvement_Yields
		(ImprovementType, 						YieldType,				Yield)
VALUES	('IMPROVEMENT_AOI_DERVISH_CITADEL',		'YIELD_FAITH',			1),
		('IMPROVEMENT_AOI_DERVISH_FORT',		'YIELD_FAITH',			1);
--==========================================================================================================================
-- UNITCLASSES
--==========================================================================================================================
INSERT INTO UnitClasses 	
		(Type, 						Description,	DefaultUnit)
SELECT	('UNITCLASS_AOI_WORKER'),	Description,	DefaultUnit
FROM UnitClasses WHERE (Type = 'UNITCLASS_WORKER');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						Class, 	PrereqTech,			Combat,		Cost,	FaithCost,	RequiresFaithPurchaseEnabled,	Moves,	CombatClass,	Domain, DefaultUnitAI, Description, 					Civilopedia, 							Strategy, 									Help, 									MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, UnitArtInfo, 						MoveRate,		UnitFlagIconOffset, UnitFlagAtlas,						PortraitIndex, 	IconAtlas)
SELECT	('UNIT_AOI_MAARA_WEYN'),	Class,	('TECH_DYNAMITE'),	42,			375,	750,		1,								4,		CombatClass,	Domain, DefaultUnitAI, ('TXT_KEY_UNIT_AOI_MAARA_WEYN'),	('TXT_KEY_UNIT_AOI_MAARA_WEYN_PEDIA'),	('TXT_KEY_UNIT_AOI_MAARA_WEYN_STRATEGY'),	('TXT_KEY_UNIT_AOI_MAARA_WEYN_HELP'),	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, XPValueDefense, UnitArtInfoEraVariation, ('ART_DEF_UNIT_AOI_MAARA_WEYN'),	'QUADRUPED',	0,					('ATLAS_AOI_DERVISH_UNIT_FLAG'),	2, 				('ATLAS_AOI_DERVISH')
FROM Units WHERE (Type = 'UNIT_ANTI_AIRCRAFT_GUN');

INSERT INTO Units 	
		(Type, 					Class,						Cost,	Moves,	Capture,	CivilianAttackPriority,	Domain,	DefaultUnitAI,	Description,	Civilopedia, Strategy, Help, AdvancedStartCost, WorkRate, CombatLimit, 	UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas)
SELECT	('UNIT_AOI_WORKER'),	('UNITCLASS_AOI_WORKER'), 	-1,		Moves,	Capture,	CivilianAttackPriority,	Domain,	DefaultUnitAI,	Description,	Civilopedia, Strategy, Help, AdvancedStartCost, WorkRate, CombatLimit, 	UnitArtInfo, UnitArtInfoEraVariation, UnitFlagIconOffset, PortraitIndex, IconAtlas
FROM Units WHERE (Type = 'UNIT_WORKER');

INSERT INTO Units 
		(Type, 							Class, Description, Help, Strategy, PrereqTech, Cost, FaithCost, RequiresFaithPurchaseEnabled, Combat, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, ObsoleteTech, GoodyHutUpgradeUnitClass,			AdvancedStartCost, XPValueAttack, XPValueDefense, UnitArtInfo, MoveRate, IconAtlas, PortraitIndex, UnitFlagAtlas, UnitFlagIconOffset)
SELECT ('UNIT_AOI_DERVISH_CAVALRY'),	Class, Description, Help, Strategy, PrereqTech, Cost, FaithCost, RequiresFaithPurchaseEnabled, Combat, Moves, CombatClass, Domain, DefaultUnitAI, MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, ObsoleteTech, ('UNITCLASS_ANTI_AIRCRAFT_GUN'),	AdvancedStartCost, XPValueAttack, XPValueDefense, UnitArtInfo, MoveRate, IconAtlas, PortraitIndex, UnitFlagAtlas, UnitFlagIconOffset 
FROM Units WHERE Type = 'UNIT_CAVALRY';
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_AOI_MAARA_WEYN'), 		SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_ANTI_AIRCRAFT_GUN');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_AOI_WORKER'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_AOI_DERVISH_CAVALRY'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	('UNIT_AOI_MAARA_WEYN'), 		UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_ANTI_AIRCRAFT_GUN');

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	('UNIT_AOI_WORKER'), 			UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	('UNIT_AOI_DERVISH_CAVALRY'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,				Flavor)
SELECT	('UNIT_AOI_MAARA_WEYN'),		FlavorType,				Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_ANTI_AIRCRAFT_GUN');

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,				Flavor)
SELECT	('UNIT_AOI_WORKER'), 			FlavorType,				Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,				Flavor)
SELECT	('UNIT_AOI_DERVISH_CAVALRY'), 	FlavorType,				Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_CAVALRY');

INSERT INTO Unit_Flavors
		(UnitType, 						FlavorType,				Flavor)
VALUES	('UNIT_AOI_MAARA_WEYN',			'FLAVOR_OFFENSE',		12),
		('UNIT_AOI_MAARA_WEYN',			'FLAVOR_DEFENSE',		7),
		('UNIT_AOI_MAARA_WEYN',			'FLAVOR_MOBILE',		7);
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 						PromotionType)
VALUES	('UNIT_AOI_MAARA_WEYN',			'PROMOTION_CAN_MOVE_AFTER_ATTACKING'),
		('UNIT_AOI_MAARA_WEYN',			'PROMOTION_CITY_PENALTY'),
		('UNIT_AOI_MAARA_WEYN',			'PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER');

INSERT INTO Unit_FreePromotions 
		(UnitType,						PromotionType)
SELECT ('UNIT_AOI_DERVISH_CAVALRY'),	PromotionType 
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_CAVALRY';

INSERT INTO Unit_FreePromotions 
		(UnitType,						PromotionType)
SELECT ('UNIT_AOI_WORKER'),				PromotionType 
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_WORKER';
--------------------------------
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 
		(UnitType,						BuildType)
SELECT ('UNIT_AOI_WORKER'),				BuildType 
FROM Unit_Builds WHERE UnitType = 'UNIT_WORKER';

DELETE FROM Unit_Builds WHERE UnitType = 'UNIT_AOI_WORKER' AND BuildType = 'BUILD_FORT';

INSERT INTO Unit_Builds 	
		(UnitType, 						BuildType)
VALUES	('UNIT_AOI_WORKER',				'BUILD_AOI_FORT');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	('UNIT_AOI_MAARA_WEYN'),		UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_ANTI_AIRCRAFT_GUN');

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 						UnitClassType)
SELECT	('UNIT_AOI_DERVISH_CAVALRY'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_CAVALRY');
--------------------------------
-- Unit_ResourceQuantityRequirements
--------------------------------	
INSERT INTO Unit_ResourceQuantityRequirements 	
		(UnitType, 						ResourceType,			Cost)
VALUES	('UNIT_AOI_DERVISH_CAVALRY',	'RESOURCE_HORSE',		1);
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
INSERT INTO UnitPromotions 
		(Type,											Description,										Help,													PediaType,			PediaEntry,											CannotBeChosen,	HeavyCharge,	AttackMod,	CombatPercent,	CanMoveAfterAttacking,	ExtraAttacks,	IconAtlas,			PortraitIndex) 
VALUES	('PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER',		'TXT_KEY_PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER',	'TXT_KEY_PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER_HELP',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER',	1,				NULL,			NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AOI_SHARIA',						'TXT_KEY_PROMOTION_AOI_SHARIA',						'TXT_KEY_PROMOTION_AOI_SHARIA_HELP',					'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AOI_SHARIA',						1,				NULL,			NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AOI_DEFENDERS_OF_FREEDOM',			'TXT_KEY_PROMOTION_AOI_DEFENDERS_OF_FREEDOM',		'TXT_KEY_PROMOTION_AOI_DEFENDERS_OF_FREEDOM_HELP',		'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AOI_DEFENDERS_OF_FREEDOM',		1,				1,				NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AOI_DERVISHES',						'TXT_KEY_PROMOTION_AOI_DERVISHES',					'TXT_KEY_PROMOTION_AOI_DERVISHES_HELP',					'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AOI_DERVISHES',					1,				NULL,			NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AOI_POETRY_OF_WAR',					'TXT_KEY_PROMOTION_AOI_POETRY_OF_WAR',				'TXT_KEY_PROMOTION_AOI_POETRY_OF_WAR_HELP',				'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AOI_POETRY_OF_WAR',				1,				NULL,			NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AOI_DHAANTO',						'TXT_KEY_PROMOTION_AOI_DHAANTO',					'TXT_KEY_PROMOTION_AOI_DHAANTO_HELP',					'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AOI_DHAANTO',					1,				NULL,			15,			NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AOI_FORTIFICATIONS',				'TXT_KEY_PROMOTION_AOI_FORTIFICATIONS',				'TXT_KEY_PROMOTION_AOI_FORTIFICATIONS_HELP',			'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AOI_FORTIFICATIONS',				1,				NULL,			NULL,		NULL,			NULL,					NULL,			'ABILITY_ATLAS',	59),
		('PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER_HIDDEN','TXT_KEY_PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER',	'TXT_KEY_PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER_HELP',	'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER',	1,				NULL,			NULL,		15,				NULL,					NULL,			NULL,				NULL),
		('PROMOTION_AOI_FORTIFICATIONS_HIDDEN',			'TXT_KEY_PROMOTION_AOI_FORTIFICATIONS',				'TXT_KEY_PROMOTION_AOI_FORTIFICATIONS_HELP',			'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_AOI_FORTIFICATIONS',				1,				NULL,			NULL,		NULL,			1,						1,				NULL,				NULL);
--------------------------------
-- UnitPromotions_UnitCombats
--------------------------------
INSERT INTO UnitPromotions_UnitCombats 
		(PromotionType,									UnitCombatType) 
VALUES	('PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER',		'UNITCOMBAT_MOUNTED'),
		('PROMOTION_AOI_SHARIA',						'UNITCOMBAT_MOUNTED'),
		('PROMOTION_AOI_DEFENDERS_OF_FREEDOM',			'UNITCOMBAT_MOUNTED'),
		('PROMOTION_AOI_DERVISHES',						'UNITCOMBAT_MOUNTED'),
		('PROMOTION_AOI_POETRY_OF_WAR',					'UNITCOMBAT_MOUNTED'),
		('PROMOTION_AOI_DHAANTO',						'UNITCOMBAT_MOUNTED'),
		('PROMOTION_AOI_FORTIFICATIONS',				'UNITCOMBAT_MOUNTED'),
		('PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER_HIDDEN','UNITCOMBAT_MOUNTED'),
		('PROMOTION_AOI_FORTIFICATIONS_HIDDEN',			'UNITCOMBAT_MOUNTED');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type,							Description,							Civilopedia,								CivilopediaTag,										ArtDefineTag,				VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	DenounceWillingness,	DoFWillingness,	Loyalty,	Neediness,	Forgiveness,	Chattiness,	Meanness,	IconAtlas,				PortraitIndex) 
VALUES	('LEADER_AOI_ABDULLAH_HASSAN',	'TXT_KEY_LEADER_AOI_ABDULLAH_HASSAN',	'TXT_KEY_LEADER_AOI_ABDULLAH_HASSAN_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_AOI_ABDULLAH_HASSAN', 	'AbdullahHassan_Diplo.xml',	6,						5,						4,							7,			4,				5,				6,						5,				6,			6,			5,				5,			7,			'ATLAS_AOI_DERVISH',	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 					MajorCivApproachType, 				Bias)
VALUES	('LEADER_AOI_ABDULLAH_HASSAN',	'MAJOR_CIV_APPROACH_WAR',			3),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MAJOR_CIV_APPROACH_HOSTILE',		8),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MAJOR_CIV_APPROACH_DECEPTIVE',		5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MAJOR_CIV_APPROACH_GUARDED',		9),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MAJOR_CIV_APPROACH_AFRAID',		4),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MAJOR_CIV_APPROACH_FRIENDLY',		5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MAJOR_CIV_APPROACH_NEUTRAL',		5);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 					MinorCivApproachType, 				Bias)
VALUES	('LEADER_AOI_ABDULLAH_HASSAN',	'MINOR_CIV_APPROACH_IGNORE',		3),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MINOR_CIV_APPROACH_FRIENDLY',		6),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MINOR_CIV_APPROACH_PROTECTIVE',	6),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MINOR_CIV_APPROACH_CONQUEST',		4),
		('LEADER_AOI_ABDULLAH_HASSAN',	'MINOR_CIV_APPROACH_BULLY',			8);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType,					FlavorType,							Flavor) 
VALUES	('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_OFFENSE',					7),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_DEFENSE',					8),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_CITY_DEFENSE',				7),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_MILITARY_TRAINING',			8),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_RECON',						6),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_RANGED',					5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_MOBILE',					8),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_NAVAL',						5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_NAVAL_RECON',				4),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_NAVAL_GROWTH',				3),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	3),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_AIR',						4),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_EXPANSION',					7),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_GROWTH',					4),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_TILE_IMPROVEMENT',			5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_INFRASTRUCTURE',			4),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_PRODUCTION',				4),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_GOLD',						6),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_SCIENCE',					6),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_CULTURE',					7),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_HAPPINESS',					5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_GREAT_PEOPLE',				7),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_WONDER',					4),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_RELIGION',					9),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_DIPLOMACY',					6),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_SPACESHIP',					8),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_WATER_CONNECTION',			4),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_NUKE',						5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_USE_NUKE',					6),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_ARCHAEOLOGY',				5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_I_LAND_TRADE_ROUTE',		5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_I_SEA_TRADE_ROUTE',			5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_I_TRADE_ORIGIN',			5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_I_TRADE_DESTINATION',		5),
		('LEADER_AOI_ABDULLAH_HASSAN',	'FLAVOR_AIRLIFT',					6);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 						TraitType)
VALUES	('LEADER_AOI_ABDULLAH_HASSAN', 		'TRAIT_AOI_HORN_RESISTANCE');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 							ShortDescription)
VALUES	('TRAIT_AOI_HORN_RESISTANCE', 	'TXT_KEY_TRAIT_AOI_HORN_RESISTANCE', 	'TXT_KEY_TRAIT_AOI_HORN_RESISTANCE_SHORT');
--------------------------------
-- Trait_ImprovementYieldChanges
--------------------------------
INSERT INTO Trait_ImprovementYieldChanges 
		(TraitType, 					ImprovementType, 					YieldType,			Yield)
VALUES	('TRAIT_AOI_HORN_RESISTANCE', 	'IMPROVEMENT_FORT', 				'YIELD_FAITH',		1),
		('TRAIT_AOI_HORN_RESISTANCE', 	'IMPROVEMENT_AOI_DERVISH_FORT', 	'YIELD_FAITH',		1),
		('TRAIT_AOI_HORN_RESISTANCE', 	'IMPROVEMENT_CITADEL', 				'YIELD_FAITH',		1),
		('TRAIT_AOI_HORN_RESISTANCE', 	'IMPROVEMENT_AOI_DERVISH_CITADEL',	'YIELD_FAITH',		1);
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type,							Description,						ShortDescription,							Adjective,								CivilopediaTag,								DefaultPlayerColor,			ArtStyleType,			ArtStylePrefix,	ArtStyleSuffix,	IconAtlas,				AlphaIconAtlas,				PortraitIndex,	MapImage,				DawnOfManImage,			DawnOfManQuote,							SoundtrackTag) 
VALUES	('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CIVILIZATION_AOI_DERVISH_SHORT',	'TXT_KEY_CIVILIZATION_AOI_DERVISH_ADJ',	'TXT_KEY_CIVILIZATION_AOI_DERVISH_PEDIA',	'PLAYERCOLOR_AOI_DERVISH',	'ARTSTYLE_MIDDLE_EAST',	'AFRICAN',		'_AFRI',		'ATLAS_AOI_DERVISH',	'ATLAS_AOI_DERVISH_ALPHA',	0,				'AoI_DervishMap.dds',	'AoI_DervishDoM.dds',	'TXT_KEY_CIVILIZATION_AOI_DERVISH_DOM',	'Arabia');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_01'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_02'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_03'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_04'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_05'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_06'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_07'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_08'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_09'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_10'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_11'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_12'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_13'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_14'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_15'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_16'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_17'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_18'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_19'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_20'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_21'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_22'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_23'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_24'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_25'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_26'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_27'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_28'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_CITY_NAME_AOI_CITY_29');			
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	('CIVILIZATION_AOI_DERVISH'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ARABIA');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	('CIVILIZATION_AOI_DERVISH'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ETHIOPIA');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_AOI_DERVISH'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ETHIOPIA');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 					LeaderheadType)
VALUES	('CIVILIZATION_AOI_DERVISH',		'LEADER_AOI_ABDULLAH_HASSAN');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 					UnitClassType, 					UnitType)
VALUES	('CIVILIZATION_AOI_DERVISH', 		'UNITCLASS_ANTI_AIRCRAFT_GUN',	'UNIT_AOI_MAARA_WEYN');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 					BuildingClassType, 				BuildingType)
VALUES	('CIVILIZATION_AOI_DERVISH', 		'BUILDINGCLASS_MILITARY_BASE', 	'BUILDING_AOI_QALCAD');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_AOI_DERVISH', 	'RELIGION_ISLAM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_ABDULLAH'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_KHALID'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_OMAR'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_GULEED'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_SAMAKAB'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_WAABBERI'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_SAMATAR'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_ARALE'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_ADAM'),
		('CIVILIZATION_AOI_DERVISH',	'TXT_KEY_SPY_NAME_AOI_BAHDOON');
--==========================================================================================================================
-- Civilization_Start_Region_Avoid
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Avoid 
		(CivilizationType,				RegionType) 
VALUES	('CIVILIZATION_AOI_DERVISH',	'REGION_TUNDRA');
--==========================================================================================================================
--==========================================================================================================================
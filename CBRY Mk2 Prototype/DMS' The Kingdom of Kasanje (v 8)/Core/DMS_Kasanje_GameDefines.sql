--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------	
INSERT OR REPLACE INTO BuildingClasses 
		(DefaultBuilding, 					Type, 									Description)
VALUES	('BUILDING_DMS_CITIZEN_MAVALA',		'BUILDINGCLASS_DMS_CITIZEN_MAVALA', 	'TXT_KEY_BUILDING_DMS_CITIZEN_MAVALA');
--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------	
INSERT INTO Buildings 	
		(Type, 						 		BuildingClass, 							Cost,	FaithCost,	GreatWorkCount,	PrereqTech,	MinAreaSize,	Description, 								Help)
VALUES	('BUILDING_DMS_CITIZEN_MAVALA',		'BUILDINGCLASS_DMS_CITIZEN_MAVALA',		-1,		-1,			-1,				null,		-1,				'TXT_KEY_BUILDING_DMS_CITIZEN_MAVALA',		'TXT_KEY_BUILDING_DMS_CITIZEN_MAVALA_HELP');
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 						Class, 	PrereqTech,	Combat,		Cost,		Moves,		CombatClass, Domain, DefaultUnitAI, Description, 				Civilopedia, 						Strategy, 								Help, 								MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, ObsoleteTech,			XPValueDefense, UnitArtInfoEraVariation, Conscription,	UnitArtInfo, 					UnitFlagIconOffset, UnitFlagAtlas,					PortraitIndex, 	IconAtlas)
SELECT	('UNIT_DMS_GONZO'),			Class,	PrereqTech, Combat+1,	Cost,		Moves-1,	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_DMS_GONZO'),	('TXT_KEY_CIV5_DMS_GONZO_TEXT'),	('TXT_KEY_UNIT_DMS_GONZO_STRATEGY'),	('TXT_KEY_UNIT_DMS_GONZO_HELP'),	MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, Pillage, ('TECH_GUNPOWDER'),	XPValueDefense, UnitArtInfoEraVariation, 1,				('ART_DEF_UNIT_DMS_GONZO'), 	0,					('DMS_GONZO_FLAG_ART_ATLAS'),	2,				('DMS_KASANJE_ATLAS')
FROM Units WHERE (Type = 'UNIT_SWORDSMAN');

INSERT INTO Units 	
		(Type, 						Class, 	Cost,	Moves,	Capture,	CivilianAttackPriority,	Domain,	DefaultUnitAI,	Description,					Civilopedia,						Strategy,								Help,								AdvancedStartCost,	WorkRate,	CombatLimit,	UnitArtInfo,					UnitArtInfoEraVariation,	UnitFlagAtlas,					UnitFlagIconOffset,	PortraitIndex,	IconAtlas)
SELECT	('UNIT_DMS_MAVALA_3_USES'),	Class,	-1,		Moves,	NULL,		CivilianAttackPriority,	Domain,	DefaultUnitAI,	('TXT_KEY_UNIT_DMS_MAVALA'),	('TXT_KEY_CIV5_DMS_MAVALA_TEXT'),	('TXT_KEY_UNIT_DMS_MAVALA_STRATEGY'),	('TXT_KEY_UNIT_DMS_MAVALA_HELP'),	AdvancedStartCost,	1000,		CombatLimit,	('ART_DEF_UNIT_DMS_MAVALA'),	0,							('DMS_MAVALA_FLAG_ART_ATLAS'), 	0,					3,				('DMS_KASANJE_ATLAS')
FROM Units WHERE (Type = 'UNIT_WORKER');

INSERT INTO Units 	
		(Type, 						Class, 	Cost,	Moves,	Capture,	CivilianAttackPriority,	Domain,	DefaultUnitAI,	Description,					Civilopedia,						Strategy,								Help,								AdvancedStartCost,	WorkRate,	CombatLimit,	UnitArtInfo,					UnitArtInfoEraVariation,	UnitFlagAtlas,					UnitFlagIconOffset,	PortraitIndex,	IconAtlas)
SELECT	('UNIT_DMS_MAVALA_2_USES'),	Class,	-1,		Moves,	NULL,		CivilianAttackPriority,	Domain,	DefaultUnitAI,	('TXT_KEY_UNIT_DMS_MAVALA'),	('TXT_KEY_CIV5_DMS_MAVALA_TEXT'),	('TXT_KEY_UNIT_DMS_MAVALA_STRATEGY'),	('TXT_KEY_UNIT_DMS_MAVALA_HELP'),	AdvancedStartCost,	1000,		CombatLimit,	('ART_DEF_UNIT_DMS_MAVALA'),	0,							('DMS_MAVALA_FLAG_ART_ATLAS'), 	0,					3,				('DMS_KASANJE_ATLAS')
FROM Units WHERE (Type = 'UNIT_WORKER');

INSERT INTO Units 	
		(Type, 						Class, 	Cost,	Moves,	Capture,	CivilianAttackPriority,	Domain,	DefaultUnitAI,	Description,					Civilopedia,						Strategy,								Help,								AdvancedStartCost,	WorkRate,	CombatLimit,	UnitArtInfo,					UnitArtInfoEraVariation,	UnitFlagAtlas,					UnitFlagIconOffset,	PortraitIndex,	IconAtlas)
SELECT	('UNIT_DMS_MAVALA_1_USES'),	Class,	-1,		Moves,	NULL,		CivilianAttackPriority,	Domain,	DefaultUnitAI,	('TXT_KEY_UNIT_DMS_MAVALA'),	('TXT_KEY_CIV5_DMS_MAVALA_TEXT'),	('TXT_KEY_UNIT_DMS_MAVALA_STRATEGY'),	('TXT_KEY_UNIT_DMS_MAVALA_HELP'),	AdvancedStartCost,	1000,		CombatLimit,	('ART_DEF_UNIT_DMS_MAVALA'),	0,							('DMS_MAVALA_FLAG_ART_ATLAS'), 	0,					3,				('DMS_KASANJE_ATLAS')
FROM Units WHERE (Type = 'UNIT_WORKER');
--------------------------------
-- UnitGameplay2DScripts
--------------------------------	
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_GONZO'), 			SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SWORDSMAN');	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_MAVALA_3_USES'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_MAVALA_2_USES'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WORKER');	

INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 						SelectionSound, FirstSelectionSound)
SELECT	('UNIT_DMS_MAVALA_1_USES'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_WORKER');	
--------------------------------
-- Unit_AITypes
--------------------------------	
INSERT INTO Unit_AITypes 	
		(UnitType, 				UnitAIType)
SELECT	('UNIT_DMS_GONZO'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SWORDSMAN');

INSERT INTO Unit_AITypes
		(UnitType, 				UnitAIType)
VALUES	('UNIT_DMS_GONZO',		'UNITAI_ATTACK');

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	('UNIT_DMS_MAVALA_3_USES'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	('UNIT_DMS_MAVALA_2_USES'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_AITypes 	
		(UnitType, 						UnitAIType)
SELECT	('UNIT_DMS_MAVALA_1_USES'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_WORKER');
--------------------------------
-- Unit_Flavors
--------------------------------	
INSERT INTO Unit_Flavors 	
		(UnitType, 				FlavorType,			Flavor)
SELECT	('UNIT_DMS_GONZO'), 	FlavorType,			Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SWORDSMAN');

INSERT INTO Unit_Flavors
		(UnitType, 				FlavorType,				Flavor)
VALUES	('UNIT_DMS_GONZO',		'FLAVOR_OFFENSE',		25);

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,		Flavor)
SELECT	('UNIT_DMS_MAVALA_3_USES'), 	FlavorType,		Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,		Flavor)
SELECT	('UNIT_DMS_MAVALA_2_USES'), 	FlavorType,		Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_Flavors 	
		(UnitType, 						FlavorType,		Flavor)
SELECT	('UNIT_DMS_MAVALA_1_USES'), 	FlavorType,		Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_WORKER');
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 				PromotionType)
SELECT	('UNIT_DMS_GONZO'),		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_SWORDSMAN');

INSERT INTO Unit_FreePromotions 	
		(UnitType, 					PromotionType)
VALUES	('UNIT_DMS_GONZO',			'PROMOTION_DMS_YIJILA'),
		('UNIT_DMS_MAVALA_3_USES',	'PROMOTION_DMS_YIJIGO_3_USES'),
		('UNIT_DMS_MAVALA_2_USES',	'PROMOTION_DMS_YIJIGO_2_USES'),
		('UNIT_DMS_MAVALA_1_USES',	'PROMOTION_DMS_YIJIGO_1_USES');
--------------------------------
-- Unit_ClassUpgrades
--------------------------------	
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	('UNIT_DMS_GONZO'),			UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_SWORDSMAN');

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	('UNIT_DMS_MAVALA_3_USES'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	('UNIT_DMS_MAVALA_2_USES'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 					UnitClassType)
SELECT	('UNIT_DMS_MAVALA_1_USES'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_WORKER');
--------------------------------
-- Unit_Builds
--------------------------------	
INSERT INTO Unit_Builds 	
		(UnitType, 					BuildType)
SELECT	('UNIT_DMS_MAVALA_3_USES'),	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_Builds 	
		(UnitType, 					BuildType)
SELECT	('UNIT_DMS_MAVALA_2_USES'),	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_WORKER');

INSERT INTO Unit_Builds 	
		(UnitType, 					BuildType)
SELECT	('UNIT_DMS_MAVALA_1_USES'),	BuildType
FROM Unit_Builds WHERE (UnitType = 'UNIT_WORKER');
--==========================================================================================================================	
-- PROMOTIONS
--==========================================================================================================================	
INSERT INTO UnitPromotions 	
		(Type, 							Description,							Help,										Sound,				CityAttack,		LostWithUpgrade,	PortraitIndex,	IconAtlas,				PediaType,			PediaEntry,									CannotBeChosen)
VALUES	('PROMOTION_DMS_YIJILA',		'TXT_KEY_PROMOTION_DMS_YIJILA',			'TXT_KEY_PROMOTION_DMS_YIJILA_HELP',		'AS2D_IF_LEVELUP',	100,			0,					33,				'PROMOTION_ATLAS',		'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_YIJILA_HELP',		1),
		('PROMOTION_DMS_YIJIGO_3_USES',	'TXT_KEY_PROMOTION_DMS_YIJIGO_3_USES',	'TXT_KEY_PROMOTION_DMS_YIJIGO_3_USES_HELP',	'AS2D_IF_LEVELUP',	0,				0,					33,				'PROMOTION_ATLAS',		'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_YIJIGO_3_USES_HELP',	1),
		('PROMOTION_DMS_YIJIGO_2_USES',	'TXT_KEY_PROMOTION_DMS_YIJIGO_2_USES',	'TXT_KEY_PROMOTION_DMS_YIJIGO_2_USES_HELP',	'AS2D_IF_LEVELUP',	0,				0,					33,				'PROMOTION_ATLAS',		'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_YIJIGO_2_USES_HELP',	1),
		('PROMOTION_DMS_YIJIGO_1_USES',	'TXT_KEY_PROMOTION_DMS_YIJIGO_1_USES',	'TXT_KEY_PROMOTION_DMS_YIJIGO_1_USES_HELP',	'AS2D_IF_LEVELUP',	0,				0,					33,				'PROMOTION_ATLAS',		'PEDIA_ATTRIBUTES',	'TXT_KEY_PROMOTION_DMS_YIJIGO_1_USES_HELP',	1);
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
--------------------------------			
INSERT INTO Leaders 
		(Type, 						Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES	('LEADER_DMS_KASANJE', 		'TXT_KEY_LEADER_DMS_KASANJE', 	'TXT_KEY_LEADER_DMS_KASANJE_PEDIA', 'TXT_KEY_CIVILOPEDIA_LEADERS_DMS_KASANJE', 	'Kasanje_Scene.xml',	5, 						4, 						6, 							10, 		8, 				2, 				4, 						8, 				5, 			3, 			6, 				6, 			8, 			'DMS_KASANJE_ATLAS',	1);
--------------------------------		
-- Leader_MajorCivApproachBiases
--------------------------------						
INSERT INTO Leader_MajorCivApproachBiases 
		(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_KASANJE', 		'MAJOR_CIV_APPROACH_WAR', 			9),
		('LEADER_DMS_KASANJE', 		'MAJOR_CIV_APPROACH_HOSTILE', 		9),
		('LEADER_DMS_KASANJE', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	7),
		('LEADER_DMS_KASANJE', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
		('LEADER_DMS_KASANJE', 		'MAJOR_CIV_APPROACH_AFRAID', 		4),
		('LEADER_DMS_KASANJE', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
		('LEADER_DMS_KASANJE', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		4);
--------------------------------	
-- Leader_MajorCivApproachBiases
--------------------------------							
INSERT INTO Leader_MinorCivApproachBiases 
		(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES	('LEADER_DMS_KASANJE', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
		('LEADER_DMS_KASANJE', 		'MINOR_CIV_APPROACH_FRIENDLY', 		4),
		('LEADER_DMS_KASANJE', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
		('LEADER_DMS_KASANJE', 		'MINOR_CIV_APPROACH_CONQUEST', 		12),
		('LEADER_DMS_KASANJE', 		'MINOR_CIV_APPROACH_BULLY', 		7);
--------------------------------	
-- Leader_Flavors
--------------------------------							
INSERT INTO Leader_Flavors 
		(LeaderType, 				FlavorType, 						Flavor)
VALUES	('LEADER_DMS_KASANJE', 		'FLAVOR_OFFENSE', 					10),
		('LEADER_DMS_KASANJE', 		'FLAVOR_DEFENSE', 					7),
		('LEADER_DMS_KASANJE', 		'FLAVOR_CITY_DEFENSE', 				5),
		('LEADER_DMS_KASANJE', 		'FLAVOR_MILITARY_TRAINING', 		11),
		('LEADER_DMS_KASANJE', 		'FLAVOR_RECON', 					5),
		('LEADER_DMS_KASANJE', 		'FLAVOR_RANGED', 					6),
		('LEADER_DMS_KASANJE', 		'FLAVOR_MOBILE', 					6),
		('LEADER_DMS_KASANJE', 		'FLAVOR_NAVAL', 					3),
		('LEADER_DMS_KASANJE', 		'FLAVOR_NAVAL_RECON', 				4),
		('LEADER_DMS_KASANJE', 		'FLAVOR_NAVAL_GROWTH', 				3),
		('LEADER_DMS_KASANJE', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	3),
		('LEADER_DMS_KASANJE', 		'FLAVOR_AIR', 						5),
		('LEADER_DMS_KASANJE', 		'FLAVOR_EXPANSION', 				7),
		('LEADER_DMS_KASANJE', 		'FLAVOR_GROWTH', 					6),
		('LEADER_DMS_KASANJE', 		'FLAVOR_TILE_IMPROVEMENT', 			7),
		('LEADER_DMS_KASANJE', 		'FLAVOR_INFRASTRUCTURE', 			3),
		('LEADER_DMS_KASANJE', 		'FLAVOR_PRODUCTION', 				6),
		('LEADER_DMS_KASANJE', 		'FLAVOR_GOLD', 						7),
		('LEADER_DMS_KASANJE', 		'FLAVOR_SCIENCE', 					6),
		('LEADER_DMS_KASANJE', 		'FLAVOR_CULTURE', 					8),
		('LEADER_DMS_KASANJE', 		'FLAVOR_HAPPINESS', 				4),
		('LEADER_DMS_KASANJE', 		'FLAVOR_GREAT_PEOPLE', 				4),
		('LEADER_DMS_KASANJE', 		'FLAVOR_WONDER', 					5),
		('LEADER_DMS_KASANJE', 		'FLAVOR_RELIGION', 					4),
		('LEADER_DMS_KASANJE', 		'FLAVOR_DIPLOMACY', 				4),
		('LEADER_DMS_KASANJE', 		'FLAVOR_SPACESHIP', 				6),
		('LEADER_DMS_KASANJE', 		'FLAVOR_WATER_CONNECTION', 			2),
		('LEADER_DMS_KASANJE', 		'FLAVOR_NUKE', 						8),
		('LEADER_DMS_KASANJE', 		'FLAVOR_USE_NUKE', 					9),
		('LEADER_DMS_KASANJE', 		'FLAVOR_ESPIONAGE', 				4),
		('LEADER_DMS_KASANJE', 		'FLAVOR_AIRLIFT', 					5),
		('LEADER_DMS_KASANJE', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
		('LEADER_DMS_KASANJE', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
		('LEADER_DMS_KASANJE', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
		('LEADER_DMS_KASANJE', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
		('LEADER_DMS_KASANJE', 		'FLAVOR_ARCHAEOLOGY', 				3),
		('LEADER_DMS_KASANJE', 		'FLAVOR_AIR_CARRIER', 				3);
--------------------------------	
-- Leader_Traits
--------------------------------	
INSERT INTO Leader_Traits 
		(LeaderType, 				TraitType)
VALUES	('LEADER_DMS_KASANJE', 		'TRAIT_DMS_KILOMBO');
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 						Description, 					ShortDescription)
VALUES	('TRAIT_DMS_KILOMBO', 		'TXT_KEY_TRAIT_DMS_KILOMBO', 	'TXT_KEY_TRAIT_DMS_KILOMBO_SHORT');	
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilizations
--------------------------------		
INSERT INTO Civilizations 
		(Type, 							Description, 							ShortDescription,							Adjective,										CivilopediaTag,										DefaultPlayerColor,				ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	PortraitIndex,	IconAtlas,				AlphaIconAtlas,					SoundtrackTag, 	MapImage,				DawnOfManQuote,							DawnOfManImage)
SELECT	('CIVILIZATION_DMS_KASANJE'), 	('TXT_KEY_CIVILIZATION_DMS_KASANJE'), 	('TXT_KEY_CIVILIZATION_DMS_KASANJE_SHORT'),	('TXT_KEY_CIVILIZATION_DMS_KASANJE_ADJECTIVE'),	('TXT_KEY_CIVILOPEDIA_CIVILIZATIONS_DMS_KASANJE'),	('PLAYERCOLOR_DMS_KASANJE'),	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	0,				('DMS_KASANJE_ATLAS'),	('DMS_KASANJE_ALPHA_ATLAS'),	('Zulu'), 		('KasanjeMap512.dds'),	('TXT_KEY_CIV5_DAWN_DMS_KASANJE_TEXT'),	('Kasanje_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_ZULU');
--------------------------------	
-- Civilization_CityNames
--------------------------------	
INSERT INTO Civilization_CityNames
        (CivilizationType,				CityName)
VALUES	('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_1'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_2'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_3'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_4'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_5'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_6'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_7'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_8'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_9'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_10'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_11'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_12'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_13'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_14'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_15'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_16'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_17'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_18'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_19'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_20'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_21'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_22'),
        ('CIVILIZATION_DMS_KASANJE',	'TXT_KEY_CITY_NAME_CIVILIZATION_DMS_KASANJE_23');			
--------------------------------	
-- Civilization_FreeBuildingClasses
--------------------------------			
INSERT INTO Civilization_FreeBuildingClasses 
		(CivilizationType, 				BuildingClassType)
SELECT	('CIVILIZATION_DMS_KASANJE'),	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--------------------------------	
-- Civilization_FreeTechs
--------------------------------		
INSERT INTO Civilization_FreeTechs 
		(CivilizationType, 				TechType)
SELECT	('CIVILIZATION_DMS_KASANJE'),	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--------------------------------	
-- Civilization_FreeUnits
--------------------------------		
INSERT INTO Civilization_FreeUnits 
		(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT	('CIVILIZATION_DMS_KASANJE'),	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_ZULU');
--------------------------------	
-- Civilization_Leaders
--------------------------------
INSERT INTO Civilization_Leaders 
		(CivilizationType, 				LeaderheadType)
VALUES	('CIVILIZATION_DMS_KASANJE',	'LEADER_DMS_KASANJE');
--------------------------------	
-- Civilization_UnitClassOverrides 
--------------------------------
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_DMS_KASANJE', 	'UNITCLASS_SWORDSMAN',	'UNIT_DMS_GONZO');

INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 				UnitClassType, 			UnitType)
VALUES	('CIVILIZATION_DMS_KASANJE', 	'UNITCLASS_WORKER',		'UNIT_DMS_MAVALA_3_USES');
--------------------------------	
-- Civilization_Religions
--------------------------------		
INSERT INTO Civilization_Religions 
		(CivilizationType, 				ReligionType)
VALUES	('CIVILIZATION_DMS_KASANJE', 	'RELIGION_ISLAM');
--------------------------------	
-- Civilization_SpyNames
--------------------------------
INSERT INTO Civilization_SpyNames 
		(CivilizationType, 				SpyName)
VALUES	('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_0'),	
		('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_1'),
		('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_2'),
		('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_3'),
		('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_4'),
		('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_5'),
		('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_6'),
		('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_7'),
		('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_8'),
		('CIVILIZATION_DMS_KASANJE', 	'TXT_KEY_SPY_NAME_DMS_KASANJE_9');
--==========================================================================================================================
-- Civilization_Start_Region_Priority
--==========================================================================================================================	
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_DMS_KASANJE', 		'REGION_JUNGLE');
--==========================================================================================================================
--==========================================================================================================================
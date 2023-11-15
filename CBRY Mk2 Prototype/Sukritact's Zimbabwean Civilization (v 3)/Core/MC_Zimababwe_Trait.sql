--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- BuildingClasses
--------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_MC_TOTEM_1', 		'BUILDING_MC_TOTEM_1', 					'TXT_KEY_BUILDING_MC_TOTEM'),
		('BUILDINGCLASS_MC_TOTEM_2', 		'BUILDING_MC_TOTEM_2', 					'TXT_KEY_BUILDING_MC_TOTEM'),
		('BUILDINGCLASS_MC_TOTEM_4', 		'BUILDING_MC_TOTEM_4', 					'TXT_KEY_BUILDING_MC_TOTEM'),
		('BUILDINGCLASS_MC_TOTEM_8', 		'BUILDING_MC_TOTEM_8', 					'TXT_KEY_BUILDING_MC_TOTEM');
--------------------------------	
-- Buildings: Invisible
--------------------------------
INSERT INTO Buildings
			(Type, 							BuildingClass, 						Description,							GreatWorkCount,	Cost,	FaithCost,	PrereqTech, 	NeverCapture)
VALUES		('BUILDING_MC_TOTEM_1', 		'BUILDINGCLASS_MC_TOTEM_1',			'TXT_KEY_BUILDING_MC_TOTEM',			-1, 			-1,   		-1,		null,			1),
			('BUILDING_MC_TOTEM_2', 		'BUILDINGCLASS_MC_TOTEM_2',			'TXT_KEY_BUILDING_MC_TOTEM',			-1, 			-1,   		-1,		null,			1),
			('BUILDING_MC_TOTEM_4', 		'BUILDINGCLASS_MC_TOTEM_4',			'TXT_KEY_BUILDING_MC_TOTEM',			-1, 			-1,   		-1,		null,			1),
			('BUILDING_MC_TOTEM_8', 		'BUILDINGCLASS_MC_TOTEM_8',			'TXT_KEY_BUILDING_MC_TOTEM',			-1, 			-1,   		-1,		null,			1);

UPDATE Buildings
SET	NumTradeRouteBonus = 1
WHERE Type = 'BUILDING_MC_TOTEM_1';

UPDATE Buildings
SET	NumTradeRouteBonus = 2
WHERE Type = 'BUILDING_MC_TOTEM_2';

UPDATE Buildings
SET	NumTradeRouteBonus = 4
WHERE Type = 'BUILDING_MC_TOTEM_4';

UPDATE Buildings
SET	NumTradeRouteBonus = 8
WHERE Type = 'BUILDING_MC_TOTEM_8';
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type, 									Description,							Help) 
VALUES		('POLICY_MC_ZIMBABWE_HOVE',				'TXT_KEY_TRAIT_MC_ZIMBABWE_HOVE',		'TXT_KEY_TRAIT_MC_ZIMBABWE_HOVE_HELP'),
			('POLICY_MC_ZIMBABWE_MHARA',			'TXT_KEY_TRAIT_MC_ZIMBABWE_MHARA',		'TXT_KEY_TRAIT_MC_ZIMBABWE_MHARA_HELP'),
			('POLICY_MC_ZIMBABWE_NYATI',			'TXT_KEY_TRAIT_MC_ZIMBABWE_NYATI',		'TXT_KEY_TRAIT_MC_ZIMBABWE_NYATI_HELP'),
			('POLICY_MC_ZIMBABWE_DZIVA',			'TXT_KEY_TRAIT_MC_ZIMBABWE_DZIVA',		'TXT_KEY_TRAIT_MC_ZIMBABWE_DZIVA_HELP'),
			('POLICY_MC_ZIMBABWE_MBIZI',			'TXT_KEY_TRAIT_MC_ZIMBABWE_MBIZI',		'TXT_KEY_TRAIT_MC_ZIMBABWE_MBIZI_HELP'),
			('POLICY_MC_ZIMBABWE_NZOU',				'TXT_KEY_TRAIT_MC_ZIMBABWE_NZOU',		'TXT_KEY_TRAIT_MC_ZIMBABWE_NZOU_HELP'),
			('POLICY_MC_ZIMBABWE_NHEWA',			'TXT_KEY_TRAIT_MC_ZIMBABWE_NHEWA',		'TXT_KEY_TRAIT_MC_ZIMBABWE_NHEWA_HELP'),
			('POLICY_MC_ZIMBABWE_NGARA',			'TXT_KEY_TRAIT_MC_ZIMBABWE_NGARA',		'TXT_KEY_TRAIT_MC_ZIMBABWE_NGARA_HELP'),
			('POLICY_MC_ZIMBABWE_MOYO_EVENT',		'TXT_KEY_TRAIT_MC_ZIMBABWE_MOYO',		'TXT_KEY_TRAIT_MC_ZIMBABWE_MOYO_HELP'),
			('POLICY_MC_ZIMBABWE_MOYO',				'TXT_KEY_TRAIT_MC_ZIMBABWE_MOYO',		'TXT_KEY_TRAIT_MC_ZIMBABWE_MOYO_HELP');

UPDATE Policies
SET	SeaTradeRouteGoldChange = 300
WHERE Type = 'POLICY_MC_ZIMBABWE_HOVE';

UPDATE Policies
SET	RouteGoldMaintenanceMod = -50
WHERE Type = 'POLICY_MC_ZIMBABWE_MHARA';

UPDATE Policies
SET	BuildingProductionModifier = 10,
	WonderProductionModifier = 10
WHERE Type = 'POLICY_MC_ZIMBABWE_NYATI';

UPDATE Policies
SET	IncludesOneShotFreeUnits = 1,
	LandTradeRouteGoldChange = 300
WHERE Type = 'POLICY_MC_ZIMBABWE_MBIZI';

UPDATE Policies
SET	IncludesOneShotFreeUnits = 1,
	BaseFreeUnits = 4
WHERE Type = 'POLICY_MC_ZIMBABWE_MOYO';
--==========================================================================================================================
-- Policy_BuildingClassYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType, 							BuildingClassType,			YieldType, 				YieldChange)
SELECT 		'POLICY_MC_ZIMBABWE_NZOU', 				Type,						'YIELD_GOLD', 			1
FROM BuildingClasses WHERE (MaxGlobalInstances > 0);

INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType, 							BuildingClassType,			YieldType, 				YieldChange)
SELECT 		'POLICY_MC_ZIMBABWE_NZOU', 				Type,						'YIELD_PRODUCTION', 	1
FROM BuildingClasses WHERE (MaxGlobalInstances > 0);

INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType, 							BuildingClassType,			YieldType, 				YieldChange)
SELECT 		'POLICY_MC_ZIMBABWE_NZOU', 				Type,						'YIELD_FAITH', 			1
FROM BuildingClasses WHERE (MaxGlobalInstances > 0);
--==========================================================================================================================	
-- Policy_CityYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassCultureChanges 	
			(PolicyType, 							BuildingClassType, 			CultureChange)
SELECT 		'POLICY_MC_ZIMBABWE_NZOU', 				Type,						1
FROM BuildingClasses WHERE (MaxGlobalInstances > 0);
--==========================================================================================================================
--==========================================================================================================================
CREATE TRIGGER TRIGGER_POLICY_MC_ZIMBABWE_NZOU
AFTER INSERT ON BuildingClasses 
WHEN NEW.MaxGlobalInstances > 0
BEGIN
	INSERT INTO Policy_BuildingClassYieldChanges 
				(PolicyType, 						BuildingClassType,			YieldType, 				YieldChange)
	VALUES 		('POLICY_MC_ZIMBABWE_NZOU', 		NEW.Type,					'YIELD_GOLD', 			1),
				('POLICY_MC_ZIMBABWE_NZOU', 		NEW.Type,					'YIELD_PRODUCTION', 	1),
				('POLICY_MC_ZIMBABWE_NZOU', 		NEW.Type,					'YIELD_FAITH', 			1);

	INSERT INTO Policy_BuildingClassCultureChanges 	
			(PolicyType, 						BuildingClassType, 						CultureChange)
	VALUES	('POLICY_MC_ZIMBABWE_NZOU', 		NEW.Type, 								1);
END;
--==========================================================================================================================	
-- Policy_CityYieldChanges
--==========================================================================================================================
INSERT INTO Policy_CityYieldChanges 	
		(PolicyType, 						YieldType, 						Yield)
VALUES	('POLICY_MC_ZIMBABWE_DZIVA', 		'YIELD_FOOD', 					2);
--==========================================================================================================================	
-- Policy_CityYieldChanges
--==========================================================================================================================
INSERT INTO Policy_FreePromotions 	
		(PolicyType, 						PromotionType)
VALUES	('POLICY_MC_ZIMBABWE_MHARA', 		'PROMOTION_MC_ZIMBABWE_MHARA'),
		('POLICY_MC_ZIMBABWE_NHEWA', 		'PROMOTION_MC_ZIMBABWE_NHEWA'),
		('POLICY_MC_ZIMBABWE_NGARA', 		'PROMOTION_MC_ZIMBABWE_NGARA');
--==========================================================================================================================	
-- Policy_FreeUnitClasses
--==========================================================================================================================
INSERT INTO Policy_FreeUnitClasses 	
		(PolicyType, 						UnitClassType, 						Count)
VALUES	('POLICY_MC_ZIMBABWE_MBIZI', 		'UNITCLASS_CARAVAN', 				1),
		('POLICY_MC_ZIMBABWE_MOYO', 		'UNITCLASS_LONGSWORDSMAN', 			4);
--==========================================================================================================================
-- UnitPromotions
--==========================================================================================================================
INSERT INTO UnitPromotions
			(Type, 								Description, 						Help, 										CannotBeChosen, 		Sound, 				PortraitIndex, 	IconAtlas, 			PediaType, 			PediaEntry)
VALUES		('PROMOTION_MC_ZIMBABWE_MHARA', 	'TXT_KEY_TRAIT_MC_ZIMBABWE_MHARA', 	'TXT_KEY_PROMOTION_MC_ZIMBABWE_MHARA_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_TRAIT_MC_ZIMBABWE_MHARA'),
			('PROMOTION_MC_ZIMBABWE_NHEWA', 	'TXT_KEY_TRAIT_MC_ZIMBABWE_NHEWA', 	'TXT_KEY_PROMOTION_MC_ZIMBABWE_NHEWA_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_TRAIT_MC_ZIMBABWE_NHEWA'),
			('PROMOTION_MC_ZIMBABWE_NGARA', 	'TXT_KEY_TRAIT_MC_ZIMBABWE_NGARA', 	'TXT_KEY_PROMOTION_MC_ZIMBABWE_NGARA_HELP',	1, 						'AS2D_IF_LEVELUP', 	59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_TRAIT_MC_ZIMBABWE_NGARA');

UPDATE UnitPromotions
SET	EnemyHealChange = 10,
	OutsideFriendlyLandsModifier = 20
WHERE Type = 'PROMOTION_MC_ZIMBABWE_NHEWA';

UPDATE UnitPromotions
SET	FriendlyHealChange = 10,
	FriendlyLandsModifier = 20
WHERE Type = 'PROMOTION_MC_ZIMBABWE_NGARA';
--==========================================================================================================================
-- UnitPromotions_Terrains
--==========================================================================================================================	
INSERT INTO UnitPromotions_Terrains		
			(PromotionType, 					TerrainType, 		DoubleMove)
VALUES		('PROMOTION_MC_ZIMBABWE_MHARA', 	'TERRAIN_PLAINS', 	1);
--==========================================================================================================================
-- UnitPromotions_UnitCombats
--==========================================================================================================================
INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 									UnitCombatType)
SELECT		'PROMOTION_MC_ZIMBABWE_MHARA', 						UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_HIMEJI_CASTLE';

INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 									UnitCombatType)
SELECT		'PROMOTION_MC_ZIMBABWE_NHEWA', 						UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_HIMEJI_CASTLE';

INSERT INTO UnitPromotions_UnitCombats
			(PromotionType, 									UnitCombatType)
SELECT		'PROMOTION_MC_ZIMBABWE_NGARA', 						UnitCombatType
FROM UnitPromotions_UnitCombats WHERE PromotionType = 'PROMOTION_HIMEJI_CASTLE';
--==========================================================================================================================
-- Language_en_US
--==========================================================================================================================
INSERT OR REPLACE INTO Language_en_US (Tag, Text) 
VALUES
	(
		'TXT_KEY_TRAIT_TOTEMIC_LINEAGE_TOOLTIP',
		'[COLOR_POSITIVE_TEXT]Totemic Lineage[ENDCOLOR][NEWLINE][NEWLINE][ICON_PRODUCTION] Production spent on Buildings and Wonders contribute towards the establishment of a new Clan Lineage when the Building is completed. Each Clan Lineage provides a Trade Slot and a cumulative bonus.[NEWLINE]----------------[NEWLINE][COLOR_YIELD_FOOD]Progress towards next Clan Lineage: {1}[ICON_PRODUCTION]/{2}[ICON_PRODUCTION][ENDCOLOR][NEWLINE][NEWLINE]{3} more [ICON_PRODUCTION] Production is needed to establish another Clan Lineage.[NEWLINE]----------------[NEWLINE][COLOR_POSITIVE_TEXT]Click to view/hide available and established Clan Lineages.'	
	),
	(
		'TXT_KEY_TRAIT_TOTEMIC_LINEAGE_TOOLTIP_COMPLETE',
		'[COLOR_POSITIVE_TEXT]Totemic Lineage[ENDCOLOR][NEWLINE][NEWLINE][ICON_PRODUCTION] Production spent on Buildings and Wonders contribute towards the establishment of a new Clan Lineage when the Building is completed. Each Clan Lineage provides a Trade Slot and a cumulative bonus.[NEWLINE]----------------[NEWLINE]You have reached the maximum level. No more Clan Lineages may be established.[NEWLINE]----------------[NEWLINE][COLOR_POSITIVE_TEXT]Click to view/hide available and established Clan Lineages.'	
	),
	(
		'TXT_KEY_TRAIT_TOTEMIC_LINEAGE_NOTIFICATION',
		'A new Clan Lineages can now be established! Use the progress banner to establish a new Clan Lineage.'	
	),
	(
		'TXT_KEY_PROMOTION_MC_ZIMBABWE_MHARA_HELP',
		'Double movement rate through Plains.'	
	),
	(
		'TXT_KEY_PROMOTION_MC_ZIMBABWE_NHEWA_HELP',
		'+10 Hit Points when healing in Enemy Territory. +20% Combat Bonus in Enemy Territory'	
	),
	(
		'TXT_KEY_PROMOTION_MC_ZIMBABWE_NGARA_HELP',
		'+10 Hit Points when healing in Friendly Territory. +20% Combat Bonus in Friendly Territory'	
	),
	('TXT_KEY_TRAIT_MC_ZIMBABWE_HOVE',			'Hove - "Fish"'),
	('TXT_KEY_TRAIT_MC_ZIMBABWE_MHARA',			'Mhara - "Antelope"'),
	('TXT_KEY_TRAIT_MC_ZIMBABWE_NYATI',			'Nyati - "Buffalo"'),
	('TXT_KEY_TRAIT_MC_ZIMBABWE_DZIVA',			'Dziva - "Pool"'),
	('TXT_KEY_TRAIT_MC_ZIMBABWE_MBIZI',			'Mbizi - "Zebra"'),
	('TXT_KEY_TRAIT_MC_ZIMBABWE_NZOU',			'Nzou - "Elephant"'),
	('TXT_KEY_TRAIT_MC_ZIMBABWE_NHEWA',			'Nhewa - "Leopard"'),
	('TXT_KEY_TRAIT_MC_ZIMBABWE_NGARA',			'Ngara - "Porcupine"'),
	('TXT_KEY_TRAIT_MC_ZIMBABWE_MOYO',			'Moyo - "Heart"'),
	(
		'TXT_KEY_TRAIT_MC_ZIMBABWE_HOVE_HELP',
		'[COLOR_POSITIVE_TEXT]Hove - "Fish"[ENDCOLOR][NEWLINE]+3 [ICON_GOLD] Gold from all your sea trade routes.'	
	),
	(
		'TXT_KEY_TRAIT_MC_ZIMBABWE_MHARA_HELP',
		'[COLOR_POSITIVE_TEXT]Mhara - "Antelope"[ENDCOLOR][NEWLINE]Double movement rate through Plains. Maintenance paid on Roads and Railroads reduced by 50%.'	
	),
	(
		'TXT_KEY_TRAIT_MC_ZIMBABWE_NYATI_HELP',
		'[COLOR_POSITIVE_TEXT]Nyati - "Buffalo"[ENDCOLOR][NEWLINE]+10% [ICON_PRODUCTION] Production when constucting Buildings and Wonders.'	
	),
	(
		'TXT_KEY_TRAIT_MC_ZIMBABWE_DZIVA_HELP',
		'[COLOR_POSITIVE_TEXT]Dziva - "Pool"[ENDCOLOR][NEWLINE]+2 [ICON_FOOD] Food per city.'	
	),
	(
		'TXT_KEY_TRAIT_MC_ZIMBABWE_MBIZI_HELP',
		'[COLOR_POSITIVE_TEXT]Mbizi - "Zebra"[ENDCOLOR][NEWLINE]+3 [ICON_GOLD] Gold from all your land trade routes. A Caravan appears near the [ICON_CAPITAL] Capital.'	
	),
	(
		'TXT_KEY_TRAIT_MC_ZIMBABWE_NZOU_HELP',
		'[COLOR_POSITIVE_TEXT]Nzou - "Elephant"[ENDCOLOR][NEWLINE]+1 [ICON_CULTURE] Culture, +1 [ICON_PRODUCTION] Production, +1 [ICON_GOLD] Gold, +1 [ICON_PEACE] Faith per Wonder.'	
	),
	(
		'TXT_KEY_TRAIT_MC_ZIMBABWE_NHEWA_HELP',
		'[COLOR_POSITIVE_TEXT]Nhewa - "Leopard"[ENDCOLOR][NEWLINE]+10 Hit Points when healing in Enemy Territory. +20% Combat Bonus in Enemy Territory'	
	),
	(
		'TXT_KEY_TRAIT_MC_ZIMBABWE_NGARA_HELP',
		'[COLOR_POSITIVE_TEXT]Ngara - "Porcupine"[ENDCOLOR][NEWLINE]+10 Hit Points when healing in Friendly Territory. +20% Combat Bonus in Friendly Territory'	
	),
	(
		'TXT_KEY_TRAIT_MC_ZIMBABWE_MOYO_HELP',
		'[COLOR_POSITIVE_TEXT]Moyo - "Heart"[ENDCOLOR][NEWLINE]4 units are maintenance-free. Receive 4 Gano Axeman units immediately.[NEWLINE][NEWLINE]Requires the "Rise of the Rozwi" Event.'	
	);
--==========================================================================================================================
--==========================================================================================================================
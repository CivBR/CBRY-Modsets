--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================	
-- Buildings
------------------------------
INSERT INTO Buildings 	
		(Type, 					BuildingClass, Cost, GoldMaintenance, PrereqTech,	 Water, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, Description, 					Civilopedia, 						Help, 									Strategy,									PlotBuyCostModifier, ArtDefineTag, 	ArtInfoEraVariation, DisplayPosition, AllowsWaterRoutes, MinAreaSize, ConquestProb, GreatPeopleRateModifier, FreshWater, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT	'BUILDING_JFD_COTHON',	BuildingClass, Cost, GoldMaintenance, 'TECH_OPTICS', Water, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, 'TXT_KEY_BUILDING_JFD_COTHON', 	'TXT_KEY_CIV5_JFD_COTHON_TEXT', 	'TXT_KEY_BUILDING_JFD_COTHON_HELP', 	'TXT_KEY_BUILDING_JFD_COTHON_STRATEGY',		-15,				 ArtDefineTag,	ArtInfoEraVariation, DisplayPosition, AllowsWaterRoutes, MinAreaSize, ConquestProb, GreatPeopleRateModifier, FreshWater, HurryCostModifier, 1, 				'JFD_CARTHAGE_DIDO_ATLAS'
FROM Buildings WHERE Type = 'BUILDING_HARBOR';	

INSERT INTO Buildings		
		(Type, 							BuildingClass, 			  		Cost, 	FaithCost,	GreatWorkCount,	GoldMaintenance, Defense,	 PrereqTech, Help,										Description, 							NeverCapture)
VALUES	('BUILDING_JFD_DIDO_CARTHAGE', 	'BUILDINGCLASS_JFD_CARTHAGE', 	-1, 	-1,			-1,				0, 				 100,		 null, 		'TXT_KEY_BUILDING_JFD_CARTHAGE_DIDO_HELP',	'TXT_KEY_BUILDING_JFD_CARTHAGE_DIDO',	1);
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
		(BuildingType, 				FlavorType, Flavor)
SELECT	'BUILDING_JFD_COTHON',		FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_HARBOR';	

INSERT INTO Building_Flavors
		(BuildingType,				FlavorType,				Flavor)
VALUES	('BUILDING_JFD_COTHON',		'FLAVOR_DEFENSE',		25),
		('BUILDING_JFD_COTHON',		'FLAVOR_CITY_DEFENSE',	20);
------------------------------	
-- Building_SeaResourceYieldChanges
------------------------------	
INSERT INTO Building_SeaResourceYieldChanges
		(BuildingType,				YieldType,		Yield)
VALUES	('BUILDING_JFD_COTHON',		'YIELD_GOLD',	1);
--==========================================================================================================================
-- RESOURCES
--==========================================================================================================================
-- Resources
------------------------------
INSERT INTO Resources 
		(Type,							Description,						Civilopedia, 								TechCityTrade, 	PolicyReveal, 				ResourceClassType, 		Happiness,  CivilizationType,			AITradeModifier, 	AIObjective,	'Unique', 	IconString, 				ArtDefineTag,						PortraitIndex, 	IconAtlas)
VALUES	('RESOURCE_JFD_SHELLFISH',		'TXT_KEY_RESOURCE_JFD_SHELLFISH',	'TXT_KEY_CIV5_RESOURCE_JFD_SHELLFISH_TEXT',	'TECH_SAILING',	'POLICY_JFD_DIDO_CARTHAGE',	'RESOURCECLASS_LUXURY',	4,			'CIVILIZATION_CARTHAGE',	20,					0, 				2, 			'[ICON_RES_JFD_SHELLFISH]',	'ART_DEF_RESOURCE_JFD_SHELLFISH',	2, 				'JFD_CARTHAGE_DIDO_ATLAS');
------------------------------
-- Resource_YieldChanges
------------------------------
INSERT INTO Resource_YieldChanges 	
		(ResourceType, 					YieldType, 			Yield)
VALUES	('RESOURCE_JFD_SHELLFISH',		'YIELD_GOLD',		2);
------------------------------
-- Resource_Flavors
------------------------------
INSERT INTO Resource_Flavors 	
		(ResourceType, 					FlavorType, 		Flavor)
VALUES	('RESOURCE_JFD_SHELLFISH', 		'FLAVOR_HAPPINESS', 10);
------------------------------
-- Resource_TerrainBooleans
------------------------------
INSERT INTO Resource_TerrainBooleans 	
		(ResourceType, 					TerrainType)
VALUES	('RESOURCE_JFD_SHELLFISH', 		'TERRAIN_COAST');
------------------------------
-- Improvement_ResourceTypes
------------------------------
INSERT INTO Improvement_ResourceTypes
		(ResourceType, 					ImprovementType)
VALUES	('RESOURCE_JFD_SHELLFISH',		'IMPROVEMENT_FISHING_BOATS');
------------------------------
-- Improvement_ResourceType_Yields
------------------------------
INSERT INTO Improvement_ResourceType_Yields
		(ResourceType, 					ImprovementType,				YieldType,		Yield)
VALUES	('RESOURCE_JFD_SHELLFISH',		'IMPROVEMENT_FISHING_BOATS',	'YIELD_GOLD',	1);
--==========================================================================================================================
-- PROMOTIONS
--==========================================================================================================================	
-- UnitPromotions
--------------------------------	
INSERT INTO UnitPromotions 
		(Type, 							Description, 								Help, 										Sound, 				IgnoreZOC,	CannotBeChosen, PortraitIndex,	IconAtlas, 			PediaType, 			PediaEntry)
VALUES	('PROMOTION_JFD_COTHON',		'TXT_KEY_PROMOTION_JFD_COTHON',				'TXT_KEY_PROMOTION_JFD_COTHON_HELP', 		'AS2D_IF_LEVELUP',	0, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_COTHON'),
		('PROMOTION_JFD_QUINQUEREME',	'TXT_KEY_PROMOTION_JFD_QUINQUEREME',		'TXT_KEY_PROMOTION_JFD_QUINQUEREME_HELP', 	'AS2D_IF_LEVELUP',	1, 			1, 				59, 			'ABILITY_ATLAS', 	'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_JFD_QUINQUEREME');
--==========================================================================================================================	
-- UNITS
--==========================================================================================================================	
-- Units
--------------------------------	
UPDATE Units
SET Combat = 10, Help = 'TXT_KEY_UNIT_JFD_QUINQUEREME_HELP', Strategy = 'TXT_KEY_UNIT_JFD_QUINQUEREME_STRATEGY'
WHERE Type = 'UNIT_CARTHAGINIAN_QUINQUEREME'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_UU' AND Value = 1);	
--------------------------------
-- Unit_FreePromotions
--------------------------------	
INSERT INTO Unit_FreePromotions 	
		(UnitType, 							PromotionType)
VALUES	('UNIT_CARTHAGINIAN_QUINQUEREME', 	'PROMOTION_JFD_QUINQUEREME');
--==========================================================================================================================	
-- LEADERS
--==========================================================================================================================	
-- Leaders
----------------------------------		
UPDATE Leaders
SET DoFWillingness = 8, Forgiveness = 8
WHERE Type = 'LEADER_DIDO'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_UA' AND Value = 1);	
----------------------------------	
-- Leader_Flavors
--------------------------------	
UPDATE Leader_Flavors
SET Flavor = 7
WHERE LeaderType = 'LEADER_DIDO' AND FlavorType IN ('FLAVOR_I_TRADE_DESTINATION', 'FLAVOR_I_LAND_TRADE_ROUTE', 'FLAVOR_CITY_DEFENSE')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_UA' AND Value = 1);	

UPDATE Leader_Flavors
SET Flavor = 4
WHERE LeaderType = 'LEADER_DIDO' AND FlavorType IN ('FLAVOR_OFFENSE', 'FLAVOR_MILITARY_TRAINING', 'FLAVOR_MOBILE', 'FLAVOR_EXPANSION')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_UA' AND Value = 1);	
----------------------------------	
-- Leader_Traits
--------------------------------	
UPDATE Leader_Traits 
SET TraitType = 'TRAIT_JFD_CARTHAGE_DIDO'
WHERE LeaderType = 'LEADER_DIDO'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_UA' AND Value = 1);	
--==========================================================================================================================	
-- TRAITS
--==========================================================================================================================	
-- Traits
--------------------------------	
INSERT INTO Traits 
		(Type, 							Description, 						ShortDescription)
VALUES	('TRAIT_JFD_CARTHAGE_DIDO', 	'TXT_KEY_TRAIT_JFD_CARTHAGE_DIDO', 	'TXT_KEY_TRAIT_JFD_CARTHAGE_DIDO_SHORT');
--------------------------------	
-- Trait_FreePromotionUnitCombats
--------------------------------	
INSERT INTO Policies
		(Type,							Description)
VALUES	('POLICY_JFD_DIDO_CARTHAGE',	'TXT_KEY_TRAIT_JFD_CARTHAGE_DIDO');
--------------------------------	
-- Trait_FreePromotionUnitCombats
--------------------------------	
INSERT INTO Trait_FreePromotionUnitCombats
		(TraitType,						UnitCombatType,		PromotionType)
SELECT	'TRAIT_JFD_CARTHAGE_DIDO',		Type,				'PROMOTION_JFD_COTHON'
FROM UnitCombatInfos WHERE Type IN ('UNITCOMBAT_NAVALMELEE', 'UNITCOMBAT_NAVALRANGED');
--==========================================================================================================================	
-- CIVILIZATIONS
--==========================================================================================================================	
-- Civilization_CityNames
--------------------------------	
UPDATE Civilization_CityNames
SET CityName = 'TXT_KEY_CITY_NAME_JFD_QART_HADASHT'
WHERE CivilizationType = 'CIVILIZATION_CARTHAGE' AND CityName = 'TXT_KEY_CITY_NAME_CARTHAGE';
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------		
DELETE FROM Civilization_UnitClassOverrides WHERE CivilizationType = 'CIVILIZATION_CARTHAGE';
INSERT INTO Civilization_UnitClassOverrides 
		(CivilizationType, 			UnitClassType, 				UnitType)
VALUES	('CIVILIZATION_CARTHAGE', 	'UNITCLASS_TRIREME', 		'UNIT_CARTHAGINIAN_QUINQUEREME');
--------------------------------	
-- Civilization_BuildingClassOverrides 
--------------------------------		
DELETE FROM Civilization_BuildingClassOverrides WHERE CivilizationType = 'CIVILIZATION_CARTHAGE'
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_UB' AND Value = 1);
INSERT INTO Civilization_BuildingClassOverrides 
		(CivilizationType, 			BuildingClassType, 			BuildingType)
SELECT	'CIVILIZATION_CARTHAGE', 	'BUILDINGCLASS_HARBOR', 	'BUILDING_JFD_COTHON'
WHERE EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CIVILIZATIONS_CARTHAGE_UB' AND Value = 1);
--==========================================================================================================================
--==========================================================================================================================
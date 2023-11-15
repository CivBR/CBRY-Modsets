--==========================================================================================================================	
-- BUILDINGS
--==========================================================================================================================
-- BuildingClasses
--------------------------------	
INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_MC_ZIMBABWE', 		'BUILDING_MC_DZIMBABWE_1', 				'TXT_KEY_BUILDING_MC_DZIMBABWE_1');
--------------------------------	
-- Buildings: Invisible
--------------------------------
INSERT INTO Buildings
			(Type, 								BuildingClass, 					Description,								GreatWorkCount,	Cost,	FaithCost,	PrereqTech, 	NeverCapture)
VALUES		('BUILDING_MC_DZIMBABWE_1', 		'BUILDINGCLASS_MC_ZIMBABWE',	'TXT_KEY_BUILDING_MC_DZIMBABWE_1',			-1, 			-1,   		-1,		null,			1),
			('BUILDING_MC_DZIMBABWE_2', 		'BUILDINGCLASS_MC_ZIMBABWE',	'TXT_KEY_BUILDING_MC_DZIMBABWE_2',			-1, 			-1,   		-1,		null,			1);

UPDATE Buildings
SET	
	Defense 		= 	100
WHERE Type = 'BUILDING_MC_DZIMBABWE_2';
--------------------------------
-- Buildings
--------------------------------	
INSERT INTO Buildings
		(Type, 						BuildingClass, Cost, GoldMaintenance, PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	Description,						 Help,									Civilopedia,						Strategy,									ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	IconAtlas,				ConquestProb, 	PortraitIndex)
SELECT	'BUILDING_MC_DZIMBABWE',	BuildingClass, Cost, GoldMaintenance, PrereqTech, ExtraCityHitPoints,	Defense, ArtInfoCulturalVariation,	AllowsRangeStrike,	'TXT_KEY_BUILDING_MC_DZIMBABWE',	'TXT_KEY_BUILDING_MC_DZIMBABWE_HELP',	'TXT_KEY_CIV5_MC_DZIMBABWE_TEXT',	'TXT_KEY_BUILDING_MC_DZIMBABWE_STRATEGY',	ArtDefineTag, MinAreaSize, 	HurryCostModifier, 	'MC_ZIMBABWE_ATLAS',	ConquestProb, 	2
FROM Buildings WHERE Type = 'BUILDING_CASTLE';	
--------------------------------	
-- Building_ClassesNeededInCity
--------------------------------					
INSERT INTO Building_ClassesNeededInCity
		(BuildingType, 			BuildingClassType)
SELECT	'BUILDING_MC_DZIMBABWE',	BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_CASTLE';
------------------------------	
-- Building_Flavors
------------------------------		
INSERT INTO Building_Flavors 	
			(BuildingType, 			FlavorType, Flavor)
SELECT		('BUILDING_MC_DZIMBABWE'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_CASTLE');
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================	
INSERT INTO Building_YieldChanges
			(BuildingType, 					YieldType, 				Yield)
VALUES		('BUILDING_MC_DZIMBABWE_1',		'YIELD_PRODUCTION',		1),
			('BUILDING_MC_DZIMBABWE_1',		'YIELD_CULTURE',		1);
--==========================================================================================================================
--==========================================================================================================================
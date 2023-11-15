--==========================================================================================================================	
-- BuildingClasses
--==========================================================================================================================	
INSERT INTO BuildingClasses 	
			(Type, 						DefaultBuilding, 			Description)
VALUES		('BUILDINGCLASS_BURMAUA', 	'BUILDING_BURMAUA', 		'TXT_KEY_TRAIT_YAMA_ZATDAW_SHORT');
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings 	
			(Type, 					BuildingClass, 				Description,						GreatWorkCount, Cost, FaithCost, PrereqTech, 	NeverCapture)
VALUES		('BUILDING_BURMAUA', 	'BUILDINGCLASS_BURMAUA',	'TXT_KEY_TRAIT_YAMA_ZATDAW_SHORT',	-1, 			-1,   -1, 		 null,			1);
--==========================================================================================================================	
-- Buildings
--==========================================================================================================================	
INSERT INTO Buildings 	
			(Type, 					BuildingClass, Cost, FreeStartEra, GoldMaintenance, PrereqTech, Description, 						Civilopedia, 							Help, 								Strategy,							 ArtDefineTag, MinAreaSize, ConquestProb, GreatWorkSlotType, GreatWorkCount, GreatPeopleRateModifier, HurryCostModifier, PortraitIndex, 	IconAtlas)
SELECT		('BUILDING_PAYA'),		BuildingClass, Cost, FreeStartEra, GoldMaintenance, PrereqTech, ('TXT_KEY_BUILDING_PAYA_DESC'),		('TXT_KEY_CIV5_BUILDING_PAYA_TEXT'),	('TXT_KEY_BUILDING_PAYA_HELP'),		('TXT_KEY_BUILDING_PAYA_STRATEGY'),	 ArtDefineTag, MinAreaSize, ConquestProb, GreatWorkSlotType, GreatWorkCount, GreatPeopleRateModifier, HurryCostModifier, 2, 				('BURMA_ATLAS')
FROM Buildings WHERE (Type = 'BUILDING_AMPHITHEATER');	
--==========================================================================================================================	
-- Building_Flavors
--==========================================================================================================================		
INSERT INTO Building_Flavors 	
			(BuildingType, 		FlavorType, Flavor)
SELECT		('BUILDING_PAYA'),	FlavorType, Flavor
FROM Building_Flavors WHERE (BuildingType = 'BUILDING_AMPHITHEATER');

INSERT INTO Building_Flavors
			(BuildingType, 		FlavorType, 	Flavor)
VALUES		('BUILDING_PAYA',	'FLAVOR_GOLD',	20);
--==========================================================================================================================
-- Building_RemoteGreatPeoplePoints
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS Building_RemoteGreatPeoplePoints	(
	BuildingType text,
	SpecialistType text,
	RateChange integer default 0,
	Modified boolean default 1,
	Capital boolean default 1
);

INSERT INTO Building_RemoteGreatPeoplePoints 	
			(BuildingType, 			SpecialistType, 		RateChange,		Modified,	Capital)
VALUES		('BUILDING_BURMAUA',	'SPECIALIST_WRITER', 	1,				1,			1),
			('BUILDING_PAYA',		'SPECIALIST_WRITER', 	1,				1,			1);
--==========================================================================================================================	
-- Building_YieldFromGreatWorksInBuilding
--==========================================================================================================================		
CREATE TABLE IF NOT EXISTS Building_YieldFromGreatWorksInBuilding (
  BuildingType text,
  YieldType text,
  Yield integer default 0
);

INSERT INTO Building_YieldFromGreatWorksInBuilding
			(BuildingType, 			YieldType, 				Yield)
VALUES		('BUILDING_PAYA', 		'YIELD_GOLD', 			3);
--==========================================================================================================================	
-- Building_YieldChanges
--==========================================================================================================================
INSERT INTO Building_YieldChanges 	
			(BuildingType, 				YieldType, 				Yield)
VALUES		('BUILDING_PAYA', 			'YIELD_CULTURE', 		1),
			('BUILDING_BURMAUA', 		'YIELD_CULTURE', 		2);
--==========================================================================================================================	
--==========================================================================================================================	
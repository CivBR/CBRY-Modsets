-- --==========================================================================================================================	
-- -- BuildingClasses
-- --==========================================================================================================================	
-- INSERT INTO BuildingClasses 	
-- 			(Type, 						 		 				DefaultBuilding, 							Description)
-- VALUES		('BUILDINGCLASS_JFD_CORAL_CHURCH_GROWTH', 			'BUILDING_JFD_CORAL_CHURCH_GROWTH', 		'TXT_KEY_BUILDING_JFD_CORAL_CHURCH_GROWTH'),
-- 			('BUILDINGCLASS_JFD_KATIPUNERO_IDEOLOGY', 			'BUILDING_JFD_KATIPUNERO_IDEOLOGY', 		'TXT_KEY_BUILDING_JFD_KATIPUNERO_IDEOLOGY'),
-- 			('BUILDINGCLASS_JFD_KATIPUNERO_IDEOLOGY_MINOR', 	'BUILDING_JFD_KATIPUNERO_IDEOLOGY_MINOR',	'TXT_KEY_BUILDING_JFD_KATIPUNERO_IDEOLOGY_MINOR');
-- --==========================================================================================================================	
-- -- Buildings
-- --==========================================================================================================================	
-- INSERT INTO Buildings 	
-- 			(Type, 							BuildingClass, PrereqTech,			Cost, GoldMaintenance, MinAreaSize, Water, DisplayPosition, AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, ArtInfoEraVariation, NeverCapture, 	Description, 							Civilopedia, 							Help, 										Strategy,										ArtDefineTag, PortraitIndex, 	IconAtlas)
-- SELECT		('BUILDING_JFD_CORAL_CHURCH'),  BuildingClass, ('TECH_COMPASS'),	Cost, 0, 			   MinAreaSize, Water, DisplayPosition, AllowsWaterRoutes, TradeRouteSeaDistanceModifier, TradeRouteSeaGoldBonus, ArtInfoEraVariation, 1, 				('TXT_KEY_BUILDING_JFD_CORAL_CHURCH'), 	('TXT_KEY_CIV5_JFD_CORAL_CHURCH_TEXT'), ('TXT_KEY_BUILDING_JFD_CORAL_CHURCH_HELP'), ('TXT_KEY_BUILDING_JFD_CORAL_CHURCH_STRATEGY'),	ArtDefineTag, 3, 				('JFD_PHILIPPINES_ATLAS')
-- FROM Buildings WHERE Type = 'BUILDING_HARBOR';		
-- 
-- INSERT INTO Buildings 	
-- 			(Type, 						 				BuildingClass, 									TrainedFreePromotion, 		FreeBuilding,									GreatWorkCount, Cost,	 FaithCost,  PrereqTech, Description, 										Help,													IconAtlas,					PortraitIndex)
-- VALUES		('BUILDING_JFD_CORAL_CHURCH_GROWTH', 		'BUILDINGCLASS_JFD_CORAL_CHURCH_GROWTH', 		null, 						null,											-1, 			-1,		-1, 		 null, 		 'TXT_KEY_BUILDING_JFD_CORAL_CHURCH_GROWTH', 		'TXT_KEY_BUILDING_JFD_CORAL_CHURCH_HELP',				'JFD_PHILIPPINES_ATLAS',	0),
-- 			('BUILDING_JFD_KATIPUNERO_IDEOLOGY', 		'BUILDINGCLASS_JFD_KATIPUNERO_IDEOLOGY', 		null, 						'BUILDINGCLASS_JFD_KATIPUNERO_IDEOLOGY_MINOR',	-1, 			-1,		-1, 		 null, 		 'TXT_KEY_BUILDING_JFD_KATIPUNERO_IDEOLOGY', 		'TXT_KEY_BUILDING_JFD_KATIPUNERO_IDEOLOGY_HELP',		'JFD_PHILIPPINES_ATLAS',	0),
-- 			('BUILDING_JFD_KATIPUNERO_IDEOLOGY_MINOR', 	'BUILDINGCLASS_JFD_KATIPUNERO_IDEOLOGY_MINOR', 	'PROMOTION_JFD_KATIPUNAN', 	null,											-1, 			-1,		-1, 		 null, 		 'TXT_KEY_BUILDING_JFD_KATIPUNERO_IDEOLOGY_MINOR', 	'TXT_KEY_BUILDING_JFD_KATIPUNERO_IDEOLOGY_MINOR_HELP',	'JFD_PHILIPPINES_ATLAS',	0);
-- --==========================================================================================================================	
-- -- Building_YieldChanges
-- --==========================================================================================================================	
-- INSERT INTO Building_YieldChanges 	
-- 			(BuildingType, 									YieldType, 			Yield)
-- VALUES		('BUILDING_JFD_CORAL_CHURCH', 					'YIELD_FAITH',		2);
-- --==========================================================================================================================	
-- -- Building_YieldModifiers
-- --==========================================================================================================================	
-- INSERT INTO Building_YieldModifiers 	
-- 			(BuildingType, 						YieldType, 		Yield)
-- VALUES		('BUILDING_JFD_CORAL_CHURCH_GROWTH', 'YIELD_FOOD',	5);
-- --==========================================================================================================================	
-- -- Building_Flavors
-- --==========================================================================================================================	
-- INSERT INTO Building_Flavors 	
-- 			(BuildingType, 						 FlavorType, Flavor)
-- SELECT		('BUILDING_JFD_CORAL_CHURCH'),		 FlavorType, Flavor
-- FROM Building_Flavors WHERE BuildingType = 'BUILDING_HARBOR';
-- 
-- INSERT INTO Building_Flavors 	
-- 			(BuildingType, 						 FlavorType, 		Flavor)
-- VALUES		('BUILDING_JFD_CORAL_CHURCH', 		'FLAVOR_RELIGION', 	10),
-- 			('BUILDING_JFD_CORAL_CHURCH', 		'FLAVOR_EXPANSION', 10),
-- 			('BUILDING_JFD_CORAL_CHURCH', 		'FLAVOR_GROWTH', 	20);
-- --==========================================================================================================================	
-- --==========================================================================================================================	
-- --Note from Sasquatch: I couldn't properly define the Culture Dummy Building in SQL without breaking the whole file because I'm an idiot. It's defined in .xml, hidden in GameText.--
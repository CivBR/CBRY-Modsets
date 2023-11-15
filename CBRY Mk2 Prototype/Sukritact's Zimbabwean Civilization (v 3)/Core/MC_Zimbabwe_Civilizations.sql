--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 	
			(Type, 								Description,							ShortDescription, 							Adjective, 								Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 					ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 						SoundtrackTag, 		MapImage, 					DawnOfManQuote, 						DawnOfManAudio,						DawnOfManImage)
SELECT		('CIVILIZATION_MC_ZIMBABWE'), 		('TXT_KEY_MC_ZIMBABWE_DESC'),			('TXT_KEY_MC_ZIMBABWE_SHORT_DESC'), 		('TXT_KEY_MC_ZIMBABWE_ADJ'),			('TXT_KEY_CIV5_MC_ZIMBABWE_TEXT'), 			('TXT_KEY_CIV5_MC_ZIMBABWE'), 		('PLAYERCOLOR_MC_ZIMBABWE'), 			ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('MC_ZIMBABWE_ATLAS'), 		0, 				('MC_ZIMBABWE_ALPHA_ATLAS'), 			('Songhai'), 		('Map_Zimbabwe.dds'),		('TXT_KEY_CIV5_DOM_MC_ZIMBABWE_TEXT'), 	('AS2D_DOM_SPEECH_MC_ZIMBABWE'),	('DOM_Zimbabwe.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SONGHAI');
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_1'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_2'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_3'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_4'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_5'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_6'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_7'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_8'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_9'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_10'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_11'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_12'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_13'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_14'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_15'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_16'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_17'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_18'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_19'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_20'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_21'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_22'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_23'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_24'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_25'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_26'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_27'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_28'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_29'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_30'),
			('CIVILIZATION_MC_ZIMBABWE', 	'TXT_KEY_CITY_NAME_CIVILIZATION_MC_ZIMBABWE_31');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_MC_ZIMBABWE'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_SONGHAI');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_MC_ZIMBABWE'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_SONGHAI');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_MC_ZIMBABWE'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_SONGHAI');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_MC_ZIMBABWE', 	'LEADER_MC_NYATSIMBA_MUTOTA');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_MC_ZIMBABWE', 	'UNITCLASS_LONGSWORDSMAN', 	'UNIT_MC_GANO');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 			BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_MC_ZIMBABWE', 	'BUILDINGCLASS_CASTLE', 	'BUILDING_MC_DZIMBABWE');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_MC_ZIMBABWE', 	'RELIGION_PROTESTANTISM');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 				SpyName)
VALUES		('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_0'),
			('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_1'),
			('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_2'),
			('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_3'),
			('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_4'),
			('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_5'),
			('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_6'),
			('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_7'),
			('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_8'),
			('CIVILIZATION_MC_ZIMBABWE', 		'TXT_KEY_SPY_NAME_MC_ZIMBABWE_9');
--==========================================================================================================================	
-- Civilization_Start_Region_Priority
--==========================================================================================================================		
INSERT INTO Civilization_Start_Region_Priority 
			(CivilizationType, 					RegionType)
VALUES		('CIVILIZATION_MC_ZIMBABWE', 		'REGION_PLAINS');
--==========================================================================================================================
--==========================================================================================================================
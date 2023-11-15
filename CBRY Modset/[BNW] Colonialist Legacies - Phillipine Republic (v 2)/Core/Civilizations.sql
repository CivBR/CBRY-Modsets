--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================				
INSERT INTO Civilizations 	
			(Type, 								Description, 							ShortDescription, 							Adjective, 									Civilopedia, 								CivilopediaTag, 					DefaultPlayerColor, 				ArtDefineTag, ArtStyleType,			ArtStyleSuffix, ArtStylePrefix, IconAtlas, 					PortraitIndex, 	AlphaIconAtlas, 					SoundtrackTag, 	MapImage, 					DawnOfManQuote, 						DawnOfManImage,		DawnOfManAudio)
SELECT		('CIVILIZATION_JFD_PHILIPPINES'), 	('TXT_KEY_CIV_JFD_PHILIPPINES_DESC'), 	('TXT_KEY_CIV_JFD_PHILIPPINES_SHORT_DESC'), ('TXT_KEY_CIV_JFD_PHILIPPINES_ADJECTIVE'), 	('TXT_KEY_CIV5_JFD_PHILIPPINES_TEXT_1'), 	('TXT_KEY_CIV5_JFD_PHILIPPINES'), 	('PLAYERCOLOR_JFD_PHILIPPINES'), 	ArtDefineTag, ('ARTSTYLE_ASIAN'),	('_ASIA'),		('ASIAN '),		('JFD_PHILIPPINES_ATLAS'), 	0, 				('JFD_PHILIPPINES_ALPHA_ATLAS'), 	('Indonesia'), 	('PhillipinesMap512.dds'), 	('TXT_KEY_CIV5_DOM_JFD_RIZAL_TEXT'), 	('Rizal_DOM.dds'),	('AS2D_DOM_SPEECH_PHILIPPINES')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SPAIN');

UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SPAIN' )
	THEN '_SPAIN'
	ELSE '_EURO' END) 
WHERE Type = 'CIVILIZATION_JFD_PHILIPPINES';
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================			
INSERT INTO Civilization_CityNames 
			(CivilizationType, 			 CityName)
VALUES		('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_MANILA'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_CALOOCAN'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_CEBU'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_DAVAO'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_BUTUAN'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_ILOILO'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_QUEZON'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_LAGUNA'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_VIGAN'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_PANGASINAN'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_BAGUIO'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_ZAMBOANGA'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_OLONGAPO'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_LEGASPI'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_SAGADA'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_PEURTO_PRINCESA'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_BACOLOD'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_CALBAYOG'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_PASIG'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_TAGUIG'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_LEYTE'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_COTABATO'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_BACOOR'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_CABANATUAN'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_ANTIPOLO'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_MAKATI'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_DASMARINAS'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_SAN_JOSE_DEL_MONTE'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_CITY_NAME_JFD_EL_NIDO');
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 					BuildingClassType)
SELECT		('CIVILIZATION_JFD_PHILIPPINES'), 	BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_SPAIN');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 					TechType)
SELECT		('CIVILIZATION_JFD_PHILIPPINES'), 	TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_SPAIN');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 					UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_JFD_PHILIPPINES'), 	UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_SPAIN');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================			
INSERT INTO Civilization_Leaders 
			(CivilizationType, 					LeaderheadType)
VALUES		('CIVILIZATION_JFD_PHILIPPINES', 	'LEADER_JFD_RIZAL');	
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 					UnitClassType, 			 UnitType)
VALUES		('CIVILIZATION_JFD_PHILIPPINES', 	'UNITCLASS_RIFLEMAN',	'UNIT_JFD_KATIPUNERO');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides
--==========================================================================================================================		
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 					BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_JFD_PHILIPPINES', 	'BUILDINGCLASS_HARBOR',			'BUILDING_JFD_CORAL_CHURCH');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 					ReligionType)
SELECT		('CIVILIZATION_JFD_PHILIPPINES'), 	ReligionType
FROM Civilization_Religions WHERE (CivilizationType = 'CIVILIZATION_SPAIN');
--==========================================================================================================================	
-- Civilization_Start_Along_Ocean
--==========================================================================================================================		
INSERT INTO Civilization_Start_Along_Ocean 
			(CivilizationType, 					StartAlongOcean)
VALUES		('CIVILIZATION_JFD_PHILIPPINES', 	1);
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================		
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 					SpyName)
VALUES		('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_0'),	
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_1'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_2'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_3'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_4'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_5'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_6'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_7'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_8'),
			('CIVILIZATION_JFD_PHILIPPINES', 	'TXT_KEY_SPY_NAME_JFD_PHILIPPINES_9');
--==========================================================================================================================		
--==========================================================================================================================						
			
			


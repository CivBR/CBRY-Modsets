--==========================================================================================================================	
-- Civilizations
--==========================================================================================================================		
INSERT INTO Civilizations 	
			(Type, 							Description,				ShortDescription, 				Adjective, 						CivilopediaTag, 				DefaultPlayerColor, 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas, 			PortraitIndex, 	AlphaIconAtlas, 			SoundtrackTag, 		MapImage, 				DawnOfManQuote, 						DawnOfManAudio,					DawnOfManImage)
SELECT		('CIVILIZATION_BURMA'), 		('TXT_KEY_BURMA_DESC'),		('TXT_KEY_BURMA_SHORT_DESC'), 	('TXT_KEY_BURMA_ADJECTIVE'),	('TXT_KEY_CIVLOPEDIA_BURMA'), 	('PLAYERCOLOR_BURMA'), 		ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('BURMA_ATLAS'), 	0, 				('BURMA_ALPHA_ATLAS'), 		SoundtrackTag,		('BurmaMap512.dds'),	('TXT_KEY_DAWN_OF_MAN_BURMA_TEXT'), 	('AS2D_DOM_SPEECH_BURMA'),		('Burma_DOM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_SIAM');
--------------------------------	
-- Ethnic Units Support
--------------------------------	
UPDATE Civilizations 
SET ArtStyleSuffix = (CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = '_SIAM' )
	THEN '_SIAM'
	ELSE '_ASIA' END) 
WHERE Type = 'CIVILIZATION_BURMA';
--------------------------------
-- Map Labels Support
--------------------------------
CREATE TABLE IF NOT EXISTS ML_CivCultures(CivType, CultureType, CultureEra);
INSERT INTO ML_CivCultures
			(CivType,					CultureType,				CultureEra)
VALUES		('CIVILIZATION_BURMA',		'MOD_TP_SOUTHEAST_ASIAN',	'ANY');
--==========================================================================================================================	
-- Civilization_CityNames
--==========================================================================================================================	
INSERT INTO Civilization_CityNames
			(CivilizationType, 				CityName)
VALUES		('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_RANGOON'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_BAGAN'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MANDALAY'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MAWLAMYINE'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_BAGO'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_PATHEIN'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_PYAY'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MONYWA'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MEIKTILA'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_SITTWE'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MYEIK'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_TAUNGGYI'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_DAWEI'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MAYMYO'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_HENZADA'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_THATON'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_PAKOKKU'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_LASHIO'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_PYINMANA'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_YENANGYAUNG'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MOGOK'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_TOUNGOO'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MAGWAY'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MUDON'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_MYITKYINA'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_CHAUK'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_THAYETMYO'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_NYAUNGLEBIN'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_KALAY'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_SHWEBO'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_TAUNGDWINGYI'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_SAGAING'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_BOGALE'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_YAMETHIN'),
			('CIVILIZATION_BURMA', 			'TXT_KEY_CITY_NAME_BURMA_KENG_TUNG');
--------------------------------	
-- ExCE Support
--------------------------------
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);
	
INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 					ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_BURMA', 				null,									'JFD_Tai_Khmer'),
			('CIVILIZATION_BURMA', 				null,									'JFD_Oriental');
			
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
    CivilizationType                            text    REFERENCES Civilizations(Type)      default null,
    RevolutionaryCivilizationType               text    REFERENCES Civilizations(Type)      default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn   	 
			(CivilizationType,    		RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_BURMA'),		('CIVILIZATION_SIAM')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_BURMA') AND EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_SIAM');	
--==========================================================================================================================	
-- Civilization_FreeBuildingClasses
--==========================================================================================================================			
INSERT INTO Civilization_FreeBuildingClasses 
			(CivilizationType, 				BuildingClassType)
SELECT		('CIVILIZATION_BURMA'), 		BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_FreeTechs
--==========================================================================================================================		
INSERT INTO Civilization_FreeTechs 
			(CivilizationType, 				TechType)
SELECT		('CIVILIZATION_BURMA'), 		TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_FreeUnits
--==========================================================================================================================		
INSERT INTO Civilization_FreeUnits 
			(CivilizationType, 				UnitClassType, Count, UnitAIType)
SELECT		('CIVILIZATION_BURMA'), 		UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_SIAM');
--==========================================================================================================================	
-- Civilization_Leaders
--==========================================================================================================================		
INSERT INTO Civilization_Leaders 
			(CivilizationType, 				LeaderheadType)
VALUES		('CIVILIZATION_BURMA', 			'LEADER_ANAWRAHTA');
--==========================================================================================================================	
-- Civilization_UnitClassOverrides 
--==========================================================================================================================		
INSERT INTO Civilization_UnitClassOverrides 
			(CivilizationType, 				UnitClassType, 				UnitType)
VALUES		('CIVILIZATION_BURMA', 			'UNITCLASS_SWORDSMAN', 		'UNIT_BURMESE_KYUNDAW_CONSCRIPT');
--==========================================================================================================================	
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================	
INSERT INTO Civilization_BuildingClassOverrides 
			(CivilizationType, 				BuildingClassType, 				BuildingType)
VALUES		('CIVILIZATION_BURMA', 			'BUILDINGCLASS_AMPHITHEATER', 	'BUILDING_PAYA');
--==========================================================================================================================	
-- Civilization_Religions
--==========================================================================================================================		
INSERT INTO Civilization_Religions 
			(CivilizationType, 				ReligionType)
VALUES		('CIVILIZATION_BURMA', 			'RELIGION_BUDDHISM');
--==========================================================================================================================	
-- Civilization_SpyNames
--==========================================================================================================================	
INSERT INTO Civilization_SpyNames 
			(CivilizationType, 			SpyName)
VALUES		('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_0'),
			('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_1'),
			('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_2'),
			('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_3'),
			('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_4'),
			('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_5'),
			('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_6'),
			('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_7'),
			('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_8'),
			('CIVILIZATION_BURMA', 		'TXT_KEY_SPY_NAME_BURMA_9');
--==========================================================================================================================		
--==========================================================================================================================
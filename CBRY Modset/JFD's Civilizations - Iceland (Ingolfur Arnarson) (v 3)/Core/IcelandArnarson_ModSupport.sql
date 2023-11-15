--=======================================================================================================================
-- CIVILIZATIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_ColonialCityNames
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_ColonialCityNames(CivilizationType, ColonyName, LinguisticType);
INSERT INTO Civilization_JFD_ColonialCityNames 
		(CivilizationType, 						LinguisticType)
SELECT	'CIVILIZATION_JFD_ICELAND_ARNARSON',	LinguisticType
FROM Civilization_JFD_ColonialCityNames WHERE CivilizationType = 'CIVILIZATION_DENMARK';
------------------------------------------------------------------------------------------------------------------------
-- Civilizations_YnAEMP
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMP(CivilizationType, MapPrefix, X, Y, CapitalName, AltX, AltY, AltCapitalName);
INSERT INTO Civilizations_YnAEMP
		(CivilizationType,							MapPrefix,				X,		Y,		AltX,	AltY,	AltCapitalName)
VALUES	-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'AfriAsiaAust',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'AfricaLarge',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'AfriSouthEuro',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'Americas',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'Asia',					0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',		'Cordiform',			31,		41,		null,	null,	null),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',		'EarthMk3',				3,		87,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'EastAsia',				0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',		'EuroLarge',			9,		71,		null,	null,	null),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',		'EuroLargeNew',			3,		68,		null,	null,	null),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',		'GreatestEarth',		31,		61,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'IndianOcean',			0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'Mediterranean',		0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'Mesopotamia',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',		'NorthAtlantic',		63,		48,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'NorthEastAsia',		0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',		'NorthWestEurope',		2,		59,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'Orient',				0,		0,		null,	null,	null),
		-- ('CIVILIZATION_JFD_ICELAND_ARNARSON',	'SouthPacific',			0,		0,		null,	null,	null),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',		'Yagem',				2,		83,		null,	null,	null),
		('CIVILIZATION_JFD_ICELAND_ARNARSON',		'Yahem',				49,		71,		null,	null,	null);
------------------------------------------------------------------------------------------------------------------------	
-- Civilizations_YnAEMPRequestedResources
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilizations_YnAEMPRequestedResources(CivilizationType, MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6);
INSERT INTO Civilizations_YnAEMPRequestedResources
		(CivilizationType,						MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6)
SELECT	'CIVILIZATION_JFD_ICELAND_ARNARSON',	MapPrefix, Req1, Yield1, Req2, Yield2, Req3, Yield3, Req4, Yield4, Req5, Yield5, Req6, Yield6
FROM Civilizations_YnAEMPRequestedResources WHERE CivilizationType = 'CIVILIZATION_DENMARK';
------------------------------------------------------------------------------------------------------------------------
-- Civilization_JFD_CultureTypes
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SubCultureType, ArtDefineTag, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag,	SoundtrackTag, UnitDialogueTag);
INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,						ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	'CIVILIZATION_JFD_ICELAND_ARNARSON',	ArtDefineTag, CultureType, SubCultureType, DecisionsTag, DefeatScreenEarlyTag, DefeatScreenMidTag, DefeatScreenLateTag, IdealsTag, SplashScreenTag, SoundtrackTag, UnitDialogueTag
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_DENMARK';
	
UPDATE Civilizations 
SET SoundtrackTag = (SELECT SoundtrackTag FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_JFD_ICELAND_ARNARSON')
WHERE Type = 'CIVILIZATION_JFD_ICELAND_ARNARSON';
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_JFD_Governments
------------------------------------------------------------------------------------------------------------------------	
CREATE TABLE IF NOT EXISTS Civilization_JFD_Governments(CivilizationType, GovernmentType, Weight);
INSERT INTO Civilization_JFD_Governments
		(CivilizationType, 						GovernmentType,				 Weight)
VALUES	('CIVILIZATION_JFD_ICELAND_ARNARSON',	'GOVERNMENT_JFD_REPUBLIC',	 80);
------------------------------------------------------------------------------------------------------------------------	
-- Civilization_Religions
------------------------------------------------------------------------------------------------------------------------	
UPDATE Civilization_Religions
SET ReligionType = 'RELIGION_FORN_SIDR'
WHERE CivilizationType = 'CIVILIZATION_JFD_ICELAND_ARNARSON'
AND EXISTS (SELECT Type FROM Religions WHERE Type = 'RELIGION_FORN_SIDR');	
--=======================================================================================================================
--=======================================================================================================================


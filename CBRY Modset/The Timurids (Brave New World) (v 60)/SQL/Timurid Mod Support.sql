--Decisions
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('TomatekhTimuridDecisions.lua');

--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_MONGOL")
		THEN "_MONGOL"
		ELSE "_AFRI" END
	) WHERE Type = "CIVILIZATION_TIMURIDS_MOD";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						       CultureType,	CultureEra)
VALUES		('CIVILIZATION_TIMURIDS_MOD',		     'ARABIAN',		 'ANY'),
			('CIVILIZATION_TIMURIDS_MOD',		  'EAST_ASIAN',	     'ANY');

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,									FlavorType,    Flavor)
VALUES      ('LEADER_TIMUR_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         8);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS Civilization_JFD_CultureTypes(CivilizationType, CultureType, SplashScreenTag, SoundtrackTag);
 
INSERT INTO Civilization_JFD_CultureTypes
            (CivilizationType,                      CultureType,       SplashScreenTag,        SoundtrackTag)
VALUES      ('CIVILIZATION_TIMURIDS_MOD',	       'JFD_Steppe',	     'JFD_Islamic',        'JFD_Islamic');

CREATE TABLE IF NOT EXISTS
MinorCivilization_JFD_CultureTypes (
    MinorCivilizationType                       text    REFERENCES Civilizations(Type)      default null,
    CultureType                                 text                                        default null);
     
DELETE FROM MinorCivilization_JFD_CultureTypes WHERE MinorCivilizationType = 'MINOR_CIV_SAMARKAND';
INSERT INTO MinorCivilization_JFD_CultureTypes
            (MinorCivilizationType,     CultureType)
VALUES      ('MINOR_CIV_SAMARKAND',     'JFD_Islamic');

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);
     
INSERT OR REPLACE INTO Leader_SharedTraits
            (LeaderType,									  TraitOne,					  TraitTwo)
VALUES      ('LEADER_TIMUR_MOD',	          'POLICY_IMPERIALISTIC_X',		'POLICY_CHARISMATIC_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Timur[ICON_CITY_STATE][ICON_HAPPINESS_1]'
	ELSE 'TXT_KEY_LEADER_TIMUR_MOD_DESC' END) 
WHERE Type = 'LEADER_TIMUR_MOD';

CREATE TRIGGER CivIVTraitsTimur
AFTER INSERT ON Leaders WHEN 'LEADER_TIMUR_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Timur[ICON_CITY_STATE][ICON_HAPPINESS_1]'
		ELSE 'TXT_KEY_LEADER_TIMUR_MOD_DESC' END) 
	WHERE Type = 'LEADER_TIMUR_MOD';
END;	

--ExCE
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_ColonialCityNames (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	ColonyName 									text										default null,
	LinguisticType								text										default	null,
	CultureType									text										default	null);

INSERT OR REPLACE INTO Civilization_JFD_ColonialCityNames
			(CivilizationType, 						ColonyName,								LinguisticType)
VALUES		('CIVILIZATION_TIMURIDS_MOD', 			null,									'JFD_Altaic'),
			('CIVILIZATION_TIMURIDS_MOD', 			null,									'JFD_Indo_Iranian');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_PERSIA',			'CIVILIZATION_TIMURIDS_MOD'),
			('CIVILIZATION_TIMURIDS_MOD',	'CIVILIZATION_PERSIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_TIMURIDS_MOD'),		('CIVILIZATION_MUGHAL')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MUGHAL');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_TIMURIDS_MOD'),		('CIVILIZATION_MC_MUGHAL')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_MUGHAL');
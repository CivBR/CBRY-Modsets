--Polynesia
UPDATE Civilizations SET ArtDefineTag =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "ART_DEF_CIVILIZATION_POLYNESIA"
		ELSE "ART_DEF_CIVILIZATION_SIAM" END
    ) WHERE Type = "CIVILIZATION_CHAMPA_MOD";

UPDATE Civilizations SET ArtDefineTag =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "ART_DEF_CIVILIZATION_POLYNESIA"
		ELSE "ART_DEF_CIVILIZATION_SIAM" END
    ) WHERE Type = "CIVILIZATION_INDONESIA";

UPDATE Civilizations SET ArtStyleType =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "ARTSTYLE_POLYNESIAN"
		ELSE "ARTSTYLE_ASIAN" END
    ) WHERE Type = "CIVILIZATION_CHAMPA_MOD";

UPDATE Civilizations SET ArtStyleType =
	( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "ARTSTYLE_POLYNESIAN"
		ELSE "ARTSTYLE_ASIAN" END
    ) WHERE Type = "CIVILIZATION_INDONESIA";

--Ethnic Units
UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_INDONESIA")
		THEN "_INDONESIA"
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "_MED"
		ELSE "_ASIA " END ) END
	) WHERE Type = "CIVILIZATION_CHAMPA_MOD";

UPDATE Civilizations SET ArtStyleSuffix = 
	( CASE WHEN EXISTS(SELECT ArtStyleSuffix FROM Civilizations WHERE ArtStyleSuffix = "_INDONESIA")
		THEN "_INDONESIA"
		ELSE ( CASE WHEN EXISTS(SELECT Type FROM Civilizations WHERE Type="CIVILIZATION_POLYNESIA" )
		THEN "_MED"
		ELSE "_ASIA " END ) END
	) WHERE Type = "CIVILIZATION_INDONESIA";

--Map Labels
CREATE TABLE IF NOT EXISTS ML_CivCultures (ID INTEGER PRIMARY KEY AUTOINCREMENT, CivType TEXT, CultureType TEXT, CultureEra TEXT DEFAULT 'ANY');
INSERT INTO ML_CivCultures
			(CivType,						CultureType,	CultureEra)
VALUES		('CIVILIZATION_CHAMPA_MOD',	   'EAST_ASIAN',		 'ANY');

--JFD
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
    Type                                        text                                        default null,
    Value                                       integer                                     default 1);

--Piety
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,												 FlavorType,    Flavor)
VALUES      ('LEADER_CHAMPA_PO_BINASUOR_MOD',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',         2);

--Prestige
CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Governments (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    LegislatureName                 text                                                        default null,
    OfficeTitle                     text                                                        default null,
    GovernmentType                  text                                                        default null,
    Weight                          integer                                                     default 0);

CREATE TABLE IF NOT EXISTS  
    Civilization_JFD_HeadsOfGovernment (    
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    HeadOfGovernmentName            text                                                        default null);

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Titles (
    CivilizationType                text        REFERENCES Civilizations(Type)                  default null,
    CultureType                     text                                                        default null,
    ReligionType                    text        REFERENCES Religions(Type)                      default null,
    DefaultTitle                    text                                                        default null,
    UniqueTitle                     text                                                        default null,
    UseAdjective                    boolean                                                     default 0); 

CREATE TABLE IF NOT EXISTS 
    Civilization_JFD_Politics (
    CivilizationType                    text        REFERENCES Civilizations(Type)                  default null,
    PoliticsType                        text                                                        default null,
    UniqueName                          text                                                        default null);

INSERT INTO Civilization_JFD_Governments
        (CivilizationType,          LegislatureName, OfficeTitle, GovernmentType, Weight)
SELECT  ('CIVILIZATION_CHAMPA_MOD'), LegislatureName, OfficeTitle, GovernmentType, Weight
FROM Civilization_JFD_Governments WHERE CivilizationType = 'CIVILIZATION_SIAM';

INSERT INTO Civilization_JFD_HeadsOfGovernment
        (CivilizationType,          HeadOfGovernmentName)
SELECT  ('CIVILIZATION_CHAMPA_MOD'), HeadOfGovernmentName
FROM Civilization_JFD_HeadsOfGovernment WHERE CivilizationType = 'CIVILIZATION_SIAM';

INSERT INTO Civilization_JFD_Titles
        (CivilizationType,          DefaultTitle,   UniqueTitle)
SELECT  ('CIVILIZATION_CHAMPA_MOD'), DefaultTitle,   UniqueTitle
FROM Civilization_JFD_Titles WHERE CivilizationType = 'CIVILIZATION_SIAM';

INSERT INTO Civilization_JFD_Politics
        (CivilizationType,          PoliticsType, UniqueName)
SELECT  ('CIVILIZATION_CHAMPA_MOD'), PoliticsType, UniqueName
FROM Civilization_JFD_Politics WHERE CivilizationType = 'CIVILIZATION_SIAM';

INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_REFORM_GOVERNMENT'),
        ('FLAVOR_JFD_REFORM_CULTURE'),
        ('FLAVOR_JFD_REFORM_ECONOMIC'),
        ('FLAVOR_JFD_REFORM_FOREIGN'),
        ('FLAVOR_JFD_REFORM_INDUSTRY'),
        ('FLAVOR_JFD_REFORM_MILITARY'),
        ('FLAVOR_JFD_REFORM_RELIGION');

INSERT INTO Leader_Flavors
        (LeaderType,							                 FlavorType,                         Flavor)
VALUES  ('LEADER_CHAMPA_PO_BINASUOR_MOD',    'FLAVOR_JFD_REFORM_GOVERNMENT',                              5),
        ('LEADER_CHAMPA_PO_BINASUOR_MOD',       'FLAVOR_JFD_REFORM_CULTURE',                              2),
        ('LEADER_CHAMPA_PO_BINASUOR_MOD',      'FLAVOR_JFD_REFORM_ECONOMIC',                              2),
        ('LEADER_CHAMPA_PO_BINASUOR_MOD',       'FLAVOR_JFD_REFORM_FOREIGN',                              8),
        ('LEADER_CHAMPA_PO_BINASUOR_MOD',      'FLAVOR_JFD_REFORM_INDUSTRY',                              5),
        ('LEADER_CHAMPA_PO_BINASUOR_MOD',      'FLAVOR_JFD_REFORM_RELIGION',                              2);

--Cultural Diversity
CREATE TABLE IF NOT EXISTS 
Civilization_JFD_CultureTypes(
	CivilizationType 							text 	REFERENCES Civilizations(Type) 			default null,
	CultureType 								text											default null,
	ArtDefineTag								text											default	null,
	SplashScreenTag								text											default	null,
	SoundtrackTag								text											default	null,
	UnitDialogueTag								text											default null);

INSERT INTO Civilization_JFD_CultureTypes
		(CivilizationType,					ArtDefineTag, CultureType, SplashScreenTag, SoundtrackTag, UnitDialogueTag)
SELECT	('CIVILIZATION_CHAMPA_MOD'),	('JFD_Mandala'), ('JFD_Mandala'), ('JFD_Mandala'), ('JFD_Mandala'), ('AS2D_SOUND_JFD_KHMER')
FROM Civilization_JFD_CultureTypes WHERE CivilizationType = 'CIVILIZATION_SIAM';

UPDATE Civilizations 
SET SoundtrackTag = 'JFD_Mandala'
WHERE Type = 'CIVILIZATION_CHAMPA_MOD'
AND EXISTS (SELECT * FROM Civilization_JFD_CultureTypes WHERE SoundtrackTag = 'JFD_Mandala')
AND EXISTS (SELECT * FROM JFD_GlobalUserSettings WHERE Type = 'JFD_CULDIV_SOUNDTRACK_ADDON' AND Value = 1);

--Civ IV Traits
CREATE TABLE IF NOT EXISTS 
    Leader_SharedTraits (
    LeaderType          text    REFERENCES Leaders(Type)        default null,
    TraitOne            text    REFERENCES Policies(Type)       default null,
    TraitTwo            text    REFERENCES Policies(Type)       default null);

INSERT OR REPLACE INTO Leader_SharedTraits
			(LeaderType,									                  TraitOne,					TraitTwo)
SELECT		('LEADER_CHAMPA_PO_BINASUOR_MOD'),		            ('POLICY_SEAFARING_X'),	  ('POLICY_AGGRESSIVE_X')
WHERE EXISTS (SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X');

UPDATE Leaders 
SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
	THEN 'Chê Bông Nga[ICON_GREAT_EXPLORER][ICON_WAR]'
	ELSE 'TXT_KEY_LEADER_CHAMPA_PO_BINASUOR_MOD_DESC' END) 
WHERE Type = 'LEADER_CHAMPA_PO_BINASUOR_MOD';

CREATE TRIGGER CivIVTraitsTomatekhChampa
AFTER INSERT ON Leaders WHEN 'LEADER_CHAMPA_PO_BINASUOR_MOD' = NEW.Type
BEGIN
	UPDATE Leaders 
	SET Description = (CASE WHEN EXISTS(SELECT Type FROM Policies WHERE Type = 'POLICY_PHILOSOPHICAL_X' )
		THEN 'Chê Bông Nga[ICON_GREAT_EXPLORER][ICON_WAR]'
		ELSE 'TXT_KEY_LEADER_CHAMPA_PO_BINASUOR_MOD_DESC' END) 
	WHERE Type = 'LEADER_CHAMPA_PO_BINASUOR_MOD';
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
VALUES		('CIVILIZATION_CHAMPA_MOD', 			null,									'JFD_Austronesian'),
			('CIVILIZATION_CHAMPA_MOD', 			null,									'JFD_Tai_Khmer');

CREATE TABLE IF NOT EXISTS 
Civilization_JFD_RevolutionaryCivilizationsToSpawn (
	CivilizationType 							text 	REFERENCES Civilizations(Type) 		default null,
	RevolutionaryCivilizationType 				text 	REFERENCES Civilizations(Type) 		default null);
	
INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,				RevolutionaryCivilizationType)
VALUES		('CIVILIZATION_CHAMPA_MOD',		'CIVILIZATION_INDONESIA');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_CHAMPA_MOD'),		('CIVILIZATION_KHMER')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_KHMER');

INSERT INTO Civilization_JFD_RevolutionaryCivilizationsToSpawn
			(CivilizationType,					RevolutionaryCivilizationType)
SELECT		('CIVILIZATION_CHAMPA_MOD'),		('CIVILIZATION_MC_KHMER')
WHERE EXISTS (SELECT Type FROM Civilizations WHERE Type = 'CIVILIZATION_MC_KHMER');

--Mercenaries 
INSERT OR REPLACE INTO Flavors 
        (Type)
VALUES  ('FLAVOR_JFD_MERCENARY');

INSERT INTO Leader_Flavors
        (LeaderType,									      FlavorType,                 Flavor)
VALUES  ('LEADER_CHAMPA_PO_BINASUOR_MOD',         'FLAVOR_JFD_MERCENARY',                      7);

--Cultural Development
CREATE TABLE IF NOT EXISTS 
Events_CulturalDevelopments(
	CivilizationType		text  REFERENCES Civilizations(Type)	default null,
	CultureType				text									default null,
	Description				text									default null);

INSERT INTO Events_CulturalDevelopments 
			(Description,								                            CivilizationType,						          CultureType)
VALUES		('TXT_KEY_EVENT_CULDEV_TOMATEKH_CHAMPA_01',			           'CIVILIZATION_CHAMPA_MOD',					           'JFD_Oriental');
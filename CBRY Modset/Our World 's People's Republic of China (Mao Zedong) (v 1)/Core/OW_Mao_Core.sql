
--=======================================================================================================================
-- BUILDINGCLASSES
--=======================================================================================================================
-- BuildingClasses
------------------------------  
INSERT INTO BuildingClasses 
            (DefaultBuilding,                   Type,                                   Description)
VALUES      ('BUILDING_OW_DAHUITANG_THEMING_DUMMY',     'BUILDINGCLASS_OW_DAHUITANG_THEMING_DUMMY',     'TXT_KEY_BUILDING_OW_DAHUITANG_THEMING_DUMMY');
 
INSERT INTO BuildingClasses 
            (DefaultBuilding,                   Type,                                   Description)
VALUES      ('BUILDING_OW_MAO_DUMMY_SPAWN',     'BUILDINGCLASS_OW_MAO_DUMMY_SPAWN',     'TXT_KEY_BUILDING_OW_MAO_DUMMY_SPAWN');
 
--==========================================================================================================================    
-- Buildings
--==========================================================================================================================    
INSERT INTO Buildings   
            (Type,                          AllowsWaterRoutes,  GreatWorkCount, GreatWorkSlotType,  BuildingClass, PrereqTech, Cost,    FaithCost,      UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, Description,                           Civilopedia,                            Help,                                       Strategy,                                       ArtDefineTag, PortraitIndex,    IconAtlas)
SELECT      ('BUILDING_OW_DAHUITANG'),      AllowsWaterRoutes,  2,              GreatWorkSlotType,  BuildingClass, PrereqTech, Cost,    FaithCost,      UnlockedByBelief, SpecialistType, SpecialistCount, GoldMaintenance, MinAreaSize, ('TXT_KEY_BUILDING_OW_DAHUITANG'), ('TXT_KEY_BUILDING_OW_DAHUITANG_TEXT'), ('TXT_KEY_BUILDING_HELP_OW_DAHUITANG'), ('TXT_KEY_BUILDING_OW_DAHUITANG_STRATEGY'), ArtDefineTag, 3,                ('OW_PRC_MAO_ATLAS')
FROM Buildings WHERE Type = 'BUILDING_AMPHITHEATER';
 
INSERT INTO Buildings   
            (Type,                                              BuildingClass,                      GreatWorkCount, Cost,   FaithCost,  NeverCapture,    Description,                                               Help)
VALUES      ('BUILDING_OW_DAHUITANG_THEMING_DUMMY',     'BUILDINGCLASS_OW_DAHUITANG_THEMING_DUMMY', -1,             -1,     -1,         1,              'TXT_KEY_BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION',   'TXT_KEY_BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION_HELP'),
            ('BUILDING_OW_MAO_DUMMY_SPAWN',                 'BUILDINGCLASS_OW_MAO_DUMMY_SPAWN', -1,             -1,     -1,         1,              'TXT_KEY_BUILDING_JFD_DAIMYO_MELEE_BONUSES',                'TXT_KEY_BUILDING_JFD_DAIMYO_MELEE_BONUSES_HELP');

INSERT INTO Building_YieldChanges
			(BuildingType, 					YieldType, Yield)
SELECT		('BUILDING_OW_DAHUITANG'),	YieldType, Yield+2
FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_AMPHITHEATER';	

-------------------------------    
--==========================================================================================================================    
-- Building_ClassesNeededInCity
--==========================================================================================================================    
INSERT INTO Building_ClassesNeededInCity    
            (BuildingType,          BuildingClassType)
SELECT      ('BUILDING_OW_DAHUITANG'),  BuildingClassType
FROM Building_ClassesNeededInCity WHERE BuildingType = 'BUILDING_AMPHITHEATER'; 
--==========================================================================================================================    
-- Building_Flavors
--==========================================================================================================================    
INSERT INTO Building_Flavors    
            (BuildingType,          FlavorType, Flavor)
SELECT      ('BUILDING_OW_DAHUITANG'),  FlavorType, Flavor
FROM Building_Flavors WHERE BuildingType = 'BUILDING_AMPHITHEATER';
 
--==========================================================================================================================    
-- Building_ThemingBonuses
--==========================================================================================================================    
INSERT INTO Building_ThemingBonuses     
            (BuildingType,          Description,                        Bonus,  RequiresOwner,  AiPriority)
VALUES      ('BUILDING_OW_DAHUITANG',   'TXT_KEY_THEMING_BONUS_BUILDING_OW_DAHUITANG',  2,      1,              1);

--==========================================================================================================================    
--==========================================================================================================================    
--==========================================================================================================================    
-- LEADERS
--==========================================================================================================================    
-- Leaders
--------------------------------            
INSERT INTO Leaders 
            (Type,                      Description,                        Civilopedia,                        CivilopediaTag,                             ArtDefineTag,       VictoryCompetitiveness, WonderCompetitiveness,  MinorCivCompetitiveness,    Boldness,   DiploBalance,   WarmongerHate,  DenounceWillingness,    DoFWillingness, Loyalty,    Neediness,  Forgiveness,    Chattiness, Meanness,   IconAtlas,                  PortraitIndex)
VALUES      ('LEADER_OW_MAO',       'TXT_KEY_LEADER_OW_PRC_MAO',        'TXT_KEY_LEADER_OW_PRC_MAO_PEDIA',  'TXT_KEY_CIVILOPEDIA_LEADERS_OW_PRC_MAO',   'Mao_Scene.xml',    6,                      2,                      2,                          2,          8,              6,              4,                      4,              6,          3,          6,              3,          3,          'OW_PRC_MAO_ATLAS', 1);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------                    
INSERT INTO Leader_MajorCivApproachBiases 
            (LeaderType,                MajorCivApproachType,               Bias)
VALUES      ('LEADER_OW_MAO',       'MAJOR_CIV_APPROACH_WAR',           5),
            ('LEADER_OW_MAO',       'MAJOR_CIV_APPROACH_HOSTILE',       3),
            ('LEADER_OW_MAO',       'MAJOR_CIV_APPROACH_DECEPTIVE',     5),
            ('LEADER_OW_MAO',       'MAJOR_CIV_APPROACH_GUARDED',       7),
            ('LEADER_OW_MAO',       'MAJOR_CIV_APPROACH_AFRAID',        4),
            ('LEADER_OW_MAO',       'MAJOR_CIV_APPROACH_FRIENDLY',      3),
            ('LEADER_OW_MAO',       'MAJOR_CIV_APPROACH_NEUTRAL',       6);
--------------------------------
-- Leader_MajorCivApproachBiases
--------------------------------                    
INSERT INTO Leader_MinorCivApproachBiases 
            (LeaderType,                MinorCivApproachType,               Bias)
VALUES      ('LEADER_OW_MAO',       'MINOR_CIV_APPROACH_IGNORE',        3),
            ('LEADER_OW_MAO',       'MINOR_CIV_APPROACH_FRIENDLY',      3),
            ('LEADER_OW_MAO',       'MINOR_CIV_APPROACH_PROTECTIVE',    4),
            ('LEADER_OW_MAO',       'MINOR_CIV_APPROACH_CONQUEST',      4),
            ('LEADER_OW_MAO',       'MINOR_CIV_APPROACH_BULLY',         2);
--------------------------------
-- Leader_Flavors
--------------------------------                        
INSERT INTO Leader_Flavors 
            (LeaderType,                FlavorType,                         Flavor)
VALUES      ('LEADER_OW_MAO',       'FLAVOR_OFFENSE',                   7),
            ('LEADER_OW_MAO',       'FLAVOR_DEFENSE',                   3),
            ('LEADER_OW_MAO',       'FLAVOR_CITY_DEFENSE',              3),
            ('LEADER_OW_MAO',       'FLAVOR_MILITARY_TRAINING',         6),
            ('LEADER_OW_MAO',       'FLAVOR_RECON',                     4),
            ('LEADER_OW_MAO',       'FLAVOR_RANGED',                    4),
            ('LEADER_OW_MAO',       'FLAVOR_MOBILE',                    6),
            ('LEADER_OW_MAO',       'FLAVOR_NAVAL',                     3),
            ('LEADER_OW_MAO',       'FLAVOR_NAVAL_RECON',               4),
            ('LEADER_OW_MAO',       'FLAVOR_NAVAL_GROWTH',              4),
            ('LEADER_OW_MAO',       'FLAVOR_NAVAL_TILE_IMPROVEMENT',    5),
            ('LEADER_OW_MAO',       'FLAVOR_AIR',                       3),
            ('LEADER_OW_MAO',       'FLAVOR_EXPANSION',                 5),
            ('LEADER_OW_MAO',       'FLAVOR_GROWTH',                    7),
            ('LEADER_OW_MAO',       'FLAVOR_TILE_IMPROVEMENT',          9),
            ('LEADER_OW_MAO',       'FLAVOR_INFRASTRUCTURE',            6),
            ('LEADER_OW_MAO',       'FLAVOR_PRODUCTION',                5),
            ('LEADER_OW_MAO',       'FLAVOR_GOLD',                      5),
            ('LEADER_OW_MAO',       'FLAVOR_SCIENCE',                   4),
            ('LEADER_OW_MAO',       'FLAVOR_CULTURE',                   8),
            ('LEADER_OW_MAO',       'FLAVOR_HAPPINESS',                 4),
            ('LEADER_OW_MAO',       'FLAVOR_GREAT_PEOPLE',              6),
            ('LEADER_OW_MAO',       'FLAVOR_WONDER',                    3),
            ('LEADER_OW_MAO',       'FLAVOR_RELIGION',                  2),
            ('LEADER_OW_MAO',       'FLAVOR_DIPLOMACY',                 4),
            ('LEADER_OW_MAO',       'FLAVOR_SPACESHIP',                 4),
            ('LEADER_OW_MAO',       'FLAVOR_WATER_CONNECTION',          5),
            ('LEADER_OW_MAO',       'FLAVOR_NUKE',                      4),
            ('LEADER_OW_MAO',       'FLAVOR_USE_NUKE',                  7),
            ('LEADER_OW_MAO',       'FLAVOR_ESPIONAGE',                 6),
            ('LEADER_OW_MAO',       'FLAVOR_AIRLIFT',                   5),
            ('LEADER_OW_MAO',       'FLAVOR_I_TRADE_DESTINATION',       5),
            ('LEADER_OW_MAO',       'FLAVOR_I_TRADE_ORIGIN',            5),
            ('LEADER_OW_MAO',       'FLAVOR_I_SEA_TRADE_ROUTE',         5),
            ('LEADER_OW_MAO',       'FLAVOR_I_LAND_TRADE_ROUTE',        5),
            ('LEADER_OW_MAO',       'FLAVOR_ARCHAEOLOGY',               5),
            ('LEADER_OW_MAO',       'FLAVOR_AIR_CARRIER',               5);
--------------------------------
-- Leader_Traits
--------------------------------                    
INSERT INTO Leader_Traits 
            (LeaderType,                TraitType)
VALUES      ('LEADER_OW_MAO',       'TRAIT_OW_MAO');
--==========================================================================================================================    
-- TRAITS
--==========================================================================================================================    
-- Traits
--------------------------------    
INSERT INTO Traits 
            (Type,                      Description,                        ShortDescription)
VALUES      ('TRAIT_OW_MAO',    'TXT_KEY_TRAIT_OW_MAO',     'TXT_KEY_TRAIT_OW_MAO_SHORT');  
--==========================================================================================================================    
-- PROMOTIONS
--==========================================================================================================================    
-- UnitPromotions
------------------------------
INSERT INTO UnitPromotions 
            (Type,                          Description,                        Help,                                   Sound,              CannotBeChosen, PortraitIndex,  IconAtlas,          PediaType,          PediaEntry)
VALUES      ('PROMOTION_OW_MAO_SPAWNED',    'TXT_KEY_PROMOTION_OW_REDGUARD',    'TXT_KEY_PROMOTION_OW_REDGUARD_HELP',   'AS2D_IF_LEVELUP',  1,              59,             'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_OW_REDGUARD');
 
INSERT INTO UnitPromotions 
            (Type,                          Description,                        Help,                                   Sound,              CannotBeChosen, PortraitIndex,  IconAtlas,          PediaType,          PediaEntry,                         HillsDoubleMove,    MovesChange)
VALUES      ('PROMOTION_OW_MAO',            'TXT_KEY_PROMOTION_OW_REDGUARD',    'TXT_KEY_PROMOTION_OW_REDGUARD_HELP',   'AS2D_IF_LEVELUP',  1,              59,             'ABILITY_ATLAS',    'PEDIA_ATTRIBUTES', 'TXT_KEY_PROMOTION_OW_REDGUARD',    1,                  1);
 
--==========================================================================================================================    
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------    
INSERT INTO Units   
            (Class,     Type,                       PrereqTech, Combat, Cost,   FaithCost,  RequiresFaithPurchaseEnabled,   Moves,  CombatClass, Domain, DefaultUnitAI, Description,                    Civilopedia,                        Strategy,                               Help,                               MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo,                   UnitFlagIconOffset, UnitFlagAtlas,                      PortraitIndex,  IconAtlas)
SELECT      Class,      ('UNIT_OW_REDGUARD'),       PrereqTech, 42,     Cost,   FaithCost,  RequiresFaithPurchaseEnabled,   Moves,  CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_OW_REDGUARD'),   ('TXT_KEY_UNIT_OW_REDGUARD_TEXT'),  ('TXT_KEY_UNIT_OW_REDGUARD_STRATEGY'),  ('TXT_KEY_UNIT_HELP_OW_REDGUARD'),  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, ('ART_DEF_UNIT_OW_REDGUARD'),  0,                  ('OW_PRC_MAO_FLAG_REDGUARD_ATLAS'), 2,              ('OW_PRC_MAO_ATLAS')
FROM Units WHERE (Type = 'UNIT_GREAT_WAR_INFANTRY');
 
INSERT INTO Units   
            (Class,     Type,                        PrereqTech, Combat, Cost,  FaithCost,  RequiresFaithPurchaseEnabled,   Moves,  CombatClass, Domain, DefaultUnitAI, Description,                    Civilopedia,                        Strategy,                               Help,                               MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo,                   UnitFlagIconOffset, UnitFlagAtlas,                      PortraitIndex,  IconAtlas,              NoMaintenance)
SELECT      Class,      ('UNIT_OW_REDGUARD_DUMMY'),  PrereqTech, 42,     Cost,  FaithCost,  RequiresFaithPurchaseEnabled,   Moves,  CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_OW_REDGUARD'),   ('TXT_KEY_UNIT_OW_REDGUARD_TEXT'),  ('TXT_KEY_UNIT_OW_REDGUARD_STRATEGY'),  ('TXT_KEY_UNIT_HELP_OW_REDGUARD'),  MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, XPValueDefense, GoodyHutUpgradeUnitClass, ('ART_DEF_UNIT_OW_REDGUARD'),  0,                  ('OW_PRC_MAO_FLAG_REDGUARD_ATLAS'), 2,              ('OW_PRC_MAO_ATLAS'),   1
FROM Units WHERE (Type = 'UNIT_GREAT_WAR_INFANTRY');
 
--------------------------------
-- UnitGameplay2DScripts
--------------------------------    
INSERT INTO UnitGameplay2DScripts   
            (UnitType,              SelectionSound, FirstSelectionSound)
SELECT      ('UNIT_OW_REDGUARD'),   SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');    
 
INSERT INTO UnitGameplay2DScripts   
            (UnitType,              SelectionSound, FirstSelectionSound)
SELECT      ('UNIT_OW_REDGUARD_DUMMY'),     SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');    
 
--------------------------------
-- Unit_AITypes
--------------------------------    
INSERT INTO Unit_AITypes    
            (UnitType,              UnitAIType)
SELECT      ('UNIT_OW_REDGUARD'),   UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY'); 
 
INSERT INTO Unit_AITypes    
            (UnitType,              UnitAIType)
SELECT      ('UNIT_OW_REDGUARD_DUMMY'),     UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY'); 
 
--------------------------------
-- Unit_Flavors
--------------------------------    
INSERT INTO Unit_Flavors    
            (UnitType,              FlavorType, Flavor)
SELECT      ('UNIT_OW_REDGUARD'),   FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
 
INSERT INTO Unit_Flavors    
            (UnitType,              FlavorType, Flavor)
SELECT      ('UNIT_OW_REDGUARD_DUMMY'),     FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
 
--------------------------------
-- Unit_ClassUpgrades
--------------------------------    
INSERT INTO Unit_ClassUpgrades  
            (UnitType,              UnitClassType)
SELECT      ('UNIT_OW_REDGUARD'),   UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
 
INSERT INTO Unit_ClassUpgrades  
            (UnitType,              UnitClassType)
SELECT      ('UNIT_OW_REDGUARD_DUMMY'),     UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
 
--------------------------------
-- Unit_FreePromotions
--------------------------------    
INSERT INTO Unit_FreePromotions     
            (UnitType,              PromotionType)
SELECT      ('UNIT_OW_REDGUARD'),   PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
 
INSERT INTO Unit_FreePromotions     
            (UnitType,              PromotionType)
SELECT      ('UNIT_OW_REDGUARD_DUMMY'),     PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_GREAT_WAR_INFANTRY');
 
--==========================================================================================================================    
-- CIVILIZATIONS
--==========================================================================================================================    
-- Civilizations
--------------------------------        
INSERT INTO Civilizations   
            (Type,                          Description,                    ShortDescription,                   Adjective,                      Civilopedia,                        CivilopediaTag,             DefaultPlayerColor,         ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, IconAtlas,                  AlphaIconAtlas,                  PortraitIndex, SoundtrackTag,  MapImage,                   DawnOfManQuote,                       DawnOfManImage)
SELECT      ('CIVILIZATION_OW_PRC_MAO'), ('TXT_KEY_CIV_OW_PRC_MAO_DESC'), ('TXT_KEY_CIV_OW_PRC_MAO_SHORTDESC'), ('TXT_KEY_CIV_OW_PRC_MAO_ADJ'), ('TXT_KEY_CIV_OW_PRC_MAO_PEDIA'), ('TXT_KEY_CIV5_OW_PRC_MAO'), ('PLAYERCOLOR_OW_PRC_MAO'),  ArtDefineTag, ArtStyleType, ArtStyleSuffix, ArtStylePrefix, ('OW_PRC_MAO_ATLAS'),  ('OW_PRC_MAO_ALPHA_ATLAS'), 0,           SoundtrackTag,      ('Mao_map512.dds'), ('TXT_KEY_CIV5_DOM_OW_PRC_MAO_TEXT'),  ('DoM.dds')
FROM Civilizations WHERE (Type = 'CIVILIZATION_CHINA');
--------------------------------
-- Civilization_CityNames
--------------------------------        
INSERT INTO Civilization_CityNames 
            (CivilizationType,                  CityName)
VALUES      ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_1'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_2'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_3'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_4'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_5'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_6'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_7'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_8'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_9'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_10'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_11'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_12'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_13'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_14'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_15'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_16'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_17'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_18'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_19'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_20'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_21'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_22'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_23'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_24'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_25'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_26'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_27'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_28'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_29'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_30'), 
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_31'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_32'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_33'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_34'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_35'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_36'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_37'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_CITY_NAME_OW_PRC_MAO_38');
--------------------------------
-- Civilization_FreeBuildingClasses
--------------------------------        
INSERT INTO Civilization_FreeBuildingClasses 
            (CivilizationType,                  BuildingClassType)
SELECT      ('CIVILIZATION_OW_PRC_MAO'),    BuildingClassType
FROM Civilization_FreeBuildingClasses WHERE (CivilizationType = 'CIVILIZATION_CHINA');
--------------------------------
-- Civilization_FreeTechs
--------------------------------    
INSERT INTO Civilization_FreeTechs 
            (CivilizationType,                  TechType)
SELECT      ('CIVILIZATION_OW_PRC_MAO'),    TechType
FROM Civilization_FreeTechs WHERE (CivilizationType = 'CIVILIZATION_CHINA');
--------------------------------
-- Civilization_FreeUnits
--------------------------------    
INSERT INTO Civilization_FreeUnits 
            (CivilizationType,                  UnitClassType, Count, UnitAIType)
SELECT      ('CIVILIZATION_OW_PRC_MAO'),    UnitClassType, Count, UnitAIType
FROM Civilization_FreeUnits WHERE (CivilizationType = 'CIVILIZATION_CHINA');
--------------------------------
-- Civilization_Leaders
--------------------------------        
INSERT INTO Civilization_Leaders 
            (CivilizationType,                  LeaderheadType)
VALUES      ('CIVILIZATION_OW_PRC_MAO',     'LEADER_OW_MAO');
--==========================================================================================================================
-- Civilization_BuildingClassOverrides 
--==========================================================================================================================    
INSERT INTO Civilization_BuildingClassOverrides 
            (CivilizationType,              BuildingClassType,              BuildingType)
VALUES      ('CIVILIZATION_OW_PRC_MAO',     'BUILDINGCLASS_AMPHITHEATER',   'BUILDING_OW_DAHUITANG');
--------------------------------
-- Civilization_UnitClassOverrides 
--------------------------------    
INSERT INTO Civilization_UnitClassOverrides 
            (CivilizationType,                  UnitClassType,              UnitType)
VALUES      ('CIVILIZATION_OW_PRC_MAO',     'UNITCLASS_GREAT_WAR_INFANTRY',     'UNIT_OW_REDGUARD');
--------------------------------
-- Civilization_Religions
--------------------------------    
INSERT INTO Civilization_Religions
            (CivilizationType,                  ReligionType)
VALUES      ('CIVILIZATION_OW_PRC_MAO', 'RELIGION_CONFUCIANISM');
--------------------------------
-- Civilization_SpyNames
--------------------------------    
INSERT INTO Civilization_SpyNames 
            (CivilizationType,                  SpyName)
VALUES      ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_0'),   
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_1'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_2'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_3'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_4'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_5'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_6'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_7'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_8'),
            ('CIVILIZATION_OW_PRC_MAO',     'TXT_KEY_SPY_NAME_OW_PRC_MAO_9');
 
--==========================================================================================================================
--==========================================================================================================================
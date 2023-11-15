
--==========================================================================================================================
-- EventsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('PRC_MaoEvents.lua');
--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses
            (Type,                                                          DefaultBuilding)
VALUES      ('BUILDINGCLASS_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_TIMER',        'BUILDING_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_TIMER'),
            ('BUILDINGCLASS_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_DUMMY',        'BUILDING_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_DUMMY'),
            ('BUILDINGCLASS_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_TIMER',    'BUILDING_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_TIMER'),
            ('BUILDINGCLASS_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_DUMMY',    'BUILDING_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_DUMMY_1');
--==========================================================================================================================    
-- Buildings (replaces IconAtlas with OW_PRC_MAO_ATLAS)
--==========================================================================================================================
INSERT INTO Buildings
            (Type,                                                      BuildingClass,                                              Cost,   FaithCost,  PrereqTech, MinAreaSize,    GreatWorkCount, HurryCostModifier,  NeverCapture,   NukeImmune, IconAtlas,              PortraitIndex)
VALUES      ('BUILDING_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_TIMER',         'BUILDINGCLASS_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_TIMER',     -1,     -1,         null,       -1,             -1,             -1,                 1,              1,          'DMS_NURAGIC_ATLAS',    0),
            ('BUILDING_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_DUMMY',         'BUILDINGCLASS_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_DUMMY',     -1,     -1,         null,       -1,             -1,             -1,                 1,              1,          'DMS_NURAGIC_ATLAS',    0),
            ('BUILDING_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_TIMER',     'BUILDINGCLASS_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_TIMER', -1,     -1,         null,       -1,             -1,             -1,                 1,              1,          'DMS_NURAGIC_ATLAS',    0),
            ('BUILDING_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_DUMMY_1',   'BUILDINGCLASS_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_DUMMY', -1,     -1,         null,       -1,             -1,             -1,                 1,              1,          'DMS_NURAGIC_ATLAS',    0),
            ('BUILDING_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_DUMMY_2',   'BUILDINGCLASS_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_DUMMY', -1,     -1,         null,       -1,             -1,             -1,                 1,              1,          'DMS_NURAGIC_ATLAS',    0);;
--==========================================================================================================================
-- Building_YieldModifiers
--==========================================================================================================================
INSERT INTO Building_YieldModifiers
            (BuildingType,                                              YieldType,          Yield)
VALUES      ('BUILDING_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_DUMMY',         'YIELD_FOOD',       10),
            ('BUILDING_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_DUMMY_1',   'YIELD_FOOD',       -25),
            ('BUILDING_DMS_PRC_MAO_EVENT_SPARROW_POPULATION_DUMMY_2',   'YIELD_FOOD',       -10);
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies
        (Type,                                                  CityCountUnhappinessMod,    Description,                                                    Civilopedia,                                                        Help,                                                               GridX,  GridY,  PortraitIndex,  IconAtlas,      IconAtlasAchieved)
VALUES  ('POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS', 100,                        'TXT_KEY_POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS',  'TXT_KEY_POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS_TEXT', 'TXT_KEY_POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS_HELP', 1000,   1000,   47,             'POLICY_ATLAS', 'POLICY_A_ATLAS');
--==========================================================================================================================
-- Policy_SpecialistExtraYields
--==========================================================================================================================
INSERT INTO Policy_SpecialistExtraYields
            (PolicyType,                                            YieldType,          Yield)
VALUES      ('POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS', 'YIELD_SCIENCE',    1),
            ('POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS', 'YIELD_PRODUCTION', 1),
            ('POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS', 'YIELD_GOLD',       1),
            ('POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS', 'YIELD_CULTURE',    1),
            ('POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS', 'YIELD_FAITH',      1),
            ('POLICY_DMS_PRC_MAO_EVENT_HUNDRED_FLOWER_UNHAPPINESS', 'YIELD_FOOD',       1);
--==========================================================================================================================    
--========================================================================================================================== 
--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('PRC_MaoDecisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
            (Type,                                      Description) 
VALUES      ('POLICY_DMS_PRC_MAO_BACKYARD_FURANCES',    'TXT_KEY_POLICY_DMS_PRC_MAO_BACKYARD_FURANCES');
--==========================================================================================================================
-- Policy_ImprovementYieldChanges
--==========================================================================================================================
INSERT INTO Policy_ImprovementYieldChanges
            (PolicyType,                                ImprovementType,                    YieldType,          Yield) 
VALUES      ('POLICY_DMS_PRC_MAO_BACKYARD_FURANCES',    'IMPROVEMENT_FARM',                 'YIELD_PRODUCTION', 1),
            ('POLICY_DMS_PRC_MAO_BACKYARD_FURANCES',    'IMPROVEMENT_PLANTATION',           'YIELD_PRODUCTION', 1);
--==========================================================================================================================    
-- BuildingClasses
--==========================================================================================================================        
INSERT INTO BuildingClasses
            (Type,                                              DefaultBuilding,                            Description,                                            MaxGlobalInstances)                                                 
VALUES      ('BUILDINGCLASS_DMS_PRC_MAO_BACKYARD_FURANCES',     'BUILDING_DMS_PRC_MAO_BACKYARD_FURANCES',   'TXT_KEY_BUILDING_DMS_PRC_MAO_BACKYARD_FURANCES',       -1);
--==========================================================================================================================
-- Buildings
--==========================================================================================================================
INSERT INTO Buildings
            (Type,                                      BuildingClass,                                  Cost,   FaithCost,  GreatWorkCount, GoldMaintenance,    PrereqTech,     Description,                                        Help,                                                   Civilopedia,                                            Strategy,                                                   ArtDefineTag,               MinAreaSize,    IconAtlas,      PortraitIndex) 
VALUES      ('BUILDING_DMS_PRC_MAO_BACKYARD_FURANCES',  'BUILDINGCLASS_DMS_PRC_MAO_BACKYARD_FURANCES',  -1,     -1,         -1,             0,                  null,           'TXT_KEY_BUILDING_DMS_PRC_MAO_BACKYARD_FURANCES',   'TXT_KEY_BUILDING_DMS_PRC_MAO_BACKYARD_FURANCES_HELP',  'TXT_KEY_BUILDING_DMS_PRC_MAO_BACKYARD_FURANCES_PEDIA', 'TXT_KEY_BUILDING_DMS_PRC_MAO_BACKYARD_FURANCES_STRATEGY',  'ART_DEF_BUILDING_FORGE',   -1,             'BW_ATLAS_1',   2);
--==========================================================================================================================
-- Building_ResourceYieldChanges
--==========================================================================================================================
INSERT INTO Building_ResourceYieldChanges
            (BuildingType,                              ResourceType,           YieldType,              Yield) 
VALUES      ('BUILDING_DMS_PRC_MAO_BACKYARD_FURANCES',  'RESOURCE_IRON',        'YIELD_CULTURE',        2);
--==========================================================================================================================
-- Building_ResourceQuantityRequirements
--==========================================================================================================================
INSERT INTO Building_ResourceQuantityRequirements
            (BuildingType,                              ResourceType,           Cost) 
VALUES      ('BUILDING_DMS_PRC_MAO_BACKYARD_FURANCES',  'RESOURCE_IRON',        3);
--==========================================================================================================================
--==========================================================================================================================
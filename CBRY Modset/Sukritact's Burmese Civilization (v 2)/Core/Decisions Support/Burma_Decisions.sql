--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('Burma_Decisions.lua');
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type, 										Description) 
VALUES		('POLICY_DECISIONS_BURMANATS',	 	    	'TXT_KEY_DECISIONS_BURMANATS'),
			('POLICY_DECISIONS_BURMACHRONICLES',		'TXT_KEY_DECISIONS_BURMACHRONICLES');
--==========================================================================================================================
-- Policy_BuildingClassYieldChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassYieldChanges 
			(PolicyType, 							BuildingClassType,					YieldType, 				YieldChange)
VALUES 		('POLICY_DECISIONS_BURMANATS', 			'BUILDINGCLASS_AMPHITHEATER',		'YIELD_FAITH', 			1);
--==========================================================================================================================
-- Policy_BuildingClassCultureChanges
--==========================================================================================================================
INSERT INTO Policy_BuildingClassCultureChanges 
			(PolicyType, 							BuildingClassType,				CultureChange)
VALUES 		('POLICY_DECISIONS_BURMACHRONICLES', 	'BUILDINGCLASS_AMPHITHEATER',	 		1);
--==========================================================================================================================
-- Policy_BuildingClassHappiness
--==========================================================================================================================
INSERT INTO Policy_BuildingClassHappiness 
			(PolicyType, 							BuildingClassType,				Happiness)
VALUES 		('POLICY_DECISIONS_BURMANATS', 			'BUILDINGCLASS_AMPHITHEATER',	1),
		 	('POLICY_DECISIONS_BURMACHRONICLES', 	'BUILDINGCLASS_AMPHITHEATER',	1);
--==========================================================================================================================
--==========================================================================================================================
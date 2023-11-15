--==========================================================================================================================	
-- Units
--==========================================================================================================================
INSERT INTO Units 	
			(Class, 	Type, 								PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 									Civilopedia, 										Strategy, 												Help, 												MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, ObsoleteTech, 		XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, UnitArtInfo, 									UnitFlagIconOffset, UnitFlagAtlas,									PortraitIndex, 	IconAtlas,			MoveRate)
SELECT		Class, 		('UNIT_BURMESE_KYUNDAW_CONSCRIPT'), PrereqTech, Combat, Cost, 	FaithCost,	RequiresFaithPurchaseEnabled,	Moves, 	CombatClass, Domain, DefaultUnitAI, ('TXT_KEY_UNIT_BURMESE_KYUNDAW_CONSCRIPT'), 	('TXT_KEY_CIV5_BURMESE_KYUNDAW_CONSCRIPT_TEXT'), 	('TXT_KEY_UNIT_BURMESE_KYUNDAW_CONSCRIPT_STRATEGY'), 	('TXT_KEY_UNIT_HELP_BURMESE_KYUNDAW_CONSCRIPT'),  	MilitarySupport, MilitaryProduction, Pillage, IgnoreBuildingDefense, AdvancedStartCost, CombatLimit, 'TECH_GUNPOWDER',	XPValueAttack, XPValueDefense, GoodyHutUpgradeUnitClass, ('ART_DEF_UNIT_BURMESE_KYUNDAW_CONSCRIPT'),	0,					('UNIT_FLAG_BURMESE_KYUNDAW_CONSCRIPT_ATLAS'),	3, 				('BURMA_ATLAS'),	MoveRate
FROM Units WHERE (Type = 'UNIT_SWORDSMAN');
--==========================================================================================================================	
-- Unit_ResourceQuantityRequirements
--==========================================================================================================================		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 								ResourceType)
SELECT		('UNIT_BURMESE_KYUNDAW_CONSCRIPT'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_SWORDSMAN');	
--==========================================================================================================================	
-- UnitGameplay2DScripts
--==========================================================================================================================		
INSERT INTO UnitGameplay2DScripts 	
			(UnitType, 								SelectionSound, FirstSelectionSound)
SELECT		('UNIT_BURMESE_KYUNDAW_CONSCRIPT'), 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_SWORDSMAN');
--==========================================================================================================================	
-- Unit_AITypes
--==========================================================================================================================		
INSERT INTO Unit_AITypes 	
			(UnitType, 								UnitAIType)
SELECT		('UNIT_BURMESE_KYUNDAW_CONSCRIPT'), 	UnitAIType
FROM Unit_AITypes WHERE (UnitType = 'UNIT_SWORDSMAN');	
--==========================================================================================================================	
-- Unit_ClassUpgrades
--==========================================================================================================================	
INSERT INTO Unit_ClassUpgrades 	
			(UnitType, 							UnitClassType)
SELECT		('UNIT_BURMESE_KYUNDAW_CONSCRIPT'),	UnitClassType
FROM Unit_ClassUpgrades WHERE (UnitType = 'UNIT_SWORDSMAN');	
--==========================================================================================================================	
-- Unit_Flavors
--==========================================================================================================================		
INSERT INTO Unit_Flavors 	
			(UnitType, 								FlavorType, Flavor)
SELECT		('UNIT_BURMESE_KYUNDAW_CONSCRIPT'), 	FlavorType, Flavor
FROM Unit_Flavors WHERE (UnitType = 'UNIT_SWORDSMAN');	
--==========================================================================================================================
-- Unit_FreePromotions
--==========================================================================================================================
INSERT INTO Unit_FreePromotions 	
			(UnitType, 									PromotionType)
SELECT		('UNIT_BURMESE_KYUNDAW_CONSCRIPT'), 		PromotionType
FROM Unit_FreePromotions WHERE (UnitType = 'UNIT_SWORDSMAN');

INSERT INTO Unit_FreePromotions
			(UnitType, 							PromotionType)
VALUES		('UNIT_BURMESE_KYUNDAW_CONSCRIPT', 	'PROMOTION_KYUNDAW_CONSCRIPTION');
--==========================================================================================================================		
--==========================================================================================================================
--==========================================================================================================================
-- UNITS
--==========================================================================================================================
-- Units
--------------------------------
INSERT INTO Units 	
		(Type, 					Class,	PrereqTech,	Combat, FaithCost, 				RequiresFaithPurchaseEnabled, Cost,					Moves, 	CombatClass, Domain, DefaultUnitAI, Description, 			Civilopedia, 						Strategy, 							Help, 							MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,	UnitArtInfo,						UnitFlagAtlas, 		UnitFlagIconOffset, PortraitIndex,	IconAtlas)
SELECT	'UNIT_MC_GANO', 		Class,	PrereqTech, Combat, round(FaithCost * 1.1), RequiresFaithPurchaseEnabled, round(Cost * 1.1), 	Moves, 	CombatClass, Domain, DefaultUnitAI, 'TXT_KEY_UNIT_MC_GANO',	'TXT_KEY_CIV5_MC_GANO_TEXT',		'TXT_KEY_UNIT_MC_GANO_STRATEGY', 	'TXT_KEY_UNIT_MC_GANO_HELP',	MilitarySupport, MilitaryProduction, Pillage, ObsoleteTech, AdvancedStartCost, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, 	'ART_DEF_UNIT_MC_ZIMBABWEAN_GANO',	'MC_GANO_FLAG',		0,					3,				'MC_ZIMBABWE_ATLAS'
FROM Units WHERE Type = 'UNIT_LONGSWORDSMAN';
--------------------------------	
-- Unit_ResourceQuantityRequirements
--------------------------------		
INSERT INTO Unit_ResourceQuantityRequirements 	
			(UnitType, 								ResourceType)
SELECT		('UNIT_MC_GANO'), 	ResourceType
FROM Unit_ResourceQuantityRequirements WHERE (UnitType = 'UNIT_LONGSWORDSMAN');	
--------------------------------
-- UnitGameplay2DScripts
--------------------------------
INSERT INTO UnitGameplay2DScripts 	
		(UnitType, 			SelectionSound, FirstSelectionSound)
SELECT	'UNIT_MC_GANO', 	SelectionSound, FirstSelectionSound
FROM UnitGameplay2DScripts WHERE UnitType = 'UNIT_IROQUOIAN_MOHAWKWARRIOR';	
--------------------------------
-- Unit_AITypes
--------------------------------
INSERT INTO Unit_AITypes 	
		(UnitType, 			UnitAIType)
SELECT	'UNIT_MC_GANO', 	UnitAIType
FROM Unit_AITypes WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_Flavors
--------------------------------
INSERT INTO Unit_Flavors 	
		(UnitType, 			FlavorType, Flavor)
SELECT	'UNIT_MC_GANO', 	FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_FreePromotions
--------------------------------
INSERT INTO Unit_FreePromotions 	
		(UnitType, 			PromotionType)
SELECT	'UNIT_MC_GANO', 	PromotionType
FROM Unit_FreePromotions WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--------------------------------
-- Unit_ClassUpgrades
--------------------------------
INSERT INTO Unit_ClassUpgrades 	
		(UnitType, 			UnitClassType)
SELECT	'UNIT_MC_GANO',		UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = 'UNIT_LONGSWORDSMAN';
--==========================================================================================================================
--==========================================================================================================================
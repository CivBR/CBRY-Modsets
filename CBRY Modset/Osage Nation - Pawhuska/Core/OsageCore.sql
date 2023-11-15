-- Osage by Gragg9 - Draft
-------------------------------------------------------------

Insert or Replace into Leaders
		(Type,	Description,	Civilopedia,	CivilopediaTag,	ArtDefineTag,	VictoryCompetitiveness,	WonderCompetitiveness,	MinorCivCompetitiveness,	Boldness,	DiploBalance,	WarmongerHate,	WorkAgainstWillingness,	WorkWithWillingness,	DenounceWillingness,	DoFWillingness, Loyalty,	Neediness,	Forgiveness,	Chattiness, Meanness,	IconAtlas,	PortraitIndex)
VALUES	('LEADER_GR_PAWHUSKA',	'TXT_KEY_LEADER_GR_PAWHUSKA',	'TXT_KEY_LEADER_GR_PAWHUSKA_PEDIA',	'TXT_KEY_CIVILOPEDIA_LEADERS_GR_PAWHUSKA',	'OsageLeaderscene.xml',	6,	3,	6,	7,	5,	7,	5,	5,	6,	5,	4,	3,	6,	4,	7,	'GR_OSAGE_ATLAS',	1);

-----

Insert or Replace into Leader_MajorCivApproachBiases
		(LeaderType,	MajorCivApproachType,	Bias)
VALUES	('LEADER_GR_PAWHUSKA',	'MAJOR_CIV_APPROACH_WAR',	6),
		('LEADER_GR_PAWHUSKA',	'MAJOR_CIV_APPROACH_HOSTILE',	7),
		('LEADER_GR_PAWHUSKA',	'MAJOR_CIV_APPROACH_DECEPTIVE',	4),
		('LEADER_GR_PAWHUSKA',	'MAJOR_CIV_APPROACH_GUARDED',	6),
		('LEADER_GR_PAWHUSKA',	'MAJOR_CIV_APPROACH_AFRAID',	4),
		('LEADER_GR_PAWHUSKA',	'MAJOR_CIV_APPROACH_FRIENDLY',	5),
		('LEADER_GR_PAWHUSKA',	'MAJOR_CIV_APPROACH_NEUTRAL',	5);

-----


Insert or Replace into Leader_MinorCivApproachBiases
		(LeaderType,	MinorCivApproachType,	Bias)
VALUES	('LEADER_GR_PAWHUSKA',	'MINOR_CIV_APPROACH_IGNORE',	4),
		('LEADER_GR_PAWHUSKA',	'MINOR_CIV_APPROACH_FRIENDLY',	3),
		('LEADER_GR_PAWHUSKA',	'MINOR_CIV_APPROACH_PROTECTIVE',	4),
		('LEADER_GR_PAWHUSKA',	'MINOR_CIV_APPROACH_CONQUEST',	7),
		('LEADER_GR_PAWHUSKA',	'MINOR_CIV_APPROACH_BULLY',	7);

-----

Insert or Replace into Leader_Flavors
		(LeaderType,	FlavorType,	Flavor)
VALUES	('LEADER_GR_PAWHUSKA',	'FLAVOR_OFFENSE',	8),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_DEFENSE',	8),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_CITY_DEFENSE',	6),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_MILITARY_TRAINING',	8),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_RECON',	5),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_RANGED',	6),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_MOBILE',	4),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_NAVAL',	4),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_NAVAL_RECON',	3),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_NAVAL_GROWTH',	3),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_NAVAL_TILE_IMPROVEMENT',	4),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_AIR',	4),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_EXPANSION',	8),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_GROWTH',	6),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_TILE_IMPROVEMENT',	4),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_INFRASTRUCTURE',	4),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_PRODUCTION',	6),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_GOLD',	2),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_SCIENCE',	6),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_CULTURE',	6),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_HAPPINESS',	6),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_GREAT_PEOPLE',	6),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_WONDER',	2),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_RELIGION',	2),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_DIPLOMACY',	3),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_SPACESHIP',	2),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_WATER_CONNECTION',	4),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_NUKE',	2),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_USE_NUKE',	2),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_ESPIONAGE',	4),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_AIRLIFT',	5),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_I_TRADE_DESTINATION',	7),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_I_TRADE_ORIGIN',	6),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_I_SEA_TRADE_ROUTE',	5),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_I_LAND_TRADE_ROUTE',	7),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_ARCHAEOLOGY',	2),
		('LEADER_GR_PAWHUSKA',	'FLAVOR_AIR_CARRIER',	2);

-----

Insert or Replace into Leader_Traits
		(LeaderType,	TraitType)
VALUES	('LEADER_GR_PAWHUSKA',	'TRAIT_GR_PAWHUSKA');

--Traits

Insert or Replace into Traits
		(Type,	Description,	ShortDescription)
VALUES	('TRAIT_GR_PAWHUSKA',	'TXT_KEY_TRAIT_GR_PAWHUSKA',	'TXT_KEY_TRAIT_GR_PAWHUSKA_SHORT');

--Civilizations

Insert or Replace into Civilizations
		(Type,	Description,	ShortDescription,	Adjective,	CivilopediaTag,	DefaultPlayerColor,	ArtDefineTag,	ArtStyleType,	ArtStyleSuffix,	ArtStylePrefix,	IconAtlas,	PortraitIndex,	AlphaIconAtlas,	MapImage,	DawnOfManQuote,	DawnOfManImage, DawnOfManAudio)
VALUES	('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_SHORT',	'TXT_KEY_CIVILIZATION_GR_OSAGE_ADJ',	'TXT_KEY_CIV5_GR_OSAGE',	'PLAYERCOLOR_GR_OSAGE',	'ART_DEF_CIVILIZATION_GR_OSAGE',	'ARTSTYLE_SOUTH_AMERICA',	'_AMER',	'AMERICAN',	'GR_OSAGE_ATLAS',	0,	'GR_OSAGE_ALPHA',	'OsageMap.dds',	'TXT_KEY_CIVILIZATION_GR_OSAGE_DOM',	'OsageDOM.dds', 'AS2D_DOM_SPEECH_OSAGE');

-----

Insert or Replace into Civilization_CityNames
		(CivilizationType,	CityName)
VALUES	('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_1'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_2'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_3'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_4'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_5'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_6'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_7'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_8'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_9'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_10'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_11'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_12'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_13'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_14'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_15'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_16'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_17'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_18'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_19'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_20'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_21'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_22'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_23'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_24'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_25'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_26'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_27'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_28'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_29'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_30'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_CIVILIZATION_GR_OSAGE_CITY_31');

--Units

Insert or Replace into Units
		(Type,	Description,	Civilopedia,	Strategy,	Help,	Combat,	Cost,	Moves,	BaseSightRange,	Class,	CombatClass,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	Pillage,	IgnoreBuildingDefense,	PrereqTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel,	CombatLimit,	XPValueAttack,	XPValueDefense,	UnitArtInfo,	ShowInPedia,	MoveRate,	UnitFlagIconOffset,	PortraitIndex,	IconAtlas,	UnitFlagAtlas)
SELECT	('UNIT_GR_ODON'),	('TXT_KEY_UNIT_GR_ODON'),	('TXT_KEY_UNIT_GR_ODON_PEDIA'),	('TXT_KEY_UNIT_GR_ODON_STRATEGY'),	('TXT_KEY_UNIT_GR_ODON_HELP'),	16,	80,	2,	BaseSightRange,	Class,	CombatClass,	Domain,	DefaultUnitAI,	MilitarySupport,	MilitaryProduction,	1,	IgnoreBuildingDefense,	PrereqTech,	GoodyHutUpgradeUnitClass,	AdvancedStartCost,	MinAreaSize,	NukeDamageLevel, CombatLimit,	XPValueAttack,	XPValueDefense,	('ART_DEF_UNIT_GR_ODON'),	1,	MOVERATE,	0,	2,	('GR_OSAGE_ATLAS'),	('GR_ODON_ALPHA')
FROM Units WHERE (Type = 'UNIT_PIKEMAN');

Insert or Replace into Units
		(Type,  Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Immobile, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description,  Help,  Strategy,  Civilopedia,  MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, Suicide, Pillage, ObsoleteTech, AdvancedStartCost, NukeDamageLevel, AirUnitCap, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,  UnitArtInfo,  UnitFlagAtlas, UnitFlagIconOffset,    IconAtlas, PortraitIndex,  MoveRate)
SELECT    'UNIT_GR_OSAGE_'||Type,   'UNITCLASS_GR_OSAGE_'||Class,    CombatClass, WorkRate, PrereqTech, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Immobile, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description,    Help,    Strategy,     Civilopedia, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, Suicide, Pillage, ObsoleteTech, AdvancedStartCost, NukeDamageLevel, AirUnitCap, MinAreaSize, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset,  IconAtlas, PortraitIndex, MoveRate
FROM Units WHERE Type IN (SELECT UnitType FROM Unit_ResourceQuantityRequirements);
-----

Insert or Replace into Unit_AITypes
		(UnitType,	UnitAIType)
VALUES	('UNIT_GR_ODON',	'UNITAI_ATTACK'),
		('UNIT_GR_ODON',	'UNITAI_DEFENSE');

-----

Insert or Replace into Unit_Flavors
		(UnitType,	FlavorType,	Flavor)
VALUES	('UNIT_GR_ODON',	 'FLAVOR_OFFENSE',	10),
		('UNIT_GR_ODON',	 'FLAVOR_DEFENSE',	10);

Insert or Replace into Unit_Flavors
(UnitType, FlavorType, Flavor)
SELECT 'UNIT_GR_OSAGE_'||UnitType, FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType IN (SELECT UnitType FROM Unit_ResourceQuantityRequirements);

-----

Insert or Replace into UnitClasses
		(Type,    Description,    DefaultUnit)
SELECT 'UNITCLASS_GR_OSAGE_'||Type,    Description,    'UNIT_GR_OSAGE_'||DefaultUnit
FROM UnitClasses WHERE DefaultUnit IN (SELECT UnitType FROM Unit_ResourceQuantityRequirements);

-----

Insert or Replace into Unit_ClassUpgrades
		(UnitType,	UnitClassType)
VALUES	('UNIT_GR_ODON', 'UNITCLASS_LANCER');
Insert or Replace into Unit_ClassUpgrades
		(UnitType, UnitClassType)
SELECT 'UNIT_GR_OSAGE_'||UnitType, UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType IN (SELECT UnitType FROM Unit_ResourceQuantityRequirements);

-----

Insert or Replace into UnitGameplay2DScripts
		(UnitType,	SelectionSound,	FirstSelectionSound)
SELECT	('UNIT_GR_ODON'),	SelectionSound,	FirstSelectionSound
FROM UnitGameplay2DScripts WHERE (UnitType = 'UNIT_PIKEMAN');


--Defines

Insert or Replace into Unit_FreePromotions
(UnitType, PromotionType)
SELECT 'UNIT_GR_OSAGE_'||UnitType, PromotionType
FROM Unit_FreePromotions WHERE UnitType IN (SELECT UnitType FROM Unit_ResourceQuantityRequirements);

Insert or Replace into Civilization_FreeBuildingClasses
		(CivilizationType,			BuildingClassType)
VALUES	('CIVILIZATION_GR_OSAGE',	'BUILDINGCLASS_PALACE');

Insert or Replace into Civilization_FreeTechs
		(CivilizationType,			TechType)
VALUES	('CIVILIZATION_GR_OSAGE',	'TECH_AGRICULTURE');

Insert or Replace into	Civilization_FreeUnits
		(CivilizationType,			UnitClassType,			UnitAIType,	Count)
VALUES	('CIVILIZATION_GR_OSAGE',	'UNITCLASS_SETTLER',	'UNITAI_SETTLE',	1);

Insert or Replace into Civilization_Leaders
		(CivilizationType, 			LeaderheadType)
VALUES	('CIVILIZATION_GR_OSAGE',	'LEADER_GR_PAWHUSKA');

INSERT INTO Civilization_BuildingClassOverrides
		(CivilizationType,			BuildingClassType,		BuildingType)
VALUES	('CIVILIZATION_GR_OSAGE',	'BUILDINGCLASS_STOCK_EXCHANGE',	'BUILDING_OSAGE_MINERAL_COUNCIL');

Insert or Replace into Civilization_UnitClassOverrides
		(CivilizationType,			UnitClassType, 		UnitType)
VALUES	('CIVILIZATION_GR_OSAGE',	'UNITCLASS_PIKEMAN', 'UNIT_GR_ODON');

Insert or Replace into	Civilization_Religions
		(CivilizationType,			ReligionType)
VALUES	('CIVILIZATION_GR_OSAGE',	'RELIGION_PROTESTANTISM');

Insert or Replace into Civilization_SpyNames
		(CivilizationType,			SpyName)
VALUES	('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_1'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_2'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_3'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_4'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_5'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_6'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_7'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_8'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_9'),
		('CIVILIZATION_GR_OSAGE',	'TXT_KEY_GR_OSAGE_SPY_10');

Insert or Replace into Civilization_Start_Region_Priority
		(CivilizationType,	RegionType)
VALUES	('CIVILIZATION_GR_OSAGE',	'REGION_HILLS');

Insert or Replace into Diplomacy_Responses
		(LeaderType,	ResponseType,	Response)
VALUES	('LEADER_GR_PAWHUSKA',	'RESPONSE_FIRST_GREETING',	'TXT_KEY_LEADER_GR_PAWHUSKA_GREETING_%'),
		('LEADER_GR_PAWHUSKA',	'RESPONSE_DEFEATED',	'TXT_KEY_LEADER_GR_PAWHUSKA_DEFEATED');

CREATE TRIGGER IF NOT EXISTS GR_OSAGEUnit_Insert
AFTER INSERT ON Unit_ResourceQuantityRequirements
BEGIN
INSERT OR REPLACE INTO Units
		(Type,  Class,    CombatClass, WorkRate,Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Immobile, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description,  Help,  Strategy,  Civilopedia,  MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, Suicide, Pillage, ObsoleteTech, AdvancedStartCost, NukeDamageLevel, AirUnitCap, MinAreaSize, PrereqTech, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription,  UnitArtInfo,  UnitFlagAtlas, UnitFlagIconOffset,    IconAtlas, PortraitIndex,  MoveRate)
SELECT    'UNIT_GR_OSAGE_'||Type,   'UNITCLASS_GR_OSAGE_'||Class,    CombatClass, WorkRate, Combat, RangedCombat, Range, FaithCost, RequiresFaithPurchaseEnabled, Cost, Moves, Immobile, Domain, DefaultUnitAI, CivilianAttackPriority, Special, Description,    Help,    Strategy,     Civilopedia, MilitarySupport, MilitaryProduction, IgnoreBuildingDefense, Mechanized, Suicide, Pillage, ObsoleteTech, AdvancedStartCost, NukeDamageLevel, AirUnitCap, MinAreaSize, PrereqTech, GoodyHutUpgradeUnitClass, CombatLimit, XPValueAttack, XPValueDefense, Conscription, UnitArtInfo, UnitFlagAtlas, UnitFlagIconOffset,  IconAtlas, PortraitIndex, MoveRate
FROM Units WHERE Type = (NEW.UnitType);

Insert or Replace into UnitClasses
(Type,    Description,    DefaultUnit)
SELECT 'UNITCLASS_GR_OSAGE_'||Type,    Description,    'UNIT_GR_OSAGE_'||DefaultUnit
FROM UnitClasses WHERE DefaultUnit = NEW.UnitType;

Insert or Replace into Unit_ClassUpgrades
	(UnitType, UnitClassType)
SELECT 'UNIT_GR_OSAGE_'||UnitType, UnitClassType
FROM Unit_ClassUpgrades WHERE UnitType = NEW.UnitType;

Insert or Replace into Unit_FreePromotions
	(UnitType, PromotionType)
SELECT 'UNIT_GR_OSAGE_'||UnitType, PromotionType
FROM Unit_FreePromotions WHERE UnitType = NEW.UnitType;

Insert or Replace into Unit_Flavors
	(UnitType, FlavorType, Flavor)
SELECT 'UNIT_GR_OSAGE_'||UnitType, FlavorType, Flavor
FROM Unit_Flavors WHERE UnitType = NEW.UnitType;
END;

--==========================================================================================================================
-- BUILDINGS
--==========================================================================================================================

INSERT INTO Buildings
		(Type,						Description,						Civilopedia,								Strategy,									Help,									Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	PortraitIndex,	IconAtlas,				GoldMaintenance,	Espionage,	EspionageModifier)
SELECT	'BUILDING_OSAGE_MINERAL_COUNCIL',	'TXT_KEY_BUILDING_OSAGE_MINERAL_COUNCIL',	'TXT_KEY_BUILDING_OSAGE_MINERAL_COUNCIL_PEDIA',	'TXT_KEY_BUILDING_OSAGE_MINERAL_COUNCIL_STRATEGY',	'TXT_KEY_BUILDING_OSAGE_MINERAL_COUNCIL_HELP',	Cost,	HurryCostModifier,	MinAreaSize,	Happiness,	BuildingClass,	ArtDefineTag,	PrereqTech,	3,				'GR_OSAGE_ATLAS',	GoldMaintenance,	Espionage,	EspionageModifier
FROM Buildings WHERE (Type = 'BUILDING_STOCK_EXCHANGE');

INSERT INTO Building_YieldChanges
		(BuildingType,		YieldType,	Yield)
SELECT	'BUILDING_OSAGE_MINERAL_COUNCIL',	YieldType,	Yield
FROM Building_YieldChanges WHERE (BuildingType = 'BUILDING_STOCK_EXCHANGE');

------------------------------

INSERT INTO BuildingClasses
		(Type, 						 		DefaultBuilding, 				Description)
VALUES	('BUILDINGCLASS_OSAGE_ODON_XP', 		'BUILDING_OSAGE_ODON_XP',	'TXT_KEY_BUILDING_OSAGE_ODON_XP');

INSERT INTO Buildings
		(Type, 						 			BuildingClass, 					SpecialistCount, SpecialistType,		PrereqTech, Cost, FaithCost, GreatWorkCount,	GoldMaintenance, MinAreaSize,	NeverCapture,	Description, 									Help, 												Strategy,										Civilopedia, 							ArtDefineTag, PortraitIndex, IconAtlas)
VALUES	('BUILDING_OSAGE_ODON_XP', 			'BUILDINGCLASS_OSAGE_ODON_XP',	0,				 null,					null,		 -1,   -1,		  -1,				0,				 0,				1,				'TXT_KEY_BUILDING_OSAGE_ODON',			'TXT_KEY_BUILDING_OSAGE_ODON_XP',			null,											null,									null,		  0, 			 'BW_ATLAS_1');

INSERT INTO Building_DomainFreeExperiences
		(BuildingType, 						 	DomainType, 	Experience)
VALUES	('BUILDING_OSAGE_ODON_XP', 		'DOMAIN_LAND',	1);

INSERT INTO Building_ResourceYieldChanges
        (BuildingType, ResourceType,  YieldType,  Yield)
SELECT  'BUILDING_OSAGE_PROD_DUMMY',  Type,    'YIELD_PRODUCTION',  2
FROM Resources WHERE ResourceClassType IN ('RESOURCECLASS_RUSH',    'RESOURCECLASS_MODERN') AND NOT Type IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS');

INSERT INTO Building_ResourceYieldChanges
        (BuildingType, ResourceType,  YieldType,  Yield)
SELECT  'BUILDING_OSAGE_CULTURE_DUMMY',  Type,    'YIELD_CULTURE',  2
FROM Resources WHERE ResourceClassType IN ('RESOURCECLASS_RUSH',    'RESOURCECLASS_MODERN') AND NOT Type IN ('RESOURCE_ARTIFACTS', 'RESOURCE_HIDDEN_ARTIFACTS');






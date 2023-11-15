--==========================================================================================================================
-- DecisionsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS DecisionsAddin_Support(FileName);
INSERT INTO DecisionsAddin_Support (FileName) VALUES ('MC_Zimbabwe_Decisions.lua');
--==========================================================================================================================
-- EventsAddin_Support
--==========================================================================================================================
CREATE TABLE IF NOT EXISTS EventsAddin_Support(FileName);
INSERT INTO EventsAddin_Support (FileName) VALUES ('MC_Zimbabwe_Events.lua');
--==========================================================================================================================
-- BuildingClasses
--==========================================================================================================================
INSERT INTO BuildingClasses 	
		(Type, 						 		DefaultBuilding, 						Description)
VALUES	('BUILDINGCLASS_MC_CURVA', 			'BUILDING_MC_CURVA', 					'TXT_KEY_EVENT_ZIMBABWECURVA');
--==========================================================================================================================	
-- Buildings: Invisible
--==========================================================================================================================
INSERT INTO Buildings
			(Type, 								BuildingClass, 					Description,								GreatWorkCount,	Cost,	FaithCost,	PrereqTech, 	NeverCapture)
VALUES		('BUILDING_MC_CURVA', 				'BUILDINGCLASS_MC_CURVA',		'TXT_KEY_EVENT_ZIMBABWECURVA',				-1, 			-1,   		-1,		null,			1);

UPDATE Buildings
SET	
	TradeRouteRecipientBonus 		= 	1,
	TradeRouteTargetBonus 			= 	1
WHERE Type = 'BUILDING_MC_CURVA';
--==========================================================================================================================
-- Policies
--==========================================================================================================================
INSERT INTO Policies 
			(Type, 											Description) 
VALUES		('POLICY_DECISIONS_ZIMBABWEMASONRY',			'TXT_KEY_DECISIONS_ZIMBABWEMASONRY'),
			('POLICY_DECISIONS_ZIMBABWEMUTAPA',				'TXT_KEY_DECISIONS_ZIMBABWEMUTAPA');
--==========================================================================================================================
-- Policy_BuildingClassProductionModifiers
--==========================================================================================================================
INSERT INTO Policy_BuildingClassProductionModifiers 
			(PolicyType, 									BuildingClassType,				ProductionModifier)
VALUES 		('POLICY_DECISIONS_ZIMBABWEMASONRY', 			'BUILDINGCLASS_WALLS',	 		100),
			('POLICY_DECISIONS_ZIMBABWEMASONRY', 			'BUILDINGCLASS_CASTLE',	 		100);
------------------------------------------------------------
-- Policy_JFD_CivilizationNames
------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_JFD_CivilizationNames (
	PolicyType							 	text	REFERENCES Policies(TYPE)			   	DEFAULT NULL,
	CivilizationType						text	REFERENCES Civilizations(TYPE)		  	DEFAULT NULL,
	Description								text											DEFAULT NULL,
	ShortDescription						text											DEFAULT NULL,
	Adjective							   	text											DEFAULT NULL);
   
INSERT INTO Policy_JFD_CivilizationNames	
		(PolicyType,									CivilizationType,		  		Adjective,									  	Description,								ShortDescription)
VALUES  ('POLICY_DECISIONS_ZIMBABWEMUTAPA',				'CIVILIZATION_MC_ZIMBABWE',   	'TXT_KEY_CIV_MC_MUTAPA_ADJECTIVE',   			'TXT_KEY_CIV_MC_MUTAPA_DESC',				'TXT_KEY_CIV_MC_MUTAPA_SHORT_DESC');
--==========================================================================================================================
-- Language_en_US
--==========================================================================================================================
INSERT INTO Language_en_US (Tag, Text)
VALUES
	(
		'TXT_KEY_EVENT_ZIMBABWEROZWI',
		'Rise of the Rozwi'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWEROZWI_DESC',
		'A powerful faction has begun to grow in our lands. Strong loyalty to their leader and dissatisfaction with their lot in life in the Zimbabwe plateau. The Rozwi, or ''destroyers'', are disciplined fighters ready to unify the Shona peoples and create a new type of state. If we do not embrace them we may well find ourselves overrun against our will.'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWEROZWI_OUTCOME_1',
		'Interesting...'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWEROZWI_OUTCOME_1_DESC',
		'[ICON_BULLET][COLOR_POSITIVE_TEXT]The Moyo Totem is now unlocked'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWEROZWI_OUTCOME_1_NOTIFICATION',
		'The Rozwi have risen in the {1}!'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWECURVA',
		'Foreigners Reject the Curva'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWECURVA_DESC',
		'Foreign merchants in our lands have always sought our approval and paid us the Curva tax in order to be granted free access to our nation''s goods. Yet a number of upstart foreign traders are refusing to pay us their dues.'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_1',
		'Confiscate their goods! Zimbabwe will have what is owed to her!'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_1_DESC',
		'[ICON_BULLET][COLOR_POSITIVE_TEXT]Gain {1_Num} [ICON_GOLD] Gold[ENDCOLOR]'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_1_NOTIFICATION',
		'The {1} has confiscated the goods of a number of merchants who refused to pay Curva Taxes.'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_2',
		'Perhaps abolishing this tax will encourage more trade...'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_2_DESC',
		'[ICON_BULLET][COLOR_POSITIVE_TEXT]Trade Routes to you generate +1 [ICON_GOLD] Gold for you and +1 [ICON_GOLD] Gold for the trade route owner.[ENDCOLOR]'
	),
	(
		'TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_2_NOTIFICATION',
		'The Curva Tax has been abolished in the {1}.'
	),
	(
		'TXT_KEY_DECISIONS_ZIMBABWEMASONRY',
		'Embrace Mapungubwe Masonry'
	),
	(
		'TXT_KEY_DECISIONS_ZIMBABWEMASONRY_DESC',
		'We owe much to the Kingdom of Mapungubwe. It is from them that we have inherited the style and technique we use to construct our stone houses and our fortified cities which has allowed us to control and expand our Kingdom so effectively. We should have our architects study, embrace and refine Mapungubwe masonry that our empire may continue to awe and impress.[NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be Zimbabwe
		[NEWLINE][ICON_BULLET]Must have researched Masonry
		[NEWLINE][ICON_BULLET]May only be enacted once per game
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]{1} [ICON_CULTURE] Culture
		[NEWLINE][ICON_BULLET]1 [ICON_MAGISTRATES] Magistrates
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Receive 20% more [ICON_PRODUCTION] Production towards founding a Clan Lineage when a Building or Wonder is completed.
		[NEWLINE][ICON_BULLET]Build Walls and Dzimbabwes in half the usual time'
	),
	(
		'TXT_KEY_DECISIONS_ZIMBABWEMASONRY_ENACTED_DESC',
		'We owe much to the Kingdom of Mapungubwe. It is from them that we have inherited the style and technique we use to construct our stone houses and our fortified cities which has allowed us to control and expand our Kingdom so effectively. We should have our architects study, embrace and refine Mapungubwe masonry that our empire may continue to awe and impress.[NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Receive 20% more [ICON_PRODUCTION] Production towards founding a Clan Lineage when a Building or Wonder is completed.
		[NEWLINE][ICON_BULLET]Build Walls and Dzimbabwes in half the usual time'
	),
	(
		'TXT_KEY_CIV_MC_MUTAPA_ADJECTIVE',
		'Mutapan'
	),
	(
		'TXT_KEY_CIV_MC_MUTAPA_DESC',
		'Mutapan Empire'
	),
	(
		'TXT_KEY_CIV_MC_MUTAPA_SHORT_DESC',
		'Mutapa'
	),
	(
		'TXT_KEY_DECISIONS_ZIMBABWEMUTAPA',
		'Finance an expedition for {1}'
	),
	(
		'TXT_KEY_DECISIONS_ZIMBABWEMUTAPA_DESC',
		'There are rumors of a source of {1} in nearby lands. We must seize this great opportunity and send for an expedition to settle there and gain us access to these valuable riches! It shall be the dawn of a new era for Zimbabwe![NEWLINE]
		[NEWLINE]Requirement/Restrictions:
		[NEWLINE][ICON_BULLET]Player must be Zimbabwe
		[NEWLINE][ICON_BULLET]May not be enacted after the end of the Medieval Era[NEWLINE][ICON_BULLET]May only be enacted once per game
		[NEWLINE]Costs:
		[NEWLINE][ICON_BULLET]{2} [ICON_GOLD] Gold
		[NEWLINE][ICON_BULLET]2 {3}
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Receive a free Settler
		[NEWLINE][ICON_BULLET]The empire becomes known as the Kingdom of Mutapa upon settling your next City
		[NEWLINE][ICON_BULLET]Receive sources of {4} {1} near the next City you settle'
	),
	(
		'TXT_KEY_DECISIONS_ZIMBABWEMUTAPA_ENACTED_DESC',
		'There are rumors of a source of {1} in nearby lands. We must seize this great opportunity and send for an expedition to settle there and gain us access to these valuable riches! It shall be the dawn of a new era for Zimbabwe![NEWLINE]
		[NEWLINE]Rewards:
		[NEWLINE][ICON_BULLET]Receive a free Settler
		[NEWLINE][ICON_BULLET]The empire becomes known as the Kingdom of Mutapa upon settling your next City
		[NEWLINE][ICON_BULLET]Receive sources of {2} {1} near the next City you settle'
	);
--==========================================================================================================================
--==========================================================================================================================
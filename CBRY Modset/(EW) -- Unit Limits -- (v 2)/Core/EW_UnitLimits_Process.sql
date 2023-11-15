INSERT INTO Processes
		(Type,						Description,					Help,									Strategy,								PortraitIndex,	IconAtlas)
VALUES	('PROCESS_EW_UNIT_FOOD',	'TXT_KEY_PROCESS_EW_UNIT_FOOD',	'TXT_KEY_PROCESS_EW_UNIT_FOOD_HELP',	'TXT_KEY_PROCESS_EW_UNIT_FOOD_HELP',	11,				'CITIZEN_ATLAS');

INSERT INTO Process_ProductionYields
		(ProcessType,				YieldType,	Yield)
VALUES	('PROCESS_EW_UNIT_FOOD',	'YIELD_FOOD',	1);

INSERT INTO Process_Flavors
		(ProcessType,				FlavorType,			Flavor)
VALUES	('PROCESS_EW_UNIT_FOOD',	'FLAVOR_GROWTH',	1);
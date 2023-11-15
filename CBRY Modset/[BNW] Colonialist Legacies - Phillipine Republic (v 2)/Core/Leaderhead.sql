--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 					Civilopedia, 						CivilopediaTag, 							ArtDefineTag, 			VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 					PortraitIndex)
VALUES		('LEADER_JFD_RIZAL', 		'TXT_KEY_LEADER_JFD_RIZAL', 	'TXT_KEY_LEADER_JFD_RIZAL_PEDIA', 	'TXT_KEY_CIVILOPEDIA_LEADERS_JFD_RIZAL', 	'Rizal_Scene.xml',		5, 						4, 						4, 							5, 			7, 				7, 				4, 						9, 				7, 			4, 			6, 				5, 			2, 			'JFD_PHILIPPINES_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_RIZAL', 		'MAJOR_CIV_APPROACH_WAR', 			2),
			('LEADER_JFD_RIZAL', 		'MAJOR_CIV_APPROACH_HOSTILE', 		2),
			('LEADER_JFD_RIZAL', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	3),
			('LEADER_JFD_RIZAL', 		'MAJOR_CIV_APPROACH_GUARDED', 		4),
			('LEADER_JFD_RIZAL', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_JFD_RIZAL', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		8),
			('LEADER_JFD_RIZAL', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 			MinorCivApproachType, 				Bias)
VALUES		('LEADER_JFD_RIZAL', 	'MINOR_CIV_APPROACH_IGNORE', 		3),
			('LEADER_JFD_RIZAL', 	'MINOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_JFD_RIZAL', 	'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_JFD_RIZAL', 	'MINOR_CIV_APPROACH_CONQUEST', 		2),
			('LEADER_JFD_RIZAL', 	'MINOR_CIV_APPROACH_BULLY', 		2);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 			FlavorType, 						Flavor)
VALUES		('LEADER_JFD_RIZAL', 	'FLAVOR_OFFENSE', 					4),
			('LEADER_JFD_RIZAL', 	'FLAVOR_DEFENSE', 					3),
			('LEADER_JFD_RIZAL', 	'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_RECON', 					5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_RANGED', 					6),
			('LEADER_JFD_RIZAL', 	'FLAVOR_MOBILE', 					2),
			('LEADER_JFD_RIZAL', 	'FLAVOR_NAVAL', 					8),
			('LEADER_JFD_RIZAL', 	'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_NAVAL_GROWTH', 				7),
			('LEADER_JFD_RIZAL', 	'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	8),
			('LEADER_JFD_RIZAL', 	'FLAVOR_AIR', 						3),
			('LEADER_JFD_RIZAL', 	'FLAVOR_EXPANSION', 				8),
			('LEADER_JFD_RIZAL', 	'FLAVOR_GROWTH', 					8),
			('LEADER_JFD_RIZAL', 	'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_INFRASTRUCTURE', 			4),
			('LEADER_JFD_RIZAL', 	'FLAVOR_PRODUCTION', 				4),
			('LEADER_JFD_RIZAL', 	'FLAVOR_GOLD', 						5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_SCIENCE', 					5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_CULTURE', 					8),
			('LEADER_JFD_RIZAL', 	'FLAVOR_HAPPINESS', 				6),
			('LEADER_JFD_RIZAL', 	'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_JFD_RIZAL', 	'FLAVOR_WONDER', 					4),
			('LEADER_JFD_RIZAL', 	'FLAVOR_RELIGION', 					4),
			('LEADER_JFD_RIZAL', 	'FLAVOR_DIPLOMACY', 				6),
			('LEADER_JFD_RIZAL', 	'FLAVOR_SPACESHIP', 				3),
			('LEADER_JFD_RIZAL', 	'FLAVOR_WATER_CONNECTION', 			6),
			('LEADER_JFD_RIZAL', 	'FLAVOR_NUKE', 						2),
			('LEADER_JFD_RIZAL', 	'FLAVOR_USE_NUKE', 					2),
			('LEADER_JFD_RIZAL', 	'FLAVOR_ESPIONAGE', 				5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_AIRLIFT', 					2),
			('LEADER_JFD_RIZAL', 	'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_I_TRADE_ORIGIN', 			8),
			('LEADER_JFD_RIZAL', 	'FLAVOR_I_SEA_TRADE_ROUTE', 		8),
			('LEADER_JFD_RIZAL', 	'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_JFD_RIZAL', 	'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================						
INSERT INTO Leader_Traits 
			(LeaderType, 			TraitType)
VALUES		('LEADER_JFD_RIZAL', 	'TRAIT_JFD_PHILIPPINES');
--==========================================================================================================================				
--==========================================================================================================================		
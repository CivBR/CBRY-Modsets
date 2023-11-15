--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 						Description, 						Civilopedia, 							CivilopediaTag, 								ArtDefineTag, 				VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 	IconAtlas, 				PortraitIndex)
VALUES		('LEADER_ANAWRAHTA', 		'TXT_KEY_LEADER_ANAWRAHTA_DESC', 	'TXT_KEY_LEADER_ANAWRAHTA_PEDIA', 		'TXT_KEY_LEADER_ANAWRAHTA', 					'Burma_Leaderhead.xml',		5, 						6, 						5, 							6, 			5, 				2, 				7, 						5, 				5, 			5, 			5, 				4, 			7, 			'BURMA_ATLAS', 			1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 				MajorCivApproachType, 				Bias)
VALUES		('LEADER_ANAWRAHTA', 		'MAJOR_CIV_APPROACH_WAR', 			8),
			('LEADER_ANAWRAHTA', 		'MAJOR_CIV_APPROACH_HOSTILE', 		6),
			('LEADER_ANAWRAHTA', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_ANAWRAHTA', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_ANAWRAHTA', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_ANAWRAHTA', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		5),
			('LEADER_ANAWRAHTA', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		5);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 				MinorCivApproachType, 				Bias)
VALUES		('LEADER_ANAWRAHTA', 		'MINOR_CIV_APPROACH_IGNORE', 		4),
			('LEADER_ANAWRAHTA', 		'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_ANAWRAHTA', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	3),
			('LEADER_ANAWRAHTA', 		'MINOR_CIV_APPROACH_CONQUEST', 		7),
			('LEADER_ANAWRAHTA', 		'MINOR_CIV_APPROACH_BULLY', 		5);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 				FlavorType, 						Flavor)
VALUES		('LEADER_ANAWRAHTA', 		'FLAVOR_OFFENSE', 					7),
			('LEADER_ANAWRAHTA', 		'FLAVOR_DEFENSE', 					3),
			('LEADER_ANAWRAHTA', 		'FLAVOR_CITY_DEFENSE', 				5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_MILITARY_TRAINING', 		8),
			('LEADER_ANAWRAHTA', 		'FLAVOR_RECON', 					4),
			('LEADER_ANAWRAHTA', 		'FLAVOR_RANGED', 					6),
			('LEADER_ANAWRAHTA', 		'FLAVOR_MOBILE', 					6),
			('LEADER_ANAWRAHTA', 		'FLAVOR_NAVAL', 					5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_NAVAL_RECON', 				5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_NAVAL_GROWTH', 				5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_AIR', 						5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_EXPANSION', 				6),
			('LEADER_ANAWRAHTA', 		'FLAVOR_GROWTH', 					5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_INFRASTRUCTURE', 			5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_PRODUCTION', 				6),
			('LEADER_ANAWRAHTA', 		'FLAVOR_GOLD', 						6),
			('LEADER_ANAWRAHTA', 		'FLAVOR_SCIENCE', 					5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_CULTURE', 					8),
			('LEADER_ANAWRAHTA', 		'FLAVOR_HAPPINESS', 				4),
			('LEADER_ANAWRAHTA', 		'FLAVOR_GREAT_PEOPLE', 				7),
			('LEADER_ANAWRAHTA', 		'FLAVOR_WONDER', 					5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_RELIGION', 					7),
			('LEADER_ANAWRAHTA', 		'FLAVOR_DIPLOMACY', 				4),
			('LEADER_ANAWRAHTA', 		'FLAVOR_SPACESHIP', 				4),
			('LEADER_ANAWRAHTA', 		'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_NUKE', 						6),
			('LEADER_ANAWRAHTA', 		'FLAVOR_USE_NUKE', 					7),
			('LEADER_ANAWRAHTA', 		'FLAVOR_ESPIONAGE', 				5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_AIRLIFT', 					5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_I_TRADE_DESTINATION', 		5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_I_TRADE_ORIGIN', 			5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_ANAWRAHTA', 		'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 					TraitType)
VALUES		('LEADER_ANAWRAHTA', 			'TRAIT_YAMA_ZATDAW');
--==========================================================================================================================				
--==========================================================================================================================		
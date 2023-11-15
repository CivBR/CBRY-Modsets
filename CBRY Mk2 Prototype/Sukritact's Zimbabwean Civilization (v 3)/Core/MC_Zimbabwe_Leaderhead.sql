--==========================================================================================================================	
-- Leaders
--==========================================================================================================================			
INSERT INTO Leaders 
			(Type, 								Description, 								Civilopedia, 										CivilopediaTag, 											ArtDefineTag, 						VictoryCompetitiveness, WonderCompetitiveness, 	MinorCivCompetitiveness, 	Boldness, 	DiploBalance, 	WarmongerHate, 	DenounceWillingness, 	DoFWillingness, Loyalty, 	Neediness, 	Forgiveness, 	Chattiness, Meanness, 		IconAtlas, 				PortraitIndex)
VALUES		('LEADER_MC_NYATSIMBA_MUTOTA', 		'TXT_KEY_LEADER_MC_NYATSIMBA_MUTOTA', 		'TXT_KEY_LEADER_MC_NYATSIMBA_MUTOTA_PEDIA', 		'TXT_KEY_CIVILOPEDIA_LEADERS_MC_NYATSIMBA_MUTOTA', 			'Nyatsimba_Mutota_Scene.xml',		4, 						9, 						3, 							5, 			8, 				5, 				7, 						5, 				9, 			5, 			6, 				4, 			6, 				'MC_ZIMBABWE_ATLAS', 	1);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MajorCivApproachBiases 
			(LeaderType, 						MajorCivApproachType, 				Bias)
VALUES		('LEADER_MC_NYATSIMBA_MUTOTA', 		'MAJOR_CIV_APPROACH_WAR', 			6),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MAJOR_CIV_APPROACH_HOSTILE', 		7),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MAJOR_CIV_APPROACH_DECEPTIVE', 	4),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MAJOR_CIV_APPROACH_GUARDED', 		5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MAJOR_CIV_APPROACH_AFRAID', 		3),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MAJOR_CIV_APPROACH_FRIENDLY', 		6),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MAJOR_CIV_APPROACH_NEUTRAL', 		6);
--==========================================================================================================================	
-- Leader_MajorCivApproachBiases
--==========================================================================================================================						
INSERT INTO Leader_MinorCivApproachBiases 
			(LeaderType, 						MinorCivApproachType, 				Bias)
VALUES		('LEADER_MC_NYATSIMBA_MUTOTA', 		'MINOR_CIV_APPROACH_IGNORE', 		5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MINOR_CIV_APPROACH_FRIENDLY', 		4),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MINOR_CIV_APPROACH_PROTECTIVE', 	6),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MINOR_CIV_APPROACH_CONQUEST', 		6),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'MINOR_CIV_APPROACH_BULLY', 		3);
--==========================================================================================================================	
-- Leader_Flavors
--==========================================================================================================================						
INSERT INTO Leader_Flavors 
			(LeaderType, 						FlavorType, 						Flavor)
VALUES		('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_OFFENSE', 					5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_DEFENSE', 					7),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_CITY_DEFENSE', 				7),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_MILITARY_TRAINING', 		5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_RECON', 					4),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_RANGED', 					4),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_MOBILE', 					4),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_NAVAL', 					4),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_NAVAL_RECON', 				4),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_NAVAL_GROWTH', 				4),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_NAVAL_TILE_IMPROVEMENT', 	5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_AIR', 						4),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_EXPANSION', 				6),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_GROWTH', 					9),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_TILE_IMPROVEMENT', 			5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_INFRASTRUCTURE', 			7),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_PRODUCTION', 				9),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_GOLD', 						7),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_SCIENCE', 					5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_CULTURE', 					6),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_HAPPINESS', 				5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_GREAT_PEOPLE', 				6),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_WONDER', 					8),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_RELIGION', 					6),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_DIPLOMACY', 				5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_SPACESHIP', 				5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_WATER_CONNECTION', 			5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_NUKE', 						2),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_USE_NUKE', 					2),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_ESPIONAGE', 				3),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_AIRLIFT', 					2),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_I_TRADE_DESTINATION', 		7),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_I_TRADE_ORIGIN', 			7),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_I_SEA_TRADE_ROUTE', 		7),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_I_LAND_TRADE_ROUTE', 		7),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_ARCHAEOLOGY', 				5),
			('LEADER_MC_NYATSIMBA_MUTOTA', 		'FLAVOR_AIR_CARRIER', 				5);
--==========================================================================================================================	
-- Leader_Traits
--==========================================================================================================================	
INSERT INTO Leader_Traits 
			(LeaderType, 						TraitType)
VALUES		('LEADER_MC_NYATSIMBA_MUTOTA', 		'TRAIT_TOTEMIC_LINEAGE');
--==========================================================================================================================	
-- Traits
--==========================================================================================================================	
INSERT INTO Traits 
			(Type, 						Description, 						ShortDescription)
VALUES		('TRAIT_TOTEMIC_LINEAGE', 	'TXT_KEY_TRAIT_TOTEMIC_LINEAGE', 	'TXT_KEY_TRAIT_TOTEMIC_LINEAGE_SHORT');
--==========================================================================================================================	
--==========================================================================================================================	
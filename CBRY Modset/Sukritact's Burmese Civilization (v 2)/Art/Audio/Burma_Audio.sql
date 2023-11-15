--==========================================================================================================================	
-- Audio_Sounds
--==========================================================================================================================		
INSERT INTO Audio_Sounds 
			(SoundID, 										Filename, 						LoadType)
VALUES		('SND_LEADER_MUSIC_ANAWRAHTA_PEACE', 			'Burma_Peace',					'DynamicResident'),
			('SND_LEADER_MUSIC_ANAWRAHTA_WAR', 				'Burma_War', 					'DynamicResident'),
			('SND_DOM_SPEECH_BURMA', 						'Burma_DoM',					'DynamicResident');			
--==========================================================================================================================	
-- Audio_2DSounds
--==========================================================================================================================		
INSERT INTO Audio_2DSounds 
			(ScriptID, 										SoundID, 								SoundType, 			MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES		('AS2D_LEADER_MUSIC_ANAWRAHTA_PEACE', 			'SND_LEADER_MUSIC_ANAWRAHTA_PEACE', 	'GAME_MUSIC', 		100, 		100, 		1, 		 0),
			('AS2D_LEADER_MUSIC_ANAWRAHTA_WAR', 			'SND_LEADER_MUSIC_ANAWRAHTA_WAR', 		'GAME_MUSIC', 		100, 		100, 		1,		 0),
			('AS2D_DOM_SPEECH_BURMA', 						'SND_DOM_SPEECH_BURMA',					'GAME_SPEECH', 		100, 		100, 		1, 		 0);
--==========================================================================================================================		
--==========================================================================================================================		

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		
			('ART_DEF_UNIT_OW_REDGUARD', 			'Unit', 	'sv_redguard.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_OW_REDGUARD'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_RIFLEMAN');

------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_OW_REDGUARD'),			('ART_DEF_UNIT_MEMBER_OW_REDGUARD'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_RIFLEMAN');

------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_OW_REDGUARD'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');

------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_OW_REDGUARD'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');

------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_OW_REDGUARD'),			Scale,	ZOffset, Domain, ('Infantry_China_Communist_v2.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_RIFLEMAN');

------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('OW_PRC_MAO_ATLAS', 				256, 		'Mao_Atlas_256.dds',			2, 				2),
			('OW_PRC_MAO_ATLAS', 				128, 		'Mao_Atlas_128.dds',			2, 				2),
			('OW_PRC_MAO_ATLAS', 				80, 		'Mao_Atlas_80.dds',			2, 				2),
			('OW_PRC_MAO_ATLAS', 				64, 		'Mao_Atlas_64.dds',			2, 				2),
			('OW_PRC_MAO_ATLAS',				45,			'Mao_Atlas_45.dds',			2,				2),
			('OW_PRC_MAO_ATLAS', 				32, 		'Mao_Atlas_32.dds',			2, 				2),
			('OW_PRC_MAO_ALPHA_ATLAS', 		128, 		'Mao_Alpha_Atlas_128.dds',		2, 				2),
			('OW_PRC_MAO_ALPHA_ATLAS', 		80, 		'Mao_Alpha_Atlas_80.dds',		1, 				1),
			('OW_PRC_MAO_ALPHA_ATLAS', 		64, 		'Mao_Alpha_Atlas_64.dds',		1, 				1),
			('OW_PRC_MAO_ALPHA_ATLAS', 		48, 		'Mao_Alpha_Atlas_48.dds',		1, 				1),
			('OW_PRC_MAO_ALPHA_ATLAS', 		45, 		'Mao_Alpha_Atlas_45.dds',		1, 				1),
			('OW_PRC_MAO_ALPHA_ATLAS', 		32, 		'Mao_Alpha_Atlas_32.dds',		1, 				1),
			('OW_PRC_MAO_ALPHA_ATLAS', 		24, 		'Mao_Alpha_Atlas_24.dds',		1, 				1),
			('OW_PRC_MAO_ALPHA_ATLAS', 		22, 		'Mao_Alpha_Atlas_22.dds',		1, 				1),
			('OW_PRC_MAO_FLAG_REDGUARD_ATLAS', 			32, 		'MaoFlag.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_OW_PRC_MAO_ICON', 			0.824, 	0.635, 	0.271, 	1),
			('COLOR_PLAYER_OW_PRC_MAO_BACKGROUND', 	0.678,	0.149,		0.094, 	1);
------------------------------
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES		('PLAYERCOLOR_OW_PRC_MAO', 	'COLOR_PLAYER_OW_PRC_MAO_ICON',	'COLOR_PLAYER_OW_PRC_MAO_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_OW_MAO_PEACE',	'Mao_Peace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_OW_MAO_WAR', 		'Mao_War', 	'DynamicResident');			
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 							SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_OW_MAO_PEACE', 	'SND_LEADER_MUSIC_OW_MAO_PEACE', 'GAME_MUSIC', 	60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_OW_MAO_WAR', 	'SND_LEADER_MUSIC_OW_MAO_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	

--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_JFD_DAIMYO', 			'Unit', 	'sv_Daimyo.dds'),
			('ART_DEF_UNIT_JFD_MIKASA', 			'Unit', 	'sv_Mikasa.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------		
INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_DAIMYO'),			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_GENERAL_KHAN');

INSERT INTO ArtDefine_UnitInfos 
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_JFD_MIKASA'), 			DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_BATTLESHIP');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_DAIMYO'),			('ART_DEF_UNIT_MEMBER_JFD_DAIMYO'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN');

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT		('ART_DEF_UNIT_JFD_MIKASA'), 			('ART_DEF_UNIT_MEMBER_JFD_MIKASA'),		NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_BATTLESHIP');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_DAIMYO'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');

INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_MIKASA'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_DAIMYO'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,						"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_MIKASA'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_BATTLESHIP');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 										Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_JFD_DAIMYO'),			Scale,	ZOffset, Domain, ('Akazonae_Japan.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN');

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 											Scale, ZOffset, Domain, Model, 						MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_JFD_MIKASA'),				Scale, ZOffset, Domain, ('Mikasa_BB.fxsxml'),		MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_BATTLESHIP');
------------------------------
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
			(Atlas, 								IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('JFD_JAPAN_MEIJI_ATLAS', 				256, 		'JFD_MeijiIconAtlas_256.dds',			2, 				2),
			('JFD_JAPAN_MEIJI_ATLAS', 				128, 		'JFD_MeijiIconAtlas_128.dds',			2, 				2),
			('JFD_JAPAN_MEIJI_ATLAS', 				80, 		'JFD_MeijiIconAtlas_80.dds',			2, 				2),
			('JFD_JAPAN_MEIJI_ATLAS', 				64, 		'JFD_MeijiIconAtlas_64.dds',			2, 				2),
			('JFD_JAPAN_MEIJI_ATLAS', 				45, 		'JFD_MeijiIconAtlas_45.dds',			2, 				2),
			('JFD_JAPAN_MEIJI_ATLAS', 				32, 		'JFD_MeijiIconAtlas_32.dds',			2, 				2),
			('JFD_JAPAN_MEIJI_ALPHA_ATLAS', 		128, 		'JFD_MeijiAlphaIconAtlas_128.dds',		2, 				2),
			('JFD_JAPAN_MEIJI_ALPHA_ATLAS', 		80, 		'JFD_MeijiAlphaIconAtlas_80.dds',		1, 				1),
			('JFD_JAPAN_MEIJI_ALPHA_ATLAS', 		64, 		'JFD_MeijiAlphaIconAtlas_64.dds',		1, 				1),
			('JFD_JAPAN_MEIJI_ALPHA_ATLAS', 		48, 		'JFD_MeijiAlphaIconAtlas_48.dds',		1, 				1),
			('JFD_JAPAN_MEIJI_ALPHA_ATLAS', 		45, 		'JFD_MeijiAlphaIconAtlas_45.dds',		1, 				1),
			('JFD_JAPAN_MEIJI_ALPHA_ATLAS', 		32, 		'JFD_MeijiAlphaIconAtlas_32.dds',		1, 				1),
			('JFD_JAPAN_MEIJI_ALPHA_ATLAS', 		24, 		'JFD_MeijiAlphaIconAtlas_24.dds',		1, 				1),
			('JFD_JAPAN_MEIJI_ALPHA_ATLAS', 		16, 		'JFD_MeijiAlphaIconAtlas_16.dds',		1, 				1),
			('JFD_UNIT_FLAG_DAIMYO_ATLAS', 			32, 		'JFD_DaimyoUnitFlag_32.dds',			1, 				1),
			('JFD_UNIT_FLAG_MIKASA_ATLAS', 			32, 		'JFD_MikasaUnitFlag_32.dds',			1, 				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
			(Type, 											Red, 	Green, 	Blue, 	Alpha)
VALUES		('COLOR_PLAYER_JFD_JAPAN_MEIJI_ICON', 			0.815, 	0.729, 	0.309, 	1),
			('COLOR_PLAYER_JFD_JAPAN_MEIJI_BACKGROUND', 	0.525,	0,		0.109, 	1);
------------------------------
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
			(Type, 								PrimaryColor, 							SecondaryColor, 							TextColor)
VALUES		('PLAYERCOLOR_JFD_JAPAN_MEIJI', 	'COLOR_PLAYER_JFD_JAPAN_MEIJI_ICON',	'COLOR_PLAYER_JFD_JAPAN_MEIJI_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
			(SoundID, 								Filename, 		LoadType)
VALUES		('SND_LEADER_MUSIC_JFD_MEIJI_PEACE',	'Meiji_Peace', 	'DynamicResident'),
			('SND_LEADER_MUSIC_JFD_MEIJI_WAR', 		'Meiji_War', 	'DynamicResident');			
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
			(ScriptID, 								SoundID, 							SoundType, 		MinVolume, 	MaxVolume,	IsMusic,	Looping)
VALUES		('AS2D_LEADER_MUSIC_JFD_MEIJI_PEACE', 	'SND_LEADER_MUSIC_JFD_MEIJI_PEACE', 'GAME_MUSIC', 	60, 		60, 		1, 			0),
			('AS2D_LEADER_MUSIC_JFD_MEIJI_WAR', 	'SND_LEADER_MUSIC_JFD_MEIJI_WAR', 	'GAME_MUSIC', 	60, 		60, 		1,			0);
--==========================================================================================================================	
--==========================================================================================================================	

--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 		TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_SKALD',	'Unit', 	'sv_Skald.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 						DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_SKALD', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,				UnitMemberInfoType,				NumMembers)
SELECT	'ART_DEF_UNIT_JFD_SKALD', 	'ART_DEF_UNIT_MEMBER_JFD_SKALD', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SKALD',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_EARLY';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SKALD',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_EUROMALE35';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale, ZOffset, Domain, Model, 			 MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SKALD',	Scale, ZOffset, Domain, 'skald.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_EUROMALE35';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_ICELAND_ARNARSON_PEACE', 	'JFD_IcelandArnarson_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_ICELAND_ARNARSON_WAR', 		'JFD_IcelandArnarson_War', 		'DynamicResident'),	
		('SND_SOUND_JFD_SKALD_WRITING',						'Skald_Writing-001', 			'DynamicResident');	
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 				TaperSoundtrackVolume,	DontTriggerDuplicates,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_ICELAND_ARNARSON_PEACE', 	'SND_LEADER_MUSIC_JFD_ICELAND_ARNARSON_PEACE',	'GAME_MUSIC', 			-1.0,					0,						50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_ICELAND_ARNARSON_WAR',		'SND_LEADER_MUSIC_JFD_ICELAND_ARNARSON_WAR', 	'GAME_MUSIC', 			-1.0,					0,						50, 		50, 		1,		 0),
		('AS2D_SOUND_JFD_SKALD_WRITING',					'SND_SOUND_JFD_SKALD_WRITING',					'GAME_MUSIC_STINGS',	0,						1,						50, 		50, 		1, 		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_JFD_ICELAND_ARNARSON_ICON', 			0.423, 	0.572, 	0.243, 	1),
		('COLOR_PLAYER_JFD_ICELAND_ARNARSON_BACKGROUND', 	0.250,	0.203,	0.294, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 								 TextColor)
VALUES	('PLAYERCOLOR_JFD_ICELAND_ARNARSON',	'COLOR_PLAYER_JFD_ICELAND_ARNARSON_ICON',   'COLOR_PLAYER_JFD_ICELAND_ARNARSON_BACKGROUND',	 'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 									IconSize, 	Filename, 										IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_ICELAND_ARNARSON_ALPHA_ATLAS',		128, 		'JFD_IcelandArnarson_AlphaAtlas_128.dds',		1,				1),
		('JFD_ICELAND_ARNARSON_ALPHA_ATLAS',		80, 		'JFD_IcelandArnarson_AlphaAtlas_80.dds',		1, 				1),
		('JFD_ICELAND_ARNARSON_ALPHA_ATLAS',		64, 		'JFD_IcelandArnarson_AlphaAtlas_64.dds',		1, 				1),
		('JFD_ICELAND_ARNARSON_ALPHA_ATLAS',		48, 		'JFD_IcelandArnarson_AlphaAtlas_48.dds',		1, 				1),
		('JFD_ICELAND_ARNARSON_ALPHA_ATLAS',		45, 		'JFD_IcelandArnarson_AlphaAtlas_45.dds',		1, 				1),
		('JFD_ICELAND_ARNARSON_ALPHA_ATLAS',		32, 		'JFD_IcelandArnarson_AlphaAtlas_32.dds',		1, 				1),
		('JFD_ICELAND_ARNARSON_ALPHA_ATLAS',		24, 		'JFD_IcelandArnarson_AlphaAtlas_24.dds',		1, 				1),
		('JFD_ICELAND_ARNARSON_ALPHA_ATLAS',		16, 		'JFD_IcelandArnarson_AlphaAtlas_16.dds',		1, 				1),
		('JFD_ICELAND_ARNARSON_ICON_ATLAS', 		256, 		'JFD_IcelandArnarson_IconAtlas_256.dds',		3, 				2),
		('JFD_ICELAND_ARNARSON_ICON_ATLAS', 		128, 		'JFD_IcelandArnarson_IconAtlas_128.dds',		3, 				2),
		('JFD_ICELAND_ARNARSON_ICON_ATLAS', 		80, 		'JFD_IcelandArnarson_IconAtlas_80.dds',			3, 				2),
		('JFD_ICELAND_ARNARSON_ICON_ATLAS', 		64, 		'JFD_IcelandArnarson_IconAtlas_64.dds',			3, 				2),
		('JFD_ICELAND_ARNARSON_ICON_ATLAS', 		45, 		'JFD_IcelandArnarson_IconAtlas_45.dds',			3, 				2),
		('JFD_ICELAND_ARNARSON_ICON_ATLAS', 		32, 		'JFD_IcelandArnarson_IconAtlas_32.dds',			3, 				2),
		('JFD_ICELAND_ARNARSON_UNIT_FLAG_ATLAS', 	32, 		'JFD_IcelandArnarson_UnitFlagAtlas_32.dds',		1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	

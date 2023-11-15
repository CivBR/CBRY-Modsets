--=======================================================================================================================
-- ART DEFINES
--=======================================================================================================================		
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_StrategicView
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 				TileType,	Asset)
VALUES	('ART_DEF_UNIT_US_SINGULARES',	'Unit', 	'TrajanFlag_SV.dds');
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfos
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO ArtDefine_UnitInfos 
		(Type, 								DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_US_SINGULARES', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_KNIGHT'; 
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,						UnitMemberInfoType,						 NumMembers)
SELECT	'ART_DEF_UNIT_US_SINGULARES', 	'ART_DEF_UNIT_MEMBER_US_SINGULARES', NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_US_SINGULARES',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_KNIGHT';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_STEAM_FRIGATE',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_FRIGATE';
------------------------------------------------------------------------------------------------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------------------------------------------------------------------------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 										Scale, ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_US_SINGULARES',	Scale, ZOffset, Domain, 'Knight_Rome.fxsxml',  MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_KNIGHT';
--=======================================================================================================================
-- AUDIO
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Audio_Sounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 													Filename, 							LoadType)
VALUES	('SND_LEADER_MUSIC_US_ROME_TRAJAN_PEACE', 	'US_Rome_Trajan_Peace', 	'DynamicResident'),
		('SND_LEADER_MUSIC_US_ROME_TRAJAN_WAR', 		'US_Rome_Trajan_War', 	'DynamicResident');		
------------------------------------------------------------------------------------------------------------------------
-- Audio_2DSounds
------------------------------------------------------------------------------------------------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 													SoundID, 												SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,	IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_US_ROME_TRAJAN_PEACE', 	'SND_LEADER_MUSIC_US_ROME_TRAJAN_PEACE',	'GAME_MUSIC', 	-1.0,					50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_US_ROME_TRAJAN_WAR',		'SND_LEADER_MUSIC_US_ROME_TRAJAN_WAR', 	'GAME_MUSIC', 	-1.0,					50, 		50, 		1,		 0);
--=======================================================================================================================
-- COLOURS
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- Colors
------------------------------------------------------------------------------------------------------------------------		
INSERT INTO Colors 
		(Type, 														Red, 	Green, 	Blue,   Alpha)
VALUES	('COLOR_PLAYER_US_ROME_TRAJAN_ICON', 			0.835,		0.714, 	0.584, 	1),
		('COLOR_PLAYER_US_ROME_TRAJAN_BACKGROUND', 	0.447, 	0.082, 	0.18, 	1);
------------------------------------------------------------------------------------------------------------------------
-- PlayerColors
------------------------------------------------------------------------------------------------------------------------			
INSERT INTO PlayerColors 
		(Type, 											PrimaryColor, 										SecondaryColor, 										TextColor)
VALUES	('PLAYERCOLOR_US_ROME_TRAJAN',	'COLOR_PLAYER_US_ROME_TRAJAN_ICON',   'COLOR_PLAYER_US_ROME_TRAJAN_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');
--=======================================================================================================================
-- ICON ATLASES
--=======================================================================================================================	
------------------------------------------------------------------------------------------------------------------------
-- IconTextureAtlases
------------------------------------------------------------------------------------------------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 											IconSize, 	Filename, 											IconsPerRow, 	IconsPerColumn)
VALUES	('US_ROME_TRAJAN_ALPHA_ATLAS',		64, 		'Trajan_Alpha_64.dds',		1, 				1),
		('US_ROME_TRAJAN_ALPHA_ATLAS',		48, 		'Trajan_Alpha_48.dds',		1, 				1),
		('US_ROME_TRAJAN_ALPHA_ATLAS',		32, 		'Trajan_Alpha_32.dds',		1, 				1),
		('US_ROME_TRAJAN_ALPHA_ATLAS',		24, 		'Trajan_Alpha_24.dds',		1, 				1),
		('US_ROME_TRAJAN_ICON_ATLAS', 		256, 		'Trajan_Atlas_256.dds',		2, 				2),
		('US_ROME_TRAJAN_ICON_ATLAS', 		128, 		'Trajan_Atlas_128.dds',		2, 				2),
		('US_ROME_TRAJAN_ICON_ATLAS', 		80, 		'Trajan_Atlas_80.dds',		2, 				2),
		('US_ROME_TRAJAN_ICON_ATLAS', 		64, 		'Trajan_Atlas_64.dds',		2, 				2),
		('US_ROME_TRAJAN_ICON_ATLAS', 		45, 		'Trajan_Atlas_45.dds',		2, 				2),
		('US_ROME_TRAJAN_ICON_ATLAS', 		32, 		'Trajan_Atlas_32.dds',		2, 				2),
		('US_ROME_TRAJAN_UNIT_FLAG_ATLAS', 	32, 		'TrajanFlag_32.dds',	1, 				1);
--=======================================================================================================================	
--=======================================================================================================================	

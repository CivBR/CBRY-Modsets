--==========================================================================================================================
-- ARTDEFINES
--==========================================================================================================================	
-- IconTextureAtlasesa
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 						IconSize, 	Filename, 							IconsPerRow, 	IconsPerColumn)
VALUES	('ATLAS_AOI_DERVISH',			256,		'AoI_DervishIconAtlas256.dds',		2,				2),
		('ATLAS_AOI_DERVISH',			128,		'AoI_DervishIconAtlas128.dds',		2,				2),
		('ATLAS_AOI_DERVISH',			80,			'AoI_DervishIconAtlas80.dds',		2,				2),
		('ATLAS_AOI_DERVISH',			64,			'AoI_DervishIconAtlas64.dds',		2,				2),
		('ATLAS_AOI_DERVISH',			45,			'AoI_DervishIconAtlas45.dds',		2,				2),
		('ATLAS_AOI_DERVISH',			32,			'AoI_DervishIconAtlas32.dds',		2,				2),
		('ATLAS_AOI_DERVISH_ALPHA',		128,		'AoI_DervishAlphaIconAtlas128.dds',	1,				1),
		('ATLAS_AOI_DERVISH_ALPHA',		80,			'AoI_DervishAlphaIconAtlas80.dds',	1,				1),
		('ATLAS_AOI_DERVISH_ALPHA',		64,			'AoI_DervishAlphaIconAtlas64.dds',	1,				1),
		('ATLAS_AOI_DERVISH_ALPHA',		48,			'AoI_DervishAlphaIconAtlas48.dds',	1,				1),
		('ATLAS_AOI_DERVISH_ALPHA',		45,			'AoI_DervishAlphaIconAtlas45.dds',	1,				1),
		('ATLAS_AOI_DERVISH_ALPHA',		32,			'AoI_DervishAlphaIconAtlas32.dds',	1,				1),
		('ATLAS_AOI_DERVISH_ALPHA',		24,			'AoI_DervishAlphaIconAtlas24.dds',	1,				1),
		('ATLAS_AOI_DERVISH_ALPHA',		16,			'AoI_DervishAlphaIconAtlas16.dds',	1,				1),
		('ATLAS_AOI_DERVISH_UNIT_FLAG',	32,			'AoI_DervishUnitFlagAtlas32.dds',	1,				1);
------------------------------
-- Colors
------------------------------		
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_AOI_DERVISH_ICON',					0.549,	0.082,	0.082,	1),
		('COLOR_PLAYER_AOI_DERVISH_BACKGROUND',				0.24,	0.502,	0.502,	1);
------------------------------
-- PlayerColors
------------------------------			
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 									SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_AOI_DERVISH',				'COLOR_PLAYER_AOI_DERVISH_ICON',				'COLOR_PLAYER_AOI_DERVISH_BACKGROUND',				'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 											Filename, 						LoadType)
VALUES	('SND_LEADER_MUSIC_AOI_ABDULLAH_HASSAN_PEACE', 		'AbdullahHassan_Peace',			'DynamicResident'),
		('SND_LEADER_MUSIC_AOI_ABDULLAH_HASSAN_WAR', 		'AbdullahHassan_War', 			'DynamicResident');		
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 											SoundID, 										SoundType, 		MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_AOI_ABDULLAH_HASSAN_PEACE',		'SND_LEADER_MUSIC_AOI_ABDULLAH_HASSAN_PEACE',	'GAME_MUSIC', 	50, 		50, 		1, 		 0),
		('AS2D_LEADER_MUSIC_AOI_ABDULLAH_HASSAN_WAR', 		'SND_LEADER_MUSIC_AOI_ABDULLAH_HASSAN_WAR', 	'GAME_MUSIC', 	50, 		50, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType,				TileType,	Asset) 
VALUES	('ART_DEF_UNIT_AOI_MAARA_WEYN',	'Unit',		'sv_u_dervish_maara_weyn.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------	
--INSERT INTO ArtDefine_UnitInfos 
--		(Type,							DamageStates,	Formation) 
--VALUES	('ART_DEF_UNIT_AOI_MAARA_WEYN',	1,				'DefaultCavalry');

INSERT INTO ArtDefine_UnitInfos 
		(Type, 									DamageStates,	Formation)
SELECT	('ART_DEF_UNIT_AOI_MAARA_WEYN'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_CAVALRY');
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
--INSERT INTO ArtDefine_UnitInfoMemberInfos 	
--		(UnitInfoType,						UnitMemberInfoType,						NumMembers)
--VALUES	('ART_DEF_UNIT_AOI_MAARA_WEYN',		'ART_DEF_UNIT_MEMBER_AOI_MAARA_WEYN',	5;

INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,							UnitMemberInfoType,						NumMembers)
SELECT	('ART_DEF_UNIT_AOI_MAARA_WEYN'),		('ART_DEF_UNIT_MEMBER_AOI_MAARA_WEYN'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_CAVALRY');
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
--INSERT INTO ArtDefine_UnitMemberCombats 
--		(UnitMemberType,						EnableActions,																					ShortMoveRadius,	ShortMoveRate,		TurnRateMin,	TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	TargetHeight,	HasShortRangedAttack,	HasStationaryMelee,	HasRefaceAfterCombat,	ReformBeforeCombat,	OnlyTurnInMovementActions) 
--VALUES	('ART_DEF_UNIT_MEMBER_AOI_MAARA_WEYN',	'Idle Attack RunCharge AttackCity Bombard Death BombardDefend Run Fortify CombatReady Walk',	24,					0.3499999940395355,	0.5,			0.75,			15,					20,					12.0,			1,						1,					1,						1,					1);

INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,						EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate,		TurnRateMin, TurnRateMax,	TurnFacingRateMin,	TurnFacingRateMax,	RollRateMin,	RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack,	HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee,	HasStationaryRangedAttack, HasRefaceAfterCombat,	ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions,	RushAttackFormation)
SELECT	('ART_DEF_UNIT_MEMBER_AOI_MAARA_WEYN'),	EnableActions, DisableActions, MoveRadius, 24,				ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, 0.3499999940395355,	0.5,		 0.75,			15,					20,					12.0,			RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, 1,						HasLongRangedAttack, HasLeftRightAttack, 1,						HasStationaryRangedAttack, 1,						1,					HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, 1,							RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY');
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
--INSERT INTO ArtDefine_UnitMemberCombatWeapons 
--		(UnitMemberType,							"Index",	SubIndex,	WeaponTypeTag,	WeaponTypeSoundOverrideTag) 
--VALUES	('ART_DEF_UNIT_MEMBER_AOI_MAARA_WEYN',		0,			0,			'BULLET',		'BULLET');

INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,							"Index",	SubIndex,	ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag,	WeaponTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_AOI_MAARA_WEYN'),		0,			0,			ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, 'BULLET',		'BULLET'
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_CAVALRY');
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
--INSERT INTO ArtDefine_UnitMemberInfos 
--		(Type,									Scale,					ZOffset,	Domain,		Model,							MaterialTypeTag,	MaterialTypeSoundOverrideTag) 
--VALUES	('ART_DEF_UNIT_MEMBER_AOI_MAARA_WEYN',	0.11999999731779099,	ZOffset,	Domain,		'u_dervish_maara_weyn.fxsxml',	'CLOTH',			'FLESH');

INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 									Scale,					ZOffset, Domain, Model,								MaterialTypeTag,	MaterialTypeSoundOverrideTag)
SELECT	('ART_DEF_UNIT_MEMBER_AOI_MAARA_WEYN'),	0.11999999731779099,	ZOffset, Domain, ('u_dervish_maara_weyn.fxsxml'),	'CLOTH',			'FLESH'
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_CAVALRY');
--==========================================================================================================================	
--==========================================================================================================================	

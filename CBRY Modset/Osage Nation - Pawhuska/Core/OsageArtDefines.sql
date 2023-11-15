Insert or Replace into Colors
		(Type,	Red,	Green,	Blue,	Alpha)
VALUES	('COLOR_GR_OSAGE_ICON', 0.96,	0.63,	0.27,	1),
		('COLOR_GR_OSAGE_BACKGROUND',	0.07,	0.24,	0.34,	1);

-----

Insert or Replace into PlayerColors
		(Type,	PrimaryColor,	SecondaryColor,	TextColor)
VALUES	('PLAYERCOLOR_GR_OSAGE',	'COLOR_GR_OSAGE_ICON',	'COLOR_GR_OSAGE_BACKGROUND',	'COLOR_PLAYER_WHITE_TEXT');

-----

Insert or Replace into Audio_Sounds
		(SoundID, 					Filename, 		LoadType)
VALUES 	('SND_DOM_SPEECH_OSAGE', 'OSAGE_DOM', 	'DynamicResident');

Insert or Replace into Audio_2DSounds
		(ScriptID, 					SoundID, 					SoundType, 		MinVolume, 	MaxVolume)
VALUES 	('AS2D_DOM_SPEECH_OSAGE','SND_DOM_SPEECH_OSAGE', 	'GAME_SPEECH', 	70, 		70);

-----

Insert or Replace into ArtDefine_StrategicView
			(StrategicViewType, 					TileType,	Asset)
VALUES		('ART_DEF_UNIT_GR_ODON', 				'Unit', 	'OdonSV.dds'),
			('ART_DEF_UNIT_GR_WATHITO', 		'Unit', 	'WathitoSV.dds');

-----

Insert or Replace into ArtDefine_UnitInfos
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_GR_ODON'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_PIKEMAN');

-----

Insert or Replace into ArtDefine_UnitInfoMemberInfos
			(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_GR_ODON'),		('ART_DEF_UNIT_MEMBER_GR_ODON'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_PIKEMAN');

-----

Insert or Replace into ArtDefine_UnitMemberCombats
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_GR_ODON'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');

-----

Insert or Replace into ArtDefine_UnitMemberCombatWeapons
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GR_ODON'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_PIKEMAN');

-----

Insert or Replace into ArtDefine_UnitMemberInfos
			(Type, 										Scale,  ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GR_ODON'),	Scale,	ZOffset, Domain, ('osage_odon.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_PIKEMAN');

-----

Insert or Replace into ArtDefine_UnitInfos
			(Type, 									DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_GR_WATHITO'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__WORKER');

-----

Insert or Replace into ArtDefine_UnitInfoMemberInfos
			(UnitInfoType,							UnitMemberInfoType,							NumMembers)
SELECT		('ART_DEF_UNIT_GR_WATHITO'),		('ART_DEF_UNIT_MEMBER_GR_WATHITO'),	NumMembers
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__WORKER');

-----

Insert or Replace into ArtDefine_UnitMemberCombats
			(UnitMemberType,							EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_GR_WATHITO'),	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKER_EURO');

-----

Insert or Replace into ArtDefine_UnitMemberCombatWeapons
			(UnitMemberType,							"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GR_WATHITO'),	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_WORKER_EURO');

-----

Insert or Replace into ArtDefine_UnitMemberInfos
			(Type, 										Scale,  ZOffset, Domain, Model, 			MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_GR_WATHITO'),	Scale,	ZOffset, Domain, Model,	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_WORKER_EURO');

-----

Insert or Replace into Audio_Sounds
		(SoundID,	Filename,	LoadType)
VALUES	('SND_LEADER_MUSIC_GR_PAWHUSKA_WAR',	'OsageWarTheme',	'DynamicResident'),
		('SND_LEADER_MUSIC_GR_PAWHUSKA_PEACE',	'OsagePeaceTheme',	'DynamicResident');

-----

Insert or Replace into Audio_2DSounds
		(ScriptID,	SoundID,	SoundType,	MinVolume,	MaxVolume,	IsMusic,	Looping)
VALUES	('AS2D_LEADER_MUSIC_GR_PAWHUSKA_WAR',	'SND_LEADER_MUSIC_GR_PAWHUSKA_WAR',	'GAME_MUSIC',	60,	60,	1,	0),
		('AS2D_LEADER_MUSIC_GR_PAWHUSKA_PEACE',	'SND_LEADER_MUSIC_GR_PAWHUSKA_PEACE',	'GAME_MUSIC',	60,	60,	1,	0);

-----

Insert or Replace into IconTextureAtlases
		(Atlas,	IconSize,	Filename,	IconsPerRow,	IconsPerColumn)
VALUES	('GR_OSAGE_ATLAS',	256,	'OsageAtlas256.dds',	2,	2),
		('GR_OSAGE_ATLAS',	128,	'OsageAtlas128.dds',	2,	2),
		('GR_OSAGE_ATLAS',	80,	'OsageAtlas80.dds',	2,	2),
		('GR_OSAGE_ATLAS',	64,	'OsageAtlas64.dds',	2,	2),
		('GR_OSAGE_ATLAS',	45,	'OsageAtlas45.dds',	2,	2),
		('GR_OSAGE_ATLAS',	32,	'OsageAtlas32.dds',	2,	2),
		('GR_OSAGE_ATLAS',	24,	'OsageAtlas24.dds',	2,	2),
		('GR_OSAGE_ATLAS',	16,	'OsageAtlas16.dds',	2,	2),
		('GR_ODON_ALPHA',	32,	'Odon32.dds',	1,	1),
		('GR_OSAGE_ALPHA', 		256, 		'OsageAlpha256.dds',		1,				1),
		('GR_OSAGE_ALPHA', 		128, 		'OsageAlpha128.dds',		1,				1),
		('GR_OSAGE_ALPHA', 		64, 		'OsageAlpha64.dds',		1,				1),
		('GR_OSAGE_ALPHA', 		48, 		'OsageAlpha48.dds',		1,				1),
		('GR_OSAGE_ALPHA', 		32, 		'OsageAlpha32.dds',		1,				1),
		('GR_OSAGE_ALPHA', 		24, 		'OsageAlpha24.dds',		1,				1);
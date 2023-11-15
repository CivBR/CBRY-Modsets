--==========================================================================================================================
-- ART DEFINES
--==========================================================================================================================	
-- IconTextureAtlases
------------------------------
INSERT INTO IconTextureAtlases 
		(Atlas, 								IconSize, 	Filename, 									IconsPerRow, 	IconsPerColumn)
VALUES	('JFD_CARTHAGE_HANNIBAL_ATLAS', 		256, 		'JFD_CarthageHannibalAtlas_256.dds',		2, 				2),
		('JFD_CARTHAGE_HANNIBAL_ATLAS', 		128, 		'JFD_CarthageHannibalAtlas_128.dds',		2, 				2),
		('JFD_CARTHAGE_HANNIBAL_ATLAS', 		80, 		'JFD_CarthageHannibalAtlas_80.dds',			2, 				2),
		('JFD_CARTHAGE_HANNIBAL_ATLAS', 		64, 		'JFD_CarthageHannibalAtlas_64.dds',			2, 				2),
		('JFD_CARTHAGE_HANNIBAL_ATLAS', 		45, 		'JFD_CarthageHannibalAtlas_45.dds',			2, 				2),
		('JFD_CARTHAGE_HANNIBAL_ATLAS', 		32, 		'JFD_CarthageHannibalAtlas_32.dds',			2,				2),
		('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	128, 		'JFD_CarthageHannibalAlphaAtlas_128.dds',	1, 				1),
		('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	80, 		'JFD_CarthageHannibalAlphaAtlas_80.dds',	1, 				1),
		('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	64, 		'JFD_CarthageHannibalAlphaAtlas_64.dds',	1, 				1),
		('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	48, 		'JFD_CarthageHannibalAlphaAtlas_48.dds',	1, 				1),
		('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	45, 		'JFD_CarthageHannibalAlphaAtlas_45.dds',	1, 				1),
		('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	32, 		'JFD_CarthageHannibalAlphaAtlas_32.dds',	1, 				1),
		('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	24, 		'JFD_CarthageHannibalAlphaAtlas_24.dds',	1, 				1),
		('JFD_CARTHAGE_HANNIBAL_ALPHA_ATLAS', 	16, 		'JFD_CarthageHannibalAlphaAtlas_16.dds',	1, 				1),
		('JFD_UNIT_FLAG_SHOPHET_ATLAS', 		32, 		'JFD_ShophetUnitFlag_32.dds',				1, 				1);
------------------------------	
-- Colors
------------------------------			
INSERT INTO Colors 
		(Type, 												Red, 	Green, 	Blue, 	Alpha)
VALUES	('COLOR_PLAYER_JFD_CARTHAGE_HANNIBAL_ICON', 		0.996,	0.980,	0.709,	1),
		('COLOR_PLAYER_JFD_CARTHAGE_HANNIBAL_BACKGROUND', 	0.125,	0.254,	0.121,	1);
------------------------------	
-- PlayerColors
------------------------------				
INSERT INTO PlayerColors 
		(Type, 									PrimaryColor, 								SecondaryColor, 									TextColor)
VALUES	('PLAYERCOLOR_JFD_CARTHAGE_HANNIBAL',	'COLOR_PLAYER_JFD_CARTHAGE_HANNIBAL_ICON', 	'COLOR_PLAYER_JFD_CARTHAGE_HANNIBAL_BACKGROUND', 	'COLOR_PLAYER_WHITE_TEXT');
--==========================================================================================================================
-- AUDIO
--==========================================================================================================================	
-- Audio_Sounds
------------------------------	
INSERT INTO Audio_Sounds 
		(SoundID, 									Filename, 			LoadType)
VALUES	('SND_LEADER_MUSIC_JFD_HANNIBAL_PEACE', 	'Hannibal_Peace',	'DynamicResident'),
		('SND_LEADER_MUSIC_JFD_HANNIBAL_WAR', 		'Hannibal_War', 	'DynamicResident');
------------------------------
-- Audio_2DSounds
------------------------------	
INSERT INTO Audio_2DSounds 
		(ScriptID, 									SoundID, 									SoundType, 		TaperSoundtrackVolume,	MinVolume, 	MaxVolume,  IsMusic, Looping)
VALUES	('AS2D_LEADER_MUSIC_JFD_HANNIBAL_PEACE', 	'SND_LEADER_MUSIC_JFD_HANNIBAL_PEACE', 		'GAME_MUSIC', 	-1.0,					60, 		60, 		1, 		 0),
		('AS2D_LEADER_MUSIC_JFD_HANNIBAL_WAR', 		'SND_LEADER_MUSIC_JFD_HANNIBAL_WAR', 		'GAME_MUSIC', 	-1.0,					60, 		60, 		1,		 0);
--==========================================================================================================================
-- UNIT GRAPHICS
--==========================================================================================================================	
-- ArtDefine_StrategicView
------------------------------	
INSERT INTO ArtDefine_StrategicView 
		(StrategicViewType, 			TileType,	Asset)
VALUES	('ART_DEF_UNIT_JFD_SHOPHET', 	'Unit', 	'sv_Shophet.dds');
------------------------------
-- ArtDefine_UnitInfos
------------------------------			
INSERT INTO ArtDefine_UnitInfos 
		(Type, 							DamageStates,	Formation)
SELECT	'ART_DEF_UNIT_JFD_SHOPHET', 	DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE Type = 'ART_DEF_UNIT_GENERAL_KHAN';
------------------------------
-- ArtDefine_UnitInfoMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
		(UnitInfoType,					UnitMemberInfoType,						NumMembers)
SELECT	'ART_DEF_UNIT_JFD_SHOPHET', 	'ART_DEF_UNIT_MEMBER_JFD_SHOPHET', 		1
FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GENERAL_KHAN';
------------------------------
-- ArtDefine_UnitMemberCombats
------------------------------
INSERT INTO ArtDefine_UnitMemberCombats 
		(UnitMemberType,					EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SHOPHET',	EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN';
------------------------------
-- ArtDefine_UnitMemberCombatWeapons
------------------------------
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
		(UnitMemberType,					"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SHOPHET',	"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE UnitMemberType = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN';
------------------------------
-- ArtDefine_UnitMemberInfos
------------------------------
INSERT INTO ArtDefine_UnitMemberInfos 	
		(Type, 								Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT	'ART_DEF_UNIT_MEMBER_JFD_SHOPHET',	Scale,	ZOffset, Domain, 'Knight_Greece.fxsxml',	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_KHAN';
--==========================================================================================================================	
--==========================================================================================================================	

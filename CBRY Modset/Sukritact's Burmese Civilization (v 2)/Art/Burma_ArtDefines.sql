--==========================================================================================================================
-- ArtDefine_StrategicView
--==========================================================================================================================	
INSERT INTO ArtDefine_StrategicView 
			(StrategicViewType, 							TileType,	Asset)
VALUES		('ART_DEF_UNIT_BURMESE_KYUNDAW_CONSCRIPT', 		'Unit', 	'sv_kyundaw.dds');
--==========================================================================================================================
-- ArtDefine_UnitInfos
--==========================================================================================================================			
INSERT INTO ArtDefine_UnitInfos 
			(Type, 											DamageStates,	Formation)
SELECT		('ART_DEF_UNIT_BURMESE_KYUNDAW_CONSCRIPT'),		DamageStates, 	Formation
FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_U_JAPANESE_SAMURAI');
--==========================================================================================================================
-- ArtDefine_UnitInfoMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitInfoMemberInfos 	
			(UnitInfoType,									UnitMemberInfoType,										NumMembers)
SELECT		('ART_DEF_UNIT_BURMESE_KYUNDAW_CONSCRIPT'),		('ART_DEF_UNIT_MEMBER_BURMESE_KYUNDAW_CONSCRIPT'),		12
FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_U_JAPANESE_SAMURAI');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombats
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombats 
			(UnitMemberType,										EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation)
SELECT		('ART_DEF_UNIT_MEMBER_BURMESE_KYUNDAW_CONSCRIPT'),		EnableActions, DisableActions, MoveRadius, ShortMoveRadius, ChargeRadius, AttackRadius, RangedAttackRadius, MoveRate, ShortMoveRate, TurnRateMin, TurnRateMax, TurnFacingRateMin, TurnFacingRateMax, RollRateMin, RollRateMax, PitchRateMin, PitchRateMax, LOSRadiusScale, TargetRadius, TargetHeight, HasShortRangedAttack, HasLongRangedAttack, HasLeftRightAttack, HasStationaryMelee, HasStationaryRangedAttack, HasRefaceAfterCombat, ReformBeforeCombat, HasIndependentWeaponFacing, HasOpponentTracking, HasCollisionAttack, AttackAltitude, AltitudeDecelerationDistance, OnlyTurnInMovementActions, RushAttackFormation
FROM ArtDefine_UnitMemberCombats WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI');
--==========================================================================================================================
-- ArtDefine_UnitMemberCombatWeapons
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberCombatWeapons	
			(UnitMemberType,										"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_BURMESE_KYUNDAW_CONSCRIPT'),		"Index", SubIndex, ID, VisKillStrengthMin, VisKillStrengthMax, ProjectileSpeed, ProjectileTurnRateMin, ProjectileTurnRateMax, HitEffect, HitEffectScale, HitRadius, ProjectileChildEffectScale, AreaDamageDelay, ContinuousFire, WaitForEffectCompletion, TargetGround, IsDropped, WeaponTypeTag, WeaponTypeSoundOverrideTag
FROM ArtDefine_UnitMemberCombatWeapons WHERE (UnitMemberType = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI');
--==========================================================================================================================
-- ArtDefine_UnitMemberInfos
--==========================================================================================================================
INSERT INTO ArtDefine_UnitMemberInfos 	
			(Type, 													Scale,  ZOffset, Domain, Model, 					MaterialTypeTag, MaterialTypeSoundOverrideTag)
SELECT		('ART_DEF_UNIT_MEMBER_BURMESE_KYUNDAW_CONSCRIPT'),		Scale,	ZOffset, Domain, ('kyundaw.fxsxml'),	MaterialTypeTag, MaterialTypeSoundOverrideTag
FROM ArtDefine_UnitMemberInfos WHERE (Type = 'ART_DEF_UNIT_MEMBER_U_JAPANESE_SAMURAI');
--==========================================================================================================================
-- IconTextureAtlasesa
--==========================================================================================================================
INSERT INTO IconTextureAtlases 
			(Atlas, 											IconSize, 	Filename, 								IconsPerRow, 	IconsPerColumn)
VALUES		('BURMA_ATLAS', 									256, 		'BurmaAtlas_256.dds',					5, 				1),
			('BURMA_ATLAS', 									128, 		'BurmaAtlas_128.dds',					5, 				1),
			('BURMA_ATLAS', 									80, 		'BurmaAtlas_80.dds',					5, 				1),
			('BURMA_ATLAS', 									64, 		'BurmaAtlas_64.dds',					5, 				1),
			('BURMA_ATLAS', 									45, 		'BurmaAtlas_45.dds',					5, 				1),
			('BURMA_ATLAS', 									32, 		'BurmaAtlas_32.dds',					5, 				1),
			('BURMA_ALPHA_ATLAS', 								128, 		'BurmaAlpha_128.dds',					1, 				1),
			('BURMA_ALPHA_ATLAS', 								80, 		'BurmaAlpha_80.dds',					1, 				1),
			('BURMA_ALPHA_ATLAS', 								64, 		'BurmaAlpha_64.dds',					1, 				1),
			('BURMA_ALPHA_ATLAS', 								48, 		'BurmaAlpha_48.dds',					1, 				1),
			('BURMA_ALPHA_ATLAS', 								45, 		'BurmaAlpha_45.dds',					1, 				1),
			('BURMA_ALPHA_ATLAS', 								32, 		'BurmaAlpha_32.dds',					1, 				1),
			('BURMA_ALPHA_ATLAS', 								24, 		'BurmaAlpha_24.dds',					1, 				1),
			('BURMA_ALPHA_ATLAS', 								16, 		'BurmaAlpha_16.dds',					1, 				1),
			('UNIT_FLAG_BURMESE_KYUNDAW_CONSCRIPT_ATLAS', 		32, 		'flag_kyundaw.dds',						1, 				1);
--==========================================================================================================================
--==========================================================================================================================
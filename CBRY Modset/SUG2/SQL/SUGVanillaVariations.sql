-----------------------------------------------------------------------------
-- Single Unit Graphics
-- VANILLA VARIATIONS - Unit Configuration
-----------------------------------------------------------------------------

--Note that era variation trumps cultural variation (can't have both)

UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE Type = 'UNIT_INQUISITOR';
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE Type = 'UNIT_MISSIONARY';

--Next 4 only necessary if R.E.D. Modpack is not enabled:
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE Type = 'UNIT_ARCHER';
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE Type = 'UNIT_SPEARMAN';
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE Type = 'UNIT_SWORDSMAN';
UPDATE Units SET UnitArtInfoCulturalVariation = 1 WHERE Type = 'UNIT_WARRIOR';

--inquisitor
INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_INQUISITOR_AFRI'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_INQUISITOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_INQUISITOR_AFRI'), ('ART_DEF_UNIT_MEMBER_INQUISITOR_01'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_INQUISITOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_INQUISITOR_AFRI'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_INQUISITOR_AMER'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_INQUISITOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_INQUISITOR_AMER'), ('ART_DEF_UNIT_MEMBER_INQUISITOR_01'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_INQUISITOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_INQUISITOR_AMER'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_INQUISITOR_ASIA'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_INQUISITOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_INQUISITOR_ASIA'), ('ART_DEF_UNIT_MEMBER_INQUISITOR_02'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_INQUISITOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_INQUISITOR_ASIA'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_INQUISITOR_EURO'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_INQUISITOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_INQUISITOR_EURO'), ('ART_DEF_UNIT_MEMBER_INQUISITOR'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_INQUISITOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_INQUISITOR_EURO'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_INQUISITOR_MED'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_INQUISITOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_INQUISITOR_MED'), ('ART_DEF_UNIT_MEMBER_INQUISITOR'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_INQUISITOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_INQUISITOR_MED'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_INQUISITOR_MIDEAST'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_INQUISITOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_INQUISITOR_MIDEAST'), ('ART_DEF_UNIT_MEMBER_INQUISITOR_01'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_INQUISITOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_INQUISITOR_MIDEAST'));


--missionary
INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_MISSIONARY_AFRI'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MISSIONARY');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_MISSIONARY_AFRI'), ('ART_DEF_UNIT_MEMBER_MISSIONARY'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MISSIONARY'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY_AFRI'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_MISSIONARY_AMER'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MISSIONARY');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_MISSIONARY_AMER'), ('ART_DEF_UNIT_MEMBER_MISSIONARY'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MISSIONARY'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY_AMER'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_MISSIONARY_ASIA'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MISSIONARY');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_MISSIONARY_ASIA'), ('ART_DEF_UNIT_MEMBER_MISSIONARY_01'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MISSIONARY'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY_ASIA'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_MISSIONARY_EURO'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MISSIONARY');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_MISSIONARY_EURO'), ('ART_DEF_UNIT_MEMBER_MISSIONARY_01'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MISSIONARY'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY_EURO'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_MISSIONARY_MED'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MISSIONARY');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_MISSIONARY_MED'), ('ART_DEF_UNIT_MEMBER_MISSIONARY_02'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MISSIONARY'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY_MED'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_MISSIONARY_MIDEAST'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_MISSIONARY');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_MISSIONARY_MIDEAST'), ('ART_DEF_UNIT_MEMBER_MISSIONARY'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_MISSIONARY'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY_MIDEAST'));


--settler
INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex) 
	SELECT	('ART_DEF_UNIT__SETTLER_EURO'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__SETTLER');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers) 
	SELECT  ('ART_DEF_UNIT__SETTLER_EURO'), ('ART_DEF_UNIT_MEMBER_EURODONKEY'), 1 
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__SETTLER'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_EURO'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex) 
	SELECT	('ART_DEF_UNIT__SETTLER_MED'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__SETTLER');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers) 
	SELECT  ('ART_DEF_UNIT__SETTLER_MED'), ('ART_DEF_UNIT_MEMBER_EURODONKEY'), 1 
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__SETTLER'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_MED'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex) 
	SELECT	('ART_DEF_UNIT__SETTLER_MIDEAST'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__SETTLER');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers) 
	SELECT  ('ART_DEF_UNIT__SETTLER_MIDEAST'), ('ART_DEF_UNIT_MEMBER_AFRICAMEL'), 1 
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__SETTLER'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_MIDEAST'));


--archer
INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_ARCHER_AFRI'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_ARCHER');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT  ('ART_DEF_UNIT_ARCHER_AFRI'), ('ART_DEF_UNIT_MEMBER_ARCHER_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_ARCHER'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER_AFRI'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_ARCHER_AMER'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_ARCHER');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT  ('ART_DEF_UNIT_ARCHER_AMER'), ('ART_DEF_UNIT_MEMBER_ARCHER'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_ARCHER'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER_AMER'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_ARCHER_ASIA'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_ARCHER');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT  ('ART_DEF_UNIT_ARCHER_ASIA'), ('ART_DEF_UNIT_MEMBER_ARCHER'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_ARCHER'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER_ASIA'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_ARCHER_EURO'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_ARCHER');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT  ('ART_DEF_UNIT_ARCHER_EURO'), ('ART_DEF_UNIT_MEMBER_ARCHER_V3'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_ARCHER'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER_EURO'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_ARCHER_MED'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_ARCHER');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT  ('ART_DEF_UNIT_ARCHER_MED'), ('ART_DEF_UNIT_MEMBER_ARCHER_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_ARCHER'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER_MED'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_ARCHER_MIDEAST'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_ARCHER');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT  ('ART_DEF_UNIT_ARCHER_MIDEAST'), ('ART_DEF_UNIT_MEMBER_ARCHER_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_ARCHER'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER_MIDEAST'));


--spearman
INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SPEARMAN_AFRI'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SPEARMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SPEARMAN_AFRI'), ('ART_DEF_UNIT_MEMBER_SPEARMAN_V3'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SPEARMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN_AFRI'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SPEARMAN_AMER'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SPEARMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SPEARMAN_AMER'), ('ART_DEF_UNIT_MEMBER_SPEARMAN'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SPEARMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN_AMER'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SPEARMAN_ASIA'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SPEARMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SPEARMAN_ASIA'), ('ART_DEF_UNIT_MEMBER_SPEARMAN'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SPEARMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN_ASIA'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SPEARMAN_EURO'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SPEARMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SPEARMAN_EURO'), ('ART_DEF_UNIT_MEMBER_SPEARMAN_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SPEARMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN_EURO'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SPEARMAN_MED'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SPEARMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SPEARMAN_MED'), ('ART_DEF_UNIT_MEMBER_SPEARMAN_V3'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SPEARMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN_MED'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SPEARMAN_MIDEAST'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SPEARMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SPEARMAN_MIDEAST'), ('ART_DEF_UNIT_MEMBER_SPEARMAN_V3'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SPEARMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN_MIDEAST'));


--swordsman
INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SWORDSMAN_AFRI'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SWORDSMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SWORDSMAN_AFRI'), ('ART_DEF_UNIT_MEMBER_SWORDSMAN_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN_AFRI'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SWORDSMAN_AMER'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SWORDSMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SWORDSMAN_AMER'), ('ART_DEF_UNIT_MEMBER_SWORDSMAN_V3'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN_AMER'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SWORDSMAN_ASIA'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SWORDSMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SWORDSMAN_ASIA'), ('ART_DEF_UNIT_MEMBER_SWORDSMAN_V3'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN_ASIA'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SWORDSMAN_EURO'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SWORDSMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SWORDSMAN_EURO'), ('ART_DEF_UNIT_MEMBER_SWORDSMAN'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN_EURO'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SWORDSMAN_MED'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SWORDSMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SWORDSMAN_MED'), ('ART_DEF_UNIT_MEMBER_SWORDSMAN_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN_MED'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT_SWORDSMAN_MIDEAST'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT_SWORDSMAN');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT_SWORDSMAN_MIDEAST'), ('ART_DEF_UNIT_MEMBER_SWORDSMAN_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN_MIDEAST'));


--warrior
INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT__WARRIOR_AFRI'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__WARRIOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT__WARRIOR_AFRI'), ('ART_DEF_UNIT_MEMBER_WARRIOR_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__WARRIOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__WARRIOR_AFRI'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT__WARRIOR_AMER'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__WARRIOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT__WARRIOR_AMER'), ('ART_DEF_UNIT_MEMBER_WARRIOR_V4'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__WARRIOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__WARRIOR_AMER'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT__WARRIOR_ASIA'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__WARRIOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT__WARRIOR_ASIA'), ('ART_DEF_UNIT_MEMBER_WARRIOR_V4'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__WARRIOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__WARRIOR_ASIA'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT__WARRIOR_EURO'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__WARRIOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT__WARRIOR_EURO'), ('ART_DEF_UNIT_MEMBER_WARRIOR'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__WARRIOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__WARRIOR_EURO'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT__WARRIOR_MED'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__WARRIOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT__WARRIOR_MED'), ('ART_DEF_UNIT_MEMBER_WARRIOR_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__WARRIOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__WARRIOR_MED'));

INSERT OR IGNORE INTO ArtDefine_UnitInfos (Type, DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex)
	SELECT	('ART_DEF_UNIT__WARRIOR_MIDEAST'), DamageStates, Formation, UnitFlagAtlas, UnitFlagIconOffset, IconAtlas, PortraitIndex
	FROM ArtDefine_UnitInfos WHERE (Type = 'ART_DEF_UNIT__WARRIOR');
INSERT INTO ArtDefine_UnitInfoMemberInfos (UnitInfoType, UnitMemberInfoType, NumMembers)
	SELECT ('ART_DEF_UNIT__WARRIOR_MIDEAST'), ('ART_DEF_UNIT_MEMBER_WARRIOR_V2'), 1
	FROM ArtDefine_UnitInfoMemberInfos WHERE (UnitInfoType = 'ART_DEF_UNIT__WARRIOR'
	AND NOT EXISTS (SELECT * FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__WARRIOR_MIDEAST'));
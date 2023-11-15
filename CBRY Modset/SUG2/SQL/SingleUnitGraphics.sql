-----------------------------------------------------------------------------
-- Single Unit Graphics
-- Base Units
-----------------------------------------------------------------------------

--discards "extra" models from units
CREATE TABLE ArtDefine_UnitInfoMemberInfos_temp AS SELECT * FROM ArtDefine_UnitInfoMemberInfos;
DROP TABLE ArtDefine_UnitInfoMemberInfos;
CREATE TABLE ArtDefine_UnitInfoMemberInfos AS SELECT * FROM (SELECT * FROM ArtDefine_UnitInfoMemberInfos_temp ORDER BY rowid DESC) GROUP BY UnitInfoType;
DROP TABLE ArtDefine_UnitInfoMemberInfos_temp;

UPDATE ArtDefine_UnitInfoMemberInfos SET NumMembers = 1;
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2; -- default scale for unknown units

--switch to single-operator models
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'one_bazooka.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_BAZOOKA_INFANTRY';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'one_gatlinggun.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_GATLINGGUN';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'one_machinegun.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_MACHINEGUN';

--switch to no-operator models
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_antiair.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_ANTIAIRCRAFTGUN';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_artillery.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_ARTILLERY';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'Artillery_Generic.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_ARTILLERY';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_cannon.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_CANNON';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_catapult.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_CATAPULT';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_trebuchet.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_TREBUCHET';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_siegetower.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_U_ASSYRIAN_SIEGE_TOWER';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_batteringram.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_U_HUNS_BATTERING_RAM';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_hwacha.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_U_KOREAN_HWACHA';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_ballista.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_U_ROMAN_BALLISTA';
--switch to no-operator models for scenarios
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_napoleon.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_CONFEDERATE_ARTILLERY_NAPOLEON';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_napoleon.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_UNION_ARTILLERY_NAPOLEON';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_parrott.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_CONFEDERATE_ARTILLERY_PARROTT';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_parrott.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_UNION_ARTILLERY_PARROTT';
--UPDATE ArtDefine_UnitMemberInfos SET Model = 'noop_treasurecart.fxsxml' WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_TREASURE_CART';


-- SOLDIERS (0.25)
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'BIPED'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'HEAVY_BIPED'));

-- ARCHER*
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_ARCHER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_ARCHER'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHER';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_ARCHER','ART_DEF_UNIT_MEMBER_ARCHER',1);
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_BARBARIAN_ARCHER';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_BARBARIAN_ARCHER','ART_DEF_UNIT_MEMBER_BARBARIAN_ARCHER_01',1);
--MUSKETMAN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_MUSKETMAN%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MUSKETMAN'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_SPANISH_TERCIO';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_U_SPANISH_TERCIO','ART_DEF_UNIT_MEMBER_U_SPANISH_TERCIO_ARCABUCERO',1);
--PIKEMAN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_PIKEMAN%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_PIKEMAN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.24 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_%';
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_GERMAN_LANDSKNECHT';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_U_GERMAN_LANDSKNECHT','ART_DEF_UNIT_MEMBER_U_GERMAN_LANDSKNECHT_A',1);
--SPEARMAN*
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_SPEARMAN%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_SPEARMAN'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SPEARMAN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_SPEARMAN','ART_DEF_UNIT_MEMBER_SPEARMAN_V2',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_GREEK_HOPLITE';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_%';
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_BARBARIAN_SPEARMAN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_BARBARIAN_SPEARMAN','ART_DEF_UNIT_MEMBER_BARBARIAN_SPEARMAN_V2',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_HUNS_BATTERING_RAM'; --other
--SWORDSMAN*
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_SWORDSMAN%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_SWORDSMAN'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_SWORDSMAN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_SWORDSMAN','ART_DEF_UNIT_MEMBER_SWORDSMAN',1);
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_BARBARIAN_SWORDSMAN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_BARBARIAN_SWORDSMAN','ART_DEF_UNIT_MEMBER_BARBARIAN_SWORDSMAN',1);
--WARRIOR*
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_WARRIOR%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_WARRIOR'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__WARRIOR';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT__WARRIOR','ART_DEF_UNIT_MEMBER_WARRIOR_V2',1);
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_BARBARIAN_EURO';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_BARBARIAN_EURO','ART_DEF_UNIT_MEMBER_BARBARIAN_EURO_ALPHA',1);
-- others
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_COMPOSITE_BOWMAN%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_COMPOSITE_BOWMAN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_CROSSBOWMAN%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_CROSSBOWMAN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_WW1_INFANTRY%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_GREAT_WAR_INFANTRY'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_INFANTRY%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_INFANTRY'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_LONGSWORDSMAN%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_LONGSWORDSMAN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_MARINE%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MARINE'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_RIFLEMAN%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_RIFLEMAN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.23 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_DANISH_SKY_INFANTRY';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_PARATROOPER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_PARATROOPER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_SCOUT%';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_SCOUT'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_WW2_INFANTRY%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_WW2INFANTRY'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_XCOM_SQUAD%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_XCOM_SQUAD'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SAXON_HUSCARL';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SUMERIAN_PHALANX';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_CONFEDERATE_RIFLEMAN';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_UNION_RIFLEMAN';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_GADRAUHTS_SWORDSMAN';

-- CIVILIANS (0.25)
------------------------------------------------
-- ARCHAEOLOGIST
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_ARCHAEOLOGIST'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARCHAEOLOGIST';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_ARCHAEOLOGIST','ART_DEF_UNIT_MEMBER_ARCHAEOLOGIST',1);
-- EXPLORER (Scramble for Africa)
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_EXPLORER'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_EXPLORER';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_EXPLORER','ART_DEF_UNIT_MEMBER_GREAT_EXPLORER',1);
-- INQUISITOR*
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_INQUISITOR'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_INQUISITOR';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_INQUISITOR','ART_DEF_UNIT_MEMBER_INQUISITOR',1);
-- MILITARY ENGINEER???
-- MISSIONARY*
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MISSIONARY'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MISSIONARY';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_MISSIONARY','ART_DEF_UNIT_MEMBER_MISSIONARY',1);
-- SETTLER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_SETTLER'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT__SETTLER','ART_DEF_UNIT_MEMBER_EURODONKEY',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN
	(SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_EURO');
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_EURO';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT__SETTLER_EURO','ART_DEF_UNIT_MEMBER_EURODONKEY',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN
	(SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_MED');
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_MED';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT__SETTLER_MED','ART_DEF_UNIT_MEMBER_EURODONKEY',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.23 WHERE Type = 'ART_DEF_UNIT_MEMBER_EURODONKEY';

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN
	(SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI');
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AFRI';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT__SETTLER_AFRI','ART_DEF_UNIT_MEMBER_AFRICAMEL',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN
	(SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_MIDEAST');
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_MIDEAST';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT__SETTLER_MIDEAST','ART_DEF_UNIT_MEMBER_AFRICAMEL',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type = 'ART_DEF_UNIT_MEMBER_AFRICAMEL';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN
	(SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AMER');
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_AMER';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT__SETTLER_AMER','ART_DEF_UNIT_MEMBER_AMERLLAMA',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN
	(SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_SOUTHAM');
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_SOUTHAM';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT__SETTLER_SOUTHAM','ART_DEF_UNIT_MEMBER_AMERLLAMA',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.24 WHERE Type = 'ART_DEF_UNIT_MEMBER_AMERLLAMA';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN
	(SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA');
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT__SETTLER_ASIA';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT__SETTLER_ASIA','ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_OX',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type = 'ART_DEF_UNIT_MEMBER_SETTLERS_ASIAN_OX';
-- SPANISH TREASURE CART
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_TREASURE_CART';
-- WORKER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_WORKER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKER_EURO_LATE';


-- GUNNERS (0.2)
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.24 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_BAZOOKA_INFANTRY%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.24 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_BAZOOKA'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.22 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_GATLINGGUN%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.22 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_GATLINGGUN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.22 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_MACHINEGUN%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.22 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MACHINE_GUN'));


-- GREAT PEOPLE
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'GREAT_PERSON'));

-- GREAT ARTIST*
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_ARTIST'));
-- (pre-BNW)
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_ARTIST';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_ARTIST','ART_DEF_UNIT_MEMBER_GREATARTIST_EARLY_FLUTE',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATARTIST_LATE'; --vehicle
-- (post-BNW)
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE';
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_ARTIST';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_GREAT_ARTIST','ART_DEF_UNIT_MEMBER_GREAT_ARTIST',1);
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_GREAT_ARTIST_POSTMODERN','ART_DEF_UNIT_MEMBER_GREAT_ARTIST_LATE',1);

-- GREAT MUSICIAN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MUSICIAN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE';
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_MUSICIAN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_GREAT_MUSICIAN','ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN',1);
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_GREAT_MUSICIAN_POSTMODERN','ART_DEF_UNIT_MEMBER_GREAT_MUSICIAN_LATE',1);

-- GREAT WRITER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_WRITER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE';
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_WRITER';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_GREAT_WRITER','ART_DEF_UNIT_MEMBER_GREAT_WRITER',1);
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_WRITER_POSTMODERN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_GREAT_WRITER_POSTMODERN','ART_DEF_UNIT_MEMBER_GREAT_WRITER_LATE',1);

-- GREAT PROPHET
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_PROPHET'));
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_GREAT_PROPHET';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_GREAT_PROPHET','ART_DEF_UNIT_MEMBER_GREAT_PROPHET',1);


-- MOUNTED GREAT PEOPLE
------------------------------------------------
-- GREAT GENERAL
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_GREAT_GENERAL'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATGENERAL_LATE'; -- * vehicle
-- GREAT MERCHANT
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MERCHANT')); -- * camel
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_MERCHANT';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_MERCHANT','ART_DEF_UNIT_MEMBER_GREATMERCHANT_EARLY_LEADER',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.15 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATMERCHANT_LATE'; -- * vehicle
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT';
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_VENETIAN_MERCHANT';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_U_VENETIAN_MERCHANT','ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT',1);
--??? VENETIAN MERCHANT
--UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_MERCHANT'; -- * not mounted

-- GREAT PEOPLE VEHICLES
------------------------------------------------
-- GREAT ENGINEER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_ENGINEER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATENGINEER_LATE';
-- GREAT SCIENTIST
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_SCIENTIST')); -- * horse-drawn vehicle
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREATSCIENTIST_LATE';


-- MOUNTED (0.2)
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'QUADRUPED'));

-- CARAVAN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_CARAVAN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.08 WHERE Type = 'ART_DEF_UNIT_MEMBER_CARAVAN_LATE';
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CARAVAN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_CARAVAN','ART_DEF_UNIT_MEMBER_CARAVAN',1);
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_CARAVAN_POSTMODERN';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_CARAVAN_POSTMODERN','ART_DEF_UNIT_MEMBER_CARAVAN_LATE',1);

-- CAVALRY
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_CAVALRY%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_CAVALRY'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type = 'ART_DEF_UNIT_MEMBER_CONFEDERATE_CAVALRY_CARBINE';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type = 'ART_DEF_UNIT_MEMBER_CONFEDERATE_CAVALRY_PISTOL';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.21 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK';
DELETE FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType = 'ART_DEF_UNIT_U_RUSSIAN_COSSACK';
INSERT INTO ArtDefine_UnitInfoMemberInfos VALUES ('ART_DEF_UNIT_U_RUSSIAN_COSSACK','ART_DEF_UNIT_MEMBER_U_RUSSIAN_COSSACK_V2',1);
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type = 'ART_DEF_UNIT_MEMBER_UNION_CAVALRY_CARBINE';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type = 'ART_DEF_UNIT_MEMBER_UNION_CAVALRY_PISTOL';
-- HORSEMAN
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_HORSEMAN%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_HORSEMAN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_CARTHAGE_AFRICANFOREST_ELEPHANT'; -- * elephant
-- KNIGHT
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_KNIGHT%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_KNIGHT'));
--Note Conquistador has MoveRate = BIPED
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_ARABIAN_CAMELARCHER'; -- * camel
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SIAMESE_WARELEPHANT'; -- * elephant
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SONGHAI_MUSLIMCAVALRY';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_CONQUISTADOR';
-- LANCER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_LANCER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_LANCER'));

-- GIANT DEATH ROBOT (0.16)
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'ROBOT'));

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_MECH%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MECH'));

-- HORSE-DRAWN VEHICLES (0.17)
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'WHEELED'));

-- CHARIOT ARCHER
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_CHARIOTARCHER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_CHARIOT_ARCHER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_HUNS_HORSE_ARCHER'; -- * mounted
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.25 WHERE Type = 'ART_DEF_UNIT_MEMBER_HAND_AXE_BARBARIAN'; -- * not mounted
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_HITTITE_WARCHARIOT';
--UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_INDIAN_WARELEPHANT'; -- * elephant

--following used after unitclass updates for elephant units
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'PHANT'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_INDIAN_WARELEPHANT'; -- * elephant

-- VEHICLES
------------------------------------------------
-- TANK
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_TANK%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_TANK'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_GERMAN_PANZER';
-- others
--not updated by R.E.D., but counters change from MECH% wildcard above
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_MECHANIZEDINFANTRY%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MECHANIZED_INFANTRY'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_MOBILESAM%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MOBILE_SAM'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_MODERNARMOR%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MODERN_ARMOR'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_ROCKETARTILLERY%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_ROCKET_ARTILLERY'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_WW1_TANK%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_WWI_TANK'));


-- HELICOPTER GUNSHIP (0.11)
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE CombatClass = 'UNITCOMBAT_HELICOPTER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_HELICOPTERGUNSHIP%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_HELICOPTER_GUNSHIP'));


-- SPACESHIP PARTS (0.17)
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class LIKE 'UNITCLASS_SS_%'));


-- SIEGE
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'ARTILLERY'));

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_ANTIAIRCRAFTGUN%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_ANTI_AIRCRAFT_GUN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_ANTITANKGUN%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_ANTI_TANK_GUN'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_ARTILLERY%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_ARTILLERY'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_CANNON%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_CANNON'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type = 'ART_DEF_UNIT_MEMBER_CONFEDERATE_ARTILLERY_NAPOLEON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type = 'ART_DEF_UNIT_MEMBER_UNION_ARTILLERY_NAPOLEON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type = 'ART_DEF_UNIT_MEMBER_CONFEDERATE_ARTILLERY_PARROTT';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type = 'ART_DEF_UNIT_MEMBER_UNION_ARTILLERY_PARROTT';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_CATAPULT%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_CATAPULT'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_ROMAN_BALLISTA';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_ASSYRIAN_SIEGE_TOWER';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_TREBUCHET%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_TREBUCHET'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_KOREAN_HWACHA';


-- SHIPS
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.15 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'WOODEN_BOAT'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.15 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'BOAT'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'SUB'));

-- TRIREME
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.08 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_TRIREME%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.08 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_TRIREME'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_BYZANTIUM_DROMON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.07 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_CARTHAGE_QUINQUEREME';
-- others
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_BATTLESHIP%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_BATTLESHIP'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_CARAVEL%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_CARAVEL'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.15 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_KOREAN_TURTLESHIP';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_CARRIER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.11 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_CARRIER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_DESTROYER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_DESTROYER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.15 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_FRIGATE%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.15 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_FRIGATE'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.15 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_ENGLISH_SHIPOFTHELINE';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_GALLEASS%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_GALLEASS'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_VENETIAN_GALLEASS';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_GALLEY')); --barbarian galley
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_IRONCLAD%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_IRONCLAD'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_MISSILECRUISER%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_MISSILE_CRUISER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_NUCLEARSUBMARINE%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_NUCLEAR_SUBMARINE'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type = 'ART_DEF_UNIT_MEMBER_PRIVATEER';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_XP_PRIVATEER%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_PRIVATEER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_DUTCH_SEA_BEGGARS';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_SUBMARINE%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_SUBMARINE'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type = 'ART_DEF_UNIT_MEMBER_CONFEDERATE_IRONCLAD';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type = 'ART_DEF_UNIT_MEMBER_UNION_IRONCLAD';


-- CIVILIAN SHIPS
------------------------------------------------
-- CARGO SHIP
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_CARGO_SHIP'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type = 'ART_DEF_UNIT_MEMBER_CARGO_SHIP_MID';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.10 WHERE Type = 'ART_DEF_UNIT_MEMBER_CARGO_SHIP_LATE';
-- GREAT ADMIRAL
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_GREAT_ADMIRAL'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type = 'ART_DEF_UNIT_MEMBER_GREAT_ADMIRAL_LATE';
-- WORKBOAT
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.1 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_WORKBOAT'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.1 WHERE Type = 'ART_DEF_UNIT_MEMBER_WORKBOAT_INDUSTRIAL';


-- PLANES
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE MoveRate = 'AIR_REBASE'));

UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_ATOMICBOMB%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.12 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_ATOMIC_BOMB'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_BOMBER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_BOMBER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_FIGHTER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.18 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_FIGHTER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_JETFIGHTER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.19 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_JET_FIGHTER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_STEALTHBOMBER%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_STEALTH_BOMBER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_WW1_FIGHTER%'; --R.E.D.
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.16 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_TRIPLANE'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_WW1_BOMBER%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_WWI_BOMBER'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.21 WHERE Type = 'ART_DEF_UNIT_MEMBER_SMOKEY_AIRSHIP_LEVEL_1';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.21 WHERE Type = 'ART_DEF_UNIT_MEMBER_SMOKEY_BLIMP';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type = 'ART_DEF_UNIT_MEMBER_SMOKEY_LANDSHIP_LEVEL_1';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.17 WHERE Type = 'ART_DEF_UNIT_MEMBER_SMOKEY_LANDSHIP_LEVEL_2';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.2 WHERE Type = 'ART_DEF_UNIT_MEMBER_SMOKEY_LANDSHIP_LEVEL_3';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.13 WHERE Type = 'ART_DEF_UNIT_MEMBER_SMOKEY_STEAM_FIGHTER';


-- BALLISTICS
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.31 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_GUIDEDMISSILE%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.31 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_GUIDED_MISSILE'));
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.23 WHERE Type LIKE 'ART_DEF_UNIT_MEMBER_NUCLEARMISSILE%'; --R.E.D. [future]
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.23 WHERE Type IN (SELECT UnitMemberInfoType FROM ArtDefine_UnitInfoMemberInfos WHERE UnitInfoType IN
	(SELECT UnitArtInfo FROM Units WHERE Class = 'UNITCLASS_NUCLEAR_MISSILE'));


-- EMBARKED UNITS
------------------------------------------------
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.15 WHERE Type = 'ART_DEF_UNIT_MEMBER_GALLEY'; --not barbarian galley
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.07 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_DANISH_LONGBOAT';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.06 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_POLYNESIAN_WAR_CANOE';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type = 'ART_DEF_UNIT_MEMBER_GALLEON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.14 WHERE Type = 'ART_DEF_UNIT_MEMBER_U_SPANISH_GALLEON';
UPDATE ArtDefine_UnitMemberInfos SET Scale = 0.1 WHERE Type = 'ART_DEF_UNIT_MEMBER_TRANSPORT';
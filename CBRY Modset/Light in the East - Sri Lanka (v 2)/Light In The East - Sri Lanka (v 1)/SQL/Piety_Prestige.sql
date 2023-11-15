--==========================================================================================================================	
-- Flavors
--==========================================================================================================================			
INSERT OR REPLACE INTO Flavors 
			(Type)
VALUES		('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');

INSERT INTO Leader_Flavors
			(LeaderType,			FlavorType,								Flavor)
VALUES		('LEADER_PARAKRAMABAHU',	'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',		3);
--==========================================================================================================================		
--========================================================================================================================== 



--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
			( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_VODUN' )
						THEN 'RELIGION_VODUN'
						ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
						THEN 'RELIGION_PROTESTANT_METHODISM'
						ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
						THEN 'RELIGION_PROTESTANTISM'
						ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
			) WHERE CivilizationType = 'CIVILIZATION_BUCCANEER';

CREATE TRIGGER ReligionAshantiHistoricalReligions
AFTER INSERT ON Religions WHEN 'RELIGION_VODUN' = NEW.Type
BEGIN
			UPDATE Civilization_Religions 
			SET ReligionType = 'RELIGION_VODUN'
			WHERE CivilizationType IN ('CIVILIZATION_BUCCANEER');
END;

CREATE TRIGGER ReligionAshantiProtestanDenominations
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
			UPDATE Civilization_Religions SET ReligionType = 
						( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_VODUN' )
									THEN 'RELIGION_VODUN'
									ELSE 'RELIGION_PROTESTANT_METHODISM' END 
						) WHERE CivilizationType = 'CIVILIZATION_BUCCANEER';
END;



--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
			( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ISLAM_SHIA' )
						THEN 'RELIGION_ISLAM_SHIA'
						ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ISLAM_SUNNI' )
						THEN 'RELIGION_ISLAM_SUNNI'
						ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ISLAM_SUNNI' )
						THEN 'RELIGION_ISLAM_SUNNI'
						ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
			) WHERE CivilizationType = 'CIVILIZATION_TIMURIDS_MOD';

CREATE TRIGGER ReligionAshantiHistoricalReligions
AFTER INSERT ON Religions WHEN 'RELIGION_ISLAM_SHIA' = NEW.Type
BEGIN
			UPDATE Civilization_Religions 
			SET ReligionType = 'RELIGION_ISLAM_SHIA'
			WHERE CivilizationType IN ('CIVILIZATION_TIMURIDS_MOD');
END;

CREATE TRIGGER ReligionAshantiProtestanDenominations
AFTER INSERT ON Religions WHEN 'RELIGION_ISLAM_SUNNI' = NEW.Type
BEGIN
			UPDATE Civilization_Religions SET ReligionType = 
						( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_ISLAM_SHIA' )
									THEN 'RELIGION_ISLAM_SHIA'
									ELSE 'RELIGION_ISLAM_SUNNI' END 
						) WHERE CivilizationType = 'CIVILIZATION_TIMURIDS_MOD';
END;


--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
			( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MAHAYANA' )
						THEN 'RELIGION_MAHAYANA'
						ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SHINTO' )
						THEN 'RELIGION_SHINTO'
						ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_SHINTO' )
						THEN 'RELIGION_SHINTO'
						ELSE 'RELIGION_SHINTO' END ) END ) END
			) WHERE CivilizationType = 'CIVILIZATION_JFD_JAPAN_MEIJI';

CREATE TRIGGER ReligionAshantiHistoricalReligions
AFTER INSERT ON Religions WHEN 'RELIGION_MAHAYANA' = NEW.Type
BEGIN
			UPDATE Civilization_Religions 
			SET ReligionType = 'RELIGION_MAHAYANA'
			WHERE CivilizationType IN ('CIVILIZATION_JFD_JAPAN_MEIJI');
END;

CREATE TRIGGER ReligionAshantiProtestanDenominations
AFTER INSERT ON Religions WHEN 'RELIGION_SHINTO' = NEW.Type
BEGIN
			UPDATE Civilization_Religions SET ReligionType = 
						( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MAHAYANA' )
									THEN 'RELIGION_MAHAYANA'
									ELSE 'RELIGION_SHINTO' END 
						) WHERE CivilizationType = 'CIVILIZATION_JFD_JAPAN_MEIJI';
END;
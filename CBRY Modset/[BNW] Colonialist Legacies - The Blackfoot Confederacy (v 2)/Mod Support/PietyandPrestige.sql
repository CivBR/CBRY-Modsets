-- Insert SQL Rules Here
INSERT OR REPLACE INTO Flavors
            (Type)
VALUES      ('FLAVOR_JFD_RELIGIOUS_INTOLERANCE');
 
INSERT INTO Leader_Flavors
            (LeaderType,            FlavorType,                             Flavor)
VALUES      ('LEADER_BLACKFOOTCROWFOOT',    'FLAVOR_JFD_RELIGIOUS_INTOLERANCE',     2);

--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
            ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_WAKAN_TANKA' )
                        THEN 'RELIGION_WAKAN_TANKA'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
                        THEN 'RELIGION_PROTESTANT_METHODISM'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
                        THEN 'RELIGION_PROTESTANTISM'
                        ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
            ) WHERE CivilizationType = 'CIVILIZATION_BLACKFOOTFIRSTNATION';

CREATE TRIGGER ReligionAshantiHistoricalReligions
AFTER INSERT ON Religions WHEN 'RELIGION_WAKAN_TANKA' = NEW.Type
BEGIN
            UPDATE Civilization_Religions 
            SET ReligionType = 'RELIGION_WAKAN_TANKA'
            WHERE CivilizationType IN ('CIVILIZATION_BLACKFOOTFIRSTNATION');
END;

CREATE TRIGGER ReligionAshantiProtestanDenominations
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
            UPDATE Civilization_Religions SET ReligionType = 
                        ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_WAKAN_TANKA' )
                                    THEN 'RELIGION_WAKAN_TANKA'
                                    ELSE 'RELIGION_PROTESTANT_METHODISM' END 
                        ) WHERE CivilizationType = 'CIVILIZATION_BLACKFOOTFIRSTNATION';
END;


--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
            ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PACHISM' )
                        THEN 'RELIGION_PACHISM'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
                        THEN 'RELIGION_PROTESTANT_METHODISM'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
                        THEN 'RELIGION_PROTESTANTISM'
                        ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
            ) WHERE CivilizationType = 'CIVILIZATION_INCA';

CREATE TRIGGER ReligionAshantiHistoricalReligions
AFTER INSERT ON Religions WHEN 'RELIGION_PACHISM' = NEW.Type
BEGIN
            UPDATE Civilization_Religions 
            SET ReligionType = 'RELIGION_PACHISM'
            WHERE CivilizationType IN ('CIVILIZATION_INCA');
END;

CREATE TRIGGER ReligionAshantiProtestanDenominations
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
            UPDATE Civilization_Religions SET ReligionType = 
                        ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PACHISM' )
                                    THEN 'RELIGION_PACHISM'
                                    ELSE 'RELIGION_PROTESTANT_METHODISM' END 
                        ) WHERE CivilizationType = 'CIVILIZATION_INCA';
END;


--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
            ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TJUKURPA' )
                        THEN 'RELIGION_TJUKURPA'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
                        THEN 'RELIGION_PROTESTANT_METHODISM'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
                        THEN 'RELIGION_PROTESTANTISM'
                        ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
            ) WHERE CivilizationType = 'CIVILIZATION_CLKIMBERLEY';

CREATE TRIGGER ReligionAshantiHistoricalReligions
AFTER INSERT ON Religions WHEN 'RELIGION_TJUKURPA' = NEW.Type
BEGIN
            UPDATE Civilization_Religions 
            SET ReligionType = 'RELIGION_TJUKURPA'
            WHERE CivilizationType IN ('CIVILIZATION_CLKIMBERLEY');
END;

CREATE TRIGGER ReligionAshantiProtestanDenominations
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
            UPDATE Civilization_Religions SET ReligionType = 
                        ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_TJUKURPA' )
                                    THEN 'RELIGION_TJUKURPA'
                                    ELSE 'RELIGION_PROTESTANT_METHODISM' END 
                        ) WHERE CivilizationType = 'CIVILIZATION_CLKIMBERLEY';
END;




--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
            ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MANAISM' )
                        THEN 'RELIGION_MANAISM'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
                        THEN 'RELIGION_PROTESTANT_METHODISM'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
                        THEN 'RELIGION_PROTESTANTISM'
                        ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
            ) WHERE CivilizationType = 'CIVILIZATION_MC_MAORI';

CREATE TRIGGER ReligionAshantiHistoricalReligions
AFTER INSERT ON Religions WHEN 'RELIGION_MANAISM' = NEW.Type
BEGIN
            UPDATE Civilization_Religions 
            SET ReligionType = 'RELIGION_MANAISM'
            WHERE CivilizationType IN ('CIVILIZATION_MC_MAORI');
END;

CREATE TRIGGER ReligionAshantiProtestanDenominations
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
            UPDATE Civilization_Religions SET ReligionType = 
                        ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_MANAISM' )
                                    THEN 'RELIGION_MANAISM'
                                    ELSE 'RELIGION_PROTESTANT_METHODISM' END 
                        ) WHERE CivilizationType = 'CIVILIZATION_MC_MAORI';
END;






--Historical Religions
UPDATE Civilization_Religions SET ReligionType = 
            ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_AMATONGO' )
                        THEN 'RELIGION_AMATONGO'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANT_METHODISM' )
                        THEN 'RELIGION_PROTESTANT_METHODISM'
                        ELSE ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_PROTESTANTISM' )
                        THEN 'RELIGION_PROTESTANTISM'
                        ELSE 'RELIGION_CHRISTIANITY' END ) END ) END
            ) WHERE CivilizationType = 'CIVILIZATION_ZULU';

CREATE TRIGGER ReligionAshantiHistoricalReligions
AFTER INSERT ON Religions WHEN 'RELIGION_AMATONGO' = NEW.Type
BEGIN
            UPDATE Civilization_Religions 
            SET ReligionType = 'RELIGION_AMATONGO'
            WHERE CivilizationType IN ('CIVILIZATION_ZULU');
END;

CREATE TRIGGER ReligionAshantiProtestanDenominations
AFTER INSERT ON Religions WHEN 'RELIGION_PROTESTANT_METHODISM' = NEW.Type
BEGIN
            UPDATE Civilization_Religions SET ReligionType = 
                        ( CASE WHEN EXISTS(SELECT Type FROM Religions WHERE Type = 'RELIGION_AMATONGO' )
                                    THEN 'RELIGION_AMATONGO'
                                    ELSE 'RELIGION_PROTESTANT_METHODISM' END 
                        ) WHERE CivilizationType = 'CIVILIZATION_ZULU';
END;


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
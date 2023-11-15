-- UPDATE GameSpeed_Turns SET TurnsPerIncrement=100 WHERE MonthIncrement = 180 AND GameSpeedType = 'GAMESPEED_STANDARD';
-- UPDATE GameSpeed_Turns SET TurnsPerIncrement=300 WHERE MonthIncrement = 120 AND GameSpeedType = 'GAMESPEED_STANDARD';
-- UPDATE GameSpeed_Turns SET TurnsPerIncrement=170 WHERE MonthIncrement = 60 AND GameSpeedType = 'GAMESPEED_STANDARD';
-- UPDATE GameSpeed_Turns SET TurnsPerIncrement=201 WHERE MonthIncrement = 24 AND GameSpeedType = 'GAMESPEED_STANDARD';
-- UPDATE GameSpeed_Turns SET TurnsPerIncrement=129 WHERE MonthIncrement = 12 AND GameSpeedType = 'GAMESPEED_STANDARD';
-- UPDATE GameSpeed_Turns SET TurnsPerIncrement=180 WHERE MonthIncrement = 6 AND GameSpeedType = 'GAMESPEED_STANDARD';
-- UPDATE GameSpeed_Turns SET TurnsPerIncrement=264 WHERE MonthIncrement = 3 AND GameSpeedType = 'GAMESPEED_STANDARD';
-- UPDATE GameSpeed_Turns SET TurnsPerIncrement=156 WHERE MonthIncrement = 1 AND GameSpeedType = 'GAMESPEED_STANDARD';

UPDATE Unit_Flavors SET Flavor=8 WHERE UnitType='UNIT_SETTLER';

UPDATE Defines SET Value=15 WHERE Name="RELIGION_MIN_FAITH_FIRST_PANTHEON";
UPDATE Defines SET Value=200 WHERE Name="RELIGION_MIN_FAITH_FIRST_PROPHET";
UPDATE Defines SET Value=2000 WHERE Name="RELIGION_MIN_FAITH_FIRST_GREAT_PERSON";
UPDATE Defines SET Value=1000 WHERE Name="RELIGION_FAITH_DELTA_NEXT_PROPHET";
UPDATE Defines SET Value=1000 WHERE Name="RELIGION_FAITH_DELTA_NEXT_GREAT_PERSON";

UPDATE Units SET FaithCost=400 WHERE Type='UNIT_MISSIONARY';

UPDATE GameSpeeds SET DealDuration=45 WHERE Type='GAMESPEED_STANDARD';
UPDATE GameSpeeds SET ResearchPercent=150 WHERE Type='GAMESPEED_STANDARD';
UPDATE GameSpeeds SET FaithPercent=800 WHERE Type='GAMESPEED_STANDARD';
UPDATE GameSpeeds SET InflationPercent=25 WHERE Type='GAMESPEED_STANDARD';
UPDATE GameSpeeds SET InflationOffset=-135 WHERE Type='GAMESPEED_STANDARD';
UPDATE GameSpeeds SET ReligiousPressureAdjacentCity=45 WHERE Type='GAMESPEED_STANDARD';
UPDATE GameSpeeds SET PeaceDealDuration=15 WHERE Type='GAMESPEED_STANDARD';
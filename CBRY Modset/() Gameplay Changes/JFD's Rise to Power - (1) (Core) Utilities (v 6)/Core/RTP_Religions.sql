--==========================================================================================================================
-- RELIGIONS
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
-- Religions
--------------------------------------------------------------------------------------------------------------------------
UPDATE Religions
SET Adjective = Description || '_ADJ'
WHERE Type IS NOT NULL;
--==========================================================================================================================
--==========================================================================================================================
--=======================================================================================================================
-- CUSTOM MOD OPTIONS
--=======================================================================================================================
-- CustomModOptions
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--==========================================================================================================================
-- IDEOLOGICAL VALUES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IdeologicalValues
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	JFD_IdeologicalValues (
	ID  													integer 						  				primary key autoincrement,
	Type 													text 											default null,
	Description												text 											default null,
	IdeologyBranchType										text 											default null,
	IconString												text 											default null);
--==========================================================================================================================
-- POLICIES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- Policies
-------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Policies ADD IdeologicalValueReq				integer											default 0;
ALTER TABLE Policies ADD IsDuplicateIdeologicalTenet		boolean											default 0;
-------------------------------------------------------------------------------------------------------------------------
-- Policy_JFD_IdeologicalValues
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	Policy_JFD_IdeologicalValues (
	PolicyType 												text REFERENCES Policies(Type) 					default null,
	IdeologicalValueType									text REFERENCES JFD_IdeologicalValues(Type) 	default null);
--==========================================================================================================================
--==========================================================================================================================
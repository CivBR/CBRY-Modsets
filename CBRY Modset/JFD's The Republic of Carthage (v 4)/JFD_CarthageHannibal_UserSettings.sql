--==========================================================================================================================
-- JFD USER SETTINGS
--==========================================================================================================================
-- JFD_GlobalUserSettings
-------------------------------------
CREATE TABLE IF NOT EXISTS 
JFD_GlobalUserSettings (
	Type 											text 										default null,
	Value 											integer 									default 1);
--==========================================================================================================================	
-- USER SETTINGS
--==========================================================================================================================	
-- Modular Features that can be toggled on and off and then back on.
--------------------------------------------------------------------------
/*CORE SETTINGS
---------------
  1 = Enabled (Default)
  0 = Disabled
*/
--------------------------------------------------------------------------
INSERT INTO JFD_GlobalUserSettings
		(Type,										Value)
VALUES	('JFD_CIVILIZATIONS_CARTHAGE_UA',			1), -- Enables Dido's new UA.
		('JFD_CIVILIZATIONS_CARTHAGE_MERCENARY_UA',	1), -- Enables Hannibal's Mercenaries-exclusive UA.
		('JFD_CIVILIZATIONS_CARTHAGE_UB',			1), -- Enables Dido's new UB (disable only if you have a replacement, such as with the CBP).
		('JFD_CIVILIZATIONS_CARTHAGE_UU',			1); -- Enables changes to Dido's UU.
--==========================================================================================================================	
--==========================================================================================================================	
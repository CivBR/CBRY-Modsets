--=======================================================================================================================
-- CUSTOM MOD OPTIONS
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- CustomModOptions
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS CustomModOptions(Name Text, Value INTEGER, Class INTEGER, DbUpdates INTEGER);
--==========================================================================================================================
-- POLICY BRANCHES
--==========================================================================================================================	
-------------------------------------------------------------------------------------------------------------------------
ALTER TABLE PolicyBranchTypes ADD RequiresIdeologiesFounded	text 	REFERENCES PolicyBranchTypes(Type) 	default null;
-------------------------------------------------------------------------------------------------------------------------
-- PolicyBranch_EraSplashBackgrounds
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	PolicyBranch_EraSplashBackgrounds (
	PolicyBranchType						text 	REFERENCES PolicyBranchTypes(Type) 		default null,
	EraType									text 	REFERENCES Eras(Type) 					default null,
	Texture									text 	 										default null);
--==========================================================================================================================	
-- POLICIES
--==========================================================================================================================	
--------------------------------------------------------------------------------------------------------------------------		
ALTER TABLE Policies ADD OriginalPolicyBranchType	text 	REFERENCES PolicyBranchTypes(Type) 	default null;
ALTER TABLE Policies ADD OriginalIconAtlas			text 									default null;
ALTER TABLE Policies ADD OriginalPortraitIndex		integer 								default 0;
--==========================================================================================================================
-- SOCIAL POLICY SCREEN
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
-- SocialPolicyPanels
-------------------------------------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS
	SocialPolicyPanels (
	ID  								integer 						  					primary key autoincrement,
	Type 								text 												default null,
	Offset								integer 						  					default 0,
	Header								text 	 											default null,
	ToolTip								text 	 											default null,
	ControlBox 							text 												default null,
	PreviousPanel						text 												default null,
	NextPanel							text 												default null);
--==========================================================================================================================
--==========================================================================================================================
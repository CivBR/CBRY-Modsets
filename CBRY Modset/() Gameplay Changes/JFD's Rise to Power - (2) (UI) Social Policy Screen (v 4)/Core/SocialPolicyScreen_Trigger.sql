--==========================================================================================================================		
-- POLICIES
--==========================================================================================================================
--------------------------------------------------------------------------------------------------------------------------
--JFD_SocialPolicyScreen_Policies
CREATE TRIGGER JFD_SocialPolicyScreen_Policies
AFTER INSERT ON Policies
WHEN NEW.IconAtlas IS NOT NULL
BEGIN
	UPDATE Policies
	SET OriginalPortraitIndex = PortraitIndex, OriginalIconAtlas = IconAtlas, PortraitIndex = 0, IconAtlas = 'POLICY_ATLAS'
	WHERE Type = NEW.Type;
END;
--==========================================================================================================================
--==========================================================================================================================
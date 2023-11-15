-- Burmese Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Burmese Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Burma: Designate the Official Nats
-------------------------------------------------------------------------------------------------------------------------
local Decisions_BurmaNats = {}
    Decisions_BurmaNats.Name = "TXT_KEY_DECISIONS_BURMANATS"
	Decisions_BurmaNats.Desc = "TXT_KEY_DECISIONS_BURMANATS_DESC"
	HookDecisionCivilizationIcon(Decisions_BurmaNats, "CIVILIZATION_BURMA")
	Decisions_BurmaNats.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BURMA then return false, false end
		if load(pPlayer, "Decisions_BurmaNats") == true then
			Decisions_BurmaNats.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BURMANATS_ENACTED_DESC")
			return false, false, true
		end
		Decisions_BurmaNats.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BURMANATS_DESC")
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end

		local bPayas = true
		local iPlayer = pPlayer:GetID()
		for pCity in pPlayer:Cities() do
			if ((pCity:GetOriginalOwner() == iPlayer) and not(pCity:IsHasBuilding(GameInfoTypes.BUILDING_PAYA))) then bPayas = false end
		end
		if not(bPayas) then return true, false end 
		
		return true, true
	end
	)
	
	Decisions_BurmaNats.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_BURMANATS, true)
		save(pPlayer, "Decisions_BurmaNats", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_BURMA, "Decisions_BurmaNats", Decisions_BurmaNats)
-------------------------------------------------------------------------------------------------------------------------
-- Burma: Collate the Royal Burmese Chronicles
-------------------------------------------------------------------------------------------------------------------------
local Decisions_BurmaChronicles = {}
    Decisions_BurmaChronicles.Name = "TXT_KEY_DECISIONS_BURMACHRONICLES"
	Decisions_BurmaChronicles.Desc = "TXT_KEY_DECISIONS_BURMACHRONICLES_DESC"
	HookDecisionCivilizationIcon(Decisions_BurmaChronicles, "CIVILIZATION_BURMA")
	Decisions_BurmaChronicles.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_BURMA then return false, false end
		if load(pPlayer, "Decisions_BurmaChronicles") == true then
			Decisions_BurmaChronicles.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BURMACHRONICLES_ENACTED_DESC")
			return false, false, true
		end
		Decisions_BurmaChronicles.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_BURMACHRONICLES_DESC")
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_CIVIL_SERVICE)) then return true, false end

		local bPayas = true
		local iPlayer = pPlayer:GetID()
		for pCity in pPlayer:Cities() do
			if ((pCity:GetOriginalOwner() == iPlayer) and not(pCity:IsHasBuilding(GameInfoTypes.BUILDING_PAYA))) then bPayas = false end
		end
		if not(bPayas) then return true, false end 
		
		return true, true
	end
	)
	
	Decisions_BurmaChronicles.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_BURMACHRONICLES, true)
		save(pPlayer, "Decisions_BurmaChronicles", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_BURMA, "Decisions_BurmaChronicles", Decisions_BurmaChronicles)
--=======================================================================================================================
--=======================================================================================================================
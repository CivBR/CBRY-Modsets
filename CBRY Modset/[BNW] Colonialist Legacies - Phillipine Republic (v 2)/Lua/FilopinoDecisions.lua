-- Decisions Support
-- Author: John -- template by JFD
-- DateCreated: 10/8/2014 7:56:32 PM
--------------------------------------------------------------
--=======================================================================================================================
print("Loading the Filipino Decisions")
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Filipino: Found the Katipunan
-------------------------------------------------------------------------------------------------------------------------
local Decisions_CLFilipinoFoundTheKatipunan = {}
	Decisions_CLFilipinoFoundTheKatipunan.Name = "TXT_KEY_DECISIONS_JFD_PHILIPPINES_FOUNDKATIPUNAN_NAME"
	Decisions_CLFilipinoFoundTheKatipunan.Desc = "TXT_KEY_DECISIONS_JFD_PHILIPPINES_FOUNDKATIPUNAN_DESC"
	HookDecisionCivilizationIcon(Decisions_CLFilipinoFoundTheKatipunan, "CIVILIZATION_JFD_PHILIPPINES")
	Decisions_CLFilipinoFoundTheKatipunan.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_JFD_PHILIPPINES) then return false, false end
		if load(pPlayer, "Decisions_CLFilipinoFoundTheKatipunan") == true then
			Decisions_CLFilipinoFoundTheKatipunan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PHILIPPINES_FOUNDKATIPUNAN_ADOPTED")
			return false, false, true
		end
		
		local iCultureCost = math.ceil(150 * iMod)
		local iGoldenCost = math.ceil(100 * iMod)
		Decisions_CLFilipinoFoundTheKatipunan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PHILIPPINES_FOUNDKATIPUNAN_DESC", iCultureCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetJONSCulture() < iCultureCost) then	return true, false end
		if (pPlayer:GetGoldenAgeProgressMeter() < iGoldenCost) then	return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_RIFLING) then return true, false end
		if (pPlayer:GetHappiness() >= 0) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_CLFilipinoFoundTheKatipunan.DoFunc = (
	function(pPlayer)
		local iCultureCost = math.ceil(150 * iMod)
		local iGoldenCost = math.ceil(100 * iMod)
		pPlayer:ChangeJONSCulture(-iCultureCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:ChangeGoldenAgeProgressMeter(-iGoldenCost)
		local pCity = pPlayer:GetCapitalCity()
		local pPlot = pCity:Plot()
		local jUnit1 = pPlayer:InitUnit(GameInfoTypes.UNIT_JFD_KATIPUNERO, pPlot:GetX(), pPlot:GetY());
		jUnit1:JumpToNearestValidPlot();
		local jUnit2 = pPlayer:InitUnit(GameInfoTypes.UNIT_JFD_KATIPUNERO, pPlot:GetX(), pPlot:GetY());
		jUnit2:JumpToNearestValidPlot();
		local jUnit3 = pPlayer:InitUnit(GameInfoTypes.UNIT_JFD_KATIPUNERO, pPlot:GetX(), pPlot:GetY());
		jUnit3:JumpToNearestValidPlot();
		local jUnit4 = pPlayer:InitUnit(GameInfoTypes.UNIT_GREAT_GENERAL, pPlot:GetX(), pPlot:GetY());
		jUnit4:JumpToNearestValidPlot();
		save(pPlayer, "Decisions_CLFilipinoFoundTheKatipunan", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_PHILIPPINES"], "Decisions_CLFilipinoFoundTheKatipunan", Decisions_CLFilipinoFoundTheKatipunan)
-------------------------------------------------------------------------------------------------------------------------
-- Filipino: Encourage the Reading of Noli Me Tangere
-------------------------------------------------------------------------------------------------------------------------


local Decisions_CLFilopinoNoliMeTangere = {}
	Decisions_CLFilopinoNoliMeTangere.Name = "TXT_KEY_DECISIONS_JFD_PHILIPPINES_NOLIMETANGERE_NAME"
	Decisions_CLFilopinoNoliMeTangere.Desc = "TXT_KEY_DECISIONS_JFD_PHILIPPINES_NOLIMETANGERE_DESC"
	HookDecisionCivilizationIcon(Decisions_CLFilopinoNoliMeTangere, "CIVILIZATION_JFD_PHILIPPINES")
	function CheckDevelopmentLevel(pPlayer)
		local iCoral = 0
		local iPubs = 0
		for pCity in pPlayer:Cities() do
			if pCity:GetNumBuilding(GameInfoTypes.BUILDING_PUBLIC_SCHOOL) > 0 then
				iPubs = iPubs + 1
			end
			if pCity:GetNumBuilding(GameInfoTypes.BUILDING_JFD_CORAL_CHURCH) > 0 then
				iCoral = iCoral + 1
			end
		end
		if (iPubs < 3) or (iCoral < 3) then
			return false
		else
			return true
		end
	end
	
	Decisions_CLFilopinoNoliMeTangere.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_JFD_PHILIPPINES) then return false, false end
		if load(pPlayer, "Decisions_CLFilipinoFoundTheKatipunan") == true then
			Decisions_CLFilipinoFoundTheKatipunan.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PHILIPPINES_FOUNDKATIPUNAN_ADOPTED")
			return false, false, true
		end
		local iCultureCost = math.ceil(200 * iMod)
		local iGoldCost = math.ceil(200 * iMod)
		local iFaithCost = math.ceil(100 * iMod)
		
		Decisions_CLFilopinoNoliMeTangere.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_PHILIPPINES_NOLIMETANGERE_DESC", iGoldCost)
		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if (pPlayer:GetJONSCulture() < iCultureCost) then return true, false end
		if (pPlayer:GetGold() < iGoldCost) then	return true, false end
		if (pPlayer:GetFaith() < iFaithCost) then return true, false end
		if (pPlayer:GetCapitalCity() == nil) then return true, false end
		if not (CheckDevelopmentLevel(pPlayer)) then return true, false end
		return true, true
	end
	)
	
	Decisions_CLFilopinoNoliMeTangere.DoFunc = (
	function(pPlayer)
		local iCultureCost = math.ceil(200 * iMod)
		local iGoldCost = math.ceil(200 * iMod)
		local iFaithCost = math.ceil(100 * iMod)
		pPlayer:ChangeJONSCulture(-iCultureCost)
		pPlayer:ChangeGold(-iGoldCost)
		pPlayer:ChangeFaith(-iFaithCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes["POLICY_NOLIMETANGERE"], true)
		save(pPlayer, "Decisions_CLFilopinoNoliMeTangere", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_JFD_PHILIPPINES"], "Decisions_CLFilopinoNoliMeTangere", Decisions_CLFilopinoNoliMeTangere)
--=======================================================================================================================
--=======================================================================================================================
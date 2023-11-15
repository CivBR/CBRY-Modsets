-- JFD_CarthageHannibal_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Carthage Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- MOD CHECKS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingClaimsColonies
function JFD_IsUsingClaimsColonies()
	local claimsColoniesModID = "10e9728f-d61c-4317-be4f-7d52d6bae6f4"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == claimsColoniesModID) then
			return true
		end
	end
	return false
end
local isUsingClaimsColonies = JFD_IsUsingClaimsColonies()
-------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
-------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- DECISIONS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_CARTHAGE_HANNIBAL"]
local mathCeil = math.ceil
-------------------------------------------------------------------------------------------------------------------------
-- Carthage: Consult the Tribunal of a Hundred and Four
-------------------------------------------------------------------------------------------------------------------------
local unitPromotionShophetTribunalID = GameInfoTypes["PROMOTION_DECISIONS_JFD_SHOPHET_TRIBUNAL"]
local unitShophetID = GameInfoTypes["UNIT_JFD_SHOPHET"]
local Decisions_JFD_CarthageHannibal_Tribunal = {}
	Decisions_JFD_CarthageHannibal_Tribunal.Name = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_TRIBUNAL"
	Decisions_JFD_CarthageHannibal_Tribunal.Desc = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_TRIBUNAL_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_CarthageHannibal_Tribunal, "CIVILIZATION_JFD_CARTHAGE_HANNIBAL")
	Decisions_JFD_CarthageHannibal_Tribunal.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local eraID = load(player, "Decisions_JFD_CarthageHannibal_Tribunal")
		local currentEraID = player:GetCurrentEra()
		if eraID ~= nil then
			if eraID < currentEraID then
				save(player, "Decisions_JFD_CarthageHannibal_Tribunal", nil)
			else
				Decisions_JFD_CarthageHannibal_Tribunal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_TRIBUNAL_ENACTED_DESC")
			return false, false, true
			end
		end
		local goldCost = mathCeil(125*iMod)
		Decisions_JFD_CarthageHannibal_Tribunal.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_TRIBUNAL_DESC", goldCost)
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		local capitalPlot = player:GetCapitalCity():Plot()
		local isShophetHere = false
		for unitID = 0,(capitalPlot:GetNumUnits() - 1) do
			local unit = capitalPlot:GetUnit(unitID)
			if unit:GetUnitType() == unitShophetID then
				isShophetHere = true
				break
			end
		end
		if (not isShophetHere) then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CarthageHannibal_Tribunal.DoFunc = (
	function(player)
		local goldCost = mathCeil(25*iMod)
		local unitShophet = nil
		local capitalPlot = player:GetCapitalCity():Plot()
		for unitID = 0,(capitalPlot:GetNumUnits() - 1) do
			local unit = capitalPlot:GetUnit(unitID)
			if unit:GetUnitType() == unitShophetID then
				unitShophet = unit
				break
			end
		end
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:ChangeGold(-goldCost)
		unitShophet:SetHasPromotion(unitPromotionShophetTribunalID, true)
		save(player, "Decisions_JFD_CarthageHannibal_Tribunal", player:GetCurrentEra())
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_CarthageHannibal_Tribunal", Decisions_JFD_CarthageHannibal_Tribunal)
-------------------------------------------------------------------------------------------------------------------------
-- Carthage: Restore the Power of the Suffetes
-------------------------------------------------------------------------------------------------------------------------
local policySuffetesID = GameInfoTypes["POLICY_DECISIONS_JFD_SUFFETES"]
local techCodeOfLawsID = GameInfoTypes["TECH_JFD_CODE_OF_LAWS"]
local techWritingID = GameInfoTypes["TECH_WRITING"]
local Decisions_JFD_CarthageHannibal_Suffetes = {}
	Decisions_JFD_CarthageHannibal_Suffetes.Name = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES"
	Decisions_JFD_CarthageHannibal_Suffetes.Desc = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES_DESC"
	HookDecisionCivilizationIcon(Decisions_JFD_CarthageHannibal_Suffetes, "CIVILIZATION_JFD_CARTHAGE_HANNIBAL")
	Decisions_JFD_CarthageHannibal_Suffetes.Weight = nil
	Decisions_JFD_CarthageHannibal_Suffetes.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilizationID then return false, false end
		local rewardDesc = "TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES_ENACTED_DESC_REWARD"
		local techID = techWritingID
		local techDesc = "Writing"
		if isUsingClaimsColonies then
			if techCodeOfLawsID then 
				techID = techCodeOfLawsID 
				techDesc = "Code of Laws" 
			end
			rewardDesc = 'TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES_ENACTED_DESC_REWARD_CLAIMS'
		end
		if player:HasPolicy(policySuffetesID) then
			Decisions_JFD_CarthageHannibal_Suffetes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES_ENACTED_DESC", rewardDesc)
			return false, false, true
		end
		local goldCost = mathCeil(300*iMod)
		Decisions_JFD_CarthageHannibal_Suffetes.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_CARTHAGE_HANNIBAL_SUFFETES_DESC", techDesc, goldCost, rewardDesc)
		if (not Teams[player:GetTeam()]:IsHasTech(techID)) then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 then return true, false end
		if player:GetGold() < goldCost then return true, false end
		return true, true
	end
	)
	
	Decisions_JFD_CarthageHannibal_Suffetes.DoFunc = (
	function(player)
		local goldCost = mathCeil(300*iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policySuffetesID, true)
		JFD_SendWorldEvent(player:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENTS_JFD_CARTHAGE_HANNIBAL_SUFFETES", player:GetName(), player:GetCivilizationShortDescription()))
	end
	)
	
Decisions_AddCivilisationSpecific(civilizationID, "Decisions_JFD_CarthageHannibal_Suffetes", Decisions_JFD_CarthageHannibal_Suffetes)
--=======================================================================================================================
--=======================================================================================================================

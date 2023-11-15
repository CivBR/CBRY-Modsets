-- JFD_JapanMeiji_Decisions
-- Author: JFD
--=======================================================================================================================
print("JFD's Japan (Meiji) Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_IsUsingPrestige
--------------------------------------------------------------------------------------------------------------------------
function JFD_IsUsingPrestige()
	local prestigeModID = "d99bf7aa-51ac-4bef-bd88-d765b28e260e"
	local isUsingPrestige = false
	
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == prestigeModID) then
			isUsingPrestige = true
			break
		end
	end

	return isUsingPrestige
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_JAPAN_MEIJI"]
local isUsingPrestige		= JFD_IsUsingPrestige()
local mathCeil				= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- Japan (Meiji): Patronise Zaibatsu Conglomorates
-------------------------------------------------------------------------------------------------------------------------
local policyJapanMeijiZaibatsuID = GameInfoTypes["POLICY_JFD_JAPAN_MEIJI_ZAIBATSU"]
local techIndustrializationID	 = GameInfoTypes["TECH_INDUSTRIALIZATION"]

local Decisions_JapanMeijiZaibatsu = {}
	Decisions_JapanMeijiZaibatsu.Name = "TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ZAIBATSU"
	Decisions_JapanMeijiZaibatsu.Desc = "TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ZAIBATSU_DESC"
	HookDecisionCivilizationIcon(Decisions_JapanMeijiZaibatsu, "CIVILIZATION_JFD_JAPAN_MEIJI")
	Decisions_JapanMeijiZaibatsu.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_JapanMeijiZaibatsu") == true then
			Decisions_JapanMeijiZaibatsu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ZAIBATSU_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(800 * iMod)
		Decisions_JapanMeijiZaibatsu.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ZAIBATSU_DESC", goldCost)
		
		if player:GetNumResourceAvailable(iMagistrate, false) < 1 				then return true, false end
		if player:GetGold() < goldCost 											then return true, false end
		if (not Teams[player:GetTeam()]:IsHasTech(techIndustrializationID)) 	then return true, false	end
		
		return true, true
	end
	)
	
	Decisions_JapanMeijiZaibatsu.DoFunc = (
	function(player)
		local goldCost = mathCeil(800 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -1)
		player:SetNumFreePolicies(1)
		player:SetNumFreePolicies(0)
		player:SetHasPolicy(policyJapanMeijiZaibatsuID, true)
		save(player, "Decisions_JapanMeijiZaibatsu", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_JapanMeijiZaibatsu", Decisions_JapanMeijiZaibatsu)
-------------------------------------------------------------------------------------------------------------------------
-- Japan (Meiji): Abolish the Han System
-------------------------------------------------------------------------------------------------------------------------
local eraIndustrialID 		= GameInfoTypes["ERA_INDUSTRIAL"]
local missionGoldenAgeID 	= GameInfoTypes["MISSION_GOLDEN_AGE"]
local unitDaimyoID 			= GameInfoTypes["UNIT_JFD_DAIMYO"]

local Decisions_JapanMeijiAbolishHanSystem = {}
	Decisions_JapanMeijiAbolishHanSystem.Name = "TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ABOLISH_HAN_SYSTEM"
	Decisions_JapanMeijiAbolishHanSystem.Desc = "TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ABOLISH_HAN_SYSTEM_DESC"
	HookDecisionCivilizationIcon(Decisions_JapanMeijiAbolishHanSystem, "CIVILIZATION_JFD_JAPAN_MEIJI")
	Decisions_JapanMeijiAbolishHanSystem.CanFunc = (
	function(player)
		if player:GetCivilizationType() ~= civilisationID then return false, false end
		if load(player, "Decisions_JapanMeijiAbolishHanSystem") == true then
			Decisions_JapanMeijiAbolishHanSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ABOLISH_HAN_SYSTEM_ENACTED_DESC")
			return false, false, true
		end
		
		local goldCost = mathCeil(350 * iMod)
		if isUsingPrestige then
			local prestigeRequired = mathCeil(500 * iMod)
			Decisions_JapanMeijiAbolishHanSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ABOLISH_HAN_SYSTEM_PRESTIGE_DESC", prestigeRequired, goldCost)
			if JFD_CalculatePrestigeRate(player:GetID()) < prestigeRequired then return true, false end
		else
			Decisions_JapanMeijiAbolishHanSystem.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_JFD_JAPAN_MEIJI_ABOLISH_HAN_SYSTEM_DESC", goldCost)
		end
		
		local numDaimyo = 0
		for unit in player:Units() do
			if unit:GetUnitType() == unitDaimyoID then
				numDaimyo = numDaimyo + 1
				if numDaimyo >= 3 then
					break
				end
			end
		end
		
		if numDaimyo < 3											then return true, false end
		if player:GetCurrentEra() < eraIndustrialID 				then return true, false end
		if player:GetNumResourceAvailable(iMagistrate, false) < 2 	then return true, false end
		if player:GetGold() < goldCost 								then return true, false end
		
		return true, true
	end
	)
	
	Decisions_JapanMeijiAbolishHanSystem.DoFunc = (
	function(player)
		local goldCost = mathCeil(350 * iMod)
		player:ChangeGold(-goldCost)
		player:ChangeNumResourceTotal(iMagistrate, -2)
		for unit in player:Units() do
			if unit:GetUnitType() == unitDaimyoID then
				local hex = ToHexFromGrid(Vector2(unit:GetX(), unit:GetY()))
				Events.GameplayFX(hex.x, hex.y, -1)
				
				local unitPlot = unit:GetPlot()
				for loopPlot in PlotAreaSpiralIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
					if (loopPlot:GetOwner() > -1 and Players[loopPlot:GetOwner()]:IsMinorCiv()) then
						loopPlot:SetOwner(player:GetID())
						loopPlot:SetRevealed(player:GetTeam(), true)
					elseif loopPlot:GetOwner() == -1 then
						loopPlot:SetOwner(player:GetID())
						loopPlot:SetRevealed(player:GetTeam(), true)
					else
						player:ChangeJONSCulture(10 * iMod)
					end
				end
				unit:PushMission(missionGoldenAgeID)
			end
		end
		save(player, "Decisions_JapanMeijiAbolishHanSystem", true)
	end
	)
	
Decisions_AddCivilisationSpecific(civilisationID, "Decisions_JapanMeijiAbolishHanSystem", Decisions_JapanMeijiAbolishHanSystem)
--=======================================================================================================================
--=======================================================================================================================

-- DervishStateDecisions
-- Author: Danmacsch/Damasc/DMS
-- Note : Detect Plunder function by Sukritact from More Civs's Buccaneers mod
-- DateCreated: 03/03/2015
--=======================================================================================================================
print("The Dervish State's Decisions: loaded")
-------------------------------------------------------------------------------------------------------------------------
-- DMS_DervishRushProduction
-------------------------------------------------------------------------------------------------------------------------
function DMS_DervishRushProduction(pPlayer)
	local pCapital = pPlayer:GetCapitalCity()
	local iBoost = (2 * pPlayer:GetNumMilitaryUnits()) * iMod
		if (pCapital:GetProduction() ~= 0) then
			-- Capital is producing something; adding production bonus
			pCapital:ChangeProduction(iBoost)
			--print("trade route plundered -> ChangeProduction(iBoost)")
		else
			-- Capital not producing anything (probably completed this turn); adding production bonus to overflow
			pCapital:SetOverflowProduction(pCapital:GetOverflowProduction() + iBoost)
			--print("trade route plundered -> SetOverflowProduction(iBoost)")
		end	
	local title = "Trade Route pillaged";
	local descr = "Plundering a foreign trade route has rushed the production in " .. pPlayer:GetCapitalCity():GetName() .. " by " .. iBoost .." Hammers.";
	JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", descr, title)
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
--------------------------------------------------------------------------------------------------------------------------
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
-------------------------------------------------------------------------------------------------------------------------
local civilisationID 			= GameInfoTypes["CIVILIZATION_AOI_DERVISH"]
local eraRenaissanceID			= GameInfoTypes["ERA_RENAISSANCE"]
local eraIndustrialID			= GameInfoTypes["ERA_INDUSTRIAL"]
local policyFortifyTalehID		= GameInfoTypes["POLICY_DMS_DERVISH_FORTIFY_TALEH"]
local unitGreatEngineerID		= GameInfoTypes["UNIT_ENGINEER"]
local specialistEngineerID		= GameInfoTypes["SPECIALIST_ENGINEER"]
local yieldProductionID			= GameInfoTypes["YIELD_PRODUCTION"]
local buildingFortifyTalehID	= GameInfoTypes["BUILDING_DMS_DERVISH_FORTIFY_TALEH"]
local unitClassTradeID			= {}
								unitClassTradeID[GameInfoTypes["UNITCLASS_CARGO_SHIP"]] = GameInfoTypes.UNITCLASS_CARGO_SHIP
								unitClassTradeID[GameInfoTypes["UNITCLASS_CARAVAN"]] = GameInfoTypes.UNITCLASS_CARAVAN
-------------------------------------------------------------------------------------------------------------------------
-- Dervish State: Fortify Taleh
-------------------------------------------------------------------------------------------------------------------------
local Decisions_FortifyTaleh = {}
	Decisions_FortifyTaleh.Name = "TXT_KEY_DECISIONS_DMS_DERVISH_FORTIFY_TALEH"
	Decisions_FortifyTaleh.Desc = "TXT_KEY_DECISIONS_DMS_DERVISH_FORTIFY_TALEH_DESC"
	HookDecisionCivilizationIcon(Decisions_FortifyTaleh, "CIVILIZATION_AOI_DERVISH")
	Decisions_FortifyTaleh.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= civilisationID then return false, false end
		if load(pPlayer, "Decisions_FortifyTaleh") == true then
			Decisions_FortifyTaleh.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_DERVISH_FORTIFY_TALEH_ENACTED_DESC")
			return false, false, true 
		end
		-- change the gold cost here as well as in the DoFunc underneath - no need to change anything in GameText.xml
		local iGoldCost = math.ceil(500 * iMod)
		Decisions_FortifyTaleh.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_DERVISH_FORTIFY_TALEH_DESC", iGoldCost)
		-- requirements
		if not(Teams[pPlayer:GetTeam()]:GetAtWarCount(true) > 0) then return true, false end -- this ignores minor civs - let me know if you want it changed
		if not(pPlayer:GetCurrentEra() == eraIndustrialID) then return true, false end
		if (pPlayer:GetGold() < iGoldCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_FortifyTaleh.DoFunc = (
	function(pPlayer)
		local iGoldCost = math.ceil(500 * iMod)
		pPlayer:ChangeGold(-iGoldCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)
		-- adding policy with military buildings production modifier and fort/citadel yield modifier
		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(policyFortifyTalehID, true);
		--print("Decisions, Fortify Taleh, Set policy")
		-- adding Great Engineer at capital
		pPlayer:InitUnit(unitGreatEngineerID, pPlayer:GetCapitalCity():GetX(), pPlayer:GetCapitalCity():GetY());
		--print("Decisions, Fortify Taleh, Placing Great Engineer")
		-- adding dummy building with specialist slot and specialist yield modifier 
		pPlayer:GetCapitalCity():SetNumRealBuilding(buildingFortifyTalehID, 1);
		--print("Decisions, Fortify Taleh, Setting building with specialist slot and modified specialist yield modifier")

		JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DECISIONS_DMS_DERVISH_FORTIFY_TALEH"))		
		save(pPlayer, "Decisions_FortifyTaleh", true)
	end
	)

	Decisions_FortifyTaleh.Monitors = {}
	Decisions_FortifyTaleh.Monitors[GameEvents.CityCaptureComplete] =  (
	function(oldPlayerID, bCapital, iX, iY, newPlayerID, conquest, conquest2)
		if load(pPlayer, "Decisions_FortifyTaleh") == true then
			local oldPlayer = Players[oldPlayerID];
			local newPlayer = Players[newPlayerID];
			local city =  Map.GetPlot(iX, iY):GetPlotCity();
			local numBuilding = city:GetNumBuilding(buildingFortifyTalehID);
			-- If the old player just lost their capital, move the building to their new capital
			if(numBuilding > 0) then
				city:SetNumRealBuilding(buildingFortifyTalehID, 0);
				if(oldPlayer:IsAlive()) then
					oldPlayer:GetCapitalCity():SetNumRealBuilding(buildingFortifyTalehID, 1);
				end
			end
			-- If the new player just recovered their capital, they will need to have their building moved
			if(newPlayer:GetCapitalCity():GetID() == city:GetID()) then
				for cityToRemove in newPlayer:Cities() do
					if(cityToRemove:GetID() ~= city:GetID() and cityToRemove:IsHasBuilding(buildingFortifyTalehID)) then
						-- Add the building to the player's new capital
						city:SetNumRealBuilding(buildingFortifyTalehID, 1);
						-- Remove them from the old capital
						cityToRemove:SetNumRealBuilding(buildingFortifyTalehID, 0);
					end
				end
			end
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_AOI_DERVISH"], "Decisions_FortifyTaleh", Decisions_FortifyTaleh)
-------------------------------------------------------------------------------------------------------------------------
-- Dervish State: Establish Trade Hegemony
-------------------------------------------------------------------------------------------------------------------------
local Decisions_TradeHegemony = {}
	Decisions_TradeHegemony.Name = "TXT_KEY_DECISIONS_DMS_DERVISH_TRADE_HEGEMONY"
	Decisions_TradeHegemony.Desc = "TXT_KEY_DECISIONS_DMS_DERVISH_TRADE_HEGEMONY_DESC"
	HookDecisionCivilizationIcon(Decisions_TradeHegemony, "CIVILIZATION_AOI_DERVISH")
	Decisions_TradeHegemony.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= civilisationID then return false, false end
		if load(pPlayer, "Decisions_TradeHegemony") == true then
			Decisions_TradeHegemony.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_DERVISH_TRADE_HEGEMONY_ENACTED_DESC")
			return false, false, true 
		end
		--local iCultureCost = math.ceil(pPlayer:GetNextPolicyCost() * iMod)
		local iCultureCost = math.ceil(pPlayer:GetTotalJONSCulturePerTurn() * 15 * iMod) -- changed to be dependent on current culture output
		Decisions_TradeHegemony.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_DERVISH_TRADE_HEGEMONY_DESC", iCultureCost)
		-- requirements
		if not(pPlayer:GetCurrentEra() >= eraRenaissanceID) then return true, false end
		if (pPlayer:GetJONSCulture() < iCultureCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		
		return true, true
	end
	)
	
	Decisions_TradeHegemony.DoFunc = (
	function(pPlayer)
		local iCultureCost = math.ceil(pPlayer:GetTotalJONSCulturePerTurn() * 15 * iMod) -- changed to be dependent on current culture output
		pPlayer:ChangeJONSCulture(-iCultureCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		
		JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DECISIONS_DMS_DERVISH_TRADE_HEGEMONY"))	
		save(pPlayer, "Decisions_TradeHegemony", true)
	end
	)

	Decisions_TradeHegemony.Monitors = {} -- test newest function !!
	Decisions_TradeHegemony.Monitors[GameEvents.CanSaveUnit] =  (
	function(playerID, unitID)	
		local iPlayer = Players[playerID] -- owner of killed unit
		local iUnit = iPlayer:GetUnitByID(unitID) -- killed unit 
		local iUnitClass = iUnit:GetUnitClassType() -- killed unit class
				
		if unitClassTradeID[iUnitClass] ~= nil then -- check if killed unit is trade unit
			--print("trade unit killed")
			local iTeam = Teams[iPlayer:GetTeam()] -- probably not necessary
			local pPlot = iUnit:GetPlot() -- the plot on which the trade unit is killed
			local iNumUnits = pPlot:GetNumUnits() -- number of units on the plot where the trade unit is killed
			for iNum = 0,(iNumUnits - 1) do 
				local pUnit = pPlot:GetUnit(iNum) -- the unit that killed the trade unit
				local pPlayer = Players[pUnit:GetOwner()] -- the owner of said unit, i.e. the player
				local pTeam = Teams[pPlayer:GetTeam()]
				if pPlayer and pPlayer:IsEverAlive() and pPlayer:GetCivilizationType() == civilisationID then
					--print("player is correct player")
					if pUnit:GetCombatLimit() > 0 and iTeam:IsAtWar(pTeam) then -- maybe this check is unnecessary(?)
						--print("plundering unit is combat and players are at war")
						if load(pPlayer, "Decisions_TradeHegemony") == true then
							print("Trade Hegemony is enacted -> initializing DMS_DervishRushProduction")
							DMS_DervishRushProduction(pPlayer)
						end
					end
				end
			end
		end
		
		return false
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_AOI_DERVISH"], "Decisions_TradeHegemony", Decisions_TradeHegemony)
--=======================================================================================================================
--=======================================================================================================================
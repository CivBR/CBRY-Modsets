-- JFD_RTP_DarkAges_Functions
-- Author: JFD
-- DateCreated: 4/30/2019 8:35:33 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("JFD_DarkAges_Utils.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_GetRandom		= Game.GetRandom
local g_GetRound		= Game.GetRound
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--==========================================================================================================================
-- ACTIVE MODS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_IsCPActive  = Game.IsCPActive()
local g_IsVMCActive = Game.IsVMCActive()
--==========================================================================================================================
-- GLOBAL DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- INIT FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--JFD_DarkAges_LoadScreenClose
local function JFD_DarkAges_LoadScreenClose()
	local strQuery = {"UPDATE Language_en_US SET Text = 'Prestige' WHERE Text = 'Golden Age Points'", "UPDATE Language_en_US SET Text = 'Prestige' WHERE Text = 'GAP'"}
	for id, query in pairs(strQuery) do
		print ("Changing Golden Age Points Texts: " .. id .. "/" .. #strQuery );
		for result in DB.Query(query) do
		end
	end
	Locale.SetCurrentLanguage( Locale.GetCurrentLanguage().Type )
end
Events.LoadScreenClose.Add(JFD_DarkAges_LoadScreenClose)
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--JFD_DarkAges_PlayerDoTurn
local function JFD_DarkAges_PlayerDoTurn(playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end
	if player:IsBarbarian() then return end
	
	if (not g_IsCPActive) then
		if player:IsAnarchy() then
			local numPrestigeloss = player:GetGoldenAgeProgressMeter()
			if numPrestigeloss > 0 then
				player:ChangeGoldenAgeProgressMeter(-numPrestigeloss)
			
				if player:IsHuman() and player:IsTurnActive() then
					local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
					Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_ALERT_MESSAGE_JFD_GOLDEN_AGE_LOSS_ANARCHY"))
				end
			end
		end
	end
	
	if player:IsGoldenAge() then return end
	
	local numExcessHappiness = player:GetExcessHappiness()
	if (not player:IsHuman()) then
		numExcessHappiness = (numExcessHappiness-5)
	end
	if numExcessHappiness < 0 and (not player:IsDarkAge()) then
		local numPrestige = player:GetGoldenAgeProgressMeter()
		if numPrestige < (numExcessHappiness*-1) then
			print(player:GetName() .. ": Dark Age begins!")
			player:SetIsDarkAge(true)
			LuaEvents.JFD_DarkAgeBegins(playerID, true)
		end
	elseif numExcessHappiness >= 0 or player:IsGoldenAge() then
		if player:IsDarkAge() then
			print(player:GetName() .. ": Dark Age ends!")
			player:SetIsDarkAge(false)
			LuaEvents.JFD_DarkAgeBegins(playerID, false)
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_DarkAges_PlayerDoTurn)
----------------------------------------------------------------------------------------------------------------------------
--JFD_DarkAges_PlayerAnarchy
local function JFD_DarkAges_PlayerAnarchy(playerID, isStart, numTurns)
	local player = Players[oldOwnerID]
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	if (not isStart) then return end
	
	local numPrestigeloss = player:GetGoldenAgeProgressMeter()
	if numPrestigeloss > 0 then
		player:ChangeGoldenAgeProgressMeter(-numPrestigeloss)
	
		if player:IsHuman() and player:IsTurnActive() then
			local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
			Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_ALERT_MESSAGE_JFD_GOLDEN_AGE_LOSS_ANARCHY"))
		end
	end
end
GameEvents.PlayerAnarchy.Add(JFD_DarkAges_PlayerAnarchy)
----------------------------------------------------------------------------------------------------------------------------
--JFD_DarkAges_CityCaptureComplete
local function JFD_DarkAges_CityCaptureComplete(oldOwnerID, isCapital, plotX, plotY, newOwnerID)
	local player = Players[oldOwnerID]
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	
	if (not player:IsGoldenAge()) then 

		local numPrestigeloss = 0
		
		if isCapital then
			numPrestigeloss = (player:GetExcessHappiness()*5)
		else
			numPrestigeloss = (player:GetExcessHappiness()*4)
		end
		if numPrestigeloss < 0 then 
			numPrestigeloss = (numPrestigeloss*-1)
		end

		if numPrestigeloss > 0 then
			player:ChangeGoldenAgeProgressMeter(-numPrestigeloss)
	
			if player:IsHuman() and player:IsTurnActive() then
				local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
				Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_ALERT_MESSAGE_JFD_PRESTIGE_LOSS_CONQUEST", city:GetName(), numPrestigeloss))
			end
		end
		
	else
		local numGATurns = 0
		if isCapital then
			numGATurns = player:GetGoldenAgeTurns()
		
			if player:IsHuman() and player:IsTurnActive() then
				local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
				Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_ALERT_MESSAGE_JFD_GOLDEN_AGE_LOSS_CONQUEST", city:GetName(), numPrestigeloss))
			end
		else
			numGATurns = g_GetRound(player:GetGoldenAgeTurns()/2)
		
			if player:IsHuman() and player:IsTurnActive() then
				local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
				Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_ALERT_MESSAGE_JFD_GOLDEN_AGE_TURN_LOSS_CONQUEST", city:GetName(), numPrestigeloss))
			end
		end
		player:ChangeGoldenAgeTurns(-numGATurns)
	end
end
GameEvents.CityCaptureComplete.Add(JFD_DarkAges_CityCaptureComplete)
----------------------------------------------------------------------------------------------------------------------------
--JFD_DarkAges_SetPopulation
local function JFD_DarkAges_SetPopulation(plotX, plotY, oldPopulation, newPopulation)
	if oldPopulation <= 0 then return end
	if oldPopulation <= newPopulation then return end
	local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
	if (not city) then return end
	local playerID = city:GetOwner()
	local player = Players[playerID]
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	if player:IsGoldenAge() then return end

	local numPrestigeloss = (player:GetExcessHappiness()*3)
	if numPrestigeloss < 0 then 
		numPrestigeloss = (numPrestigeloss*-1)
	end
	if numPrestigeloss > 0 then
		player:ChangeGoldenAgeProgressMeter(-numPrestigeloss)

		if player:IsHuman() and player:IsTurnActive() then
			local city = g_MapGetPlot(plotX, plotY):GetPlotCity()
			Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_ALERT_MESSAGE_JFD_PRESTIGE_LOSS_POPULATION", city:GetName(), numPrestigeloss))
		end
	end
end
GameEvents.SetPopulation.Add(JFD_DarkAges_SetPopulation)
----------------------------------------------------------------------------------------------------------------------------
--JFD_DarkAges_UnitKilledInCombat
local function JFD_DarkAges_UnitKilledInCombat(killingPlayerID, unitOwnerID, unitTypeID)
	local player = Players[unitOwnerID]
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	if player:IsGoldenAge() then return end
	
	local numPrestigeloss = (player:GetExcessHappiness()*2)
	if numPrestigeloss < 0 then 
		numPrestigeloss = (numPrestigeloss*-1)
	end
	if numPrestigeloss > 0 then
		player:ChangeGoldenAgeProgressMeter(-numPrestigeloss)

		if player:IsHuman() and player:IsTurnActive() then
			local unit = GameInfo.Units[unitTypeID]
			Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_ALERT_MESSAGE_JFD_PRESTIGE_LOSS_UNIT", unit.Description, numPrestigeloss))
		end
	end
end
GameEvents.UnitKilledInCombat.Add(JFD_DarkAges_UnitKilledInCombat)
----------------------------------------------------------------------------------------------------------------------------
--JFD_DarkAges_UnitKilledInCombat
local function JFD_DarkAges_UnitKilledInCombat(plotX, plotY, playerID, oldImprovementID, newImprovementID, isPillaged)
	if (not isPillaged) then return end
	local player = Players[unitOwnerID]
	if player:IsBarbarian() then return end
	if player:IsMinorCiv() then return end
	if player:IsGoldenAge() then return end
	
	local numPrestigeloss = (player:GetExcessHappiness()*1)
	if numPrestigeloss < 0 then 
		numPrestigeloss = (numPrestigeloss*-1)
	end
	if numPrestigeloss > 0 then
		player:ChangeGoldenAgeProgressMeter(-numPrestigeloss)

		if player:IsHuman() and player:IsTurnActive() then
			local improvement = GameInfo.Improvements[oldImprovementID]
			Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_ALERT_MESSAGE_JFD_PRESTIGE_LOSS_PILLAGE", improvement.Description, numPrestigeloss))
		end
	end
end
GameEvents.TileImprovementChanged.Add(JFD_DarkAges_TileImprovementChanged)
----------------------------------------------------------------------------------------------------------------------------
--JFD_DarkAges_PlayerGoldenAge
local function JFD_DarkAges_PlayerGoldenAge(playerID, isStart, turns)
	local player = Players[playerID]
	if player:IsHuman() then return end
	if isStart then
		if player:IsDarkAge() then
			player:SetIsDarkAge(false)
		end
		player:SendWorldEvent(g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_GOLDEN_AGE", player:GetCivilizationShortDescriptionKey()))
	end
end
GameEvents.PlayerGoldenAge.Add(JFD_DarkAges_PlayerGoldenAge)
--==========================================================================================================================
--==========================================================================================================================
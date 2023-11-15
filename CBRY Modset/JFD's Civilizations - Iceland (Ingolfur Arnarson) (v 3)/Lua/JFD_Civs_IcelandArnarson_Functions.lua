-- JFD_Civs_IcelandArnarson_Functions
-- Author: JFD
-- DateCreated: 2/15/2014 6:33:36 PM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("PlotIterators.lua")
--=======================================================================================================================
-- GLOBALS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- CORE UTILITIES
------------------------------------------------------------------------------------------------------------------------
--HasTrait
function HasTrait(player, traitID)
	if Player.HasTrait then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
------------------------------------------------------------------------------------------------------------------------
-- MOD UTILITIES
------------------------------------------------------------------------------------------------------------------------
--Game_IsCPActive
function Game_IsCPActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsCPActive = (Game_IsCPActive() and Player.HasStateReligion)
------------------------------------------------------------------------------------------------------------------------
--Game_IsVMCActive
function Game_IsVMCActive()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local g_IsVMCActive = Game_IsVMCActive()
--=======================================================================================================================
-- GAME DEFINES
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]

local gameSpeedID = Game.GetGameSpeedType()
local gameSpeed = GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedMod = ((gameSpeed.BuildPercent)/100)
--=======================================================================================================================
-- UNIQUE FUNCTIONS
--=======================================================================================================================
------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
------------------------------------------------------------------------------------------------------------------------
local buildingMonumentID = GameInfoTypes["BUILDING_MONUMENT"]
local buildingThingsteadID = GameInfoTypes["BUILDING_JFD_THINGSTEAD"]
local buildingWritersGuildID = GameInfoTypes["BUILDING_WRITERS_GUILD"]

local specialistWriterID = GameInfoTypes["SPECIALIST_WRITER"]

local traitIcelandArnarsonID = GameInfoTypes["TRAIT_JFD_ICELAND_ARNARSON"]

local unitSkaldID = GameInfoTypes["UNIT_JFD_SKALD"]
------------------------------------------------------------------------------------------------------------------------
-- FUNCTIONS
------------------------------------------------------------------------------------------------------------------------
--JFD_IcelandArnarson_PlayerDoTurn
local buildingDummyThingsteadID = GameInfoTypes["BUILDING_DUMMY_JFD_THINGSTEAD"]
local promotionSkaldID = GameInfoTypes["PROMOTION_JFD_SKALD"]
local unitClassWriterID = GameInfoTypes["UNITCLASS_WRITER"]
local function JFD_IcelandArnarson_PlayerDoTurn(playerID)
	local player = Players[playerID]
	local playerTeamID = player:GetTeam()
	if (not player:IsAlive()) then return end
	if player:IsMinorCiv() then return end

	--UNIQUE BUILDING
	for city in player:Cities() do
		if city:IsHasBuilding(buildingThingsteadID) and (player:IsCapitalConnectedToCity(city) or city:IsCapital()) then
			if (not city:IsHasBuilding(buildingDummyThingsteadID)) then
				city:SetNumRealBuilding(buildingDummyThingsteadID, 1)
			end
		else
			if city:IsHasBuilding(buildingDummyThingsteadID) then
				city:SetNumRealBuilding(buildingDummyThingsteadID, 0)
			end
		end
	end

	--UNIQUE UNIT
	if player:HasUnitOfClassType(unitClassWriterID) then
		for unit in player:Units() do
			if unit:IsHasPromotion(promotionSkaldID) then
				if unit:IsEmbarked() then
					local numMoves = g_MathFloor(unit:GetMoves())
		            unit:ChangeMoves(numMoves)
		        end
		    end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_IcelandArnarson_PlayerDoTurn)
------------------------------------------------------------------------------------------------------------------------
--JFD_IcelandArnarson_PlayerCityFounded
local function JFD_IcelandArnarson_PlayerCityFounded(playerID, plotX, plotY)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UNIQUE TRAIT
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
		
	if HasTrait(player, traitIcelandArnarsonID) then
		local plot = g_MapGetPlot(plotX, plotY)
		local city = plot:GetPlotCity()
		if (not city:IsCapital()) then
			local capitalPlot = g_MapGetPlot(playerCapital:GetX(), playerCapital:GetY())
			if plot:GetArea() ~= capitalPlot:GetArea() then
				city:ChangePopulation(1, true)
				city:SetNumRealBuilding(buildingMonumentID, 1)
			end

			local numGWP = player:GetTotalJONSCulturePerTurn()
			playerCapital:ChangeSpecialistGreatPersonProgressTimes100(specialistWriterID, (numGWP*100))
			
			if (player:IsHuman() and player:IsTurnActive()) then
				local plot = g_MapGetPlot(plotX, plotY)
				local city = plot:GetPlotCity()
				Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_ICELAND_ARNARSON_MESSAGE_2", city:GetName()))
			end
		end
	end
end
GameEvents.PlayerCityFounded.Add(JFD_IcelandArnarson_PlayerCityFounded)
------------------------------------------------------------------------------------------------------------------------
--JFD_IcelandArnarson_TeamMeet
local function JFD_IcelandArnarson_TeamMeet(playerMetID, playerID)
	local player = Players[playerID]
	if (not player:IsAlive()) then return end
	
	--UNIQUE TRAIT
	local playerCapital = player:GetCapitalCity()
	if (not playerCapital) then return end
		
	if HasTrait(player, traitIcelandArnarsonID) then	
		local numGWP = 20
		local playerMet = Players[playerMetID]
		if playerMet:IsMinorCiv() then
			numGWP = (numGWP/2)
		end	
		numGWP = (numGWP*gameSpeedMod)
		playerCapital:ChangeSpecialistGreatPersonProgressTimes100(specialistWriterID, (numGWP*100))
		
		if (player:IsHuman() and player:IsTurnActive()) then
			Events.GameplayAlertMessage(g_ConvertTextKey("TXT_KEY_TRAIT_JFD_ICELAND_ARNARSON_MESSAGE_1", playerMet:GetCivilizationDescription()))
        end
	end
end
GameEvents.TeamMeet.Add(JFD_IcelandArnarson_TeamMeet)	
------------------------------------------------------------------------------------------------------------------------
--JFD_IcelandArnarson_UnitPrekill
local function JFD_IcelandArnarson_UnitPrekill(unitOwnerID, unitID, unitTypeID, plotX, plotY, isDelay, playerID)
	local player = Players[unitOwnerID]
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	if (not player:IsAlive()) then return end
	if isDelay then return end
	if playerID ~= -1 then return end
	
	--UNIQUE UNIT
	if unitTypeID ~= unitSkaldID then return end
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	if city then
		city:ChangePopulation(1, true)
		city:SetNumRealBuilding(buildingMonumentID, 1)
	end
end
if (not g_IsVMCActive) then
	GameEvents.UnitPrekill.Add(JFD_IcelandArnarson_UnitPrekill)
end
------------------------------------------------------------------------------------------------------------------------
--JFD_IcelandArnarson_UnitCityFounded
local function JFD_IcelandArnarson_UnitCityFounded(playerID, unitID, unitTypeID, plotX, plotY)
	local player = Players[playerID]
	local team = Teams[player:GetTeam()]
	local teamTechs = team:GetTeamTechs()
	if (not player:IsAlive()) then return end
	
	--UNIQUE UNIT
	if unitTypeID ~= unitSkaldID then return end
	local plot = g_MapGetPlot(plotX, plotY)
	local city = plot:GetPlotCity()
	city:ChangePopulation(1, true)
	city:SetNumRealBuilding(buildingMonumentID, 1)
end
if g_IsVMCActive then
	GameEvents.UnitCityFounded.Add(JFD_IcelandArnarson_UnitCityFounded)
end
--=======================================================================================================================
--=======================================================================================================================
-- JFD_CarthageDido_Functions
-- Author: JFD
-- DateCreated: 12/4/2015 12:11:31 PM
--==========================================================================================================================
-- Includes
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------
-- JFD_IsCivilisationActive
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end
	return false
end

-- JFD_GetRandom
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end

-- Sukritact_PlaceResource
local featureAtollID = GameInfoTypes["FEATURE_ATOLL"]
local featureIceID = GameInfoTypes["FEATURE_ICE"]
local resourceShellFishID = GameInfoTypes["RESOURCE_JFD_SHELLFISH"]
local terrainCoastID = GameInfoTypes["TERRAIN_COAST"]
local terrainOceanID = GameInfoTypes["TERRAIN_OCEAN"]
function Sukritact_PlaceResource(pCity)
    local cityPlot = pCity:Plot()
    local plots = {}
    for loopPlot in PlotAreaSweepIterator(cityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
        table.insert(plots, loopPlot)
    end
    for iVal = 1, 1 do
		local isPlaced = false
		while (not(isPlaced)) and #plots > 0 do
			local randomNumber = JFD_GetRandom(1, #plots)
			local plot = plots[randomNumber]
			if (plot:GetTerrainType() == terrainCoastID and (plot:GetFeatureType() ~= featureAtollID and plot:GetFeatureType() ~= featureIceID) and not (plot:IsLake()) and (plot:GetResourceType() == -1)) then
				plot:SetResourceType(resourceShellFishID, 1)
				isPlaced = true
			end
			table.remove(plots, randomNumber)
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------
-- USER SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingCarthageDidoUA = JFD_GetUserSetting("JFD_CIVILIZATIONS_CARTHAGE_UA") == 1
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationID 			= GameInfoTypes["CIVILIZATION_CARTHAGE"]
local isCarthageDidoCivActive	= JFD_IsCivilisationActive(civilizationID)
local mathCeil 					= math.ceil
local mathFloor 				= math.floor
if isCarthageDidoCivActive then
	print("Queen Dido is in this game")
end
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- PHOENICIAN HERITAGE
-------------------------------------------------------------------------------------------------------------------------
-- JFD_CarthageDido_Init
local policyCarthageDidoID = GameInfoTypes["POLICY_JFD_DIDO_CARTHAGE"]
function JFD_CarthageDido_Init(player)
	for playerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
		local player = Players[playerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
			if (not player:HasPolicy(policyCarthageDidoID)) then
				player:SetNumFreePolicies(1)
				player:SetNumFreePolicies(0)
				player:SetHasPolicy(policyCarthageDidoID, true)
			end
		end
	end
end
if (isCarthageDidoCivActive and userSettingCarthageDidoUA) then 
	Events.SequenceGameInitComplete.Add(JFD_CarthageDido_Init) 
end

-- JFD_CarthageDido_Shellfish
function JFD_CarthageDido_Shellfish(playerID, plotX, plotY)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local plot = Map.GetPlot( plotX, plotY)
		local city = plot:GetPlotCity()
		for adjacentPlot in PlotAreaSweepIterator(plot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			if (adjacentPlot:GetOwner() == -1 and (adjacentPlot:GetTerrainType() == terrainCoastID or adjacentPlot:GetTerrainType() == terrainOceanID))  then
				adjacentPlot:SetOwner(playerID, city:GetID(), true, true)
				adjacentPlot:SetRevealed(player:GetTeam(), true)
			end
		end
		Sukritact_PlaceResource(city)
	end 	
end
if (isCarthageDidoCivActive and userSettingCarthageDidoUA) then 
	GameEvents.PlayerCityFounded.Add(JFD_CarthageDido_Shellfish)
end
----------------------------------------------------------------------------------------------------------------------------
-- COTHON
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_CarthageDido_Cothon
local buildingCothonID = GameInfoTypes["BUILDING_JFD_COTHON"]
local buildingDidoCarthageID = GameInfoTypes["BUILDING_JFD_DIDO_CARTHAGE"]
local unitCombatNavalMeleeID = GameInfoTypes["UNITCOMBAT_NAVALMELEE"]
local unitCombatNavalRangedID = GameInfoTypes["UNITCOMBAT_NAVALRANGED"]
function JFD_CarthageDido_Cothon(playerID)
	local playerID = playerID
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then
		local navalUnit
		for city in player:Cities() do
			if city:IsHasBuilding(buildingCothonID) then
				local plot = city:Plot()
				for value = 0, plot:GetNumUnits() - 1, 1 do
					local plotUnit = plot:GetUnit(value)
					if plotUnit then
						local unitCombatType = plotUnit:GetUnitCombatType()
						if (unitCombatType == unitCombatNavalMeleeID or unitCombatType == unitCombatNavalRangedID) then
							navalUnit = plot:GetUnit(value)
							break
						end
					end
				end
				if navalUnit then
					local unitStrength = ((navalUnit:GetBaseCombatStrength()*25)/100)
					city:SetNumRealBuilding(buildingDidoCarthageID, unitStrength)
				else
					if city:IsHasBuilding(buildingDidoCarthageID) then
						city:SetNumRealBuilding(buildingDidoCarthageID, 0)
					end
				end
			else
				if city:IsHasBuilding(buildingDidoCarthageID) then
					city:SetNumRealBuilding(buildingDidoCarthageID, 0)
				end
			end
		end
	end
end
if isCarthageDidoCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_CarthageDido_Cothon) 
end
----------------------------------------------------------------------------------------------------------------------------
-- QUINQUEREME
----------------------------------------------------------------------------------------------------------------------------
-- JFD_CarthageDido_Quinquereme
local unitPromotionQuinqueremeID = GameInfoTypes["PROMOTION_JFD_QUINQUEREME"]
function JFD_CarthageDido_Quinquereme(playerID)
	local player = Players[playerID]
	for unit in player:Units() do
		if unit:IsHasPromotion(unitPromotionQuinqueremeID) then
			local plot = Map.GetPlot(unit:GetX(), unit:GetY()) 
			local baseCombatStrength = GameInfo.Units[unit:GetUnitType()].Combat
			if plot:IsFriendlyTerritory() then
				local strengthIncrease = (baseCombatStrength*20)/100
				baseCombatStrength = (baseCombatStrength+strengthIncrease)
				unit:SetBaseCombatStrength(baseCombatStrength)
			else
				unit:SetBaseCombatStrength(baseCombatStrength)
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_CarthageDido_Quinquereme) 
--==========================================================================================================================
--==========================================================================================================================
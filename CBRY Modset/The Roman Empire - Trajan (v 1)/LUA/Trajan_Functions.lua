--------------------------------------------------------------
-- Defines
--------------------------------------------------------------
include("PlotIterators")
local pTrajan = GameInfoTypes["CIVILIZATION_US_ROME_TRAJAN"]

--------------------------------------------------------------
-- Utilities
--------------------------------------------------------------
function IsCivilizationActive(civilizationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilizationID then
				return true
			end
		end
	end
	return false
end

-- I got this function from AW's PlotOwner_Functions, which in turn got it from Bobert13
function GetFarthestCity(pPlayer, pPlot, index)
	if (index == nil) then index = 1 end
	local tDistances = {}
	for pCity in pPlayer:Cities() do
		local cityID = pCity:GetID()
		local iDist = Map.PlotDistance(pCity:GetX(), pCity:GetY(), pPlot:GetX(), pPlot:GetY())
		table.insert(tDistances, {cityID, iDist})
	end
	table.sort(tDistances, function(a, b) return a[2] > b[2] end)
	--[[
	for i = 1, #tDistances, 1 do
		print(string.format("index %d: {cityID %d, distance %f}", i, tDistances[i][1], tDistances[i][2]))
	end
	--]]
	local city = pPlayer:GetCityByID(tDistances[index][1])
	return city
end

--------------------------------------------------------------
-- UB: Column
--------------------------------------------------------------

local bColumn = GameInfoTypes["BUILDING_US_COLUMN"]
local bHappinessDummy = GameInfoTypes["BUILDING_URD_HAPPYTRAJAN"]	-- SET Happiness = 1

-- This is derived from some of Tar's code for the Rashidun UA
function Tar_ColumnProduction(ownerID, cityID, buildingType)
	local player = Players[ownerID]
	if player:GetCivilizationType() == pTrajan then
		if buildingType == bColumn then
			local numExist = player:CountNumBuildings(bColumn)
			local city = player:GetCityByID(cityID)
			if numExist > city:GetBuildingProduction(buildingType) then
				city:SetBuildingProduction(buildingType, numExist)
			end
		end
	end
	return true
end

function GainHappinessDummy(tFromID, tToID)
	local pFromID = Teams[tFromID]:GetLeaderID()
	local pToID = Teams[tToID]:GetLeaderID()
	local pFromPlayer = Players[pFromID]
	local pToPlayer = Players[pToID]
	if pFromPlayer:GetCivilizationType() == pTrajan then
		if pFromPlayer:CountNumBuildings(bColumn) > 0 then
			if pFromPlayer:CountNumBuildings(bHappinessDummy) < 1 then
				for cCity in pFromPlayer:Cities() do
					if cCity:IsHasBuilding(bColumn) then
						cCity:SetNumRealBuilding(bHappinessDummy, 1)
					end
				end
			end
		end
	end
	-- I don't use elseif in case there are two Trajans at war w/ each other
	if pToPlayer:GetCivilizationType() == pTrajan then
		if pToPlayer:CountNumBuildings(bColumn) > 0 then
			if pToPlayer:CountNumBuildings(bHappinessDummy) < 1 then
				for cCity in pToPlayer:Cities() do
					if cCity:IsHasBuilding(bColumn) then
						cCity:SetNumRealBuilding(bHappinessDummy, 1)
					end
				end
			end
		end
	end
end

function LoseHappinessDummy(tFromID, tToID)
	local tFrom = Teams[tFromID]
	local tTo = Teams[tToID]
	local pFromPlayer = Players[tFrom:GetLeaderID()]
	local pToPlayer = Players[tTo:GetLeaderID()]
	if pFromPlayer:GetCivilizationType() == pTrajan then
		if tFrom:GetAtWarCount(false) == 0 then
			if pFromPlayer:CountNumBuildings(bColumn) > 0 then
				for cCity in pFromPlayer:Cities() do
					cCity:SetNumRealBuilding(bHappinessDummy, 0)
				end
			end
		end
	end
	if pToPlayer:GetCivilizationType() == pTrajan then
		if tTo:GetAtWarCount(false) == 0 then
			if pToPlayer:CountNumBuildings(bColumn) > 0 then
				for cCity in pToPlayer:Cities() do
					cCity:SetNumRealBuilding(bHappinessDummy, 0)
				end
			end

		end
	end
end

if IsCivilizationActive(pTrajan) then
	GameEvents.CityCanConstruct.Add(Tar_ColumnProduction)
	GameEvents.DeclareWar.Add(GainHappinessDummy)
	GameEvents.MakePeace.Add(LoseHappinessDummy)
end

--------------------------------------------------------------
-- UU: Singularis
--------------------------------------------------------------

local uSingularis = GameInfoTypes["UNIT_US_SINGULARES"]
local pNearBarbs = GameInfoTypes["PROMOTION_US_SINGULARES"]	-- SET MovesChange = 1, CombatPercent = 15
local iBarb = GameInfoTypes["IMPROVEMENT_BARBARIAN_CAMP"]

function CheckFarthestCity(fPlayer)
	local fPlot = fPlayer:GetCapitalCity():Plot()
	return GetFarthestCity(fPlayer, fPlot, 1)
end

-- Thanks to the UA of Tar's HRE for demonstrating how to trigger an event on disbanding
function MoveSingularis(playerID, unitID)
	local pPlayer = Players[playerID]
	local uUnit = pPlayer:GetUnitByID(unitID)
	if uUnit:GetUnitType() == uSingularis then
		local cCap = pPlayer:GetCapitalCity()
		local capPlot = cCap:Plot()
		local uPlot = uUnit:GetPlot()
		if uPlot == capPlot then
			local farthestCity = CheckFarthestCity(pPlayer)
			local spawnX = farthestCity:GetX()
			local spawnY = farthestCity:GetY()
			pPlayer:InitUnit(uSingularis, spawnX, spawnY)
			-- this upcoming section moves the stacked civilians
			local iNumUnits = capPlot:GetNumUnits()
			for iVal = 0,(iNumUnits - 1) do
				local uMoveMe = capPlot:GetUnit(iVal)
				if not uMoveMe:IsCombatUnit() then
					local uMoveMeType = uMoveMe:GetUnitType()
					uMoveMe:Kill(false)
					pPlayer:InitUnit(uMoveMeType, spawnX, spawnY)
				end
			end
		end
	end
end

-- function NearBarbarianCheck(playerID, unitID, plotX, plotY)
-- 	local pPlayer = Players[playerID]
-- 	local uUnit = pPlayer:GetUnitByID(unitID)
-- 	if uUnit:GetUnitType() == uSingularis then
-- 		local barbAdjacency = false
-- 		local pStartPlot = uUnit:GetPlot()
-- 		for pCheckedPlot in PlotAreaSweepIterator(pStartPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
-- 			if pCheckedPlot:GetImprovementType() == iBarb then
-- 				barbAdjacency = true
-- 				break
-- 			end
-- 		end
-- 		if barbAdjacency then
-- 			uUnit:SetHasPromotion(pNearBarbs, true)
-- 		else
-- 			uUnit:SetHasPromotion(pNearBarbs, false)
-- 		end
-- 	end
-- end

function DepromoteOnUpgrade(playerID, unitID, newUnitID)
	local pPlayer = Players[playerID]
	local uUnit = pPlayer:GetUnitByID(newUnitID)
	if uUnit:IsHasPromotion(pNearBarbs) then
		uUnit:SetHasPromotion(pNearBarbs, false)
	end
	if uUnit:GetUnitType() == uSingularis then
		local iX = uUnit:GetX()
		local iY = uUnit:GetY()
		NearBarbarianCheck(playerID, unitID, iX, iY)
	end
end

if IsCivilizationActive(pTrajan) then
	GameEvents.CanSaveUnit.Add(MoveSingularis)
	GameEvents.UnitSetXY.Add(NearBarbarianCheck)
	GameEvents.UnitUpgraded.Add(DepromoteOnUpgrade)
end

--------------------------------------------------------------
-- UA: All Roads Lead to Rome
--------------------------------------------------------------

local bOwnershipDummy = GameInfoTypes["BUILDING_US_TRAJAN_OWNERSHIP"]	-- SET CaptureChance = 100, NeverCapture = 0

function RushOnCityFound(playerID, iX, iY)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == pTrajan then
		local iNumCities = pPlayer:GetNumCities()
		local cCap = pPlayer:GetCapitalCity()
		local iRush = (15 * iNumCities)
		cCap:ChangeProduction(iRush)
		-- this next bit is so you don't get production from recapturing your own cities
		local cNewCity = Map.GetPlot(iX, iY):GetPlotCity()
		cNewCity:SetNumRealBuilding(bOwnershipDummy, 1)
	end
end

function RushOnCityCapture(oldOwnerID, bCapital, iX, iY, cityID)
	local cCity = Map.GetPlot(iX, iY):GetPlotCity()
	local pPlayer = Players[cCity:GetOwner()]
	if pPlayer:GetCivilizationType() == pTrajan then
		if not cCity:IsHasBuilding(bOwnershipDummy) then
			local iNumCities = pPlayer:GetNumCities()
			local cCap = pPlayer:GetCapitalCity()
			local iRush = (15 * iNumCities)
			cCap:ChangeProduction(iRush)
			cCity:SetNumRealBuilding(bOwnershipDummy, 1)
		end
	end
end

local iXpBuilding = GameInfoTypes["BUILDING_ER_TRAJANUADUMMY"]	-- Building_DomainFreeExperiences, SET Experience = 1 for each domain

-- thank u emeralad
function ER_TrajanUAXP(playerID)
    local pPlayer = Players[playerID]
    if pPlayer and pPlayer:IsAlive() and pPlayer:GetCivilizationType() == pTrajan then --Trajan civ defines
        local pCapital = pPlayer:GetCapitalCity()
        if pCapital then
            local iNumBuildings = pCapital:GetNumBuildings()
            for pCity in pPlayer:Cities() do
                pCity:SetNumRealBuilding(iXpBuilding, iNumBuildings)
            end
        end
    end
end

if IsCivilizationActive(pTrajan) then
	GameEvents.PlayerCityFounded.Add(RushOnCityFound)
	GameEvents.CityCaptureComplete.Add(RushOnCityCapture)
	GameEvents.PlayerDoTurn.Add(ER_TrajanUAXP)
end

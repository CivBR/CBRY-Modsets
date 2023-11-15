-- Authors: TopHatPaladin, Lordie Staven, Coiot, ExplosiveWatermelon
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------

local activePlayerID = Game.GetActivePlayer()
local activePlayer = Players[activePlayerID]

function JFD_IsCivilisationActive(iCiv)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == iCiv then
				return true
			end
		end
	end

	return false
end

include("FLuaVector")

local iCiv = GameInfoTypes["CIVILIZATION_GR_OSAGE"]
local isGraggOsageCivActive = JFD_IsCivilisationActive(iCiv)

local prodDummy = GameInfoTypes["BUILDING_OSAGE_PROD_DUMMY"]
local culDummy = GameInfoTypes["BUILDING_OSAGE_CULTURE_DUMMY"]
local iGADummy = GameInfoTypes["BUILDING_GR_OSAGE_GA_MARKER"]

local debuff1 = GameInfoTypes["PROMOTION_OSAGE_ODON_DEBUFF_I"]
local debuff2 = GameInfoTypes["PROMOTION_OSAGE_ODON_DEBUFF_II"]
local debuff3 = GameInfoTypes["PROMOTION_OSAGE_ODON_DEBUFF_III"]
local debuff4 = GameInfoTypes["PROMOTION_OSAGE_ODON_DEBUFF_IV"]
local debuff5 = GameInfoTypes["PROMOTION_OSAGE_ODON_DEBUFF_V"]
local debuff6 = GameInfoTypes["PROMOTION_OSAGE_ODON_DEBUFF_VI"]

include("PlotIterators.lua")
include("GoldenAgeLuaEvent.lua")

--------------------------------------------------------------
-- Notes:
-- UU1 (Strength of the Spider): (1) During GA, can train without Strategic Resources and those trained cause Enemy Units within 2 tiles receive a Debuff. (2) Spawns the latest discovered Strategic Resource near the newest City.
-- UU2 (Mineral Council): +33% hammers during GA (lol workarounds)
-- UU3 (O-don): Units within 2 tiles receive a stacking 8% debuff up to 24%

--------------------------------------------------------------
-- UA_Train_Without_Resources_Plus_Debuff
--------------------------------------------------------------

local tGraggUnits = {}
local iTableIncrement = 1
for row in DB.Query("SELECT UnitType FROM Unit_ResourceQuantityRequirements") do
    tGraggUnits[iTableIncrement] = {Base=GameInfoTypes[row.UnitType], Altered=GameInfoTypes["UNIT_GR_OSAGE_" .. row.UnitType]}
    iTableIncrement = iTableIncrement + 1
end

function CanTrainOsageGAUnits(playerID, cityID, unitType)
	local pPlayer = Players[playerID]
	local pCity = pPlayer:GetCityByID(cityID)
	local bIsOsage = (pPlayer:GetCivilizationType() == iCiv)
	for k, v in ipairs(tGraggUnits) do
		if unitType == v.Base then
			if bIsOsage then
				return (not pCity:IsHasBuilding(iGADummy))
			else return true end
		elseif unitType == v.Altered then
			if bIsOsage then
				if not pPlayer:CanTrain(v.Base, true, true, true, false) then
					return false
				end
				return (pCity:IsHasBuilding(iGADummy))
			else return false end
		end
	end
	return true
end
GameEvents.CityCanTrain.Add(CanTrainOsageGAUnits)

function IsDummyUnitType(iUnitType)
	for k, v in ipairs(tGraggUnits) do
		if v.Altered == iUnitType then
			return true
		end
	end
	return false
end

local tOsage_Units = {}
for row in DB.Query("SELECT * FROM Units WHERE Type IN (SELECT UnitType FROM Unit_ResourceQuantityRequirements WHERE NOT EXISTS (SELECT UnitType FROM Civilization_UnitClassOverrides WHERE Civilization_UnitClassOverrides.UnitType = Units.Type))") do
    tOsage_Units[row.ID] = GameInfoTypes["UNIT_GR_OSAGE_" .. row.Type] or nil
end

local tDebuffs = {debuff1, debuff2, debuff3, debuff4, debuff5, debuff6}

function GAUnitsDebuff(playerID, UnitType)
	local pPlayer = Players[playerID]
	if pPlayer:IsAlive() then
	  for pUnit in pPlayer:Units() do
	    -- clean out old promotions
	    for k, v in ipairs(tDebuffs) do
	        pUnit:SetHasPromotion(v, false)
	    end

      -- check for nearby GA Units
      local iNumGAUnits = 0
			local unitPlot = pUnit:GetPlot()
    	for pAdjPlot in PlotAreaSpiralIterator(unitPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
      	local pAdjUnit = pAdjPlot:GetUnit(0)
        for k, v in pairs(tOsage_Units) do
				  if pAdjUnit and pAdjUnit:GetUnitType() == v then
						if pAdjUnit:GetOwner() ~= playerID then
						  iNumGAUnits = iNumGAUnits + 1
						  if iNumGAUnits >= 6 then break end
						end
        	end
				end
      end
      -- give the appropriate number of debuffs
      if iNumGAUnits > 0 then
          for i = 1, iNumGAUnits, 1 do
              pUnit:SetHasPromotion(tDebuffs[i], true)
          end
      end
	  end
	end
end
GameEvents.PlayerDoTurn.Add(GAUnitsDebuff)

function Osage_BuildingsOnGoldenAge(playerID, iTurns, bIsNew)
	if bIsNew then
		local pPlayer = Players[playerID]
		if pPlayer:GetCivilizationType() == iCiv then
			for pCity in pPlayer:Cities() do
				pCity:SetNumRealBuilding(iGADummy, 1)
			end
		end
	end
end
LuaEvents.THP_GoldenAgeBegins.Add(Osage_BuildingsOnGoldenAge)

function Osage_ClearOldGABuildings(playerID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		if (pPlayer:GetGoldenAgeTurns() == 0) and (pPlayer:CountNumBuildings(iGADummy) > 0) then
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(iGADummy) then
					local bShouldKeep = false
					local iUnitInProgress = pCity:GetProductionUnit()
					if iUnitInProgress then
						bShouldKeep = IsDummyUnitType(iUnitInProgress)
					end
					if not bShouldKeep then
						pCity:SetNumRealBuilding(iGADummy, 0)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(Osage_ClearOldGABuildings)

function Osage_ResetWhenFinishingDummy(playerID, cityID, unitID)
	local pPlayer = Players[playerID]
	if pPlayer:GetCivilizationType() == iCiv then
		local pCity = pPlayer:GetCityByID(cityID)
		if pCity:IsHasBuilding(iGADummy) then
			local pUnit = pPlayer:GetUnitByID(unitID)
			local iType = pUnit:GetUnitType()
			if IsDummyUnitType(iType) then
				if pPlayer:GetGoldenAgeTurns() == 0 then
					pCity:SetNumRealBuilding(iGADummy, 0)
				end
			end
		end
	end
end
GameEvents.CityTrained.Add(Osage_ResetWhenFinishingDummy)

--------------------------------------------------------------
-- UA_Reveal_Resource
--------------------------------------------------------------

local iIron = GameInfoTypes["RESOURCE_IRON"]
local iHorse = GameInfoTypes["RESOURCE_HORSE"]
local iCoal = GameInfoTypes["RESOURCE_COAL"]
local iOil = GameInfoTypes["RESOURCE_OIL"]
local iAluminum = GameInfoTypes["RESOURCE_ALUMINUM"]
local iUranium = GameInfoTypes["RESOURCE_URANIUM"]

local iTechIron = GameInfoTypes["TECH_BRONZE_WORKING"]
local iTechHorses = GameInfoTypes["TECH_ANIMAL_HUSBANDRY"]
local iTechCoal = GameInfoTypes["TECH_INDUSTRIALIZATION"]
local iTechOil = GameInfoTypes["TECH_BIOLOGY"]
local iTechAluminum = GameInfoTypes["TECH_ELECTRICITY"]
local iTechUranium = GameInfoTypes["TECH_ATOMIC_THEORY"]


function Osage_SpawnResource(playerID, bIsNew)
	if bIsNew then
    local pPlayer = Players[playerID]
		local team = Teams[pPlayer:GetTeam()]
		local iOsageResource = iHorse
		if team:IsHasTech(iTechHorses) then
			iOsageResource = iHorse
		end
		if team:IsHasTech(iTechIron) then
			iOsageResource = iIron
		end
		if team:IsHasTech(iTechCoal) then
			iOsageResource = iCoal
		end
		if team:IsHasTech(iTechAluminum) then
			iOsageResource = iAluminum
		end
		if team:IsHasTech(iTechOil) then
			iOsageResource = iOil
		end
		if team:IsHasTech(iTechUranium) then
			iOsageResource = iUranium
		end
		if pPlayer:GetCivilizationType() == iCiv then
			local iCity = -1
			for pCity in pPlayer:Cities() do
			    if (pCity:GetID() > iCity) and (pCity:GetOriginalOwner() == playerID) then
			        iCity = pCity:GetID()
			    end
			end
			local pCity = pPlayer:GetCityByID(iCity) or false
  		for i = 1, pCity:GetNumCityPlots() -1, 1 do
				local pPlot = pCity:GetCityIndexPlot(i)
				if (pPlot:GetWorkingCity() == pCity) and (pPlot:GetResourceType() == -1) and (not pPlot:IsWater()) and (not pPlot:IsMountain()) then
							pPlot:SetResourceType(iOsageResource, 4)
							return
				end
			end
		end
	end
end

LuaEvents.THP_GoldenAgeBegins.Add(Osage_SpawnResource)

--------------------------------------------------------------
-- MineralCouncil_GA_Bursts
--------------------------------------------------------------

local iMineralCouncil = GameInfoTypes["BUILDING_OSAGE_MINERAL_COUNCIL"]

local tSresources = {}
for row in DB.Query("SELECT * FROM Resources WHERE (ResourceClassType = 'RESOURCECLASS_RUSH') OR (ResourceClassType = 'RESOURCECLASS_MODERN')") do
  tSresources[row.ID] = true
end

function Osage_YieldBurstBuildingFinish(playerID, cityID, buildingType)
    local pPlayer = Players[playerID]
		local pCity = pPlayer:GetCityByID(cityID)
		if buildingType == iMineralCouncil then
			for k, v in pairs(tSresources) do
				local resourcenum = pPlayer:GetNumResourceTotal(k)
        local gaCurrent = pPlayer:GetGoldenAgeProgressMeter()
        pPlayer:SetGoldenAgeProgressMeter(gaCurrent + (10 * resourcenum))

      end
		end
end

GameEvents.CityConstructed.Add(Osage_YieldBurstBuildingFinish)

--------------------------------------------------------------
-- MineralCouncil_GA_Yields
--------------------------------------------------------------

function Osage_GA_Yields(playerID)
    local pPlayer = Players[playerID]
    if pPlayer:GetCivilizationType() == iCiv then
			for pCity in pPlayer:Cities() do
				if pCity:IsHasBuilding(iMineralCouncil) then
					if pCity:IsHasBuilding(iGADummy) then
	          pCity:SetNumRealBuilding(prodDummy, 1)
						pCity:SetNumRealBuilding(culDummy, 1)
	        end
					if pPlayer:GetGoldenAgeTurns() == 0 then
	          pCity:SetNumRealBuilding(prodDummy, 0)
						pCity:SetNumRealBuilding(culDummy, 0)
	        end
				end
			end
    end
end

GameEvents.PlayerDoTurn.Add(Osage_GA_Yields)

--------------------------------------------------------------
-- Odon_XP_Bonus
--------------------------------------------------------------
local iXPDummy = GameInfoTypes["BUILDING_OSAGE_ODON_XP"]

local tOdonresources = {}

for row in DB.Query("SELECT * FROM Resources WHERE (Type = 'RESOURCE_IRON') OR (Type = 'RESOURCE_HORSE') OR (Type = 'RESOURCE_COAL') OR (Type = 'RESOURCE_OIL') OR (Type = 'RESOURCE_ALUMINUM')") do
  tOdonresources[row.ID] = true
end

function Odon_XP(playerID)
    local pPlayer = Players[playerID]
    if pPlayer:GetCivilizationType() == iCiv then
      local iNumXPDummies = 0
      for k, v in pairs(tOdonresources) do
        iNumXPDummies = iNumXPDummies + (1.5 * pPlayer:GetNumResourceAvailable(k))
      end
			for pCity in pPlayer:Cities() do
				if pCity:GetProductionUnit(iOdon) then
					pCity:SetNumRealBuilding(iXPDummy, iNumXPDummies)
				else
					pCity:SetNumRealBuilding(iXPDummy, 0)
				end
			end
		end
end
GameEvents.PlayerDoTurn.Add(Odon_XP)
--------------------------------------------------------------
-- Odon_Upgrade_Promotion
--------------------------------------------------------------

local iOdon = GameInfoTypes["UNIT_GR_ODON"]

local iWagaxthi = GameInfoTypes["PROMOTION_OSAGE_WAGAXTHI"]

function Odon_Promotion(playerID, newUnitID)
    local pPlayer = Players[playerID]
		local pUnit = pPlayer:GetUnitByID(newUnitID)
		if pUnit:GetUnitType() == iOdon then
	      	pUnit:SetHasPromotion(iWagaxthi, true)
		end
end
GameEvents.UnitUpgraded.Add(Odon_Promotion)
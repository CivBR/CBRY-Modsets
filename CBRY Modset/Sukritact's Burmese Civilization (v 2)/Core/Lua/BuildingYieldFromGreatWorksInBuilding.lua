-- BuildingYieldFromGreatWorksInBuilding
-- Author: Sukritact
--=======================================================================================================================
-- Prevent Duplicates
--=======================================================================================================================
if MapModData.BuildingYieldFromGreatWorksInBuilding then return end
MapModData.BuildingYieldFromGreatWorksInBuilding = true
Events.SequenceGameInitComplete.Add(function() MapModData.BuildingYieldFromGreatWorksInBuilding = nil end)
--=======================================================================================================================

print("loaded")
include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "BuildingYieldFromGreatWorksInBuilding";

--=======================================================================================================================
-- Main Code
--=======================================================================================================================
local iCulture = GameInfoTypes["YIELD_CULTURE"]
local iFaith = GameInfoTypes["YIELD_FAITH"]

function BuildingYieldFromGreatWorksInBuilding(iPlayer, pPlayer, bIsTurnStart)
	for row in GameInfo.Building_YieldFromGreatWorksInBuilding() do
		local iBuilding = GameInfoTypes[row.BuildingType]
		local iYield = GameInfo.Yields[row.YieldType].ID
		local iDeltaModifier = row.Yield
		
		for pCity in pPlayer:Cities() do
		
			local iCity = pCity:GetID()
			local strBuildingClass = GameInfo.Buildings[iBuilding].BuildingClass
			local iBuildingClass = GameInfo.BuildingClasses[strBuildingClass].ID
			local iGreatWorksNum = pCity:GetNumGreatWorksInBuilding(iBuildingClass)
			local iDelta = (iGreatWorksNum*iDeltaModifier)
			
			if pCity:IsHasBuilding(iBuilding) then
			-- Building exists, adjust yields
			
				if iYield == iCulture then
					local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iCulture)
					save( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iCulture, iDelta)
					if iOldDelta == nil then
						pCity:ChangeJONSCulturePerTurnFromBuildings(iDelta)
					else
						pCity:ChangeJONSCulturePerTurnFromBuildings(iDelta - iOldDelta)
					end
					
				elseif iYield == iFaith then
					if bIsTurnStart == true then
						pPlayer:ChangeFaith(iDelta)
					end
					
				else
					local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
					save (pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, iDelta)
					if iOldDelta == nil then
						pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta)
					else
						pCity:ChangeBaseYieldRateFromBuildings(iYield, iDelta - iOldDelta)
					end
				end
				
			-- Clear data if Building does not exist --
			
			else
				if iYield == iCulture then
					local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iCulture)
					if iOldDelta == nil then
					elseif iOldDelta > 0 then
						save (pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iCulture, 0)
						pCity:ChangeJONSCulturePerTurnFromBuildings(-iOldDelta)
						--print("Data Cleared")
					end
				elseif iYield == iFaith then
					-- Do Nothing
					
				else
					local iOldDelta = load( pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield)
					if iOldDelta == nil then
					elseif iOldDelta > 0 then
						save (pPlayer, iCity .. "B" .. iBuilding .. "Y" .. iYield, 0)
						pCity:ChangeBaseYieldRateFromBuildings(iYield, -iOldDelta)
					end
				end
			end
		end	
	end
end
--=======================================================================================================================
-- Triggers
--=======================================================================================================================
function BuildingYieldFromGreatWorksInBuildingTurnStart(iPlayer, pPlayer)
	local pPlayer = Players[iPlayer]
	local bIsTurnStart = true
	BuildingYieldFromGreatWorksInBuilding(iPlayer, pPlayer, bIsTurnStart)
end

function BuildingYieldFromGreatWorksInBuildingSwap()
	local iPlayer = Game.GetActivePlayer()
	local pPlayer = Players[iPlayer]
	if pPlayer:IsTurnActive() then
		local bIsTurnStart = false
		BuildingYieldFromGreatWorksInBuilding(iPlayer, pPlayer, bIsTurnStart)
	end
end

GameEvents.PlayerDoTurn.Add(BuildingYieldFromGreatWorksInBuildingTurnStart)
Events.SerialEventCityInfoDirty.Add(BuildingYieldFromGreatWorksInBuildingSwap)
--=======================================================================================================================
--=======================================================================================================================
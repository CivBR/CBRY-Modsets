-- MC_Zimbabwe_Functions
-- Author: Sukritact
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- JFD_IsCivilisationActive
--------------------------------
function JFD_IsCivilisationActive(civilizationID)
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
--------------------------------------------------------------
-- GetInternationalTradeRoutesFromCity
--------------------------------------------------------------
function GetInternationalTradeRoutesFromCity(pCity)
	local iPlayer = pCity:GetOwner()
	local pPlayer = Players[iPlayer]

	local tTradeRoutes = {}

	tTradeRoutes = pPlayer:GetTradeRoutes()

	local tFinalRoutes = {}

	for iKey, tRoute in ipairs(tTradeRoutes) do
		if (tRoute.ToID ~= iPlayer) and (tRoute.FromCity == pCity) then
			table.insert(tFinalRoutes, tRoute)
		end
	end	

	return tFinalRoutes
end
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
include("IconSupport")

local iCiv 						= GameInfoTypes.CIVILIZATION_MC_ZIMBABWE
local iActivePlayer 			= Game.GetActivePlayer()
local pActivePlayer 			= Players[iActivePlayer]

local bIsCivActive				= JFD_IsCivilisationActive(iCiv)
local bActivePlayerIsCiv		= (pActivePlayer:GetCivilizationType() == iCiv)
--==========================================================================================================================
-- UNIQUE FUNCTIONS
--==========================================================================================================================
-- FEATS OF IMUTHES
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
-- GANO AXEMAN
----------------------------------------------------------------------------------------------------------------------------
-- Globals
--------------------------------------------------------------
local iGano						= GameInfoTypes.UNIT_MC_GANO
local iExperience				= 3
--------------------------------------------------------------	
-- MC_GanoBonus
--------------------------------------------------------------
function MC_GanoBonus(pPlayer)
	for pUnit in pPlayer:Units() do
		if pUnit:GetUnitType() == iGano then
			pUnit:ChangeExperience(iExperience)
		end
	end
end
--------------------------------------------------------------
-- MC_GanoBonus_PopGrowth
--------------------------------------------------------------
function MC_GanoBonus_PopGrowth(iX, iY, iOldPop, iNewPop)
	if iNewPop < iOldPop then return end
	
	local pPlot				= Map.GetPlot(iX, iY)
	local pCity  			= pPlot:GetPlotCity()
	local iPlayer 			= pCity:GetOwner()
	local pPlayer			= Players[iPlayer]

	MC_GanoBonus(pPlayer)
end

GameEvents.SetPopulation.Add(MC_GanoBonus_PopGrowth)
--------------------------------------------------------------
-- MC_GanoBonus_TileAcquisition
--------------------------------------------------------------
function MC_GanoBonus_TileAcquisition(iPlayer)
	local pPlayer = Players[iPlayer]
	MC_GanoBonus(pPlayer)
end
GameEvents.CityBoughtPlot.Add(MC_GanoBonus_TileAcquisition)
----------------------------------------------------------------------------------------------------------------------------
-- DZIMBABWE
----------------------------------------------------------------------------------------------------------------------------
-- Globals
--------------------------------------------------------------
local iDzimbabwe				= GameInfoTypes.BUILDING_MC_DZIMBABWE
local iDzimbabwe_1				= GameInfoTypes.BUILDING_MC_DZIMBABWE_1
local iDzimbabwe_2				= GameInfoTypes.BUILDING_MC_DZIMBABWE_2

local sDzimbabweAtlas = 		GameInfo.Buildings[iDzimbabwe].IconAtlas
local iDzimbabweAtlas = 		GameInfo.Buildings[iDzimbabwe].PortraitIndex
--------------------------------------------------------------	
-- MC_DzimbabweBonu
--------------------------------------------------------------
function MC_DzimbabweBonus(pCity)
	if not pCity:IsHasBuilding(iDzimbabwe) then
		pCity:SetNumRealBuilding(iDzimbabwe_1, 0)
		pCity:SetNumRealBuilding(iDzimbabwe_2, 0)
		return
	end

	-- 1 Defense per outgoing international trade route
	local tTradeRoutes = GetInternationalTradeRoutesFromCity(pCity)
	pCity:SetNumRealBuilding(iDzimbabwe_2, #tTradeRoutes)

	-- 1 Cult, 1 Prod per every 4 Defensive strength
	local iStrength = math.floor(pCity:GetStrengthValue()/100)
	local iNum = math.floor(iStrength/5)
	pCity:SetNumRealBuilding(iDzimbabwe_1, iNum)

	return #tTradeRoutes, iNum
end
--------------------------------------------------------------
-- PlayerDoTurn_MC_DzimbabweBonus
--------------------------------------------------------------
function PlayerDoTurn_MC_DzimbabweBonus(iPlayer)
	local pPlayer = Players[iPlayer]
	if ((pPlayer:CountNumBuildings(iDzimbabwe) + pPlayer:CountNumBuildings(iDzimbabwe_1) + pPlayer:CountNumBuildings(iDzimbabwe_2)) < 1)  then return end
	
	for pCity in pPlayer:Cities() do
		MC_DzimbabweBonus(pCity)
	end
end
if bIsCivActive then GameEvents.PlayerDoTurn.Add(PlayerDoTurn_MC_DzimbabweBonus) end
-------------------------------------------------------------------------------------------------------------------------
-- Registering Addins
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "MC_Dzimbabwe", 	["SortOrder"] = 1})
end
if bActivePlayerIsCiv then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
-------------------------------------------------------------------------------------------------------------------------
-- CityInfoStackDirty_MC_DzimbabweBonus
-------------------------------------------------------------------------------------------------------------------------
function CityInfoStackDirty_MC_DzimbabweBonus(sKey, pInstance)
	if sKey ~= "MC_Dzimbabwe" then return end

	local pCity = UI.GetHeadSelectedCity()
	if not(pCity) then
		pInstance.IconFrame:SetHide(true)
		return
	end

	if not pCity:IsHasBuilding(iDzimbabwe) then
		pInstance.IconFrame:SetHide(true)
		return
	end

	local iDefense, iCulProd = MC_DzimbabweBonus(pCity)

	IconHookup(iDzimbabweAtlas, 64, sDzimbabweAtlas, pInstance.IconImage)
	pInstance.IconFrame:LocalizeAndSetToolTip("TXT_KEY_BUILDING_MC_DZIMBABWE_TOOLTIP", iDefense, iCulProd)
	pInstance.IconFrame:SetHide(false)
end
if bActivePlayerIsCiv then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty_MC_DzimbabweBonus)
end
--==========================================================================================================================
--==========================================================================================================================
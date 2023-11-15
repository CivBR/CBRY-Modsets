-- JFD_CarthageHannibal_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- INCLUDES
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
-------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
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
-------------------------------------------------------------------------------------------------------------------------
-- GLOBALS
-------------------------------------------------------------------------------------------------------------------------
local activePlayerID				= Game.GetActivePlayer()
local activePlayer					= Players[activePlayerID]
local civilizationID 				= GameInfoTypes["CIVILIZATION_JFD_CARTHAGE_HANNIBAL"]
local isCarthageHannibalCivActive	= JFD_IsCivilisationActive(civilizationID)
local isCarthageHannibalActivePlayer = activePlayer:GetCivilizationType() == civilizationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_CarthageHannibal_CityInfo", ["SortOrder"] = 1})
end
if isCarthageHannibalActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_CarthageHannibal_CityInfo" then return end
	ProcessCityScreen(instance)
end
if isCarthageHannibalActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end
if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
g_JFD_CarthageHannibal_TipControls = {}
TTManager:GetTypeControlTable("JFD_CarthageHannibal_Tooltip", g_JFD_CarthageHannibal_TipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
local buildingCarthageHannibalID = GameInfoTypes["BUILDING_JFD_CARTHAGE_HANNIBAL"]
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	instance.IconFrame:SetToolTipType("JFD_CarthageHannibal_Tooltip")
	IconHookup(0, 64, "JFD_CARTHAGE_HANNIBAL_ATLAS", instance.IconImage)
	local productionBonus = city:GetNumBuilding(buildingCarthageHannibalID)
	if productionBonus == 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	local textDescription = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_CARTHAGE_HANNIBAL_SHORT")) .. "[ENDCOLOR]"
	local textHelp = Locale.ConvertTextKey("TXT_KEY_JFD_CARTHAGE_HANNIBAL_CITY_VIEW_HELP", productionBonus)
	g_JFD_CarthageHannibal_TipControls.Heading:SetText(textDescription)
	g_JFD_CarthageHannibal_TipControls.Body:SetText(textHelp)
	g_JFD_CarthageHannibal_TipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================

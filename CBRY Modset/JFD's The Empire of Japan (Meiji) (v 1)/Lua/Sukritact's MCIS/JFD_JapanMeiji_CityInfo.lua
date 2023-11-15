-- JFD_JapanMeiji_CityInfo
-- Author: JFD
-- DateCreated: 11/21/2014 10:10:10 AM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("IconSupport")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- Sukritact's Modular City Info Stack Support
-------------------------------------------------------------------------------------------------------------------------
local activePlayer					= Players[Game.GetActivePlayer()]
local civilisationID				= GameInfoTypes["CIVILIZATION_JFD_JAPAN_MEIJI"]
local isJapanMeijiActivePlayer		= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_JapanMeijiCityInfo", ["SortOrder"] = 1})
end

if isJapanMeijiActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_JapanMeijiCityInfo" then return end
	ProcessCityScreen(instance)
end

if isJapanMeijiActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingJapanMeijiProductionID = GameInfoTypes["BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION"]

g_JFDJapanMeijiTipControls = {}
TTManager:GetTypeControlTable("JFDJapanMeijiTooltip", g_JFDJapanMeijiTipControls)
-------------------------------------------------------------------------------------------------------------------------
-- ProcessCityScreen
-------------------------------------------------------------------------------------------------------------------------
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local city = UI.GetHeadSelectedCity()
	if (not city) then
		instance.IconFrame:SetHide(true)
		return
	end
	
	instance.IconFrame:SetToolTipType("JFDJapanMeijiTooltip")
	IconHookup(0, 64, "JFD_JAPAN_MEIJI_ATLAS", instance.IconImage)
	
	local bonus = city:GetNumBuilding(buildingJapanMeijiProductionID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_TRAIT_JFD_JAPAN_MEIJI_SHORT")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_MEIJI_PRODUCTION_BONUS_CITY_VIEW_HELP", bonus)
	g_JFDJapanMeijiTipControls.Heading:SetText(titleText)
	g_JFDJapanMeijiTipControls.Body:SetText(helpText)
	g_JFDJapanMeijiTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================

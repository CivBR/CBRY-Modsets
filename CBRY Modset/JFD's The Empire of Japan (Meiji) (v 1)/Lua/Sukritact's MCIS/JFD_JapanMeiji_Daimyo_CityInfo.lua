-- JFD_JapanMeiji_Daimyo_CityInfo
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
local activePlayer			= Players[Game.GetActivePlayer()]
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_JAPAN_MEIJI"]
local isDaimyoActivePlayer	= activePlayer:GetCivilizationType() == civilisationID

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
   table.insert(tCityInfoAddins, {["Key"] = "JFD_DaimyoCityInfo", ["SortOrder"] = 1})
end

if isDaimyoActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
end
 
function CityInfoStackDirty(key, instance)
	if key ~= "JFD_DaimyoCityInfo" then return end
	ProcessCityScreen(instance)
end

if isDaimyoActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
end

if not(OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end
--=======================================================================================================================
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local buildingDaimyoMeleeID	= GameInfoTypes["BUILDING_JFD_DAIMYO_MELEE_BONUSES"]

g_JFDDaimyoTipControls = {}
TTManager:GetTypeControlTable("JFDDaimyoTooltip", g_JFDDaimyoTipControls)
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
	
	local bonus = city:GetNumBuilding(buildingDaimyoMeleeID)
	if bonus <= 0 then
		instance.IconFrame:SetHide(true)
		return
	end
	
	instance.IconFrame:SetToolTipType("JFDDaimyoTooltip")
	IconHookup(2, 64, "JFD_JAPAN_MEIJI_ATLAS", instance.IconImage)
	
	local titleText = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_PROMOTION_JFD_DAIMYO")) .. "[ENDCOLOR]"
	local helpText = Locale.ConvertTextKey("TXT_KEY_JFD_DAIMYO_CITY_VIEW_HELP")
	g_JFDDaimyoTipControls.Heading:SetText(titleText)
	g_JFDDaimyoTipControls.Body:SetText(helpText)
	g_JFDDaimyoTipControls.Box:DoAutoSize()
	instance.IconFrame:SetHide(false)
end
--=======================================================================================================================
--=======================================================================================================================

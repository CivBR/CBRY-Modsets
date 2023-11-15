-- OW_PRC_Mao_MCIS
-- Author: Typhlomence
-- DateCreated: 6/9/2015 9:26:52 PM
--------------------------------------------------------------

-- Based on JFD's code for MCIS

-- ============================================================================
-- Includes
-- ============================================================================
include("IconSupport")

-- ============================================================================
-- Locals
-- ============================================================================


-- ============================================================================
-- Utility functions
-- ============================================================================
-- 
-- ============================================================================


-- ============================================================================
-- MCIS Support
-- ============================================================================
local bMaoActivePlayer = Players[Game.GetActivePlayer()]:GetCivilizationType() == GameInfoTypes["CIVILIZATION_OW_PRC_MAO"];

function CityInfoStackDataRefresh(tCityInfoAddins, tEventsToHook)
	table.insert(tCityInfoAddins, {["Key"] = "OW_PRCMaoCityInfo", ["SortOrder"] = 1})
	print("Inserted OW_PRCMaoCityInfo into tCityInfoAddins")
end

if bMaoActivePlayer then
	LuaEvents.CityInfoStackDataRefresh.Add(CityInfoStackDataRefresh)
	LuaEvents.RequestCityInfoStackDataRefresh()
	print("Chairman Mao is in this game. Adding listener to CityInfoStackDataRefresh")
end

function CityInfoStackDirty(key, instance)
	if key ~= "OW_PRCMaoCityInfo" then return end
	print("Processing city screen for Chairman Mao")
	ProcessCityScreen(instance)
end

if bMaoActivePlayer then
	LuaEvents.CityInfoStackDirty.Add(CityInfoStackDirty)
	print("Chairman Mao is in this game. Adding listener to CityInfoStackDirty")
end

if not (OptionsManager.GetSmallUIAssets()) then Controls.IconFrame:SetOffsetX(294) end

-- ============================================================================
-- Globals
-- ============================================================================
iBuildingDahuitangDummyID = GameInfoTypes["BUILDING_OW_DAHUITANG_THEMING_DUMMY"]

g_OWPRCMaoTooltip_DahuitangControls = {}
TTManager:GetTypeControlTable("OWPRCMaoTooltip_Dahuitang", g_OWPRCMaoTooltip_DahuitangControls)


-- ============================================================================
-- ProcessCityScreen
-- ============================================================================
function ProcessCityScreen(instance)
	-- Ensure City Selected
	local pCity = UI.GetHeadSelectedCity()
	if (not pCity) then
		instance.IconFrame:SetHide(true)
		return
	end
	print("The player is looking at one of Chairman Mao's cities")

    -- Dahuitang
	instance.IconFrame:SetToolTipType("OWPRCMaoTooltip_Dahuitang")
	IconHookup(3, 64, "OW_PRC_MAO_ATLAS", instance.IconImage)

	local bBonus = pCity:IsHasBuilding(iBuildingDahuitangDummyID)
	if not bBonus then
        print("No Dahuitang theming bonus in this city")
		instance.IconFrame:SetHide(true)
		return
	end
    local sTitleDahuitang = "[COLOR_POSITIVE_TEXT]" .. string.upper(Locale.ConvertTextKey("TXT_KEY_BUILDING_OW_DAHUITANG")) .. "[ENDCOLOR]"
    local sTextDahuitang = Locale.ConvertTextKey("TXT_KEY_OW_DAHUITANG_CITY_VIEW_HELP")
    g_OWPRCMaoTooltip_DahuitangControls.Heading:SetText(sTitleDahuitang)
    g_OWPRCMaoTooltip_DahuitangControls.Body:SetText(sTextDahuitang)
    g_OWPRCMaoTooltip_DahuitangControls.Box:DoAutoSize()
    instance.IconFrame:SetHide(false)
	print("City info stack loaded for Chairman Mao")
end
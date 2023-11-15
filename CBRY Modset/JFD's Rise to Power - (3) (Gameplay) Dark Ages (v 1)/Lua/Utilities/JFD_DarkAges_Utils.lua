-- JFD_DarkAges_Utils
-- Author: JFD
-- DateCreated: 4/16/2020 11:56:52 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
include("FLuaVector.lua")
include("JFD_RTP_Utils.lua")
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local g_ConvertTextKey  = Locale.ConvertTextKey
local g_GetRandom		= Game.GetRandom
local g_GetRound		= Game.GetRound
local g_MapGetPlot		= Map.GetPlot
local g_MathCeil		= math.ceil
local g_MathFloor		= math.floor
local g_MathMax			= math.max
local g_MathMin			= math.min
				
local Players 			= Players
local HexToWorld 		= HexToWorld
local ToHexFromGrid 	= ToHexFromGrid
local Teams 			= Teams

local gameSpeedID		= Game.GetGameSpeedType()
local gameSpeed			= GameInfo.GameSpeeds[gameSpeedID]
local gameSpeedMod		= (gameSpeed.BuildPercent/100) 

local handicapID		= Game.GetHandicapType()
local handicap			= GameInfo.HandicapInfos[handicapID]
--==========================================================================================================================
-- ACTIVE MODS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
local policyDarkAgeID = GameInfoTypes["POLICY_JFD_DARK_AGE"]
--==========================================================================================================================
-- DARK AGE UTILS
--==========================================================================================================================
----------------------------------------------------------------------------------------------------------------------------
-- DARK AGE UTILS
----------------------------------------------------------------------------------------------------------------------------
--Player:IsDarkAge
function Player.IsDarkAge(player)
	return player:HasPolicy(policyDarkAgeID)
end
----------------------------------------------------------------------------------------------------------------------------
--Player:SetIsDarkAge
function Player.SetIsDarkAge(player, setIsDarkAge)
	if setIsDarkAge then
		if Player.GrantPolicy then
			player:GrantPolicy(policyDarkAgeID, true)
		else
			player:SetNumFreePolicies(1)
			player:SetNumFreePolicies(0)
			player:SetHasPolicy(policyDarkAgeID, true)
		end

		if player:IsHuman() and player:IsTurnActive() then
			LuaEvents.JFD_ShowDarkAgePopup(player)
				
			Events.AudioPlay2DSound("AS2D_SOUND_JFD_DARK_AGE")
			player:SendNotification("NOTIFICATION_JFD_DARK_AGE_BEGUN_ACTIVE_PLAYER", g_ConvertTextKey("TXT_KEY_NOTIFICATION_DARK_AGE_BEGUN"), g_ConvertTextKey("TXT_KEY_NOTIFICATION_DARK_AGE_BEGUN_SHORT"), false, nil, nil)
		else
			player:SendWorldEvent(g_ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_DARK_AGE", player:GetCivilizationShortDescriptionKey()))
		end
	else
		if Player.RevokePolicy then
			player:RevokePolicy(policyDarkAgeID)
		else
			player:SetHasPolicy(policyDarkAgeID, false)
		end

		if player:IsHuman() and player:IsTurnActive() then
			player:SendNotification("NOTIFICATION_JFD_DARK_AGE_ENDED_ACTIVE_PLAYER", g_ConvertTextKey("TXT_KEY_NOTIFICATION_DARK_AGE_ENDED"), g_ConvertTextKey("TXT_KEY_NOTIFICATION_DARK_AGE_ENDED_SHORT"), false, nil, nil)
		end
	end
end
--==========================================================================================================================
--==========================================================================================================================
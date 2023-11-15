-- JFD_RCN_Utils
-- Author: JFD
-- DateCreated: 5/6/2019 2:48:53 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
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

local handicapID		= Game.GetHandicapType()
local handicap			= GameInfo.HandicapInfos[handicapID]
--=======================================================================================================================
-- CACHED TABLES
--=======================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GAME DEFINES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- ACTIVE MODS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- ALTERNATE NAMES UTILS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
function Game_UpdateStrings(str, tag)
	local tableQuery = {"UPDATE Language_en_US SET Text = '".. str .."' WHERE Tag = '" .. tag .. "'"}
	for i, queryID in pairs(tableQuery) do
		for result in DB.Query(queryID) do
		end
	end
	Locale.SetCurrentLanguage(Locale.GetCurrentLanguage().Type)
end
-------------------------------------------------------------------------------------------------------------------------
--Player_CanHaveCivShortDesc
function Player_CanHaveCivShortDesc(playerID, strCivShortDesc)
	for otherPlayerID = 0, defineMaxMajorCivs - 1 do
		local otherPlayer = Players[otherPlayerID]
		if otherPlayer:IsEverAlive() and otherPlayerID ~= playerID then
			local civID = otherPlayer:GetCivilizationType()
			if otherPlayer:GetCivilizationShortDescription() == strCivShortDesc then
				return false, otherPlayerID
			end
		end
	end
	return true
end
-------------------------------------------------------------------------------------------------------------------------
--g_Civilization_CityNames_Table
local g_Civilization_CityNames_Table = {}
local g_Civilization_CityNames_Count = 1
for row in DB.Query("SELECT * FROM Civilization_CityNames;") do 	
	g_Civilization_CityNames_Table[g_Civilization_CityNames_Count] = row
	g_Civilization_CityNames_Count = g_Civilization_CityNames_Count + 1
end

--Player_GetCapitalName
function Player_GetCapitalName(player)
	--g_Civilization_CityNames_Table
	local civsTable = g_Civilization_CityNames_Table
	local numCivs = #civsTable
	for index = 1, numCivs do
		local row = civsTable[index]
		if GameInfoTypes[row.CivilizationType] == player:GetCivilizationType() then
			return row.CityName
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
--Player_GetDirectionalShortDesc
function Player_GetDirectionalShortDesc(player, otherPlayer)
	local playerID = player:GetID()
	local otherPlayerID = otherPlayer:GetID()

	local strCivShortDesc = nil
	local playerStartingPlot = player:GetStartingPlot()
	local playerPlotX, playerPlotY = playerStartingPlot:GetX(), playerStartingPlot:GetY()
	
	local strOtherCivShortDesc = nil
	local otherPlayerStartingPlot = otherPlayer:GetStartingPlot()
	local otherPlayerPlotX, otherPlayerPlotY = otherPlayerStartingPlot:GetX(), otherPlayerStartingPlot:GetY()

	local distanceX = Map.PlotDistance(playerPlotX, otherPlayerPlotX)
	local distanceY = Map.PlotDistance(playerPlotY, otherPlayerPlotY)
	
	if distanceX < distanceY then
		if playerPlotY > otherPlayerPlotY then
			strCivShortDesc = "TXT_KEY_JFD_RCN_NORTH"
			if Player_CanHaveCivShortDesc(playerID, strCivShortDesc) then
				strOtherCivShortDesc = "TXT_KEY_JFD_RCN_SOUTH"
			else
				strCivShortDesc = "TXT_KEY_JFD_RCN_UPPER"
				if Player_CanHaveCivShortDesc(playerID, strCivShortDesc) then
					strOtherCivShortDesc = "TXT_KEY_JFD_RCN_LOWER"
				else
					strCivShortDesc = nil
				end
			end
		else
			strOtherCivShortDesc = "TXT_KEY_JFD_RCN_NORTH"
			if Player_CanHaveCivShortDesc(otherPlayerID, strCivShortDesc) then
				strCivShortDesc = "TXT_KEY_JFD_RCN_SOUTH"
			else
				strOtherCivShortDesc = "TXT_KEY_JFD_RCN_UPPER"
				if Player_CanHaveCivShortDesc(otherPlayerID, strCivShortDesc) then
					strCivShortDesc = "TXT_KEY_JFD_RCN_LOWER"
				else
					strOtherCivShortDesc = nil
				end
			end
		end
	else
		if playerPlotY > otherPlayerPlotY then
			strCivShortDesc = "TXT_KEY_JFD_RCN_WEST"
			if Player_CanHaveCivShortDesc(playerID, strCivShortDesc) then
				strOtherCivShortDesc = "TXT_KEY_JFD_RCN_EAST"
			else
				strCivShortDesc = nil
			end
		else
			strOtherCivShortDesc = "TXT_KEY_JFD_RCN_WEST"
			if Player_CanHaveCivShortDesc(otherPlayerID, strCivShortDesc) then
				strCivShortDesc = "TXT_KEY_JFD_RCN_EAST"
			else
				strOtherCivShortDesc = nil
			end
		end
	end

	if player:IsCivilizationPlural() then
		if strCivShortDesc then
			strCivShortDesc = strCivShortDesc .. "_PL"
		end
		if strOtherCivShortDesc then
			strOtherCivShortDesc = strOtherCivShortDesc .. "_PL"
		end
	end	

	return strCivShortDesc,strOtherCivShortDesc
end
--==========================================================================================================================
--==========================================================================================================================
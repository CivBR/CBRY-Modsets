-- JFD_RCN_Functions
-- Author: JFD
-- DateCreated: 4/30/2019 8:35:33 AM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
include("JFD_RegionalCivNames_Utils.lua")
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

local activePlayerID	= Game.GetActivePlayer()
local activePlayer		= Players[activePlayerID]
local activeTeamID		= activePlayer:GetTeam()
local activeTeam		= Teams[activeTeamID]

local modGAPercent		= ((GameInfo.GameSpeeds[Game.GetGameSpeedType()].GoldenAgePercent)/100)
--==========================================================================================================================
-- ACTIVE MODS
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
--==========================================================================================================================
-- GLOBAL DEFINES
--==========================================================================================================================
-------------------------------------------------------------------------------------------------------------------------
local defineMaxMajorCivs = GameDefines["MAX_MAJOR_CIVS"]
local defineMaxMinorCivs = GameDefines["MAX_MINOR_CIVS"]
--==========================================================================================================================
-- CORE FUNCTIONS
--==========================================================================================================================
------------------------------------------------------------------------------------------------------------------------
--g_Civilization_AlternateNames_Table
local g_Civilization_AlternateNames_Table = {}
local g_Civilization_AlternateNames_Count = 1
for row in DB.Query("SELECT * FROM Civilization_AlternateNames ORDER BY RANDOM();") do 	
	g_Civilization_AlternateNames_Table[g_Civilization_AlternateNames_Count] = row
	g_Civilization_AlternateNames_Count = g_Civilization_AlternateNames_Count + 1
end

--JFD_RCN_SequenceGameInitComplete
function JFD_RCN_SequenceGameInitComplete()

	local strEmpire = "TXT_KEY_JFD_RCN_EMPIRE"
	if Player.GetCurrentGovernment then
		strEmpire = "TXT_KEY_JFD_RCN_CIVILIZATION"
	end

	for playerID = 0, defineMaxMajorCivs - 1 do
		local player = Players[playerID]
		if player:IsEverAlive() and (not player:IsHuman()) and (not player:GetCapitalCity()) then
			local civID = player:GetCivilizationType()
			local civ = GameInfo.Civilizations[civID]
			local civDefaultShortDesc = civ.ShortDescription
			local civDefaultAdjective = civ.Adjective
			local civShortDesc = g_ConvertTextKey(civDefaultShortDesc)
			
			local canHaveDefaultName, otherPlayerID = Player_CanHaveCivShortDesc(playerID, player:GetCivilizationShortDescription())
			if (not canHaveDefaultName) then
				local hasFoundNewName = false
				local isNewNameAdj = false
				
				-- if Player_IsCivilizationPlural(player) then
					-- local thisCivShortDesc = g_ConvertTextKey(civDefaultShortDesc)
					-- civShortDesc = Locale.Substring(thisCivShortDesc, 5, Locale.Length(thisCivShortDesc))	
				-- end
				
				local otherPlayer = Players[otherPlayerID]
				local otherCivID = otherPlayer:GetCivilizationType()
				local otherCiv = GameInfo.Civilizations[otherCivID]
				local otherCivDefaultShortDesc = otherCiv.ShortDescription
				local otherCivDefaultAdjective = otherCiv.Adjective
				local otherCivShortDesc = otherCivDefaultShortDesc
				
				for row in DB.Query("SELECT * FROM Civilization_AlternateNames ORDER BY RANDOM();") do 	
					local strShortDesc = row.ShortDescription
					
					if row.UseAdjective then
						civShortDesc = player:GetCivilizationAdjective()
						otherCivShortDesc = otherPlayer:GetCivilizationAdjective()
					else
						if player:IsCivilizationPlural() then
							local thisCivShortDesc = g_ConvertTextKey(civDefaultShortDesc)
							local thisOtherCivShortDesc = g_ConvertTextKey(otherCivDefaultShortDesc)
							civShortDesc = Locale.Substring(thisCivShortDesc, 5, Locale.Length(thisCivShortDesc))	
							otherCivShortDesc = Locale.Substring(thisOtherCivShortDesc, 5, Locale.Length(thisOtherCivShortDesc))	
							strShortDesc = strShortDesc .. "_PL"
						else
							civShortDesc = civDefaultShortDesc
							otherCivShortDesc = otherCivDefaultShortDesc
						end
					end
					
					if (not hasFoundNewName) and row.IsCapital then
						local strCapital = g_ConvertTextKey(Player_GetCapitalName(player))
						if strCapital and Player_CanHaveCivShortDesc(playerID, strCapital) then
							
							-- Game_UpdateStrings(strCapital, civDefaultShortDesc)
							-- Game_UpdateStrings(g_ConvertTextKey(strEmpire, strCapital), civDefaultAdjective)
							
							PreGame.SetCivilizationShortDescription(playerID, strCapital)
							PreGame.SetCivilizationDescription(playerID, g_ConvertTextKey(strEmpire, strCapital))

							break
						end
					end

					if (not hasFoundNewName) and row.IsDirectional then
						local strDirectionalName, strOtherDirectionalName = Player_GetDirectionalShortDesc(player, otherPlayer)
						local newCivShortDesc = g_ConvertTextKey(strDirectionalName, civShortDesc)
						local newOtherCivShortDesc = g_ConvertTextKey(strOtherDirectionalName, otherCivShortDesc)
						local newCivShortAdj = g_ConvertTextKey(strDirectionalName, player:GetCivilizationAdjective())
						local newOtherCivAdj = g_ConvertTextKey(strOtherDirectionalName, otherPlayer:GetCivilizationAdjective())
						if Player_CanHaveCivShortDesc(playerID, g_ConvertTextKey(newCivShortDesc)) and Player_CanHaveCivShortDesc(otherPlayerID, g_ConvertTextKey(newOtherCivShortDesc)) then
							-- Game_UpdateStrings(newCivShortDesc, civDefaultShortDesc)
							-- Game_UpdateStrings(g_ConvertTextKey(strEmpire, newCivShortAdj), civDefaultAdjective)
							
							-- Game_UpdateStrings(newOtherCivShortDesc, otherCivDefaultShortDesc)
							-- Game_UpdateStrings(g_ConvertTextKey(strEmpire, newOtherCivAdj), otherCivDefaultAdjective)
							
							PreGame.SetCivilizationShortDescription(playerID, newCivShortDesc)
							PreGame.SetCivilizationAdjective(playerID, newCivShortAdj)
							PreGame.SetCivilizationDescription(playerID, g_ConvertTextKey(strEmpire, newCivShortAdj))
							
							PreGame.SetCivilizationShortDescription(otherPlayerID, newOtherCivShortDesc)
							PreGame.SetCivilizationDescription(otherPlayerID, g_ConvertTextKey(strEmpire, newOtherCivAdj))	

							break
						end
					end
					
					if (not hasFoundNewName) and row.IsContinental then
						local plot = player:GetStartingPlot()
						if GameInfoTypes[row.PrereqContinentType] == plot:GetContinentArtType() then
							local newCivShortDesc = g_ConvertTextKey(strShortDesc, civShortDesc)
							local newCivShortAdj = g_ConvertTextKey(strShortDesc, player:GetCivilizationAdjective())
							if Player_CanHaveCivShortDesc(playerID, g_ConvertTextKey(newCivShortDesc)) then
								-- Game_UpdateStrings(newCivShortDesc, civDefaultShortDesc)
								-- Game_UpdateStrings(g_ConvertTextKey("TXT_KEY_JFD_RCN_EMPIRE", newCivShortAdj), civDefaultAdjective)
							
								PreGame.SetCivilizationShortDescription(playerID, newCivShortDesc)
								PreGame.SetCivilizationAdjective(playerID, newCivShortAdj)
								PreGame.SetCivilizationDescription(playerID, g_ConvertTextKey(strEmpire, newCivShortAdj))
							end
						end
					end

					local newCivShortDesc = g_ConvertTextKey(strShortDesc, civShortDesc)
					if Player_CanHaveCivShortDesc(playerID, newCivShortDesc) then
						local newCivShortAdj = g_ConvertTextKey(strShortDesc, player:GetCivilizationAdjective())
						-- Game_UpdateStrings(newCivShortDesc, civDefaultShortDesc)
						-- Game_UpdateStrings(g_ConvertTextKey("TXT_KEY_JFD_RCN_EMPIRE", newCivShortAdj), civDefaultAdjective)
						
						PreGame.SetCivilizationShortDescription(playerID, newCivShortDesc)
						PreGame.SetCivilizationAdjective(playerID, newCivShortAdj)
						PreGame.SetCivilizationDescription(playerID, g_ConvertTextKey(strEmpire, newCivShortAdj))	
						
						break
					end
				end
			end
		end
	end
end
Events.SequenceGameInitComplete.Add(JFD_RCN_SequenceGameInitComplete)
--==========================================================================================================================
--==========================================================================================================================
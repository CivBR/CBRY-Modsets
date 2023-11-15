-- JFD_JapanMeiji_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Japan (Meiji) Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
-- Globals
--------------------------------------------------------------------------------------------------------------------------
local civilisationID	= GameInfoTypes["CIVILIZATION_JFD_JAPAN_MEIJI"]
local eraIndustrialID	= GameInfoTypes["ERA_INDUSTRIAL"]
local mathCeil			= math.ceil
--------------------------------------------------------------------------------------------------------------------------
-- The Black Ships
--------------------------------------------------------------------------------------------------------------------------
local blackShipPlayerID = nil
local techSteamPowerID  = GameInfoTypes["TECH_STEAM_POWER"]

local Event_JFDJapanMeijiBlackShips = {}
	Event_JFDJapanMeijiBlackShips.Name = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY"
	Event_JFDJapanMeijiBlackShips.Desc = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY_DESC"
	Event_JFDJapanMeijiBlackShips.Weight = 20
	Event_JFDJapanMeijiBlackShips.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID		then return false end
			if player:GetCurrentEra() < eraIndustrialID				then return false end		
			
			local playerID = player:GetID()
			local playerTeam = Teams[player:GetTeam()]
			local otherPlayers = {}
			local count = 1
			for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
				local otherPlayer = Players[otherPlayerID]
				local otherPlayerTeamID = otherPlayer:GetTeam()
				if (otherPlayerID ~= playerID and playerTeam:IsHasMet(otherPlayerTeamID) and (not playerTeam:IsAtWar(otherPlayerTeamID) and (not otherPlayer:IsDenouncedPlayer(playerID)) and (not otherPlayer:IsDenouncingPlayer(playerID)))) then
					otherPlayers[count] = otherPlayerID
					count = count + 1	
				end
			end
			
			blackShipPlayerID = otherPlayers[JFD_GetRandom(1, #otherPlayers)]
			if blackShipPlayerID == nil then return false end
			local competingPlayer = Players[blackShipPlayerID]
			local competingCivAdj = competingPlayer:GetCivilizationAdjective()
			local competingCivDesc = competingPlayer:GetCivilizationShortDescription()
			local competingLeaderName = competingPlayer:GetName()
			Event_JFDJapanMeijiBlackShips.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY_DESC", competingCivAdj, competingLeaderName, competingCivDesc)
			return true
		end
		)
	Event_JFDJapanMeijiBlackShips.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDJapanMeijiBlackShips.Outcomes[1] = {}
	Event_JFDJapanMeijiBlackShips.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY_OUTCOME_1"
	Event_JFDJapanMeijiBlackShips.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY_OUTCOME_RESULT_1"
	Event_JFDJapanMeijiBlackShips.Outcomes[1].CanFunc = (
		function(player)	
			local goldCost = mathCeil(600 * iMod)
			local cultureCost = mathCeil(200 * iMod)
			if player:GetGold() < goldCost							then return false end
			if player:GetJONSCulture() < cultureCost				then return false end
			if Teams[player:GetTeam()]:IsHasTech(techSteamPowerID)	then return false end
			Event_JFDJapanMeijiBlackShips.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY_OUTCOME_RESULT_1", goldCost, cultureCost)
			return true
		end
		)
	Event_JFDJapanMeijiBlackShips.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil(600 * iMod)
			local cultureCost = mathCeil(200 * iMod)
			player:ChangeGold(-goldCost)
			player:ChangeJONSCulture(-cultureCost)
			Teams[player:GetTeam()]:GetTeamTechs():SetHasTech(techSteampowerID, true)
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_MEIJI_PERRY_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY"))
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFDJapanMeijiBlackShips.Outcomes[2] = {}
	Event_JFDJapanMeijiBlackShips.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY_OUTCOME_2"
	Event_JFDJapanMeijiBlackShips.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY_OUTCOME_RESULT_2"
	Event_JFDJapanMeijiBlackShips.Outcomes[2].CanFunc = (
		function(player)	
			Event_JFDJapanMeijiBlackShips.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY_OUTCOME_RESULT_2", Players[blackShipPlayerID]:GetCivilizationShortDescription())
			return true
		end
		)
	Event_JFDJapanMeijiBlackShips.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			if JFD_GetRandom(1,10) <= 3 then
				Teams[Players[blackShipPlayerID]:GetTeam()]:DeclareWar(player:GetTeam())
			end
			
			for city in player:Cities() do
				city:ChangeWeLoveTheKingDayCounter(5)
			end
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_MEIJI_PERRY_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_MEIJI_PERRY"))
		end)
Events_AddCivilisationSpecific(civilisationID, "Event_JFDJapanMeijiBlackShips", Event_JFDJapanMeijiBlackShips)
Events_AddCivilisationSpecificScheduled(civilisationID, "Event_JFDJapanMeijiBlackShips", Event_JFDJapanMeijiBlackShips, 1852, true)
--------------------------------------------------------------------------------------------------------------------------
-- Satsuma Rebellion
--------------------------------------------------------------------------------------------------------------------------
local playerBarbarian				= Players[63]
local unitSamuraiID					= GameInfoTypes["UNIT_JAPANESE_SAMURAI"]
local unitCombatGunID				= GameInfoTypes["UNITCOMBAT_GUN"]
local unitPromotionGoldenAgesID		= GameInfoTypes["PROMOTION_GOLDEN_AGE_POINTS"]

local Event_JFDJapanMeijiSatsumaRebellion = {}
	Event_JFDJapanMeijiSatsumaRebellion.Name = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_SATSUMA_REBELLION"
	Event_JFDJapanMeijiSatsumaRebellion.Desc = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_SATSUMA_REBELLION_DESC"
	Event_JFDJapanMeijiSatsumaRebellion.Weight = 10
	Event_JFDJapanMeijiSatsumaRebellion.CanFunc = (
		function(player)			
			if player:GetCivilizationType() ~= civilisationID 	then return false end
			if player:GetCurrentEra() < eraIndustrialID 		then return false end
			return true
		end
		)
	Event_JFDJapanMeijiSatsumaRebellion.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFDJapanMeijiSatsumaRebellion.Outcomes[1] = {}
	Event_JFDJapanMeijiSatsumaRebellion.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_SATSUMA_REBELLION_OUTCOME_1"
	Event_JFDJapanMeijiSatsumaRebellion.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_JAPAN_MEIJI_SATSUMA_REBELLION_OUTCOME_RESULT_1"
	Event_JFDJapanMeijiSatsumaRebellion.Outcomes[1].CanFunc = (
		function(player)	
			Event_JFDJapanMeijiSatsumaRebellion.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_MEIJI_SATSUMA_REBELLION_OUTCOME_RESULT_1")
			return true
		end
		)
	Event_JFDJapanMeijiSatsumaRebellion.Outcomes[1].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local capitalX = player:GetCapitalCity():GetX()
			local capitalY = player:GetCapitalCity():GetY()
			local capitalXAdj = capitalX + JFD_GetRandom(-1,1)
			local capitalYAdj = capitalY + JFD_GetRandom(-1,1)
			playerBarbarian:InitUnit(unitSamuraiID, capitalXAdj, capitalYAdj):JumpToNearestValidPlot()
			playerBarbarian:InitUnit(unitSamuraiID, capitalXAdj, capitalYAdj):JumpToNearestValidPlot()
			playerBarbarian:InitUnit(unitSamuraiID, capitalXAdj, capitalYAdj):JumpToNearestValidPlot()
			playerBarbarian:InitUnit(unitSamuraiID, capitalXAdj, capitalYAdj):JumpToNearestValidPlot()
			playerBarbarian:InitUnit(unitSamuraiID, capitalXAdj, capitalYAdj):JumpToNearestValidPlot()
			
			local unitGunID = GetStrongestMilitaryUnit(player, true, "UNITCOMBAT_GUN")
			player:InitUnit(unitGunID, capitalX, capitalY)
			player:InitUnit(unitGunID, capitalX, capitalY)
			for unit in player:Units() do
				if unit:GetUnitCombatType() == unitCombatGunID then
					unit:SetHasPromotion(unitPromotionGoldenAgesID, true)
				end
			end
			
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_JAPAN_MEIJI_SATSUMA_REBELLION_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_JAPAN_MEIJI_SATSUMA_REBELLION"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_JAPAN_MEIJI_SATSUMA_REBELLION", player:GetCivilizationDescription(), player:GetName())) 
		end)
Events_AddCivilisationSpecific(civilisationID, "Event_JFDJapanMeijiSatsumaRebellion", Event_JFDJapanMeijiSatsumaRebellion)
--=======================================================================================================================
--=======================================================================================================================



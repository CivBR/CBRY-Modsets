-- JFD_CarthageHannibal_Events
-- Author: JFD
--=======================================================================================================================
print("JFD's Carthage Events: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- UTILS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- GLOBALS
--------------------------------------------------------------------------------------------------------------------------
local civilizationID = GameInfoTypes["CIVILIZATION_JFD_CARTHAGE_HANNIBAL"]
local mathCeil = math.ceil
--------------------------------------------------------------------------------------------------------------------------
--  Carthage (Hannibal): Xanthippus the Mercenary General
--------------------------------------------------------------------------------------------------------------------------
local domainLandID = GameInfoTypes["DOMAIN_LAND"]
local unitPromotionXanthippusID = GameInfoTypes["PROMOTION_DECISIONS_JFD_XANTHIPPUS"]
local unitGreatGeneralID = nil
local Event_JFD_CarthageHannibal_Xanthippus = {}
	Event_JFD_CarthageHannibal_Xanthippus.Name = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS"
	Event_JFD_CarthageHannibal_Xanthippus.Desc = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS_DESC"
	Event_JFD_CarthageHannibal_Xanthippus.EventImage = 'Event_Carthage_Xanthippus.dds'
	Event_JFD_CarthageHannibal_Xanthippus.Weight = 10
	Event_JFD_CarthageHannibal_Xanthippus.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_CarthageHannibal_Xanthippus") == true then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			if Teams[player:GetTeam()]:GetAtWarCount(true) == 0 then return false end	 
			local goldCost = mathCeil((33*player:GetNumMilitaryUnits())*iMod)
			if player:GetGold() < goldCost then return false end
			local unitGreatGenerals = {}
			local unitGreatGeneralCount = 1
			for unit in GameInfo.Units("Class = 'UNITCLASS_GREAT_GENERAL' AND Type <> 'UNIT_JFD_SHOPHET'") do
				unitGreatGenerals[unitGreatGeneralCount] = unit.ID
			end
			unitGreatGeneralID = unitGreatGenerals[GetRandom(1,#unitGreatGenerals)]
			return true
		end
		)
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[1] = {}
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS_OUTCOME_1"
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS_OUTCOME_RESULT_1"
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[1].Weight = 2
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[1].CanFunc = (
		function(player)		
			return true
		end
		)
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[1].DoFunc = (
		function(player) 
			player:GetCapitalCity():ChangeWeLoveTheKingDayCounter(20*iMod)	
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS"))
			save(player, "Event_JFD_CarthageHannibal_Xanthippus", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[2] = {}
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS_OUTCOME_2"
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS_OUTCOME_RESULT_2"
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[2].Weight = 5
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[2].CanFunc = (
		function(player)
			local goldCost = mathCeil((33*player:GetNumMilitaryUnits())*iMod)
			Event_JFD_CarthageHannibal_Xanthippus.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS_OUTCOME_RESULT_2", goldCost, GameInfo.Units[unitGreatGeneralID].Description)
			return true
		end
		)
	Event_JFD_CarthageHannibal_Xanthippus.Outcomes[2].DoFunc = (
		function(player) 
			local playerID = player:GetID()
			local goldCost = mathCeil((33*player:GetNumMilitaryUnits())*iMod)
			player:ChangeGold(-goldCost)
			for unit in player:Units() do
				if (unit:IsCombatUnit() and unit:GetDomainType() == domainLandID) then
					unit:SetHasPromotion(unitPromotionXanthippusID, true)
				end
			end
			local capital = player:GetCapitalCity()
			player:InitUnit(unitGreatGeneralID, capital:GetX(), capital:GetY()):SetName("Xanthippus")
			JFD_SendNotification(playerID, "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS"))
			JFD_SendWorldEvent(playerID, Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_JFD_CARTHAGE_HANNIBAL_XANTHIPPUS", player:GetName(), player:GetCivilizationAdjective()))
			save(player, "Event_JFD_CarthageHannibal_Xanthippus", true)
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_CarthageHannibal_Xanthippus", Event_JFD_CarthageHannibal_Xanthippus)
--------------------------------------------------------------------------------------------------------------------------
-- Carthage (Hannibal): Mago's Writings
--------------------------------------------------------------------------------------------------------------------------
local Event_JFD_CarthageHannibal_Mago = {}
	Event_JFD_CarthageHannibal_Mago.Name = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS"
	Event_JFD_CarthageHannibal_Mago.Desc = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS_DESC"
	Event_JFD_CarthageHannibal_Mago.EventImage = 'Event_Carthage_Mago.dds'
	Event_JFD_CarthageHannibal_Mago.Weight = 5
	Event_JFD_CarthageHannibal_Mago.CanFunc = (
		function(player)			
			if load(player, "Event_JFD_CarthageHannibal_Mago") == true 	then return false end
			if player:GetCivilizationType() ~= civilizationID then return false end
			local goldCost = mathCeil(150*iMod)
			if player:GetGold() < goldCost then return false end
			local capital = player:GetCapitalCity()
			if (capital:GetProductionUnit() == -1 and capital:GetProductionBuilding() == -1) then return false end
			return true
		end
		)
	Event_JFD_CarthageHannibal_Mago.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_JFD_CarthageHannibal_Mago.Outcomes[1] = {}
	Event_JFD_CarthageHannibal_Mago.Outcomes[1].Name = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS_OUTCOME_1"
	Event_JFD_CarthageHannibal_Mago.Outcomes[1].Desc = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS_OUTCOME_RESULT_1"
	Event_JFD_CarthageHannibal_Mago.Outcomes[1].Weight = 2
	Event_JFD_CarthageHannibal_Mago.Outcomes[1].CanFunc = (
		function(player)
			local productionReward = mathCeil(40*iMod)
			Event_JFD_CarthageHannibal_Mago.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS_OUTCOME_RESULT_1", productionReward)
			return true
		end
		)
	Event_JFD_CarthageHannibal_Mago.Outcomes[1].DoFunc = (
		function(player) 
			local productionReward = mathCeil(40*iMod)
			player:GetCapitalCity():ChangeProduction(productionReward)	
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS"))
			save(player, "Event_JFD_CarthageHannibal_Mago", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_JFD_CarthageHannibal_Mago.Outcomes[2] = {}
	Event_JFD_CarthageHannibal_Mago.Outcomes[2].Name = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS_OUTCOME_2"
	Event_JFD_CarthageHannibal_Mago.Outcomes[2].Desc = "TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS_OUTCOME_RESULT_2"
	Event_JFD_CarthageHannibal_Mago.Outcomes[2].Weight = 4
	Event_JFD_CarthageHannibal_Mago.Outcomes[2].CanFunc = (
		function(player)		
			local goldCost = mathCeil(150*iMod)
			local foodReward = mathCeil(23*iMod)
			Event_JFD_CarthageHannibal_Mago.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS_OUTCOME_RESULT_2", goldCost, foodReward)
			return true
		end
		)
	Event_JFD_CarthageHannibal_Mago.Outcomes[2].DoFunc = (
		function(player) 
			local goldCost = mathCeil(150*iMod)
			local foodReward = mathCeil(23*iMod)
			player:ChangeGold(-goldCost)
			for city in player:Cities() do
				city:ChangeFood(foodReward)
			end
			JFD_SendNotification(player:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_JFD_CARTHAGE_HANNIBAL_MAGOS_WRITINGS"))
			save(player, "Event_JFD_CarthageHannibal_Mago", true)
		end)
	
Events_AddCivilisationSpecific(civilizationID, "Event_JFD_CarthageHannibal_Mago", Event_JFD_CarthageHannibal_Mago)
--=======================================================================================================================
--=======================================================================================================================



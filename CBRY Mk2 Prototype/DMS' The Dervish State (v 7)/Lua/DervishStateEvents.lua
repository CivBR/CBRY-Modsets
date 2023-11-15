-- DervishStateEvents
-- Author: DMS
--=======================================================================================================================
print("Age of Imperialism's The Dervish State Events: loaded")
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
	if not (player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end
--=======================================================================================================================
-- Civ Specific Events
--=======================================================================================================================
local civilisationID 			= GameInfoTypes["CIVILIZATION_AOI_DERVISH"]
local eraRenaissanceID			= GameInfoTypes["ERA_RENAISSANCE"]
local buildingDervishSpyDummyID	= GameInfoTypes["BUILDING_DMS_DERVISH_STATE_EVENT_SPY_DUMMY"]
--------------------------------------------------------------------------------------------------------------------------
--  Institution of the Hed Kaldig
--------------------------------------------------------------------------------------------------------------------------
local Event_InstitutionOfTheHedKaldig = {}
	Event_InstitutionOfTheHedKaldig.Name = "TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG"
	Event_InstitutionOfTheHedKaldig.Desc = "TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_DESC"
	Event_InstitutionOfTheHedKaldig.Weight = 15
	Event_InstitutionOfTheHedKaldig.CanFunc = (
		function(pPlayer)			
			if load(pPlayer, "Event_InstitutionOfTheHedKaldig") == true		then return false end
			if pPlayer:GetCivilizationType() ~= civilisationID				then return false end
			if pPlayer:GetCurrentEra() < eraRenaissanceID					then return false end -- cannot happen before the renaissance
			if pPlayer:IsGoldenAge()										then return false end -- cannot happen when player is in Golden Age
			if pPlayer:GetGoldenAgeProgressMeter() < 100 					then return false end -- cannot happen when player has less than 500 Golden Age points
			
			Event_InstitutionOfTheHedKaldig.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_DESC")
			return true
		end
		)
	Event_InstitutionOfTheHedKaldig.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_InstitutionOfTheHedKaldig.Outcomes[1] = {}
	Event_InstitutionOfTheHedKaldig.Outcomes[1].Name = "TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_1"
	Event_InstitutionOfTheHedKaldig.Outcomes[1].Desc = "TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_RESULT_1"
	Event_InstitutionOfTheHedKaldig.Outcomes[1].Weight = 20
	Event_InstitutionOfTheHedKaldig.Outcomes[1].CanFunc = (
		function(pPlayer)
			-- Golden Age cost
			local iGoldenAgePointsProgress = pPlayer:GetGoldenAgeProgressMeter()
			local iGoldenAgePointsCost_1 = math.ceil((iGoldenAgePointsProgress * 25) / 100 ) -- 25% of current Golden Age progress
			local iGoldenAgePointsCost_2 = 50
			local iGoldenAgePointsCost = 0
			-- determine cost. Calculation breakdown: x = 25% of current progress; min = 50 < x < 100 = max
			if iGoldenAgePointsCost_1 < iGoldenAgePointsCost_2 or iGoldenAgePointsCost_1 > 100 then 
				iGoldenAgePointsCost = iGoldenAgePointsCost_2
			else
				iGoldenAgePointsCost = iGoldenAgePointsCost_1
			end
			
			Event_InstitutionOfTheHedKaldig.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_RESULT_1", iGoldenAgePointsCost)
			return true
		end
		)
	Event_InstitutionOfTheHedKaldig.Outcomes[1].DoFunc = (
		function(pPlayer)
			-- Golden Age cost
			local iGoldenAgePointsProgress = pPlayer:GetGoldenAgeProgressMeter()
			local iGoldenAgePointsCost_1 = math.ceil((iGoldenAgePointsProgress * 25) / 100 ) -- 25% of current Golden Age progress
			local iGoldenAgePointsCost_2 = 50
			local iGoldenAgePointsCost = 0
			-- determine cost. Calculation breakdown: x = 25% of current progress; min = 50 < x < 100 = max
			if iGoldenAgePointsCost_1 < iGoldenAgePointsCost_2 or iGoldenAgePointsCost_1 > 100 then 
				iGoldenAgePointsCost = iGoldenAgePointsCost_2
			else
				iGoldenAgePointsCost = iGoldenAgePointsCost_1
			end
			pPlayer:ChangeGoldenAgeProgressMeter(-iGoldenAgePointsCost)
			-- Spy reduction
			pPlayer:GetCapitalCity():SetNumRealBuilding(buildingDervishSpyDummyID, 1)
			--
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_RESULT_1_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG"))
			JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_RESULT_1"))
			save(pPlayer, "Event_InstitutionOfTheHedKaldig", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_InstitutionOfTheHedKaldig.Outcomes[2] = {}
	Event_InstitutionOfTheHedKaldig.Outcomes[2].Name = "TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_2"
	Event_InstitutionOfTheHedKaldig.Outcomes[2].Desc = "TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_RESULT_2"
	Event_InstitutionOfTheHedKaldig.Outcomes[2].Weight = 0
	Event_InstitutionOfTheHedKaldig.Outcomes[2].CanFunc = (
		function(pPlayer)	
			Event_InstitutionOfTheHedKaldig.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_RESULT_2")
			return true
		end
		)
	Event_InstitutionOfTheHedKaldig.Outcomes[2].DoFunc = (
		function(pPlayer) 
			-- nothing happens
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_RESULT_2_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG"))
			-- JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DMS_INSTITUTION_OF_THE_HED_KALDIG_OUTCOME_RESULT_2")) -- not really any idea in using this for this outcome
			save(pPlayer, "Event_InstitutionOfTheHedKaldig", true)
		end)
		
tEvents.Event_InstitutionOfTheHedKaldig = Event_InstitutionOfTheHedKaldig
Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_AOI_DERVISH"], "Event_InstitutionOfTheHedKaldig", Event_InstitutionOfTheHedKaldig)
--------------------------------------------------------------------------------------------------------------------------
--  The Foreign Letter
--------------------------------------------------------------------------------------------------------------------------
local Event_TheForeignLetter = {}
	Event_TheForeignLetter.Name = "TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER"
	Event_TheForeignLetter.Desc = "TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_DESC"
	Event_TheForeignLetter.tInfluence = {30, 40, 40, 50}
	Event_TheForeignLetter.Data1 = {}	-- temp CS table
	Event_TheForeignLetter.Data2 = nil	-- CS choice
	Event_TheForeignLetter.Data3 = nil	-- influence table
	Event_TheForeignLetter.Weight = 20
	Event_TheForeignLetter.CanFunc = (
		function(pPlayer)			
			if load(pPlayer, "Event_TheForeignLetter") == true				then return false end
			if pPlayer:GetCivilizationType() ~= civilisationID				then return false end
			if pPlayer:GetCurrentEra() <= eraRenaissanceID					then return false end -- can only happen after the renaissance
			if pPlayer:IsGoldenAge()										then return false end -- cannot happen when player is in Golden Age
			if pPlayer:GetGoldenAgeProgressMeter() < 100 					then return false end -- cannot happen when player has less than 200 Golden Age points
			-- player must have met at least one CS
			Event_TheForeignLetter.Data1 = {}
			for iCS, pCS in pairs(Players) do
				if (pCS:IsAlive() and pCS:IsMinorCiv() and Teams[pPlayer:GetTeam()]:IsHasMet(pCS:GetTeam()) and not(Teams[pPlayer:GetTeam()]:IsAtWar(pCS:GetTeam()))) then
					table.insert(Event_TheForeignLetter.Data1, pCS)
				end
			end
			if #Event_TheForeignLetter.Data1 < 1						then return false end
			-- choose CS
			Event_TheForeignLetter.Data2 = Event_TheForeignLetter.Data1[JFD_GetRandom(1, #Event_TheForeignLetter.Data1)]
			-- influence
			Event_TheForeignLetter.Data3 = Event_TheForeignLetter.tInfluence[JFD_GetRandom(1, #Event_TheForeignLetter.tInfluence)] 
			----------------------------------------
			Event_TheForeignLetter.Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_DESC", Event_TheForeignLetter.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_TheForeignLetter.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_TheForeignLetter.Outcomes[1] = {}
	Event_TheForeignLetter.Outcomes[1].Name = "TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_1"
	Event_TheForeignLetter.Outcomes[1].Desc = "TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_1"
	Event_TheForeignLetter.Outcomes[1].Weight = 15
	Event_TheForeignLetter.Outcomes[1].CanFunc = (
		function(pPlayer)	
			-- Golden Age gain
			local iGoldenAgePointsProgress = pPlayer:GetGoldenAgeProgressMeter()
			local iGoldenAgePointsGain_1 = math.ceil((iGoldenAgePointsProgress * 50) / 100 ) -- 50% of current Golden Age progress
			local iGoldenAgePointsGain_2 = 100 
			local iGoldenAgePointsGain = 0
			-- determine gain. If the 50% of current GA points is less than 100 points, choose gain to be 100. Otherwise, gain is 50%.
			if iGoldenAgePointsGain_1 < iGoldenAgePointsGain_2 or iGoldenAgePointsGain_1 > 200 then
				iGoldenAgePointsGain = iGoldenAgePointsGain_2
			else
				iGoldenAgePointsGain = iGoldenAgePointsGain_1
			end
			
			Event_TheForeignLetter.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_1", Event_TheForeignLetter.Data3, Event_TheForeignLetter.Data2:GetCivilizationShortDescription(), iGoldenAgePointsGain)
			return true
		end
		)
	Event_TheForeignLetter.Outcomes[1].DoFunc = (
		function(pPlayer)
			-- Golden Age gain
			local iGoldenAgePointsProgress = pPlayer:GetGoldenAgeProgressMeter()
			local iGoldenAgePointsGain_1 = math.ceil((iGoldenAgePointsProgress * 50) / 100 ) -- 50% of current Golden Age progress
			local iGoldenAgePointsGain_2 = 100 
			local iGoldenAgePointsGain = 0
			-- determine gain. If the 50% of current GA points is less than 100 points, choose gain to be 100. Otherwise, gain is 50%.
			if iGoldenAgePointsGain_1 < iGoldenAgePointsGain_2 or iGoldenAgePointsGain_1 > 200 then
				iGoldenAgePointsGain = iGoldenAgePointsGain_2
			else
				iGoldenAgePointsGain = iGoldenAgePointsGain_1
			end
			-- Golden age gain
			pPlayer:ChangeGoldenAgeProgressMeter(iGoldenAgePointsGain)
			 -- change influence
			Event_TheForeignLetter.Data2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), -Event_TheForeignLetter.Data3)
			
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_1_NOTIFICATION", Event_TheForeignLetter.Data2:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER"))
			JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_1"))
			save(pPlayer, "Event_TheForeignLetter", true)
		end)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_TheForeignLetter.Outcomes[2] = {}
	Event_TheForeignLetter.Outcomes[2].Name = "TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_2"
	Event_TheForeignLetter.Outcomes[2].Desc = "TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_2"
	Event_TheForeignLetter.Outcomes[2].Weight = 0
	Event_TheForeignLetter.Outcomes[2].CanFunc = (
		function(pPlayer)	
			-- Golden Age lost
			local iGoldenAgePointsProgress = pPlayer:GetGoldenAgeProgressMeter()
			local iGoldenAgePointsLost_1 = math.ceil((iGoldenAgePointsProgress * 25) / 100 ) -- 50% of current Golden Age progress
			local iGoldenAgePointsLost_2 = 100
			local iGoldenAgePointsLost = 0
			-- determine gain. If the 50% of current GA points is less than 100 points, choose gain to be 100. Otherwise, gain is 50%.
			if iGoldenAgePointsLost_1 < iGoldenAgePointsLost_2 or iGoldenAgePointsLost_1 > 200 then
				iGoldenAgePointsLost = iGoldenAgePointsLost_2
			else
				iGoldenAgePointsLost = iGoldenAgePointsLost_1
			end
			Event_TheForeignLetter.Outcomes[2].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_2", iGoldenAgePointsLost, Event_TheForeignLetter.Data3, Event_TheForeignLetter.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_TheForeignLetter.Outcomes[2].DoFunc = (
		function(pPlayer) 
			-- Golden Age lost
			local iGoldenAgePointsProgress = pPlayer:GetGoldenAgeProgressMeter()
			local iGoldenAgePointsLost_1 = math.ceil((iGoldenAgePointsProgress * 25) / 100 ) -- 50% of current Golden Age progress
			local iGoldenAgePointsLost_2 = 100
			local iGoldenAgePointsLost = 0
			-- determine gain. If the 50% of current GA points is less than 100 points, choose gain to be 100. Otherwise, gain is 50%.
			if iGoldenAgePointsLost_1 < iGoldenAgePointsLost_2 or iGoldenAgePointsLost_1 > 200 then
				iGoldenAgePointsLost = iGoldenAgePointsLost_2
			else
				iGoldenAgePointsLost = iGoldenAgePointsLost_1
			end
			-- Golden age gain
			pPlayer:ChangeGoldenAgeProgressMeter(-iGoldenAgePointsLost)
			 -- change influence
			Event_TheForeignLetter.Data2:ChangeMinorCivFriendshipWithMajor(pPlayer:GetID(), Event_TheForeignLetter.Data3)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_2_NOTIFICATION", Event_TheForeignLetter.Data2:GetCivilizationShortDescription()), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER"))
			JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_2", Event_TheForeignLetter.Data2:GetCivilizationShortDescription()))
			save(pPlayer, "Event_TheForeignLetter", true)
		end)
		
	--=========================================================
	-- Outcome 3
	--=========================================================
	Event_TheForeignLetter.Outcomes[3] = {}
	Event_TheForeignLetter.Outcomes[3].Name = "TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_3"
	Event_TheForeignLetter.Outcomes[3].Desc = "TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_3"
	Event_TheForeignLetter.Outcomes[3].Weight = 0
	Event_TheForeignLetter.Outcomes[3].CanFunc = (
		function(pPlayer)	
						
			Event_TheForeignLetter.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_3", Event_TheForeignLetter.Data2:GetCivilizationShortDescription())
			return true
		end
		)
	Event_TheForeignLetter.Outcomes[3].DoFunc = (
		function(pPlayer)
			
			JFD_SendNotification(pPlayer:GetID(), "NOTIFICATION_GENERIC", Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_3_NOTIFICATION"), Locale.ConvertTextKey("TXT_KEY_EVENT_DMS_THE_FOREIGN_LETTER"))
			--JFD_SendWorldEvent(pPlayer:GetID(), Locale.ConvertTextKey("TXT_KEY_WORLD_EVENT_DMS_THE_FOREIGN_LETTER_OUTCOME_RESULT_3"))
			save(pPlayer, "Event_TheForeignLetter", false)
		end)
		
tEvents.Event_TheForeignLetter = Event_TheForeignLetter

Events_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_AOI_DERVISH"], "Event_TheForeignLetter", Event_TheForeignLetter)
--=======================================================================================================================
--=======================================================================================================================
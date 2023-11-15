-- Zimbabwe Events
-- Author: Sukritact
--=======================================================================================================================

print("Zimbabwe Events: loaded")

-------------------------------------------------------------------------------------------------------------------------
-- UTILITIES
--------------------------------------------------------------------------------------------------------------------------
-- JFD_SendAllEvent
function JFD_SendAllEvent(iPlayer, iType, sDesc, sTitle)
	local pPlayer = Players[iPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	local pActivePlayer = Players[Game.GetActivePlayer()]
	if (not pPlayer:IsHuman()) and pTeam:IsHasMet(pActivePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], sDesc, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	elseif pPlayer == pActivePlayer then
		JFD_SendNotification(iPlayer, iType, sDesc, sTitle)
	end
end 
--=======================================================================================================================
-- EVENTS
--=======================================================================================================================
-- Zimbabwe: Rise of the Rozwi
-------------------------------------------------------------------------------------------------------------------------
local Event_ZimbabweRozwi = {}
	Event_ZimbabweRozwi.Name = "TXT_KEY_EVENT_ZIMBABWEROZWI"
	Event_ZimbabweRozwi.Desc = "TXT_KEY_EVENT_ZIMBABWEROZWI_DESC"
	Event_ZimbabweRozwi.EventImage = 'Event_Rozwi.dds'
	Event_ZimbabweRozwi.Weight = 100
	Event_ZimbabweRozwi.CanFunc = (
		function(pPlayer)
	    	if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_ZIMBABWE then return false end
	    	if load(pPlayer, "Event_ZimbabweRozwi") == true then return end

			local iEra = pPlayer:GetCurrentEra()
			if (iEra ~= GameInfoTypes.ERA_MEDIEVAL) and (iEra ~= GameInfoTypes.ERA_RENAISSANCE) then return end

			return true
		end
		)
	Event_ZimbabweRozwi.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ZimbabweRozwi.Outcomes[1] = {}
	Event_ZimbabweRozwi.Outcomes[1].Name = "TXT_KEY_EVENT_ZIMBABWEROZWI_OUTCOME_1"
	Event_ZimbabweRozwi.Outcomes[1].Desc = "TXT_KEY_EVENT_ZIMBABWEROZWI_OUTCOME_1_DESC"
	Event_ZimbabweRozwi.Outcomes[1].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_ZimbabweRozwi.Outcomes[1].DoFunc = (
		function(pPlayer)
			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes.POLICY_MC_ZIMBABWE_MOYO_EVENT, true)

			JFD_SendAllEvent(pPlayer:GetID(), "NOTIFICATION_GENERIC",
				Locale.ConvertTextKey("TXT_KEY_EVENT_ZIMBABWEROZWI_OUTCOME_1_NOTIFICATION", pPlayer:GetCivilizationDescription()),
				Locale.ConvertTextKey("TXT_KEY_EVENT_ZIMBABWEROZWI")
			)

			save(pPlayer, "Event_ZimbabweRozwi", true)
		end
		)
	
Events_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_ZIMBABWE, "Event_ZimbabweRozwi", Event_ZimbabweRozwi)
-------------------------------------------------------------------------------------------------------------------------
-- Zimbabwe: Foreigners Reject the Curva
-------------------------------------------------------------------------------------------------------------------------
local Event_ZimbabweCurva = {}
	Event_ZimbabweCurva.Name = "TXT_KEY_EVENT_ZIMBABWECURVA"
	Event_ZimbabweCurva.Desc = "TXT_KEY_EVENT_ZIMBABWECURVA_DESC"
	Event_ZimbabweCurva.EventImage = "Event_Curva.dds"
	Event_ZimbabweCurva.Weight = 50
	Event_ZimbabweCurva.CanFunc = (
		function(pPlayer)
	    	if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_ZIMBABWE then return false end
			if load(pPlayer, "Event_ZimbabweCurva") == true then return end

	    	local iUsedTradeRoutes = pPlayer:GetNumInternationalTradeRoutesUsed()
			if iUsedTradeRoutes < 3 then return end

			local iEra = pPlayer:GetCurrentEra()
			if (iEra < GameInfoTypes.ERA_MEDIEVAL) then return end

			return true
		end
		)
	Event_ZimbabweCurva.Outcomes = {}
	--=========================================================
	-- Outcome 1
	--=========================================================
	Event_ZimbabweCurva.Outcomes[1] = {}
	Event_ZimbabweCurva.Outcomes[1].Name = "TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_1"
	Event_ZimbabweCurva.Outcomes[1].Desc = "TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_1_DESC"
	Event_ZimbabweCurva.Outcomes[1].CanFunc = (
		function(pPlayer)

			local iUsedTradeRoutes = pPlayer:GetNumInternationalTradeRoutesUsed()
			local iReward = math.floor(iUsedTradeRoutes * 100 * iMod)

			Event_ZimbabweCurva.Outcomes[1].Desc = Locale.ConvertTextKey("TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_1_DESC", iReward)

			return true
		end
		)
	Event_ZimbabweCurva.Outcomes[1].DoFunc = (
		function(pPlayer)
			local iUsedTradeRoutes = pPlayer:GetNumInternationalTradeRoutesUsed()
			local iReward = math.floor(iUsedTradeRoutes * 100 * iMod)

			pPlayer:ChangeGold(iReward)

			JFD_SendAllEvent(pPlayer:GetID(), "NOTIFICATION_GENERIC",
				Locale.ConvertTextKey("TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_1_NOTIFICATION", pPlayer:GetCivilizationDescription()),
				Locale.ConvertTextKey("TXT_KEY_EVENT_ZIMBABWECURVA")
			)

			save(pPlayer, "Event_ZimbabweCurva", true)
		end
		)
	--=========================================================
	-- Outcome 2
	--=========================================================
	Event_ZimbabweCurva.Outcomes[2] = {}
	Event_ZimbabweCurva.Outcomes[2].Name = "TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_2"
	Event_ZimbabweCurva.Outcomes[2].Desc = "TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_2_DESC"
	Event_ZimbabweCurva.Outcomes[2].CanFunc = (
		function(pPlayer)
			return true
		end
		)
	Event_ZimbabweCurva.Outcomes[2].DoFunc = (
		function(pPlayer)
			JFD_SendAllEvent(pPlayer:GetID(), "NOTIFICATION_GENERIC",
				Locale.ConvertTextKey("TXT_KEY_EVENT_ZIMBABWECURVA_OUTCOME_2_NOTIFICATION", pPlayer:GetCivilizationDescription()),
				Locale.ConvertTextKey("TXT_KEY_EVENT_ZIMBABWECURVA")
			)

			save(pPlayer, "Event_ZimbabweCurva", true)
			Event_ZimbabweCurva.Outcomes[2].Monitors[GameEvents.PlayerDoTurn](pPlayer:GetID())
		end
		)
	Event_ZimbabweCurva.Outcomes[2].Monitors = {}
	Event_ZimbabweCurva.Outcomes[2].Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		pPlayer = Players[iPlayer]
		if not(load(pPlayer, "Event_ZimbabweCurva")) then return end

		for pCity in pPlayer:Cities() do
			pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_MC_CURVA, 1)
		end
	end
	)
	
Events_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_ZIMBABWE, "Event_ZimbabweCurva", Event_ZimbabweCurva)
--=======================================================================================================================
--=======================================================================================================================



-- DMS_Kasanje_Decisions
-- Author: DMS
--=======================================================================================================================
print("DMS's The Kingdom of Kasanje's Decisions: loaded")
--=======================================================================================================================
-- UTILITIES
--=======================================================================================================================
-- JFD_GetRandom
-------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
--------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 
-------------------------------------------------------------------------------------------------------------------------
-- JFD_SendWorldEvent
-------------------------------------------------------------------------------------------------------------------------
function JFD_SendWorldEvent(playerID, description)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	local activePlayer = Players[Game.GetActivePlayer()]
	if (not player:IsHuman()) and playerTeam:IsHasMet(activePlayer:GetTeam()) then
		Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes["NOTIFICATION_DIPLOMACY_DECLARATION"], description, "[COLOR_POSITIVE_TEXT]World Events[ENDCOLOR]", -1, -1)
	end
end 
-------------------------------------------------------------------------------------------------------------------------
-- JFD_SendNotification
-------------------------------------------------------------------------------------------------------------------------
function JFD_SendNotification(playerID, notificationType, description, descriptionShort, global, iX, iY)
	local player = Players[playerID]
	if global then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
	else
		if player:IsHuman() then
			Players[Game.GetActivePlayer()]:AddNotification(NotificationTypes[notificationType], description, descriptionShort, iX or -1, iY or -1)
		end
	end
end     
-------------------------------------------------------------------------------------------------------------------------
-- Globals
-------------------------------------------------------------------------------------------------------------------------
local civilisationKasanjeID					= GameInfoTypes["CIVILIZATION_DMS_KASANJE"]
local promotionKixilaLawsID					= GameInfoTypes["PROMOTION_DMS_KIXILA_LAWS"]
local eraRenaissanceID						= GameInfoTypes["ERA_RENAISSANCE"]
local buildingKixilaLawsDummyID				= GameInfoTypes["BUILDING_DMS_KIXILA_LAWS"]
--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Kasanje: Perform the Sangamento
-------------------------------------------------------------------------------------------------------------------------
local Decisions_PerformTheSangamento = {}
	Decisions_PerformTheSangamento.Name = "TXT_KEY_DECISIONS_DMS_SANGAMENTO"
	Decisions_PerformTheSangamento.Desc = "TXT_KEY_DECISIONS_DMS_SANGAMENTO_DESC"
	Decisions_PerformTheSangamento.Data1 = {}	
	Decisions_PerformTheSangamento.Data2 = nil
	HookDecisionCivilizationIcon(Decisions_PerformTheSangamento, "CIVILIZATION_DMS_KASANJE")
	Decisions_PerformTheSangamento.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= civilisationKasanjeID) then return false, false end
		local iEra = load(pPlayer, "Decisions_PerformTheSangamento")
		local iCurrentEra = pPlayer:GetCurrentEra()
		if iEra ~= nil then
			if iEra < iCurrentEra then
				save(pPlayer, "Decisions_PerformTheSangamento", nil)
			else
				Decisions_PerformTheSangamento.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_SANGAMENTO_ENACTED_DESC")
				return false, false, true
			end
		end
		
		local iFaithCost = JFD_GetEraAdjustedValue(pPlayer:GetID(), 50)
		local iCultureCost = JFD_GetEraAdjustedValue(pPlayer:GetID(), 75)
		Decisions_PerformTheSangamento.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_SANGAMENTO_DESC", iCultureCost, iFaithCost)

		Decisions_PerformTheSangamento.Data1 = {}
		for pUnit in pPlayer:Units() do
			if pUnit and pUnit:IsCombatUnit() then
				if (pUnit:GetUnitCombatType() == combatTypeReconID) or (pUnit:GetUnitCombatType() == combatTypeMeleeID) or (pUnit:GetUnitCombatType() == combatTypeMountedID) or (pUnit:GetUnitCombatType() == combatTypeGunID) then
					table.insert(Decisions_PerformTheSangamento.Data1, pUnit)
				end
			end
		end
		if #Decisions_PerformTheSangamento.Data1 < 1									then return true, false end

		if (pPlayer:GetFaith() < iFaithCost)											then return true, false end
		if (pPlayer:GetJONSCulture() < iCultureCost)									then return true, false end		
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1)					then return true, false end
		
		return true, true
	end
	)
	
	Decisions_PerformTheSangamento.DoFunc = (
	function(pPlayer)
		local iPlayer = pPlayer:GetID()
		local iFaithCost = JFD_GetEraAdjustedValue(pPlayer:GetID(), 50)
		local iCultureCost = JFD_GetEraAdjustedValue(pPlayer:GetID(), 75)
		pPlayer:ChangeJONSCulture(-iCultureCost)
		pPlayer:ChangeFaith(-iFaithCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)

		-- determine strongest units
		for k, v in pairs(Decisions_PerformTheSangamento.Data1) do
			if Decisions_PerformTheSangamento.Data2 == nil then
				Decisions_PerformTheSangamento.Data2 = v
			elseif Decisions_PerformTheSangamento.Data2 ~= nil then
				if v:GetLevel() >= Decisions_PerformTheSangamento.Data2:GetLevel() then
					Decisions_PerformTheSangamento.Data2 = v
				elseif v:GetLevel() == Decisions_PerformTheSangamento.Data2:GetLevel() and v:GetExperience() >= Decisions_PerformTheSangamento.Data2:GetExperience() then
					Decisions_PerformTheSangamento.Data2 = v
				end
			end
		end
		Decisions_PerformTheSangamento.Data2:ChangeExperience(30)
		
		save(pPlayer, "Decisions_PerformTheSangamento", pPlayer:GetCurrentEra())
	end
	)
		
Decisions_AddCivilisationSpecific(civilisationKasanjeID, "Decisions_PerformTheSangamento", Decisions_PerformTheSangamento)
-------------------------------------------------------------------------------------------------------------------------
-- Kasanje: The Kixila Laws
-------------------------------------------------------------------------------------------------------------------------
local Decisions_TheKixilaLaws = {}
	Decisions_TheKixilaLaws.Name = "TXT_KEY_DECISIONS_DMS_KIXILA_LAWS"
	Decisions_TheKixilaLaws.Desc = "TXT_KEY_DECISIONS_DMS_KIXILA_LAWS_DESC"
	HookDecisionCivilizationIcon(Decisions_TheKixilaLaws, "CIVILIZATION_DMS_KASANJE")
	Decisions_TheKixilaLaws.CanFunc = (
	function(pPlayer)
		if (pPlayer:GetCivilizationType() ~= civilisationKasanjeID) then return false, false end
		if load(pPlayer, "Decisions_TheKixilaLaws") == true then
			Decisions_TheKixilaLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_KIXILA_LAWS_ENACTED_DESC")
			return false, false, true 
		end
		
		local iNumCapturedCities = 0
		for pCity in pPlayer:Cities() do
			if pCity and pCity:GetOriginalOwner() ~= pPlayer:GetID() then
				iNumCapturedCities = iNumCapturedCities + 1
			end
		end
		local iNumKilledCitizens = 3 + iNumCapturedCities
		Decisions_TheKixilaLaws.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_DMS_KIXILA_LAWS_DESC", iNumKilledCitizens)

		local pCapital = pPlayer:GetCapitalCity()
		if (pCapital == nil)														then return true, false end
		if pCapital:GetPopulation() < 4												then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1)				then return true, false end
		if iNumCapturedCities < 3													then return true, false end
		

		return true, true
	end
	)
	
	Decisions_TheKixilaLaws.DoFunc = (
	function(pPlayer)

		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		for pUnit in pPlayer:Units() do
			if pUnit and pUnit:IsCombatUnit() then
				pUnit:SetHasPromotion(promotionKixilaLawsID, true)
			end
		end
		local pCapital = pPlayer:GetCapitalCity()
		pCapital:ChangePopulation(-3, 0)
		for pCity in pPlayer:Cities() do
			if pCity and pCity:GetOriginalOwner() ~= pPlayer:GetID() then
				pCity:ChangePopulation(-1, 0)
			end
		end
		
		save(pPlayer, "Decisions_TheKixilaLaws", true)
	end
	)

	
	Decisions_TheKixilaLaws.Monitors = {}
	Decisions_TheKixilaLaws.Monitors[GameEvents.PlayerDoTurn] =  (
	function(iPlayer)
		local pPlayer = Players[iPlayer]
		if (pPlayer:GetCivilizationType() ~= civilisationKasanjeID) then return end
		if load(pPlayer, "Decisions_TheKixilaLaws") == true then
			local pTeam = Teams[pPlayer:GetTeam()]
			if pTeam:GetAtWarCount(true) == 1 then
				local pCapital = pPlayer:GetCapitalCity()
				if pCapital then
					if (not pCapital:IsHasBuilding(buildingKixilaLawsDummyID)) then
						pCapital:SetNumRealBuilding(buildingKixilaLawsDummyID, 1)
					end
				end
			elseif pTeam:GetAtWarCount(true) == 0 then
				local pCapital = pPlayer:GetCapitalCity()
				if pCapital then
					if pCapital:IsHasBuilding(buildingKixilaLawsDummyID) then
						pCapital:SetNumRealBuilding(buildingKixilaLawsDummyID, 0)
					end
				end
			end
		end
	end
	)
		
Decisions_AddCivilisationSpecific(civilisationKasanjeID, "Decisions_TheKixilaLaws", Decisions_TheKixilaLaws)
--=======================================================================================================================
--=======================================================================================================================
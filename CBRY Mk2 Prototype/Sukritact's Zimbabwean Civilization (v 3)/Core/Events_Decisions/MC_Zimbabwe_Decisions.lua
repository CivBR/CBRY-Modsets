-- Zimbabwe Decisions
-- Author: Sukritact
--=======================================================================================================================

print("Zimbabwe Decisions: loaded")

--=======================================================================================================================
-- Civ Specific Decisions
--=======================================================================================================================
-- Zimbabwe: Embrace Mapungubwe Masonry
-------------------------------------------------------------------------------------------------------------------------
local Decisions_ZimbabweMasonry = {}
	Decisions_ZimbabweMasonry.Name = "TXT_KEY_DECISIONS_ZIMBABWEMASONRY"
	Decisions_ZimbabweMasonry.Desc = "TXT_KEY_DECISIONS_ZIMBABWEMASONRY_DESC"
	HookDecisionCivilizationIcon(Decisions_ZimbabweMasonry, "CIVILIZATION_MC_ZIMBABWE")
	Decisions_ZimbabweMasonry.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_ZIMBABWE then return false, false end
		if load(pPlayer, "Decisions_ZimbabweMasonry") == true then
			Decisions_ZimbabweMasonry.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZIMBABWEMASONRY_ENACTED_DESC")
			return false, false, true
		end

		local iCost = math.ceil(250) * iMod
		Decisions_ZimbabweMasonry.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZIMBABWEMASONRY_DESC", iCost)

		if (pPlayer:GetJONSCulture() < iCost) then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end
		if not(Teams[pPlayer:GetTeam()]:IsHasTech(GameInfoTypes.TECH_MASONRY)) then return true, false end

		return true, true
	end
	)
	
	Decisions_ZimbabweMasonry.DoFunc = (
	function(pPlayer)
		local iCost = math.ceil(250) * iMod
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		pPlayer:ChangeJONSCulture(-iCost)

		pPlayer:SetNumFreePolicies(1)
		pPlayer:SetNumFreePolicies(0)
		pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_ZIMBABWEMASONRY, true)

		save(pPlayer, "Decisions_ZimbabweMasonry", true)
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_ZIMBABWE, "Decisions_ZimbabweMasonry", Decisions_ZimbabweMasonry)
-------------------------------------------------------------------------------------------------------------------------
-- Zimbabwe: Finance an expedition for {1}
-------------------------------------------------------------------------------------------------------------------------
-- Sort resources to give
--------------------------------------------------------------
local tValidLuxuries = {
	RESOURCE_SALT = true,
	RESOURCE_COPPER = true,
	RESOURCE_GEMS = true,
	RESOURCE_GOLD = true,
	RESOURCE_IVORY = true,
	RESOURCE_MARBLE = true,
	RESOURCE_SILVER = true,
	RESOURCE_SPICES = true,
	RESOURCE_COTTON = true,
	RESOURCE_JFD_OBSIDIAN = true,
	RESOURCE_COFFEE = true,
	RESOURCE_AMBER = true,
	RESOURCE_LAPIS = true,
}
local tLuxuries = {}
for tRow in GameInfo.Resources() do
	if tValidLuxuries[tRow.Type] then
		local tResource = {
			ID				= tRow.ID,
			Type			= tRow.Type,
			Description		= Locale.ConvertTextKey(tRow.Description),
			IconString		= tRow.IconString,
			Count			= Map.GetNumResources(tRow.ID)
		}
		table.insert(tLuxuries, tResource)
	end
end
table.sort(tLuxuries, function(tA, tB)
	if tA.Count == tB.Count then
		if tA.Type == "RESOURCE_SALT" then 
			return true
		elseif tB.Type == "RESOURCE_SALT" then
			return false
		end
	end

	return tA.Count < tB.Count
end)
--------------------------------------------------------------
-- Sukritact_PlaceResource
--------------------------------------------------------------
iRadius = 3
tValidFeatures = {
	[GameInfoTypes.FEATURE_FOREST] = true,
	[GameInfoTypes.FEATURE_JUNGLE] = true,
	[GameInfoTypes.FEATURE_MARSH] = true,
	[GameInfoTypes.FEATURE_FLOOD_PLAINS] = true,
	[GameInfoTypes.FEATURE_FALLOUT] = true,
	[-1] = true
}

function Sukritact_PlaceResource(pCity, iResourceToPlace)
	local iOwner = pCity:GetOwner()
    local pPlot = pCity:Plot()
    local tPlots = {}
    local iNumtoPlace = 5
    for pLoopPlot in PlotAreaSpiralIterator(pPlot, iRadius, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
        table.insert(tPlots, pLoopPlot)
    end
	
    for iVal = 1, iNumtoPlace do
		local bPlaced = false
		while (not(bPlaced)) and #tPlots > 0 do
			local iRandom = GetRandom(1, #tPlots)
			local pPlot = tPlots[iRandom]

			local iOwnerP = pPlot:GetOwner()
			--local iTerrain = pPlot:GetTerrainType()
			local iResource = pPlot:GetResourceType()
			--local iImprovement = pPlot:GetImprovementType()
			local iFeature = pPlot:GetFeatureType()

			if (iResource == -1) and not(pPlot:IsMountain()) and not(pPlot:IsWater()) and tValidFeatures[iFeature] and (iOwnerP == iOwner or iOwnerP == -1) then
				pPlot:SetResourceType(iResourceToPlace, 1)
				bPlaced = true

				if iOwner == Game.GetActivePlayer() then
					local sTitle = Locale.ConvertTextKey('TXT_KEY_NOTIFICATION_FOUND_RESOURCE', tLuxuries[1].Description)
					local sDesc = Locale.ConvertTextKey('TXT_KEY_NOTIFICATION_SUMMARY_FOUND_RESOURCE', tLuxuries[1].Description)
					pPlayer:AddNotification(NotificationTypes.NOTIFICATION_DISCOVERED_BONUS_RESOURCE, sDesc, sTitle, pPlot:GetX(), pPlot:GetY(), iResourceToPlace, -1)
				end
			end
			
			table.remove(tPlots, iRandom)
		end
	end
end
--------------------------------------------------------------
-- Decision
--------------------------------------------------------------
local Decisions_ZimbabweMutapa = {}
	Decisions_ZimbabweMutapa.Name = "TXT_KEY_DECISIONS_ZIMBABWEMUTAPA"
	Decisions_ZimbabweMutapa.Desc = "TXT_KEY_DECISIONS_ZIMBABWEMUTAPA_DESC"
	HookDecisionCivilizationIcon(Decisions_ZimbabweMutapa, "CIVILIZATION_MC_ZIMBABWE")
	Decisions_ZimbabweMutapa.CanFunc = (
	function(pPlayer)
		if pPlayer:GetCivilizationType() ~= GameInfoTypes.CIVILIZATION_MC_ZIMBABWE then return false, false end

		Decisions_ZimbabweMutapa.Name = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZIMBABWEMUTAPA", tLuxuries[1].Description)
		if load(pPlayer, "Decisions_ZimbabweMutapa") == true then
			Decisions_ZimbabweMutapa.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZIMBABWEMUTAPA_ENACTED_DESC", tLuxuries[1].Description, tLuxuries[1].IconString)
			return false, false, true
		end

		local iOfficial = iMagistrate
		local sOfficial = "[ICON_MAGISTRATES] Magistrates"
		if GameInfoTypes.RESOURCE_JFD_DIGNITARIES ~= nil then
			iOfficial = GameInfoTypes.RESOURCE_JFD_DIGNITARIES
			sOfficial = "[ICON_JFD_DIGNITARY] Dignitaries"
		end
		local iCost = math.ceil(500 * iMod)

		Decisions_ZimbabweMutapa.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_ZIMBABWEMUTAPA_DESC", tLuxuries[1].Description, iCost, sOfficial, tLuxuries[1].IconString)

		if (pPlayer:GetGold() < iCost) then return true, false end
		if pPlayer:GetNumResourceAvailable(iOfficial, false) < 2 then return true, false end
		if not(pPlayer:GetCapitalCity()) then return true, false end

		local iEra = pPlayer:GetCurrentEra()
		if iEra > GameInfoTypes.ERA_MEDIEVAL then return true, false end

		return true, true
	end
	)
	
	Decisions_ZimbabweMutapa.DoFunc = (
	function(pPlayer)

		local iOfficial = iMagistrate
		if GameInfoTypes.RESOURCE_JFD_DIGNITARIES ~= nil then
			iOfficial = GameInfoTypes.RESOURCE_JFD_DIGNITARIES
		end
		local iCost = math.ceil(500 * iMod)

		pPlayer:ChangeNumResourceTotal(iOfficial, -2)
		pPlayer:ChangeGold(-iCost)

		tUnit = InitUnitFromCity(pPlayer:GetCapitalCity(), GameInfoTypes.UNIT_SETTLER, 1)
		tUnit[1]:SetName("Nyatsimba Mutota")

		save(pPlayer, "Decisions_ZimbabweMutapa", true)
		save(pPlayer, "bDecisions_ZimbabweMutapa", true)
	end
	)

	Decisions_ZimbabweMutapa.Monitors = {}
	Decisions_ZimbabweMutapa.Monitors[GameEvents.PlayerCityFounded] = (
	function(iPlayer, iCityX, iCityY)

		local pPlayer = Players[iPlayer]
		local pPlot = Map.GetPlot(iCityX, iCityY)
		local pCity = pPlot:GetPlotCity()
		
		if load(pPlayer, "bDecisions_ZimbabweMutapa") == true then
			Sukritact_PlaceResource(pCity, tLuxuries[1].ID)
			
			PreGame.SetCivilizationAdjective(iPlayer, Locale.ConvertTextKey("TXT_KEY_CIV_MC_MUTAPA_ADJECTIVE"))
			PreGame.SetCivilizationDescription(iPlayer, Locale.ConvertTextKey("TXT_KEY_CIV_MC_MUTAPA_DESC"))
			PreGame.SetCivilizationShortDescription(iPlayer, Locale.ConvertTextKey("TXT_KEY_CIV_MC_MUTAPA_SHORT_DESC"))

			pPlayer:SetNumFreePolicies(1)
			pPlayer:SetNumFreePolicies(0)
			pPlayer:SetHasPolicy(GameInfoTypes.POLICY_DECISIONS_ZIMBABWEMUTAPA, true)

			save(pPlayer, "bDecisions_ZimbabweMutapa", false)
		end
	end
	)
	
Decisions_AddCivilisationSpecific(GameInfoTypes.CIVILIZATION_MC_ZIMBABWE, "Decisions_ZimbabweMutapa", Decisions_ZimbabweMutapa)
--=======================================================================================================================
--=======================================================================================================================
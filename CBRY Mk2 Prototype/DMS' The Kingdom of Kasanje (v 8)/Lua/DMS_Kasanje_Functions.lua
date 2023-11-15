-- DMS_Kasanje_Functions
-- Author: DMS
--==========================================================================================================================
-- includes
--==========================================================================================================================
include("PlotIterators.lua")
include("JFD_CID_Misc_Utils.lua")
include("JFD_PIT_ProgressUtils.lua")
--==========================================================================================================================
-- USER SETTINGS
--==========================================================================================================================
-- DMS_GetUserSetting (adapted from JFD's JFD_GetUserSetting - credit goes there!)
----------------------------------------------------------------------------------------------------------------------------
function DMS_GetUserSetting(type)
	for row in GameInfo.DMS_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
----------------------------------------------------------------------------------------------------------------------------
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end

local userSettingBuildCharges				= JFD_GetUserSetting("JFD_CID_MISC_BUILD_CHARGES") == 1
--local userSettingBuildCharges				= JFD_GetUserSetting("JFD_PIT_PROGRESS_BUILD_CHARGES") == 1 (for when JFDLC is updated)
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
local bPrintForDebug = DMS_GetUserSetting("DMS_KASANJE_DEBUGGING_ON") == 1

function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_IsCivilisationActive
----------------------------------------------------------------------------------------------------------------------------
function JFD_IsCivilisationActive(civilisationID)
	for iSlot = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
		local slotStatus = PreGame.GetSlotStatus(iSlot)
		if (slotStatus == SlotStatus["SS_TAKEN"] or slotStatus == SlotStatus["SS_COMPUTER"]) then
			if PreGame.GetCivilization(iSlot) == civilisationID then
				return true
			end
		end
	end

	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- JFD_GetRandom
--------------------------------------------------------------------------------------------------------------------------
function JFD_GetRandom(lower, upper)
    return Game.Rand((upper + 1) - lower, "") + lower
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_SendNotification
------------------------------------------------------------------------------------------------------------------------
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
----------------------------------------------------------------------------------------------------------------------------
-- DMS_IsUsingEE
----------------------------------------------------------------------------------------------------------------------------
function DMS_IsUsingEE()
	local EEModID = "ce8aa614-7ef7-4a45-a179-5329869e8d6d"
	local isUsingEE = false
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == EEModID) then
			isUsingEE = true
			break
		end
	end
	return isUsingEE
end 
----------------------------------------------------------------------------------------------------------------------------
--IsCPDLL
----------------------------------------------------------------------------------------------------------------------------
function IsCPDLL()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "d1b6328c-ff44-4b0d-aad7-c657f83610cd" then
			return true
		end
	end
	return false
end
local isCPDLL = IsCPDLL()
----------------------------------------------------------------------------------------------------------------------------
--IsUsingCiD
----------------------------------------------------------------------------------------------------------------------------
function IsUsingCiD()
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if mod.ID == "10e9728f-d61c-4317-be4f-7d52d6bae6f4" then
			return true
		end
	end
	return false
end
local isUsingCiD = IsUsingCiD()
----------------------------------------------------------------------------------------------------------------------------
--HasTrait
----------------------------------------------------------------------------------------------------------------------------
function HasTrait(player, traitID)
	if isCPDLL then 
		return player:HasTrait(traitID)
	else
		local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
		local traitType  = GameInfo.Traits[traitID].Type
		for row in GameInfo.Leader_Traits("LeaderType = '" .. leaderType .. "' AND TraitType = '" .. traitType .. "'") do
			return true
		end
	end
	return false
end
----------------------------------------------------------------------------------------------------------------------------
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID 						= Game.GetActivePlayer()
local activePlayer 							= Players[activePlayerID]
local activePlayerTeam 						= Teams[Game.GetActiveTeam()]
local civilisationKasanjeID					= GameInfoTypes["CIVILIZATION_DMS_KASANJE"]
local isKasanjeCivActive 					= JFD_IsCivilisationActive(civilisationKasanjeID)
local isKasanjeActivePlayer 				= activePlayer:GetCivilizationType() == civilisationKasanjeID
-- unique components 
local traitKilomboID						= GameInfoTypes["TRAIT_DMS_KILOMBO"]
local unitMavala3UsesID						= GameInfoTypes["UNIT_DMS_MAVALA_3_USES"]
local unitMavala2UsesID						= GameInfoTypes["UNIT_DMS_MAVALA_2_USES"]
local unitMavala1UsesID						= GameInfoTypes["UNIT_DMS_MAVALA_1_USES"]
local unitGonzoID							= GameInfoTypes["UNIT_DMS_GONZO"]
local unitWorkerID							= GameInfoTypes["UNIT_WORKER"]
local promotionYijilaID						= GameInfoTypes["PROMOTION_DMS_YIJILA"]
local promotionYijigo3UsesID				= GameInfoTypes["PROMOTION_DMS_YIJIGO_3_USES"]
local promotionYijigo2UsesID				= GameInfoTypes["PROMOTION_DMS_YIJIGO_2_USES"]
local promotionYijigo1UsesID				= GameInfoTypes["PROMOTION_DMS_YIJIGO_1_USES"]
local buildingCitizenDummyID				= GameInfoTypes["BUILDING_DMS_CITIZEN_MAVALA"]
local featureJungleID						= GameInfoTypes["FEATURE_JUNGLE"]

buildingMonumentID							= GameInfoTypes["BUILDING_MONUMENT"]
buildingOperaHouseID						= GameInfoTypes["BUILDING_OPERA_HOUSE"]
buildingMuseumID							= GameInfoTypes["BUILDING_MUSEUM"]
buildingBroadcastTowerID					= GameInfoTypes["BUILDING_BROADCAST_TOWER"]
buildingHeroicEpicID						= GameInfoTypes["BUILDING_HEROIC_EPIC"]
buildingNationalCollageID					= GameInfoTypes["BUILDING_NATIONAL_COLLEGE"]
buildingNationalEpicID						= GameInfoTypes["BUILDING_NATIONAL_EPIC"]
buildingCircusMaximusID						= GameInfoTypes["BUILDING_CIRCUS_MAXIMUS"]
buildingOxfordUniversityID					= GameInfoTypes["BUILDING_OXFORD_UNIVERSITY"]
buildingHermitageID							= GameInfoTypes["BUILDING_HERMITAGE"]
buildingGreatLighthouseID					= GameInfoTypes["BUILDING_GREAT_LIGHTHOUSE"]
buildingGreatLibraryID						= GameInfoTypes["BUILDING_GREAT_LIBRARY"]
buildingPyramidID							= GameInfoTypes["BUILDING_PYRAMID"]
buildingColossusID							= GameInfoTypes["BUILDING_COLOSSUS"]
buildingOracleID							= GameInfoTypes["BUILDING_ORACLE"]
buildingHangingGardensID					= GameInfoTypes["BUILDING_HANGING_GARDEN"]
buildingGreatWallID							= GameInfoTypes["BUILDING_GREAT_WALL"]
buildingAngkorWatID							= GameInfoTypes["BUILDING_ANGKOR_WAT"]
buildingChichenItzaID						= GameInfoTypes["BUILDING_CHICHEN_ITZA"]
buildingPorcelainTowerID					= GameInfoTypes["BUILDING_PORCELAIN_TOWER"]
buildingHimejiCastleID						= GameInfoTypes["BUILDING_HIMEJI_CASTLE"]
buildingSistineChapelID						= GameInfoTypes["BUILDING_SISTINE_CHAPEL"]
buildingKremlinID							= GameInfoTypes["BUILDING_KREMLIN"]
buildingForbiddenPalaceID					= GameInfoTypes["BUILDING_FORBIDDEN_PALACE"]
buildingTajMahalID							= GameInfoTypes["BUILDING_TAJ_MAHAL"]
buildingBuildingBigBenID					= GameInfoTypes["BUILDING_BIG_BEN"]
buildingLouvreID							= GameInfoTypes["BUILDING_LOUVRE"]
buildingBrandenburgGateID					= GameInfoTypes["BUILDING_BRANDENBURG_GATE"]
buildingStatueOfLibertyID					= GameInfoTypes["BUILDING_STATUE_OF_LIBERTY"]
buildingEiffelTowerID						= GameInfoTypes["BUILDING_EIFFEL_TOWER"]
buildingPentagonID							= GameInfoTypes["BUILDING_PENTAGON"]
buildingUnitedNationsID						= GameInfoTypes["BUILDING_UNITED_NATIONS"]
buildingMonasteryID							= GameInfoTypes["BUILDING_MONASTERY"]
buildingCristoRedentorID					= GameInfoTypes["BUILDING_CRISTO_REDENTOR"]

buildingUffiziID							= GameInfoTypes["BUILDING_UFFIZI"]
buildingGlobeTheaterID						= GameInfoTypes["BUILDING_GLOBE_THEATER"]
buildingBroadwayID							= GameInfoTypes["BUILDING_BROADWAY"]
buildingParthenonID							= GameInfoTypes["BUILDING_PARTHENON"]
buildingRedFortID							= GameInfoTypes["BUILDING_RED_FORT"]
buildingStateZeusID							= GameInfoTypes["BUILDING_STATUE_ZEUS"]
buildingAmphitheaterID						= GameInfoTypes["BUILDING_AMPHITHEATER"]
buildingCathedralID							= GameInfoTypes["BUILDING_CATHEDRAL"]
buildingLeaningTowerID						= GameInfoTypes["BUILDING_LEANING_TOWER"]
buildingAlhambraID							= GameInfoTypes["BUILDING_ALHAMBRA"]
buildingMosqueOfDjenneID					= GameInfoTypes["BUILDING_MOSQUE_OF_DJENNE"]
buildingNeuschwansteinID					= GameInfoTypes["BUILDING_NEUSCHWANSTEIN"]
buildingPetraID								= GameInfoTypes["BUILDING_PETRA"]
buildingTempleOfArtemisID					= GameInfoTypes["BUILDING_TEMPLE_ARTEMIS"]

local isUsingEE = DMS_IsUsingEE()
 if isUsingEE then
	buildingCoffeeHouseID					= GameInfoTypes["BUILDING_COFFEE_HOUSE"]
	buildingTheatreID						= GameInfoTypes["BUILDING_THEATRE"]
	buildingGalleryID						= GameInfoTypes["BUILDING_EE_GALLERY"]
	buildingManorID							= GameInfoTypes["BUILDING_EE_MANOR"]
	buildingSalonID							= GameInfoTypes["BUILDING_EE_SALON"]
end

if isKasanjeCivActive then
	print("Kasanje Kalunga Ka Kinguri of the Imbangala joins the game!")
end
--==========================================================================================================================
-- MAIN FUNCTIONS	
--==========================================================================================================================
-- DMS_CultureBuildingMavala
----------------------------------------------------------------------------------------------------------------------------
function DMS_CultureBuildingMavala(iPlayer, iCity, iBuildingType, bGold, bFaithOrCulture)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitKilomboID) then
		local pCity = pPlayer:GetCityByID(iCity)
		--if pCity and pCity:IsCapital() then -- only Capital
		if pCity then -- all cities
			local bBuildingIsCapital = false
			local bBuildingIsCity = false
			if (iBuildingType == buildingMonumentID) or (iBuildingType == buildingOperaHouseID) or (iBuildingType == buildingMuseumID) or (iBuildingType == buildingBroadcastTowerID) or (iBuildingType == buildingHeroicEpicID) or (iBuildingType == buildingNationalCollageID) or (iBuildingType == buildingNationalEpicID) or (iBuildingType == buildingCircusMaximusID) or (iBuildingType == buildingOxfordUniversityID) or (iBuildingType == buildingHermitageID) or (iBuildingType == buildingGreatLighthouseID) or (iBuildingType == buildingGreatLibraryID) or (iBuildingType == buildingPyramidID) or (iBuildingType == buildingColossusID) or (iBuildingType == buildingOracleID) or (iBuildingType == buildingHangingGardensID) or (iBuildingType == buildingGreatWallID) or (iBuildingType == buildingAngkorWatID) or (iBuildingType == buildingChichenItzaID) or (iBuildingType == buildingPorcelainTowerID) or (iBuildingType == buildingHimejiCastleID) or (iBuildingType == buildingSistineChapelID) or (iBuildingType == buildingKremlinID) or (iBuildingType == buildingForbiddenPalaceID) or (iBuildingType == buildingTajMahalID) or 	(iBuildingType == buildingBuildingBigBenID) or (iBuildingType == buildingChichenItzaID) or (iBuildingType == buildingPorcelainTowerID) or (iBuildingType == buildingHimejiCastleID) or (iBuildingType == buildingSistineChapelID) or (iBuildingType == buildingKremlinID) or (iBuildingType == buildingForbiddenPalaceID) or (iBuildingType == buildingTajMahalID) or (iBuildingType == buildingBuildingBigBenID) or (iBuildingType == buildingLouvreID) or (iBuildingType == buildingBrandenburgGateID) or (iBuildingType == buildingStatueOfLibertyID) or (iBuildingType == buildingEiffelTowerID) or (iBuildingType == buildingPentagonID) or (iBuildingType == buildingMonasteryID) or (iBuildingType == buildingCristoRedentorID) or (iBuildingType == buildingUffiziID) or (iBuildingType == buildingGlobeTheaterID) or (iBuildingType == buildingBroadwayID) or (iBuildingType == buildingParthenonID) or (iBuildingType == buildingRedFortID) or (iBuildingType == buildingStateZeusID) or (iBuildingType == buildingAmphitheaterID) or (iBuildingType == buildingCathedralID) or (iBuildingType == buildingLeaningTowerID) or (iBuildingType == buildingAlhambraID) or (iBuildingType == buildingMosqueOfDjenneID) or (iBuildingType == buildingNeuschwansteinID) or (iBuildingType == buildingPetraID) or (iBuildingType == buildingTempleOfArtemisID) then
				if pCity:IsCapital() then
					bBuildingIsCapital = true
				else
					bBuildingIsCity = true
				end
			end
			if isUsingEE then
				if (iBuildingType == buildingCoffeeHouseID) or (iBuildingType == buildingTheatreID) or (iBuildingType == buildingGalleryID) or (iBuildingType == buildingManorID) or (iBuildingType == buildingSalonID) then
					if pCity:IsCapital() then
						bBuildingIsCapital = true
					else
						bBuildingIsCity = true
					end
				end
			end
			if bBuildingIsCapital == true then
				--pPlayer:InitUnit(unitMavala2UsesID, pCity:Plot():GetX(), pCity:Plot():GetY())
				--pPlayer:InitUnit(unitMavala2UsesID, pCity:Plot():GetX(), pCity:Plot():GetY())
				pPlayer:InitUnit(unitMavala3UsesID, pCity:Plot():GetX(), pCity:Plot():GetY())
				pPlayer:InitUnit(unitMavala3UsesID, pCity:Plot():GetX(), pCity:Plot():GetY())
			elseif bBuildingIsCity == true then
				--pPlayer:InitUnit(unitMavala2UsesID, pCity:Plot():GetX(), pCity:Plot():GetY())
				pPlayer:InitUnit(unitMavala3UsesID, pCity:Plot():GetX(), pCity:Plot():GetY())
			end
		end
	end
end

GameEvents.CityConstructed.Add(DMS_CultureBuildingMavala)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_CitizenBornMavala
----------------------------------------------------------------------------------------------------------------------------
function DMS_CitizenBornMavala(iX, iY, oldPopulation, newPopulation)
		if newPopulation > oldPopulation then
		local pPlot = Map.GetPlot(iX, iY) 
		if pPlot then
			local pCity = pPlot:GetPlotCity()
			if pCity then
				local iOwner = pCity:GetOwner()
				local pOwner = Players[iOwner]
				if HasTrait(pOwner, traitKilomboID) then
					if pCity:GetOriginalOwner() ~= iOwner then
						local iNumCitizenDummyBuilding = pCity:GetNumRealBuilding(buildingCitizenDummyID)
						local iNumCurrentMavala = 0
						for pUnit in pOwner:Units() do
							if pUnit and (pUnit:GetUnitType() == unitMavala3UsesID) or (pUnit:GetUnitType() == unitMavala2UsesID) or (pUnit:GetUnitType() == unitMavala1UsesID) then
								iNumCurrentMavala = iNumCurrentMavala + 1
							end
						end
						local iNumCities = pOwner:GetNumCities()
						if iNumCitizenDummyBuilding == 0 then
							pOwner:InitUnit(unitMavala3UsesID, pCity:Plot():GetX(), pCity:Plot():GetY())
						elseif iNumCitizenDummyBuilding > 0 then
							if iNumCurrentMavala <= (iNumCities * 3) then
								if math.fmod(iNumCitizenDummyBuilding, 2) == 0 then
									pOwner:InitUnit(unitMavala3UsesID, pCity:Plot():GetX(), pCity:Plot():GetY())
								end
							end
						end
						pCity:SetNumRealBuilding(buildingCitizenDummyID, iNumCitizenDummyBuilding + 1)
					end
				end
			end
		end
	end
end

GameEvents.SetPopulation.Add(DMS_CitizenBornMavala)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_TradeRouteCapturedCity
----------------------------------------------------------------------------------------------------------------------------
function DMS_TradeRouteCapturedCity(iPlayer)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitKilomboID) then
		local routes = pPlayer:GetTradeRoutes()
		for i,v in ipairs(routes) do
            if v.FromCity:GetOwner() == iPlayer then
				if v.FromCity:GetOriginalOwner() ~= iPlayer then
					pPlayer:ChangeGold(8)
				end
            end
        end
	end
end

GameEvents.PlayerDoTurn.Add(DMS_TradeRouteCapturedCity)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GonzoHealCityCapture
----------------------------------------------------------------------------------------------------------------------------
function DMS_GonzoHealCityCapture(iOldPlayer, bCapital, iX, iY, iNewPlayer, conquest, conquest2)
	local pPlayer = Players[iNewPlayer]
	local pTeam = Teams[pPlayer:GetTeam()]
	if HasTrait(pPlayer, traitKilomboID) then
		local pOldPlayer = Players[iOldPlayer]
		if pOldPlayer and pOldPlayer:GetCivilizationType() ~= civilisationKasanjeID then
			local pCityPlot = Map.GetPlot(iX, iY)
			for i = 0, pCityPlot:GetNumUnits() - 1 do
                local pUnit = pCityPlot:GetUnit(i)
                if pUnit and pUnit:IsHasPromotion(promotionYijilaID) then
					local iUnitDamage = pUnit:GetDamage()
					if iUnitDamage > 0 then
						pUnit:ChangeDamage(-iUnitDamage)
					end
                end
            end
		end
	end
end

--if isKasanjeCivActive then
--	GameEvents.CityCaptureComplete.Add(DMS_GonzoHealCityCapture)
--end
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GonzoExperienceCitizenBorn
----------------------------------------------------------------------------------------------------------------------------
function DMS_GonzoExperienceCitizenBorn(iX, iY, oldPopulation, newPopulation)
		if newPopulation > oldPopulation then
		local pPlot = Map.GetPlot(iX, iY) 
		if pPlot then
			local pCity = pPlot:GetPlotCity()
			if pCity then
				local iOwner = pCity:GetOwner()
				local pOwner = Players[iOwner]
				if HasTrait(pOwner, traitKilomboID) then
					for i = 0, pPlot:GetNumUnits() - 1 do
						local pUnit = pPlot:GetUnit(i)
						if pUnit and pUnit:IsHasPromotion(promotionYijilaID) then
							pUnit:ChangeExperience(5)
						end
					end
				end
			end
		end
	end
end

GameEvents.SetPopulation.Add(DMS_GonzoExperienceCitizenBorn)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_MavalaLimitedBuilds
----------------------------------------------------------------------------------------------------------------------------
-- Use global variables to avoid having the event be called twice for the same plot
DMS_MavalaLimitedBuilds_BuildFinished_PlayerID = 0
DMS_MavalaLimitedBuilds_BuildFinished_X = 0
DMS_MavalaLimitedBuilds_BuildFinished_Y = 0
DMS_MavalaLimitedBuilds_BuildFinished_Improvement = 0

function DMS_MavalaLimitedBuilds(iPlayer, iX, iY, eImprovement)
	if(DMS_MavalaLimitedBuilds_BuildFinished_PlayerID == iPlayer and DMS_MavalaLimitedBuilds_BuildFinished_X == iX and DMS_MavalaLimitedBuilds_BuildFinished_Y == iY and DMS_MavalaLimitedBuilds_BuildFinished_Improvement == eImprovement) then
		return;
	end
	DMS_MavalaLimitedBuilds_BuildFinished_PlayerID = iPlayer
	DMS_MavalaLimitedBuilds_BuildFinished_X = iX
	DMS_MavalaLimitedBuilds_BuildFinished_Y = iY
	DMS_MavalaLimitedBuilds_BuildFinished_Improvement = eImprovement
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitKilomboID) then
		if eImprovement ~= -1 then
			local pPlot = Map.GetPlot(iX, iY)
			if pPlot then
				for i = 0, pPlot:GetNumUnits() - 1 do
					local pUnit = pPlot:GetUnit(i)
					if userSettingBuildCharges then
						DMS_Print("DMS_MavalaLimitedBuilds: userSettingBuildCharges = true..")
						if pUnit and pUnit:GetUnitType() == unitMavala3UsesID then
							local iNumChargesLeft = JFD_GetNumBuildCharges(iPlayer, pUnit, pUnit:GetUnitType())
								DMS_Print("DMS_MavalaLimitedBuilds: iNumChargesLeft = " .. iNumChargesLeft .. "..")
								if iNumChargesLeft == 0 then
									local pLowPopCity = nil
									for pCity in pPlayer:Cities() do
										if (not pLowPopCity) then
											pLowPopCity = pCity
										elseif pLowPopCity then
											if pCity:GetPopulation() < pLowPopCity:GetPopulation() then
												pLowPopCity = pCity
											end
										end
									end
									if pLowPopCity ~= nil then
										pLowPopCity:ChangePopulation(1)

										if pPlayer:IsHuman() then
											Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(pLowPopCity:Plot():GetX(), pLowPopCity:Plot():GetY()))), "[COLOR_POSITIVE_TEXT]+ 1 [ICON_CITZEN] Citizen in " .. pLowPopCity:GetName() .. "[ENDCOLOR]", 0)
										end
									end
								end
							end
					else
						DMS_Print("DMS_MavalaLimitedBuilds: userSettingBuildCharges = false..")
						local bUnitMavala3 = false
						local bUnitMavala2 = false
						if pUnit and pUnit:GetUnitType() == unitMavala3UsesID then

							--pPlayer:InitUnit(unitMavala2UsesID, pPlot:GetX(), pPlot:GetY())
							pUnit:Kill(true, -1)
							bUnitMavala3 = true
						elseif pUnit and pUnit:GetUnitType() == unitMavala2UsesID then
							--pPlayer:InitUnit(unitMavala1UsesID, pPlot:GetX(), pPlot:GetY())
							pUnit:Kill(true, -1)
							bUnitMavala2 = true
						elseif pUnit:GetUnitType() == unitMavala1UsesID then
							pUnit:Kill(true, -1)
						end
						if bUnitMavala3 == true then
							pPlayer:InitUnit(unitMavala2UsesID, pPlot:GetX(), pPlot:GetY())
						elseif bUnitMavala2 == true then
							pPlayer:InitUnit(unitMavala1UsesID, pPlot:GetX(), pPlot:GetY())
						end
					end
				end
			end
		end
	end
end

GameEvents.BuildFinished.Add(DMS_MavalaLimitedBuilds)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_ConvertWorkertoMavala
----------------------------------------------------------------------------------------------------------------------------
function DMS_ConvertWorkertoMavala(iPlayer, iUnit, iX, iY)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitKilomboID) then
		local pUnit = pPlayer:GetUnitByID(iUnit)
		if pUnit and iX and iY and pUnit:GetUnitType() == unitWorkerID then
			local pNewUnit = pPlayer:InitUnit(unitMavala3UsesID, iX, iY)
			pNewUnit:Convert(pUnit)
			--pUnit:Kill(true, -1)
		end
	end
end

GameEvents.UnitSetXY.Add(DMS_ConvertWorkertoMavala)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_GonzoExtraJungleMove
----------------------------------------------------------------------------------------------------------------------------
function DMS_GonzoExtraJungleMove(iPlayer)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitKilomboID) then
		for pUnit in pPlayer:Units() do
			if pUnit and pUnit:IsHasPromotion(promotionYijilaID) then
				local pPlot = pUnit:GetPlot()
				if pPlot then
					if (pPlot:GetFeatureType() == featureJungleID) then
						pUnit:SetMoves(pUnit:GetMoves() + 60)
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DMS_GonzoExtraJungleMove)
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
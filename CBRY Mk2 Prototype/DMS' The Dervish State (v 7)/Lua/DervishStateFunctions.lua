--Age of Imperialism - The Dervish State
--Maara-weyn
--Civitar, Zantonius Hamm, DMS
--==========================================================================================================================
-- includes
--==========================================================================================================================
include("PlotIterators.lua");
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
--==========================================================================================================================
-- UTILITIES
--==========================================================================================================================
-- Debug
----------------------------------------------------------------------------------------------------------------------------
local bPrintForDebug = DMS_GetUserSetting("DMS_DERVISH_DEBUGGING_ON") == 1

function DMS_Print(string)
	if (not bPrintForDebug) then
		return
	else
		return print(string)
	end
end
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
------------------------------------------------------------------------------------------------------------------------
-- JFD_GetEraAdjustedValue
------------------------------------------------------------------------------------------------------------------------
local mathCeil = math.ceil
function JFD_GetEraAdjustedValue(playerID, num)
	local player = Players[playerID]
	local currentEraID = player:GetCurrentEra()
	local eraMod = GameInfo.Eras[currentEraID].ResearchAgreementCost
	return mathCeil(num * eraMod/100)
end 
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishGetWriterCity
----------------------------------------------------------------------------------------------------------------------------
function AoI_DervishGetWriterCity(pPlayer)
	DMS_Print("AoI_DervishGetWriterCity called")
	local pWriterCity = pPlayer:GetCapitalCity()
	DMS_Print("AoI_DervishGetWriterCity: Writer city initialized to the capital city...")
	for pCity in pPlayer:Cities() do
		if pCity and pCity ~= pWriterCity then
			if pCity:IsHasBuilding(buildingWritersGuild) then
				DMS_Print("AoI_DervishGetWriterCity: Found another city with the Writers' Guild!")
				pWriterCity = pCity
				
			end
		end
	end

	DMS_Print("AoI_DervishGetWriterCity:  Writer city is " .. pWriterCity:GetName() .. "!")
	return pWriterCity
end
------------------------------------------------------------------------------------------------------------------------
-- Globals
------------------------------------------------------------------------------------------------------------------------
local activePlayerID 					= Game.GetActivePlayer()
local activePlayer 						= Players[activePlayerID]
local activePlayerTeam 					= Teams[Game.GetActiveTeam()]
local civilisationDervishStateID		= GameInfoTypes["CIVILIZATION_AOI_DERVISH"]
local isDervishStateCivActive 			= JFD_IsCivilisationActive(civilisationDervishStateID)
local isDervishStateActivePlayer 		= activePlayer:GetCivilizationType() == civilisationDervishStateID

local traitHornResistanceID				= GameInfoTypes["TRAIT_AOI_HORN_RESISTANCE"]
local unitMaaraWeyn						= GameInfoTypes["UNIT_AOI_MAARA_WEYN"]
local unitCavalry						= GameInfoTypes["UNIT_CAVALRY"]
local unitDervishCavalry				= GameInfoTypes["UNIT_AOI_DERVISH_CAVALRY"]
local unitGreatWriter					= GameInfoTypes["UNIT_WRITER"]
local unitDervishWorker					= GameInfoTypes["UNIT_AOI_WORKER"]
local unitWorker						= GameInfoTypes["UNIT_WORKER"]
local promotionMaaraWeynWriter			= GameInfoTypes["PROMOTION_AOI_MAARA_WEYN_GREAT_WRITER_HIDDEN"]
local unitCombatMounted					= GameInfoTypes["UNITCOMBAT_MOUNTED"]
local promotionSharia					= GameInfoTypes["PROMOTION_AOI_SHARIA"]
local buildingSharia					= GameInfoTypes["BUILDING_AOI_SHARIA_HIDDEN"]
local promotionDefendersOfFreedom		= GameInfoTypes["PROMOTION_AOI_DEFENDERS_OF_FREEDOM"]
local promotionTheDervishes				= GameInfoTypes["PROMOTION_AOI_DERVISHES"]
local promotionPoetryOfWar				= GameInfoTypes["PROMOTION_AOI_POETRY_OF_WAR"]
local promotionDhaanto					= GameInfoTypes["PROMOTION_AOI_DHAANTO"]
local promotionFortifications			= GameInfoTypes["PROMOTION_AOI_FORTIFICATIONS"]
local promotionFortificationsHidden		= GameInfoTypes["PROMOTION_AOI_FORTIFICATIONS_HIDDEN"]

local buildingQalcad					= GameInfoTypes["BUILDING_AOI_QALCAD"]
local domainAir							= GameInfoTypes["DOMAIN_AIR"]
local unitCombatHelicopter				= GameInfoTypes["UNITCOMBAT_HELICOPTER"]

local improvementFort					= GameInfoTypes["IMPROVEMENT_FORT"]
local improvementDervishFort			= GameInfoTypes["IMPROVEMENT_AOI_DERVISH_FORT"]
local improvementCitadel				= GameInfoTypes["IMPROVEMENT_CITADEL"]
local improvementDervishCitadel			= GameInfoTypes["IMPROVEMENT_AOI_DERVISH_CITADEL"]
local buildingWritersGuild				= GameInfoTypes["BUILDING_WRITERS_GUILD"]
local specialistWriter					= GameInfoTypes["SPECIALIST_WRITER"]
local MOVE_DENOMINATOR					= GameDefines.MOVE_DENOMINATOR
local iDomainLand						= GameInfoTypes.DOMAIN_LAND

if isDervishStateCivActive then
	print("Sayid Mohammed Abdullah Hassan AKA. 'The Mad Mullah' of the Dervish State joins the game..")
end
--==========================================================================================================================
-- MAIN FUNCTIONS	
--==========================================================================================================================
-- AoI_FirstDervishMountedPromotion
----------------------------------------------------------------------------------------------------------------------------
function AoI_FirstDervishMountedPromotion(PlayerID, CityID, UnitID)
	DMS_Print("AoI_FirstDervishMountedPromotion called..")
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		DMS_Print("AoI_FirstDervishMountedPromotion: The Dervish have trained a new unit..")
		local pUnit = pPlayer:GetUnitByID(UnitID)
		if pUnit and pUnit:GetUnitCombatType() == unitCombatMounted then
			DMS_Print("AoI_FirstDervishMountedPromotion: The new unit is a mounted unit! Granting the Sharia promotion...")
			pUnit:SetHasPromotion(promotionSharia, true)
			DMS_Print("AoI_FirstDervishMountedPromotion: Granted the Sharia promotion!")
		end
	end
end

GameEvents.CityTrained.Add(AoI_FirstDervishMountedPromotion)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishMountedPromotions
----------------------------------------------------------------------------------------------------------------------------
function AoI_DervishMountedPromotions(PlayerID, UnitID)
	DMS_Print("AoI_DervishMountedPromotions called..")
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		DMS_Print("AoI_DervishMountedPromotions: A Dervish unit has been promoted!")
		local pUnit = pPlayer:GetUnitByID(UnitID);
		if pUnit and pUnit:GetUnitCombatType() == unitCombatMounted then
			DMS_Print("AoI_DervishMountedPromotions: The unit is a mounted unit!")
			-- LEVEL 2
			if (pUnit:GetLevel() == 2) then
				DMS_Print("AoI_DervishMountedPromotions: The unit is now at level 2 or more! Granting the Defenders of Freedom promotion if it doesn't have it already...")
				pUnit:SetHasPromotion(promotionDefendersOfFreedom, true)
				print("AoI_DervishMountedPromotions: Granted the Defenders of Freedom promotion!")
				if not pUnit:IsHasPromotion(promotionSharia) then
					pUnit:SetHasPromotion(promotionSharia, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 1 promotion, thus granted the Sharia promotion!")
				end
			-- LEVEL 3
			elseif (pUnit:GetLevel() == 3) then
				DMS_Print("AoI_DervishMountedPromotions: The unit is now at level 3 or more! Granting the Dervishes promotion if it doesn't have it already...")
				pUnit:SetHasPromotion(promotionTheDervishes, true)
				print("AoI_DervishMountedPromotions: Granted the Dervishes promotion!")
				if not pUnit:IsHasPromotion(promotionSharia) then
					pUnit:SetHasPromotion(promotionSharia, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 1 promotion, thus granted the Sharia promotion!")
				end
				if not pUnit:IsHasPromotion(promotionDefendersOfFreedom) then
					pUnit:SetHasPromotion(promotionDefendersOfFreedom, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 2 promotion, thus granted the Defenders of Freedom promotion!")
				end
			-- LEVEL 4
			elseif (pUnit:GetLevel() == 4) then
				DMS_Print("AoI_DervishMountedPromotions: The unit is now at level 4 or more! Granting the Poetry of War promotion if it doesn't have it already...")
				pUnit:SetHasPromotion(promotionPoetryOfWar, true)
				print("AoI_DervishMountedPromotions: Granted the Poetry of War promotion!")
				if not pUnit:IsHasPromotion(promotionSharia) then
					pUnit:SetHasPromotion(promotionSharia, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 1 promotion, thus granted the Sharia promotion!")
				end
				if not pUnit:IsHasPromotion(promotionDefendersOfFreedom) then
					pUnit:SetHasPromotion(promotionDefendersOfFreedom, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 2 promotion, thus granted the Defenders of Freedom promotion!")
				end
				if not pUnit:IsHasPromotion(promotionTheDervishes) then
					pUnit:SetHasPromotion(promotionTheDervishes, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 3 promotion, thus granted the Dervishes promotion!")
				end
			elseif (pUnit:GetLevel() == 5) then
			-- LEVEL 5
				DMS_Print("AoI_DervishMountedPromotions: The unit is now at level 5 or more! Granting the Dhaanto promotion if it doesn't have it already...")
				pUnit:SetHasPromotion(promotionDhaanto, true)
				print("AoI_DervishMountedPromotions: Granted the Dhaanto promotion!")
				if not pUnit:IsHasPromotion(promotionSharia) then
					pUnit:SetHasPromotion(promotionSharia, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 1 promotion, thus granted the Sharia promotion!")
				end
				if not pUnit:IsHasPromotion(promotionDefendersOfFreedom) then
					pUnit:SetHasPromotion(promotionDefendersOfFreedom, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 2 promotion, thus granted the Defenders of Freedom promotion!")
				end
				if not pUnit:IsHasPromotion(promotionTheDervishes) then
					pUnit:SetHasPromotion(promotionTheDervishes, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 3 promotion, thus granted the Dervishes promotion!")
				end
				if not pUnit:IsHasPromotion(promotionPoetryOfWar) then
					pUnit:SetHasPromotion(promotionPoetryOfWar, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 4 promotion, thus granted the Poetry of War promotion!")
				end
			elseif (pUnit:GetLevel() >= 6) then
			-- LEVEL 6
				DMS_Print("AoI_DervishMountedPromotions: The unit is now at level 6 or more! Granting the Fortifications promotion if it doesn't have it already...")
				pUnit:SetHasPromotion(promotionFortifications, true)
				print("AoI_DervishMountedPromotions: Granted the Fortifications promotion!")
				if not pUnit:IsHasPromotion(promotionSharia) then
					pUnit:SetHasPromotion(promotionSharia, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 1 promotion, thus granted the Sharia promotion!")
				end
				if not pUnit:IsHasPromotion(promotionDefendersOfFreedom) then
					pUnit:SetHasPromotion(promotionDefendersOfFreedom, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 2 promotion, thus granted the Defenders of Freedom promotion!")
				end
				if not pUnit:IsHasPromotion(promotionTheDervishes) then
					pUnit:SetHasPromotion(promotionTheDervishes, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 3 promotion, thus granted the Dervishes promotion!")
				end
				if not pUnit:IsHasPromotion(promotionPoetryOfWar) then
					pUnit:SetHasPromotion(promotionPoetryOfWar, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 4 promotion, thus granted the Poetry of War promotion!")
				end
				if not pUnit:IsHasPromotion(promotionDhaanto) then
					pUnit:SetHasPromotion(promotionDhaanto, true)
					DMS_Print("AoI_FirstDervishMountedPromotion: Unit didn't have the level 5 promotion, thus granted the Dhaanto promotion!")
				end
			end
		end
	end
end

GameEvents.UnitPromoted.Add(AoI_DervishMountedPromotions)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishSpecialImprovements
----------------------------------------------------------------------------------------------------------------------------
-- Use global variables to avoid having the event be called twice for the same plot
AoI_DervishSpecialImprovements_PlayerID = 0
AoI_DervishSpecialImprovements_X = 0
AoI_DervishSpecialImprovements_Y = 0
AoI_DervishSpecialImprovements_Improvement = 0

function AoI_DervishSpecialImprovements(PlayerID, iX, iY, eImprovement)
	-- Don't continue if this is a duplicate call
	if(AoI_DervishSpecialImprovements_PlayerID == PlayerID and AoI_DervishSpecialImprovements_X == iX and AoI_DervishSpecialImprovements_Y == iY and AoI_DervishSpecialImprovements_Improvement == eImprovement) then
		DMS_Print("AoI_DervishSpecialImprovements: this is a dublicate call - terminate function..")
		return;
	end
	-- Store inputs for duplication check
	DMS_Print("AoI_DervishSpecialImprovements: Store inputs for duplication check..")
	AoI_DervishSpecialImprovements_PlayerID = PlayerID
	AoI_DervishSpecialImprovements_X = iX
	AoI_DervishSpecialImprovements_Y = iY
	AoI_DervishSpecialImprovements_Improvement = eImprovement
	DMS_Print("AoI_DervishSpecialImprovements: AoI_DervishSpecialImprovements_PlayerID = " .. PlayerID .. ".")
	DMS_Print("AoI_DervishSpecialImprovements: AoI_DervishSpecialImprovements_X = " .. iX .. ".")
	DMS_Print("AoI_DervishSpecialImprovements: AoI_DervishSpecialImprovements_Y = " .. iY .. ".")
	DMS_Print("AoI_DervishSpecialImprovements: AoI_DervishSpecialImprovements_Improvement = " .. eImprovement .. ".")

	DMS_Print("AoI_DervishSpecialImprovements called..")
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
	local bAddGWPoints = false
		DMS_Print("AoI_DervishSpecialImprovements: The Dervish have completed an improvement at " .. iX .. ", " .. iY .. "!")
		local pPlot = Map.GetPlot(iX, iY)
		if (eImprovement == improvementFort) or (pPlot:GetImprovementType() == improvementFort) then
			DMS_Print("AoI_DervishSpecialImprovements: The improvement is a Fort! Changing to a special Dervish Fort...")
			pPlot:SetImprovementType(-1)
			pPlot:SetImprovementType(improvementDervishFort)
			DMS_Print("AoI_DervishSpecialImprovements: Changed to a special Dervish Fort!")
			bAddGWPoints = true
		elseif (eImprovement == improvementCitadel) or (pPlot:GetImprovementType() == improvementCitadel) then
			DMS_Print("AoI_DervishSpecialImprovements: The improvement is a Citadel! Changing to a special Dervish Citadel...")
			pPlot:SetImprovementType(-1)
			pPlot:SetImprovementType(improvementDervishCitadel)
			DMS_Print("AoI_DervishSpecialImprovements: Changed to a special Dervish Citadel!")
			bAddGWPoints = true
		end
		
		if bAddGWPoints == true then
			DMS_Print("AoI_DervishSpecialImprovements: Adding Great Writer points to Writer city...")
			local pCity = AoI_DervishGetWriterCity(pPlayer)
			local iDervishGreatWriterPoints = JFD_GetEraAdjustedValue(PlayerID, (pPlayer:GetTotalFaithPerTurn()))
			if iDervishGreatWriterPoints < 5 then
				iDervishGreatWriterPoints = 5
				DMS_Print("AoI_DervishSpecialImprovements: Player total faith output is less than 5, thus set minimum variable to 5...")
			end
			pCity:ChangeSpecialistGreatPersonProgressTimes100(specialistWriter, iDervishGreatWriterPoints * 100)
			print("AoI_DervishSpecialImprovements: Added " .. iDervishGreatWriterPoints .. " Great Writer points to Writer city!")
			if pPlayer:IsHuman() then
				local sFortOrCitadel
				if eImprovement == improvementFort then
					sFortOrCitadel = "Fort"
				else
					sFortOrCitadel = "Citadel"
				end
				Events.GameplayAlertMessage("The construction of a " .. sFortOrCitadel .. " has provided [COLOR_POSITIVE_TEXT]+" .. iDervishGreatWriterPoints .. " Great Writer Points[ENDCOLOR] in " .. pCity:GetName() .. "!")
				print("AoI_DervishSpecialImprovements: Sent gameplay alert message!")
			end
		end
	end
end

GameEvents.BuildFinished.Add(AoI_DervishSpecialImprovements)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_DervishChangeImprovements
----------------------------------------------------------------------------------------------------------------------------
function DMS_DervishChangeImprovements(oldPlayerID, bCapital, iX, iY, newPlayerID, conquest, conquest2)
	DMS_Print("DMS_DervishChangeImprovements called..")
	local pOldPlayer = Players[oldPlayerID]
	local pNewPlayer = Players[newPlayerID]
	local pCityPlot = Map.GetPlot(iX, iY)
	local pCity = pCityPlot:GetPlotCity()
	if HasTrait(pOldPlayer, traitHornResistanceID) then
		if pCity then
			DMS_Print("DMS_DervishChangeImprovements: The Dervishes has lost the city of " .. pCity:GetName() .. "..")
			DMS_Print("DMS_DervishChangeImprovements: Iterate through plots to check for special improvements..")
			for pPlot in PlotAreaSweepIterator(pCityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if pPlot then
					if pPlot:GetImprovementType() == improvementDervishFort then
						DMS_Print("DMS_DervishChangeImprovements: Found a special Dervish Fort at plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ")!")
						if pPlot:GetOwner() ~= oldPlayerID then
							DMS_Print("DMS_DervishChangeImprovements: The owner is not the Dervish! Changing to a normal Fort...")
							pPlot:SetImprovementType(-1)
							pPlot:SetImprovementType(improvementFort)
							print("DMS_DervishChangeImprovements: Changed to a normal Fort!")
						end
					elseif pPlot:GetImprovementType() == improvementDervishCitadel then
						DMS_Print("DMS_DervishChangeImprovements: Found a special Dervish Citadel at plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ")!")
						if pPlot:GetOwner() ~= oldPlayerID then
							DMS_Print("DMS_DervishChangeImprovements: The owner is not the Dervish! Changing to a normal Citadel...")
							pPlot:SetImprovementType(-1)
							pPlot:SetImprovementType(improvementCitadel)
							print("DMS_DervishChangeImprovements: Changed to a normal Citadel!")
						end
					end
				end
			end
		end
	elseif HasTrait(pNewPlayer, traitHornResistanceID) then
		if pCity then
			DMS_Print("DMS_DervishChangeImprovements: The Dervishes has lost the city of " .. pCity:GetName() .. "..")
			DMS_Print("DMS_DervishChangeImprovements: Iterate through plots to check for special improvements..")
			for pPlot in PlotAreaSweepIterator(pCityPlot, 3, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if pPlot then
					if pPlot:GetImprovementType() == improvementFort then
						DMS_Print("DMS_DervishChangeImprovements: Found a Fort at plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ")!")
						if pPlot:GetOwner() == newPlayerID then
							DMS_Print("DMS_DervishChangeImprovements: The owner is the Dervish! Changing to a special Dervish Fort...")
							pPlot:SetImprovementType(-1)
							pPlot:SetImprovementType(improvementDervishFort)
							print("DMS_DervishChangeImprovements: Changed to a special Dervish Fort!")
						end
					elseif pPlot:GetImprovementType() == improvementCitadel then
						DMS_Print("DMS_DervishChangeImprovements: Found a Citadel at plot (" .. pPlot:GetX() .. "," .. pPlot:GetY() .. ")!")
						if pPlot:GetOwner() == newPlayerID then
							DMS_Print("DMS_DervishChangeImprovements: The owner is the Dervish! Changing to a special Dervish Citadel...")
							pPlot:SetImprovementType(-1)
							pPlot:SetImprovementType(improvementDervishCitadel)
							print("DMS_DervishChangeImprovements: Changed to a special Dervish Citadel!")
						end
					end
				end
			end
		end
	end

end

GameEvents.CityCaptureComplete.Add(DMS_DervishChangeImprovements)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishShariaPromotion
----------------------------------------------------------------------------------------------------------------------------
function AoI_DervishShariaPromotion(PlayerID, UnitID, iX, iY)
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		local pUnit = pPlayer:GetUnitByID(UnitID)
		if pUnit and pUnit:IsHasPromotion(promotionSharia) then
			DMS_Print("AoI_DervishShariaPromotion called for unit with Sharia promotion..")
			local pPlot = Map.GetPlot(iX, iY)
			if pPlot and pPlot:IsCity() then
				DMS_Print("AoI_DervishShariaPromotion: The unit has moved into a city!")
				local pCity = pPlot:GetPlotCity()
				if pCity then
					if not pCity:IsHasBuilding(buildingSharia) then
						pCity:SetNumRealBuilding(buildingSharia, 1)
						DMS_Print("AoI_DervishShariaPromotion: Added religious pressure to " .. pCity:GetName() .. "!")
					end
				end
			end
		end
	end
end

GameEvents.UnitSetXY.Add(AoI_DervishShariaPromotion)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishEndSharia
----------------------------------------------------------------------------------------------------------------------------
function AoI_DervishEndSharia(PlayerID)
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		DMS_Print("AoI_DervishEndSharia called")
		for pCity in pPlayer:Cities() do
			if pCity and pCity:IsHasBuilding(buildingSharia) then
				DMS_Print("AoI_DervishEndSharia: Found a city with extra religious pressure from a Sharia unit!")
				if pCity:GetGarrisonedUnit() == nil then
					DMS_Print("AoI_DervishEndSharia: There is no unit in the city! Removing bonus from Sharia...")
					pCity:SetNumRealBuilding(buildingSharia, 0);
					DMS_Print("AoI_DervishEndSharia: Removed Sharia bonus from " .. pCity:GetName() .. "!")
				elseif not pCity:GetGarrisonedUnit():IsHasPromotion(promotionSharia) then
					DMS_Print("AoI_DervishEndSharia: There is a unit garrisoned in the city but it is not Sharia! Removing Sharia bonus...")
					pCity:SetNumRealBuilding(buildingSharia, 0);
					DMS_Print("AoI_DervishEndSharia: Removed Sharia bonus from " .. pCity:GetName() .. "!")
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(AoI_DervishEndSharia)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishTheDervishesPromotion
----------------------------------------------------------------------------------------------------------------------------
function AoI_DervishTheDervishesPromotion(PlayerID)
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		DMS_Print("AoI_DervishTheDervishesPromotion called..")
		for pUnit in pPlayer:Units() do
			if pUnit and (not pUnit:IsCombatUnit()) then
				local pPlot = pUnit:GetPlot()
				if pPlot then
					DMS_Print("AoI_DervishTheDervishesPromotion: Found a civilian unit at " .. pUnit:GetPlot():GetX() .. ", " .. pUnit:GetPlot():GetY())
					local iNumTileUnits = pPlot:GetNumUnits()
					if iNumTileUnits > 1 then
						for i = 0, iNumTileUnits do
							local pOtherUnit = pPlot:GetUnit(i)
							if pOtherUnit then
								DMS_Print("AoI_DervishTheDervishesPromotion: Found another unit at " .. pUnit:GetPlot():GetX() .. ", " .. pUnit:GetPlot():GetY())
								if pOtherUnit:IsHasPromotion(promotionTheDervishes) then
									DMS_Print("AoI_DervishTheDervishesPromotion: The other unit has the Dervishes promotion..")
									if pUnit:GetMoves() >= pOtherUnit:GetMoves() then
										DMS_Print("AoI_DervishTheDervishesPromotion: The other unit doesnt' have more moves than the civilian unit - terminate..")
									else 
										DMS_Print("AoI_DervishTheDervishesPromotion: The other unit has more moves than the civilian unit..")
										pUnit:ChangeMoves(pOtherUnit:GetMoves() - pUnit:GetMoves())
										DMS_Print("AoI_DervishTheDervishesPromotion: Changed movement for the civilian unit to " .. pOtherUnit:GetMoves() - pUnit:GetMoves() .. "!")
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(AoI_DervishTheDervishesPromotion)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishPoetryOfWarPromotion  -- adapted from LeeS code
----------------------------------------------------------------------------------------------------------------------------
local iFirstTimeThroughKillerData = "NONE"
local bPrintForDebug = true
function AoI_DervishPoetryOfWarPromotion(iOwner, iUnit, iUnitType, iX, iY, bDelay, iKiller)
	if bPrintForDebug then 
		DMS_Print("prekillListener: Dumping data for bDelay = " .. tostring(bDelay)) 
	end
	if bDelay then
		iFirstTimeThroughKillerData = iKiller
		if bPrintForDebug then 
			DMS_Print("iOwner: " .. iOwner)
			DMS_Print("iUnit: " .. iUnit)
			DMS_Print("iUnitType: " .. iUnitType .. " (" .. GameInfo.Units[iUnitType].Type .. ")")
			DMS_Print("iX: " .. iX)
			DMS_Print("iY: " .. iY)
			DMS_Print("bDelay: " .. tostring(bDelay))
			-- bDelay returns true before unit is killed (before UnitKilledInCombat) and only has one unit on the plot
			-- bDelay returns false after the unit is killed (after UnitKilledInCombat) and an enemy melee unit may be on the same plot at this point
			DMS_Print("iKiller: " .. iKiller)
		end
		return
	end
	if iOwner == Game.GetActivePlayer() then
		if bPrintForDebug then 
			DMS_Print("Unit killed belonged to the active player, exiting the function") 
		end
		return
	end
	if iFirstTimeThroughKillerData == -1 then
		if bPrintForDebug then 
			DMS_Print("iFirstTimeThroughKillerData was set to -1, which means no valid iKiller data from any run-through: exiting the function") 
		end
		iFirstTimeThroughKillerData = "NONE"
		return
	end
	if iFirstTimeThroughKillerData == "NONE" then
		if bPrintForDebug then 
			DMS_Print("iFirstTimeThroughKillerData was set to NONE, which means no valid iKiller data from any run-through: exiting the function") 
		end
		return
	end
	local pOwnerPlayer = Players[iOwner]
	local pUnitKilled = pOwnerPlayer:GetUnitByID(iUnit)
	if pUnitKilled:GetDomainType() ~= iDomainLand then
		if bPrintForDebug then 
			DMS_Print("Unit killed was not a land combat unit, exiting the function") 
		end
		return
	end

	local pKillerPlayer = Players[iFirstTimeThroughKillerData]
	if bPrintForDebug then 
		DMS_Print("iFirstTimeThroughKillerData was " .. tostring(iFirstTimeThroughKillerData) .. " before resetting") 
	end

	iFirstTimeThroughKillerData = "NONE"
	if bPrintForDebug then 
		DMS_Print("pKillerPlayer is set to " .. tostring(pKillerPlayer))
		DMS_Print("iFirstTimeThroughKillerData was reset to " .. iFirstTimeThroughKillerData)


		DMS_Print("iOwner: " .. iOwner)
		DMS_Print("iUnit: " .. iUnit)
		DMS_Print("iUnitType: " .. iUnitType .. " (" .. GameInfo.Units[iUnitType].Type .. ")")
		DMS_Print("iX: " .. iX)
		DMS_Print("iY: " .. iY)
		DMS_Print("bDelay: " .. tostring(bDelay))
		-- bDelay returns true before unit is killed (before UnitKilledInCombat) and only has one unit on the plot
		-- bDelay returns false after the unit is killed (after UnitKilledInCombat) and an enemy melee unit may be on the same plot at this point
		DMS_Print("iKiller: " .. iKiller)
	end


	if (not HasTrait(pKillerPlayer, traitHornResistanceID)) then
		if bPrintForDebug then 
			DMS_Print("pKillerPlayer was not the Required Civilization, exiting the function") 
		end
		return
	end
	local pPlot = Map.GetPlot(iX, iY)
	local iNumTileUnits = pPlot:GetNumUnits()
	if bPrintForDebug then 
		DMS_Print("numUnits: " .. iNumTileUnits) 
	end

	if iNumTileUnits > 1 then
	DMS_Print("AoI_DervishPoetryOfWarPromotion: iNumTileUnits > 1 - iterate through units..")
		for i = 0, pPlot:GetNumUnits() do
			local pUnit = pPlot:GetUnit(i)
			if pUnit then
				DMS_Print("AoI_DervishPoetryOfWarPromotion: pUnit nil check passed..")
				local iPlotUnitType = pUnit:GetUnitType()
				local iPlotUnitOwner = pUnit:GetOwner()

				if pUnit ~= pUnitKilled then
					DMS_Print("AoI_DervishPoetryOfWarPromotion: pUnit ~= pUnitKilled..")
					if pUnit:IsHasPromotion(promotionPoetryOfWar) then
						DMS_Print("AoI_DervishPoetryOfWarPromotion: pUnit:IsHasPromotion(promotionPoetryOfWar)..")
						-- do stuff here
						local tUnitKilledInfo = GameInfo.Units{ID=iUnitType}()
						DMS_Print("AoI_DervishPoetryOfWarPromotion: The dead unit is a " .. Locale.ConvertTextKey(tUnitKilledInfo.Description) .. " with " .. tUnitKilledInfo.Combat .. "combat strength...")
						if tUnitKilledInfo.Combat > 0 then
							local pCity = AoI_DervishGetWriterCity(pKillerPlayer)
						
							pCity:ChangeSpecialistGreatPersonProgressTimes100(specialistWriter, (math.ceil(tUnitKilledInfo.Combat) * 100))
							DMS_Print("AoI_DervishPoetryOfWarPromotion: Added " .. tUnitKilledInfo.Combat .. " Great Writer points to " .. pCity:GetName())
							if pKillerPlayer:IsHuman() then
								Events.GameplayAlertMessage("The killing of an enemy by a Dervish Unit with the Poetry of War Promotion has provided [COLOR_POSITIVE_TEXT]+" .. math.ceil(tUnitKilledInfo.Combat) .. " Great Writer Points[ENDCOLOR] in " .. pCity:GetName() .. "!")
								--Events.GameplayAlertMessage("The construction of a " .. sFortOrCitadel .. " has provided [COLOR_POSITIVE_TEXT]+" .. iDervishGreatWriterPoints .. " Great Writer Points[ENDCOLOR] in " .. pCity:GetName() .. "!")
								DMS_Print("AoI_DervishPoetryOfWarPromotion: Sent gameplay alert message!")
							end
						end
					end
				end
				if bPrintForDebug then
					DMS_Print("Unit's Owner is: " .. iPlotUnitOwner)
					DMS_Print("UnitType is: " .. iPlotUnitType .. " (" .. GameInfo.Units[iPlotUnitType].Type .. ")")
				end
			end
		end
	end
end

GameEvents.UnitPrekill.Add(AoI_DervishPoetryOfWarPromotion)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishFortificationsPromotion
----------------------------------------------------------------------------------------------------------------------------
function AoI_DervishFortificationsPromotion(PlayerID)
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		DMS_Print("AoI_DervishFortificationsPromotion called")
		for pUnit in pPlayer:Units() do
			if pUnit then 
				local pPlot = pUnit:GetPlot()
				if pPlot then
					DMS_Print("AoI_DervishFortificationsPromotion: Found a unit at (" .. pUnit:GetPlot():GetX() .. "," .. pUnit:GetPlot():GetY() .. ")..")
					if pUnit:IsHasPromotion(promotionFortifications) then
						DMS_Print("AoI_DervishFortificationsPromotion: The unit has the Fortifications promotion!")
						local pPlotImprovement = pPlot:GetImprovementType()
						if pPlotImprovement and ((pPlotImprovement == improvementFort) or (pPlotImprovement == improvementDervishFort) or (pPlotImprovement == improvementCitadel) or (pPlotImprovement == improvementDervishCitadel)) then
							if (not pUnit:IsHasPromotion(promotionFortificationsHidden)) then
								DMS_Print("AoI_DervishFortificationsPromotion: The unit is on a fort or a citadel, but is not receiving the bonus...")
								pUnit:SetHasPromotion(promotionFortificationsHidden, true)
								DMS_Print("AoI_DervishFortificationsPromotion: The unit is receiving the bonus!")
							end
						elseif pPlotImprovement and ((pPlotImprovement ~= improvementFort) or (pPlotImprovement ~= improvementDervishFort) or (pPlotImprovement ~= improvementCitadel) or (pPlotImprovement ~= improvementDervishCitadel)) then
							if pUnit:IsHasPromotion(promotionFortificationsHidden) then
								DMS_Print("AoI_DervishFortificationsPromotion: The unit is receiving the bonus, but is not on a fort or a citadel...")
								pUnit:SetHasPromotion(promotionFortificationsHidden, false)
								DMS_Print("AoI_DervishFortificationsPromotion: The unit is not receiving the bonus!")
							end
						end
					end
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(AoI_DervishFortificationsPromotion)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_QalcadXPFromFaith
----------------------------------------------------------------------------------------------------------------------------
function AoI_QalcadXPFromFaith(PlayerID, CityID, UnitID)
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		DMS_Print("AoI_QalcadXPFromFaith called for new unit trained..")
		local pCity = pPlayer:GetCityByID(CityID)
		if pCity and pCity:IsHasBuilding(buildingQalcad) then
			DMS_Print("AoI_QalcadXPFromFaith: The training city has a Qalcad...")
			local pUnit = pPlayer:GetUnitByID(UnitID)
			if pUnit and pUnit:GetDomainType() ~= domainAir and pUnit:GetUnitCombatType() ~= unitCombatHelicopter then
				DMS_Print("AoI_QalcadXPFromFaith: The unit is not an air unit or a helicopter...")
				pUnit:ChangeExperience(math.min(pCity:GetFaithPerTurn(), 50))
				DMS_Print("AoI_QalcadXPFromFaith: The unit has received " .. math.min(pCity:GetFaithPerTurn(), 50) .. " XP!")
			end
		end
	end
end

GameEvents.CityTrained.Add(AoI_QalcadXPFromFaith)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishCavalrySwap
----------------------------------------------------------------------------------------------------------------------------
function AoI_DervishCavalrySwap(PlayerID)
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		DMS_Print("AoI_DervishCavalrySwap called..")
		for pUnit in pPlayer:Units() do
			if pUnit then
				--DMS_Print("AoI_DervishCavalrySwap: Found a Dervish unit at (" .. pUnit:GetPlot():GetX() .. "," .. pUnit:GetPlot():GetY() .. ")..")
				if pUnit:GetUnitType() == unitCavalry then
					DMS_Print("AoI_DervishCavalrySwap: It is vanilla Cavalry! Initializing new special Cavalry at (" .. pUnit:GetPlot():GetX() .. ", " .. pUnit:GetPlot():GetY() .. ")..")
					local pNewUnit = pPlayer:InitUnit(unitDervishCavalry, pUnit:GetPlot():GetX(), pUnit:GetPlot():GetY())
					DMS_Print("AoI_DervishCavalrySwap: Special Cavalry initialized! Converting vanilla Cavalry to special Cavalry...")
					pNewUnit:Convert(pUnit)
					print("AoI_DervishCavalrySwap: Vanilla Cavalry converted to special Cavalry!")
				end
			end
		end
	elseif (not HasTrait(pPlayer, traitHornResistanceID)) then
		for pUnit in pPlayer:Units() do
			if pUnit then
				--DMS_Print("AoI_DervishCavalrySwap: Found a " .. Locale.ConvertTextKey(pPlayer:GetCivilizationAdjectiveKey()) .. " unit at (" .. pUnit:GetPlot():GetX() .. ", " .. pUnit:GetPlot():GetY() .. ")..")
				if pUnit:GetUnitType() == unitDervishCavalry then
					DMS_Print("AoI_DervishCavalrySwap: It is a special Cavalry reserved for the Dervish! Initializing normal Cavalry at (" .. pUnit:GetPlot():GetX() .. ", " .. pUnit:GetPlot():GetY() .. ")..")
					local pNewUnit = pPlayer:InitUnit(unitCavalry, pUnit:GetPlot():GetX(), pUnit:GetPlot():GetY())
					DMS_Print("AoI_DervishCavalrySwap: Normal Cavalry initialized! Converting special Cavalry to normal Cavalry...")
					pNewUnit:Convert(pUnit)
					print("AoI_DervishCavalrySwap: Special cavalry converted to normal Cavalry!")
				end
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(AoI_DervishCavalrySwap)
----------------------------------------------------------------------------------------------------------------------------
-- AoI_DervishMaaraWeynWriterBonus
----------------------------------------------------------------------------------------------------------------------------
function AoI_DervishMaaraWeynWriterBonus(PlayerID, UnitID, iX, iY)
	local pPlayer = Players[PlayerID]
	if HasTrait(pPlayer, traitHornResistanceID) then
		local pUnit = pPlayer:GetUnitByID(UnitID)
		if pUnit and (pUnit:GetUnitType() == unitMaaraWeyn) then
			local pPlot = pUnit:GetPlot()
			if pPlot then
				DMS_Print("AoI_DervishMaaraWeynWriterBonus: Found a Maara Weyn unit at (" .. pUnit:GetPlot():GetX() .. ", " .. pUnit:GetPlot():GetY() .. ")..")
				local numUnits = pPlot:GetNumUnits()
				if numUnits > 1 then
					for i = 0, numUnits do
						local pOtherUnit = pPlot:GetUnit(i)
						if pOtherUnit and (pOtherUnit ~= pUnit) then
							DMS_Print("AoI_DervishMaaraWeynWriterBonus: Found another unit at ("  .. pOtherUnit:GetPlot():GetX() .. ", " .. pOtherUnit:GetPlot():GetY() .. ")..")
							if pOtherUnit:GetUnitType() == unitGreatWriter then
								DMS_Print("AoI_DervishMaaraWeynWriterBonus: The unit is a Great Writer!")
								if not pUnit:IsHasPromotion(promotionMaaraWeynWriter) then
									DMS_Print("AoI_DervishMaaraWeynWriterBonus: The Maara-weyn is not benefiting from stacking with a Great Writer! Granting bonus Maara-weyn promotion...");
									pUnit:SetHasPromotion(promotionMaaraWeynWriter, true)
									DMS_Print("AoI_DervishMaaraWeynWriterBonus: Granted bonus Maara-weyn promotion!")
								end
							else
								DMS_Print("AoI_DervishMaaraWeynWriterBonus: The unit is not a Great Writer! Ensuring the Maara-weyn gets no bonus...")
								pUnit:SetHasPromotion(promotionMaaraWeynWriter, false)
								DMS_Print("AoI_DervishMaaraWeynWriterBonus: The Maara-weyn has no bonus!")
							end
						end
					end
				else
					DMS_Print("AoI_DervishMaaraWeynWriterBonus: The Maara Weyn is not stacked with another unit - removing promotion...")
					pUnit:SetHasPromotion(promotionMaaraWeynWriter, false)
					DMS_Print("AoI_DervishMaaraWeynWriterBonus: The Maara-weyn has no bonus!")
				end
			end
		elseif pUnit and (pUnit:GetUnitType() == unitGreatWriter) then
			local pPlot = pUnit:GetPlot()
			if pPlot then
				DMS_Print("AoI_DervishMaaraWeynWriterBonus: Found a Great Writer unit at (" .. pUnit:GetPlot():GetX() .. ", " .. pUnit:GetPlot():GetY() .. ")..")
				local numUnits = pPlot:GetNumUnits()
				if numUnits and (numUnits > 1) then
					for i = 0, numUnits do
						local pOtherUnit = pPlot:GetUnit(i)
						if pOtherUnit and (pOtherUnit ~= pUnit) then
							DMS_Print("AoI_DervishMaaraWeynWriterBonus: Found another unit at ("  .. pOtherUnit:GetPlot():GetX() .. ", " .. pOtherUnit:GetPlot():GetY() .. ")..")
							if pOtherUnit:GetUnitType() == unitMaaraWeyn then
								DMS_Print("AoI_DervishMaaraWeynWriterBonus: The unit is a Maara Weyn!")
								if not pOtherUnit:IsHasPromotion(promotionMaaraWeynWriter) then
									DMS_Print("AoI_DervishMaaraWeynWriterBonus: The Maara-weyn is not benefiting from stacking with a Great Writer! Granting bonus Maara-weyn promotion...");
									pOtherUnit:SetHasPromotion(promotionMaaraWeynWriter, true)
									DMS_Print("AoI_DervishMaaraWeynWriterBonus: Granted bonus Maara-weyn promotion!")
								end
							else
								DMS_Print("AoI_DervishMaaraWeynWriterBonus: The unit is not a Great Writer! Ensuring the Maara-weyn gets no bonus...")
								pOtherUnit:SetHasPromotion(promotionMaaraWeynWriter, false)
								DMS_Print("AoI_DervishMaaraWeynWriterBonus: The Maara-weyn has no bonus!")
							end
						end
					end
				else
					DMS_Print("AoI_DervishMaaraWeynWriterBonus: The Great Writer is not stacked with another unit - iterate through Maara Weyn units to remove potential promotions...")
					for pUnit in pPlayer:Units() do
						if pUnit:IsHasPromotion(promotionMaaraWeynWriter) then
							pUnit:SetHasPromotion(promotionMaaraWeynWriter, false)
							DMS_Print("AoI_DervishMaaraWeynWriterBonus: The Maara-weyn has no bonus!")
						end
					end
				end
			end
		end
	end
end

GameEvents.UnitSetXY.Add(AoI_DervishMaaraWeynWriterBonus)
----------------------------------------------------------------------------------------------------------------------------
-- DMS_DervishWorkerConverter
----------------------------------------------------------------------------------------------------------------------------
function DMS_DervishWorkerConverter(iPlayer)
	local pPlayer = Players[iPlayer]
	if HasTrait(pPlayer, traitHornResistanceID) then
		for pUnit in pPlayer:Units() do
			if pUnit and pUnit:GetUnitType() == unitWorker then
				local pNewUnit = pPlayer:InitUnit(unitDervishWorker, pUnit:GetPlot():GetX(), pUnit:GetPlot():GetY())
				pNewUnit:Convert(pUnit)
			end
		end
	end
end

GameEvents.PlayerDoTurn.Add(DMS_DervishWorkerConverter)
----------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
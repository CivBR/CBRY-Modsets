-- BurmaUA
-- Author: Sukritact
--=======================================================================================================================

include( "Sukritact_SaveUtils.lua" ); MY_MOD_NAME = "BurmaUA";
include("PlotIterators.lua")
-- print("Loaded")

--=======================================================================================================================
-- Utility Functions
--=======================================================================================================================
-- JFD_IsCivilisationActive
-------------------------------------------------------------------------------------------------------------------------
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
--=======================================================================================================================
-- Burma UA: Yama Zatdaw
--=======================================================================================================================
-- Yama Zatdaw: Main Code
-------------------------------------------------------------------------------------------------------------------------
local iGuild = GameInfoTypes.BUILDING_WRITERS_GUILD
local iType = GameInfoTypes.SPECIALIST_WRITER
local iBuilding = GameInfoTypes.BUILDING_BURMAUA
local iRawDelta = 100
local iGPModifier = GameInfo.GameSpeeds[Game.GetGameSpeedType()].GreatPeoplePercent
local iDelta = (iRawDelta * iGPModifier)
local iCiv = GameInfoTypes.CIVILIZATION_BURMA

function BurmaUA(iOldOwner, bIsCapital, iCityX, iCityY, iNewOwner, iPop, bConquest)
	local pPlayer = Players[iNewOwner]
	local pCity = (Map.GetPlot(iCityX, iCityY):GetPlotCity())
	local iOriginalOwner = pCity:GetOriginalOwner()
	local iTurnFounded = pCity:GetGameTurnFounded ()	--Used to Compile Unique City ID
	local iCityID = ("X" .. iCityX .. "Y" .. iCityY .. "P" .. iOriginalOwner .. "T" .. iTurnFounded)	--Unique City ID
	
	local bIsEverOwned = load(pPlayer, iCityID)
	--Is the conqueror Burma?
	if (pPlayer:GetCivilizationType() == iCiv) then
		
		--Is it actually a conquest? If yes then...
		if bConquest ~= false then
			
			--Has Burma ever owned this city? If no then award GP points.
			
			if bIsEverOwned ~= true then
				
				local pGuildCity = pPlayer:GetCapitalCity()
				
				for cCity in pPlayer:Cities() do
					if cCity:IsHasBuilding(iGuild) then
						pGuildCity = cCity
						
					end
				end
				pGuildCity:ChangeSpecialistGreatPersonProgressTimes100(iType, iDelta)
			end
			--Was this city originally Burma's? If no then place conquered UA pseudo-building
		
			if iOriginalOwner ~= iNewOwner then
				
				pCity:SetNumRealBuilding(iBuilding, 1)
			end
		end
	elseif pCity:IsHasBuilding(iBuilding) then
		pCity:SetNumRealBuilding(iBuilding, 0)
	end
	
	--End of main code
	--Following segments of code used to keep track of previous owners
	
	local pOldPlayer = Players[iOldOwner]	--This is used to mark the previous owner
	
	save(pPlayer, iCityID, true)
	save(pOldPlayer, iCityID, true)
	
end

if JFD_IsCivilisationActive(iCiv) then
	GameEvents.CityCaptureComplete.Add(BurmaUA)
end
--=======================================================================================================================
-- Burmese UU: Kyundaw Conscript
--=======================================================================================================================
-- Kyundaw Conscript: Main Code
-------------------------------------------------------------------------------------------------------------------------
local iPromotion = GameInfoTypes.PROMOTION_KYUNDAW_CONSCRIPTION

function KyundawConscript(pUnit, bIsTurnStart)
	local iDeltaHP = -2
	local iDeltaS = 3
	if pUnit:IsHasPromotion(iPromotion) then
		local iStrength = GameInfo.Units[pUnit:GetUnitType()].Combat
		local pPlot = pUnit:GetPlot()
		pUnit:SetBaseCombatStrength(iStrength)
		--TestPlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE, highlights.RED)
		for pAdjacentPlot in PlotAreaSweepIterator(pPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_INCLUDE) do
			iX = pAdjacentPlot:GetX()
			iY = pAdjacentPlot:GetY()
			--print("Plot X = " .. iX .. ", Y = " .. iY)
			if pAdjacentPlot:IsCity() then
				local pCity = pAdjacentPlot:GetPlotCity()
				local iCityTeam = pCity:GetTeam()
				local iUnitTeam = pUnit:GetTeam()
				local pTeam = Teams[iUnitTeam]
				if	pTeam:IsAtWar(iCityTeam) then
					iDeltaHP = -4
					iDeltaS = 4
				end
				--print("City at X = " .. iX .. ", Y = " .. iY)
				pUnit:SetBaseCombatStrength(iStrength + iDeltaS)
				--print("Combat Strength Increased")
				if bIsTurnStart == true then
					--print("Unit Healed")
					pUnit:ChangeDamage(iDeltaHP)
				end
				break
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------
-- Kyundaw Conscript: Triggers
-------------------------------------------------------------------------------------------------------------------------
function KyundawStartTrigger(iPlayer)
	local pPlayer = Players[iPlayer]
	for pUnit in pPlayer:Units() do
		--print("Is Start Trigger")
		KyundawConscript(pUnit, true)
	end
end

function KyundawMoveTrigger(iPlayer, iUnitID)
	local pPlayer = Players[iPlayer]
	local pUnit = pPlayer:GetUnitByID(iUnitID)
	--print("Is Move Trigger")
	KyundawConscript(pUnit, false)
end

GameEvents.PlayerDoTurn.Add(KyundawStartTrigger)
GameEvents.UnitSetXY.Add(KyundawMoveTrigger)
--=======================================================================================================================
--=======================================================================================================================
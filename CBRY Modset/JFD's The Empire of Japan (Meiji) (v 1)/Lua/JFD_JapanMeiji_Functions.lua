-- JFD_JapanMeiji_Functions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--=======================================================================================================================
-- Includes
--=======================================================================================================================
include("FLuaVector.lua")
include("JFD_JapanMeiji_TopPanel.lua")
--=======================================================================================================================
-- UTILITY FUNCTIONS	
--=======================================================================================================================
-- JFD_IsCivilisationActive
------------------------------------------------------------------------------------------------------------------------
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
-- CORE FUNCTIONS	
--=======================================================================================================================
-- Globals
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID 		= Game.GetActivePlayer()
local activePlayer 			= Players[activePlayerID]
local civilisationID		= GameInfoTypes["CIVILIZATION_JFD_JAPAN_MEIJI"]
local isCivActive			= JFD_IsCivilisationActive(civilisationID)
local isCivActivePlayer		= activePlayer:GetCivilizationType() == civilisationID
local mathMin				= math.min

if isCivActive then
	print("The Meiji Emperor is in this game")
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GoldenAgeCultureModifier
------------------------------------------------------------------------------------------------------------------------
function JFD_GoldenAgeCultureModifier(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		local cultureBonus = JFD_GetJapanMeijiCultureBonus(playerID)
		player:ChangeJONSCulture(cultureBonus)
	end
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GoldenAgeCultureModifier)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GoldenAgeProductionModifier
------------------------------------------------------------------------------------------------------------------------
local buildingJapanMeijiProductionID = GameInfoTypes["BUILDING_JFD_JAPAN_MEIJI_GOLDEN_AGE_PRODUCTION"]

function JFD_GoldenAgeProductionModifier(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		if player:IsGoldenAge() then
			for city in player:Cities() do
				if (not city:IsHasBuilding(buildingJapanMeijiProductionID)) then
					city:SetNumRealBuilding(buildingJapanMeijiProductionID, 1)
				end
			end
		else
			for city in player:Cities() do
				if city:IsHasBuilding(buildingJapanMeijiProductionID) then
					city:SetNumRealBuilding(buildingJapanMeijiProductionID, 0)
				end
			end
		end	
	end
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_GoldenAgeProductionModifier)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_GoldenAgeMilitaryXP
------------------------------------------------------------------------------------------------------------------------
function JFD_GoldenAgeMilitaryXP(playerID, cityID, unitID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		if player:IsGoldenAge() then
			local unit = player:GetUnitByID(unitID)
			if unit:IsCombatUnit() then
				unit:ChangeExperience(15)
			end
		end
	end
end

if isCivActive then
	GameEvents.CityTrained.Add(JFD_GoldenAgeMilitaryXP)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_DaimyoMeleeBonuses
------------------------------------------------------------------------------------------------------------------------
local buildingDaimyoMelee	= GameInfoTypes["BUILDING_JFD_DAIMYO_MELEE_BONUSES"]
local unitPromotionDaimyoID = GameInfoTypes["PROMOTION_JFD_DAIMYO"] 

function JFD_DaimyoMeleeBonuses(playerID)
	local player = Players[playerID]
	if player:IsAlive() then
		for city in player:Cities() do
			local cityPlot = city:Plot()
			local daimyoGarrison = false
			for unitID = 0, cityPlot:GetNumUnits() - 1, 1 do
				if (cityPlot and cityPlot:GetUnit(unitID):IsHasPromotion(unitPromotionDaimyoID)) then
					daimyoGarrison = true
					break
				end
			end

			if daimyoGarrison then
				if (not city:IsHasBuilding(buildingDaimyoMelee)) then
					city:SetNumRealBuilding(buildingDaimyoMelee, 1)
				end
			else
				if city:IsHasBuilding(buildingDaimyoMelee) then
					city:SetNumRealBuilding(buildingDaimyoMelee, 0)
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_DaimyoMeleeBonuses)
------------------------------------------------------------------------------------------------------------------------
-- JFD_DaimyoAIGoldenAgePoints
------------------------------------------------------------------------------------------------------------------------
function JFD_DaimyoAIGoldenAgePoints(playerID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilisationID and (not player:IsHuman())) then 
       	 if player:GetUnitByID(unitID):IsHasPromotion(unitPromotionDaimyoID) then
			player:ChangeGoldenAgeProgressMeter(player:GetGoldenAgeProgressMeter() * 33/100)
         end
    end
end

if (isCivActive and (not isCivActivePlayer)) then
	Events.SerialEventUnitCreated.Add(JFD_DaimyoAIGoldenAgePoints)
end
------------------------------------------------------------------------------------------------------------------------
-- JFD_MikasaGoldenAgePointsFromConstruction
------------------------------------------------------------------------------------------------------------------------
local unitMikasaID		= GameInfoTypes["UNIT_JFD_MIKASA"]
local yieldProductionID = GameInfoTypes["YIELD_PRODUCTION"]

function JFD_MikasaGoldenAgePointsFromConstruction(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilisationID) then
		for city in player:Cities() do
			if city:GetProductionUnit() == unitMikasaID then
				local goldenAgePoints = city:GetBaseYieldRate(yieldProductionID)
				player:ChangeGoldenAgeProgressMeter(goldenAgePoints)
				if player:IsHuman() then
					Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_POSITIVE_TEXT]+{1_Num}[ENDCOLOR] [ICON_GOLDEN_AGE]", goldenAgePoints))
				end
			end
		end
	end
end

if isCivActive then
	GameEvents.PlayerDoTurn.Add(JFD_MikasaGoldenAgePointsFromConstruction)
end
--==========================================================================================================================
--==========================================================================================================================
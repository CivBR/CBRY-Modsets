-- JFD_CarthageHannibal_Functions
-- Author: JFD
-- DateCreated: 6/23/2014 2:36:23 PM
--==========================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("FLuaVector.lua")
include("PlotIterators")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- MOD CHECKS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_IsUsingCPDLL
function JFD_IsUsingCPDLL()
	local cPDLLID = "d1b6328c-ff44-4b0d-aad7-c657f83610cd"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == cPDLLID) then
			return true
		end
	end
	return false
end
local isUsingCPDLL = JFD_IsUsingCPDLL()

-- JFD_IsUsingMercenaries
function JFD_IsUsingMercenaries()
	local mercenariesModID = "10e9728f-d61c-4317-be4f-7d52d6bae6f4"
	for _, mod in pairs(Modding.GetActivatedMods()) do
		if (mod.ID == mercenariesModID) then
			return true
		end
	end
	return false
end
local isUsingMercenaries = JFD_IsUsingMercenaries()

-- JFD_IsCivilisationActive
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
--------------------------------------------------------------------------------------------------------------------------
-- USER SETTINGS
--------------------------------------------------------------------------------------------------------------------------
-- JFD_GetUserSetting
function JFD_GetUserSetting(type)
	for row in GameInfo.JFD_GlobalUserSettings("Type = '" .. type .. "'") do
		return row.Value
	end
end
local userSettingCarthageHannibalMercenaries = JFD_GetUserSetting("JFD_CIVILIZATIONS_CARTHAGE_MERCENARY_UA") == 1
--==========================================================================================================================
-- GLOBALS
--==========================================================================================================================
-- GLOBALS
----------------------------------------------------------------------------------------------------------------------------
local activePlayerID			= Game.GetActivePlayer()
local activePlayer				= Players[activePlayerID]
local civilizationID 			= GameInfoTypes["CIVILIZATION_JFD_CARTHAGE_HANNIBAL"]
local isCarthageHannibalCivActive = JFD_IsCivilisationActive(civilizationID)
local mathCeil 					= math.ceil
local mathFloor 				= math.floor
if isCarthageHannibalCivActive then
	print("Shophet Hannibal is in this game")
end
----------------------------------------------------------------------------------------------------------------------------
-- PUNIC WARS
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_CarthageHannibal_Mercenaries
local promotionMercenariesIgnoreGGID = GameInfoTypes["PROMOTION_JFD_MERCENARY_IGNORE_GG"]
function JFD_CarthageHannibal_Mercenaries(playerID, unitID)
    local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
       	local unit = player:GetUnitByID(unitID)
		if unit:IsHasPromotion(promotionMercenariesIgnoreGGID) then
			unit:SetHasPromotion(promotionMercenariesIgnoreGGID, false)
		end
    end
end
if (isCarthageHannibalCivActive and userSettingCarthageHannibalMercenaries) then
	Events.SerialEventUnitCreated.Add(JFD_CarthageHannibal_Mercenaries)
end
----------------------------------------------------------------------------------------------------------------------------
-- THE HUNDRED AND FOUR
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_CarthageHannibal_HundredAndFour
local buildingHannibalProductionID = GameInfoTypes["BUILDING_JFD_CARTHAGE_HANNIBAL"]
function JFD_CarthageHannibal_HundredAndFour(playerID)
	local player = Players[playerID]
    if (player:IsAlive() and player:GetCivilizationType() == civilizationID) then 
		if Teams[player:GetTeam()]:GetAtWarCount(true) == 0 then
			for city in player:Cities() do
				if city:GetGarrisonedUnit() then
					local unitStrength = city:GetGarrisonedUnit():GetBaseCombatStrength()
					local productionBonus = mathCeil((unitStrength*15)/100)
					city:SetNumRealBuilding(buildingHannibalProductionID, productionBonus)
				else
					if city:IsHasBuilding(buildingHannibalProductionID) then
						city:SetNumRealBuilding(buildingHannibalProductionID, 0)
					end
				end
			end
		else
			for city in player:Cities() do
				if city:IsHasBuilding(buildingHannibalProductionID) then
					city:SetNumRealBuilding(buildingHannibalProductionID, 0)
				end
			end
		end
	end
end
if (isCarthageHannibalCivActive and (not userSettingCarthageHannibalMercenaries)) then
	GameEvents.PlayerDoTurn.Add(JFD_CarthageHannibal_HundredAndFour)
end
----------------------------------------------------------------------------------------------------------------------------
-- SHOPHET
----------------------------------------------------------------------------------------------------------------------------	
-- JFD_CarthageHannibal_Shophet
local unitPromotionGreatAdmiralID = GameInfoTypes["PROMOTION_GREAT_ADMIRAL"]
local unitPromotionGreatGeneralID = GameInfoTypes["PROMOTION_GREAT_GENERAL"]
local unitPromotionShophetID = GameInfoTypes["PROMOTION_JFD_SHOPHET"]
local unitPromotionShophetAdmiralID = GameInfoTypes["PROMOTION_JFD_SHOPHET_ADMIRAL"]
local unitPromotionShophetGeneralID = GameInfoTypes["PROMOTION_JFD_SHOPHET_GENERAL"]
local unitAdmiralID = GameInfoTypes["UNIT_GREAT_ADMIRAL"]
local unitShophetID = GameInfoTypes["UNIT_JFD_SHOPHET"]
function JFD_CarthageHannibal_Shophet(playerID, unitID, unitX, unitY)
	local player = Players[playerID]
	local plot = Map.GetPlot(unitX, unitY)
	local unit = player:GetUnitByID(unitID)
	if (unit and plot and unit:IsHasPromotion(unitPromotionShophetGeneralID)) then
		if plot:IsWater() then
			local newShophet = player:InitUnit(unitAdmiralID, unitX, unitY)
			unit:SetEmbarked(false)
			newShophet:Convert(unit, false)
			newShophet:SetHasPromotion(unitPromotionShophetGeneralID, false)
			newShophet:SetHasPromotion(unitPromotionGreatGeneralID, false)
			newShophet:SetHasPromotion(unitPromotionShophetID, false)
			newShophet:SetHasPromotion(unitPromotionShophetAdmiralID, true)
		end
	elseif (unit and plot and unit:IsHasPromotion(unitPromotionShophetAdmiralID)) then
		if (not plot:IsWater()) then
			local newShophet = player:InitUnit(unitShophetID, unitX, unitY)
			newShophet:Convert(unit, false)
			newShophet:SetHasPromotion(unitPromotionShophetAdmiralID, false)
			newShophet:SetHasPromotion(unitPromotionGreatAdmiralID, false)
			newShophet:SetHasPromotion(unitPromotionShophetGeneralID, true)
			newShophet:SetHasPromotion(unitPromotionShophetID, true)
		end
	end
end
GameEvents.UnitSetXY.Add(JFD_CarthageHannibal_Shophet) 

-- JFD_CarthageHannibal_AtTheGates
local unitClassGreatGeneralID = GameInfoTypes["UNITCLASS_GREAT_GENERAL"]
function JFD_CarthageHannibal_AtTheGates(playerID)
	local player = Players[playerID]
	local playerTeam = Teams[player:GetTeam()]
	if player:GetUnitClassCount(unitClassGreatGeneralID) == 0 then return end
	if isUsingCPDLL then
		for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
			local otherPlayer = Players[otherPlayerID]
			if (player:IsAlive() and otherPlayerID ~= playerID) then
				if playerTeam:IsAtWar(otherPlayer:GetTeam()) then
					for city in otherPlayer:Cities() do
						local shophetDamage = 0
						if city:IsWithinDistanceOfUnit(unitShophetID, 1, false, true) then
							shophetDamage = 30	
						elseif city:IsWithinDistanceOfUnit(unitShophetID, 2, false, true) then
							shophetDamage = 20
						end
						if (shophetDamage > 0 and (player:IsHuman() or otherPlayer:IsHuman())) then
							city:ChangeDamage(shophetDamage)
							Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(city:GetX(), city:GetY()))), Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]-{1_Num} Hannibal ante Portas[ENDCOLOR]", shophetDamage))
						end
					end
				end
			end
		end
	else
		for unit in player:Units() do
			if unit:IsHasPromotion(unitPromotionShophetID) then
				local unitX = unit:GetX()
				local unitY = unit:GetY()
				for otherPlayerID = 0, GameDefines.MAX_MAJOR_CIVS - 1 do
					local otherPlayer = Players[otherPlayerID]
					if (player:IsAlive() and otherPlayerID ~= playerID) then
						if playerTeam:IsAtWar(otherPlayer:GetTeam()) then
							for city in otherPlayer:Cities() do
								local shophetDamage = 0
								local cityX = city:GetX()
								local cityY = city:GetY()
								local distance = Map.PlotDistance(unitX, unitY, cityX, cityY)
								if distance < 2 then
									shophetDamage = 30
								elseif distance < 3 then
									shophetDamage = 20
								end
								if (shophetDamage > 0 and (player:IsHuman() or otherPlayer:IsHuman())) then
									city:ChangeDamage(shophetDamage)
									Events.AddPopupTextEvent(HexToWorld(ToHexFromGrid(Vector2(cityX, cityY))), Locale.ConvertTextKey("[COLOR_NEGATIVE_TEXT]-{1_Num} Hannibal ante Portas[ENDCOLOR]", shophetDamage))
								end
							end
						end
					end
				end
			end
		end
	end		
end	
GameEvents.PlayerDoTurn.Add(JFD_CarthageHannibal_AtTheGates)

-- JFD_CarthageHannibal_ShophetZoC
local unitDomainLandID = GameInfoTypes["DOMAIN_LAND"]
local unitPromotionShophetZoCID = GameInfoTypes["PROMOTION_JFD_SHOPHET_ZOC"]
function JFD_CarthageHannibal_ShophetZoC(playerID)
	local player = Players[playerID]
	if (player:IsAlive() and (not player:IsBarbarian())) then	
		for unit in player:Units() do
			if (unit:GetDomainType() == unitDomainLandID and (not unit:IsEmbarked())) then
				local isNearbyShophet = false
				local unitPlot = unit:GetPlot()
				if isUsingCPDLL then
					isNearbyShophet = (unit:IsWithinDistanceOfUnit(unitShophetID, 1, true) or unit:IsWithinDistanceOfUnit(unitShophetID, 0))
				else
					for adjacentPlot in PlotAreaSweepIterator(unitPlot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
						isNearbyShophet = (adjacentPlot:GetUnit() and adjacentPlot:GetUnit():IsHasPromotion(unitPromotionShophetID))
						if isNearbyShophet == true then 
							break
						end
					end
				end
				if isNearbyShophet then
					if (not unit:IsHasPromotion(unitPromotionShophetZoCID)) then
						unit:SetHasPromotion(unitPromotionShophetZoCID, true)
					end
				else
					if unit:IsHasPromotion(unitPromotionShophetZoCID) then
						unit:SetHasPromotion(unitPromotionShophetZoCID, false)
					end
				end
			end
		end
	end
end
GameEvents.PlayerDoTurn.Add(JFD_CarthageHannibal_ShophetZoC) 
--==========================================================================================================================
--==========================================================================================================================
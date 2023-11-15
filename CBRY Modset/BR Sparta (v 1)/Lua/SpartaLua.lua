-- Citizens from city capture
-- Author: JFD
local civilizationSpartaID = GameInfoTypes["CIVILIZATION_MC_SPARTA"]
function MC_SpartanPopulationFromConquest(oldOwnerID, capital, plotX, plotY, newOwnerID, isConquest)
	if isConquest then
		local player = Players[newOwnerID]
		if (player:IsAlive() and player:GetCivilizationType() == civilizationSpartaID) then
			player:GetCapitalCity():ChangePopulation(1,true)
		end
	end
end
GameEvents.CityCaptureComplete.Add(MC_SpartanPopulationFromConquest)

-- Hoplite promos
-- Author: JFD
include("PlotIterators")

local civilizationSpartaID = GameInfoTypes["CIVILIZATION_MC_SPARTA"]
local unitPromotionSpartanEmoID = GameInfoTypes["PROMOTION_MOLON_LABE"]
local unitPromotionSpartanFriendsID = GameInfoTypes["PROMOTION_ADD_A_STEP_FORWARD"]
function MC_SpartanHoplite(playerID, unitID, plotX, plotY)
	local player = Players[playerID]
	if (player:IsAlive() and player:GetCivilizationType() == civilizationSpartaID) then
		local unit = player:GetUnitByID(unitID)
		if (unit:GetPlot() and (unit:IsHasPromotion(unitPromotionSpartanEmoID) or unit:IsHasPromotion(unitPromotionSpartanFriendsID))) then
			local plot = unit:GetPlot()
			local adjOther = false
			for loopPlot in PlotAreaSpiralIterator(plot, 1, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
				if (loopPlot:IsUnit() and loopPlot:GetUnit():GetOwner() == playerID) then
					adjOther = true
					break
				end
			end
								
			if adjOther then
				if (not unit:IsHasPromotion(unitPromotionSpartanFriendsID)) then
					unit:SetHasPromotion(unitPromotionSpartanFriendsID, true)
					unit:SetHasPromotion(unitPromotionSpartanEmoID, false)
				end
			else
				if unit:IsHasPromotion(unitPromotionSpartanFriendsID) then
					unit:SetHasPromotion(unitPromotionSpartanFriendsID, false)
					unit:SetHasPromotion(unitPromotionSpartanEmoID, true)
				end
			end
		end
	end
end
GameEvents.UnitSetXY.Add(MC_SpartanHoplite)
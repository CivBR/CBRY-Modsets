-- --------------------------------------------------------------
-- -- isUsingYNAEMPMod
-- --------------------------------------------------------------
--     local ynaempModID = "36e88483-48fe-4545-b85f-bafc50dde315"
--     local isUsingYNAEMPMod = false
--      
--     for _, mod in pairs(Modding.GetActivatedMods()) do
--       if (mod.ID == ynaempModID) then
--         isUsingYNAEMPMod = true
--         break
--       end
--     end
--      
--     function JFD_EmbarkationAllWater(playerID, unitID)
--         local player = Players[playerID];
--         if player:IsEverAlive() and isUsingYNAEMPMod then
-- 			if  player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_HAWAII"]  then
-- 			local unit = player:GetUnitByID(unitID)
-- 					if unit:GetDomainType() == GameInfoTypes["DOMAIN_LAND"] then
-- 							local promotionID 
-- 							if player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_INDONESIA"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_TONGA"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_MC_MAORI"]or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_IRELAND"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_PHILIPPINES"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_BUCCANEER"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_JFD_ICELAND"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_LITE_SRI_LANKA"] or player:GetCivilizationType() == GameInfoTypes["CIVILIZATION_ENGLAND"] then
-- 								promotionID = GameInfoTypes["PROMOTION_EMBARKATION"]
-- 							else
-- 								promotionID = GameInfoTypes["PROMOTION_ALLWATER_EMBARKATION"]
-- 							end
-- 							if not unit:IsHasPromotion(promotionID) then
-- 									unit:SetHasPromotion(promotionID, true)
-- 							end
-- 				end
-- 			end
--         end
--     end
--     Events.SerialEventUnitCreated.Add(JFD_EmbarkationAllWater)
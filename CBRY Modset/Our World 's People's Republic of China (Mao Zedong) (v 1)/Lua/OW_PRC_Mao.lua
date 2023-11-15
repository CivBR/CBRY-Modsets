--LEADER_OW_MAO
--BUILDING_OW_DAHUITANG
--UNIT_OW_REDGUARD
--CIVILIZATION_OW_PRC_MAO
--PROMOTION_OW_MAO

-- ============================================================================
-- Enables debug statements
-- ============================================================================
local bDebug = false

function dprint(...)
  if (bDebug) then
    print(string.format(...))
  end
end

-- ============================================================================
-- Includes
-- ============================================================================
include("PlotIterators.lua");

-- ============================================================================
-- Local variables
-- ============================================================================
local OW_MaoLevel3Tenets = {}

-- ============================================================================
-- OW_MaoTraitCultureBoost
-- ============================================================================
-- Used to grant Mao culture when his units move in enemy territory
function OW_MaoTraitCultureBoost(iPlayer, iUnitID, iX, iY)
    local pPlot = Map.GetPlot(iX, iY)
    if (pPlot) then
        dprint("OW_MaoTraitCultureBoost: Plot loaded!")
        local pPlayer = Players[iPlayer]
        if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_OW_PRC_MAO) then
            dprint("OW_MaoTraitCultureBoost: The unit at " .. iX .. ", " .. iY .. " belongs to Chairman Mao.")
            local pUnit = pPlayer:GetUnitByID(iUnitID)
            if (pUnit:GetDomainType() == GameInfoTypes.DOMAIN_LAND) then
                dprint("OW_MaoTraitCultureBoost: This unit is a land unit.")
				local iPlotPlayer = pPlot:GetOwner()
				
				-- We have to check if the teams each player is on are at war with
				-- each other. Even if teams are not set up for the current game,
				-- each player still belongs to a one-player team.
				if (iPlotPlayer ~= -1) then				
					dprint("OW_MaoTraitCultureBoost: This tile has an owner: Player " .. iPlotPlayer)
					if (iPlotPlayer ~= iPlayer) then						
						dprint("OW_MaoTraitCultureBoost: This tile is NOT owned by the current player.")
						if (Teams[Players[iPlotPlayer]:GetTeam()]:IsAtWar(Players[iPlayer]:GetTeam())) then
							dprint("OW_MaoTraitCultureBoost: Chairman Mao is at war with the owner of this tile. Number of policy branches completed: " .. pPlayer:GetNumPolicyBranchesFinished() .. ". Number of level 3 tenets: " .. OW_MaoLevel3Tenets[iPlayer])
							local cultureToGive = 1 + pPlayer:GetNumPolicyBranchesFinished() + OW_MaoLevel3Tenets[iPlayer]                
							dprint("OW_MaoTraitCultureBoost: Chairman Mao will get " .. cultureToGive .. " culture from this unit's movement.")
							
							-- Shows an alert on the screen
							if (iPlayer == Game.GetActivePlayer()) then
								Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_OW_MAO_CULTURE_ALERT_TEXT", cultureToGive))
							end
							pPlayer:ChangeJONSCulture(cultureToGive)
						end
					end
				end
            end
        end
    else
        dprint("OW_MaoTraitCultureBoost: We did not get a tile for some reason.")
    end
end

-- ============================================================================
-- OW_MaoTraitCultureBoostPolicyCheck
-- ============================================================================
-- Used to check if Mao gets a new level 3 tenet
-- Internally, tenets are policies, so we can use the policy event to check
-- if one has been adopted
function OW_MaoTraitCultureBoostPolicyCheck(iPlayer, iPolicy)
    local pPlayer = Players[iPlayer]
    if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_OW_PRC_MAO) then
        dprint("OW_MaoTraitCultureBoostPolicyCheck: Chairman Mao has adopted a policy.")
        
        -- Unfortunately, there is currently no way to check if a player has
        -- changed their ideology via an event. So if a level 1 tenet is
        -- adopted, we will reset and recalculate the number of tenets, in case
        -- they have changed ideologies.
        if (GameInfo.Policies[iPolicy].Level == 1) then
			dprint("OW_MaoTraitCultureBoostPolicyCheck: The policy adopted was a level 1 tenet. Resetting the count of level 3 tenets.")
            OW_MaoLevel3Tenets[iPlayer] = 0
            OW_MaoCheckLevel3Tenets(iPlayer)
        end
        
        -- Increment the count by one if this is a level 3 tenet
        if (GameInfo.Policies[iPolicy].Level == 3) then
            OW_MaoLevel3Tenets[iPlayer] = OW_MaoLevel3Tenets[iPlayer] + 1
            dprint("OW_MaoTraitCultureBoostPolicyCheck: Chairman Mao has selected a level 3 tenet, and has " .. OW_MaoLevel3Tenets[iPlayer] .. " of them.")
        end
    end    
end

-- ============================================================================
-- OW_MaoCheckLevel3Tenets
-- ============================================================================
-- When the game starts, we check to see if Mao has any level 3 tenets. Of
-- course, if this is a new game, he won't, but if it's loaded, he might
function OW_MaoCheckLevel3Tenets(iPlayer)
	dprint("OW_MaoCheckLevel3Tenets: Checking number of level 3 tenets for the Mao player at position " .. iPlayer)
    local pPlayer = Players[iPlayer]
    OW_MaoLevel3Tenets[iPlayer] = 0
    if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_OW_PRC_MAO) then
    
        -- Iterate through all of the policies to get the level 3 tenets
        for iPolicy = 0, #GameInfo.Policies -1, 1 do
            if (GameInfo.Policies[iPolicy] and GameInfo.Policies[iPolicy].Level == 3) then
            
                -- Check if Mao has this tenet
                if (pPlayer:HasPolicy(iPolicy)) then
                    OW_MaoLevel3Tenets[iPlayer] = OW_MaoLevel3Tenets[iPlayer] + 1
                end
            end
        end
    end
    dprint("OW_MaoCheckLevel3Tenets: Mao player at position " .. iPlayer .. " has " .. OW_MaoLevel3Tenets[iPlayer] .. " level 3 tenets.")
end

-- ============================================================================
-- OW_MaoDahuitangThemingBonus
-- ============================================================================
-- Used to grant the theming bonus of the Dahuitang
function OW_MaoDahuitangThemingBonus(iPlayer)
    local pPlayer = Players[iPlayer]
    if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_OW_PRC_MAO) then
        for pCity in pPlayer:Cities() do
        
            -- Check if the Dahuitang's theming bonus is active (the building
            -- should have one defined even if it shouldn't give any extra
            -- Tourism)
            if pCity:GetThemingBonus(GameInfoTypes.BUILDING_OW_DAHUITANG) > 0 then
                
                -- It's easiest to define a dummy building to grant the
                -- Dahuitang's effects. I've made a placeholder name for the
                -- building here - feel free to change it to something else
                pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_OW_DAHUITANG_THEMING_DUMMY, 1)
                dprint("OW_MaoDahuitangThemingBonus: " .. pCity:GetName() .. " gets the Dahuitang's theming bonus effect.")
            else
                pCity:SetNumRealBuilding(GameInfoTypes.BUILDING_OW_DAHUITANG_THEMING_DUMMY, 0)
                dprint("OW_MaoDahuitangThemingBonus: " .. pCity:GetName() .. " doesn't get the Dahuitang's theming bonus effect.")
            end
        end
    end
	
	-- To avoid having to set up a whole new function to do one little thing,
	-- we'll remove the spawn dummy building from the capital at the start of
	-- the next turn as well
	if (pPlayer:GetCapitalCity() and pPlayer:GetCapitalCity():IsHasBuilding(GameInfoTypes.BUILDING_OW_MAO_DUMMY_SPAWN)) then		
		dprint("OW_MaoDahuitangThemingBonus: removing dummy spawn building from " .. pPlayer:GetCapitalCity():GetName())
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_OW_MAO_DUMMY_SPAWN, 0)
	end
end

-- ============================================================================
-- OW_MaoRedGuardGarrison
-- ============================================================================
-- Used to determine if a Red Guard is garrisoned in a city, and therefore
-- should cost no maintenance, and also how much culture it gives
function OW_MaoRedGuardGarrison(iPlayer)
    local pPlayer = Players[iPlayer]
    
    -- Since it's possible that another player owns a Red Guard, we don't check
    -- to see if this is Mao.
    for pUnit in pPlayer:Units() do
            
        -- Check if it's a Red Guard, and if it's garrisoned in a city
        if (pUnit:GetGarrisonedCity() and pUnit:GetUnitType() == GameInfoTypes.UNIT_OW_REDGUARD) then
            dprint("OW_MaoRedGuardGarrison: Found a Red Guard garrisoned in " .. pUnit:GetGarrisonedCity():GetName() .. ".")
                
            -- Here's the ugly part. Unfortunately, there doesn't seem to be a
            -- function that allows you to enable or disable the maintenance
            -- on a unit. So we have to convert the unit to a dummy Red Guard
            -- that is exactly the same as the normal unit, except that it
            -- costs no maintenance.
            pNewUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_OW_REDGUARD_DUMMY, pUnit:GetX(), pUnit:GetY())
            pNewUnit:Convert(pUnit)
            dprint("OW_MaoRedGuardGarrison: Converted this Red Guard to one that costs no maintenance.")
			if (bDebug) then
				if (pNewUnit:GetUnitType() == GameInfoTypes.UNIT_OW_REDGUARD_DUMMY) then
					dprint("OW_MaoRedGuardGarrison: The unit in " .. pNewUnit:GetGarrisonedCity():GetName() .. " has been successfully converted into a Red Guard dummy.")
				else
					dprint("OW_MaoRedGuardGarrison: Something went wrong - the unit was not converted to a Red Guard dummy.")
				end
            end
		end
        
        -- We also need to check for the reverse - a dummy Red Guard that's no
        -- longer garrisoned. It doesn't matter if it doesn't change
        -- immediately since unit maintenance is not applied within a turn
        if (not pUnit:GetGarrisonedCity() and pUnit:GetUnitType() == GameInfoTypes.UNIT_OW_REDGUARD_DUMMY) then
            dprint("OW_MaoRedGuardGarrison: Found a Red Guard dummy at " .. pUnit:GetX() .. ", " .. pUnit:GetY() .. " that is not garrisoned in a city.")
            pNewUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_OW_REDGUARD, pUnit:GetX(), pUnit:GetY())
            pNewUnit:Convert(pUnit)
            dprint("OW_MaoRedGuardGarrison: Converted this Red Guard back to the normal version.")
			if (bDebug) then
				if (pNewUnit:GetUnitType() == GameInfoTypes.UNIT_OW_REDGUARD) then
					dprint("OW_MaoRedGuardGarrison: The unit at " .. pUnit:GetX() .. ", " .. pUnit:GetY() .. " has been successfully converted into a normal Red Guard.")
				else
					dprint("OW_MaoRedGuardGarrison: Something went wrong - the unit was not converted to a normal Red Guard.")
				end
            end
        end      
    end
    
	-- Split this out into another for loop in case it helps this work
    for pUnit in pPlayer:Units() do
        -- Lastly, if it's a garrisoned dummy, give culture (I am honestly
        -- unsure how converting a unit in the middle of going through the
        -- list will affect this, so we'll have to test it out)
        if (pUnit:GetGarrisonedCity() and pUnit:GetUnitType() == GameInfoTypes.UNIT_OW_REDGUARD_DUMMY) then
            dprint("OW_MaoRedGuardGarrison: Found a Red Guard dummy garrisoned in " .. pUnit:GetGarrisonedCity():GetName() .. ".")
            if (bDebug) then
                if (pUnit:GetLevel() > pPlayer:GetNumPolicyBranchesFinished()) then
                    dprint("OW_MaoRedGuardGarrison: This unit's level is higher, granting " .. pUnit:GetLevel() .. " culture.")
                else
                    dprint("OW_MaoRedGuardGarrison: This player's number of completed social policy trees is higher, granting " .. pPlayer:GetNumPolicyBranchesFinished() .. " culture.")
                end
            end
            -- Shows an alert on the screen
            if (iPlayer == Game.GetActivePlayer()) then
                Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_OW_MAO_GARRISON_CULTURE_ALERT_TEXT", math.max(pUnit:GetLevel(), pPlayer:GetNumPolicyBranchesFinished()), pUnit:GetGarrisonedCity():GetName()))
            end
            pPlayer:ChangeJONSCulture(math.max(pUnit:GetLevel(), pPlayer:GetNumPolicyBranchesFinished()))
        end  
	end
end

-- ============================================================================
-- OW_MaoLongMarchDamagePromotion
-- ============================================================================
-- Used to grant the Long March bonus to damaged units. Unfortunately, CiV does
-- not have a way to hook a function to when a unit's damage changes. Therefore
-- this function will activate at the start of Mao's turn and give or take the
-- the promotion based on the damage at this time. Let me know if you would
-- prefer it take effect in other ways (and feel free to ask what what's
-- possible)
function OW_MaoLongMarchDamagePromotion(iPlayer)
    local pPlayer = Players[iPlayer]
    if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_OW_PRC_MAO) then
        for pUnit in pPlayer:Units() do
            
            -- Check the unit's health - if it's damaged enough, give it the
            -- promotion, otherwise, take it away. It doesn't matter if it
            -- tries to give and take when it doesn't need to
            if(pUnit:GetCurrHitPoints() <= (pUnit:GetMaxHitPoints() / 3)) then
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_OW_MAO, true)
				dprint("The unit at " .. pUnit:GetX() .. ", " .. pUnit:GetY() .. " has been given the Long March promotion")
            else
                pUnit:SetHasPromotion(GameInfoTypes.PROMOTION_OW_MAO, false)
				dprint("The unit at " .. pUnit:GetX() .. ", " .. pUnit:GetY() .. " no longer has the Long March promotion")
            end
        end
    end
end

-- ============================================================================
-- OW_MaoRedGuardSpawn
-- ============================================================================
-- Used to spawn more Red Guards when the player enacts a new social policy.
-- Unless you want this to be unique to Mao owned Red Guards only, this will
-- check whenever any player enacts a policy.
-- I feel a dummy promotion given ONLY to spawned Red Guards is the way to go
-- to identify those that were spawned. That makes it easy to check whether a
-- specific Red Guard is spawned or not, as well, if you want to garrison them
-- to get the spawn.
-- Also, so we don't have to use TableSaverLoader just for this one thing, when
-- this triggers a dummy building will be put in the capital, and the spawn will
-- only occur when this building is NOT present
function OW_MaoRedGuardSpawn(iPlayer, iPolicy)
	dprint ("OW_MaoRedGuardSpawn: Player " .. iPlayer .. " has enacted a social policy, checking if they can spawn any Red Guards.")
    local pPlayer = Players[iPlayer]
	
	-- We have to make sure that the player actually has a capital, as well,
	-- otherwise we'll get an error
	if (pPlayer:GetCapitalCity() and not pPlayer:GetCapitalCity():IsHasBuilding(GameInfoTypes.BUILDING_OW_MAO_DUMMY_SPAWN)) then
		dprint("OW_MaoRedGuardSpawn: The current player is eligible for Red Guard spawning this turn.")
		for pUnit in pPlayer:Units() do
		
			-- Since the unit might not be a dummy at this stage, we check for
			-- both Red Guard unit types
			if (not pUnit:IsHasPromotion(GameInfoTypes.PROMOTION_OW_MAO_SPAWNED)) then
				dprint("OW_MaoRedGuardSpawn: This unit does not have the 'spawned' promotion.")
				if (pUnit:GetGarrisonedCity()) then 
					dprint("OW_MaoRedGuardSpawn: This unit is garrisoned in a city.")
					if (pUnit:GetUnitType() == GameInfoTypes.UNIT_OW_REDGUARD or
					pUnit:GetUnitType() == GameInfoTypes.UNIT_OW_REDGUARD_DUMMY) then
						pCity = pPlayer:GetCityByID(pUnit:GetGarrisonedCity())			
						dprint("OW_MaoRedGuardSpawn: Player " .. iPlayer .. " has a non-spawned Red Guard garrisoned in " .. pCity:GetName() .. ", checking if there's a free space to spawn it.")
							
						-- I am going to use PlotIterators' plot sweep iterator here to
						-- check for a free space within two tiles of the city. If it
						-- finds one, it will spawn a Red Guard immediately and stop
						pPlot = Map.GetPlot(pUnit:GetX(), pUnit:GetY())
						for pSweepPlot in PlotAreaSweepIterator(pPlot, 2, SECTOR_NORTH, DIRECTION_CLOCKWISE, DIRECTION_OUTWARDS, CENTRE_EXCLUDE) do
							if (not (pSweepPlot:IsUnit() or pSweepPlot:IsImpassable())) then
								pNewUnit = pPlayer:InitUnit(GameInfoTypes.UNIT_OW_REDGUARD, pSweepPlot:GetX(), pSweepPlot:GetY())
								pNewUnit:SetHasPromotion(GameInfoTypes.PROMOTION_OW_MAO_SPAWNED)
								dprint("OW_MaoRedGuardSpawn: Successfully spawned a new Red Guard unit at " .. pSweepPlot:GetX() .. ", " .. pSweepPlot:GetY() .."!")
								
								-- This will generate a notification for the player
								-- when this occurs. You'll have to supply both a title
								-- and text for it in the GameText for Mao
								nText = Locale.ConvertTextKey("TXT_KEY_OW_MAO_SPAWN_NOTIFICATION_TITLE")
								nTitle = Locale.ConvertTextKey("TXT_KEY_OW_MAO_SPAWN_NOTIFICATION_TEXT", pCity:GetName())
								pPlayer.AddNotification(NotificationTypes.NOTIFICATION_GREAT_PERSON_ACTIVE_PLAYER, nText, nTitle, pSweepPlot:GetX(), pSweepPlot:GetY(), GameInfoTypes.UNIT_OW_REDGUARD)
								
								-- Same as the other alert, make a text key for this
								if (iPlayer == Game.GetActivePlayer()) then
									Events.GameplayAlertMessage(Locale.ConvertTextKey("TXT_KEY_OW_MAO_SPAWN_NOTIFICATION_TEXT", pCity:GetName()))
								end
								break
							end
						end
					end
				else
					dprint("OW_MaoRedGuardSpawn: This unit is not garrisoned in a city and cannot spawn anything.")
				end
			else
				dprint("OW_MaoRedGuardSpawn: This unit does have the 'spawned' promotion and cannot spawn anything.")
			end
		end
		pPlayer:GetCapitalCity():SetNumRealBuilding(GameInfoTypes.BUILDING_OW_MAO_DUMMY_SPAWN, 1)
	end
end

-- ============================================================================
-- Event listeners
-- ============================================================================
-- Attaches the above functions to events, only if there's at least one Mao
-- player in the game.
for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive() and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_OW_PRC_MAO) then
        print("Chairman Mao is in this game.")
        GameEvents.UnitSetXY.Add(OW_MaoTraitCultureBoost)
        GameEvents.PlayerAdoptPolicy.Add(OW_MaoTraitCultureBoostPolicyCheck)
        GameEvents.PlayerDoTurn.Add(OW_MaoDahuitangThemingBonus)
        GameEvents.PlayerDoTurn.Add(OW_MaoRedGuardGarrison)
        GameEvents.PlayerDoTurn.Add(OW_MaoLongMarchDamagePromotion)
		GameEvents.PlayerAdoptPolicy.Add(OW_MaoRedGuardSpawn)
        break
    end
end

-- We'll also check how many level 3 tenets each Mao player has. If it's a
-- new game they'll have none, obviously, but it'll get the amount if this
-- is a loaded game
for iPlayer = 0, GameDefines.MAX_MAJOR_CIVS-1, 1 do
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsEverAlive() and pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_OW_PRC_MAO) then
        OW_MaoCheckLevel3Tenets(iPlayer)        
    end
end
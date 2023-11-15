-- GoldenAgeBegins LuaEvent
-- Written by: TopHatPaladin
-- 2019-09-26
----------------------------

-- ============= --
-- ARGUMENT INFO --
-- ============= --

--[[

The arguments in the THP_GoldenAgeBegins LuaEvent are, in order:
* playerID - an integer - the ID of the Player whose Golden Age is beginning
* iTurns - an integer - the number of turns remaining in the Golden Age; not necessarily equal to the number of turns most recently added to the golden age (see next bullet point)
* bIsNewGA - a boolean - returns true if the player was not previously in a Golden Age; returns false if a previously active Golden Age is simply lengthened
* bIsUnit - a boolean - returns true if the Golden Age was triggered by expending a unit
* bIsBuilding - a boolean - returns true if the Golden Age was triggered by constructing a building
* bIsPolicy - a boolean - returns true if the Golden Age was triggered by acquiring a Social Policy

Due to the limitations of what I can do to the game's base code, I can't have the LuaEvent trigger when a Golden Age is manually invoked with Lua.

--]]

-- =================== --
-- GOLDEN AGE LUAEVENT --
-- =================== --

local tGoldenAgeTurns = {}
function THP_GoldenAge_GameStart_Tabulate()
	for k, vPlayer in pairs(Players) do
		tGoldenAgeTurns[vPlayer] = vPlayer:GetGoldenAgeTurns()
	end
end
Events.SequenceGameInitComplete.Add(THP_GoldenAge_GameStart_Tabulate)

function THP_GoldenAge_DoTurn(playerID)
	local pPlayer = Players[playerID]
	local iTurns = pPlayer:GetGoldenAgeTurns()
	if iTurns > tGoldenAgeTurns[pPlayer] then
		local bIsNewGA = (tGoldenAgeTurns[pPlayer] == 0)
		LuaEvents.THP_GoldenAgeBegins(playerID, iTurns, bIsNewGA, false, false, false)
	end
	tGoldenAgeTurns[pPlayer] = iTurns
end
GameEvents.PlayerDoTurn.Add(THP_GoldenAge_DoTurn)

function THP_GoldenAge_UnitPrekill(playerID, unitID, unitType, iX, iY, bDelay, killerID)
	if (killerID == -1) and (not bDelay) then
		if GameInfo.Units[unitType].GoldenAgeTurns > 0 then
			local pPlayer = Players[playerID]
			local iTurns = pPlayer:GetGoldenAgeTurns()
			if iTurns > tGoldenAgeTurns[pPlayer] then
				local bIsNewGA = (tGoldenAgeTurns[pPlayer] == 0)
				LuaEvents.THP_GoldenAgeBegins(playerID, iTurns, bIsNewGA, true, false, false)
			end
			tGoldenAgeTurns[pPlayer] = iTurns
		end
	end
end
GameEvents.UnitPrekill.Add(THP_GoldenAge_UnitPrekill)

function THP_GoldenAge_CityConstructed(playerID, cityID, buildingType)
	if GameInfo.Buildings[buildingType].GoldenAge then
		local pPlayer = Players[playerID]
		local iTurns = pPlayer:GetGoldenAgeTurns()
		local bIsNewGA = (tGoldenAgeTurns[pPlayer] == 0)
		LuaEvents.THP_GoldenAgeBegins(playerID, iTurns, bIsNewGA, false, true, false)
		tGoldenAgeTurns[pPlayer] = iTurns
	end
end
GameEvents.CityConstructed.Add(THP_GoldenAge_CityConstructed)

function THP_GoldenAge_AdoptPolicy(playerID, policyID)
	if GameInfo.Policies[policyID].GoldenAgeTurns > 0 then
		local pPlayer = Players[playerID]
		local iTurns = pPlayer:GetGoldenAgeTurns()
		local bIsNewGA = (tGoldenAgeTurns[pPlayer] == 0)
		LuaEvents.THP_GoldenAgeBegins(playerID, iTurns, bIsNewGA, false, false, true)
		tGoldenAgeTurns[pPlayer] = iTurns
	end
end
GameEvents.PlayerAdoptPolicy.Add(THP_GoldenAge_AdoptPolicy)
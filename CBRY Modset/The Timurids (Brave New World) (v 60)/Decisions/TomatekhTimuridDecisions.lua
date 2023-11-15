--Tomatekh

print("Timurid Decisions")

local bClassWritersGuild = GameInfoTypes.BUILDINGCLASS_WRITERS_GUILD;
local bCaravansaray = GameInfoTypes.BUILDING_CARAVANSARY
local bSilkDummy = GameInfoTypes.BUILDING_SILK_ROAD_DUMMY
local tHorsebackRiding = GameInfoTypes.TECH_HORSEBACK_RIDING;

--Chagatai Literature

local Decisions_TimuridChagatai = {}
	Decisions_TimuridChagatai.Name = "TXT_KEY_DECISIONS_TOMATEKH_TIMURID_CHAGATAI"
	Decisions_TimuridChagatai.Desc = "TXT_KEY_DECISIONS_TOMATEKH_TIMURID_CHAGATAI_DESC"
	HookDecisionCivilizationIcon(Decisions_TimuridChagatai, "CIVILIZATION_TIMURIDS_MOD")
	Decisions_TimuridChagatai.Weight = nil
	Decisions_TimuridChagatai.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TIMURIDS_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_TimuridChagatai") == true then
			Decisions_TimuridChagatai.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_TIMURID_CHAGATAI_ENACTED_DESC")
			return false, false, true
		end		
	
		local pTeam = pPlayer:GetTeam();
		local EraCount = ((Teams[pTeam]:GetCurrentEra()) + 1);
		local iCost = math.ceil((EraCount * 35) * iMod)
		Decisions_TimuridChagatai.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_TIMURID_CHAGATAI_DESC", iCost)

		local cClassWritersGuild = pPlayer:GetBuildingClassCount(bClassWritersGuild)
		if cClassWritersGuild <= 0 then return true, false end
		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 1) then return true, false end

		return true, true
	end
	)
	
	Decisions_TimuridChagatai.DoFunc = (
	function(pPlayer)
		local pTeam = pPlayer:GetTeam();
		local EraCount = ((Teams[pTeam]:GetCurrentEra()) + 1);
		local iCost = math.ceil((EraCount * 35) * iMod)
		pPlayer:ChangeJONSCulture(iCost)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -1)
		save(pPlayer, "Decisions_TimuridChagatai", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TIMURIDS_MOD"], "Decisions_TimuridChagatai", Decisions_TimuridChagatai)

--Silk Road

local Decisions_TimuridSilkRoad = {}
	Decisions_TimuridSilkRoad.Name = "TXT_KEY_DECISIONS_TOMATEKH_TIMURID_SILK_ROAD"
	Decisions_TimuridSilkRoad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_TIMURID_SILK_ROAD_DESC")
	HookDecisionCivilizationIcon(Decisions_TimuridSilkRoad, "CIVILIZATION_TIMURIDS_MOD")
	Decisions_TimuridSilkRoad.Weight = nil
	Decisions_TimuridSilkRoad.CanFunc = (
	function(pPlayer)		
		if (pPlayer:GetCivilizationType() ~= GameInfoTypes["CIVILIZATION_TIMURIDS_MOD"]) then return false, false end
		if load(pPlayer, "Decisions_TimuridSilkRoad") == true then
			Decisions_TimuridSilkRoad.Desc = Locale.ConvertTextKey("TXT_KEY_DECISIONS_TOMATEKH_TIMURID_SILK_ROAD_ENACTED_DESC")
			return false, false, true
		end		

		if (pPlayer:GetNumResourceAvailable(iMagistrate, false) < 2) then return true, false end
		if not (Teams[pPlayer:GetTeam()]:IsHasTech(tHorsebackRiding)) then return true, false end	
				local tradeCount = 0;
		local tradedata = pPlayer:GetTradeRoutesToYou();
		for i,v in ipairs(tradedata) do
			if Players[v.FromCity:GetOwner()] ~= pPlayer then
				tradeCount = tradeCount + 1;
			end
		end
		if tradeCount <= 1 then return true, false end

		return true, true
	end
	)
	
	Decisions_TimuridSilkRoad.DoFunc = (
	function(pPlayer)
		pPlayer:ChangeNumResourceTotal(iMagistrate, -2)

		for pCity in pPlayer:Cities() do
			if not pCity:IsHasBuilding(bCaravansaray) then
				pCity:SetNumRealBuilding(bCaravansaray, 1);
			end
			if not pCity:IsHasBuilding(bSilkDummy) then
				pCity:SetNumRealBuilding(bSilkDummy, 1);
			end
		end

		save(pPlayer, "Decisions_TimuridSilkRoad", true)
	end
	)

Decisions_AddCivilisationSpecific(GameInfoTypes["CIVILIZATION_TIMURIDS_MOD"], "Decisions_TimuridSilkRoad", Decisions_TimuridSilkRoad)

local bWritersGuild = GameInfoTypes.BUILDING_WRITERS_GUILD
local sWriter = GameInfo.Specialists.SPECIALIST_WRITER.ID

GameEvents.PlayerDoTurn.Add(
function(iPlayer)
	local pPlayer = Players[iPlayer];
	if (pPlayer:IsAlive()) then
		if (pPlayer:GetCivilizationType() == GameInfoTypes.CIVILIZATION_TIMURIDS_MOD) then
			if load(pPlayer, "Decisions_TimuridChagatai") == true then
				for pCity in pPlayer:Cities() do
					if pCity:IsHasBuilding(bWritersGuild) then
						pCity:ChangeSpecialistGreatPersonProgressTimes100(sWriter, 200)
					end
				end
			end
			if load(pPlayer, "Decisions_TimuridSilkRoad") == true then
				for pCity in pPlayer:Cities() do
					if not pCity:IsHasBuilding(bCaravansaray) then
						pCity:SetNumRealBuilding(bCaravansaray, 1);
					end
					if not pCity:IsHasBuilding(bSilkDummy) then
						pCity:SetNumRealBuilding(bSilkDummy, 1);
					end
				end
			end
		end
	end
end)
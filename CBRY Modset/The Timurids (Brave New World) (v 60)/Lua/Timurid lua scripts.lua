print("Timurids Scripts")

-- Capture Buildings

-- Zero Capture
local zerobuildings = {
	GameInfoTypes.BUILDING_STABLE,
	GameInfoTypes.BUILDING_MONUMENT,
	GameInfoTypes.BUILDING_BARRACKS,
	GameInfoTypes.BUILDING_ARMORY,
	GameInfoTypes.BUILDING_MILITARY_ACADEMY,
	GameInfoTypes.BUILDING_ARSENAL,
	GameInfoTypes.BUILDING_WALLS,
	GameInfoTypes.BUILDING_CASTLE,
	GameInfoTypes.BUILDING_MILITARY_BASE,
	GameInfoTypes.BUILDING_HOTEL,
	GameInfoTypes.BUILDING_CONSTABLE,
	GameInfoTypes.BUILDING_POLICE_STATION,
	}

-- Standard Capture 66-100
local standardbuildings = {
	GameInfoTypes.BUILDING_WATERMILL,
	GameInfoTypes.BUILDING_CIRCUS,
	GameInfoTypes.BUILDING_FORGE,
	GameInfoTypes.BUILDING_WINDMILL,
	GameInfoTypes.BUILDING_HYDRO_PLANT,
	GameInfoTypes.BUILDING_OBSERVATORY,
	GameInfoTypes.BUILDING_MONASTERY,
	GameInfoTypes.BUILDING_GARDEN,
	GameInfoTypes.BUILDING_COLOSSEUM,
	GameInfoTypes.BUILDING_THEATRE,
	GameInfoTypes.BUILDING_STADIUM,
	GameInfoTypes.BUILDING_TEMPLE,
	GameInfoTypes.BUILDING_OPERA_HOUSE,
	GameInfoTypes.BUILDING_MUSEUM,
	GameInfoTypes.BUILDING_BROADCAST_TOWER,
	GameInfoTypes.BUILDING_GRANARY,
	GameInfoTypes.BUILDING_HOSPITAL,
	GameInfoTypes.BUILDING_MEDICAL_LAB,
	GameInfoTypes.BUILDING_WORKSHOP,
	GameInfoTypes.BUILDING_FACTORY,
	GameInfoTypes.BUILDING_SPACESHIP_FACTORY,
	GameInfoTypes.BUILDING_MARKET,
	GameInfoTypes.BUILDING_BANK,
	GameInfoTypes.BUILDING_STOCK_EXCHANGE,
	GameInfoTypes.BUILDING_LIBRARY,
	GameInfoTypes.BUILDING_PUBLIC_SCHOOL,
	GameInfoTypes.BUILDING_LABORATORY,
	GameInfoTypes.BUILDING_AQUEDUCT,
	GameInfoTypes.BUILDING_STONE_WORKS,
	GameInfoTypes.BUILDING_CARAVANSARY,
	GameInfoTypes.BUILDING_AIRPORT,
	GameInfoTypes.BUILDING_AMPHITHEATER,
	GameInfoTypes.BUILDING_SHRINE,
	GameInfoTypes.BUILDING_RECYCLING_CENTER,
	GameInfoTypes.BUILDING_BOMB_SHELTER,
	GameInfoTypes.BUILDING_CATHEDRAL,
	GameInfoTypes.BUILDING_MOSQUE,
	GameInfoTypes.BUILDING_PAGODA,
	GameInfoTypes.BUILDING_TIMURID_MADRASAH_MOD,
	}

-- Coastal
local waterbuildings = {
	GameInfoTypes.BUILDING_LIGHTHOUSE,
	GameInfoTypes.BUILDING_HARBOR,
	GameInfoTypes.BUILDING_SEAPORT,
	}

-- Mutually Exclusive
local pSolar = GameInfoTypes.BUILDING_SOLAR_PLANT;
local pNucleur = GameInfoTypes.BUILDING_NUCLEAR_PLANT;

local bTimDummy = GameInfoTypes.BUILDING_TIMURID_MOD_DUMMY;

--[[
function NonTimuridCheck (iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local player = Players[iOldOwner];
	local plot = Map.GetPlot(iX, iY);
	local city = plot:GetPlotCity();
	local bUniqueCapture = GetTraitInfo(iNewOwner).UniqueCapture
	if not bUniqueCapture then
		for _, iBuilding in pairs(zerobuildings) do
			if (city:GetNumBuilding(iBuilding) > 0) then
				city:SetNumRealBuilding(iBuilding, 0);
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(NonTimuridCheck)
--]]

function JewelOfTheEast (iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local nPlayer = Players[iNewOwner];
	local plot = Map.GetPlot(iX, iY);
	local city = plot:GetPlotCity();
	local title = "Jewel of the East";
	local bUniqueCapture = GetTraitInfo(iNewOwner).UniqueCapture
	if bUniqueCapture then
		for cCity in nPlayer:Cities() do
			if cCity:IsCapital() then
				-- Zero Capture Check
				for _, iBuilding in pairs(zerobuildings) do
					if (city:GetNumBuilding(iBuilding) > 0) then
						if not cCity:IsHasBuilding(iBuilding) then
							cCity:SetNumRealBuilding(iBuilding, 1);
							local descr = "Foreign architects have constructed a " .. Locale.ConvertTextKey(GameInfo.Buildings[iBuilding].Description) .. " in your [ICON_CAPITAL] Capital!";
							nPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, cCity:GetX(), cCity:GetY(), iBuilding, -1);
						end
					end
				end
				-- Standard Capture Check
				for _, sBuilding in pairs(standardbuildings) do
					if (city:GetNumBuilding(sBuilding) > 0) then
						if not cCity:IsHasBuilding(sBuilding) then
							cCity:SetNumRealBuilding(sBuilding, 1);
							local descr = "Foreign architects have constructed a " .. Locale.ConvertTextKey(GameInfo.Buildings[sBuilding].Description) .. " in your [ICON_CAPITAL] Capital!";
							nPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, cCity:GetX(), cCity:GetY(), sBuilding, -1);
						end
					end
				end
				-- Coastal Check
				for _, wBuilding in pairs(waterbuildings) do
					if cCity:IsCoastal() then
						if (city:GetNumBuilding(wBuilding) > 0) then
							if not cCity:IsHasBuilding(wBuilding) then
								cCity:SetNumRealBuilding(wBuilding, 1);
								local descr = "Foreign architects have constructed a " .. Locale.ConvertTextKey(GameInfo.Buildings[wBuilding].Description) .. " in your [ICON_CAPITAL] Capital!";
								nPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, cCity:GetX(), cCity:GetY(), wBuilding, -1);
							end
						end
					end
				end
				-- Power Plants
				if city:IsHasBuilding(pSolar) then
					if cCity:IsHasBuilding(pNucleur) then
						cCity:SetNumRealBuilding(pNucleur, 0);
					end
					if not cCity:IsHasBuilding(pSolar) then
						cCity:SetNumRealBuilding(pSolar, 1);
						local descr = "Foreign architects have constructed a " .. Locale.ConvertTextKey(GameInfo.Buildings[pSolar].Description) .. " in your [ICON_CAPITAL] Capital!";
						nPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, cCity:GetX(), cCity:GetY(), pSolar, -1);
					end
				end
				if city:IsHasBuilding(pNucleur) then	
					if not cCity:IsHasBuilding(pSolar) then
						if not cCity:IsHasBuilding(pNucleur) then
							cCity:SetNumRealBuilding(pNucleur, 1);
							local descr = "Foreign architects have constructed a " .. Locale.ConvertTextKey(GameInfo.Buildings[pNucleur].Description) .. " in your [ICON_CAPITAL] Capital!";
							nPlayer:AddNotification(NotificationTypes.NOTIFICATION_WONDER_COMPLETED, descr, title, cCity:GetX(), cCity:GetY(), pNucleur, -1);
						end
					end
				end
			end
		end
	end
end
GameEvents.CityCaptureComplete.Add(JewelOfTheEast)

-- Palace Check

GameEvents.CityCaptureComplete.Add(
function(iOldOwner, bIsCapital, iX, iY, iNewOwner, iPop, bConquest)
	local nPlayer = Players[iNewOwner];
	local bUniqueCapture = GetTraitInfo(iNewOwner).UniqueCapture
	if bUniqueCapture then
		for cCity in nPlayer:Cities() do
			if cCity:IsCapital() then
				if not cCity:IsHasBuilding(bTimDummy) then
					cCity:SetNumRealBuilding(bTimDummy, 1);
				end
			end
		end
	end
end)

function GetTraitInfo(iPlayer)
	local player = Players[iPlayer];
	local leaderType = GameInfo.Leaders[player:GetLeaderType()].Type
	local traitType = GameInfo.Leader_Traits("LeaderType ='" .. leaderType .. "'")().TraitType
	return GameInfo.Traits[traitType]
end

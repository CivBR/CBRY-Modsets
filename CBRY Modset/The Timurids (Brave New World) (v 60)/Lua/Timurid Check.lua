print ("Timurids Check")

local TimuridsID = GameInfoTypes.CIVILIZATION_TIMURIDS_MOD;

for i, player in pairs(Players) do
	if player:IsEverAlive() then
		if player:GetCivilizationType() == TimuridsID then
			include("Timurid lua scripts")
			break;
		end
	end
end
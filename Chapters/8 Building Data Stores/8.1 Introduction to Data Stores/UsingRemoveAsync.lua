local DataStoreService = game:GetService("DataStoreService")

local PrimaryDataStore = DataStoreService:GetDataStore("PrimaryDataStore")
local SecondaryDataStore = DataStoreService:GetDataStore("SecondaryDataStore")

function removeAllPlayerData(userId)
	local suc, err = pcall(function()
		PrimaryDataStore:RemoveAsync("Plr_" .. userId)
		SecondaryDataStore:RemoveAsync("Plr_" .. userId)
	end)
	if not suc then
		warn(err)
	end
end
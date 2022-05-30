local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local TestDataStore = DataStoreService:GetDataStore("DictionaryTest")

function playerLeft(player)
	local randomDictionary = {
		["Coins"] = 5,
		["Gems"] = 0,
		["PlayTime"] = 0,
		["TimesPlayed"] = 0
	}
	
	local suc, err = pcall(function()
		TestDataStore:SetAsync(
			"Plr_" .. player.UserId,
			randomDictionary
		)
	end)
	if not suc then
		warn(err)
	end
end

Players.PlayerRemoving:Connect(playerLeft)
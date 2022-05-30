local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local DataStoreTesting = DataStoreService:GetDataStore("LastPlayed")

--

function playerJoined(player)
	-- Getting data from data store
	local currentPlayingSecond = os.time()
	local lastPlayingSecond = nil
	
	local suc, err = pcall(function()
		lastPlayingSecond = DataStoreTesting:GetAsync(
			-- Key
			"Plr_" .. player.UserId
		)
	end)
	if not suc then
		warn(err)
	end
	
	-- Using data
	if lastPlayingSecond ~= nil then
		print("It has been [" .. currentPlayingSecond - lastPlayingSecond .. "] seconds since you last played!")
	else
		print("It is your first time playing!")
	end
	
end

function playerLeft(player)
	
	-- Saving the second the player leaves
	-- We can use this second to figure out the last time
	-- the player joined.
	local suc, err = pcall(function()
		DataStoreTesting:SetAsync(
			-- Key
			"Plr_" .. player.UserId,
			
			-- Data
			os.time()
		)
	end)
	if not suc then
		warn(err)
	end
	
end

--

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
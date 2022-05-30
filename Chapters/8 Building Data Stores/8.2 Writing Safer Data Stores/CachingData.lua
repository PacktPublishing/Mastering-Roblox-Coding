local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local DataStore = DataStoreService:GetDataStore("PlayerData")

local DEFAULT_PLAYER_DATA = {
	["coins"] = 500,
	["gems"] = 0,
	["times_played"] = 0
}

local playerData = {}


-- PLAYER FUNCTIONS

function playerJoined(player)
	-- Getting and Caching data
	playerData[player.Name] = get(player)
	
	-- Updating times_played
	playerData[player.Name]["times_played"] += 1
	print(playerData[player.Name]["times_played"])
end

function playerLeft(player)
	-- Saving data
	save(player)
	
	-- Removing cached data
	playerData[player.Name] = nil
end


-- DATA STORE FUNCTIONS

function get(player)
	local loaded = nil
	--
	local suc, err = pcall(function()
		loaded = DataStore:GetAsync("Plr_" .. player.UserId)
	end)
	if not suc then
		warn(err)
	end
	--
	if loaded == nil then
		return copyTable(DEFAULT_PLAYER_DATA)
	else
		return loaded
	end
end

function save(player)
	local suc, err = pcall(function()
		DataStore:SetAsync(
			-- Key
			"Plr_" .. player.UserId,
			
			-- Cached data
			playerData[player.Name]
		)
	end)
	if not suc then
		warn(err)
	end
end

-- TABLE FUNCTIONS

function copyTable(toCopy)
	-- Creating new copy table
	local copy = {}
	
	-- Looping through toCopy table
	for i, v in pairs(toCopy) do
		-- Checking if value is a nested table/dictionary
		if typeof(v) == "table" then
			-- Copying nested table/dictionary
			v = copyTable(v)
		end
		
		-- Inserting value into copied table
		copy[i] = v
	end
	
	-- Returning table copy
	return copy
end


--

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
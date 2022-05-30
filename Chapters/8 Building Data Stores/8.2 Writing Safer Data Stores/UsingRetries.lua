local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local DataStore = DataStoreService:GetDataStore("PlayerData")

local AUTO_SAVE_INTERVAL = 30

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

-- AUTO SAVE

function autoSave()
	while true do
		-- Waiting auto-save interval
		task.wait(AUTO_SAVE_INTERVAL)

		-- Getting players
		for _, player in pairs(Players:GetPlayers()) do
			-- Checking if data is cached
			if playerData[player.Name] ~= nil then
				-- Auto-Saving
				save(player)
			end
		end
	end
end


-- DATA STORE FUNCTIONS

function get(player)
	local loaded = nil
	local suc, err
	--
	repeat
		suc, err = pcall(function()
			loaded = DataStore:GetAsync("Plr_" .. player.UserId)
		end)
		if not suc then
			-- Printing warning
			warn(err)

			-- Small wait period in between retries
			task.wait(6)
		end
	until
	suc
	--
	if loaded == nil then
		return copyTable(DEFAULT_PLAYER_DATA)
	else
		return loaded
	end
end

function save(player)
	local suc, err
	repeat
		suc, err = pcall(function()
			DataStore:SetAsync(
				-- Key
				"Plr_" .. player.UserId,

				-- Cached data
				playerData[player.Name]
			)
		end)
		if not suc then
			-- Printing warning
			warn(err)
			
			-- Small wait period in between retries
			task.wait(6)
		end
	until
	suc
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

task.spawn(autoSave)
Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
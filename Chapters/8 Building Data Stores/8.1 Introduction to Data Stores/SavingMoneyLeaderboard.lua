local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local CurrencyDataStore = DataStoreService:GetDataStore("CurrencyData")

local STARTER_MONEY = 500
local REWARD_INTERVAL = 30
local REWARD_AMOUNT = 10


-- PLAYER FUNCTIONS

function playerJoined(player)
	-- Creating Leaderstats
	createLeaderstats(player)
	
	-- Loading Data
	local loadedCurrency = nil
	
	local suc, err = pcall(function()
		-- Getting data store value
		loadedCurrency = CurrencyDataStore:GetAsync("Plr_" .. player.UserId)
	end)
	if not suc then
		-- Printing error
		warn(err)
		
		-- Making leaderstat negative
		incrementLeaderstat(player, "💸 Money", -(getLeaderstatValue(player, "💸 Money") + 1))
		
		-- Kicking player
		player:Kick("\n[Data Failed]\nFailed to load data. Please rejoin")
	else
		-- Setting default data
		if loadedCurrency == nil then
			loadedCurrency = STARTER_MONEY
		end
		
		-- Setting leaderstat
		incrementLeaderstat(player, "💸 Money", loadedCurrency)
		
		-- Interval Money
		enablePlayingReward(player)
		print("Printed when the player left!")
	end
end

function playerLeft(player)
	local suc, err = pcall(function()
		local money = getLeaderstatValue(player, "💸 Money")
		if money >= 0 then
			CurrencyDataStore:SetAsync(
				"Plr_" .. player.UserId,
				money
			)
		end
	end)
	if not suc then
		warn(err)
	end
end


-- PLAYING REWARD

function enablePlayingReward(player)
	while player:IsDescendantOf(Players) do
		task.wait(REWARD_INTERVAL)
		incrementLeaderstat(player, "💸 Money", REWARD_AMOUNT)
	end
end


-- LEADERSTAT FUNCTIONS

function createLeaderstats(player)
	local leaderstats = Instance.new("Model")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player

	local money = Instance.new("IntValue")
	money.Name = "💸 Money"
	money.Parent = leaderstats
	money.Value = 0
end

function getLeaderstatValue(player, leaderstat)
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats ~= nil then
		local statistic = leaderstats:FindFirstChild(leaderstat)
		if statistic ~= nil then
			return statistic.Value
		else
			warn("Statistic named [" .. leaderstat .. "] does not exist!")
		end
	end
	return 0
end

function incrementLeaderstat(player, leaderstat, value)
	local leaderstats = player:FindFirstChild("leaderstats")
	if leaderstats ~= nil then
		local statistic = leaderstats:FindFirstChild(leaderstat)
		if statistic ~= nil then
			statistic.Value += value
		end
	end
end

--

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
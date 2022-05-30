local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local RichestPlayers = DataStoreService:GetOrderedDataStore("RichestPlayers")

local DataManager = require(PATH_TO_DATAMANAGER)

local LEADER_BOARD_SIZE = 25

--

function updatePlayer(player)
	-- Getting coins
	local coins = nil
	--
	local suc, err = pcall(function()
		coins = DataManager:Get(player, "coins")
	end)
	
	-- Checking if data was retrieved
	if coins ~= nil then
		-- Waiting for budget
		yieldUntilBudget(Enum.DataStoreRequestType.SetIncrementSortedAsync)

		-- Saving data
		local suc, err
		repeat
			suc, err = pcall(function()
				RichestPlayers:SetAsync(
					player.UserId,
					coins
				)
			end)
			if not suc then
				warn(err)
				task.wait(6)
			end
		until
		suc
	end
end

function printRichestPlayers()
	-- Waiting for budget
	yieldUntilBudget(Enum.DataStoreRequestType.GetSortedAsync)
	
	-- Richest Players variable
	local richest = {}
	
	-- Getting richest players
	local suc, err
	repeat
		suc, err = pcall(function()
			local ascending = false
			local pages = RichestPlayers:GetSortedAsync(ascending, LEADER_BOARD_SIZE)
			local page = pages:GetCurrentPage()
			--
			for rank, data in pairs(page) do
				-- Declaring data
				local userid = data.key
				local coins = data.value
				local username = "[ Account Deleted ]"
				
				-- Getting username
				pcall(function()
					username = Players:GetNameFromUserIdAsync(userid)
				end)
				
				-- Updating richest table
				richest[rank] = {["username"] = username, ["coins"] = coins}
			end
		end)
		if not suc then
			warn(err)
			task.wait(6)
		end
	until
	suc
	
	-- Printing table
	print(richest)
end

--

function yieldUntilBudget(dataStoreRequestType)
	while 
		DataStoreService:GetRequestBudgetForRequestType(dataStoreRequestType) <= 0
	do
		task.wait(1)
	end
end

--

printRichestPlayers()
Players.PlayerRemoving:Connect(updatePlayer)
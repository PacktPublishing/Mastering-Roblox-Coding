local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local tools = ServerStorage.Tools

local gamePasses = {
	[123456789] = function(player)
		tools.GamePassTool:Clone().Parent = player.Backpack
		tools.GamePassTool:Clone().Parent = player.StarterGear
	end
}

--

function playerJoined(player)
	-- Looping through all game passes
	for gamePassId, rewardFunction in pairs(gamePasses) do
		-- Checking if game pass was purchased
		if
			MarketplaceService:UserOwnsGamePassAsync(
				-- User Id
				player.UserId,
				
				-- GamePass Id
				gamePassId
			)
		then
			-- Rewarding game pass
			rewardFunction(player)
		end
	end
end

function purchaseFinished(player, gamePassId, purchased)
	if purchased == true then
		-- Checking if game pass reward was programming
		if gamePasses[gamePassId] == nil then
			warn("GamePass [" .. gamePassId .. "] reward was not programmed")
			return
		end
		
		-- Rewarding game pass
		gamePasses[gamePassId](player)
	end
end

--

Players.PlayerAdded:Connect(playerJoined)
MarketplaceService.PromptGamePassPurchaseFinished:Connect(purchaseFinished)
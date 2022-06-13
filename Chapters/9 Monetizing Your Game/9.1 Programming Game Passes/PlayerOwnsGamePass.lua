--[[
    Instructions:
    - Create a new game pass,
    - Create a script in the ServerScriptService and paste this script,
    - Replace the game pass id in this script with your own game pass id.
--]]

local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local tools = ServerStorage.Tools

--

function playerJoined(player)
	if
		MarketplaceService:UserOwnsGamePassAsync(
			-- User Id
			player.UserId,
			
			-- Game Pass Id
			123456789
		)
	then
		tools.GamePassTool:Clone().Parent = player.Backpack
		tools.GamePassTool:Clone().Parent = player.StarterGear
	end
end

--

Players.PlayerAdded:Connect(playerJoined)
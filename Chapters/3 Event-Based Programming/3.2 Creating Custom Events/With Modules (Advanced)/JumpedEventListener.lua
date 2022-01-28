--[[
    Instructions:
    1) Create a script in ServerScriptService
    2) Follow the instructions in the CharacterEvents
--]]
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local CharacterEvents = require(ServerStorage.CharacterEvents)

function playerJoined(player)
    -- Listening to Jumped Event
    CharacterEvents.Jumped(player):Connect(function()
        print(player.Name .. " jumped!")
    end)
end

Players.PlayerAdded:Connect(playerJoined)
--[[
    Instructions:
    - Create a Script in ServerScriptService
    - Insert the following code into this Script
    - Create a RemoteEvent in ReplicatedStorage called 'DebounceTesting'

    Do not forget to also use the SpammingEvents.lua script to test the debounces.
--]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DEBOUNCE_DURATION = 5

local debounceValues = {}

function playerJoined(player)
	debounceValues[player.Name] = 0
end

function playerLeft(player)
	debounceValues[player.Name] = nil
end

function debounceFunction(player)
	if ( debounceValues[player.Name] + DEBOUNCE_DURATION ) < os.time() then
		debounceValues[player.Name] = os.time()
		print("Allowed")
	end
end

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
ReplicatedStorage.DebounceTesting.OnServerEvent:Connect(debounceFunction)
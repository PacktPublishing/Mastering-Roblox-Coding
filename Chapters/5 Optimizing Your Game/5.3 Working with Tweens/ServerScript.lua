--[[
    Instructions:
    Follow the instructions explained in the section 'Setting up the Gate'
    Create a Server Script in ServerScriptService and include the following code
--]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local events = ReplicatedStorage.Events

local gateActivation = workspace.GateActivation

local DEBOUNCE_DURATION = 25
local debounceValues = {}


-- GATE FUNCTIONS

function toggleGate(hit)
	-- Server Check
	local distance = ( hit.Position - gateActivation.Position ).Magnitude
	if distance >= 10 then
		return
	end
	
	-- Function Logic
	local player = getPlayerFromHit(hit)
	if player ~= nil then
		if playerHasDebounce(player) == false then
			events.ToggleGate:FireClient(player)
		end
	end
end

--

function getPlayerFromHit(hit)
	-- Checking variables
	if hit ~= nil and hit.Parent ~= nil then
		-- Getting player
		local character = hit.Parent
		return Players:GetPlayerFromCharacter(character)
	end
	return nil
end


-- DEBOUNCE FUNCTIONS

function playerJoined(player)
	debounceValues[player.Name] = 0
end

function playerLeft(player)
	debounceValues[player.Name] = nil
end

function playerHasDebounce(player)
	if ( debounceValues[player.Name] + DEBOUNCE_DURATION ) < os.time() then
		debounceValues[player.Name] = os.time()
		return false
	end
	return true
end

--

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
gateActivation.Touched:Connect(toggleGate)
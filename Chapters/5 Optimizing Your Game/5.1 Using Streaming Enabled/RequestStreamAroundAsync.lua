--[[
    Instructions:
    - Create two parts named 'PartA' and 'PartB' in Workspace and position them far away
    - Enable Streaming Enabled
    - Create a Script in ServerScriptService
    - Put the following code in the script:
--]]

local Players = game:GetService("Players")

local DEBOUNCE_DURATION = 5

local partA = workspace.PartA
local partB = workspace.PartB

local debounceValues = {}


-- TELEPORTING

function teleportPlayer(player, position)
	if playerHasDebounce(player) == false then
		-- Preloading Area
		player:RequestStreamAroundAsync(position)
		
		-- Teleporting player
		player.Character:SetPrimaryPartCFrame(CFrame.new(position + Vector3.new(0, 5, 0)))
	end
end

--

function teleportA(hit)
	local player = wasHit(hit)
	if player then
		teleportPlayer(player, partA.Position)
	end
end

function teleportB(hit)
	local player = wasHit(hit)
	if player then
		teleportPlayer(player, partB.Position)
	end
end

--

function wasHit(hit)
	-- Getting Character
	local character = hit.Parent
	if character ~= nil then
		-- Getting Player
		local player = Players:GetPlayerFromCharacter(character)
		if player ~= nil then
			return player
		end
	end
	return false
end


-- DEBOUNCE

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
partA.Touched:Connect(teleportB)
partB.Touched:Connect(teleportA)
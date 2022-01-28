-- EXAMPLE SOLUTION

--[[
	This is the example answer for Chapter 3, Event-Based Programming.
	
	This script is an example solution to finish a game.
	You can find the rest of the game here:
	https://www.roblox.com/games/8645775042/Event-Based-Game

	Press the 3 dots ◘◘◘ and click 'Edit' to open the game.
--]]

local Players = game:GetService("Players")

local map = workspace.Map


--

function setup()
	-- Looping through all parts in the "Map" model in Workspace.
	for _, part in pairs(map:GetChildren()) do
		
		-- Checking if part is actually a part.
		if part:IsA("BasePart") then
			
			-- Listening to the .Touched event.
			part.Touched:Connect(function(hit)
				
				-- Calling the handleHit() function.
				
				-- @1 First argument is the part that was touched. The handleHit() function
				-- needs this part to change the color.
				
				-- @2 The second argument is the part that touched the part.
				
				handleHit(part, hit)
				
			end)
			
		end
		
	end
	
end

function handleHit(part, hit)
	-- Getting character
	local character = hit.Parent
	
	-- Getting Player
	local player = Players:GetPlayerFromCharacter(character)
	
	-- Checking if player is not nil
	if player ~= nil then
		
		-- Getting team color
		local teamColor = player.Team.TeamColor
		
		-- Setting part color
		part.BrickColor = teamColor
		
	end
end


--

setup()
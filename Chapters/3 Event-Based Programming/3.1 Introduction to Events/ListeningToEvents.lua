local Players = game:GetService("Players")

function playerJoined(player)
	local function characterAdded(character)
		local humanoid = character:FindFirstChildOfClass ("Humanoid")
		if humanoid ~= nil then
			print("Humanoid for " .. player.Name .. " found!")
		end
	end

	player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)
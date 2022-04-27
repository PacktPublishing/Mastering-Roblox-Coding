local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

--

function setup()
	-- Checking if Keyboard is enabled
	if UserInputService.KeyboardEnabled == true then
		-- Listening to the .InputBegan event
		UserInputService.InputBegan:Connect(inputBegan)
	end
end

function inputBegan(inputObject, gameProcessedEvent)
	-- Checking if Roblox used this event already
	if gameProcessedEvent == false then
		-- Checking if the 'B' key was pressed (Keyboard)
		if inputObject.KeyCode == Enum.KeyCode.B then
			-- Creating (client-sided) explosion
			local explosion = Instance.new("Explosion")
			explosion.Parent = player.Character.PrimaryPart
			explosion.Position = explosion.Parent.Position
		end
	end
end

--

setup()
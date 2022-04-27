local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer

--

function setup()
	if
		-- Checking if Keyboard is enabled ...
		UserInputService.KeyboardEnabled == true
		-- ... or a Gamepad is enabled.
		or UserInputService.GamepadEnabled == true
	then
		-- Listening to the .InputBegan event
		UserInputService.InputBegan:Connect(inputBegan)
	end
end

function inputBegan(inputObject, gameProcessedEvent)
	-- Checking if Roblox used this event already
	if gameProcessedEvent == false then
		if
            -- Checking if the 'B' key was pressed (Keyboard)
            inputObject.KeyCode == Enum.KeyCode.B
            -- or checking if a valid gamepad key was pressed
            or
            (
                -- Checking if input came from Gamepad1 ...
                inputObject.UserInputType == Enum.UserInputType.Gamepad1
                -- ... and if the 'X' key was pressed (Gamepad)
                and inputObject.KeyCode == Enum.KeyCode.ButtonX
            )
        then
			-- Creating (client-sided) explosion
			local explosion = Instance.new("Explosion")
			explosion.Parent = player.Character.PrimaryPart
			explosion.Position = explosion.Parent.Position
		end
	end
end

--

setup()
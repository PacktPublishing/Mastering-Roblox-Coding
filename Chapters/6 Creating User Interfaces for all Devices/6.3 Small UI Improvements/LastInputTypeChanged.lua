--[[
    Instructions:
    - Create a ScreenGui inside of the StarterGui
    - Directly inside the ScreenGui create a TextButton named 'ControlsText'
    - Directly inside the ScreenGui create a LocalScript and insert the following code:
--]]

local UserInputService = game:GetService("UserInputService")

local ui = script.Parent
local controlsText = ui:WaitForChild("ControlsText")

local previousInputType = nil

function updateControls(lastInputType)
    -- Checking if anything has changed
    -- Small optimization in-case this function gets bigger
    -- over time.
    if previousInputType == lastInputType then
        return
    end

    -- Changing controls
    if lastInputType == Enum.UserInputType.Gamepad1 then
        -- Player is using a gamepad.
        -- Console or someone using a gamepad?
        previousInputType = lastInputType
        controlsText.Text = "Press [X] to confirm"
        
    elseif lastInputType == Enum.UserInputType.Touch then
        -- Player is using touchscreen, phone/tablet?
        previousInputType = lastInputType
        controlsText.Text = "Click here to confirm"
        
    elseif lastInputType == Enum.UserInputType.Keyboard then
        -- Player is using keyboard.
        previousInputType = lastInputType
        controlsText.Text = "Press Enter to confirm"
        
    end
end

UserInputService.LastInputTypeChanged:Connect(updateControls)
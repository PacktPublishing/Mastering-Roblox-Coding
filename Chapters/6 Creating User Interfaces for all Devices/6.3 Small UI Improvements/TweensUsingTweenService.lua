--[[
    Instructions:
    - Create a ScreenGui inside of the StarterGui
    - Directly inside the ScreenGui create a Frame named 'SomeFrame'
    - Directly inside the ScreenGui create a LocalScript and insert the following code:
--]]

local TweenService = game:GetService("TweenService")

local ui = script.Parent
local frame = ui:WaitForChild("SomeFrame")

function openMenu()
	-- Setting frame out of the screen
	frame.Position = UDim2.new(0.5, 0, 1.5, 0)

	-- Making frame visible
	frame.Visible = true
	
	-- Setting up TweenInfo
	local tweenInfo = TweenInfo.new(
		-- Duration of Tween
		1,

		-- Tween style (EasingStyle)
		Enum.EasingStyle.Quad,

		-- EasingStyle direction
		Enum.EasingDirection.Out,

		-- Amount of times the tween repeats
		0,

		-- Tween Reverse
		false,

		-- Delay before the Tween starts
		0
	)
	
	local tween = TweenService:Create(frame, tweenInfo, {Position = UDim2.new(0.5, 0, 0.5, 0)})
	tween:Play()
end

openMenu()

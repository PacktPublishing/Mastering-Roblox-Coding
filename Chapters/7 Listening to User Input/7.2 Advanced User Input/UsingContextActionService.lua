local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")

local ACTION_NAME = "ToggleShop"

local ui = script.Parent
local shopFrame = ui:WaitForChild("ShopFrame")

local character = Players.LocalPlayer.Character
local humanoid = character:WaitForChild("Humanoid")

--

function setup()
	-- Setting shopFrame invisible
	shopFrame.Visible = false
	
	-- Listening to changes on the FloorMaterial property
	humanoid:GetPropertyChangedSignal("FloorMaterial"):Connect(function()
		-- Checking if player is standing on 'Foil'
		-- We use this as a simple method to detect if a certain
		-- condition is met
		if humanoid.FloorMaterial == Enum.Material.Foil then
			beginAction()
		else
			endAction()
		end
	end)
end

function beginAction()
	-- Starting ContextAction
	ContextActionService:BindAction(ACTION_NAME, toggleShop, true, Enum.KeyCode.E, Enum.KeyCode.ButtonX)
	
	-- Changing Mobile Button
	ContextActionService:SetTitle(ACTION_NAME, "Shop")
	ContextActionService:SetPosition(ACTION_NAME, UDim2.new(1, -150, 1, -77))
end

function endAction()
	-- Stopping ContextAction
	ContextActionService:UnbindAction(ACTION_NAME)
	
	-- Closing shop (if open)
	closeShop()
end

--

function toggleShop(actionName, inputState, inputObject)
	-- Checking if this is the Begin action
	if inputState == Enum.UserInputState.Begin then
		Enum.UserInputState.
		-- Toggling frame
		shopFrame.Visible = not shopFrame.Visible
	end
end

function closeShop()
	-- Checking if shop is open
	if shopFrame.Visible == true then
		-- Closing shop
		toggleShop(ACTION_NAME, Enum.UserInputState.Begin)
	end
end

--

setup()
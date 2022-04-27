--[[
    Follow the instructions explained in the Book.
--]]
local UserInputService = game:GetService("UserInputService")

local ui = script.Parent
local frame = ui:WaitForChild("Frame")

--

function setup()
	-- Checking if the device has a mouse
	if UserInputService.MouseEnabled == true then
		
		-- Handling mouse input
		local function listenToMouseInput(inputObject, gameProcessedEvent)
			-- Checking if Roblox handled this event
			if gameProcessedEvent == false then
				if inputObject.UserInputType == Enum.UserInputType.MouseMovement then
					-- Mouse has moved
					repositionFrame()
				elseif inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
					-- Left mouse button has been pressed
					changeFrameColor()
				end
				
			end
		end
		
		-- Listening to the .InputBegan event
		UserInputService.InputBegan:Connect(listenToMouseInput)
		
		-- Listening to the .InputChanged event
		UserInputService.InputChanged:Connect(listenToMouseInput)
	end
end

function changeFrameColor()
	local r = math.random(0, 255)
	local g = math.random(0, 255)
	local b = math.random(0, 255)
	frame.BackgroundColor3 = Color3.fromRGB(r, g, b)
end

function repositionFrame()
	-- Getting the mouse location
	local mouseLocation = UserInputService:GetMouseLocation()
	
	-- Setting frame position
	frame.Position = UDim2.new(0, mouseLocation.X, 0, mouseLocation.Y)
end

--

setup()
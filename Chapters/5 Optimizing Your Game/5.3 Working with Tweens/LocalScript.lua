--[[
    Instructions:
    Follow the instructions explained in the section 'Setting up the Gate'
    Create a Local Script in StarterPlayerScripts and include the following code
    Change the GATE_DATA to the data you collected in the section 'Getting Tween Data'
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local events = ReplicatedStorage:WaitForChild("Events")

local INTERMISSION_TIME = 5
local TWEEN_DURATION = 2

local GATE_DATA = {
	["Open"] = {
		["LeftGatePart"] = {
			["Orientation"] = Vector3.new(-90, 90, 0),
			["Position"] = Vector3.new(-41.453, 14, 83.903)
		},
		["RightGatePart"] = {
			["Orientation"] = Vector3.new(-90, -90, 0),
			["Position"] = Vector3.new(-76.203, 14, 83.903)
		}
	},
	["Closed"]= {
		["LeftGatePart"] = {
			["Orientation"] = Vector3.new(-90, 0, 0),
			["Position"] = Vector3.new(-50.203, 14, 75.153)
		},
		["RightGatePart"] = {
			["Orientation"] = Vector3.new(-90, 0, 0),
			["Position"] = Vector3.new(-67.453, 14, 75.153)
		}
	}
}

local debounce = false

--

function toggleGate()
	if debounce == false then
		debounce = true

		-- Getting gate parts
		local leftGatePart = workspace:WaitForChild("LeftGatePart", 5)
		local rightGatePart = workspace:WaitForChild("RightGatePart", 5)
		if leftGatePart ~= nil and rightGatePart ~= nil then
			-- Opening Gate
			animateGate(leftGatePart, "Open", false)
			animateGate(rightGatePart, "Open", true)

			-- Intermission
			task.wait(INTERMISSION_TIME)

			-- Closing gate
			animateGate(leftGatePart, "Closed", false)
			animateGate(rightGatePart, "Closed", true)
		end

		-- Ending client-sided debounce
		debounce = false
	end
end

function animateGate(gate, doorStatus, yield)
	-- Getting Tween Data
	local tweenData = GATE_DATA[doorStatus][gate.Name]
	
	-- Playing Tween
	local tween = TweenService:Create(gate, TweenInfo.new(TWEEN_DURATION), tweenData)
	tween:Play()
	
	-- Custom Yielding
	if yield == true then
		tween.Completed:Wait()
	end
end


--

events:WaitForChild("ToggleGate").OnClientEvent:Connect(toggleGate)
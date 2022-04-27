--[[
    Follow the instructions explained in the Book.
--]]
local ServerStorage = game:GetService("ServerStorage")

local toolsStorage = ServerStorage.Tools

local flashlightGiver = workspace.FlashlightGiver
local proximityPrompt = flashlightGiver.GiveTool

--

function proximityPromptTriggered(player)
	-- Checking if player already has this tool
	if not playerHasTool(player, "Flashlight") then
		-- Checking if flashlight is in ServerStorage > Tools
		local flashlight = toolsStorage:FindFirstChild("Flashlight")
		if flashlight ~= nil then
			-- Cloning flashlight
			local toolClone = flashlight:Clone()
			
			-- Parenting tool to Backpack
			toolClone.Parent = player.Backpack
		else
			warn("Flashlight tool missing!")
		end
	end
end

function playerHasTool(player, toolName)
	local character = player.Character
	local backpack = player.Backpack
	--
	local characterTool = character:FindFirstChildOfClass("Tool")
	if 
		( characterTool ~= nil and characterTool.Name == toolName )
		or
		backpack:FindFirstChild(toolName)
	then
		-- Player already has this tool
		return true
	end
	-- Player does not have this tool
	return false
end

--

proximityPrompt.Triggered:Connect(proximityPromptTriggered)
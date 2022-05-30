local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")

local BackpackDataStore = DataStoreService:GetDataStore("BackpackData")


-- PLAYER FUNCTIONS

function playerJoined(player)
	-- Initializing tool dequip on reset
	initializeUnequipTools(player)
	
	-- Getting tool data
	local tools = nil
	
	local suc, err = pcall(function()
		tools = BackpackDataStore:GetAsync("Plr_" .. player.UserId)
	end)
	if not suc then
		-- Printing error
		warn(err)
	else
		-- Default tool data
		if tools == nil then
			tools = {"StarterTool"}
		end
		
		-- Printing tool data
		print("Player Tools:")
		if #tools > 0 then
			for _, toolName in pairs(tools) do
				print("\t-" .. toolName)
			end
		else
			print("\t- No Tools")
		end
		
		--[[
			Note:
			If you end up testing this system yourself,
			please keep in mind that you have to create tools
			on the Server, not on the Client!
			
			Because of Filtering Enabled, tools that are made
			on the Client do not get seen by this script.
		--]]
	end
end

function playerLeft(player)
	-- Getting Tools
	local tools = getTools(player)
	
	-- Saving Tools
	local suc, err = pcall(function()
		BackpackDataStore:SetAsync(
			"Plr_" .. player.UserId,
			tools
		)
	end)
	if not suc then
		-- Printing error
		warn(err)
	end
end


-- TOOL FUNCTIONS

function initializeUnequipTools(player)
	player.CharacterRemoving:Connect(function(character)
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid ~= nil then
			humanoid:UnequipTools()
		end
	end)
end

function getTools(player)
	-- Tools variable
	local tools = {}
	
	for _, tool in pairs(player.Backpack:GetChildren()) do
		if tool.ClassName == "Tool" then
			table.insert(tools, tool.Name)
		end
	end
	
	-- Returning Tools
	return tools
end


--

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
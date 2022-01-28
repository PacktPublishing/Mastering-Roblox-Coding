--[[
    Instructions:
    1) Create a script in ServerScriptService
    2) Follow the instructions in the -JumpedEventHandler script
--]]
local Players = game:GetService("Players")

function playerJoined(player)
    local function characterAdded(character)
        -- Looking for the Humanoid in the new Character
        local humanoid = character:FindFirstChildOfClass ("Humanoid")
        if humanoid ~= nil then

            -- Waiting for Custom Events
            local jumped = humanoid:WaitForChild("Jumped")
            local timesJumped = humanoid:WaitForChild("TimesJumped")

            -- Listening to our custom event
            jumped.Event:Connect(function()
                -- Printing that someone jumped
                print(player.Name .. " jumped " .. timesJumped:Invoke() .. " time(s)")
            end)

        end
    end

    -- Listening to a new Character
    player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)
--[[
    Instructions:
    1) Create a script in ServerScriptService
    2) Follow the instructions in the -JumpedEventListener script
--]]
local Players = game:GetService("Players")

function playerJoined(player)
    local function characterAdded(character)
        -- Looking for the Humanoid in the new Character
        local humanoid = character:FindFirstChildOfClass ("Humanoid")
        if humanoid ~= nil then
            -- Total Jumps variable
            local totalJumps = 0
            
            -- Creating custom event
            local jumped, timesJumped = createCustomEvents(humanoid)
            
            -- Listening to the .Jumped event on the Humanoid
            humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if humanoid.Jump == true then
                    -- Incremented Total Jumps
                    totalJumps += 1
                    
                    -- Firing our Custom Event
                    jumped:Fire()
                end
            end)
            
            timesJumped.OnInvoke = function()
                -- Returns the Total Jumps
                return totalJumps
            end
        end
    end

    -- Listening to a new Character
    player.CharacterAdded:Connect(characterAdded)
end

function createCustomEvents(humanoid) 
    local jumped = Instance.new("BindableEvent")
    jumped.Name = "Jumped"
    jumped.Parent = humanoid
    --
    local timesJumped = Instance.new("BindableFunction")
    timesJumped.Name = "TimesJumped"
    timesJumped.Parent = humanoid
    
    -- Returning events
    return jumped, timesJumped
end

Players.PlayerAdded:Connect(playerJoined)
--[[
    Instructions:
    1) Create a ModuleScript in ServerStorage
    2) Name your ModuleScript 'CharacterEvents'
    3) Follow the instructions in the JumpedEventListener script
--]]
local CharacterEvents = {}

function CharacterEvents.Jumped(player)
    -- Creating Event
    local jumped = Instance.new("BindableEvent")
    
    -- Character Added event
    local function characterAdded(character)
        -- Looking for the Humanoid in the new Character
        local humanoid = character:FindFirstChildOfClass ("Humanoid")
        if humanoid ~= nil then

            -- Listening to the .Jumped event on the Humanoid
            humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if humanoid.Jump == true then
                    -- Firing our Custom Event
                    jumped:Fire()
                end
            end)
            
        end
    end

    -- Listening to a new Character
    player.CharacterAdded:Connect(characterAdded)
    
    -- Returning Listener
    return jumped.Event
end

return CharacterEvents
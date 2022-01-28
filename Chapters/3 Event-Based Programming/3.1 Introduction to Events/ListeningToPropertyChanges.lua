local Players = game:GetService("Players")

function playerJoined(player)
    local function characterAdded(character)
        -- Looking for the Humanoid in the new Character
        local humanoid = character:FindFirstChildOfClass ("Humanoid")
        if humanoid ~= nil then

            -- Listening to the changing “Jump” property on the Humanoid 
            humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if humanoid.Jump == true then
                    -- Printing that someone jumped
                    print(player.Name .. " jumped!")
                    
                    -- Changing the color of the player's character
                    changeCharacterColor(character)
                end
            end)

        end
    end
    
    -- Listening to a new Character
    player.CharacterAdded:Connect(characterAdded)
end

function changeCharacterColor(character)
    -- Getting new Color
    local newColor = randomColor()
    
    -- Changing Color
    for _, part in pairs(character:GetChildren()) do
        -- Checking if the part is in the "BasePart" class group
        if part:IsA("BasePart") then
            part.Color = newColor
        end
    end
end

function randomColor()
    local r = math.random(0, 255)
    local g = math.random(0, 255)
    local b = math.random(0, 255)
    return Color3.fromRGB(r, g, b)
end

Players.PlayerAdded:Connect(playerJoined)
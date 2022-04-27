local Players = game:GetService("Players")

local clickDetector = workspace.ClickablePart.ClickDetector

function newPlayer(player)
    local leaderstats = Instance.new("Model")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player
    
    local clicks = Instance.new("IntValue")
    clicks.Name = "Clicks"
    clicks.Parent = leaderstats
    clicks.Value = 0
end

function incrementClicks(player)
    local leaderstats = player:FindFirstChild("leaderstats")
    if leaderstats ~= nil then
        local clicks = leaderstats:FindFirstChild("Clicks")
        if clicks ~= nil then
            clicks.Value += 1
        end
    end
end

Players.PlayerAdded:Connect(newPlayer)
clickDetector.MouseClick:Connect(incrementClicks)
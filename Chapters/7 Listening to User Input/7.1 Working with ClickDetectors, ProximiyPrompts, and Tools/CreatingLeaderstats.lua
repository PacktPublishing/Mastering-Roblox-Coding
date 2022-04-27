local Players = game:GetService("Players")

function newPlayer(player)
    local leaderstats = Instance.new("Model")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local statistic = Instance.new("IntValue")
    statistic.Name = "SomeStatistic"
    statistic.Parent = leaderstats
    statistic.Value = 0
end

Players.PlayerAdded:Connect(newPlayer)
local Players = game:GetService("Players")

function findPlayer(username)
    local player = Players:FindFirstChild(username)
    if player ~= nil then
        print(player.Name .. " found!")
    else
        print(username .. " is not in-game.")
    end
end

task.wait(1)
findPlayer("YourUsername")
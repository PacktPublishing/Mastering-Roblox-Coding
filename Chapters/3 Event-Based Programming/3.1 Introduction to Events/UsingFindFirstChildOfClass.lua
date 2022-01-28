local Players = game:GetService("Players")

function findPlayer()
	local player = Players:FindFirstChildOfClass("Player")
	if player ~= nil then
		print(player.Name .. " found!")
	end
end

task.wait(1)
findPlayer()
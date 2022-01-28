local Players = game:GetService("Players")

function printPlayers()
	-- Getting a table containing all players in our game.
	local players = Players:GetPlayers()

	-- Printing all players
	print("Current players in our game:")
	for _, player in pairs(players) do
		print("- " .. player.Name)
	end
end

task.wait(1)
printPlayers()
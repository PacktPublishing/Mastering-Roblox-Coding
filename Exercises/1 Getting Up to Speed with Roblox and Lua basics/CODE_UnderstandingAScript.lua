local spawnLocation = workspace.SpawnLocation

if
	spawnLocation.Position.X == 0
	and
	spawnLocation.Position.Z == 0
then
	print("Spawn is in the center!")
else
	print("Spawn is not in the center.")
end
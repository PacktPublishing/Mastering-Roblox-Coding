local spawnLocation = workspace:WaitForChild("SomethingThatDoesNotExist", 5)
if spawnLocation ~= nil then
    print("Found!")
else
    print("Couldn't find!")
end
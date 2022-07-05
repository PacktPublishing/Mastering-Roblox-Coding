-- 3
local baseplate = workspace.Baseplate

-- 4
print(baseplate.Name)

-- 5
baseplate.Name = "Cool Part"

-- 6 (You could have changed the print that was made for 5.)
print("The name of the baseplate is: '" .. baseplate.Name .. "'")

-- 7
baseplate.CanCollide = false

-- 8
baseplate.Color = Color3.fromRGB(51, 88, 130)

-- 9
local terrain = workspace.Terrain

-- 10
baseplate.Parent = terrain
-- 3
local workspaceService = game:GetService("Workspace")
-- 4
local baseplate = workspaceService.Baseplate

-- 5
print(baseplate.Name)

-- 6
baseplate.Name = "Cool Part"

-- 7 (You could have changed the print that was made for 5.)
print("The name of the baseplate is: '" .. baseplate.Name .. "'")

-- 8
baseplate.CanCollide = false

-- 9
baseplate.Color = Color3.fromRGB(51, 88, 130)

-- 10
local terrain = workspaceService.Terrain

-- 11
baseplate.Parent = terrain
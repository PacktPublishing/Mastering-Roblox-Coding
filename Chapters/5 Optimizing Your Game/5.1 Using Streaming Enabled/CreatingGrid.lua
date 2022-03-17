--[[
    Instructions:
    Execute this code in the command bar in Roblox Studio.
    This code is a part of the explanation for the .ChildAdded event.
--]]

local BLOCK_SIZE = 25
local AMOUNT_OF_BLOCKS = 50

local folder = Instance.new("Folder")
folder.Name = "ColoredParts"
folder.Parent = workspace

for x = 1, AMOUNT_OF_BLOCKS do
    for y = 1, AMOUNT_OF_BLOCKS do
        local part = Instance.new("Part")
        part.Parent = folder

        part.Name = x .. ", " .. y
        part.Anchored = true
        part.Size = Vector3.new(BLOCK_SIZE, .25, BLOCK_SIZE)

        local positionToCenter = ( (BLOCK_SIZE * AMOUNT_OF_BLOCKS ) / 2 )
        part.Position = Vector3.new(x * BLOCK_SIZE - positionToCenter, 1, y * BLOCK_SIZE - positionToCenter)
    end
    task.wait()
end
print("Command completed!")

--[[
    Instructions:
    Follow the instructions in the book.
    Make sure you create a grid first. You can find the code to create
    this grid in the CreatingGrid.lua file.
--]]

local coloredParts = workspace:WaitForChild("ColoredParts")

function randomRGB()
    local r = math.random(0, 255)
    local g = math.random(0, 255)
    local b = math.random(0, 255)
    return Color3.fromRGB(r, g, b)
end

coloredParts.ChildAdded:Connect(function(addedInstance)
    if addedInstance:IsA("BasePart") then
        addedInstance.Color = randomRGB()
        print("New instance colored!")
    end
end)

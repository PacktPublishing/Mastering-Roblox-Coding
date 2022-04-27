--[[
    Follow the instructions explained in the Book.
--]]
local tool = script.Parent
local handle = tool.Handle

function activated()
    local spotlight = handle:FindFirstChild("SpotLight")
    if spotlight ~= nil then
        spotlight.Enabled = not spotlight.Enabled
    end
end

tool.Activated:Connect(activated)
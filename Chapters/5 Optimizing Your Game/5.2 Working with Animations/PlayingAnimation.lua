--[[
    Instructions:
    Create a Folder called Animations in ReplicatedStorage and include the
    DorkyDance animation in this folder as explained in the book.
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local character = script.Parent
local animations = ReplicatedStorage:WaitForChild("Animations")

--

function playAnimation()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid ~= nil then
        local animator = humanoid:FindFirstChild("Animator")
        local animation = animations:FindFirstChild("DorkyDance")
        if animator ~= nil and animation ~= nil then
            local animationTrack = animator:LoadAnimation(animation)
            animationTrack.Looped = true
            animationTrack:Play()
        end
    end
end

--

playAnimation()
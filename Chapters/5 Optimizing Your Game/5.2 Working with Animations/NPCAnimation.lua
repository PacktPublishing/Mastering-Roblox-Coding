--[[
    Instructions:
    Create a Folder called Animations in ReplicatedStorage and include the
    Idle and Wave animation in this folder as explained in the book.
    Make sure you also insert a Dummy NPC by using the Build Rig plugin.
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local animations = ReplicatedStorage:WaitForChild("Animations")

local npc = workspace:WaitForChild("Dummy")

--

function setup()
    playAnimation(npc, "IdleAnimation", true, Enum.AnimationPriority.Idle)
    task.wait(10)
    playAnimation(npc, "WaveAnimation", false, Enum.AnimationPriority.Action)
end

function playAnimation(character, animationName, looped, animationPriority)
    -- Getting Humanoid and Animation
    local humanoid = npc:WaitForChild("Humanoid", 5)
    local animation = animations:FindFirstChild(animationName)
    if humanoid ~= nil and animation ~= nil then
        -- Getting Animator
        local animator = humanoid:WaitForChild("Animator", 5)
        if animator ~= nil then
            -- Playing Animation
            local animationTrack = animator:LoadAnimation(animation)
            animationTrack.Looped = looped
            animationTrack.Priority = animationPriority
            animationTrack:Play()
        end
    end
end

--

setup()
--[[
    Instructions:
    - Make a LocalScript inside of the StarterCharacterScripts
    - Insert the following code into the LocalScript
    - Test the game and notice the differences on the Client and the Server.
--]]

local character = script.Parent
local rightLowerArm = character:FindFirstChild("RightLowerArm")
rightLowerArm:Destroy()
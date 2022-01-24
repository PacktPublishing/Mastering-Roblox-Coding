--[[
    - Make a Script
    - Move the Script into 'ServerScriptService'
    - Follow the instructions in the 'StudentSystem.lua' file
--]]

local ServerStorage = game:GetService("ServerStorage")
local StudentSystem = require(ServerStorage.StudentSystem)

print(StudentSystem.getStudentInfo("William"))
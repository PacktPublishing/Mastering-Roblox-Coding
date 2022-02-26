--[[
    Instructions:    
    - Create a LocalScript in StarterPlayerScripts (or any other location where LocalScripts run)
    - Insert the following code into the LocalScript

    Do not forget to also use the Debounces.lua script.
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

function setup()
	while true do
		task.wait(1)
		ReplicatedStorage.DebounceTesting:FireServer()
	end
end

setup()
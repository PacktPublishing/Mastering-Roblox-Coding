--[[
    This is also known as Tuple Parameters.
--]]

function printEverything(...)
	local arg = {...}
	for _, data in pairs(arg) do
		print(tostring(data))
	end
end

printEverything("Hey!")
printEverything("Hey, ", "how are ", "you?")
printEverything("Numbers", 124)
printEverything({"table data"})
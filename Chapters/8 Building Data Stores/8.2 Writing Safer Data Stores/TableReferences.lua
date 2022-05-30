-- Normal variable behavior

local variableA = 5
local variableB = variableA
variableB += 1
print(variableA) --> Still 5
print(variableB) --> 5 + 1 = 6

-- Table behavior

local tableA = {5}
local tableB = tableA
tableB[1] += 1
print(tableA[1]) --> 6?
print(tableB[1])
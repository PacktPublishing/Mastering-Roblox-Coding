--[[
    Extra exercise for programming with ModuleScripts.
    Make sure you have the 'StudentSystem' module in ServerStorage as shown in the book.
--]]

local ServerStorage = game:GetService("ServerStorage")
local StudentSystem = require(ServerStorage.StudentSystem)

local MINIMUM_GRADE = 1
local MAXIMUM_GRADE = 10


-- SETUP FUNCTIONS

function setup()
	print(calculateAverage("William"))
	addGrade("William", 5)
	print(calculateAverage("William"))
	addGrade("William", 10)
	print(calculateAverage("William"))
end


-- MAIN FUNCTIONS

function addGrade(studentName, grade)
	-- Getting grades
	local grades = getGrades(studentName)
	
	-- Checking if grades are not nil
	if grades ~= nil then
		
		-- Checking if input grade is correct
		if isCorrectGrade(grade) then
			-- Adding a grade
			table.insert(grades, grade)
		end
		
	end
end

function calculateAverage(studentName)
	-- Getting grades
	local grades = getGrades(studentName)

	-- Checking if grades are not nil
	if grades ~= nil and #grades > 0 then
		
		-- Variables to calculate the average
		local gradesSum = 0
		local totalGrades = #grades
		
		-- Calculating the sum of the student's grades
		for _, grade in pairs(grades) do
			gradesSum += grade
		end
		
		-- Calculating average
		return gradesSum / totalGrades
		
	end
	
	return 0
end


-- SUPPORTING FUNCTIONS

function isCorrectGrade(grade)
	-- Checking if grade is a number
	if typeof(grade) == "number" then
		-- Checking if grade is an allowed number
		if grade >= MINIMUM_GRADE and grade <= MAXIMUM_GRADE then
			-- Grade can be added
			return true
		end
	end
	
	-- Grade is an incorrect number.
	return false
end

function getGrades(studentName)
	-- Getting student info
	local studentInfo = StudentSystem.getStudentInfo(studentName)
	
	-- Checking if student info is not nil.
	if studentInfo ~= nil then
		-- Returning grades
		return studentInfo.grades
	end
end

--

setup()
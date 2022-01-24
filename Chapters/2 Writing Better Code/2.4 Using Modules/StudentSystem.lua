--[[
    - Make a ModuleScript and name it "StudentSystem"
    - Move the ModuleScript into 'ServerStorage'
    - Follow the instructions in the 'RequiringAModule.lua' file
--]]

local StudentSystem = {}

local students = {
    {
        name = "William",
        class = "H1",
        times_late = 0,
        grades = {}
    },
    {
        name = "Sophie",
        class = "H1",
        times_late = 0,
        grades = {}
    },
}

function StudentSystem.getStudentInfo(studentName)
    -- Looping through students
    for _, studentInfo in ipairs(students) do
        -- Getting the current student's name that belongs to this student id.
        local currentStudentName = studentInfo["name"]

        -- Checking if student name matches the one we are looking for
        if currentStudentName == studentName then
            return studentInfo
        end
    end

    -- Student was not found
    warn("Student [" .. studentName .. "] does not exist.")
end

return StudentSystem
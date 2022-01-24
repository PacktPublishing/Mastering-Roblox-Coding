local students = {
    {name = "William", class = "H1", times_late = 0},
    {name = "Sophie", class = "H1", times_late = 0},
}

function findStudent(studentName)
    -- Looping through students
    for studentId, studentInfo in pairs(students) do
        print("Current Student Id: " .. studentId)
        
        -- Getting the name of the current student
        -- that belongs to this student id.
        local currentStudentName = studentInfo["name"]
        
        -- Checking if student name matches the one
        -- we are looking for
        if currentStudentName == studentName then
            print("Found! Stopping loop")
            break
        else
            print("Someone else, continuing.")
            continue
        end
    end
end

findStudent("William")
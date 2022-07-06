local students = {}

function addStudent(studentName, studentClass)
   table.insert(
      students,
      {
         name = studentName,
         class = studentClass,
         ["times late"] = 0
      }
   )
end

addStudent("Nicole", "H1")
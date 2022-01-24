local students = {"William", "Sophie", "Robert"}

function setup()
    customTableInsert(students, "Emily")
    print(unpack(students))
end

function customTableInsert(table, newData)
    -- Getting index info
    local currentIndex = #table
    local newIndex = currentIndex + 1
    
    -- Setting new data
    table[newIndex] = newData
end

setup()
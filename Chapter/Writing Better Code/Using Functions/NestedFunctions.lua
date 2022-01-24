function addAndSubstract(x, y)
    -- Nested add function
    local function add()
        return x + y
    end
    
    -- Nested subtract function
    local function subtract()
        return x - y
    end

    -- Returning result
    return add(), subtract()
end

local sum, difference = addAndSubstract(10, 5)
print(sum)
print(difference)
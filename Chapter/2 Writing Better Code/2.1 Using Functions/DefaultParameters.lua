function add(x, y)
    -- Default values for your parameters
    if x == nil or typeof(x) ~= "number" then
        x = 0
    end
    if y == nil or typeof(y) ~= "number" then
        y = 0
    end
    
    -- Function logic
    print(x)
    print(y)
end

add(1, "2")
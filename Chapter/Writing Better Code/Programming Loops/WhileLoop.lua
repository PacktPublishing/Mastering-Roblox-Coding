function randomBoolean()
    return math.random(0, 5) == 0
 end

 function countTries()
    -- Counter variable
    local tries = 0

    -- While Loop
    while randomBoolean() == false do
       tries += 1
    end

    -- Prints the tries it took for the loop to end
    print("It took " .. tries .. " tries to end the loop.")
 end

 countTries()
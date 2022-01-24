local MINIMUM_PLAYERS = 1
local MAXIMUM_PLAYERS = 8

function givePositionFeedback(playerPosition)
    -- Checking if the player's position is a valid number
    if playerPosition >= MINIMUM_PLAYERS and playerPosition <= MAXIMUM_PLAYERS then
        
        -- Getting correct message based on player's position
        if playerPosition <= 3 then
            print("Well done! You are in spot " .. playerPosition .. "!")
        elseif playerPosition <= 5 then
            print("You are almost there!")
        else
            print("You are not in the top three yet! Keep going!")
        end

    else
        -- The position of the player is not valid
        warn("Incorrect player position [" .. playerPosition .. "]!")
    end
end

givePositionFeedback(math.random(1, 8))
givePositionFeedback(math.random(1, 8))
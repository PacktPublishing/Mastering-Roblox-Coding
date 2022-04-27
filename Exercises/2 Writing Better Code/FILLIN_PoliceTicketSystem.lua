local crimeSystem = {
	["Speeding"] = {
		ticketPrice = 100,
		isViolating = function(officerInputDictionary)
			local MAX_SPEED = 100

            -- Exercise 2 : Check if the required data is present.

            -- Exercise 1 : Check if the driver is comitting this crime.
		end
	},
	["No License"] = {
		ticketPrice = 250,
		isViolating = function(officerInputDictionary)
			-- Exercise 2 : Check if the required data is present.

            -- Exercise 1 : Check if the driver is comitting this crime.
		end
	},
	["Reckless Driving"] = {
		ticketPrice = 250,
		isViolating = function(officerInputDictionary)
			-- Exercise 2 : Check if the required data is present.

            -- Exercise 1 : Check if the driver is comitting this crime.
		end
	}
}


-- SETUP FUNCTION

function setup()
    -- Tip: You do not have to change this function
	print("Ticket Price: " .. calculateTicketPrice(
			{
				speed = 90,
				hasLicense = true,
				isRecklessDriving = false
			}
		)
	)
end


-- TICKET FUNCTION

function calculateTicketPrice(officerInputDictionary)
	-- Ticket price
	local totalTicketPrice = 0

    -- Exercise 3 : Create a loop that goes through the crime system table.
    -- Hint: index variable is the name of the crime.
    -- Hint: value variable is the dictionary for a specific crime.

    -- Exercise 6 : Within the loop, call the 'isRequiredCrimeDataPresent' function.
    -- Hint: If the functions returns false, use the 'continue' statement.

    -- Exercise 7 : Within the loop, call the isViolating function for the current crime.
    -- If the isViolating function returns true, increment the totalTicketPrice variable.
	-- Hint: As argument to the isViolating function, provide the officerInputDictionary.

	-- Returning ticket price
	return totalTicketPrice
end

--

function isRequiredCrimeDataPresent(crimeName, crimeData)
	-- Getting required crime data
	local ticketPrice = crimeData.ticketPrice
	local isViolatingFunction = crimeData.isViolating

    -- Exercise 4 : Check if the ticketPrice variable is not null and if it is greater than zero.
    -- If it is nil or not greater than zero, return false.

    -- Exercise 5 : Check if the isViolatingFunction is not nil
    -- If it is nil or not greater than zero, return false.
	
	-- All data is present
	return true
end

--

setup()
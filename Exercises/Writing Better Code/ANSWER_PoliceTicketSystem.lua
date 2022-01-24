local crimeSystem = {
	["Speeding"] = {
		ticketPrice = 100,
		isViolating = function(officerInputDictionary)
			-- Max speed variable
			local MAX_SPEED = 100

			-- Getting required data for this system
			local speed = officerInputDictionary.speed

			-- Checking if required data is present.
			if speed == nil or typeof(speed) ~= "number" then
				warn("Speed data missing.")
				return false
			end

			-- Checking if user is violating
			return officerInputDictionary.speed > MAX_SPEED
		end
	},
	["No License"] = {
		ticketPrice = 250,
		isViolating = function(officerInputDictionary)
			-- Getting required data for this system
			local hasLicense = officerInputDictionary.hasLicense

			-- Checking if required data is present.
			if hasLicense == nil or typeof(hasLicense) ~= "boolean" then
				warn("Has License data missing.")
				return false
			end

			-- Checking if user is violating
			return not hasLicense
		end
	},
	["Reckless Driving"] = {
		ticketPrice = 250,
		isViolating = function(officerInputDictionary)
			-- Getting required data for this system
			local isRecklessDriving = officerInputDictionary.isRecklessDriving

			-- Checking if required data is present.
			if isRecklessDriving == nil or typeof(isRecklessDriving) ~= "boolean" then
				warn("Is Reckless Driving data missing.")
				return false
			end

			-- Checking if user is violating
			return isRecklessDriving
		end
	}
}


-- SETUP FUNCTION

function setup()
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

	-- Looping through crime system
	for crimeName, crimeData in pairs(crimeSystem) do
		-- Checking if required data is present
		if not isRequiredCrimeDataPresent(crimeName, crimeData) then
			-- Continue because we do not want the complete loop to end.
			-- Nevertheless, we do not want the loop to continue for this crime.
			continue
		end

		-- Getting required crime data
		local ticketPrice = crimeData.ticketPrice
		local isViolatingFunction = crimeData.isViolating

		-- Checking if player violated
		if isViolatingFunction(officerInputDictionary) == true then
			totalTicketPrice += ticketPrice
		end
	end

	-- Returning ticket price
	return totalTicketPrice
end

--

function isRequiredCrimeDataPresent(crimeName, crimeData)
	-- Getting required crime data
	local ticketPrice = crimeData.ticketPrice
	local isViolatingFunction = crimeData.isViolating

	-- Making sure ticketPrice is set.
	if ticketPrice == nil or ticketPrice < 0 then
		warn("Ticket Price for crime [" .. crimeName .. "] is missing.")
		return false
	end

	-- Making sure is violating function is present
	if isViolatingFunction == nil then
		warn("Is Violating function for crime [" .. crimeName .. "] is missing.")
		return false
	end

	-- All data is present
	return true
end

--

setup()
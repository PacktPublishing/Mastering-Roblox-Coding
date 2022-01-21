-- System variables
local TICKET_PRICE_SPEEDING = 100
local TICKET_PRICE_NO_LICENSE = 250

local MAXIMUM_SPEED = 100
local REQUIRES_LICENSE = false

-- User variables
local currentSpeed = 101
local hasLicense = true

local ticketPrice = 0

-- Calculating ticket price
if currentSpeed > MAXIMUM_SPEED then
	ticketPrice += TICKET_PRICE_SPEEDING
end
if REQUIRES_LICENSE == true and hasLicense ~= true then
	ticketPrice += TICKET_PRICE_NO_LICENSE
end

-- Printing ticket price
print("Ticket Price: " .. ticketPrice)
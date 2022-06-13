local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

function promptPremium()
	-- Getting player
	local player = Players.LocalPlayer
	
	-- Checking if player owns Premium
	if player.MembershipType ~= Enum.MembershipType.Premium then
		-- Player is not subscribed to Premium
		MarketplaceService:PromptPremiumPurchase(player)
	else
		-- Player is subscribed to Premium
		print("You are already subscribed!")
	end
end

promptPremium()
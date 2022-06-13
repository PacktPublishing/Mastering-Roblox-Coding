local MarketplaceService = game:GetService("MarketplaceService")

function purchaseFinished(player, gamePassId, purchased)
	if purchased == true then
		-- Getting game pass product info
		local productInfo = MarketplaceService:GetProductInfo(
			gamePassId,
			Enum.InfoType.GamePass
		)
		
		-- Printing message
		print(
			player.Name .. " just purchased a game pass"
			.. " named [" .. productInfo.Name .. "]."
		)
	end
end

MarketplaceService.PromptGamePassPurchaseFinished:Connect(purchaseFinished)
--[[
    Follow the instructions provided in the book.
--]]

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local screenGui = script.Parent
local purchaseButton = screenGui:WaitForChild("PurchaseButton")

function purchaseProduct()
	MarketplaceService:PromptProductPurchase(
		-- Player that will receive the prompt
		Players.LocalPlayer,

		-- Developer Product ID
		123456789
	)
end

purchaseButton.MouseButton1Click:Connect(purchaseProduct)
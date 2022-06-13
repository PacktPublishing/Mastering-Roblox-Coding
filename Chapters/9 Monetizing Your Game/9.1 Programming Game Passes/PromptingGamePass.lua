--[[
    Follow the instructions provided in the book.
--]]

local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local screenGui = script.Parent
local purchaseButton = screenGui:WaitForChild("PurchaseButton")

function purchaseGamePass()
	MarketplaceService:PromptGamePassPurchase(
		-- Player that will receive the prompt
		Players.LocalPlayer,

		-- Game Pass Id
		123456789
	)
end

purchaseButton.MouseButton1Click:Connect(purchaseGamePass)
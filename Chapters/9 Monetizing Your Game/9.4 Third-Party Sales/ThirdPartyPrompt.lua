local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local screenGui = script.Parent
local purchaseButton = screenGui:WaitForChild("PurchaseButton")

function purchaseAvatarItem()
    MarketplaceService:PromptPurchase(
        -- Player that will receive the prompt
        Players.LocalPlayer,

        -- Avatar Item Id
        123456789
    )
end

purchaseButton.MouseButton1Click:Connect(purchaseAvatarItem)

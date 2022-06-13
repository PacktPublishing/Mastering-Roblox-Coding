local Players = game:GetService("Players")
local PolicyService = game:GetService("PolicyService")

local player = Players.LocalPlayer

print(PolicyService:GetPolicyInfoForPlayerAsync(player))
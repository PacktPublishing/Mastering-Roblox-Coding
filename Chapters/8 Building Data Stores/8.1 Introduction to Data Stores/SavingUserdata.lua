DataStore:SetAsync(
	"Plr_" .. player.UserId,
	{
		[1] = {
			["item_type"] = workspace.PlacedItems.Chair,--> Error!
			["position"] = Vector3.new(0, 0, 0) --> Error!
		},
		[2] = {
			["item_type"] = "Chair", --> Allowed!
			["position"] = {0, 0, 0} --> Allowed!
		}
	}
)

local data = DataStore:GetAsync("Plr_" .. player.UserId)
local chairPosition = Vector3.new(
	data[2]["position"][1], --> 100
	data[2]["position"][2], --> 200
	data[2]["position"][3] --> 300
)
SomeDataStore:UpdateAsync(
	-- Key
	"Plr_" .. player.UserId,

	-- Update function
	function(oldData)
		-- Getting current data
		local data = oldData or 0

		-- Updating data
		data += 1

		-- Returning new data
		return data
	end
)
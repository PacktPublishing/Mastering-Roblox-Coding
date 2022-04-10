--[[
    Instructions:
    - Create a ScreenGui inside of the StarterGui
    - Directly inside the ScreenGui create a Frame named 'SomeFrame'
    - Directly inside the ScreenGui create a LocalScript and insert the following code:
--]]

local ui = script.Parent
local frame = ui:WaitForChild("SomeFrame")

--

function openMenu()
    -- Setting frame out of the screen
    frame.Position = UDim2.new(0.5, 0, 1.5, 0)
    
    -- Making frame visible
    frame.Visible = true
    
    -- Moving frame into the screen
    frame:TweenPosition(
        -- (Required)
        -- Target Position
        UDim2.new(0.5, 0, 0.5, 0),
        
        -- (Optional)
        -- EasingStyle Direction
        Enum.EasingDirection.Out,
        
        -- (Optional)
        -- Tween Style (EasingStyle)
        Enum.EasingStyle.Quad,
        
        -- (Optional)
        -- Duration of the Tween
        1,
        
        -- (Optional)
        -- Set to true if you want to
        -- override a Tween that might
        -- be active on the Frame right now.
        false,
        
        -- (Optional)
        -- Function that gets executed
        -- once the :TweenPosition finished.
        function()
            print("Tween has finished!")
        end
    )
end

--

openMenu()

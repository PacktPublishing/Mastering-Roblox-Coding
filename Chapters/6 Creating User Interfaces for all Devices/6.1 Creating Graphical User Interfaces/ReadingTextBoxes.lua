--[[
    Instructions:
    - Create a LocalScript and insert this script
    - Fix the textBox reference to referance a TextBox
--]]

local textBox = ...

function textboxChanged()
    print(textBox.Text)
end

textBox.FocusLost:Connect(textboxChanged)
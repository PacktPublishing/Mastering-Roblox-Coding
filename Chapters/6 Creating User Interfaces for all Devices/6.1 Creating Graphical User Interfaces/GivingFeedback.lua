--[[
    Instructions:
    - Follow the instructions in the book to create the GUI
    - Insert the following script into the LocalScript:
--]]

local screenGui = script.Parent

local givingFeedback = screenGui:WaitForChild("GivingFeedback")
local feedbackReceived = screenGui:WaitForChild("FeedbackReceived")


--

function setup()
    givingFeedback.Visible = true
    feedbackReceived.Visible = false
end

function submitFeedback()
    -- Getting the user input
    local textbox = givingFeedback:WaitForChild("TextBox")
    local input = textbox.Text
    
    -- Checking if user has provided feedback
    if string.len(input) >= 3 then
        -- Showing feedback recorded frame
        givingFeedback.Visible = false
        feedbackReceived.Visible = true
        
        -- Resetting feedback textbox
        textbox.Text = ""
    else
        warn("Cannot submit feedback less than 3 characters!")
    end
end

function submitMoreFeedback()
    givingFeedback.Visible = true
    feedbackReceived.Visible = false
end


--

setup()
givingFeedback:WaitForChild("SubmitFeedback").MouseButton1Click:Connect(submitFeedback)
feedbackReceived:WaitForChild("Back").MouseButton1Click:Connect(submitMoreFeedback)
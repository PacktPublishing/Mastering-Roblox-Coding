local UserInputService = game:GetService("UserInputService")

function input(inputObject, gameProcessedEvent)
	print(inputObject.UserInputType)
end

UserInputService.InputBegan:Connect(input)
UserInputService.InputChanged:Connect(input)
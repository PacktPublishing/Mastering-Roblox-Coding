local UserInputService = game:GetService("UserInputService")

function inputChanged(inputObject, gameProcessedEvent)
	print(gameProcessedEvent, inputObject.KeyCode)
end

UserInputService.InputChanged:Connect(inputChanged)
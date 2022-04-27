local clickDetector = workspace.ClickablePart.ClickDetector

function clicked(player)
    print(player.Name)
end

clickDetector.MouseClick:Connect(clicked)
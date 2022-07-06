local elevator = workspace.Elevator

for i = 1, 100 do
	elevator.Position += Vector3.new(0, 1, 0)
	task.wait(1)
end
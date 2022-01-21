print("Hello " .. "Mark")
print("Hello " .. "Mark" .. "!")
print("Hello Mark!\nToday is Monday!")
print("Shopping List:\n\t- Bread,\n\t- Butter,\n\t- Milk.")
print("4" .. 5)
print("4" .. tostring(5))
print("4" + 5)
print(tonumber("4") + 5)
print(tonumber("4" .. tostring(5)))
print(tonumber("a5")) -- This will return nil.
print(tonumber("a5") + 6) -- This will give an error.
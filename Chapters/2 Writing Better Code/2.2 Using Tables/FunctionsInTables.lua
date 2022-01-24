local calculator = {
    ["Add"] = function(x, y)
       return x + y
    end,
    ["Subtract"] = function(x, y)
       return x - y
    end
 }

 print(calculator["Add"](5, 5))
local outsideScopeData = "this is accessible everywhere"
local dataSetInScope

do
    -- New Scope
    print(outsideScopeData)

    -- Setting data in this scope
    dataSetInScope = "This data is accessible in this scope."

    -- Printing in scope data
    print(dataSetInScope)
end

-- Printing data outside of the scope
print(outsideScopeData)
print(dataSetInScope)
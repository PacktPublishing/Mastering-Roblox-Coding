--[[
    Instructions:
    - Create a Script in ServerScriptService
    - Create a RemoteEvent in ReplicatedStorage named 'AddMoney'
    - Insert the following code

    Keep in mind:   Honeypots are here to kick/ban exploiters.
                    Never call these RemoteEvents/RemoteFunctions
                    from the client!
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

function kickPlayer(player)
    player:Kick("Do not exploit in our game!")
end

ReplicatedStorage.AddMoney.OnServerEvent:Connect(kickPlayer)
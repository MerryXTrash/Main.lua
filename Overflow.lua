local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

LocalPlayer.Chatted:Connect(function(message)
    if message == ";dex" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/DEX-Explorer/main/Mobile.lua"))()
    elseif message == ";rspy" then
        print("test2")
    end
end)

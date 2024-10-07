local function createFPSDisplay()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.CoreGui
    screenGui.IgnoreGuiInset = true

    local fpsLabel = Instance.new("TextLabel")
    fpsLabel.Parent = screenGui
    fpsLabel.Size = UDim2.new(0, 200, 0, 50)
    fpsLabel.Position = UDim2.new(0.5, -100, 0, -10)
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.TextSize = 18
    fpsLabel.Font = Enum.Font.SourceSansBold
    fpsLabel.Text = "FPS: 0"
    fpsLabel.TextStrokeTransparency = 0
    fpsLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    while true do
        local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
        fpsLabel.Text = "FPS: " .. tostring(fps)

        if fps <= 15 then
            fpsLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        elseif fps <= 30 then
            fpsLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
        elseif fps <= 49 then
            fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        else
            fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        end

        wait(0.1)  -- Added a small wait to reduce the update frequency
    end
end

local function setFullbright()
    local Lighting = game.Lighting
    Lighting.ClockTime = 12
    Lighting.Brightness = 2
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)

    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("Atmosphere") then
            v:Destroy()
        end
    end
end

if getgenv().Config.Fullbright then
    setFullbright()
else
    print("Fullbright is disabled.")
end

if getgenv().Config.ShowFPS then
    createFPSDisplay()
else
    print("ShowFPS is disabled.")
end

local success, err = pcall(function()
    local scriptToLoad = game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Main.lua/refs/heads/main/Checkgame.lua40")
    local loadedScript = loadstring(scriptToLoad)
    loadedScript()  -- Execute the loaded script
end)

if not success then
    warn("An error occurred: " .. err)  -- Prints the error to the output console
end

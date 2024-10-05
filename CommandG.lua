local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = game.Players.LocalPlayer

local Blur = Instance.new("BlurEffect")
Blur.Size = 0
Blur.Parent = Lighting

local function blurScreen(targetSize, duration)
    local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tween = TweenService:Create(Blur, tweenInfo, {Size = targetSize})
    tween:Play()
    tween.Completed:Wait()
end

local function clearBlur(duration)
    blurScreen(0, duration)
end

local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.CoreGui

local backgroundFrame = Instance.new("Frame")
backgroundFrame.Size = UDim2.new(1, 0, 1, 0)
backgroundFrame.Position = UDim2.new(0, 0, 0, 0)
backgroundFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
backgroundFrame.BackgroundTransparency = 0.1
backgroundFrame.Parent = screenGui

local Guide = Instance.new("ImageLabel")
Guide.Size = UDim2.new(0, 360, 0, 250)
Guide.Position = UDim2.new(0.5, 0, 0.5, 0)
Guide.BackgroundTransparency = 1
Guide.AnchorPoint = Vector2.new(0.5, 0.5)
Guide.Image = "rbxassetid://136864123005759"
Guide.Parent = screenGui

local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Parent = screenGui
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(0, 400, 0, 280)
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
DropShadow.Rotation = 0.01

local loadingBarBackground = Instance.new("Frame")
loadingBarBackground.Size = UDim2.new(0, 200, 0, 10)
loadingBarBackground.Position = UDim2.new(0.5, 0, 0.75, 0)
loadingBarBackground.AnchorPoint = Vector2.new(0.5, 0.5)
loadingBarBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
loadingBarBackground.Parent = Guide

local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.Position = UDim2.new(0, 0, 0, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(173, 216, 230)
loadingBar.Parent = loadingBarBackground

local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 182, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 0, 255))
}
uiGradient.Parent = loadingBar

local function simulateLoading()
    for i = 1, 150 do
        loadingBar.Size = UDim2.new(i / 150, 0, 1, 0)
        wait(0.005)
    end

    loadingBarBackground:Destroy()

    local tweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)

    local guideTween = tweenService:Create(Guide, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })

    local dropShadowTween = tweenService:Create(DropShadow, tweenInfo, {
        Size = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0)
    })

    local backgroundTween = tweenService:Create(backgroundFrame, tweenInfo, {
        BackgroundTransparency = 1
    })

    guideTween:Play()
    dropShadowTween:Play()
    backgroundTween:Play()

    guideTween.Completed:Wait()
    Guide:Destroy()
    DropShadow:Destroy()
    backgroundFrame:Destroy()
end

local function tweenGradientRotation()
    while true do
        for angle = 0, 360 do
            uiGradient.Rotation = angle
            wait(0.02)
        end
    end
end

local function copy()
local playerBackpack = game.Players.LocalPlayer.Backpack
for _, player in pairs(game.Players:GetPlayers()) do
    local character = player.Character or player.CharacterAdded:Wait()
    
    for _, tool in pairs(character:GetDescendants()) do
        if tool:IsA("Tool") then
            -- ตรวจสอบว่ามี Tool นั้นอยู่ใน Backpack ของผู้เล่นแล้วหรือไม่
            local existingTool = playerBackpack:FindFirstChild(tool.Name)
            if existingTool then
                existingTool:Destroy() -- ทำลาย Tool ที่มีอยู่แล้ว
            end
            
            local toolClone = tool:Clone()
            toolClone.Parent = playerBackpack
        end
    end
end
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local char = LocalPlayer.Character:WaitForChild("Humanoid")

LocalPlayer.Chatted:Connect(function(message)
    if message == "/Show" or message == "/show" then
        g("M2", "rbxassetid://131997809147561", 6)
        clearBlur(1)
    elseif message == "/Copy" or message == "/copy" then
        copy()
    elseif message == "/Antilag" or message == "/antilag" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Main.lua/refs/heads/main/Antilag.lua"))()
    elseif message == "/Tp" or message == "/tp" then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Lobby.lua"))()
    elseif string.sub(message, 1, 6) == "/speed" or "/Speed" then
        local speedvalue = tonumber(string.match(message, "%d+"))
        if speedvalue then
            char.WalkSpeed = speedvalue
        end
    end
end)

simulateLoading()
tweenGradientRotation()
clearBlur(1)

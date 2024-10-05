local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local player = game.Players.LocalPlayer

local XameitzFrame = Instance.new("ScreenGui")
XameitzFrame.Name = "XameitzFrame"
XameitzFrame.Parent = game.CoreGui
XameitzFrame.ZIndexBehavior = Enum.ZIndexBehavior.Global

local function createNotification(config, duration)
    if XameitzFrame:FindFirstChild("Frame") then
        XameitzFrame.Frame:Destroy()
    end

    local All = {
        ["Stroke"] = config.StrokeColor or Color3.fromRGB(75, 0, 130),
        ["TitleColor"] = config.TitleColor or Color3.fromRGB(255, 255, 255),
        ["DescColor"] = config.DescColor or Color3.fromRGB(200, 200, 200)
    }

    local Frame = Instance.new("Frame")
    Frame.Name = "Frame"
    Frame.Active = true
    Frame.Parent = XameitzFrame
    Frame.Draggable = true
    Frame.Size = UDim2.new(0, config.UiWidth, 0, 60)
    Frame.Position = UDim2.new(0.5, -config.UiWidth / 2, 0, -60)
    Frame:TweenPosition(UDim2.new(0.5, -config.UiWidth / 2, 0, 10), "Out", "Quad", 0.4, true)

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(75, 75, 75))
    })
    gradient.Parent = Frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = All["Stroke"]
    stroke.Thickness = 2.5
    stroke.Transparency = 0
    stroke.Parent = Frame

    local Image = Instance.new("ImageLabel")
    Image.Name = "Icon"
    Image.Parent = Frame
    Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Image.BackgroundTransparency = 1.0
    Image.Position = UDim2.new(0, 8, 0, 8)
    Image.Size = UDim2.new(0, 45, 0, 45)
    Image.Image = config.Image

    local ImageCorner = Instance.new("UICorner")
    ImageCorner.CornerRadius = UDim.new(0, 5)
    ImageCorner.Parent = Image

    Image:TweenSize(UDim2.new(0, 50, 0, 50), "Out", "Quad", 0.4, true)
    Image:TweenPosition(UDim2.new(0, 5, 0, 5), "Out", "Quad", 0.4, true)

    local warning = Instance.new("ImageLabel")
    warning.Parent = Frame
    warning.Image = "rbxassetid://96009740357973"
    warning.BackgroundTransparency = 1.0
    warning.Position = UDim2.new(1, -30, 0, 10)
    warning.Size = UDim2.new(0, 20, 0, 20)

    local Title = Instance.new("TextLabel")
    Title.Parent = Frame
    Title.BackgroundTransparency = 1.0
    Title.Position = UDim2.new(0, 60, 0, 8)
    Title.Size = UDim2.new(0, config.UiWidth - 60, 0, 20)
    Title.Font = Enum.Font.GothamBold
    Title.Text = config.Name
    Title.TextColor3 = All["TitleColor"]
    Title.TextSize = 16.0
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local Desc = Instance.new("TextLabel")
    Desc.Parent = Frame
    Desc.BackgroundTransparency = 1.0
    Desc.Position = UDim2.new(0, 60, 0, 30)
    Desc.Size = UDim2.new(0, config.UiWidth - 60, 0, 20)
    Desc.Font = Enum.Font.GothamSemibold
    Desc.TextTransparency = 0
    Desc.Text = config.DescText or ""
    Desc.TextColor3 = All["DescColor"]
    Desc.TextSize = 12.0
    Desc.TextXAlignment = Enum.TextXAlignment.Left

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = Frame

    if duration then
        delay(duration, function()
            if Frame then
                for i = 0, 1, 0.1 do
                    Image.BackgroundTransparency = i
                    warning.ImageTransparency = i
                    Image.ImageTransparency = i
                    Frame.BackgroundTransparency = i
                    Title.TextTransparency = i
                    Desc.TextTransparency = i
                    stroke.Transparency = i
                    gradient.Transparency = NumberSequence.new(i)
                    wait(0.1)
                end
                Frame:Destroy()
            end
        end)
    end
end

local Normal = {
    Name = "Good Day for You ^^",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(79, 255, 117),
    TitleColor = Color3.fromRGB(255, 255, 255),
    DescText = "Note by Owner of Overflow 4.0",
    DescColor = Color3.fromRGB(200, 200, 200)
}

local Xmas = {
    Name = "Merry Christmas ☃️",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(255, 50, 50),
    DescText = "Note by Owner of Overflow 4.0",
    DescColor = Color3.fromRGB(200, 200, 200)
}

local Halloween = {
    Name = "Happy Halloween Day 🎃",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(255, 145, 0),
    DescText = "Note by Owner of Overflow 4.0",
    DescColor = Color3.fromRGB(200, 200, 200)
}

local Newyear = {
    Name = "Happy New Year 🎉",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(255, 217, 0),
    DescText = "I Hope This Year It Good Year for You ^^",
    DescColor = Color3.fromRGB(200, 200, 200)
}

local cyear = {
    Name = "Countdown New Year ⏱",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(255, 217, 0),
    DescText = "I Hope Next Years is Good Year for You ^^",
    DescColor = Color3.fromRGB(200, 200, 200)
}


local Easter = {
    Name = "Happy Easter Day 🐰",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(255, 255, 255),
    DescText = "Note by Owner of Overflow 4.0",
    DescColor = Color3.fromRGB(200, 200, 200)
}

local Valentine = {
    Name = "Happy Valentine's Day ❤️",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(255, 81, 232),
    DescText = "Note by Owner of Overflow 4.0",
    DescColor = Color3.fromRGB(200, 200, 200)
}

local Songkran = {
    Name = "Happy SongKran Festival 💦",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(0, 140, 255),
    DescText = "สุขสันต์วันสงกรานต์น่ะ เล่นน้ำให้สนุกล่ะระวังอุบัติเหตุด้วยน้า",
    DescColor = Color3.fromRGB(200, 200, 200)
}

local inf = {
    Name = "How to Fix",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(0, 195, 255),
    DescText = "If UI Bug then On and Off Again",
    DescColor = Color3.fromRGB(200, 200, 200)
}

local warning = {
    Name = "Error",
    Image = "rbxassetid://134204200422920",
    UiWidth = 300,
    StrokeColor = Color3.fromRGB(100, 100, 100),
    TitleColor = Color3.fromRGB(255, 0, 0),
    DescText = "Place.Id Not Found",
    DescColor = Color3.fromRGB(255, 230, 0)
}

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


-- Create ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true  -- Ignore GUI Inset (Safe Area) and display as full screen
screenGui.Parent = game.CorGui  -- Parent it to the player's PlayerGui

-- Create ImageLabel (Guide)
local Guide = Instance.new("ImageLabel")
Guide.Size = UDim2.new(0, 360, 0, 250)  -- Size of the guide
Guide.Position = UDim2.new(0.5, 0, 0.5, 0)
Guide.BackgroundTransparency = 1
Guide.AnchorPoint = Vector2.new(0.5, 0.5)
Guide.Image = "rbxassetid://136864123005759"  -- Replace with your image ID
Guide.Parent = screenGui  -- Parent the ImageLabel to the ScreenGui

-- Create DropShadow for the Guide Image
local DropShadow = Instance.new("ImageLabel")
DropShadow.Name = "DropShadow"
DropShadow.Parent = screenGui  -- Set the parent to the ScreenGui
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0) -- Center the shadow
DropShadow.Size = UDim2.new(0, 400, 0, 280) -- Make the shadow 20 pixels larger than the image
DropShadow.ZIndex = 0
DropShadow.Image = "rbxassetid://6015897843" -- Shadow image ID
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0) -- Shadow color
DropShadow.ImageTransparency = 0.500 -- Transparency level of the shadow
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
DropShadow.Rotation = 0.01

-- Create a loading bar frame (background for the loading bar)
local loadingBarBackground = Instance.new("Frame")
loadingBarBackground.Size = UDim2.new(0, 200, 0, 10)  -- Height of 10
loadingBarBackground.Position = UDim2.new(0.5, 0, 0.75, 0)  -- Adjust Y position
loadingBarBackground.AnchorPoint = Vector2.new(0.5, 0.5)
loadingBarBackground.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Dark gray background color
loadingBarBackground.Parent = Guide  -- Parent to the ImageLabel

-- Create the loading bar (actual progress)
local loadingBar = Instance.new("Frame")
loadingBar.Size = UDim2.new(0, 0, 1, 0)  -- Start with 0 width, maintain full height
loadingBar.Position = UDim2.new(0, 0, 0, 0)  -- Align to the left inside the background
loadingBar.BackgroundColor3 = Color3.fromRGB(173, 216, 230)  -- Light blue bar color
loadingBar.Parent = loadingBarBackground  -- Parent the loading bar to the background

-- Create UIGradient for the loading bar
local uiGradient = Instance.new("UIGradient")
uiGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 182, 255)),  -- Point1
    ColorSequenceKeypoint.new(1, Color3.fromRGB(85, 0, 255))    -- Point2
}
uiGradient.Parent = loadingBar  -- Parent the gradient to the loading bar

-- Function to simulate loading
local function simulateLoading()
    for i = 1, 100 do  -- Loop 100 times to simulate loading progress
        loadingBar.Size = UDim2.new(i / 100, 0, 1, 0)  -- Increment the width of the bar
        wait(0.05)  -- Wait for 0.05 seconds to simulate loading time
    end
    
    loadingBarBackground:Destroy()  -- Destroy the loading bar background immediately after loading is complete
end

-- Tween the UIGradient rotation smoothly from 0 to 360 degrees
local function tweenGradientRotation()
    for angle = 120, 360 do  -- Rotate continuously while loading
        uiGradient.Rotation = angle  -- Set the gradient rotation
        wait(0.02)  -- Adjust the wait time for smoothness
    end
end

-- Tween the ImageLabel and DropShadow to shrink to the center of the screen and destroy them
local function shrinkImageToCenter()
    -- Tween the Guide image to shrink
    Guide:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.5, true)
    Guide.Position = UDim2.new(0.5, 0, 0.5, 0)  -- Center position

    -- Tween the DropShadow to shrink
    DropShadow:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.5, true)
    DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)  -- Center position

    wait(0.5)  -- Wait for the tween to complete before destroying
    Guide:Destroy()  -- Destroy the image
    DropShadow:Destroy()  -- Destroy the drop shadow
end

-- Start the loading process and gradient rotation
spawn(function() 
    simulateLoading()  -- Start loading in a separate thread
    shrinkImageToCenter()  -- Call the shrink function to shrink to the center after loading
end)

  -- Start the gradient rotation

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

local currentDate = os.date("*t")
local day = currentDate.day
local month = currentDate.month

local function checkHolidays()
    if month == 1 and day == 1 then
        createNotification(Newyear, 2.5)
    elseif month == 3 and (day >= 21 and day <= 25) then
        createNotification(Easter, 2.5)
    elseif month == 2 and day == 14 then
        createNotification(Valentine, 2.5)
    elseif month == 10 and day == 31 then
        createNotification(Halloween, 2.5)
    elseif month == 12 and day == 25 then
        createNotification(Xmas, 2.5)
    elseif month == 12 and day == 31 then
        createNotification(cyear, 2.5)
    else
        createNotification(Normal, 2.5)
        createNotification(inf, 2.5)
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

tweenGradientRotation()
clearBlur(1)
checkHolidays()

local games = {
	[6296321810 or 6479231833 or 6301638949 or 6480994221] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Book1ch1.lua', --b1c1
	[6373539583 or 6485055338 or 6406571212 or 6485055836 or 6425178683 or 6485056556] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Book1ch2.lua', --b1c2
	[6472459099 or 6688734180 or 6682163754 or 6688734313 or 6682164423 or 6688734395] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Book1ch3.lua', --b1c3
	[7265396387 or 7251865082 or 7265396805 or 7251866503 or 7265397072 or 7251867155 or 7265397848 or 7251867574] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Book1ch4.lua', --b1ch4
	[6243699076 or 15989427413 or 7068737459] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Lobby.lua', --lobby
	[7068738088 or 7068951438 or 7068951914 or 7068951914 or 7068740106 or 7068952294] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Thewitchtrial.lua', --twt
	[15996404472 or 15996407335 or 15996411979 or 15996410294 or 15996413469 or 15996414738 or 15996416081 or 15996417416] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Classic.lua', --classic
	[8056702588] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Book2Ch1.lua', -- b2ch1
	[13489800654] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Book2ch2.lua', --b2ch2
	[15962819441] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Book2ch3.lua', --b2ch3
	[8311302084 or 8311299084] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Xmas.lua', --Xmas
	[11126398230] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Nightmarecircus.lua', --nightmarecircus
	[7618863566] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Normal/Jigoku.lua' --Jigoku
}

function Normal()
local currentPlaceId = game.PlaceId
local gameUrl = games[currentPlaceId]

if gameUrl then
	loadstring(game:HttpGet(gameUrl))()
end
end



local gamesExtra = {
	[6296321810 or 6479231833 or 6301638949 or 6480994221] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch1.lua', --b1c1
	[6373539583 or 6485055338 or 6406571212 or 6485055836 or 6425178683 or 6485056556] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch2.lua', --b1c2
	[6472459099 or 6688734180 or 6682163754 or 6688734313 or 6682164423 or 6688734395] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch3.lua', --b1c3
	[7265396387 or 7251865082 or 7265396805 or 7251866503 or 7265397072 or 7251867155 or 7265397848 or 7251867574] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book1ch4.lua', --b1ch4
	[6243699076 or 15989427413 or 7068737459] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Lobby.lua', --lobby
	[7068738088 or 7068951438 or 7068951914 or 7068951914 or 7068740106 or 7068952294] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Thewitchtrial.lua', --twt
	[15996404472 or 15996407335 or 15996411979 or 15996410294 or 15996413469 or 15996414738 or 15996416081 or 15996417416] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Classic.lua', --classic
	[8056702588] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book2Ch1.lua', -- b2ch1
	[13489800654] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book2ch2.lua', --b2ch2
	[15962819441] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Book2ch3.lua', --b2ch3
	[8311302084 or 8311299084] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Xmas.lua', --Xmas
	[11126398230] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Nightmarecircus.lua', --nightmarecircus
	[7618863566] = 'https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/Extra/Jigoku.lua' --Jigoku
}

function Extra()
local currentPlaceId = game.PlaceId
local gameUrl = gameExtra[currentPlaceId]

if gameUrl then
	loadstring(game:HttpGet(gameUrl))()
end
end

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


local function op()
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyImageGui" -- ตั้งชื่อ ScreenGui
screenGui.Parent = game:GetService("CoreGui") -- เพิ่ม GUI เข้าไปใน PlayerGui

local screenEdgePadding = 150 -- ระยะห่างจากขอบหน้าจอ (150 pixels)

-- สร้าง TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Name = "MyTextLabel"
textLabel.Size = UDim2.new(1, 0, 0, 30) -- ขนาด TextLabel (เต็มความกว้าง 30 pixels สูง)
textLabel.Position = UDim2.new(0, 0, 0.8, 0) -- ตั้งตำแหน่งที่ต้องการ (ต่ำสุด)
textLabel.Text = "Tip : Blue is Normal - Purple is Extra(Solo Only)" -- ข้อความใน TextLabel
textLabel.BackgroundTransparency = 1 -- ทำให้พื้นหลังโปร่งใส
textLabel.TextColor3 = Color3.fromRGB(255, 255, 255) -- สีข้อความ
textLabel.TextScaled = true -- ทำให้ข้อความปรับขนาดได้
textLabel.Parent = screenGui -- เพิ่ม TextLabel เข้าไปใน ScreenGui

-- ฟังก์ชันเพื่อสร้าง ImageButton ที่มี UIStroke
local function createImageButton(name, position, imageId)
    local imageButton = Instance.new("ImageButton")
    imageButton.Name = name
    imageButton.Size = UDim2.new(0, 100, 0, 100) -- ขนาดของ ImageButton (100x100 pixels)
    imageButton.Position = position -- ตั้งค่าตำแหน่ง
    imageButton.Image = imageId -- ใช้ ID ของภาพที่ถูกส่งเข้ามา
    imageButton.BackgroundTransparency = 1 -- ทำให้พื้นหลังโปร่งใส

    -- ตั้งค่ารูปร่างเป็นมน (ลดมุม)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0.2, 0) -- ทำให้มุมมีรูปร่างมน (ปรับลดขนาด)
    corner.Parent = imageButton -- เพิ่ม UICorner เข้ากับ ImageButton

    -- สร้าง UIStroke
    local uiStroke = Instance.new("UIStroke")
    uiStroke.Color = Color3.fromRGB(128, 128, 128) -- สีเทาสำหรับขอบ
    uiStroke.Thickness = 4 -- ขนาดความหนาของขอบ
    uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border -- การใช้ขอบเป็นเส้นรอบนอก
    uiStroke.Parent = imageButton -- เพิ่ม UIStroke เข้ากับ ImageButton

    imageButton.Parent = screenGui -- เพิ่ม ImageButton เข้าไปใน ScreenGui

    return imageButton -- คืนค่ากลับ ImageButton เพื่อใช้ในฟังก์ชันคลิก
end

-- สร้าง ImageButton ตัวแรก (อยู่ทางซ้าย)
local button1 = createImageButton("MyImageButton1", UDim2.new(0, screenEdgePadding, 0.4, -50), "rbxassetid://134204200422920")

-- สร้าง ImageButton ตัวที่สอง (อยู่ทางขวา)
local button2 = createImageButton("MyImageButton2", UDim2.new(1, -100 - screenEdgePadding, 0.4, -50), "rbxassetid://134754092492795")

-- ฟังก์ชันคลิกสำหรับ button 1
button1.MouseButton1Click:Connect(function()
    wait(1)
    local Uiz = game:GetService("CoreGui"):FindFirstChild("MyImageGui")
    if Uiz then
    Uiz:Destroy()
    Normal()
    clearBlur(1)
    end
end)

-- ฟังก์ชันคลิกสำหรับ button 2
button2.MouseButton1Click:Connect(function()
    wait(1)
    local Uiz = game:GetService("CoreGui"):FindFirstChild("MyImageGui")
    if Uiz then
    Uiz:Destroy()
    Extra()
    clearBlur(1)
    end
end)
end


local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.Name = "CustomGui"

local frame = Instance.new("Frame")
frame.Parent = screenGui
frame.Size = UDim2.new(0, 400, 0, 200)
frame.Position = UDim2.new(0.5, -200, 0.5, -100)
frame.BackgroundTransparency = 1

local uiGradient = Instance.new("UIGradient")
uiGradient.Parent = frame
uiGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 100, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(40, 40, 40))
})

local titleLabel = Instance.new("TextLabel")
titleLabel.Parent = frame
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Owner"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 32
titleLabel.TextStrokeTransparency = 0
titleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
titleLabel.TextTransparency = 1

local discordLabel = Instance.new("TextLabel")
discordLabel.Parent = frame
discordLabel.Size = UDim2.new(1, 0, 0.2, 0)
discordLabel.Position = UDim2.new(0, 0, 0.2, 0)
discordLabel.BackgroundTransparency = 1
discordLabel.Text = "Discord  : imgonnatop_aizawa"
discordLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
discordLabel.Font = Enum.Font.SourceSans
discordLabel.TextSize = 28
discordLabel.TextStrokeTransparency = 0
discordLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
discordLabel.TextTransparency = 1

local imageLabel = Instance.new("ImageLabel")
imageLabel.Parent = frame
imageLabel.Size = UDim2.new(0.5, 0, 0.5, 0)
imageLabel.Position = UDim2.new(0.25, 0, 0.4, 0)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://98864788974879"
imageLabel.ImageTransparency = 1
imageLabel.ScaleType = Enum.ScaleType.Fit

local corner = Instance.new("UICorner")
corner.Parent = imageLabel
corner.CornerRadius = UDim.new(0, 10)

local function tweenTransparency()
    local fadeInTweenFrame = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {BackgroundTransparency = 0})
    local fadeInTweenTitle = TweenService:Create(titleLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {TextTransparency = 0})
    local fadeInTweenDiscord = TweenService:Create(discordLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {TextTransparency = 0})
    local fadeInTweenImage = TweenService:Create(imageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {ImageTransparency = 0})

    wait(0.5)

    fadeInTweenFrame:Play()
    fadeInTweenTitle:Play()
    fadeInTweenDiscord:Play()
    fadeInTweenImage:Play()

    fadeInTweenFrame.Completed:Wait()

    wait(2.5)

    local fadeOutTweenFrame = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {BackgroundTransparency = 1})
    local fadeOutTweenTitle = TweenService:Create(titleLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {TextTransparency = 1})
    local fadeOutTweenDiscord = TweenService:Create(discordLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {TextTransparency = 1})
    local fadeOutTweenImage = TweenService:Create(imageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {ImageTransparency = 1})

    fadeOutTweenFrame:Play()
    fadeOutTweenTitle:Play()
    fadeOutTweenDiscord:Play()
    fadeOutTweenImage:Play()

    fadeOutTweenFrame.Completed:Wait()
    
    screenGui:Destroy()
    op()
end


blurScreen(24, 1)
tweenTransparency()

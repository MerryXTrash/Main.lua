local function normal()
local games = {
	[6296321810 or 6479231833 or 6301638949 or 6480994221] = '', --b1c1
	[6373539583 or 6485055338 or 6406571212 or 6485055836 or 6425178683 or 6485056556] = '', --b1c2
	[6472459099 or 6688734180 or 6682163754 or 6688734313 or 6682164423 or 6688734395] = '', --b1c3
	[] = '', --b1ch4
	[6243699076 or 15989427413 or 7068737459] = '', --lobby
	[7068738088 or 7068951438 or 7068951914 or 7068951914 or 7068740106 or 7068952294] = '', --twt
	[15996404472 or 15996407335 or 15996411979 or 15996410294 or 15996413469 or 15996414738 or 15996416081 or 15996417416] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs1.lua', --classic
	[] = '', -- b2ch1
	[] = '', --b2ch2
	[] = '', --b2ch3
	[] = '', --Xmas
	[] = '', --nightmarecircus
	[] = '' --holloween
}

local currentPlaceId = game.PlaceId
local gameUrl = games[currentPlaceId]

if gameUrl then
	loadstring(game:HttpGet(gameUrl))()
end
end




local function Extra()
local games = {
	[6296321810 or 6479231833 or 6301638949 or 6480994221] = '', --b1c1
	[6373539583 or 6485055338 or 6406571212 or 6485055836 or 6425178683 or 6485056556] = '', --b1c2
	[6472459099 or 6688734180 or 6682163754 or 6688734313 or 6682164423 or 6688734395] = '', --b1c3
	[] = '', --b1ch4
	[6243699076 or 15989427413 or 7068737459] = '', --lobby
	[7068738088 or 7068951438 or 7068951914 or 7068951914 or 7068740106 or 7068952294] = '', --twt
	[15996404472 or 15996407335 or 15996411979 or 15996410294 or 15996413469 or 15996414738 or 15996416081 or 15996417416] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs1.lua', --classic
	[] = '', -- b2ch1
	[] = '', --b2ch2
	[] = '', --b2ch3
	[] = '', --Xmas
	[] = '', --nightmarecircus
	[] = '' --holloween
}

local currentPlaceId = game.PlaceId
local gameUrl = games[currentPlaceId]

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
    clearBlur(1)
end

blurScreen(24, 1)
tweenTransparency()

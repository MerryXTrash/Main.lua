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

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

-- สร้าง ScreenGui
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.Name = "Guide"

function g(Name, id, Time)
local guide = Instance.new("ImageLabel")
guide.Parent = screenGui
guide.Name = Name -- วาง ImageLabel ใน ScreenGui
guide.Size = UDim2.new(0, 0, 0, 0) -- ขนาดเริ่มต้นเล็ก
guide.Position = UDim2.new(0.5, 0, 0.5, 0) -- ตำแหน่งกลางหน้าจอ
guide.Image = id -- ตั้งค่า Image ID
guide.AnchorPoint = Vector2.new(0.5, 0.5) -- ให้ตำแหน่งอยู่ที่กลาง
guide.BackgroundTransparency = 1 -- ตั้งค่าความโปร่งใสของพื้นหลังเป็น 1

-- เพิ่ม UICorner เพื่อให้มุมโค้ง
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15) -- ตั้งค่ารัศมีของมุม
corner.Parent = guide -- เพิ่ม UICorner ลงใน ImageLabel

-- สร้างฟังก์ชันสำหรับการแสดงและทำลาย guide
    local expandTween = TweenService:Create(guide, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 400, 0, 200) -- ขนาดสุดท้าย
    })
    
    blurScreen(24, 1)
    expandTween:Play()
    expandTween.Completed:Wait() -- รอให้การ tween เสร็จสิ้น

    wait(Time) -- รอ 2 วินาทีก่อนทำการย่อ

    -- Tween ย่อลง
    local shrinkTween = TweenService:Create(guide, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 0, 0, 0) -- ขนาดสุดท้ายที่ย่อ
    })
    
    shrinkTween:Play()
    shrinkTween.Completed:Wait()

    guide:Destroy()
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

local FPSz = game:GetService("CoreGui"):FindFirstChild("FPScap")

function ffalse()
if FPSz and FPSz.Enable == true then
    FPSz.Enable = false
end
end

function ftrue()
if FPSz and FPSz.Enable == false then
    FPSz.Enable = true
    end
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

LocalPlayer.Chatted:Connect(function(message)
    if message == "/Show" or message == "/show" then
        g("M2", "rbxassetid://123230083738383", 7)
        clearBlur(1)
    elseif message == "/fps(true)" then
        ftrue()
    elseif message == "/fps(false)" then
        ffalse()
    elseif message == "/Copy" or message == "/copy" then
        copy()
    elseif message == "/Antilag" or message == "/antilag" then
            
    end
end)

g("M3", "rbxassetid://91657751110478", 4)
g("M1", "rbxassetid://70726839693177", 4)
clearBlur(1)

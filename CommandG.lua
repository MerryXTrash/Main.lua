local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

-- สร้าง ScreenGui
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.Name = "Guide"

function g(id, Time)
local guide = Instance.new("ImageLabel")
guide.Parent = screenGui -- วาง ImageLabel ใน ScreenGui
guide.Size = UDim2.new(0, 0, 0, 0) -- ขนาดเริ่มต้นเล็ก
guide.Position = UDim2.new(0.5, 0, 0.5, 0) -- ตำแหน่งกลางหน้าจอ
guide.Image = id -- ตั้งค่า Image ID
guide.AnchorPoint = Vector2.new(0.5, 0.5) -- ให้ตำแหน่งอยู่ที่กลาง
guide.BackgroundTransparency = 1 -- ตั้งค่าความโปร่งใสของพื้นหลังเป็น 1

-- เพิ่ม UICorner เพื่อให้มุมโค้ง
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20) -- ตั้งค่ารัศมีของมุม
corner.Parent = guide -- เพิ่ม UICorner ลงใน ImageLabel

-- สร้างฟังก์ชันสำหรับการแสดงและทำลาย guide
    local expandTween = TweenService:Create(guide, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 400, 0, 200) -- ขนาดสุดท้าย
    })
    
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

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

LocalPlayer.Chatted:Connect(function(message)
    if message == "/Show" then
        g("123230083738383", 7)
    elseif message == "/fps(true)" then
        
    elseif message == "/fps(false)" then
        
    elseif message == "/copy" then
        copy()
    elseif message == "/antilag" then
            
    end
end)

g("70726839693177", 3)

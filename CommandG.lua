local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

-- สร้าง ScreenGui
local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

-- สร้าง ImageLabel
local guide = Instance.new("ImageLabel")
guide.Parent = screenGui -- วาง ImageLabel ใน ScreenGui
guide.Size = UDim2.new(0, 0, 0, 0) -- ขนาดเริ่มต้นเล็ก
guide.Position = UDim2.new(0.5, 0, 0.5, 0) -- ตำแหน่งกลางหน้าจอ
guide.Image = "rbxassetid://70726839693177" -- ตั้งค่า Image ID
guide.AnchorPoint = Vector2.new(0.5, 0.5) -- ให้ตำแหน่งอยู่ที่กลาง
guide.BackgroundTransparency = 1 -- ตั้งค่าความโปร่งใสของพื้นหลังเป็น 1

-- เพิ่ม UICorner เพื่อให้มุมโค้ง
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20) -- ตั้งค่ารัศมีของมุม
corner.Parent = guide -- เพิ่ม UICorner ลงใน ImageLabel

-- สร้างฟังก์ชันสำหรับการแสดงและทำลาย guide
local function showGuide()
    local expandTween = TweenService:Create(guide, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 400, 0, 200) -- ขนาดสุดท้าย
    })
    
    expandTween:Play()
    expandTween.Completed:Wait() -- รอให้การ tween เสร็จสิ้น

    wait(2) -- รอ 2 วินาทีก่อนทำการย่อ

    -- Tween ย่อลง
    local shrinkTween = TweenService:Create(guide, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 0, 0, 0) -- ขนาดสุดท้ายที่ย่อ
    })
    
    shrinkTween:Play()
    shrinkTween.Completed:Wait()

    guide:Destroy()
end

-- สร้าง ImageLabel
local guide1 = Instance.new("ImageLabel")
guide1.Parent = screenGui -- วาง ImageLabel ใน ScreenGui
guide1.Size = UDim2.new(0, 0, 0, 0) -- ขนาดเริ่มต้นเล็ก
guide1.Position = UDim2.new(0.5, 0, 0.5, 0) -- ตำแหน่งกลางหน้าจอ
guide1.Image = "rbxassetid://123230083738383" -- ตั้งค่า Image ID
guide1.AnchorPoint = Vector2.new(0.5, 0.5) -- ให้ตำแหน่งอยู่ที่กลาง
guide1.BackgroundTransparency = 1 -- ตั้งค่าความโปร่งใสของพื้นหลังเป็น 1

-- เพิ่ม UICorner เพื่อให้มุมโค้ง
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20) -- ตั้งค่ารัศมีของมุม
corner.Parent = guide1 -- เพิ่ม UICorner ลงใน ImageLabel

-- สร้างฟังก์ชันสำหรับการแสดงและทำลาย guide
local function showGuide1()
    -- Tween ขยายจากขนาดเล็กไปขนาดปกติ
    local expandTween = TweenService:Create(guide1, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 400, 0, 200) -- ขนาดสุดท้าย
    })
    
    expandTween:Play()
    expandTween.Completed:Wait() -- รอให้การ tween เสร็จสิ้น

    wait(7) -- รอ 2 วินาทีก่อนทำการย่อ

    -- Tween ย่อลง
    local shrinkTween = TweenService:Create(guide1, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.new(0, 0, 0, 0) -- ขนาดสุดท้ายที่ย่อ
    })
    
    shrinkTween:Play()
    shrinkTween.Completed:Wait() -- รอให้การ tween เสร็จสิ้น

    guide:Destroy() -- ทำลาย ImageLabel
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

LocalPlayer.Chatted:Connect(function(message)
    if message == "/Show" then
        showGuide1()
    elseif message == "/fps(true)" then
        
    elseif message == "/fps(false)" then
        
    elseif message == "/copy" then

    elseif message == "/antilag" then
            
    end
end)

showGuide()

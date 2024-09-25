-- สร้าง ScreenGui ก่อน
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")  -- ใส่ ScreenGui ใน PlayerGui

-- สร้าง Local Guide เป็น ImageLabel ภายใต้ ScreenGui
local guide = Instance.new("ImageLabel")
guide.Parent = screenGui
guide.Name = "LocalGuide"
guide.Size = UDim2.new(0, 0, 0, 0)  -- เริ่มต้นด้วยขนาดเล็กสุด
guide.Position = UDim2.new(0.5, -200, 0.5, -100)  -- ตำแหน่งกลางหน้าจอ  -- ตั้ง AnchorPoint ให้วัตถุอยู่ตรงกลาง
guide.BackgroundTransparency = 1  -- ลบพื้นหลังออก
guide.Image = "rbxassetid://123230083738383"  -- ใส่ไอดีของรูปภาพที่ต้องการ
guide.ImageTransparency = 0  -- กำหนดความโปร่งใสของรูปภาพ

-- เพิ่ม Corner ใส่ image เพื่อให้มุมมน
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 15)  -- ปรับค่า CornerRadius ตามต้องการ
corner.Parent = guide

-- ฟังก์ชันในการแสดง Tween
local function showGuide()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local goal = {Size = UDim2.new(0, 400, 0, 300), Position = UDim2.new(0.5, -200, 0.5, -100)}  -- ยืดขนาดขึ้นด้านบน

    local tween = game:GetService("TweenService"):Create(guide, tweenInfo, goal)
    tween:Play()
end

-- ฟังก์ชันในการปิดและทำลาย Tween
local function closeGuide()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
    local goal = {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, -200, 0.5, -100)}

    local tween = game:GetService("TweenService"):Create(guide, tweenInfo, goal)
    tween:Play()

    tween.Completed:Connect(function()
        guide:Destroy()  -- ทำลายหลังจาก Tween เสร็จสิ้น
    end)
end

-- สร้างปุ่ม TextButton สำหรับปิด ที่ไม่ทับกับรูปภาพ และอยู่ด้านล่างของหน้าจอ
local closeButton = Instance.new("TextButton")
closeButton.Parent = screenGui
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(0.5, -25, 1, -120)  -- ยืดขนาดปุ่มขึ้นไปด้านบน
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- เชื่อมต่อฟังก์ชันปิดกับปุ่ม
closeButton.MouseButton1Click:Connect(closeGuide)

-- เรียกฟังก์ชันแสดง
showGuide()

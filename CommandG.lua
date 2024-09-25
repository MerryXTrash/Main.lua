-- สร้าง ScreenGui ก่อน
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")  -- ใส่ ScreenGui ใน PlayerGui

-- สร้าง Local Guide เป็น ImageLabel ภายใต้ ScreenGui
local guide = Instance.new("ImageLabel")
guide.Parent = screenGui
guide.Name = "LocalGuide"
guide.Size = UDim2.new(0, 0, 0, 0)  -- เริ่มต้นด้วยขนาดเล็กสุด
guide.Position = UDim2.new(0.5, 0, 0.5, 0)  -- ตำแหน่งกลางหน้าจอ
guide.AnchorPoint = Vector2.new(0.5, 0.5)  -- ตั้ง AnchorPoint ให้วัตถุอยู่ตรงกลาง
guide.BackgroundTransparency = 1  -- ลบพื้นหลังออก
guide.Image = "rbxassetid://123230083738383"  -- ใส่ไอดีของรูปภาพที่ต้องการ
guide.ImageTransparency = 0  -- กำหนดความโปร่งใสของรูปภาพ

-- ฟังก์ชันในการแสดง Tween
local function showGuide()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local goal = {Size = UDim2.new(0, 400, 0, 200), Position = UDim2.new(0.5, 0, 0.5, 0)}  -- ขนาด 400x200 และอยู่ตรงกลาง

    local tween = game:GetService("TweenService"):Create(guide, tweenInfo, goal)
    tween:Play()
end

-- ฟังก์ชันในการปิดและทำลาย Tween
local function closeGuide()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
    local goal = {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}  -- ย่อขนาดกลับไปกลางหน้าจอ

    local tween = game:GetService("TweenService"):Create(guide, tweenInfo, goal)
    tween:Play()

    tween.Completed:Connect(function()
        guide:Destroy()  -- ทำลายหลังจาก Tween เสร็จสิ้น
    end)
end

-- สร้างปุ่ม TextButton สำหรับปิด ที่ไม่ทับกับรูปภาพ และอยู่ด้านล่างของหน้าจอ
local closeButton = Instance.new("TextButton")
closeButton.Parent = screenGui
closeButton.Size = UDim2.new(0, 50, 0, 50)  -- ขนาดปุ่ม
closeButton.Position = UDim2.new(0.5, -25, 1, -60)  -- อยู่ตรงกลางด้านล่างของหน้าจอ
closeButton.AnchorPoint = Vector2.new(0.5, 1)  -- ปุ่มจะอยู่ด้านล่างโดยไม่ทับกับรูป
closeButton.Text = "X"  -- เปลี่ยนข้อความเป็น "X"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- เชื่อมต่อฟังก์ชันปิดกับปุ่ม
closeButton.MouseButton1Click:Connect(closeGuide)

-- เรียกฟังก์ชันแสดง
showGuide()

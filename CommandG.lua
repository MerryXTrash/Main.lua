-- สร้าง ScreenGui ก่อน
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CommandG"
screenGui.Parent = game:GetService("CoreGui")  -- ใส่ ScreenGui ใน PlayerGui

-- สร้าง Local Guide เป็น ImageLabel ภายใต้ ScreenGui
local guide = Instance.new("ImageLabel")
guide.Parent = screenGui
guide.Name = "LocalGuide"
guide.Size = UDim2.new(0, 0, 0, 0)  -- เริ่มต้นด้วยขนาดเล็กสุด
guide.Position = UDim2.new(0.5, 0, 0.5, 0)  -- วางกลางหน้าจอ
guide.AnchorPoint = Vector2.new(0.5, 0.5)  -- จัดให้อยู่กลางจริง ๆ 
guide.BackgroundTransparency = 1  -- ลบพื้นหลังออก
guide.Image = "rbxassetid://ใส่ไอดีรูปที่นี่"  -- ใส่ไอดีของรูปภาพที่ต้องการ
guide.ImageTransparency = 0  -- กำหนดความโปร่งใสของรูปภาพ

-- ฟังก์ชันในการแสดง Tween
local function showGuide()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local goal = {Size = UDim2.new(0, 400, 0, 200), Position = UDim2.new(0.5, -200, 0.5, -100)}  -- ขนาดและตำแหน่งที่ต้องการ

    local tween = game:GetService("TweenService"):Create(guide, tweenInfo, goal)
    tween:Play()
end

-- ฟังก์ชันในการปิดและทำลาย Tween
local function closeGuide()
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
    local goal = {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}  -- ย่อขนาดและย้ายกลับไปกลางหน้าจอ

    local tween = game:GetService("TweenService"):Create(guide, tweenInfo, goal)
    tween:Play()

    tween.Completed:Connect(function()
        screenGui:Destroy()  -- ทำลายหลังจาก Tween เสร็จสิ้น
    end)
end

-- สร้างปุ่ม TextButton สำหรับปิด
local closeButton = Instance.new("TextButton")
closeButton.Parent = guide
closeButton.Size = UDim2.new(0, 100, 0, 50)
closeButton.Position = UDim2.new(0.5, -50, 1, -60)  -- วางด้านล่างของ ImageLabel
closeButton.Text = "Close"
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- เชื่อมต่อฟังก์ชันปิดกับปุ่ม
closeButton.MouseButton1Click:Connect(closeGuide)

-- เรียกฟังก์ชันแสดง
showGuide()

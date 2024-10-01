if not game:IsLoaded() then
    game.Loaded:Wait()
end
    
local function createFPSCounter()
    local player = game.Players.LocalPlayer
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "FPSnum"
    screenGui.Parent = game:GetService("CoreGui")

    local fpsLabel = Instance.new("TextLabel")
    fpsLabel.Size = UDim2.new(0, 150, 0, 30)
    fpsLabel.Position = UDim2.new(0, 0, 0, 0)  -- Move to the top-left corner
    fpsLabel.Text = "0"
    fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.TextScaled = false
    fpsLabel.Font = Enum.Font.SourceSansBold
    fpsLabel.TextSize = 24
    fpsLabel.TextStrokeTransparency = 0.5
    fpsLabel.Parent = screenGui

    local runService = game:GetService("RunService")
    local frameCount = 0
    local lastUpdate = tick()

    local function updateFPS()
        frameCount = frameCount + 1
        if tick() - lastUpdate >= 0.3 then
            local fps = frameCount / 0.3
            fpsLabel.Text = "" .. math.floor(fps)
            if fps <= 15 then
                fpsLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
            elseif fps <= 30 then
                fpsLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
            elseif fps <= 49 then
                fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            else
                fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
            end
            lastUpdate = tick()
            frameCount = 0
        end
    end

    runService.RenderStepped:Connect(updateFPS)
end

local des1 = game:GetService("CoreGui"):FindFirstChild("Main")
local des2 = game:GetService("CoreGui"):FindFirstChild("Toggle")

if des1 then
    des1:Destroy()
end

if des2 then
    des2:Destroy()
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


local TweenService = game:GetService("TweenService")

local function op()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MyImageGui"
    screenGui.Parent = game:GetService("CoreGui")

    local screenEdgePadding = 150

    -- Create a text label
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "MyTextLabel"
    textLabel.Size = UDim2.new(1, 0, 0, 20)
    textLabel.Position = UDim2.new(0, 0, 0.8, 0)
    textLabel.Text = "Tip : Blue is Normal - Purple is Extra(Solo Only)"
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextScaled = true
    textLabel.Parent = screenGui

    -- Create an image button function
    local function createImageButton(name, position, imageId)
        local imageButton = Instance.new("ImageButton")
        imageButton.Name = name
        imageButton.Size = UDim2.new(0, 100, 0, 100)
        imageButton.Position = position
        imageButton.Image = imageId
        imageButton.BackgroundTransparency = 1
        imageButton.AnchorPoint = Vector2.new(0.5, 0.5) -- Center anchor point

        -- Add corner and stroke
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0.2, 0)
        corner.Parent = imageButton

        local uiStroke = Instance.new("UIStroke")
        uiStroke.Color = Color3.fromRGB(128, 128, 128)
        uiStroke.Thickness = 4
        uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        uiStroke.Parent = imageButton

        imageButton.Parent = screenGui
        return imageButton
    end

    -- Tweening function for buttons
    local function tweenButton(imageButton)
        local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        local centerPosition = UDim2.new(0.5, 0, 0.5, 0)  -- Center position
        local targetSize = UDim2.new(0, 370, 0, 280) -- Target size

        -- Create tweens for positioning and sizing
        local tweenPosition = TweenService:Create(imageButton, tweenInfo, {Position = centerPosition})
        local tweenSize = TweenService:Create(imageButton, tweenInfo, {Size = targetSize})

        tweenPosition:Play()
        tweenSize:Play()

        -- Chain back to a smaller size and then destroy
        tweenSize.Completed:Wait()
        local smallerSize = UDim2.new(0, 0, 0, 0)
        local tweenSmaller = TweenService:Create(imageButton, tweenInfo, {Size = smallerSize})
        tweenSmaller:Play()

        tweenSmaller.Completed:Wait() -- Wait for completion
        imageButton:Destroy() -- Destroy the button after shrinking
    end

    -- Create buttons at centered positions
    local button1 = createImageButton("MyImageButton1", UDim2.new(0.3, 0, 0.4, 0), "rbxassetid://134204200422920")
    local button2 = createImageButton("MyImageButton2", UDim2.new(0.7, 0, 0.4, 0), "rbxassetid://134754092492795")

    -- Button 1 click event
    button1.MouseButton1Click:Connect(function()
        -- Destroy button 2 and text label
        button2:Destroy()
        textLabel:Destroy()

        -- Set the clicked button to be on top
        button1.ZIndex = 2  -- Set a higher ZIndex
        button2.ZIndex = 1  -- Reset the other button's ZIndex

        tweenButton(button1)
        local Uiz = game:GetService("CoreGui"):FindFirstChild("MyImageGui")
        if Uiz then
            Uiz:Destroy()
            clearBlur(1)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/NormalVersion.lua"))()
        end
    end)

    -- Button 2 click event
    button2.MouseButton1Click:Connect(function()
        -- Destroy button 1 and text label
        button1:Destroy()
        textLabel:Destroy()

        -- Set the clicked button to be on top
        button2.ZIndex = 2  -- Set a higher ZIndex
        button1.ZIndex = 1  -- Reset the other button's ZIndex

        tweenButton(button2)
        local Uiz = game:GetService("CoreGui"):FindFirstChild("MyImageGui")
        if Uiz then
            Uiz:Destroy()
            clearBlur(1)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/TheMimicNew/refs/heads/main/ExtraVersion.lua"))()
        end
    end)
end

createFPSCounter()
blurScreen(24, 1)
loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Main.lua/refs/heads/main/CommandG.lua"))()
op()

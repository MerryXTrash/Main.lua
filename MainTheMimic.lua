local TP = game.Players.LocalPlayer.Character
local TweenService = game:GetService("TweenService")
local id = game.PlaceId
local RunService = game:GetService("RunService")

local Workspace = game:GetService("Workspace")

function nofall()
   game.Workspace.Gravity = 0
end

function Unnofall()
   game.Workspace.Gravity = 150
end

local function fire()
    for _, descendant in ipairs(Workspace:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") then
            fireproximityprompt(descendant)
        end
    end
end

local currentTween

function StopTweenAll()
    if currentTween then
        currentTween:Cancel()
        NoClip = false
        currentTween = nil
    end
end

function Teleport(P)
    local distance = (P.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    local speed = distance >= 1 and 300 or 1
    pcall(function()
        currentTween = game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(distance / speed, Enum.EasingStyle.Linear),
            {CFrame = P}
        )
        currentTween:Play()
        NoClip = true
        wait(distance / speed)
        NoClip = false
    end)
end


local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")

-- Function to enable or disable player movement
local function Freeze(enable)
    if humanoid then
        if enable then
            humanoid.WalkSpeed = 0 -- Default WalkSpeed
        else
            humanoid.WalkSpeed = 16 -- Disable movement
        end
    end
end

--Freeze(true)  -- Enable movement
--Freeze(false) -- Disable movement

local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local newPlaceId = 7618863566
                        
        local function teleportToNewPlace()
        local success, errorMessage = pcall(function()
        TeleportService:Teleport(newPlaceId, LocalPlayer)
        end)
                        
        if not success then
        warn("Failed to teleport: " .. tostring(errorMessage))
    end
end

function PARTZ()
    local gameHearts = game:GetService("Workspace").GameHearts
     for _, v in pairs(gameHearts.Heart:GetChildren()) do
         if v:IsA("Part") then
             v.Rotation = Vector3.new(0, 0, 0)
             v.CanCollide = true
         end
     end
 end

function toHeart()
    local gameHearts = game:GetService("Workspace").GameHearts
     for _, v in pairs(gameHearts.Heart:GetChildren()) do
         if v:IsA("UnionOperation") then
             v.Rotation = Vector3.new(0, 0, 0)
             v.Size = Vector3.new(60, 60, 60)
             local targetPositionTeleport = v.CFrame * CFrame.new(0, 20, -3)
             Teleport(targetPositionTeleport)
         end
     end
 end

 function check()
    local gameHearts = game:GetService("Workspace").GameHearts
    local found = false
    for _, v in pairs(gameHearts:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChildOfClass("BoolValue") then
            found = true
            v:Destroy()
            break
        end
    end
    if not found then
        PARTZ()
        toHeart()
    end
end

local player = game:GetService("Players").LocalPlayer
local backpack = player.Backpack
local character = player.Character

function CheckKatana()
-- ตรวจสอบว่า Katana อยู่ใน Character แล้วหรือไม่
for i, v in pairs(character:GetChildren()) do
    if v.Name == "Katana" then
        return -- ถ้ามี Katana อยู่ในตัวละครแล้ว ให้หยุดการทำงานของสคริปต์
    end
end

-- ถ้า Katana ไม่อยู่ใน Character ให้ตรวจสอบใน Backpack และ equip
for i, v in pairs(backpack:GetChildren()) do
    if v.Name == "Katana" then
        v.Parent = character -- ย้าย Katana ไปที่ Character
        break -- หลังจากย้ายแล้ว หยุดการทำงานของ loop
    end
end
end

function Hitboxz()
    for _, v in pairs(game:GetService("Workspace").BossBattle:GetChildren()) do
        if v:IsA("Model") then
            local spiderHitbox = v:FindFirstChild("SpiderHitbox")
            if spiderHitbox then
              spiderHitbox.Rotation = Vector3.new(0, 0, 0)
              spiderHitbox.Size = Vector3.new(100, 30, 30)
              spiderHitbox.Transparency = 0.1
            end
        end
    end
end

function Saigomo()
    for _, v in pairs(game:GetService("Workspace").BossBattle:GetChildren()) do
        if v:IsA("Model") then
            local spiderHitbox = v:FindFirstChild("HumanoidRootPart")
            if spiderHitbox then
            local Part = Instance.new("Part")
            Part.Parent = game.Workspace
            Part.Anchored = true
            Part.Transparency = 1
            Part.CanCollide = true
            Part.Size = Vector3.new(30, 2, 30)
            Part.CFrame = spiderHitbox.CFrame * CFrame.new(0, 20, 0)
            local targetPositionTeleport = Part.CFrame * CFrame.new(0, 6, 0)
            Teleport(targetPositionTeleport)
            end
        end
    end
end

local Noclip = nil
local Clip = nil

function noclip()
    Clip = false
    local function Nocl()
        if Clip == false and game.Players.LocalPlayer.Character ~= nil then
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                    v.CanCollide = false
                end
            end
        end
        wait(0.21) -- basic optimization
    end
    Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
    if Noclip then Noclip:Disconnect() end
    Clip = true
end

local function Skip()
if id == 6296321810 or id == 6479231833 then
    TP.HumanoidRootPart.CFrame = CFrame.new(3507.028564453125, 43.13663864135742, -1541.9735107421875) -- b1c1p1
elseif id == 6301638949 or id == 6480994221 then
    TP.HumanoidRootPart.CFrame = CFrame.new(1272.7239990234375, 200.04153442382812, -2537.25) -- b1c1p2
elseif id == 6373539583 or id == 6485055338 then
    TP.HumanoidRootPart.CFrame = CFrame.new(64.74767303466797, 60.94379806518555, -1622.5250244140625) -- b1c2p1
elseif id == 6406571212 or id == 6485055836 then
    TP.HumanoidRootPart.CFrame = CFrame.new(232.6605987548828, 100.84130096435547, -595.3074951171875) -- b1c2p2
elseif id == 6425178683 or id == 6485056556 then
    TP.HumanoidRootPart.CFrame = CFrame.new(1055.5179443359375, 78.26939392089844, -351.45831298828125) -- b1c2p3
elseif id == 6472459099 or id == 6688734180 then
    TP.HumanoidRootPart.CFrame = CFrame.new(2416.63671875, -23.031118392944336, 2294.332275390625) -- b1c3p1
elseif id == 6682163754 or id == 6688734313 then
    TP.HumanoidRootPart.CFrame = CFrame.new(241.43087768554688, 33.24515914916992, 450.21502685546875) -- b1c3p2
elseif id == 6682164423 or id == 6688734395 then
    TP.HumanoidRootPart.CFrame = CFrame.new(-654.1986694335938, 648.9832153320312, -1012.5780029296875) -- b1c3p3
elseif id == 7068738088 or id == 7068951438 then
    TP.HumanoidRootPart.CFrame = CFrame.new(2528.98681640625, 8.164044380187988, -1184.1917724609375) -- twt1
elseif id == 7068951914 then
    TP.HumanoidRootPart.CFrame = CFrame.new(-444.71759033203125, 20.493558883666992, -1453.7325439453125) -- twt2
elseif id == 7068740106 or id == 7068952294 then
    TP.HumanoidRootPart.CFrame = CFrame.new(2690.99169921875, 9.297460556030273, 649.3221435546875) -- twt3
elseif id == 15996404472 or id == 15996407335 then
    TP.HumanoidRootPart.CFrame = CFrame.new(3507.028564453125, 43.13663864135742, -1541.9735107421875) -- b1c1p1
elseif id == 15996410294 or id == 15996411979 then
    TP.HumanoidRootPart.CFrame = CFrame.new(64.74767303466797, 60.94379806518555, -1622.5250244140625) -- b1c2p1
elseif id == 15996413469 then
    TP.HumanoidRootPart.CFrame = CFrame.new(1055.5179443359375, 78.26939392089844, -351.45831298828125) -- b1c2p3
elseif id == 15996414738 or id == 15996416081 then
    TP.HumanoidRootPart.CFrame = CFrame.new(2411.138916015625, -23.03112030029297, 2267.944580078125) -- b1c3p1
elseif id == 15996417416 then
    TP.HumanoidRootPart.CFrame = CFrame.new(431.4171142578125, 17.476003646850586, -846.1138916015625) -- b1c3p3
elseif id == 7265396387 or id == 7251865082 then
    TP.HumanoidRootPart.CFrame = CFrame.new(85.20524597167969, -51.00001525878906, -1415.0792236328125) -- b1c4p1
end
end

local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera

local function setCameraToLookDown()
    local cameraCFrame = camera.CFrame
    local newLookVector = Vector3.new(0, -1, 0)
    camera.CFrame = CFrame.new(cameraCFrame.Position, cameraCFrame.Position + newLookVector)
end

local function setHoldDurationForAllProximityPrompts()
    for i, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
    if v.ClassName == "ProximityPrompt" then
        v.HoldDuration = 0
    end
end
end

setHoldDurationForAllProximityPrompts()

function AutoOrbs()
    for _, v in pairs(workspace.GameAI.Souls:GetChildren()) do
        if v.Name == "Orb" then
            -- Move the player's character to the position of the orb, with an offset
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, 0)
        else
            -- Reset the player's position to a specified location if the item is not an orb
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(601.8018, 111.0565, 836.9151)
        end
    end
end

function Autobtfs()
    for _, v in pairs(workspace.Butterflies:GetChildren()) do
        if v:IsA("BasePart") then
            -- Move the player's character to the position of the BasePart, with an offset
            TP.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 0, 0)
        else
            -- Handle the case where the item is not a BasePart
            print("Item is not a BasePart")
        end
    end
end

-- เรียกใช้บริการ UserInputService และ VirtualUser
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")

-- ฟังก์ชันที่คลิกตรงกลางจอภาพ
function clickMiddleOfScreen()
    -- ดึงขนาดของหน้าจอ
    local screenSize = workspace.CurrentCamera.ViewportSize
    
    -- คำนวณตำแหน่งตรงกลางของหน้าจอ
    local centerX = screenSize.X / 2
    local centerY = screenSize.Y / 2

    -- จำลองการคลิกที่ตำแหน่งตรงกลางจอ
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(centerX, centerY))
end

function AutoArmors()
   Freeze(true)
   TP.HumanoidRootPart.CFrame = CFrame.new(706.4743041992188, 14.950273513793945, 1929.3958740234375)
   for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.Name == "Texture" or v.Name == "MeshPart" or v.Name == "TreeMeshTop" then
        v:Destroy()
    end
    end
   wait(1)
local Part = game.Workspace.Well:WaitForChild("Burner")

-- Create a new Part
local Float = Instance.new("Part")
Float.Parent = game.Workspace
Float.Anchored = true
Float.Size = Vector3.new(30, 2, 30)
Float.CFrame = Part.CFrame * CFrame.new(0, 14, 0)  -- Offset the position of Float
   wait(0.5)
   TP.HumanoidRootPart.CFrame = CFrame.new(860.1697998046875, 15.059876441955566, 2388.63427734375)
   fire()
   wait(0.5)
   TP.HumanoidRootPart.CFrame = CFrame.new(839.8504028320312, 18.34674072265625, 2241.216552734375)
   fire()
   wait(0.5)
   TP.HumanoidRootPart.CFrame = CFrame.new(668.060791015625, 18.767614364624023, 2099.3955078125)
   fire()
   wait(0.5)
   TP.HumanoidRootPart.CFrame = CFrame.new(625.1378173828125, 17.63252830505371, 2345.30078125)
   fire()
   wait(0.5)
   TP.HumanoidRootPart.CFrame = CFrame.new(759.3781127929688, 15.417532920837402, 2531.548583984375)
   fire()
   wait(0.5)
   TP.HumanoidRootPart.CFrame = CFrame.new(864.6249389648438, 23.993000030517578, 2550.099853515625)
   fire()
   wait(0.5)
   TP.HumanoidRootPart.CFrame = CFrame.new(860.1697998046875, 15.059876441955566, 2388.63427734375)
   fire()
   wait(1.5)
   TP.HumanoidRootPart.CFrame = CFrame.new(687.65673828125, 13.798624038696289, 2253.633544921875)
   wait(0.5)
   fire()
   fire()
   fire()
   fire()
   fire()
   fire()
   fire()
   fire()
   fire()
   Freeze(false)
end

_G.loopfirez = false

function startLoopfire()
    while _G.loopfirez do
        wait()
        fire()
    end
end

function stopLoopfire()
    _G.loopfirez = false
end

function Xmas1()
    if not Freeze then
        error("The Freeze() function is not available.")
    end

    if not TP or not TP.HumanoidRootPart then
        error("TP or TP.HumanoidRootPart is not available.")
    end

    Freeze(true)
    _G.loopfirez = true
    startLoopfire()
    
    TP.HumanoidRootPart.CFrame = CFrame.new(-84.6919174194336, 11.107906341552734, -111.78636169433594) -- safe
    wait(0.8)
    TP.HumanoidRootPart.CFrame = CFrame.new(-251.05911254882812, -11.551362991333008, -66.66143798828125) -- elf
    wait(0.8)
    TP.HumanoidRootPart.CFrame = CFrame.new(-134.54364013671875, 10.574685096740723, -209.96405029296875) -- item1
    wait(0.8)
    TP.HumanoidRootPart.CFrame = CFrame.new(-80.6532974243164, 10.087998390197754, -123.51919555664062) -- item2
    wait(0.8)
    TP.HumanoidRootPart.CFrame = CFrame.new(-106.8354263305664, -14.238286018371582, 0.9737195372581482) -- item3
    wait(0.8)
    TP.HumanoidRootPart.CFrame = CFrame.new(57.96989059448242, 33.27872085571289, -96.68522644042969) -- end
    wait(0.8)
    TP.HumanoidRootPart.CFrame = CFrame.new(-84.6919174194336, 11.107906341552734, -111.78636169433594) -- return to safe1
    wait(1.2)
    TP.HumanoidRootPart.CFrame = CFrame.new(-251.05911254882812, -11.551362991333008, -66.66143798828125) -- nextquest
    wait(0.8)
    TP.HumanoidRootPart.CFrame = CFrame.new(-84.6919174194336, 11.107906341552734, -111.78636169433594) -- return to safe2
    
    stopLoopfire()
    Freeze(false)
end

function Toy()
    local workspace = game:GetService("Workspace")
    local toys = workspace.Quests["2"].CollectToys:GetChildren()
    for _, v in pairs(toys) do
        if v.Name == "toy" then
            TP.HumanoidRootPart.CFrame = v.CFrame
            wait(0.1)
        end
    end
end
   
local folder = Instance.new("Folder")
folder.Name = "HighlightsFolder"
folder.Parent = game.Workspace

local highlightTemplate = Instance.new("Highlight")
highlightTemplate.Name = "HighlightTemplate"
highlightTemplate.Enabled = true
highlightTemplate.FillTransparency = 0.5
highlightTemplate.OutlineTransparency = 0
highlightTemplate.Parent = folder

local function applyHighlight(instance)
    local highlight = highlightTemplate:Clone()
    highlight.Name = instance.Name .. "Highlight"
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.8
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.Parent = instance
end

local function setupHighlightForMob(mob)
    local mobHighlight = highlightTemplate:Clone()
    mobHighlight.Name = "MobESP"
    mobHighlight.FillColor = Color3.fromRGB(255, 0, 0)
    mobHighlight.FillTransparency = 0.8
    mobHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    mobHighlight.Parent = mob
end

local function setupHighlightForPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local playerHighlight = highlightTemplate:Clone()
    playerHighlight.Name = "PlayerESP"
    playerHighlight.FillColor = Color3.fromRGB(0, 0, 255)
    playerHighlight.FillTransparency = 0.5
    playerHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    playerHighlight.Parent = character
end

local function ESP()
local gameAI1 = game:GetService("Workspace"):FindFirstChild("GameAI")
local gameAI2 = game:GetService("Workspace"):FindFirstChild("GameAI2")

if gameAI1 then
    for i, v in pairs(gameAI1:GetChildren()) do
        if v:IsA("BasePart") or v:IsA("Model") or v:IsA("Part") then
            setupHighlightForMob(v)
        end
    end
end

if gameAI2 then
    for i, v in pairs(gameAI2:GetChildren()) do
        if v:IsA("BasePart") or v:IsA("Model") or v:IsA("Part") then
            setupHighlightForMob(v)
        end
    end
end

local Sama1 = game.Workspace:WaitForChild("omukadeMAIN")
setupHighlightForMob(Sama1)
local Sama2 = game.Workspace.BossBattle:WaitForChild("Saigomo")
setupHighlightForMob(Sama2)
end

-- Function to execute code safely
local function safeExecute(callback)
    local success, errorMsg = pcall(callback)
    if not success then
        warn("Error occurred: " .. errorMsg)
    end
end


_G.AutoDestroyHearts = false
function DestroyHearts()
    nofall()
    noclip()
    Freeze(true)
    wait(0)
    check()
end

function UnDestroyHearts()
    _G.AutoDestroyHearts = false
end

_G.Ezclick = false

function EquipOrClick()
    CheckKatana()
    clickMiddleOfScreen()
end

function UnEquipOrClick()
    _G.Ezclick = false
end

function StopTween()
    StopTweenAll()
    Unkillsaigomo()
    UnDestroyHearts()
    Unnofall()
    clip()
    Freeze(false)
end

-- Load external libraries
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local Show = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Vscose/main/Toggle.lua"))()
-- Initialize variables

local Window = Fluent:CreateWindow({
    Title = (id == 6296321810 or id == 6479231833 or id == 6301638949 or id == 6480994221) and "Xces | The Mimic - Book 1 Chapter 1" or
            (id == 6373539583 or id == 6485055338 or id == 6406571212 or id == 6485055836 or id == 6425178683 or id == 6485056556) and "Xces | The Mimic - Book 1 Chapter 2" or
            (id == 6472459099 or id == 6688734180 or id == 6682163754 or id == 6688734313 or id == 6682164423 or id == 6688734395) and "Xces | The Mimic - Book 1 Chapter 3" or
            (id == 7068738088 or id == 7068951438 or id == 7068951914 or id == 7068740106 or id == 7068952294) and "Xsec | The Mimic - The Witch Trial" or
            (id == 7618863566) and "Xces | The Mimic - Jigoku" or
            (id == 15996404472 or id == 15996407335) and "Xces | The Mimic Classic - Chapter 1" or
            (id == 15996410294 or id == 15996411979 or id == 15996413469) and "Xces | The Mimic Classic - Chapter 2" or
            (id == 15996414738 or id == 15996416081 or id == 15996417416) and "Xces | The Mimic Classic - Chapter 3" or
            (id == 7265396387 or id == 7251865082 or id == 7265396805 or id == 7251866503 or id == 7265397072 or id == 7251867155) and "[BETA] Xces | The Mimic - Book 1 Chapter 4" or
            (id == 8311302084 or id == 8311299084) and "Xsec | The Mimic - Christmas Trial" or
            "Xces | The Mimic - Main",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(460, 300),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.One
})

-- Create tabs
local Tabs = {
    Log = Window:AddTab({ Title = "Update Log", Icon = "hash" }),
    General = Window:AddTab({ Title = "General", Icon = "align-left" }),
    ESP = Window:AddTab({ Title = "Visual", Icon = "eye" }),
    Misc = Window:AddTab({ Title = "Miscellaneous", Icon = "layout-grid" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- Notifications and Log tab
Fluent:Notify({
    Title = "JajaCutecute",
    Content = "Thank you for using my script <3",
    SubContent = "ขอบคุณที่ใช้สคริปต์น่ะค่ะ จุ๊บๆ <3",
    Duration = 1.2
})

Tabs.Log:AddParagraph({
    Title = "+ Add",
    Content = "Christmas Trial"
})

Tabs.Log:AddParagraph({
    Title = "+ Add",
    Content = "[ BETA ] Book 1 Chapter 4"
})

if id == 6296321810 or id == 6479231833 or id == 6301638949 or id == 6480994221 or 
id == 6373539583 or id == 6485055338 or id == 6406571212 or id == 6485055836 or 
id == 6425178683 or id == 6485056556 or id == 6472459099 or id == 6688734180 or 
id == 6682163754 or id == 6688734313 or id == 6682164423 or id == 6688734395 or 
id == 7068738088 or id == 7068951438 or id == 7068951914 or id == 7068740106 or 
id == 7068952294 or id == 15996404472 or id == 15996411979 or id == 15996410294 or 
id == 15996407335 or id == 15996417416 or id == 15996416081 or id == 15996414738 or 
id == 15996413469 or id == 7265396387 or id == 7251865082 then
    Tabs.General:AddButton({
        Title = "Skip",
        Description = "Continue",
        Callback = function()
            Window:Dialog({
                Title = "Skip",
                Content = "Do you want to skip this part?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Skip()
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Dialog cancelled.")
                        end
                    }
                }
            })
        end
    })
end

if id == 6243699076 and 7068737459 then
        Tabs.General:AddButton({
            Title = "Teleport to Jigoku",
            Description = "Teleport to Jigoku Event",
            Callback = function()
                Window:Dialog({
                    Title = "Teleport to Jigoku",
                    Content = "Do you want to Teleport to Jigoku?",
                    Buttons = {
                        {
                            Title = "Yes",
                            Callback = function()
                                teleportToNewPlace()
                            end
                        },
                        {
                            Title = "No",
                            Callback = function()
                                print("Fullbright not enabled.")
                            end
                        }
                    }
                })
            end
        })
end

Tabs.ESP:AddButton({
    Title = "Monster ESP",
    Description = "Show Monster ESP",
    Callback = function()
        Window:Dialog({
            Title = "Monster ESP",
            Content = "Do you want to enable Monster ESP?",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        ESP()
                    end
                },
                {
                    Title = "No",
                    Callback = function()
                        print("Monster ESP not enabled.")
                    end
                }
            }
        })
    end
})

Tabs.ESP:AddButton({
    Title = "Player ESP",
    Description = "Show Player ESP",
    Callback = function()
        Window:Dialog({
            Title = "Player ESP",
            Content = "Do you want to enable Player ESP?",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        safeExecute(function()
                            local Players = game.Players
                            for _, player in pairs(Players:GetPlayers()) do
                                setupHighlightForPlayer(player)
                            end
                            Players.PlayerAdded:Connect(function(player)
                                player.CharacterAdded:Connect(function(character)
                                    setupHighlightForPlayer(player)
                                end)
                            end)
                        end)
                    end
                },
                {
                    Title = "No",
                    Callback = function()
                        print("Player ESP not enabled.")
                    end
                }
            }
        })
    end
})

Tabs.General:AddButton({
    Title = "Stop All",
    Description = "Stop All Function",
    Callback = function()
        Window:Dialog({
            Title = "Stop Tween",
            Content = "Do you want to Stop Tween?",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        StopTween()
                    end
                },
                {
                    Title = "No",
                    Callback = function()
                    end
                }
            }
        })
    end
})

Tabs.Misc:AddButton({
    Title = "Fullbright",
    Description = "If you're scared of the dark",
    Callback = function()
        Window:Dialog({
            Title = "Fullbright",
            Content = "Do you want to enable Fullbright?",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        local Lighting = game.Lighting
                        Lighting.ClockTime = 12
                        Lighting.Brightness = 2
                        Lighting.FogEnd = 100000
                        Lighting.GlobalShadows = false
                        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
                    end
                },
                {
                    Title = "No",
                    Callback = function()
                        print("Fullbright not enabled.")
                    end
                }
            }
        })
    end
})

if id == 7618863566 then
    Tabs.General:AddButton({
        Title = "Enter Zone",
        Description = "Enter to Zone",
        Callback = function()
            Window:Dialog({
                Title = "Enter Zone",
                Content = "Do you want to Enter Zone?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            local player = game.Players.LocalPlayer
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(609.1366, 17.5699, 1087.6727)
                            wait(1)
                            player.Character.HumanoidRootPart.CFrame = CFrame.new(601.8018, 111.0565, 836.9151)
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Off")
                        end
                    }
                }
            })
        end
    })
end

if id == 7618863566 then
    Tabs.General:AddButton({
        Title = "Auto Orbs",
        Description = "Auto Collect Orbs",
        Callback = function()
            Window:Dialog({
                Title = "Auto Orbs",
                Content = "Do you want to Enable Auto Orbs?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            _G.autoOBS = true
                            while _G.autoOBS do wait()
                            wait(0)
                            fire()
                            AutoOrbs()
                            handleProximityPrompts()
                            end
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Off")
                        end
                    }
                }
            })
        end
    })
end

if id == 7265396805 or id == 7251866503 then
    Tabs.General:AddButton({
        Title = "Auto Butterfly",
        Description = "Auto Collect Butterfly",
        Callback = function()
            Window:Dialog({
                Title = "Auto Butterfly",
                Content = "Do you want to enable Auto Butterfly?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            -- Check for existence of TP and related functions
                            if TP and TP.HumanoidRootPart then
                                TP.HumanoidRootPart.CFrame = CFrame.new(1099.39794921875, 3.135153293609619, 75.5241928100586)
                                wait(1.5)
                                _G.buttlefly = true
                                while _G.buttlefly do
                                    wait(0)
                                    -- Ensure handleProximityPrompts(), Autobtfs(), and fire() are defined
                                    if handleProximityPrompts then handleProximityPrompts() end
                                    if Autobtfs then Autobtfs() end
                                    if fire then fire() end
                                end
                            else
                                print("TP or TP.HumanoidRootPart not found")
                            end
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Auto Butterfly is off")
                        end
                    }
                }
            })
        end
    })
end

if id == 7265397072 or id == 7251867155 then
        Tabs.General:AddButton({
        Title = "Auto Armors",
        Description = "Auto Collect and Burn Armors",
        Callback = function()
            Window:Dialog({
                Title = "Auto Armors",
                Content = "Do you want to Enable Auto Armors?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            AutoArmors()
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            print("Auto Butterfly is off")
                        end
                    }
                }
            })
        end
    })
end

if id == 7265397848 or id == 7251867574 then
local Toggle = Tabs.General:AddToggle("MyToggle", {Title = "Auto Click", Default = false })

local autoClickActive = false

Toggle:OnChanged(function()
    if Toggle.Value then
        _G.EzClick = true
        autoClickActive = true
        coroutine.wrap(function()
            while autoClickActive and _G.EzClick do
                EquipOrClick()
                wait(0.1)
            end
        end)()
    else
        autoClickActive = false
        UnEquipOrClick()
    end
end)

Toggle:SetValue(true)
   
    Tabs.General:AddButton({
        Title = "Auto Destroy Hearts",
        Description = "Auto Destroy All Hearts",
        Callback = function()
            Window:Dialog({
                Title = "Auto Destroy Hearts",
                Content = "Do you want to Enable Auto Destroy Hearts?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            _G.AutoDestroyHearts = true
                            while _G.AutoDestroyHearts do
                                wait(0)
                                DestroyHearts()
                            end
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                            _G.AutoDestroyHearts = false
                        end
                    }
                }
            })
        end
    })

    Tabs.General:AddButton({
        Title = "Auto Kill Saigomo",
        Description = "[ Warning ] Use After Saigomo Cutsene",
        Callback = function()
            Window:Dialog({
                Title = "Auto Kill Saigomo",
                Content = "Do you want to Enable Auto Kill Saigomo?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                           clip()
                           Unnofall()
                           Freeze(true)
                           Saigomo()
                           Hitboxz()
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                           print("Cancle")
                        end
                    }
                }
            })
        end
    })
end

if id == 8311302084 or id == 8311299084 then

    Tabs.General:AddButton({
        Title = "Auto Repair Sleigh",
        Description = "Auto Repair Sleigh for Next Quest",
        Callback = function()
            Window:Dialog({
                Title = "Auto Repair Sleigh",
                Content = "Do you want to Enable Auto Repair Sleigh?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            Xmas1()
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                           print("Auto Repair Sleigh operation cancelled")
                        end
                    }
                }
            })
        end
    })

    Tabs.General:AddButton({
        Title = "Auto Collect Toys",
        Description = "Auto Collect All Toys",
        Callback = function()
            Window:Dialog({
                Title = "Auto Collect Toys",
                Content = "Do you want to Enable Auto Collect Toys?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            _G.Xmas2 = true
                            while _G.Xmas2 do
                                wait()
                                Toy()
                                fire()
                            end
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                              print("Auto Collect Toys operation cancelled")
                        end
                    }
                }
            })
        end
    })

    Tabs.General:AddButton({
        Title = "Grab Key",
        Description = "Grab Key from Krampus",
        Callback = function()
            Window:Dialog({
                Title = "Auto Grab Key",
                Content = "Do you want to Enable Grab Key?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            clip()
                            Unnofall()
                            Freeze(true)
                            Saigomo()
                            Hitboxz()
                        end
                    },
                    {
                        Title = "No",
                        Callback = function()
                           print("Grab Key operation cancelled")
                        end
                    }
                }
            })
        end
    })

end

SaveManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    SaveManager:SetFolder("FluentScriptHub/specific-game")
    SaveManager:BuildConfigSection(Tabs.Settings)

    Window:SelectTab(2)

    Fluent:Notify({
        Title = "จ๊ะจ๊าเองจ้า",
        Content = "ใช้สคริปต์ระวังโดนแบนกันด้วยน้าา",
        Duration = 0
    })

    SaveManager:LoadAutoloadConfig()

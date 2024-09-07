local TP = game.Players.LocalPlayer.Character
local TweenService = game:GetService("TweenService")
local id = game.PlaceId
local RunService = game:GetService("RunService")

local function Tween(Position, Duration)
    local player = game.Players.LocalPlayer
    local character = player.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")
    
    if humanoidRootPart then
        if not syn then
            if not humanoidRootPart:FindFirstChild("BodyVelocity1") then
                if humanoid and humanoid.Sit then
                    humanoid.Sit = false
                end
                
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Name = "BodyVelocity1"
                bodyVelocity.Parent = humanoidRootPart
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
            end
        end
        
        for _, part in pairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        
        local tweenInfo = TweenInfo.new(
            Duration,
            Enum.EasingStyle.Linear,
            Enum.EasingDirection.Out
        )

        local goal = {
            CFrame = CFrame.new(Position)
        }

        local tween = TweenService:Create(humanoidRootPart, tweenInfo, goal)
        tween:Play()

        tween.Completed:Connect(function()
            if humanoidRootPart:FindFirstChild("BodyVelocity1") then
                humanoidRootPart.BodyVelocity1:Destroy()
            end
        end)
    end
end


--local targetPosition = Vector3.new(10, 5, -10)
--local duration = 3

--Tween(targetPosition, duration)

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

_G.Prompt = true
while _G.Prompt do wait()
wait(5)
setHoldDurationForAllProximityPrompts()
end

function AutoOrbs()
    for _, v in pairs(workspace.GameAI.Souls:GetChildren()) do
        if v.Name == "Orb" then
            -- Move the player's character to the position of the orb, with an offset
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame * CFrame.new(0, 7, 0)
        else
            -- Reset the player's position to a specified location if the item is not an orb
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(601.8018, 111.0565, 836.9151)
        end
    end
end

local function handleProximityPrompts()
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v:IsA("ProximityPrompt") then
            v:InputHoldBegin()
            v:InputHoldEnd()
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

-- Function to execute code safely
local function safeExecute(callback)
    local success, errorMsg = pcall(callback)
    if not success then
        warn("Error occurred: " .. errorMsg)
    end
end

-- Load external libraries
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local Show = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Vscose/main/Toggle.lua"))()
-- Initialize variables

local Window = Fluent:CreateWindow({
    Title = (id == 6296321810 or id == 6479231833 or id == 6301638949 or id == 6480994221) and "The Mimic | Book 1 Chapter 1" or
            (id == 6373539583 or id == 6485055338 or id == 6406571212 or id == 6485055836 or id == 6425178683 or id == 6485056556) and "The Mimic | Book 1 Chapter 2" or
            (id == 6472459099 or id == 6688734180 or id == 6682163754 or id == 6688734313 or id == 6682164423 or id == 6688734395) and "The Mimic | Book 1 Chapter 3" or
            (id == 7068738088 or id == 7068951438 or id == 7068951914 or id == 7068740106 or id == 7068952294) and "The Mimic | The Witch Trial" or
            (id == 7618863566) and "The Mimic | Jigoku" or
            (id == 15996404472 or id == 15996407335) and "The Mimic Classic | Chapter 1" or
            (id == 15996410294 or id == 15996411979 or id == 15996413469) and "The Mimic Classic | Chapter 2" or
            (id == 15996414738 or id == 15996416081 or id == 15996417416) and "The Mimic Classic | Chapter 3" or
            (id == 7265396387 or id == 7251865082) and "The Mimic | Book 1 Chapter 4" or
            "The Mimic",
    SubTitle = "by JajaEngkubb",
    TabWidth = 160,
    Size = UDim2.fromOffset(460, 300),
    Acrylic = true,
    Theme = "Amethyst",
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
    Duration = 5
})

Tabs.Log:AddParagraph({
    Title = "+ Add",
    Content = "Jigoku Event"
})

Tabs.Log:AddParagraph({
    Title = "+ Add",
    Content = "Visual"
})

if id == 6296321810 or id == 6479231833 or id == 6301638949 or id == 6480994221 then
    Tabs.General:AddParagraph({
        Title = "Book 1",
        Content = "Chapter 1"
    })
elseif id == 6373539583 or id == 6485055338 or id == 6406571212 or id == 6485055836 or id == 6425178683 or id == 6485056556 then
    Tabs.General:AddParagraph({
        Title = "Book 1",
        Content = "Chapter 2"
    })
elseif id == 6472459099 or id == 6688734180 or id == 6682163754 or id == 6688734313 or id == 6682164423 or id == 6688734395 then
    Tabs.General:AddParagraph({
        Title = "Book 1",
        Content = "Chapter 3"
    })
elseif id == 7068738088 or id == 7068951438 or id == 7068951914 or id == 7068740106 or id == 7068952294 then
    Tabs.General:AddParagraph({
        Title = "Gamemode",
        Content = "The Witch Trial"
    })
elseif id == 7618863566 then
    Tabs.General:AddParagraph({
        Title = "Event",
        Content = "Jigoku"
    })
elseif id == 15996404472 or id == 15996407335 then
    Tabs.General:AddParagraph({
        Title = "Event",
        Content = "The Mimic Classic Chapter 1"
    })
elseif id == 15996410294 or id == 15996411979 or id == 15996413469 then
    Tabs.General:AddParagraph({
        Title = "Event",
        Content = "The Mimic Classic Chapter 2"
    })
elseif id == 15996414738 or id == 15996416081 or id == 15996417416 then
    Tabs.General:AddParagraph({
        Title = "Event",
        Content = "The Mimic Classic Chapter 3"
    })
elseif id == 7265396387 or id == 7251865082 then
    Tabs.General:AddParagraph({
        Title = "Book 1",
        Content = "Chapter 4"
    })
elseif id == 6243699076 and 7068737459 then
    Tabs.General:AddParagraph({
        Title = "The Mimic",
        Content = "Main"
    })
end


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
                        local M = game.Workspace.GameAI
                        local Hiachi = M.AI
                        local Rokurokubi = M.AI
                        local Kusonoki = M.Kusonoki
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

SaveManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    SaveManager:SetFolder("FluentScriptHub/specific-game")
    SaveManager:BuildConfigSection(Tabs.Settings)

    Window:SelectTab(2)

    Fluent:Notify({
        Title = "จ๊ะจ๊าเองจ้า",
        Content = "ใช้สคริปต์ระวังโดนแบนกันด้วยน้าา",
        Duration = 5
    })

    SaveManager:LoadAutoloadConfig()

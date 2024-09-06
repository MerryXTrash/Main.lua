local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local Show = loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/Vscose/main/Toggle.lua"))()

local TP = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local TweenService = game:GetService("TweenService")
local id = game.PlaceId

local folder = Instance.new("Folder")
folder.Name = "HighlightsFolder"
folder.Parent = game.Workspace

local highlightTemplate = Instance.new("Highlight")
highlightTemplate.Name = "HighlightTemplate"
highlightTemplate.Enabled = true
highlightTemplate.FillTransparency = 0.5
highlightTemplate.OutlineTransparency = 0
highlightTemplate.Parent = folder

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

local Window = Fluent:CreateWindow({
    Title = (id == 6296321810 or id == 6479231833 or id == 6301638949 or id == 6480994221) and "The Mimic | Book 1 Chapter 1" or
            (id == 6373539583 or id == 6485055338 or id == 6406571212 or id == 6485055836 or id == 6425178683 or id == 6485056556) and "The Mimic | Book 1 Chapter 2" or
            (id == 6472459099 or id == 6688734180 or id == 6682163754 or id == 6688734313 or id == 6682164423 or id == 6688734395) and "The Mimic | Book 1 Chapter 3" or
            (id == 7068738088 or id == 7068951438 or id == 7068951914 or id == 7068740106 or id == 7068952294) and "The Mimic | The Witch Trial" or
            (id == 7618863566) and "The Mimic | Jigoku" or
            (id == 15996404472 or id == 15996407335) and "The Mimic Classic | Chapter 1" or
            (id == 15996410294 or id == 15996411979 or id == 15996413469) and "The Mimic Classic | Chapter 2" or
            (id == 15996414738 or id == 15996416081 or id == 15996417416) and "The Mimic Classic | Book 1 Chapter 3" or
            "The Mimic",
    SubTitle = "by JajaEngkubb",
    TabWidth = 160,
    Size = UDim2.fromOffset(460, 300),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.One
})

local Tabs = {
    Log = Window:AddTab({ Title = "Update Log", Icon = "hash" }),
    General = Window:AddTab({ Title = "General", Icon = "align-left" }),
    ESP = Window:AddTab({ Title = "Visual", Icon = "eye" }),
    Misc = Window:AddTab({ Title = "Miscellaneous", Icon = "layout-grid" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

local function safeExecute(callback)
    local success, errorMsg = pcall(callback)
    if not success then
        warn("Error occurred: " .. errorMsg)
    end
end

do
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
        Content = "Visual (Work Only Book2)"
    })

    Tabs.General:AddParagraph({
        Title = "Book 1",
        Content = "Chapter 1"
    })

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
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1272.7239990234375, 200.04153442382812, -2537.25)
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

    SaveManager:SetLibrary(Fluent)
    SaveManager:IgnoreThemeSettings()
    SaveManager:SetIgnoreIndexes({})
    SaveManager:SetFolder("FluentScriptHub/specific-game")
    SaveManager:BuildConfigSection(Tabs.Settings)

    Window:SelectTab(1)

    Fluent:Notify({
        Title = "จ๊ะจ๊าเองจ้า",
        Content = "ใช้สคริปต์ระวังโดนแบนกันด้วยน้าา",
        Duration = 5
    })

    SaveManager:LoadAutoloadConfig()
end

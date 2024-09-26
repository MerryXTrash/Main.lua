local id = game.PlaceId

if id == 7265397848 or id == 7251867574 then
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local Workspace = game:GetService("Workspace")

    local BossBattle = Workspace:FindFirstChild("BossBattle")
    if BossBattle then
        local Saigomo = BossBattle:FindFirstChild("Saigomo")
        if Saigomo then
            local HumanoidRootPartz = Saigomo:FindFirstChild("HumanoidRootPart")
            if HumanoidRootPartz then
                local Sound = HumanoidRootPartz:FindFirstChild("roar")

                -- Function to destroy all "WebTrap" instances
                local function web()
                    for _, v in pairs(Workspace:GetChildren()) do
                        if v.Name == "WebTrap" then
                            v:Destroy()  -- Destroy the WebTrap
                        end
                    end
                end
                
                local currentTween
                local isTeleporting = false
                
                -- Function to stop any ongoing tween
                local function StopTweenAll()
                    if currentTween then
                        currentTween:Cancel()
                        currentTween = nil
                    end
                end

                -- Function to teleport to a position with tween
                local function Teleport(P)
                    local player = Players.LocalPlayer
                    if player.Character then
                        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
                        
                        if humanoidRootPart then
                            local distance = (P.Position - humanoidRootPart.Position).Magnitude
                            local speed = distance >= 1 and 300 or 1
                            pcall(function()
                                StopTweenAll()  -- Stop any current tween before starting a new one
                                currentTween = TweenService:Create(
                                    humanoidRootPart,
                                    TweenInfo.new(distance / speed, Enum.EasingStyle.Linear),
                                    {CFrame = P}
                                )
                                currentTween:Play()
                                wait(distance / speed)
                            end)
                        end
                    end
                end

                -- Function to check player health and teleport to a butterfly if needed
                local function checkAndTeleport()
                    local player = Players.LocalPlayer
                    if player.Character then
                        local humanoid = player.Character:FindFirstChild("Humanoid")
                        if humanoid and humanoid.Health <= 75 then  -- Check if health is low
                            for _, part in pairs(Workspace.Butterflies:GetDescendants()) do
                                if part:IsA("MeshPart") and part.Transparency == 0 then  -- Check for visible MeshPart
                                    StopTweenAll()
                                    player.Character.HumanoidRootPart.CFrame = part.CFrame
                                    break
                                end
                            end
                        end
                    end
                end

                -- Function to check the sound status and teleport accordingly
                local function checkSoundAndTeleport()
                    local player = Players.LocalPlayer
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local offset = CFrame.new(33, 0, 0)
                        local targetPositionTeleport = HumanoidRootPartz.CFrame * offset

                        if Sound and Sound.IsPlaying then
                            isTeleporting = true
                            StopTweenAll()
                            player.Character.HumanoidRootPart.CFrame = HumanoidRootPartz.CFrame
                        elseif Sound and not Sound.IsPlaying and isTeleporting then
                            player.Character.HumanoidRootPart.CFrame = HumanoidRootPartz.CFrame * offset
                            isTeleporting = false
                            Teleport(targetPositionTeleport)
                        end
                    end
                end

                -- Main loop to continuously check conditions
                _G.Auto2 = true
                while _G.Auto2 do
                    checkSoundAndTeleport()
                    checkAndTeleport()
                    web()
                    wait(0.1)  -- Slightly increase wait time to avoid overwhelming the game engine
                end
            end
        end
    end
end

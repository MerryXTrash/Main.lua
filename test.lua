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

                -- Remove all WebTrap objects
                for _, v in pairs(Workspace:GetChildren()) do
                    if v.Name == "WebTrap" then
                        v:Destroy()  -- Correctly destroy the WebTrap
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

                -- Function to teleport to a position
                local function Teleport(P)
                    local player = Players.LocalPlayer
                    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                    
                    if humanoidRootPart then
                        local distance = (P.Position - humanoidRootPart.Position).Magnitude
                        local speed = distance >= 1 and 300 or 1
                        pcall(function()
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

                local function checkAndTeleport()
                    local player = Players.LocalPlayer
                    local humanoid = player.Character and player.Character:FindFirstChild("Humanoid")
                    
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

                -- Function to check the sound status and teleport accordingly
                local function checkSoundAndTeleport()
                    local MOB = HumanoidRootPartz
                    local offset = Vector3.new(33, 0, 0)
                    local targetPositionTeleport = MOB.CFrame * CFrame.new(offset)

                    if Sound.IsPlaying then
                        isTeleporting = true
                        StopTweenAll()
                        Players.LocalPlayer.Character.HumanoidRootPart.CFrame = HumanoidRootPartz.CFrame
                    elseif not Sound.IsPlaying and isTeleporting then
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = HumanoidRootPartz.CFrame * CFrame.new(33, 0, 0)
                        isTeleporting = false
                        Teleport(targetPositionTeleport)
                    end
                end

                -- Run the checkAndTeleport and checkSoundAndTeleport functions in a loop
                _G.Auto2 = true
                while _G.Auto2 do
                    checkSoundAndTeleport()
                    checkAndTeleport()
                    wait(0)
                end
            end
        end
    end
end

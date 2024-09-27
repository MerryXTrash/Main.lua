local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer

local currentTween
_G.Sai = false

local function StopTweenAll()
    if currentTween then
        currentTween:Cancel()
    end
end

local function Teleport(targetPosition)
    if player.Character then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if humanoidRootPart then
            local distance = (targetPosition.Position - humanoidRootPart.Position).Magnitude
            local speed = distance >= 1 and 300 or 1
            StopTweenAll()
            currentTween = TweenService:Create(
                humanoidRootPart,
                TweenInfo.new(distance / speed, Enum.EasingStyle.Linear),
                {CFrame = targetPosition}
            )
            currentTween:Play()
            wait(distance / speed)
        end
    end
end

local function PerformActions()
    if not _G.Sai then return end
    
    for _, tap in ipairs(workspace:GetDescendants()) do
        if tap.Name == "WebTrab" then
            for _, part in ipairs(tap:GetChildren()) do
                if part:IsA("MeshPart") or part:IsA("Part") then
                    part.CanCollide = false
                    part.CanTouch = false
                end
            end
        end
    end

    for _, v in pairs(game:GetService("Workspace").BossBattle:GetChildren()) do
        if v:IsA("Model") then
            local humanoidRootPart = v:FindFirstChild("HumanoidRootPart")
            local roar = v:FindFirstChild("roar")

            if roar and roar:IsA("Sound") then
                if roar.IsPlaying then
                    StopTweenAll()
                    wait(0.2)
                    player.Character.HumanoidRootPart.CFrame = roar.Parent.CFrame
                else
                    if humanoidRootPart then
                        local targetPosition = humanoidRootPart.CFrame * CFrame.new(30, 0, 0)
                        Teleport(targetPosition)
                    end
                end
            end

            if player.Character.Humanoid.Health >= 75 then
                for _, re in ipairs(workspace.butterflies:GetDescendants()) do
                    if re:IsA("MeshPart") and re.Transparency == 0 then
                        StopTweenAll()
                        player.Character.HumanoidRootPart.CFrame = re.CFrame
                        fire()
                    end
                end
            end
        end
    end
end

if _G.Sai then
    PerformActions()
end

_G.Sai = true

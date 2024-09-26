local Players = game.Players.LocalPlayer
local isTeleporting = false
local currentTween

-- Stop all Tweens
local function StopTweenAll()
    if currentTween then
        currentTween:Cancel()
        NoClip = false
        currentTween = nil
    end
end

-- Teleport function
local function Teleport(P)
    local distance = (P.Position - Players.Character.HumanoidRootPart.Position).Magnitude
    local speed = distance >= 1 and 300 or 1
    pcall(function()
        currentTween = game:GetService("TweenService"):Create(
            Players.Character.HumanoidRootPart,
            TweenInfo.new(distance / speed, Enum.EasingStyle.Linear),
            {CFrame = P}
        )
        currentTween:Play()
        NoClip = true
        currentTween.Completed:Wait() -- Wait for completion
        NoClip = false
    end)
end

-- Teleport all players to Boss
local function teleportPlayersToBoss(CFramePosition)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFramePosition
        end
    end
end

-- Main function to check sound and teleport
local function checkSoundAndTeleport()
    local BossBattle = game:GetService("Workspace"):FindFirstChild("BossBattle")
    if BossBattle then
        local Saigomo = BossBattle:FindFirstChild("Saigomo")
        if Saigomo then
            local HumanoidRootPart = Saigomo:FindFirstChild("HumanoidRootPart")
            local Sound = HumanoidRootPart and HumanoidRootPart:FindFirstChild("roar")
            local MOB = HumanoidRootPart

            if MOB and Sound then
                local offset = Vector3.new(33, 0, 0)
                local targetPositionTeleport = MOB.CFrame * CFrame.new(offset)

                if Sound.IsPlaying and not isTeleporting then
                    isTeleporting = true
                    Freeze(true)
                    StopTweenAll()
                    teleportPlayersToBoss(MOB.CFrame)
                elseif not Sound.IsPlaying and isTeleporting then
                    isTeleporting = false
                    teleportPlayersToBoss(MOB.CFrame * CFrame.new(33, 0, 0))
                    Teleport(targetPositionTeleport)
                end
            end
        end
    end
end

_G.st = true
while _G.st do 
wait()
checkSoundAndTeleport()
end

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

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local function Teleport(P)
    local player = Players.LocalPlayer
    if player.Character then
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart then
            local distance = (P.Position - humanoidRootPart.Position).Magnitude
            local speed = distance >= 1 and 300 or 1
            
            pcall(function()
                noclip()
                
                local currentTween = TweenService:Create(
                    humanoidRootPart,
                    TweenInfo.new(distance / speed, Enum.EasingStyle.Linear),
                    {CFrame = P.CFrame}
                )

                currentTween:Play()
                currentTween.Completed:Wait()
                clip()
            end)
        end
    end
end

local targetPosition = CFrame.new(10, 5, 10)
Teleport(targetPosition)

local icons = {
    skip = "rbxassetid://79038346329753",
    home = "rbxassetid://133613215741054",
    discord = "rbxassetid://126271107561700",
    circus = "rbxassetid://104997858184294",
    control = "rbxassetid://90555831916567",
    jelousy = "rbxassetid://104221894691860",
    classic = "rbxassetid://130838633275293",
    jigoku = "rbxassetid://77433089329441",
    twt = "rbxassetid://77862734718204",
    halloween = "rbxassetid://80672854478576",
    xmas = "rbxassetid://92889810632390",
    setting = "rbxassetid://93980626741512",
    visual = "rbxassetid://127654928705257",
    butterfly = "rbxassetid://136647226583796",
    armor = "rbxassetid://77536494874217",
    heart = "rbxassetid://106174042646581",
    city = "rbxassetid://138337860897539",
    book = "rbxassetid://120492650036987",
    rat = "rbxassetid://90638151031209",
    nagisa = "rbxassetid://139594112747975",
    town = "rbxassetid://122206914121113",
    picture = "rbxassetid://116071198205647",
    candle = "rbxassetid://87665575601109",
    ship = "rbxassetid://126114158412949",
    candle12345 = "rbxassetid://103691622726449",
    sea = "rbxassetid://119791624131256",
    cow = "rbxassetid://80559215432493",
    meat = "rbxassetid://140363178495071",
    skull = "rbxassetid://121988360964140",
    lever = "rbxassetid://114749792758381",
    cook = "rbxassetid://111144954590601",
    run = "rbxassetid://81057527274586",
    curse = "rbxassetid://84093924271385",
    tower = "rbxassetid://87317317173411",
    kid = "rbxassetid://116806426916397",
    note = "rbxassetid://114762848241346",
    mezu = "rbxassetid://78340265109296",
    torch = "rbxassetid://113335549060774",
    puzzle = "rbxassetid://112798812841371",
    boat = "rbxassetid://83061453290004",
    dad = "rbxassetid://80508165247811",
    train = "rbxassetid://87987329351272",
    larve = "rbxassetid://91110594624023",
    mud = "rbxassetid://101980536250174",
    tree = "rbxassetid://78279302198719",
    pumpkin = "rbxassetid://75277530889783",
    toy = "rbxassetid://129725092479761",
    sleing = "rbxassetid://79435923333967",
    key = "rbxassetid://86752945329344",
    helpfriends = "rbxassetid://106898999468334",
    box = "rbxassetid://84397131528427",
    card = "rbxassetid://78548387815144",
    ringmasterhat = "rbxassetid://130947881197627",
    quest = "rbxassetid://97213053447234",
    orb = "rbxassetid://81808294923292",
    boss = "rbxassetid://117068825773483",
    misc = "rbxassetid://126463033320653",
    display = "rbxassetid://133017312121186",
    bookmark = "rbxassetid://109302457739317",
    teleport = "rbxassetid://70572099255504",
    lantern = "rbxassetid://80399932430028",
    owner = "rbxassetid://85243016038794",
    bypass = "rbxassetid://73725962179866",
    Warning = "rbxassetid://138989383837411",
    messeng = "rbxassetid://81861848107088"
}

local world = game:GetService("Workspace")
local Rservice = game:GetService('RunService')
local id = game.PlaceId
local TweenService = game:GetService("TweenService")
local coreui = game:GetService("CoreGui")
local speaker = game:GetService("Players").LocalPlayer
local character = speaker.Character
local worldtable = {}
local originalHoldDurations = {}

for _, descendant in ipairs(world:GetDescendants()) do
    table.insert(worldtable, descendant)
end


function fire()
    for _, descendant in ipairs(world:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") then
            fireproximityprompt(descendant)
        end
    end
end
function EnableInstantPrompt()
    for _, descendant in ipairs(world:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") then
            if originalHoldDurations[descendant] == nil then
                originalHoldDurations[descendant] = descendant.HoldDuration
            end
            descendant.HoldDuration = 0
        end
    end
end
function DisableInstantPrompt()
    for _, descendant in ipairs(world:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") and originalHoldDurations[descendant] ~= nil then
            descendant.HoldDuration = originalHoldDurations[descendant]
            originalHoldDurations[descendant] = nil
        end
    end
end

function to(position)
    pcall(function()
        speaker.Character.HumanoidRootPart.CFrame = position
    end)
end

if not _G.FullBrightExecuted then

	_G.FullBrightEnabled = false

	_G.NormalLightingSettings = {
		Brightness = game:GetService("Lighting").Brightness,
		ClockTime = game:GetService("Lighting").ClockTime,
		FogEnd = game:GetService("Lighting").FogEnd,
		GlobalShadows = game:GetService("Lighting").GlobalShadows,
		Ambient = game:GetService("Lighting").Ambient
	}

	game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
		if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
			_G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Brightness = 1
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
		if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
			_G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").ClockTime = 12
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
		if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
			_G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").FogEnd = 786543
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
		if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
			_G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").GlobalShadows = false
		end
	end)

	game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
		if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
			_G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
			if not _G.FullBrightEnabled then
				repeat
					wait()
				until _G.FullBrightEnabled
			end
			game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
		end
	end)

	game:GetService("Lighting").Brightness = 1
	game:GetService("Lighting").ClockTime = 12
	game:GetService("Lighting").FogEnd = 786543
	game:GetService("Lighting").GlobalShadows = false
	game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)

	local LatestValue = true
	spawn(function()
		repeat
			wait()
		until _G.FullBrightEnabled
		while wait() do
			if _G.FullBrightEnabled ~= LatestValue then
				if not _G.FullBrightEnabled then
					game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
					game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
					game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
					game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
					game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
				else
					game:GetService("Lighting").Brightness = 1
					game:GetService("Lighting").ClockTime = 12
					game:GetService("Lighting").FogEnd = 786543
					game:GetService("Lighting").GlobalShadows = false
					game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
				end
				LatestValue = not LatestValue
			end
		end
	end)
end

 Noclip = nil
 Clip = nil
 function noclip()
     Clip = false
     function Nocl()
         if Clip == false and game.Players.LocalPlayer.Character ~= nil then
             for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                 if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
                     v.CanCollide = false
                 end
             end
         end
         task.wait(0.21) -- basic optimization
     end
     Noclip = Rservice.Stepped:Connect(Nocl)
 end
 
function clip()
     if Noclip then Noclip:Disconnect() end
     Clip = true
end

function InsertPart(Name, position, Size)
    part = Instance.new("Part")
    part.Name = Name
    part.Parent = world
    part.Anchored = true
    part.CanCollide = true
    part.Transparency = 1
    part.Size = Size
    cframe = CFrame.new(position) * CFrame.new(0, -2, 0)
    part.CFrame = cframe
end

function countdown(time)
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "CountdownGui"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    textLabel = Instance.new("TextLabel")
    textLabel.Name = "CountdownLabel"
    textLabel.Size = UDim2.new(0.3, 0, 0.15, 0)
    textLabel.Position = UDim2.new(0.35, 0, 0.4, 0)
    textLabel.TextSize = 200
    textLabel.TextStrokeTransparency = 0
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextScaled = false
    textLabel.Parent = screenGui

    countdownTime = time

    function formatTime(seconds)
        return tostring(seconds)
    end

    function getTextColor(seconds)
        if seconds > 7 then
            return Color3.fromRGB(255, 0, 0)
        elseif seconds > 3 then
            return Color3.fromRGB(255, 255, 0)
        else
            return Color3.fromRGB(56, 182, 255)
        end
    end

    textLabel.Text = formatTime(countdownTime)
    textLabel.TextColor3 = getTextColor(countdownTime)
    task.wait(1)
    
    while countdownTime > 1 do
        countdownTime = countdownTime - 1
        textLabel.Text = formatTime(countdownTime)
        textLabel.TextColor3 = getTextColor(countdownTime)
        task.wait(1)
    end
    textLabel.Text = "0"
    textLabel.TextColor3 = Color3.fromRGB(56, 182, 255)
    task.wait(1)
    textLabel:Destroy()
end

local function createFPSDisplay()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = coreui
	screenGui.Name = "FPSDISPLAY"
    screenGui.IgnoreGuiInset = true

    local fpsLabel = Instance.new("TextLabel")
    fpsLabel.Parent = screenGui
    fpsLabel.Size = UDim2.new(0, 200, 0, 50)
    fpsLabel.Position = UDim2.new(0.5, -100, 0, -10)
    fpsLabel.BackgroundTransparency = 1
    fpsLabel.TextSize = 18
    fpsLabel.Font = Enum.Font.SourceSansBold
    fpsLabel.Text = "FPS: 0"
    fpsLabel.TextStrokeTransparency = 0
    fpsLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    while true do
        local fps = math.floor(1 / Rservice.RenderStepped:Wait())
        fpsLabel.Text = "FPS: " .. tostring(fps)

        if fps <= 15 then
            fpsLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        elseif fps <= 30 then
            fpsLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
        elseif fps <= 49 then
            fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
        else
            fpsLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        end

        wait(0.3)  -- Adjusted wait time for better performance
    end
end

function UNFPS()
    pcall(function()
        for _, v in ipairs(game:GetService("CoreGui"):GetDescendants()) do
            if v.Name == "FPSDISPLAY" then
                v:Destroy()
				break
            end
        end
    end)
end


local Toggle = Instance.new("ScreenGui")
Toggle.Name = "ButtonGUI"
Toggle.Parent = coreui
Toggle.ZIndexBehavior = Enum.ZIndexBehavior.Global

--fly
speeds = 1
local chr = speaker.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
nowe = false
local Frames = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local UIStroke = Instance.new("UIStroke")
local logo = Instance.new("ImageButton")
local DropShadow = Instance.new("ImageLabel")
Frames.Name = 'fly'
Frames.Visible = false
Frames.Active = false
Frames.Draggable = false
Frames.Parent = Toggle
Frames.AnchorPoint = Vector2.new(0.5, 0.5)
Frames.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frames.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frames.BorderSizePixel = 0
Frames.Position = UDim2.new(0.75000006, 0, 0.194968551, 0)
Frames.Size = UDim2.new(0.170000003, 0, 0.170000003, 0)
Frames.SizeConstraint = Enum.SizeConstraint.RelativeYY
Frames.ZIndex = 67
UICorner.Parent = Frames
UIStroke.Color = Color3.fromRGB(121, 121, 121)
UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke.Parent = Frames
logo.Name = "logo"
logo.Parent = Frames
logo.AnchorPoint = Vector2.new(0.5, 0.5)
logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo.BackgroundTransparency = 1.010
logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
logo.BorderSizePixel = 0
logo.Position = UDim2.new(0.5, 0, 0.5, 0)
logo.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
logo.ZIndex = 68
logo.Image = "rbxassetid://91353551114562"
DropShadow.Name = "DropShadow"
DropShadow.Parent = Frames
DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow.BackgroundTransparency = 1.000
DropShadow.BorderSizePixel = 0
DropShadow.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow.Size = UDim2.new(1, 47, 1, 47)
DropShadow.ZIndex = 66
DropShadow.Image = "rbxassetid://6015897843"
DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow.ImageTransparency = 0.500
DropShadow.ScaleType = Enum.ScaleType.Slice
DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)
local originalSize = Frames.Size
local shrinkedSize = UDim2.new(originalSize.X.Scale * 0.9, 0, originalSize.Y.Scale * 0.9, 0)
Frames.MouseEnter:Connect(function()
    Frames:TweenSize(shrinkedSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)
Frames.MouseLeave:Connect(function()
    Frames:TweenSize(originalSize, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)
function toggle()
    if logo.Image == "rbxassetid://91353551114562" then
        logo.Image = "rbxassetid://71300758038210"
    else
        logo.Image = "rbxassetid://91353551114562"
    end
end
logo.MouseButton1Click:Connect(toggle)
logo.MouseButton1Click:connect(function()
    if nowe == true then
		nowe = false
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
	else 
		nowe = true
		for i = 1, speeds do
			spawn(function()

				local hb = game:GetService("RunService").Heartbeat	


				tpwalking = true
				local chr = game.Players.LocalPlayer.Character
				local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
				while tpwalking and hb:Wait() and chr and hum and hum.Parent do
					if hum.MoveDirection.Magnitude > 0 then
						chr:TranslateBy(hum.MoveDirection)
					end
				end

			end)
		end
		game.Players.LocalPlayer.Character.Animate.Disabled = true
		local Char = game.Players.LocalPlayer.Character
		local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

		for i,v in next, Hum:GetPlayingAnimationTracks() do
			v:AdjustSpeed(0)
		end
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
		speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
		speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
	end




    if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then
        local plr = game.Players.LocalPlayer
        local torso = plr.Character.Torso
        local flying = true
        local deb = true
        local ctrl = { f = 0, b = 0, l = 0, r = 0 }
        local lastctrl = { f = 0, b = 0, l = 0, r = 0 }
        local maxspeed = 50
        local speed = 0


        local bg = Instance.new("BodyGyro", torso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = torso.CFrame
        local bv = Instance.new("BodyVelocity", torso)
        bv.velocity = Vector3.new(0, 0.1, 0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            plr.Character.Humanoid.PlatformStand = true
        end
        while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
            game:GetService("RunService").RenderStepped:Wait()

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed + .5 + (speed / maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed - 1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                    speed
                lastctrl = { f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r }
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                    speed
            else
                bv.velocity = Vector3.new(0, 0, 0)
            end
            --    game.Players.LocalPlayer.Character.Animate.Disabled = true
            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame *
                CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
        end
        ctrl = { f = 0, b = 0, l = 0, r = 0 }
        lastctrl = { f = 0, b = 0, l = 0, r = 0 }
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    else
        local plr = game.Players.LocalPlayer
        local UpperTorso = plr.Character.UpperTorso
        local flying = true
        local deb = true
        local ctrl = { f = 0, b = 0, l = 0, r = 0 }
        local lastctrl = { f = 0, b = 0, l = 0, r = 0 }
        local maxspeed = 50
        local speed = 0


        local bg = Instance.new("BodyGyro", UpperTorso)
        bg.P = 9e4
        bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.cframe = UpperTorso.CFrame
        local bv = Instance.new("BodyVelocity", UpperTorso)
        bv.velocity = Vector3.new(0, 0.1, 0)
        bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
        if nowe == true then
            plr.Character.Humanoid.PlatformStand = true
        end
        while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do
            wait()

            if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
                speed = speed + .5 + (speed / maxspeed)
                if speed > maxspeed then
                    speed = maxspeed
                end
            elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then
                speed = speed - 1
                if speed < 0 then
                    speed = 0
                end
            end
            if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f + ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l + ctrl.r, (ctrl.f + ctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                    speed
                lastctrl = { f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r }
            elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then
                bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f + lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l + lastctrl.r, (lastctrl.f + lastctrl.b) * .2, 0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p)) *
                    speed
            else
                bv.velocity = Vector3.new(0, 0, 0)
            end

            bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame *
                CFrame.Angles(-math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed), 0, 0)
        end
        ctrl = { f = 0, b = 0, l = 0, r = 0 }
        lastctrl = { f = 0, b = 0, l = 0, r = 0 }
        speed = 0
        bg:Destroy()
        bv:Destroy()
        plr.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
        tpwalking = false
    end
end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)
	wait(0.7)
	game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
	game.Players.LocalPlayer.Character.Animate.Disabled = false
end)

function Anchored()
    pcall(function()
        if character then
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("BasePart") and v.Anchored == false then
                    v.Anchored = true
                end
            end
        end
    end)
end

function Unanchored()
    pcall(function()
        if character then
            for _, v in pairs(character:GetChildren()) do
                if v:IsA("BasePart") and v.Anchored == true then
                    v.Anchored = false
                end
            end
        end
    end)
end

function overay()
Bf = Instance.new("ScreenGui")
Bf.IgnoreGuiInset = true
UltimateBF = Instance.new("Frame")
UltimateBF.Size = UDim2.new(1, 0, 1, 0)
UltimateBF.BackgroundColor3 = Color3.new(0, 0, 0)
UltimateBF.BackgroundTransparency = 1
UltimateBF.Parent = bf
Bf.Parent = coreui
local tweenInfo = TweenInfo.new(1.5, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local goal = {BackgroundTransparency = 0}
local tween = TweenService:Create(UltimateBF, tweenInfo, goal)
tween:Play()
tween.Completed:Wait()
end

function tplace(id)
	overay()
    local teleportService = game:GetService("TeleportService")
    local Tl = id
    teleportService:Teleport(Tl, game.Players.LocalPlayer)
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

function setupHighlightForMob(mob)
    local mobHighlight = highlightTemplate:Clone()
    mobHighlight.Name = "MobESP"
    mobHighlight.FillColor = Color3.fromRGB(255, 0, 0)
    mobHighlight.FillTransparency = 0.8
    mobHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    mobHighlight.Parent = mob
end

function setupHighlightForPlayer(player)
    local character = player.Character or player.CharacterAdded:Wait()
    local playerHighlight = highlightTemplate:Clone()
    playerHighlight.Name = "PlayerESP"
    playerHighlight.FillColor = Color3.fromRGB(0, 0, 255)
    playerHighlight.FillTransparency = 0.5
    playerHighlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    playerHighlight.Parent = character
end

function ESPPlayers()
local Players = game.Players
for _, player in pairs(Players:GetPlayers()) do
    setupHighlightForPlayer(player)
end
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        setupHighlightForPlayer(player)
    end)
end)
end

function UnEspMob()
    for i, v in ipairs(worldtable:GetDescendants()) do
    if v.ClassName == "Highlight" then
        v:Destroy()
    end
end
end

function ESP()
	pcall(function()
	gameAI1 = worldtable:FindFirstChild("GameAI")
	gameAI2 = worldtable:FindFirstChild("GameAI2")

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

for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
		if v.Name == "AI" then
			setupHighlightForMob(v)
		end
	end
Sama1 = worldtable.omukadeMAIN
setupHighlightForMob(Sama1)
Sama2 = worldtable.Saigomo
setupHighlightForMob(Sama2)

for _, model in ipairs(worldtable:GetDescendants()) do
    if model:IsA("Model") then
        for _, model1 in ipairs(model:GetDescendants()) do
            if model1:IsA("MeshPart") then
                local textureID = model1.TextureID
                if textureID == "rbxassetid://8210027978" or 
                   textureID == "rbxassetid://8028359449" or 
                   textureID == "rbxassetid://8985801399" or 
                   textureID == "rbxassetid://9036476435" or 
                   textureID == "rbxassetid://8208335769" or 
                   textureID == "rbxassetid://9104396416" then
                    setupHighlightForMob(model)
                end
            end
        end
    end
end
Clown = worldtable.Clown
setupHighlightForMob(Clown)
ring = worldtable.Yurei
setupHighlightForMob(ring)
AI1 = worldtable.SamaAI
AI2 = worldtable.CrawlAI
setupHighlightForMob(AI1)
setupHighlightForMob(AI2)
end)
end

--speed
local Frames2 = Instance.new("Frame")
local UICorner2 = Instance.new("UICorner")
local UIStroke2 = Instance.new("UIStroke")
local logo2 = Instance.new("ImageButton")
local DropShadow2 = Instance.new("ImageLabel")
Frames2.Name = 'speed'
Frames2.Parent = Toggle
Frames2.Visible = false
Frames2.Active = false
Frames2.Draggable = false
Frames2.AnchorPoint = Vector2.new(0.5, 0.5)
Frames2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frames2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frames2.BorderSizePixel = 0
Frames2.Position = UDim2.new(0.886243403, 0, 0.45176208, 0)
Frames2.Size = UDim2.new(0.170000003, 0, 0.170000003, 0)
Frames2.SizeConstraint = Enum.SizeConstraint.RelativeYY
Frames2.ZIndex = 67
UICorner2.Parent = Frames2
UIStroke2.Color = Color3.fromRGB(121, 121, 121)
UIStroke2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke2.Parent = Frames2
logo2.Name = "logo"
logo2.Parent = Frames2
logo2.AnchorPoint = Vector2.new(0.5, 0.5)
logo2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo2.BackgroundTransparency = 1.010
logo2.BorderColor3 = Color3.fromRGB(0, 0, 0)
logo2.BorderSizePixel = 0
logo2.Position = UDim2.new(0.5, 0, 0.5, 0)
logo2.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
logo2.ZIndex = 68
logo2.Image = "rbxassetid://128371873753154"
DropShadow2.Name = "DropShadow"
DropShadow2.Parent = Frames2
DropShadow2.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow2.BackgroundTransparency = 1.000
DropShadow2.BorderSizePixel = 0
DropShadow2.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow2.Size = UDim2.new(1, 47, 1, 47)
DropShadow2.ZIndex = 66
DropShadow2.Image = "rbxassetid://6015897843"
DropShadow2.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow2.ImageTransparency = 0.500
DropShadow2.ScaleType = Enum.ScaleType.Slice
DropShadow2.SliceCenter = Rect.new(49, 49, 450, 450)
local originalSize2 = Frames2.Size
local shrinkedSize2 = UDim2.new(originalSize2.X.Scale * 0.9, 0, originalSize2.Y.Scale * 0.9, 0)
Frames2.MouseEnter:Connect(function()
    Frames2:TweenSize(shrinkedSize2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)
Frames2.MouseLeave:Connect(function()
    Frames2:TweenSize(originalSize2, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)
function toggle2()
    if logo2.Image == "rbxassetid://128371873753154" then
        logo2.Image = "rbxassetid://135671852485954"
    else
        logo2.Image = "rbxassetid://91353551114562"
    end
end
logo2.MouseButton1Click:Connect(toggle2)


--fireprompt
local Frames3 = Instance.new("Frame")
local UICorner3 = Instance.new("UICorner")
local UIStroke3 = Instance.new("UIStroke")
local logo3 = Instance.new("ImageButton")
local DropShadow3 = Instance.new("ImageLabel")
Frames3.Name = 'fireprompt'
Frames3.Parent = Toggle
Frames3.Visible = false
Frames3.Active = false
Frames3.Draggable = false
Frames3.AnchorPoint = Vector2.new(0.5, 0.5)
Frames3.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frames3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frames3.BorderSizePixel = 0
Frames3.Position = UDim2.new(0.75000006, 0, 0.45176208, 0)
Frames3.Size = UDim2.new(0.170000003, 0, 0.170000003, 0)
Frames3.SizeConstraint = Enum.SizeConstraint.RelativeYY
Frames3.ZIndex = 67
UICorner3.Parent = Frames3
UIStroke3.Color = Color3.fromRGB(121, 121, 121)
UIStroke3.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
UIStroke3.Parent = Frames3
logo3.Name = "logo"
logo3.Parent = Frames3
logo3.AnchorPoint = Vector2.new(0.5, 0.5)
logo3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo3.BackgroundTransparency = 1.010
logo3.BorderColor3 = Color3.fromRGB(0, 0, 0)
logo3.BorderSizePixel = 0
logo3.Position = UDim2.new(0.5, 0, 0.5, 0)
logo3.Size = UDim2.new(0.899999976, 0, 0.899999976, 0)
logo3.ZIndex = 68
logo3.Image = "rbxassetid://79038346329753"
DropShadow3.Name = "DropShadow"
DropShadow3.Parent = Frames3
DropShadow3.AnchorPoint = Vector2.new(0.5, 0.5)
DropShadow3.BackgroundTransparency = 1.000
DropShadow3.BorderSizePixel = 0
DropShadow3.Position = UDim2.new(0.5, 0, 0.5, 0)
DropShadow3.Size = UDim2.new(1, 47, 1, 47)
DropShadow3.ZIndex = 66
DropShadow3.Image = "rbxassetid://6015897843"
DropShadow3.ImageColor3 = Color3.fromRGB(0, 0, 0)
DropShadow3.ImageTransparency = 0.500
DropShadow3.ScaleType = Enum.ScaleType.Slice
DropShadow3.SliceCenter = Rect.new(49, 49, 450, 450)
local originalSize3 = Frames3.Size
local shrinkedSize3 = UDim2.new(originalSize3.X.Scale * 0.9, 0, originalSize3.Y.Scale * 0.9, 0)
Frames3.MouseEnter:Connect(function()
    Frames3:TweenSize(shrinkedSize3, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)
Frames3.MouseLeave:Connect(function()
    Frames3:TweenSize(originalSize3, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true)
end)
logo3.MouseButton1Click:Connect(function()

end)



Flytoggle = Frames
Speedtoggle = Frames2
Promptoggle = Frames3
function Onfly()
    if Flytoggle then
        if Flytoggle.Visible == false then
            Flytoggle.Visible = true
        elseif Flytoggle.Visible == true then
            Flytoggle.Visible = false
        end
    end
end
function OnSpeed()
    if Speedtoggle then
        if Speedtoggle.Visible == false then
            Speedtoggle.Visible = true
        elseif Speedtoggle.Visible == true then
            Speedtoggle.Visible = false
        end
    end
end
function OnPrompt()
    if Promptoggle then
        if Promptoggle.Visible == false then
            Promptoggle.Visible = true
        elseif Promptoggle.Visible == true then
            Promptoggle.Visible = false
        end
    end
end




local NothingLibrary = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/Imgonna-Top/Overflow4.0/refs/heads/main/UI'))();
local Notification = NothingLibrary.Notification();

function _SendNotify(Title, Des, Time, ImageID)
    Notification.new({
        Title = Title,
        Description = Des,
        Duration = Time,
        Icon = ImageID
    })
end

Windows = NothingLibrary.new({Title = "Overflow - The Mimic", Description = "Ultimate 5.0", Keybind = Enum.KeyCode.LeftControl, Logo = 'rbxassetid://115642679590790'})

--Tab
_General_TAB = Windows:NewTab({Title = "General", Description = "Info Script", Icon = icons.home })
_Setting_TAB = Windows:NewTab({ Title = "Setting", Description = "Functions", Icon = icons.setting })
_Teleport_TAB = Windows:NewTab({ Title = "Teleport", Description = "Quick Automatic Lanterns", Icon = icons.teleport })
_B1C1_TAB = Windows:NewTab({ Title = "Control's 1", Description = "Functions", Icon = icons.control })
_B1C2_TAB = Windows:NewTab({ Title = "Control's 2", Description = "Functions", Icon = icons.control })
_B1C3_TAB = Windows:NewTab({ Title = "Control's 3", Description = "Functions", Icon = icons.control })
_B1C4_TAB = Windows:NewTab({ Title = "Control's 4", Description = "Functions", Icon = icons.control })
_B2C1_TAB = Windows:NewTab({ Title = "Jelousy's 1", Description = "Functions", Icon = icons.jelousy })
_B2C2_TAB = Windows:NewTab({ Title = "Jelousy's 2", Description = "Functions", Icon = icons.jelousy })
_B2C3_TAB = Windows:NewTab({ Title = "Jelousy's 3", Description = "Functions", Icon = icons.jelousy })
_TWT_TAB = Windows:NewTab({ Title = "The Witch Trial", Description = "Functions", Icon = icons.twt })
_NCC_TAB = Windows:NewTab({ Title = "Chirstmas Trial", Description = "Functions", Icon = icons.xmas })
_HW_TAB = Windows:NewTab({ Title = "Halloween Trial", Description = "Functions", Icon = icons.halloween })
_XMAS_TAB = Windows:NewTab({ Title = "Nightmare Circus", Description = "Functions", Icon = icons.circus })
_DC_TAB = Windows:NewTab({ Title = "Death's Challeng", Description = "Functions", Icon = icons.jigoku })
_CS_TAB = Windows:NewTab({ Title = "Classic", Description = "Functions", Icon = icons.classic })


--General
Status = _General_TAB:NewSection({ Title = "Status", Icon = "rbxassetid://7733964719", Position = "Left" })
LNStatus = _General_TAB:NewSection({ Title = "Lantern Status", Icon = "rbxassetid://7733964719", Position = "Left" })
Status:NewTitle('Bypass : 🟢')
LNStatus:NewTitle("Obtained : 🟢")
LNStatus:NewTitle("Not Obtained : 🔴")
LNStatus:NewTitle("Limited : 🟣")
LNStatus:NewTitle("Gamepass : 🟡")
LNStatus:NewTitle("___________________________")
LNStatus:NewTitle("Control's Book")
LNStatus:NewTitle("The Butterfly's Spirit : 🟢")
LNStatus:NewTitle("The Corrupted : 🟢")
LNStatus:NewTitle("The Kusonoki : 🟢")
LNStatus:NewTitle("The Saigomo : 🟢")
LNStatus:NewTitle("___________________________")
LNStatus:NewTitle("Jelousy's Book")
LNStatus:NewTitle("The Kyogi : 🟢")
LNStatus:NewTitle("The Mio : 🟢")
LNStatus:NewTitle("The Chochin Obake : 🟢")
LNStatus:NewTitle("The Ponpon : 🟢")
LNStatus:NewTitle("The Nagisa : 🟢")
LNStatus:NewTitle("The Zuboshi : 🟢")
LNStatus:NewTitle("The Michiko : 🟢")
LNStatus:NewTitle("The Negibishoma : 🟢")
LNStatus:NewTitle("The Mochi : 🟢")
LNStatus:NewTitle("The Gozu & Mezu : 🟢")
LNStatus:NewTitle("___________________________")
LNStatus:NewTitle("Gamemode")
LNStatus:NewTitle("The Duality : 🟢")
LNStatus:NewTitle("The Kabocha : 🟢")
LNStatus:NewTitle("The Pumpkin : 🟢")
LNStatus:NewTitle("The Lampus : 🔴")
LNStatus:NewTitle("The Ballon's Jack : 🔴")
LNStatus:NewTitle("The Magic's Bunny : 🟣")
LNStatus:NewTitle("___________________________")
LNStatus:NewTitle("Event")
LNStatus:NewTitle("The Shinigami : 🟢")
LNStatus:NewTitle("The Hiachi 2021 : 🟣")
LNStatus:NewTitle("The Hiachi 2023 : 🟣")
LNStatus:NewTitle("The Chenoo : 🟣")
LNStatus:NewTitle("The Fujin : 🔴")
LNStatus:NewTitle("The Raijin : 🔴")
LNStatus:NewTitle("The Classic Hiachi : 🟢")
LNStatus:NewTitle("The Sinister's Bunny : 🟣")
LNStatus:NewTitle("The Samarai : 🟣")
LNStatus:NewTitle("___________________________")
LNStatus:NewTitle("Gamepass")
LNStatus:NewTitle("The Three Eyed Monster : 🟣")
LNStatus:NewTitle("The X2 : 🟡")
LNStatus:NewTitle("The VIP : 🟡")
LNStatus:NewTitle("The Yurie : 🟡")
LNStatus:NewTitle("The Greedful Angel : 🟣")
Overflow = _General_TAB:NewSection({Title = "Section", Icon = "rbxassetid://7733964719", Position = "Right"})
Catsus = _General_TAB:NewSection({Title = "Credit UI", Icon = "rbxassetid://7733964719", Position = "Right"})
Catsus:NewTitle('UI by 4lpaca("CATSUS")')
Catsus:NewButton({Title = "Discord Neuron X", Callback = function()
    setclipboard('discord.gg/BH6pE7jesa')
end})
Overflow:NewTitle('Join Overflow Discord')
Overflow:NewButton({Title = "Discord Overflow", Callback = function()
    setclipboard("https://discord.gg/e33VShsv6f")
end})

--Setting
Setting_main = _Setting_TAB:NewSection({ Title = "Setting", Icon = "rbxassetid://7733964719", Position = "Left" })
Setting_misc = _Setting_TAB:NewSection({ Title = "Miscellaneous", Icon = "rbxassetid://7733964719", Position = "Left" })
Setting_Esp = _Setting_TAB:NewSection({ Title = "Visual", Icon = "rbxassetid://7733964719", Position = "Right" })
Setting_display = _Setting_TAB:NewSection({ Title = "Display", Icon = "rbxassetid://7733964719", Position = "Right" })
Setting_Esp:NewTitle("If ESP Don't Work, Just On and Off Again.")
Setting_Esp:NewToggle({Title = "Monsters", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_Esp:NewToggle({Title = "Players", Default = false, Callback = function(tr) 
    print(tr) 
end})
--mainSetting
Setting_main:NewToggle({Title = "Fullbright", Default = true, Callback = function(tr) 
    if tr then
        _G.FullBrightExecuted = true
        _G.FullBrightEnabled = not _G.FullBrightEnabled
    else
        _G.FullBrightExecuted = false
		_G.FullBrightEnabled = not _G.FullBrightEnabled
    end
end})
Setting_main:NewToggle({Title = "Noclip", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_main:NewToggle({Title = "No Cooldown Prompt", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_display:NewToggle({Title = "View FPS", Default = false, Callback = function(tr) 
    if tr then
        createFPSDisplay()
    else
        UNFPS()
    end
end})
Setting_display:NewButton({Title = "Reduce CPU", Callback = function()
    pcall(function()
        for _, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("BasePart") and v.Material ~= Enum.Material.Plastic and v.Reflection > 0 then
                v.Material = Enum.Material.Plastic
                v.Reflection = 0
            end
        end
    end)
end})
Setting_misc:NewToggle({Title = "Customize Button", Default = false, Callback = function(tr) 
    if tr then
        Frames.Active = true
        Frames.Draggable = true
        Frames2.Active = true
        Frames2.Draggable = true
        Frames3.Active = true
        Frames3.Draggable = true
    else
        Frames.Active = false
        Frames.Draggable = false
        Frames2.Active = false
        Frames2.Draggable = false
        Frames3.Active = false
        Frames3.Draggable = false
    end
end})
Setting_misc:NewTitle("On = Start Setting")
Setting_misc:NewTitle("Off = Save Setting")
Setting_misc:NewToggle({Title = "Button Fly", Default = false, Callback = function(tr) 
    Onfly()
end})
Setting_misc:NewToggle({Title = "Button Speed", Default = false, Callback = function(tr) 
    OnSpeed()
end})
Setting_misc:NewToggle({Title = "Button Fire Prompt", Default = false, Callback = function(tr) 
    OnPrompt()
end})
Setting_misc:NewToggle({Title = "Button to Safe", Default = false, Callback = function(tr) 
    OnSafe() 
end})
Setting_misc:NewSlider({Title = "Speed", Min = 25, Max = 175, Default = 25, Callback = function(a) 
    print(a) 
end})
Setting_misc:NewSlider({Title = "Fly Speed", Min = 1, Max = 10, Default = 2, Callback = function(a) 
    speeds = a
end})
--teleportTAB
Teleport_main = _Teleport_TAB:NewSection({ Title = "Main", Icon = icons.home, Position = "Left" })
Teleport_b1 = _Teleport_TAB:NewSection({ Title = "Control's Book", Icon = icons.control, Position = "Right" })
Teleport_event = _Teleport_TAB:NewSection({ Title = "Event", Icon = icons.bookmark, Position = "Left" })
Teleport_gamemode = _Teleport_TAB:NewSection({ Title = "Gamemode", Icon = icons.ringmasterhat, Position = "Left" })
Teleport_b2 = _Teleport_TAB:NewSection({ Title = "Jelousy's Book", Icon = icons.jelousy, Position = "Right" })

--tpbook1
Teleport_b1:NewButton({Title = "Teleport Final Chapter 1", Callback = function()
    
end})
Teleport_b1:NewButton({Title = "Teleport Final Chapter 2", Callback = function()
    
end})
Teleport_b1:NewButton({Title = "Teleport Final Chapter 3", Callback = function()
    
end})
Teleport_b1:NewButton({Title = "Teleport Final Chapter 4", Callback = function()
    
end})

--Main
Teleport_main:NewButton({Title = "The Mimic", Callback = function()
    
end})
Teleport_main:NewButton({Title = "Gamemode", Callback = function()
    
end})
Teleport_main:NewButton({Title = "The Mimic Classic", Callback = function()
    
end})

--b2
Teleport_b2:NewButton({Title = "Teleport to Chapter 1", Callback = function()
    
end})
Teleport_b2:NewButton({Title = "Teleport to Chapter 2", Callback = function()
    
end})
Teleport_b2:NewButton({Title = "Teleport to Chapter 3", Callback = function()
    
end})

--gamemode
Teleport_gamemode:NewButton({Title = "Teleport Final The Witch Trial", Callback = function()
    
end})
Teleport_gamemode:NewButton({Title = "Teleport Final Halloween Trial", Callback = function()
    
end})
Teleport_gamemode:NewButton({Title = "Teleport to Christmas Trial", Callback = function()
    
end})
Teleport_gamemode:NewButton({Title = "Teleport to Nightmare Circus", Callback = function()
    
end})

--Event
Teleport_event:NewButton({Title = "Teleport to Death's Challeng", Callback = function()
    
end})
Teleport_event:NewTitle('The Mimic Classic')
Teleport_event:NewButton({Title = "Teleport Final Chapter 1", Callback = function()
    
end})
Teleport_event:NewButton({Title = "Teleport Final Chapter 2", Callback = function()
    
end})
Teleport_event:NewButton({Title = "Teleport Final Chapter 3", Callback = function()
    
end})








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
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local worldtable = {}
local originalHoldDurations = {}

for _, descendant in ipairs(world:GetDescendants()) do
    table.insert(worldtable, descendant)
end

function fall()
    world.Gravity = 150
end
function nofall()
    world.Gravity = 1
end
function fire()
    for _, descendant in ipairs(world:GetDescendants()) do
        if descendant:IsA("ProximityPrompt") then
            fireproximityprompt(descendant)
        end
    end
end

function fireSeclect(namecall)
    for _, descendant in ipairs(world:GetDescendants()) do
        if descendant.Name == namecall then
            for _, prompt in ipairs(descendant:GetDescendants()) do
                if prompt:IsA("ProximityPrompt") then
                    fireproximityprompt(prompt)
                end
            end
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
    fpsLabel.Text = "FPS : 0"
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

function UnEspPlayers()
    for _, player in ipairs(game:GetService("Players"):GetPlayers()) do
        for _, v in ipairs(player.Character:GetDescendants()) do
            if v:IsA("Highlight") then
                v:Destroy()
            end
        end
    end
end


function UnEspMob()
    for i, v in ipairs(world:GetDescendants()) do
    if v.ClassName == "Highlight" then
        v:Destroy()
    end
end
end

function ESP()
    pcall(function()
        for _, iv in ipairs(workspace:GetDescendants()) do
            if iv:IsA("Folder") then
                for _, v in ipairs(iv:GetDescendants()) do
                    local humanoidRootPart = v:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        local meshPart = v:FindFirstChildOfClass("MeshPart")
                        if meshPart then
                            local accessory = v:FindFirstChildOfClass("Accessory")
                            if not accessory then
                                setupHighlightForMob(v)
                            end
                        end
                    end
                end
            elseif iv:IsA("Model") then
                local humanoidRootPart = iv:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local meshPart = iv:FindFirstChildOfClass("MeshPart")
                    if meshPart then
                        local accessory = iv:FindFirstChildOfClass("Accessory")
                        if not accessory then
                            setupHighlightForMob(iv)
                        end
                    end
                end
            end
        end
    end)
end

function clickMiddleOfScreen()
    local screenSize = world.CurrentCamera.ViewportSize
    local centerX = screenSize.X / 2
    local centerY = screenSize.Y / 2
    VirtualUser:CaptureController()
    VirtualUser:ClickButton1(Vector2.new(centerX, centerY))
end

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
    local function Anti()
        pcall(function()
            local _0, _1, _9, _88, TS, __2, __9S = 
                'ContentProvider', hookfunction, newcclosure, hookmetamethod, 
                getnamecallmethod, {"FireServer", 'Sender', 'Sender2'}, {3, 1, 2}

            if _1 then 
                _1(game:GetService(_0).PreloadAsync, _9(function(...) return '...' end)) 
            end

            if TS then 
                local _13
                _13 = _88(game, '__namecall', function(self, ...) 
                    local __s__ = {...}  
                    if TS() == __2[__9S[2]] and (tostring(self) == __2[__9S[1]] or tostring(self) == __2[__9S[3]]) then 
                        return wait(9e9)  
                    end
                    return _13(self, ...)  
                end) 
            end
        end)
    end
    Anti()
    task.wait(0.150)
    fire()
end)



Flytoggle = Frames
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
function OnPrompt()
    if Promptoggle then
        if Promptoggle.Visible == false then
            Promptoggle.Visible = true
        elseif Promptoggle.Visible == true then
            Promptoggle.Visible = false
        end
    end
end

function Equip(Select)
backpack = speaker.Backpack
character = speaker.Character
	for i, item in pairs(backpack:GetChildren()) do
		if item.Name == Select then
			item.Parent = character
			break
		end
	end
end

--------------------------------------------------------------------------------------------------------------------------------------------
function SKipClassic()
    for _, h in pairs(world:GetDescendants()) do
        if h.Name == "Game Teleporter" or (h.Name == "Platform" and h:FindFirstChild("BadgeID")) then
            to(h.CFrame)
        end
    end
end

function SkipChapter()
    if id == 6296321810 or id == 6479231833 then
        to(CFrame.new(3507.028564453125, 43.13663864135742, -1541.9735107421875)) -- b1c1p1
    elseif id == 6301638949 or id == 6480994221 then
        to(CFrame.new(1272.7239990234375, 200.04153442382812, -2537.25)) -- b1c1p2
    elseif id == 6373539583 or id == 6485055338 then
        to(CFrame.new(64.74767303466797, 60.94379806518555, -1622.5250244140625)) -- b1c2p1
    elseif id == 6406571212 or id == 6485055836 then
        to(CFrame.new(232.6605987548828, 100.84130096435547, -595.3074951171875)) -- b1c2p2
    elseif id == 6425178683 or id == 6485056556 then
        to(CFrame.new(1055.5179443359375, 78.26939392089844, -351.45831298828125)) -- b1c2p3
    elseif id == 6472459099 or id == 6688734180 then
        to(CFrame.new(2416.63671875, -23.031118392944336, 2294.332275390625)) -- b1c3p1
    elseif id == 6682163754 or id == 6688734313 then
        to(CFrame.new(241.43087768554688, 33.24515914916992, 450.21502685546875)) -- b1c3p2
    elseif id == 6682164423 or id == 6688734395 then
        to(CFrame.new(-654.1986694335938, 648.9832153320312, -1012.5780029296875)) -- b1c3p3
	elseif id == 7265396387 or id == 7251865082 then
		to(CFrame.new(85.20524597167969, -51.00001525878906, -1415.0792236328125)) --b1c4
    end
end

function SkipTWT()
    if id == 7068738088 or id == 7068951438 then
		to(CFrame.new(2528.98681640625, 8.164044380187988, -1184.1917724609375)) -- twt1
	elseif id == 7068951914 or id == 7068739000 then
		to(CFrame.new(-439.1501770019531, 21.252744674682617, -1455.9263916015625)) -- twt2
	elseif id == 7068740106 or id == 7068952294 then
		to(CFrame.new(2690.99169921875, 9.297460556030273, 649.3221435546875)) -- twt3
    end
end

function Autobtfs()
    for _, v in pairs(world.Butterflies:GetChildren()) do
        if v.Name == "Butterfly" then
            to(v.CFrame)
        else
            to(CFrame.new(1099.39794921875, 3.135153293609619, 75.5241928100586))
        end
    end
end

function AutoArmors()
    to(CFrame.new(706.4743041992188, 14.950273513793945, 1929.3958740234375))
    for _, v in pairs(world:GetChildren()) do
        if v.Name == "Texture" or v.Name == "MeshPart" or v.Name == "TreeMeshTop" then
            v:Destroy()
        end
    end
    Part = world.Well:WaitForChild("Burner")
    Float = Instance.new("Part")
    Float.Parent = world
    Float.Anchored = true
    Float.Size = Vector3.new(30, 2, 30)
    Float.CFrame = Part.CFrame * CFrame.new(0, 14, 0) -- Offset the position of Float
    wait(0.5)
    to(CFrame.new(860.1697998046875, 15.059876441955566, 2388.63427734375))
    fire()
    wait(0.5)
    to(CFrame.new(839.8504028320312, 18.34674072265625, 2241.216552734375))
    fire()
    wait(0.5)
    to(CFrame.new(668.060791015625, 18.767614364624023, 2099.3955078125))
    fire()
    wait(0.5)
    to(CFrame.new(625.1378173828125, 17.63252830505371, 2345.30078125))
    fire()
    wait(0.5)
    to(CFrame.new(759.3781127929688, 15.417532920837402, 2531.548583984375))
    fire()
    wait(0.5)
    to(CFrame.new(864.6249389648438, 23.993000030517578, 2550.099853515625))
    fire()
    wait(0.5)
    to(CFrame.new(860.1697998046875, 15.059876441955566, 2388.63427734375))
    fire()
    wait(1.5)
    to(CFrame.new(687.65673828125, 13.798624038696289, 2253.633544921875))
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
end


function Ratfind()
    pcall(function()
        for _, rat in ipairs(world:GetDescendants()) do
            if rat:IsA("MeshPart") then
                if rat.TextureID == "rbxassetid://8569135832" then
                    proximityPrompt = rat:FindFirstChildOfClass("ProximityPrompt")
                    if proximityPrompt then
                        to(rat.CFrame)
                        wait(0.2)
                        fire()
                        fire()
                        fire()
                        wait(0.2)
                        to(CFrame.new(-1539.063, -30.171, -3543.718))
                        wait(0.1)
                        Equip("Poisoned Rat")
                        wait(0.1)
                        fire()
                        fire()
                        wait(5)
                        to(CFrame.new(-1563.528, -28.910, -3408.718))
                        wait(0.2)
                        fire()
                        fire()
                        wait(0.2)
                        to(CFrame.new(-1674.827, -21.010, -3402.391))
                        countdown(25)
                        break
                    end
                end
            end
        end
    end)
end

B2c1pos = {
    --picture
    blue = CFrame.new(209.63929748535156, 3084.15478515625, 3832.36279296875),
    red = CFrame.new(152.81671142578125, 3060.99365234375, 3861.497802734375),
    man = CFrame.new(214.0342559814453, 3060.994140625, 3818.04736328125),
    Chicken = CFrame.new(237.98187255859375, 3072.503662109375, 3878.86181640625),
    Momson = CFrame.new(168.0010223388672, 3072.5048828125, 3830.942626953125),
    UM = CFrame.new(190.3834991455078, 3084.15478515625, 3903.572998046875),
    fox = CFrame.new(251.99221801757812, 3060.994140625, 3852.603271484375),
    flute = CFrame.new(184.19967651367188, 3072.50390625, 3925.464111328125),
    love = CFrame.new(182.9803009033203, 3060.994140625, 3923.0703125),
    ORB = CFrame.new(191.37278747558594, 3061.04443359375, 3891.880126953125),
    --House
    home1 = CFrame.new(-395.08563232421875, 3069.57568359375, 3891.535400390625),
    home2 = CFrame.new(-4.784941673278809, 3067.82421875, 4712.5751953125),
    Dwhome = CFrame.new(-246.92311096191406, 3068.64306640625, 4219.79248046875),
    home4 = CFrame.new(595.481689453125, 3069.576416015625, 4422.1923828125),
    home5 = CFrame.new(-676.0106811523438, 3069.525146484375, 5002.66357421875),
    --Oxygen
    OX = CFrame.new(-6066.22412109375, 546.66552734375, 7169.19970703125),
    --lower
    Candle11 = CFrame.new(-5453.7373046875, 461.4326171875, 6514.80859375),
    Candle12 = CFrame.new(-5435.24755859375, 462.03277587890625, 6351.935546875),
    Candle13 = CFrame.new(-5444.45654296875, 462.0570373535156, 6254.01611328125),
    Candle14 = CFrame.new(-5467.76318359375, 462.39044189453125, 6260.67236328125),
    Candle15 = CFrame.new(-5453.34912109375, 461.8515930175781, 6101.9853515625),
    --midle
    Candle21 = CFrame.new(-6065.1728515625, 547.58154296875, 7319.21923828125),
    --up
    Candle31 = CFrame.new(-6808.1669921875, 758.5756225585938, 6414.2978515625),
    Candle32 = CFrame.new(-6820.96728515625, 746.4933471679688, 6258.71044921875),
    Candle33 = CFrame.new(-6822.0380859375, 746.42431640625, 6173.79296875),
    --bypass
    bypassf1 = CFrame.new(-5441.55859375, 460.84051513671875, 6336.8662109375),
    bypassf2 = CFrame.new(-6034.21728515625, 546.7184448242188, 7196.44482421875),
    bypassf3 = CFrame.new(-6822.1220703125, 745.171142578125, 6438.0400390625)
}

function ip(Pos)
    pcall(function()
        local e = Instance.new("Frame")
        local c = Instance.new("UICorner")
        e.Size = UDim2.new(0, 14, 0, 14)
        e.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        e.BackgroundTransparency = 0
        e.AnchorPoint = Vector2.new(0.5, 0.5)
        e.Position = Pos
        c.CornerRadius = UDim.new(0.1, 0)
        c.Parent = e
        for _, v in ipairs(workspace:GetDescendants()) do
            if v.Name == "Pad" then
                local Interface = v:FindFirstChild("Display")
                if Interface then
                    e.Parent = Interface
                end
            end
        end
    end)
end

function pic1()
    ip()
end
function floor1()
	to(B2c1pos.bypassf1)
	nofall()
	task.wait(5)
	fall()
    to(B2c1pos.Candle11)
    task.wait(0.3)
    fire()
    task.wait(0.3)
	to(B2c1pos.bypassf1)
	countdown(25)
    to(B2c1pos.Candle12)
    task.wait(0.3)
    fire()
    task.wait(0.3)
	to(B2c1pos.bypassf1)
	countdown(25)
    to(B2c1pos.Candle13)
    task.wait(0.3)
    fire()
    task.wait(0.3)
	to(B2c1pos.bypassf1)
	countdown(25)
    to(B2c1pos.Candle14)
    task.wait(0.3)
    fire()
    task.wait(0.3)
	to(B2c1pos.bypassf1)
	countdown(25)
    to(B2c1pos.Candle15)
    task.wait(0.3)
    fire()
    task.wait(0.3)
	to(B2c1pos.bypassf1)
	countdown(25)
    to(OX)
end

function floor2()
	nofall()
	to(B2c1pos.bypassf2)
	task.wait(5)
	fall()
    to(B2c1pos.Candle21)
    task.wait(0.3)
    fire()
    task.wait(0.3)
	to(B2c1pos.bypassf2)
	countdown(25)
    to(B2c1pos.OX)
end

function floor3()
	nofall()
	to(B2c1pos.bypassf3)
	task.wait(5)
	fall()
    to(B2c1pos.Candle31)
    task.wait(0.3)
    fire()
    task.wait(0.3)
	to(B2c1pos.bypassf3)
	countdown(25)
    to(B2c1pos.Candle32)
    task.wait(0.3)
    fire()
    task.wait(0.3)
	to(B2c1pos.bypassf3)
	countdown(25)
    to(B2c1pos.Candle33)
    task.wait(0.3)
    fire()
    task.wait(0.3)
	to(B2c1pos.bypassf3)
	countdown(25)
    to(B2c1pos.bypassf3)
end

if id == 8056702588 then
InsertPart("Picpcall", Vector3.new(208.97933959960938, 3061.8310546875, 3823.934326171875), Vector3.new(100, 20, 100))
InsertPart("House1", Vector3.new(-395.0856, 3069.5757, 3891.5354), Vector3.new(15, 2, 15))
InsertPart("House2", Vector3.new(-4.7849, 3067.8242, 4712.5752), Vector3.new(15, 2, 15))
InsertPart("House3", Vector3.new(-246.9231, 3068.6431, 4219.7925), Vector3.new(15, 2, 15))
InsertPart("House4", Vector3.new(595.4817, 3069.5764, 4422.1924), Vector3.new(15, 2, 15))
InsertPart("House5", Vector3.new(-676.0107, 3069.5251, 5002.6636), Vector3.new(15, 2, 15))
InsertPart("Key", Vector3.new(-401.71002197265625, 3065.575927734375, 3867.829345703125), Vector3.new(15, 2, 15))
InsertPart("Office", Vector3.new(-1778.0726318359375, 9.717201232910156, -4295.62109375), Vector3.new(15, 2, 15))
end

if id == 13489800654 then
    InsertPart("safeEmbed", Vector3.new(2025.055419921875, 129.0679473876953, -4738.908203125), Vector3.new(50, 2, 50))
end

B2c2pos = {
    Bypass = CFrame.new(-4371.806640625, 711.3719482421875, 1121.54248046875),

    StartOcean = CFrame.new(-537.7177734375, 22.193456649780273, -85.44476318359375),
    doorlast = CFrame.new(-3953.24072, 594.218933, 321.80304, 0.999459922, 0, -0.032861691, 0, 1, 0, 0.032861691, 0, 0.999459922),
    talk = CFrame.new(-4442.72803, 711.371887, 1162.86707, -0.146179333, 0, 0.989258111, 0, 1, 0, -0.989258111, 0, -0.146179333),
    
    skele = CFrame.new(-4601.89404296875, 826.4385986328125, -35.5607795715332),
    endskele = CFrame.new(-5364.40918, 682.05365, 30.630415, 0.317401469, 0, 0.948291242, 0, 1, 0, -0.948291242, 0, 0.317401469),
    
    startlever = CFrame.new(-11030.5029296875, -81.40126037597656, -12.647021293640137),
    endlever = CFrame.new(-10060.2744140625, 484.0893859863281, -9.173670768737793),

    StartCook = CFrame.new(-2582.31445, 968.246521, -4920.55469, -0.0169319678, 0, 0.999856651, 0, 1, 0, -0.999856651, 0, -0.0169319678),
    Bowlq = CFrame.new(-2692.756103515625, 968.2465209960938, -4927.8359375),
    Pot = CFrame.new(-2691.974853515625, 968.2465209960938, -4910.5859375),
    StovePos = CFrame.new(-2729.610107421875, 968.2465209960938, -4906.57763671875),
    PotandBowlPos = CFrame.new(-2729.904541015625, 968.24658203125, -4930.19580078125),
    Feed = CFrame.new(-2762.750244140625, 968.2464599609375, -4919.3310546875),
    EndCook = CFrame.new(-3361.457763671875, 1205.020751953125, -6819.82666015625)
}

function SkipOcean()
    to(B2c2pos.Bypass)
    Anchored()
    countdown(30)
    Unanchored()
    task.wait(1)
    to(B2c2pos.StartOcean)
end
function Skipcow()
    to(B2c2pos.Bypass)
    Anchored()
    countdown(60)
    Unanchored()
    task.wait(1)
    to(B2c2pos.doorlast)
    task.wait(0.3)
    fire()
    fire()
end

function getmeat()
pcall(function()
for i, v in ipairs(world:GetDescendants()) do
    if v.Name == "RestaurantRoom" then
        Restaurant = v
        Havemeat = Restaurant:FindFirstChild("Meat")
        if Havemeat then
            for _, n in pairs(Havemeat:GetChildren()) do
                if n.Transparency == 0 then  -- Use '==' for comparison
                    bowgiver = Restaurant:FindFirstChild("BowlGiver")
                    if bowgiver then
                        warp = bowgiver:FindFirstChildOfClass("MeshPart")
                        if warp then
                            to(warp.CFrame * CFrame.new(0, 7, 0))
                        end
                    end
                end
            end
        end
    end
end
end)
end

function EndMeat()
    pcall(function()
for _, v in ipairs(world:GetDescendants()) do
    if v.Name == "DoorTele" then
        for _, b in pairs(v:GetChildren()) do
            if b.Name == "DoorFrame" then
                b.Rotation = Vector3.new(0, 0, 0)
                to(b.CFrame)
            end
        end
    end
end
end)
end

function Levers()
    pcall(function()
for i, v in ipairs(workspace:GetDescendants()) do
    if v.Name == "Levers" then
        for _, b in ipairs(v:GetDescendants()) do
            if b:IsA("MeshPart") and b.Transparency == 0 and b.Name == "Lever" then
                    for _, n in ipairs(b:GetDescendants()) do
                        if n.Name == "Main" and n.Transform.Position == Vector3.new(0, 0, 0) then
                            to(b.CFrame)
                            break
                        end
                    end
            end
        end
    end
end
end)
end

function Foodfire(Name)
    pcall(function()
    for i, v in ipairs(Workspace:GetDescendants()) do
        if v.Name == "Giver" then
            for _, e in pairs(v:GetChildren()) do
                if e.Name == Name then
                    for _, t in ipairs(e:GetDescendants()) do
                        if t:IsA("ProximityPrompt") then
                            fireproximityprompt(t)
                        end
                    end
                end
            end
        end
    end
end)
end

function Makefire(Name)
    pcall(function()
    for i, v in ipairs(Workspace:GetDescendants()) do
        if v.Name == "SystemBin" then
            for _, e in pairs(v:GetChildren()) do
                if e.Name == Name then
                    for _, t in ipairs(e:GetDescendants()) do
                        if t:IsA("ProximityPrompt") then
                            fireproximityprompt(t)
                        end
                    end
                end
            end
        end
    end
end)
end

function Cookfire()
    pcall(function()
    for i, v in ipairs(Workspace:GetDescendants()) do
        if v.Name == "Stoves" then
            for _, e in pairs(v:GetChildren()) do
                if e.Name == "stove" and e.Position == Vector3.new(-2730.124755859375, 967.5448608398438, -4902.7666015625) then
                    for _, t in ipairs(e:GetDescendants()) do
                        if t:IsA("ProximityPrompt") then
                            fireproximityprompt(t)
                        end
                    end
                end
            end
        end
    end
end)
end

function PlacePfire()
    pcall(function()
    for i, v in ipairs(Workspace:GetDescendants()) do
        if v.Name == "WoodenCounters" then
            for _, e in pairs(v:GetChildren()) do
                if e:IsA("Model") and e.Position == Vector3.new(-2734.9755859375, 967.0695190429688, -4935.75732421875) then
                    for _, t in ipairs(e:GetDescendants()) do
                        if t:IsA("ProximityPrompt") then
                            fireproximityprompt(t)
                        end
                    end
                end
            end
        end
    end
end)
end

function PlaceBfire()
    pcall(function()
    for i, v in ipairs(Workspace:GetDescendants()) do
        if v.Name == "WoodenCounters" then
            for _, e in pairs(v:GetChildren()) do
                if e:IsA("Model") and e.Position == Vector3.new(-2739.6455078125, 967.0695190429688, -4935.75732421875) then
                    for _, t in ipairs(e:GetDescendants()) do
                        if t:IsA("ProximityPrompt") then
                            fireproximityprompt(t)
                        end
                    end
                end
            end
        end
    end
end)
end

function EyeBall()
    pcall(function()
	to(B2c2pos.Bowlq)
	task.wait(0.35)
	Foodfire("Pot") --เก็บถ้วย
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos) --วาปไปที่วางถ้วย
	task.wait(0.35)
	PlaceBfire() --วางถ้วย
	task.wait(0.35)
	to(B2c2pos.Pot) --วาปไปหาตา
	task.wait(0.35)
	Foodfire("Eyeball") --เก็บตา
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos) --วาปมาถ้วย
	task.wait(0.35)
	Makefire("Bowl")
	task.wait(0.35)
	to(B2c2pos.Pot)
	task.wait(0.35)
	Foodfire("Spaghetti")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	Makefire("Bowl")
	task.wait(0.35)
	Makefire("Bowl")
	task.wait(0.35)
	to(B2c2pos.FeedF)
	task.wait(0.35)
	fire()
    end)
end

function Chick()
    pcall(function()
	to(B2c2pos.Pot)
	task.wait(0.35)
	Foodfire("Pot")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	PlacePfire()
	task.wait(0.35)
	to(B2c2pos.Bowlq)
	task.wait(0.35)
	Foodfire("Chicken")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	Makefire("Pot")
	task.wait(0.35)
	to(B2c2pos.Pot)
	task.wait(0.35)
	Foodfire("Cheese")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	Makefire("Pot")
	task.wait(0.35)
	to(B2c2pos.Bowlq)
	task.wait(0.35)
	Foodfire("Wrapped Meat")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	Makefire("Pot")
	task.wait(0.35)
	to(B2c2pos.Bowlq)
	task.wait(0.35)
	Foodfire("Bowl")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	PlaceBfire()
	task.wait(0.35)
	Makefire("Pot")
	task.wait(0.35)
	to(B2c2pos.StovePos)
	task.wait(0.35)
	Cookfire()
    task.wait(12)
    to(B2c2pos.StovePos)
    task.wait(0.35)
	Cookfire()
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	PlaceBfire()
	task.wait(0.35)
	Makefire("Bowl")
	task.wait(0.35)
	to(B2c2pos.FeedF)
	task.wait(0.35)
	fire()
    end)
end

function ham()
    pcall(function()
	to(B2c2pos.Pot)
	task.wait(0.35)
	Foodfire("Pot")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	PlacePfire()
	task.wait(0.35)
	to(B2c2pos.Bowlq)
	task.wait(0.35)
	Foodfire("Ham")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	Makefire("Pot")
	task.wait(0.35)
	to(B2c2pos.Pot)
	task.wait(0.35)
	Foodfire("Sausage")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	Makefire("Pot")
	task.wait(0.35)
	to(B2c2pos.Bowlq)
	task.wait(0.35)
	Foodfire("Bowl")
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	PlaceBfire()
	task.wait(0.35)
	Makefire("Pot")
	task.wait(0.35)
	to(B2c2pos.StovePos)
	task.wait(0.35)
	Cookfire()
    task.wait(12)
    to(B2c2pos.StovePos)
    task.wait(0.35)
	Cookfire()
	task.wait(0.35)
	to(B2c2pos.PotandBowlPos)
	task.wait(0.35)
	PlaceBfire()
	task.wait(0.35)
	Makefire("Bowl")
	task.wait(0.35)
	to(B2c2pos.FeedF)
	task.wait(0.35)
	fire()
    end)
end

function toPuzzle()
    pcall(function()
        for i, v in ipairs(world:GetDescendants()) do
            if v:IsA("Model") and (v.Name == "1" or v.Name == "2" or v.Name == "3") then
                for _, b in pairs(v:GetChildren()) do
                    if b.Name == "Base" and b.Transparency == 0 then
                        for _, x in pairs(b:GetChildren()) do
                            if x.Name == "Part2" and x.Color == Color3.new(27 / 255, 42 / 255, 53 / 255) and x.Transparency == 0 then
                                to(b.CFrame)
                            end
                        end
                    end
                end
            end
        end
    end)
end


function SafeTower()
    pcall(function()
        for _, v in ipairs(world:GetDescendants()) do
            if v:IsA("Sound") or v.Name == "Warning1" or v.Name == "Warning2" or v.Name == "Warning3" then
                if v.Playing == true then
                    to(CFrame.new(-4089.20483, 743.817444, -960.496887, -0.0886541307, 0, -0.996062458, 0, 1, 0,
                        0.996062458, 0, -0.0886541307))
                end
            end
        end
    end)
end


function FindKid()
    pcall(function()
        for i, v in ipairs(world:GetDescendants()) do
            if v.Name == "KimonoWrap" then
                to(v.CFrame)
                break
            end
        end
    end)
end


function Togate()
    pcall(function()
        for _, v in ipairs(world:GetDescendants()) do
            if v.Name == "Glowing" and v:IsA("BasePart") then -- Ensure 'Glowing' is a part
                tp(v.CFrame)
                break
            end
        end
    end)
end


function FNote()
    pcall(function()
        for i, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Notes" then
                for _, p in pairs(v:GetChildren()) do
                    if p.Name == "Note" then
                        for _, proximity in pairs(p:GetChildren()) do
                            if proximity.Name == "Front" and proximity.Transparency == 0 then
                                to(p.CFrame)
                            end
                        end
                    end
                end
            end
        end
    end)
end


function Ballprompt()
    pcall(function()
        for i, v in ipairs(worldtable:GetDescendants()) do
            if v.Name == "BallGivers" then
                for l, prompt in ipairs(v:GetDescendants()) do
                    if prompt:IsA("ProximityPrompt") then
                        fireproximityprompt(prompt)
                    end
                end
            end
        end
    end)
end


function Boss2()
    pcall(function()
        for _, v in ipairs(world:GetDescendants()) do
            if v.Name == "TailHitbox1" or v.Name == "TailHitbox2" then
                v.Size = Vector3.new(1000, 1000, 1000)
            end
        end
    end)
end


function heartCollect()
    to(CFrame.new(-171.5743865966797, 45.4909553527832, 59.38624572753906))
    task.wait(0.3)
    fire()
    task.wait(0.3)
    to(CFrame.new(-127.67491149902344, 45.47054672241211, 125.23974609375))
    task.wait(0.3)
    fire()
    task.wait(0.3)
    to(CFrame.new(-110.10736083984375, 45.470542907714844, 22.91050910949707))
    task.wait(0.3)
    fire()
    task.wait(0.3)
    to(CFrame.new(-25.172779083251953, 45.470542907714844, 47.92983627319336))
    task.wait(0.3)
    fire()
    task.wait(0.3)
    to(CFrame.new(-71.28004455566406, 49.34312057495117, 10.172744750976562))
    task.wait(0.3)
    Equip("Heart")
    task.wait(0.3)
    fire()
    task.wait(0.3)
    Equip("Heart")
    task.wait(0.3)
    fire()
    task.wait(0.3)
    Equip("Heart")
    task.wait(0.3)
    fire()
    task.wait(0.3)
    Equip("Heart")
    task.wait(0.3)
    fire()
end


_G.HW = false
function Eventhw()
    for i, v in pairs(world:GetChildren()) do
        if v.Name == "Candy" then
            for p, n in pairs(v:GetChildren()) do
                if n.Name == "Candy" then
                    to(n.CFrame)
                else
                    _G.HW = false
                end
            end
        end
    end
end

function hw2()
    for i, v in pairs(world:GetChildren()) do
        if v.Name == "Candles" then
            for k, s in pairs(v:GetChildren()) do
                if s.Name == "Candle" and s:IsA("Model") then
                    for j, descendant in ipairs(s:GetDescendants()) do
                        if descendant:IsA("ProximityPrompt") and descendant.Enabled == true then
                            for j, meshDescendant in ipairs(s:GetDescendants()) do
                                if meshDescendant:IsA("MeshPart") then
                                    to(CFrame.new(meshDescendant.CFrame))
                                    task.wait(0.3)
                                    fireSelect("Candles")
                                    task.wait(0.2)
                                    to(CFrame.new(396.8655090332031, 205.25375366210938, -94.7509536743164))
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function bat()
    for i, v in ipairs(world:GetDescendants()) do
        if v.Name == "Bat" then
            for k, kuy in pairs(v:GetChildren()) do
                if kuy:IsA("Part") and Part.Transparency == 0 then
                    for o, k in ipairs(v:GetDescendants()) do
                        if k:IsA("ProximityPrompt") and k.Enabled == true then
                            to(kuy.CFrame)
                        end
                    end
                end
            end
        end
    end
end

function snake()
    for i, v in ipairs(world:GetDescendants()) do
        if v.Name == "Snakes" then
            for k, kuy in pairs(v:GetChildren()) do
                if kuy:IsA("MestPart") and Part.Transparency == 0 then
                    for o, k in ipairs(v:GetDescendants()) do
                        if k:IsA("ProximityPrompt") and k.Enabled == true then
                            to(kuy.CFrame)
                        end
                    end
                end
            end
        end
    end
end

function rose()
    for i, v in ipairs(world:GetDescendants()) do
        if v.Name == "Roses" then
            for k, kuy in pairs(v:GetChildren()) do
                if kuy:IsA("Part") and Part.Transparency == 0 then
                    for o, k in ipairs(v:GetDescendants()) do
                        if k:IsA("ProximityPrompt") and k.Enabled == true then
                            to(kuy.CFrame)
                        end
                    end
                end
            end
        end
    end
end

function eye()
    for i, v in ipairs(world:GetDescendants()) do
        if v.Name == "Eyes" then
            for k, kuy in pairs(v:GetChildren()) do
                if kuy:IsA("MestPart") and Part.Transparency == 0 then
                    for o, k in ipairs(v:GetDescendants()) do
                        if k:IsA("ProximityPrompt") and k.Enabled == true then
                            to(kuy.CFrame)
                        end
                    end
                end
            end
        end
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
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

Windows = NothingLibrary.new({Title = "Overflow - The Mimic", Description = "Ultimate 5.0", Keybind = Enum.KeyCode.LeftControl, Logo = 'rbxassetid://139033222788263'})

--Tab
_General_TAB = Windows:NewTab({Title = "Help", Description = "Info", Icon = "rbxassetid://7733964719" })
_Setting_TAB = Windows:NewTab({ Title = "Setting", Description = "Functions", Icon = icons.setting })
_Teleport_TAB = Windows:NewTab({ Title = "Teleport", Description = "Quick Game", Icon = icons.teleport })
_B1C1_TAB = Windows:NewTab({ Title = "Control's I", Description = "Functions", Icon = icons.control })
_B1C2_TAB = Windows:NewTab({ Title = "Control's II", Description = "Functions", Icon = icons.control })
_B1C3_TAB = Windows:NewTab({ Title = "Control's III", Description = "Functions", Icon = icons.control })
_B1C4_TAB = Windows:NewTab({ Title = "Control's IV", Description = "Functions", Icon = icons.control })
_B2C1_TAB = Windows:NewTab({ Title = "Jelousy's I", Description = "Functions", Icon = icons.jelousy })
_B2C2_TAB = Windows:NewTab({ Title = "Jelousy's II", Description = "Functions", Icon = icons.jelousy })
_B2C3_TAB = Windows:NewTab({ Title = "Jelousy's III", Description = "Functions", Icon = icons.jelousy })
_TWT_TAB = Windows:NewTab({ Title = "The Witch Trial", Description = "Functions", Icon = icons.twt })
_XMAS_TAB = Windows:NewTab({ Title = "Chirstmas Trial", Description = "Functions", Icon = icons.xmas })
_HW_TAB = Windows:NewTab({ Title = "Halloween Trial", Description = "Functions", Icon = icons.halloween })
_NCC_TAB = Windows:NewTab({ Title = "Nightmare Circus", Description = "Functions", Icon = icons.circus })
_DC_TAB = Windows:NewTab({ Title = "Death's Challeng", Description = "Functions", Icon = icons.jigoku })
_CS_TAB = Windows:NewTab({ Title = "Classic", Description = "Functions", Icon = icons.classic })


--General
Status = _General_TAB:NewSection({ Title = "Status", Icon = icons.bypass, Position = "Left" })
LNStatus = _General_TAB:NewSection({ Title = "Lantern Status", Icon = icons.lantern, Position = "Left" })
if id == 8056702588 or id == 13489800654 or id == 15962819441 then
    Status:NewTitle('Bypass : 🟢')
    _SendNotify("Bypass", "Success", 3, icons.messeng)
    local function Anticheat()
        pcall(function()
            local _0, _1, _9, _88, TS, __2, __9S = 
                'ContentProvider', hookfunction, newcclosure, hookmetamethod, 
                getnamecallmethod, {"FireServer", 'Sender', 'Sender2'}, {3, 1, 2}

            if _1 then 
                _1(game:GetService(_0).PreloadAsync, _9(function(...) return '...' end)) 
            end

            if TS then 
                local _13
                _13 = _88(game, '__namecall', function(self, ...) 
                    local __s__ = {...}  
                    if TS() == __2[__9S[2]] and (tostring(self) == __2[__9S[1]] or tostring(self) == __2[__9S[3]]) then 
                        return wait(9e9)  
                    end
                    return _13(self, ...)  
                end) 
            end
        end)
    end
    Anticheat()
else
    _SendNotify("Bypass", "This Chapter dont have Anti Cheat", 3, icons.messeng)
    Status:NewTitle('Bypass : 🔴')
end
LNStatus:NewTitle("Working : 🟢")
LNStatus:NewTitle("Not Work : 🔴")
LNStatus:NewTitle("___________________________")
LNStatus:NewTitle("Control's Book")
LNStatus:NewTitle("I : 🟢")
LNStatus:NewTitle("II : 🟢")
LNStatus:NewTitle("III : 🟢")
LNStatus:NewTitle("IV : 🔴")
LNStatus:NewTitle("___________________________")
LNStatus:NewTitle("Jelousy's Book")
LNStatus:NewTitle("I : 🟢")
LNStatus:NewTitle("II : 🔴")
LNStatus:NewTitle("The Chochin Obake : 🔴")
LNStatus:NewTitle("___________________________")
LNStatus:NewTitle("Gamemode")
LNStatus:NewTitle("The Witch Trial : 🟢")
LNStatus:NewTitle("The Halloween Trial : 🟢")
LNStatus:NewTitle("The Christmas Trial : 🔴")
LNStatus:NewTitle("The Nightmare Circus : 🔴")
LNStatus:NewTitle("___________________________")
LNStatus:NewTitle("Event")
LNStatus:NewTitle("The Jigoku : 🔴")
LNStatus:NewTitle("The Classic Hiachi : 🟢")
Overflow = _General_TAB:NewSection({Title = "Discord", Icon = icons.owner, Position = "Right"})
Catsus = _General_TAB:NewSection({Title = "Credit UI", Icon = "rbxassetid://7733964719", Position = "Right"})
Keaw = _General_TAB:NewSection({Title = "สำหรับคนไทยยย", Icon = icons.ringmasterhat, Position = "Right"})
Catsus:NewTitle('UI by 4lpaca("CATSUS")')
Catsus:NewButton({Title = "Discord Neuron X", Callback = function()
    setclipboard('discord.gg/BH6pE7jesa')
end})
Overflow:NewTitle('Join Overflow Discord')
Overflow:NewButton({Title = "Discord Overflow", Callback = function()
    setclipboard("https://discord.gg/e33VShsv6f")
end})
Keaw:NewTitle('รับวาดคอมมิชชั่น Roblox')
Keaw:NewButton({Title = "Kẅayureé ィ ۦ  (유리)", Callback = function()
    setclipboard("https://web.facebook.com/profile.php?id=100089169403733")
end})

--Setting
Setting_main = _Setting_TAB:NewSection({ Title = "Setting", Icon = icons.setting, Position = "Left" })
Setting_misc = _Setting_TAB:NewSection({ Title = "Miscellaneous", Icon = icons.misc, Position = "Left" })
Setting_Esp = _Setting_TAB:NewSection({ Title = "Visual", Icon = icons.visual, Position = "Right" })
Setting_display = _Setting_TAB:NewSection({ Title = "Display", Icon = icons.display, Position = "Right" })
Setting_tele = _Setting_TAB:NewSection({ Title = "Teleport", Icon = icons.teleport, Position = "Right" })
Setting_Esp:NewTitle("If ESP Don't Work, Just On and Off Again.")
Setting_Esp:NewToggle({Title = "Monsters", Default = false, Callback = function(tr) 
    if tr then
        ESP()
    else
        UnEspMob()
    end
end})
Setting_Esp:NewToggle({Title = "Players", Default = false, Callback = function(tr) 
    if tr then
        ESPPlayers()
    else
        UnEspPlayers()
    end
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
    if tr then
        noclip()
    else
        clip()
    end
end})
Setting_main:NewToggle({Title = "No Cooldown Prompt", Default = false, Callback = function(tr) 
    if tr then
        EnableInstantPrompt()
    else
        DisableInstantPrompt()
    end
end})
Setting_main:NewButton({Title = "Set Gravity [If Gravity Bug]", Callback = function()
    pcall(function()
        world.Gravity = 150
    end)
end})
Setting_main:NewButton({Title = "Set Anchored [If You Can't Move]", Callback = function()
    pcall(function()
        Unanchored()
    end)
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
        Frames3.Active = true
        Frames3.Draggable = true
    else
        Frames.Active = false
        Frames.Draggable = false
        Frames3.Active = false
        Frames3.Draggable = false
    end
end})
Setting_misc:NewTitle("On = Start Setting")
Setting_misc:NewTitle("Off = Save Setting")
Setting_misc:NewToggle({Title = "Button Fly", Default = false, Callback = function(tr) 
    Onfly()
end})
Setting_misc:NewToggle({Title = "Button Fire Prompt", Default = false, Callback = function(tr) 
    OnPrompt()
end})
Setting_main:NewSlider({Title = "Speed", Min = 25, Max = 200, Default = 25, Callback = function(a) 
    getgenv().Enabled = true
    getgenv().Speed = a
    local players = game:GetService("Players")
    function bypassWalkSpeed()
    if getgenv().executed then
        print("Walkspeed Already Bypassed - Applying Settings Changes")
        if not getgenv().Enabled then
            return
        end
    else
        getgenv().executed = true
        print("Walkspeed Bypassed")

        local mt = getrawmetatable(game)
        setreadonly(mt, false)

        local oldindex = mt.__index
        mt.__index = newcclosure(function(self, b)
            if b == 'WalkSpeed' then
                return 16
            end
            return oldindex(self, b)
        end)
    end
end
bypassWalkSpeed()
players.LocalPlayer.CharacterAdded:Connect(function(char)
bypassWalkSpeed()
char:WaitForChild("Humanoid").WalkSpeed = getgenv().Speed
end)
while getgenv().Enabled and wait() do
    players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = getgenv().Speed
end
end})
Setting_misc:NewSlider({Title = "Fly Speed", Min = 1, Max = 10, Default = 2, Callback = function(a) 
    speeds = a
end})
EnteredUsername = ""
Setting_tele:NewTextbox({
    Title = "Teleport Player", 
    Default = "", 
    FileType = "Username", 
    Callback = function(username)
        EnteredUsername = username
    end
})

Setting_tele:NewButton({
    Title = "Teleport", 
    Callback = function()
        local targetPlayer = game.Players:FindFirstChild(EnteredUsername)
        if targetPlayer and targetPlayer.Character then
            local targetHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if targetHRP then
                to(targetHRP.CFrame)
            end
        end
    end
})

--teleportTAB
Teleport_main = _Teleport_TAB:NewSection({ Title = "Main", Icon = icons.home, Position = "Left" })
Teleport_b1 = _Teleport_TAB:NewSection({ Title = "Control's Book", Icon = icons.control, Position = "Right" })
Teleport_classic = _Teleport_TAB:NewSection({ Title = "The Mimic Classic", Icon = icons.control, Position = "Right" })
Teleport_event = _Teleport_TAB:NewSection({ Title = "Event", Icon = icons.bookmark, Position = "Left" })
Teleport_gamemode = _Teleport_TAB:NewSection({ Title = "Gamemode", Icon = icons.ringmasterhat, Position = "Left" })
Teleport_main:NewTitle("Nightmare Only")
--tpbook1
Teleport_b1:NewButton({Title = "Teleport Final Chapter 2", Callback = function()
    tplace(6485056556)
end})
Teleport_b1:NewButton({Title = "Teleport Final Chapter 3", Callback = function()
    tplace(6688734395)
end})
Teleport_b1:NewButton({Title = "Teleport Final Chapter 4", Callback = function()
    tplace(7265397848)
end})

--Main
Teleport_main:NewButton({Title = "The Mimic", Callback = function()
    tplace(6243699076)
end})
Teleport_main:NewButton({Title = "Gamemode", Callback = function()
    tplace(7068737459)
end})
Teleport_main:NewButton({Title = "The Mimic Classic", Callback = function()
    tplace(15989427413)
end})

--gamemode
Teleport_gamemode:NewButton({Title = "Teleport Final The Witch Trial", Callback = function()
    tplace(7069191531)
end})
Teleport_gamemode:NewButton({Title = "Teleport Final Halloween Trial", Callback = function()
    tplace(7633631511)
end})

--Event
Teleport_event:NewButton({Title = "Teleport to Death's Challeng", Callback = function()
    tplace(7618863566)
end})
Teleport_classic:NewButton({Title = "Teleport Final Chapter 1", Callback = function()
    tplace(15996407335)
end})
Teleport_classic:NewButton({Title = "Teleport Final Chapter 2", Callback = function()
    tplace(15996413469)
end})
Teleport_classic:NewButton({Title = "Teleport Final Chapter 3", Callback = function()
    tplace(15996417416)
end})

B1C1_1 = _B1C1_TAB:NewSection({ Title = "Automatic", Icon = icons.control, Position = "Left" })
B1C1_1:NewButton({Title = "Skip", Callback = function()
    SkipChapter()
end})
B1C2_1 = _B1C2_TAB:NewSection({ Title = "Automatic", Icon = icons.control, Position = "Left" })
B1C2_1:NewButton({Title = "Skip", Callback = function()
    SkipChapter()
end})
B1C3_1 = _B1C3_TAB:NewSection({ Title = "Automatic", Icon = icons.control, Position = "Left" })
B1C3_1:NewButton({Title = "Skip", Callback = function()
    SkipChapter()
end})
B1C3_1:NewToggle({Title = "Disable Damage Omukade", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})


B1C4_0 = _B1C4_TAB:NewSection({ Title = "Setting", Icon = icons.setting, Position = "Left" })
B1C4_1 = _B1C4_TAB:NewSection({ Title = "House [Section 1]", Icon = icons.home, Position = "Right" })
B1C4_2 = _B1C4_TAB:NewSection({ Title = "Butterfly [Section 2]", Icon = icons.butterfly, Position = "Left" })
B1C4_3 = _B1C4_TAB:NewSection({ Title = "Armor [Section 3]", Icon = icons.armor, Position = "Right" })
B1C4_4 = _B1C4_TAB:NewSection({ Title = "Heart [Section 4]", Icon = icons.heart, Position = "Left" })
B1C4_5 = _B1C4_TAB:NewSection({ Title = "Boss [Section 5]", Icon = icons.boss, Position = "Right" })
B1C4_0:NewToggle({Title = "Automatic Click", Default = false, Callback = function(v) 
    if v then
        _G.EzClick = true
        autoClickActive = true
        coroutine.wrap(function()
            while autoClickActive and _G.EzClick do
                clickMiddleOfScreen()
                task.wait(0.1)
            end
        end)()
    else
        autoClickActive = false
        _G.EzClick = false
    end
end})
B1C4_1:NewButton({Title = "Skip", Callback = function()
    SkipChapter()
end})
B1C4_2:NewToggle({Title = "Automatic Butterflies", Default = false, Callback = function(tr) 
    if tr then
        _G.AutoB1C4_2 = true
        while _G.AutoB1C4_2 do
            Autobtfs()
            fire()
            task.wait(0.1)
        end
    else
        _G.AutoB1C4_2 = false
    end
end})
B1C4_3:NewToggle({Title = "Automatic Armors", Default = false, Callback = function(tr) 
    if tr then
        AutoArmors()
    else
        print("KUY")
    end
end})

B1C4_4:NewToggle({Title = "Automatic Hearts", Default = false, Callback = function(tr) 
    if tr then
        _G.AutoHeart = true
            if id == 7265397848 or id == 7251867574 then
            gameHearts = world:FindFirstChild("GameHearts")
            function PARTZ()
                if gameHearts and gameHearts:FindFirstChild("Heart") then
                    for _, v in pairs(gameHearts.Heart:GetChildren()) do
                        if v:IsA("Part") then
                            v.Rotation = Vector3.new(0, 0, 0)
                            v.CanCollide = true
                        end
                    end
                end
            end
            function toHeart()
                if gameHearts and gameHearts:FindFirstChild("Heart") then
                    for _, v in pairs(gameHearts.Heart:GetChildren()) do
                        if v:IsA("UnionOperation") then
                            v.Rotation = Vector3.new(0, 0, 0)
                            v.Size = Vector3.new(58, 58, 58)
                            targetPosition = v.CFrame * CFrame.new(0, 20, -3)
                            to(targetPosition)
                        end
                    end
                end
            end

            function check()
                if gameHearts then
                    found = false
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
            end

            while _G.AutoHeart do
                check()
                task.wait(0.1)
            end
        end
    else
        _G.AutoHeart = false
    end
end})
B1C4_5:NewToggle({
    Title = "Automatic Boss",
    Default = false,
    Callback = function(tr) 
        if tr then
            pcall(function()
                local part = Instance.new("Part")
                part.CFrame = CFrame.new(2760.362548828125, 263.2343444824219, 2701.247314453125)
                part.Size = Vector3.new(500, 3, 500)
                part.Material = Enum.Material.Neon
                part.Color = Color3.new(80/255, 109/255, 84/255)
                part.Anchored = true
                part.Parent = game.Workspace

                local bossMap = game.Workspace:FindFirstChild("BossMap")
                if bossMap then
                    bossMap:Destroy()
                end

                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local backpack = player:WaitForChild("Backpack")

                local function ModifyHandle(item)
                    local handle = item:FindFirstChild("Handle")
                    if handle then
                        handle.Size = Vector3.new(50, 50, 10)
                        handle.Massless = true
                    end
                end

                local function CheckKatana()
                    for _, item in pairs(character:GetChildren()) do
                        if item.Name == "Katana" then
                            ModifyHandle(item)
                            break
                        end
                    end

                    for _, item in pairs(backpack:GetChildren()) do
                        if item.Name == "Katana" then
                            ModifyHandle(item)
                            break
                        end
                    end
                end

                local RunService = game:GetService("RunService")
                local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
                local moving = false
                local targetPart = nil
                local speed = 1.6
                local radius = 30
                local angle = 0
                local heartbeatConnection

                local function moveAroundTarget()
                    angle = angle + speed * RunService.Heartbeat:Wait()
                    local xOffset = math.cos(angle) * radius
                    local zOffset = math.sin(angle) * radius
                    local newPosition = Vector3.new(targetPart.Position.X + xOffset, humanoidRootPart.Position.Y, targetPart.Position.Z + zOffset)
                    humanoidRootPart.CFrame = CFrame.new(newPosition, targetPart.Position)
                end

                local function TeleportOn()
                    moving = true
                    targetPart = nil

                    local gameHearts = game:GetService("Workspace"):FindFirstChild("GameHearts")
                    local foundHeart = false

                    if gameHearts then
                        for _, v in pairs(gameHearts:GetChildren()) do
                            if v.Name == "Heart" then
                                foundHeart = true
                                return
                            end
                        end
                    end

                    if not foundHeart then
                        for _, v in ipairs(game:GetService("Workspace").BossBattle:GetDescendants()) do
                            if v.Name == "SpiderHitbox" and v:IsA("BasePart") then
                                targetPart = v
                                break
                            end
                        end

                        if targetPart then
                            heartbeatConnection = RunService.Heartbeat:Connect(function()
                                if moving then
                                    moveAroundTarget()
                                end
                            end)
                        else
                            wait(5)
                        end
                    end
                end

                function TeleportOff()
                    moving = false
                    if heartbeatConnection then
                        heartbeatConnection:Disconnect()
                        heartbeatConnection = nil
                    end
                end

                function Hitboxz()
                    for _, v in pairs(game:GetService("Workspace").BossBattle:GetChildren()) do
                        if v:IsA("Model") then
                            local spiderHitbox = v:FindFirstChild("SpiderHitbox")
                            if spiderHitbox then
                                spiderHitbox.Rotation = Vector3.new(0, 0, 0)
                                spiderHitbox.Size = Vector3.new(30, 30, 30)
                                spiderHitbox.Transparency = 0.9
                            end
                        end
                    end
                end

                task.wait(0.2)
                world.Gravity = 150
                Hitboxz()
                TeleportOn()
                CheckKatana()
            end)
        else
            TeleportOff()
        end
    end
})

B2C1_0 = _B2C1_TAB:NewSection({ Title = "Office [Section 1]", Icon = icons.city, Position = "Left" })
B2C1_1 = _B2C1_TAB:NewSection({ Title = "Rats [Section 2]", Icon = icons.rat, Position = "Right" })
B2C1_2 = _B2C1_TAB:NewSection({ Title = "Snake [Section 3]", Icon = icons.nagisa, Position = "Left" })
B2C1_3 = _B2C1_TAB:NewSection({ Title = "Town [Section 4]", Icon = icons.town, Position = "Right" })
B2C1_4 = _B2C1_TAB:NewSection({ Title = "Picture [Section 5]", Icon = icons.candle, Position = "Left" })
B2C1_5 = _B2C1_TAB:NewSection({ Title = "Ship [Section 6]", Icon = icons.ship, Position = "Right" })
B2C1_6 = _B2C1_TAB:NewSection({ Title = "Candle 🟢 [Section 7]", Icon = icons.candle12345, Position = "Left" })
B2C1_6x = _B2C1_TAB:NewSection({ Title = "Candle 🔴 [Section 7]", Icon = icons.candle12345, Position = "Left" })
B2C1_7 = _B2C1_TAB:NewSection({ Title = "Candle [Section 8]", Icon = icons.sea, Position = "Right" })

B2C1_0:NewButton({Title = "Enter Office", Callback = function()
    to(CFrame.new(-1778.0726318359375, 9.717201232910156, -4295.62109375))
end})
B2C1_1:NewButton({Title = "Read Book", Callback = function()
    to(CFrame.new(-1674.8272705078125, -21.01018524169922, -3402.390869140625))
	task.wait(0.5)
	fire()
end})
B2C1_1:NewTitle("Quest")
B2C1_1:NewButton({Title = "Automatic Rats", Callback = function()
    coroutine.wrap(Ratfind)()
end})
B2C1_1:NewButton({Title = "Escape", Callback = function()
    to(CFrame.new(-1507.8475341796875, -29.25138282775879, -3418.783447265625))
    task.wait(0.5)
    fire()
end})
B2C1_1:NewButton({Title = "Run", Callback = function()
    to(CFrame.new(-961.4176635742188, -46.48267364501953, -3601.613525390625))
end})
B2C1_2:NewButton({Title = "Enter Cave", Callback = function()
    to(CFrame.new(583.685546875, 567.3634643554688, -365.7061462402344))
end})
B2C1_2:NewButton({Title = "Run", Callback = function()
    to(CFrame.new(3866.74462890625, 140.48388671875, 10.994720458984375))
end})
B2C1_3:NewButton({Title = "Talk", Callback = function()
    to(CFrame.new(-323.47344970703125, 20.420881271362305, 3653.791748046875))
	task.wait(1)
	fire()
end})
B2C1_3:NewButton({Title = "Automatic Unlock Door", Callback = function()
    to(CFrame.new(-401.7100, 3069.5759, 3867.8293))
	task.wait(1)
	fire()
	fire()
	task.wait(0.5)
	to(CFrame.new(-387.2115783691406, 19.296314239501953, 3780.984130859375))
	task.wait(1)
	fire()
	fire()
end})
B2C1_3:NewTitle("House")
B2C1_3:NewButton({Title = "House 1", Callback = function()
    to(B2c1pos.home1)
end})
B2C1_3:NewButton({Title = "House 2", Callback = function()
    to(B2c1pos.home2)
end})
B2C1_3:NewButton({Title = "Drawing House", Callback = function()
    to(B2c1pos.Dwhome)
end})
B2C1_3:NewButton({Title = "House 4", Callback = function()
    to(B2c1pos.home4)
end})
B2C1_3:NewButton({Title = "House 5", Callback = function()
    to(B2c1pos.home5)
end})
B2C1_4:NewButton({Title = "Old Man", Callback = function()
    to(B2c1pos.man)
end})
B2C1_4:NewButton({Title = "Red Samurai", Callback = function()
    to(B2c1pos.red)
end})
B2C1_4:NewButton({Title = "Blue Samarai", Callback = function()
    to(B2c1pos.blue)
end})
B2C1_4:NewButton({Title = "Fox Girl", Callback = function()
    to(B2c1pos.fox)
end})
B2C1_4:NewButton({Title = "Mom & Son", Callback = function()
    to(B2c1pos.Momson)
end})
B2C1_4:NewButton({Title = "Girl & Flute", Callback = function()
    to(B2c1pos.flute)
end})
B2C1_4:NewButton({Title = "Hustband & Wife", Callback = function()
    to(B2c1pos.love)
end})
B2C1_4:NewButton({Title = "Umbrella Girl", Callback = function()
    to(B2c1pos.UM)
end})
B2C1_4:NewButton({Title = "Girl & Chicken", Callback = function()
    to(B2c1pos.Chicken)
end})
B2C1_4:NewTitle("Orb")
B2C1_4:NewButton({Title = "Automatic Orb", Callback = function()
    to(B2c1pos.ORB)
	task.wait(0.3)
	fire()
	task.wait(0.3)
    to(CFrame.new(-323.47344970703125, 20.420881271362305, 3653.791748046875))
    task.wait(1)
    fire()
end})
B2C1_5:NewButton({Title = "Enter Ship", Callback = function()
    to(CFrame.new(-1250.797119140625, 4.000001430511475, 6282.77197265625))
end})
B2C1_6:NewButton({Title = "To Oxygen", Callback = function()
    nofall()
    to(B2c1pos.OX)
    task.wait(0.3)
    fall()
end})
B2C1_6:NewTitle("Midle Floor")
B2C1_6:NewButton({Title = "Candle 1", Callback = function()
    nofall()
    to(B2c1pos.Candle21)
    task.wait(0.3)
    fall()
end})
B2C1_6:NewTitle("Upper Floor")
B2C1_6:NewButton({Title = "Candle 1", Callback = function()
    nofall()
    to(B2c1pos.Candle31)
    task.wait(0.3)
    fall()
end})
B2C1_6:NewButton({Title = "Candle 2", Callback = function()
    nofall()
    to(B2c1pos.Candle32)
    task.wait(0.3)
    fall()
end})
B2C1_6:NewButton({Title = "Candle 3", Callback = function()
    to(B2c1pos.Candle33)
end})
B2C1_6:NewTitle("Lower Floor")
B2C1_6:NewButton({Title = "Candle 1", Callback = function()
    nofall()
    to(B2c1pos.Candle11)
    task.wait(0.3)
    fall()
end})
B2C1_6:NewButton({Title = "Candle 2", Callback = function()
    nofall()
    to(B2c1pos.Candle12)
    task.wait(0.3)
    fall()
end})
B2C1_6:NewButton({Title = "Candle 3", Callback = function()
    nofall()
    to(B2c1pos.Candle13)
    task.wait(0.3)
    fall()
end})
B2C1_6:NewButton({Title = "Candle 4", Callback = function()
    nofall()
    to(B2c1pos.Candle14)
    task.wait(0.3)
    fall()
end})
B2C1_6:NewButton({Title = "Candle 5", Callback = function()
    nofall()
    to(B2c1pos.Candle15)
    task.wait(0.3)
    fall()
end})
B2C1_6:NewTitle("Run")
B2C1_6:NewButton({Title = "Run", Callback = function()
    to(CFrame.new(-6318.65966796875, 419.03302001953125, 6330.75830078125))
end})
B2C1_6x:NewButton({Title = "Automatic Floor 1", Callback = function()
    coroutine.wrap(floor1)()
end})
B2C1_6x:NewButton({Title = "Automatic Floor 2", Callback = function()
    coroutine.wrap(floor2)()
end})
B2C1_6x:NewButton({Title = "Automatic Floor 3", Callback = function()
    coroutine.wrap(floor3)()
end})
B2C1_6x:NewTitle("Run")
B2C1_6x:NewButton({Title = "Run", Callback = function()
    to(CFrame.new(-6318.65966796875, 419.03302001953125, 6330.75830078125))
end})

B2C1_7:NewButton({Title = "Automatic Escape", Callback = function()
    to(CFrame.new(-10035.9756, 421.733154, 7278.47949, 0.00383073092, 0.0287271589, 0.999580026, 0.0457166582, 0.998537123, -0.0288723968, -0.998947144, 0.0458080582, 0.00251185894))
end})



B2C2_s = _B2C2_TAB:NewSection({ Title = "Setting", Icon = icons.setting, Position = "Left" })
B2C2_0 = _B2C2_TAB:NewSection({ Title = "Ocean [Section 1]", Icon = icons.sea, Position = "Left" })
B2C2_1 = _B2C2_TAB:NewSection({ Title = "Cow [Section 1.5]", Icon = icons.cow, Position = "Right" })
B2C2_2 = _B2C2_TAB:NewSection({ Title = "Meat [Section 2]", Icon = icons.meat, Position = "Left" })
B2C2_3 = _B2C2_TAB:NewSection({ Title = "Skeleton [Section 3]", Icon = icons.skull, Position = "Right" })
B2C2_4 = _B2C2_TAB:NewSection({ Title = "Levers [Section 4]", Icon = icons.lever, Position = "Left" })
B2C2_5 = _B2C2_TAB:NewSection({ Title = "Cook [Section 5]", Icon = icons.cook, Position = "Right" })
B2C2_6 = _B2C2_TAB:NewSection({ Title = "Curse [Section 6]", Icon = icons.curse, Position = "Left" })
B2C2_7 = _B2C2_TAB:NewSection({ Title = "Tower [Section 6.5]", Icon = icons.tower, Position = "Right" })
B2C2_8 = _B2C2_TAB:NewSection({ Title = "Kid [Section 7]", Icon = icons.kid, Position = "Left" })
B2C2_9 = _B2C2_TAB:NewSection({ Title = "Note [Section 7.5]", Icon = icons.note, Position = "Right" })
B2C2_10 = _B2C2_TAB:NewSection({ Title = "Boss [Section 8]", Icon = icons.nagisa, Position = "Left" })
B2C2_11 = _B2C2_TAB:NewSection({ Title = "Boss 2 [Section 8.5]", Icon = icons.boss, Position = "Right" })
B2C2_s:NewToggle({Title = "Automatic Click", Default = false, Callback = function(tr) 
    if tr then
        OnClick()
    else
        OffClick()
    end
end})
B2C2_0:NewButton({Title = "Automatic Skip Ocean", Callback = function()
    SkipOcean()
end})
B2C2_1:NewButton({Title = "Automatic Skip Cow", Callback = function()
    Skipcow()
end})
B2C2_2:NewButton({Title = "Talk", Callback = function()
    to(B2c2pos.talk)
    task.wait(1)
end})
B2C2_2:NewTitle("After Talk [Dont Click Again]")
B2C2_2:NewButton({Title = "Enter Meat Room", Callback = function()
    getmeat()
end})
B2C2_2:NewButton({Title = "Back [Bypass]", Callback = function()
    to(B2c2pos.Bypass)
    countdown(10)
    to(B2c2pos.talk)
    task.wait(0.3)
    fire()
end})
B2C2_2:NewTitle("Door")
B2C2_2:NewButton({Title = "Automatic Escape", Callback = function()
    EndMeat()
end})
B2C2_3:NewButton({Title = "Enter Cutscene", Callback = function()
    to(B2c2pos.skele)
end})
B2C2_3:NewButton({Title = "Run", Callback = function()
    to(B2c2pos.endskele)
end})
B2C2_4:NewButton({Title = "Enter Zone", Callback = function()
    to(B2c2pos.startlever)
end})
B2C2_4:NewToggle({Title = "Automatic Levers", Default = false, Callback = function(tr) 
    if tr then
        _G.AutoLevers = true
        while _G.AutoLevers do
            Levers()
                fire()
            task.wait(0.1)
        end
    else
        if _G.AutoLevers then
            _G.AutoLevers = false
        end
    end
end})
B2C2_4:NewButton({Title = "Escape", Callback = function()
    to(B2c2pos.endlever)
end})
B2C2_5:NewButton({Title = "Enter Zone", Callback = function()
    to(B2c2pos.StartCook)
end})
B2C2_5:NewButton({Title = "Automatic Eyeball", Callback = function()
    coroutine.wrap(EyeBall)()
end})
B2C2_5:NewButton({Title = "Automatic Ham", Callback = function()
    coroutine.wrap(ham)()
end})
B2C2_5:NewButton({Title = "Automatic Chicken", Callback = function()
    coroutine.wrap(Chick)()
end})
B2C2_5:NewTitle("Escape")
B2C2_5:NewButton({Title = "Run", Callback = function()
    to(B2c2pos.EndCook)
end})
B2C2_6:NewButton({Title = "Automatic Skip", Callback = function()
    to(CFrame.new(-4079.585205078125, 743.8174438476562, -948.4310302734375))
end})
B2C2_7:NewButton({Title = "Teleport Puzzle", Callback = function()
    toPuzzle()
end})
B2C2_7:NewTitle("Off Safe Mode if Finish Part.")
B2C2_7:NewToggle({Title = "Safe Mode", Default = false, Callback = function(tr) 
        if tr then
        _G.Safetower = true
        while _G.Safetower do
                SafeTower()
        task.wait(0.1)
        end
    else
        _G.Safetower = false
    end
end})
B2C2_7:NewButton({Title = "Escape", Callback = function()
    to(CFrame.new(-4079.585205078125, 743.8174438476562, -948.4310302734375))
end})
B2C2_8:NewButton({Title = "Automatic Kid", Callback = function()
    coroutine.wrap(FindKid)()
end})
B2C2_8:NewButton({Title = "Teleport Door", Callback = function()
    coroutine.wrap(Togate)()
end})
B2C2_9:NewToggle({Title = "Automatic Notes", Default = false, Callback = function(tr) 
    if tr then
        _G.AutoNotes = true
        while _G.AutoNotes do
            FNote()
                fire()
            task.wait(0.1)
        end
    else
    _G.AutoNotes = false
    end
end})
B2C2_10:NewToggle({Title = "Automatic Ammo", Default = false, Callback = function(tr) 
    if tr then
            _G.Ammo = true
        while _G.Ammo do
                Ballprompt()
            task.wait(0.1)
        end
    else
        _G.Ammo = false
    end
end})
B2C2_11:NewButton({Title = "Get Cutlass", Callback = function()
    to(CFrame.new(1971.5081787109375, 57.84920120239258, -4733.85498046875))
    task.wait(0.3)
    fire()
    task.wait(0.3)
    to(CFrame.new(2025.055419921875, 129.0679473876953, -4738.908203125))
end})
B2C2_11:NewToggle({Title = "Automatic Boss 2", Default = false, Callback = function(tr) 
    if tr then
            _G.AutoNure2 = true
        while _G.AutoNure2 do
            Boss2()
            to(CFrame.new(2025.055419921875, 129.0679473876953, -4738.908203125))
                coroutine.wrap(OnClick)()
            task.wait(0.1)
        end
    else
        _G.AutoNure2 = false
        coroutine.wrap(OffClick)()
    end
end})

B2C3_s = _B2C3_TAB:NewSection({ Title = "Setting", Icon = icons.setting, Position = "Left" })
B2C3_0 = _B2C3_TAB:NewSection({ Title = "Hell [Section 1]", Icon = icons.mezu, Position = "Left" })
B2C3_1 = _B2C3_TAB:NewSection({ Title = "Heart [Section 1.5]", Icon = icons.heart, Position = "Right" })
B2C3_2 = _B2C3_TAB:NewSection({ Title = "Torch [Section 2]", Icon = icons.torch, Position = "Left" })
B2C3_3 = _B2C3_TAB:NewSection({ Title = "Puzzle [Section 3]", Icon = icons.puzzle, Position = "Right" })
B2C3_4 = _B2C3_TAB:NewSection({ Title = "Silk [Section 4]", Icon = icons.boat, Position = "Left" })
B2C3_5 = _B2C3_TAB:NewSection({ Title = "Dad [Section 5]", Icon = icons.dad, Position = "Right" })
B2C3_6 = _B2C3_TAB:NewSection({ Title = "Train [Section 6]", Icon = icons.train, Position = "Left" })
B2C3_7 = _B2C3_TAB:NewSection({ Title = "Larve [Section 7]", Icon = icons.larve, Position = "Right" })
B2C3_8 = _B2C3_TAB:NewSection({ Title = "Mud [Section 8]", Icon = icons.train, Position = "Left" })
B2C3_9 = _B2C3_TAB:NewSection({ Title = "Tree [Section 9]", Icon = icons.tree, Position = "Right" })
B2C3_10 = _B2C3_TAB:NewSection({ Title = "Boss [Section 9.5]", Icon = icons.boss, Position = "Left" })
B2C3_11 = _B2C3_TAB:NewSection({ Title = "Shinigami [Section 10]", Icon = icons.jigoku, Position = "Right" })
B2C3_s:NewToggle({Title = "Automatic Free Yourslef [E]", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
B2C3_s:NewToggle({Title = "Automatic Collect Coin", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
B2C3_s:NewToggle({Title = "Aimbot Yurie", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
B2C3_0:NewButton({Title = "Automatic Skip", Callback = function()
    to(CFrame.new(-556.6293334960938, 13.464599609375, 418.3713684082031))
end})
B2C3_1:NewButton({Title = "Talk", Callback = function()
    to(CFrame.new(-133.26031494140625, 45.464569091796875, 68.60448455810547))
    task.wait(1)
    fire()
end})
B2C3_1:NewButton({Title = "Automatic Hearts", Callback = function()
    heartCollect()
end})
B2C3_1:NewTitle("Escape")
B2C3_1:NewButton({Title = "Run [Bypass]", Callback = function()
    
end})
B2C3_2:NewButton({Title = "Automatic Craft", Callback = function()
    
end})
B2C3_2:NewTitle("Escape")
B2C3_2:NewButton({Title = "Automatic Escape", Callback = function()
    
end})
B2C3_3:NewToggle({Title = "Automatic Yeird", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
B2C3_3:NewTitle("🟢 : Safe")
B2C3_3:NewTitle("🟡 : Warning")
B2C3_3:NewTitle("🔴 : Yeird [Don't Move]")
B2C3_3:NewToggle({Title = "Dodomeki Paramiter", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
B2C3_3:NewButton({Title = "Puzzle 1", Callback = function()
    
end})
B2C3_3:NewButton({Title = "Puzzle 2", Callback = function()
    
end})
B2C3_3:NewButton({Title = "Puzzle 3", Callback = function()
    
end})
B2C3_3:NewButton({Title = "Puzzle 4", Callback = function()
    
end})
B2C3_3:NewButton({Title = "Puzzle 5", Callback = function()
    
end})
B2C3_3:NewButton({Title = "Puzzle 6", Callback = function()
    
end})
B2C3_3:NewTitle("Door")
B2C3_3:NewButton({Title = "Puzzle Door", Callback = function()
    
end})
B2C3_3:NewTitle("Escape")
B2C3_3:NewButton({Title = "Run", Callback = function()
    
end})
B2C3_4:NewButton({Title = "Enter Zone", Callback = function()
    
end})
B2C3_4:NewTitle("Silk")
B2C3_4:NewButton({Title = "Automatic Enzukai", Callback = function()
    
end})
B2C3_5:NewButton({Title = "Enter Zone", Callback = function()
    
end})
B2C3_5:NewButton({Title = "Teleport to Safe Zone", Callback = function()
    
end})
B2C3_5:NewTitle("Playing")
B2C3_5:NewToggle({Title = "Safe Mode", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
B2C3_6:NewButton({Title = "Enter Zone", Callback = function()
    
end})
B2C3_7:NewButton({Title = "Automatic Larve", Callback = function()
    
end})
B2C3_8:NewButton({Title = "Automatic Mud", Callback = function()
    
end})
B2C3_9:NewToggle({Title = "Highlight Item", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})

B2C3_9:NewButton({Title = "House 1", Callback = function()
    
end})
B2C3_9:NewButton({Title = "House 2", Callback = function()
    
end})
B2C3_9:NewButton({Title = "House 3", Callback = function()
    
end})
B2C3_9:NewButton({Title = "House 4", Callback = function()
    
end})
B2C3_10:NewButton({Title = "Automatic Katana", Callback = function()
    
end})
B2C3_10:NewButton({Title = "Teleport to Safe Zone", Callback = function()
    
end})
B2C3_11:NewButton({Title = "Talk Shinigami", Callback = function()
    
end})
B2C3_11:NewButton({Title = "Run", Callback = function()
    
end})

TWT_10 = _TWT_TAB:NewSection({ Title = "Automatic", Icon = icons.skip, Position = "Left" })
TWT_2 = _TWT_TAB:NewSection({ Title = "Help [III]", Icon = icons.quest, Position = "Right" })
TWT_10:NewButton({Title = "Skip", Callback = function()
    
end})
TWT_10:NewToggle({Title = "ESP Item", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
TWT_2:NewButton({Title = "Puzzle 1", Callback = function()
    
end})
TWT_2:NewButton({Title = "Puzzle 2", Callback = function()
    
end})
TWT_2:NewTitle("Quest")
TWT_2:NewButton({Title = "Automatic Spirit", Callback = function()
    
end})

XMAS1 = _XMAS_TAB:NewSection({ Title = "Repair", Icon = icons.sleing, Position = "Left" })
XMAS2 = _XMAS_TAB:NewSection({ Title = "Toys", Icon = icons.toy, Position = "Right" })
XMAS3 = _XMAS_TAB:NewSection({ Title = "Key", Icon = icons.key, Position = "Left" })
XMAS1:NewButton({Title = "Automatic Repair", Callback = function()
    
end})
XMAS2:NewToggle({Title = "Automatic Toys", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
XMAS1:NewButton({Title = "Automatic Key", Callback = function()
    
end})
HWs = _HW_TAB:NewSection({ Title = "Events", Icon = icons.bookmark, Position = "Left" })
HW1 = _HW_TAB:NewSection({ Title = "Pumpkins", Icon = icons.pumpkin, Position = "Left" })
HW2 = _HW_TAB:NewSection({ Title = "Candle", Icon = icons.candle12345, Position = "Right" })
HW3 = _HW_TAB:NewSection({ Title = "Pumpkins", Icon = icons.pumpkin, Position = "Left" })
HW1:NewButton({Title = "Automatic Pumpkins", Callback = function()
    to(CFrame.new(-350.75262451171875, 0.7718197107315063, -158.2923126220703))
    task.wait(0.3)
    fireSeclect("GameInfo")
    task.wait(0.3)
    to(CFrame.new(-355.9704895019531, -20.206695556640625, -62.0767936706543))
    task.wait(0.3)
    fireSeclect("GameInfo")
    task.wait(0.3)
    to(CFrame.new(-204.78793334960938, -19.988222122192383, -157.39425659179688))
    task.wait(0.3)
    fireSeclect("GameInfo")
    task.wait(0.3)
    to(CFrame.new(-354.656982421875, -19.969240188598633, -167.6837921142578))
    task.wait(0.3)
    Equip("pumpkin")
    fireSeclect("Well")
    Equip("pumpkin")
    fireSeclect("Well")
    Equip("pumpkin")
    fireSeclect("Well")
end})
HW2:NewButton({Title = "Automatic 1 Candle", Callback = function()
    hw2()
end})
HW3:NewButton({Title = "Automatic Pumpkins", Callback = function()
    bat()
    task.wait(0.2)
    fireSeclect("Bats")
    task.wait(0.2)
    bat()
    task.wait(0.2)
    fireSeclect("Bats")
    task.wait(0.2)
    eye()
    task.wait(0.2)
    fireSeclect("Eyes")
    task.wait(0.2)
    eye()
    task.wait(0.2)
    fireSeclect("Eyes")
    task.wait(0.2)
    eye()
    task.wait(0.2)
    fireSeclect("Roses")
    task.wait(0.2)
    rose()
    task.wait(0.2)
    fireSeclect("Roses")
    task.wait(0.2)
    rose()
    task.wait(0.2)
    fireSeclect("Roses")
    task.wait(0.2)
    rose()
    task.wait(0.2)
    fireSeclect("Roses")
    task.wait(0.2)
    snake()
    task.wait(0.2)
    fireSeclect("Snakes")
    task.wait(0.2)
    to(CFrame.new(95.22450256347656, 36.999996185302734, 240.80474853515625))
    task.wait(0.2)
    fire()
    task.wait(0.2)
    fire()
    task.wait(0.2)
    fire()
    task.wait(0.2)
    fire()
    task.wait(0.2)
    fire()
    task.wait(0.2)
    fire()
    task.wait(0.2)
    fire()
    task.wait(0.2)
    fire()
    task.wait(0.2)
end})

HWs:NewToggle({Title = "Automatic Candy", Default = false, Callback = function(tr) 
    if tr then
        _G.HW = true
            while _G.HW do
                task.wait(0)
                Eventhw()
                fireSeclect("Candy")
            end
    else
        _G.HW = false
    end
end})
NC1 = _NCC_TAB:NewSection({ Title = "Boxs", Icon = icons.box, Position = "Left" })
NC2 = _NCC_TAB:NewSection({ Title = "Cards", Icon = icons.card, Position = "Right" })
NC3 = _NCC_TAB:NewSection({ Title = "Boss", Icon = icons.ringmasterhat, Position = "Left" })
NC1:NewButton({Title = "Skip [Required Solo]", Callback = function()
    
end})
NC1:NewTitle("Boxs")
NC1:NewButton({Title = "Box 1", Callback = function()
    
end})
NC1:NewButton({Title = "Box 2", Callback = function()
    
end})
NC1:NewButton({Title = "Box 3", Callback = function()
    
end})
NC1:NewButton({Title = "Box 4", Callback = function()
    
end})
NC1:NewButton({Title = "Box 5", Callback = function()
    
end})
NC1:NewButton({Title = "Box 6", Callback = function()
    
end})
NC1:NewButton({Title = "Box 7", Callback = function()
    
end})
NC2:NewButton({Title = "Teleport Cards Zone", Callback = function()
    
end})
NC2:NewButton({Title = "Teleport Safe Zone", Callback = function()
    
end})
NC2:NewToggle({Title = "Automatic Cards", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
NC2:NewToggle({Title = "Show Card", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})
NC3:NewButton({Title = "Get Knife", Callback = function()
    
end})
NC3:NewToggle({Title = "Automatic Boss", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})

CS1 = _CS_TAB:NewSection({ Title = "Automatic", Icon = icons.skip, Position = "Left" })
CS1:NewButton({Title = "Skip", Callback = function()
    
end})
CS1:NewToggle({Title = "ESP Item", Default = false, Callback = function(tr) 
    if tr then

    else

    end
end})

DC1 = _DC_TAB:NewSection({ Title = "Automatic", Icon = icons.orb, Position = "Left" })
DC1:NewTitle("Quest")
DC1:NewButton({Title = "Automatic Orbs", Callback = function()
    
end})

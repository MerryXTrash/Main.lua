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
Setting_main:NewToggle({Title = "Fullbright", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_main:NewToggle({Title = "Fly", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_main:NewToggle({Title = "Noclip", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_main:NewToggle({Title = "No Cooldown Prompt", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_main:NewSlider({Title = "Speed", Min = 25, Max = 175, Default = 25, Callback = function(a) 
    print(a) 
end})
Setting_main:NewSlider({Title = "Fly Speed", Min = 1, Max = 10, Default = 1, Callback = function(a) 
    print(a) 
end})
Setting_display:NewToggle({Title = "View FPS", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_display:NewButton({Title = "Reduce CPU", Callback = function()
    setclipboard('discord.gg/BH6pE7jesa')
end})
Setting_misc:NewToggle({Title = "Customize Button", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_misc:NewTitle("After On Customize Button, You Can Move Button")
Setting_misc:NewTitle("On = Start Setting / Off = Save Setting")
Setting_misc:NewToggle({Title = "Button Fire Prompt", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_misc:NewToggle({Title = "Button to Safe", Default = false, Callback = function(tr) 
    print(tr) 
end})

--teleportTAB
Teleport_main = _Teleport_TAB:NewSection({ Title = "Main", Icon = icons.home, Position = "Left" })
Teleport_b1 = _Teleport_TAB:NewSection({ Title = "Control's Book", Icon = icons.control, Position = "Right" })
Teleport_event = _Teleport_TAB:NewSection({ Title = "Event", Icon = icons.bookmark, Position = "Left" })
Teleport_gamemode = _Teleport_TAB:NewSection({ Title = "Gamemode", Icon = icons.ringmasterhat, Position = "Left" })
Teleport_b2 = _Teleport_TAB:NewSection({ Title = "Jelousy's Book", Icon = icons.home, Position = "Right" })

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
Catsus:NewTitle('The Mimic Classic')
Teleport_event:NewButton({Title = "Teleport Final Chapter 1", Callback = function()
    
end})
Teleport_event:NewButton({Title = "Teleport Final Chapter 2", Callback = function()
    
end})
Teleport_event:NewButton({Title = "Teleport Final Chapter 3", Callback = function()
    
end})

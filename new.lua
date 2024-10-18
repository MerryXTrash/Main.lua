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
    boss = "rbxassetid://117068825773483"
}


local NothingLibrary = loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/MerryXTrash/Main.lua/refs/heads/main/ByCatSus/Nothing.lua'))();
local Notification = NothingLibrary.Notification();

Notification.new({
	Title = "Notification",
	Description = "Example",
	Duration = 5,
	Icon = "rbxassetid://8997385628"
})

Windows = NothingLibrary.new({Title = "Overflow - The Mimic", Description = "Ultimate 5.0", Keybind = Enum.KeyCode.LeftControl, Logo = 'rbxassetid://108071484128599'})

--Tab
_General_TAB = Windows:NewTab({Title = "General", Description = "Info Script", Icon = icons.home })
_Setting_TAB = Windows:NewTab({ Title = "Setting", Description = "Functions", Icon = icons.setting })
_Teleport_TAB = Windows:NewTab({ Title = "Teleport", Description = "Quick Lanterns", Icon = icons.setting })
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
LNStatus = _General_TAB:NewSection({ Title = "Lantern Status 🛒", Icon = "rbxassetid://7733964719", Position = "Left" })
Status:NewTitle('Bypass : 🟢')
LNStatus:NewTitle("Control's Book")
LNStatus:NewTitle("The Butterfly's Spirit : 🟢")
LNStatus:NewTitle("The Corrupted : 🟢")
LNStatus:NewTitle("The Kusonoki : 🟢")
LNStatus:NewTitle("The Saigomo : 🟢")
LNStatus:NewTitle("               ")
LNStatus:NewTitle("Jelousy's Book")
LNStatus:NewTitle("The Kyogi : 🟢")
LNStatus:NewTitle("The Mio : 🟢")
LNStatus:NewTitle("The Chochin Obake : 🔴")
LNStatus:NewTitle("The Ponpon : 🔴")
LNStatus:NewTitle("The Nagisa : 🔴")
LNStatus:NewTitle("The Zuboshi : 🔴")
LNStatus:NewTitle("The Michiko : 🟢")
LNStatus:NewTitle("The Negibishoma : 🟢")
LNStatus:NewTitle("The Mochi : 🔴")
LNStatus:NewTitle("The Gozu & Mezu : 🔴")
LNStatus:NewTitle("               ")
LNStatus:NewTitle("Gamemode")
LNStatus:NewTitle("The Duality : 🟢")
LNStatus:NewTitle("The Kabocha : 🟢")
LNStatus:NewTitle("The Pumpkin : 🟢")
LNStatus:NewTitle("The Lampus : 🔴")
LNStatus:NewTitle("The Ballon's Jack : 🔴")
LNStatus:NewTitle("The Magic's Bunny : 🔴")
LNStatus:NewTitle("                ")
LNStatus:NewTitle("Event")
LNStatus:NewTitle("The Shinigami : 🟢")
LNStatus:NewTitle("The Hiachi 2021 : 🔴")
LNStatus:NewTitle("The Hiachi 2023 : 🔴")
LNStatus:NewTitle("The Chenoo : 🔴")
LNStatus:NewTitle("The Fujin : 🔴")
LNStatus:NewTitle("The Raijin : 🔴")
LNStatus:NewTitle("The Classic Hiachi : 🟢")
LNStatus:NewTitle("The Sinister's Bunny : 🔴")
LNStatus:NewTitle("The Samarai : 🟢")
LNStatus:NewTitle("                 ")
LNStatus:NewTitle("Gamepass")
LNStatus:NewTitle("The Three Eyed Monster : 🔴")
LNStatus:NewTitle("The X2 : 🔴")
LNStatus:NewTitle("The VIP : 🔴")
LNStatus:NewTitle("The Yurie : 🔴")
LNStatus:NewTitle("The Greedful Angel : 🔴")
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
Setting_misc:NewToggle({Title = "Button Fire Prompt", Default = false, Callback = function(tr) 
    print(tr) 
end})
Setting_misc:NewToggle({Title = "Button to Safe", Default = false, Callback = function(tr) 
    print(tr) 
end})

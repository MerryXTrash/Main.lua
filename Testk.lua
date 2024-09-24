local games = {
	[6296321810 or 6479231833 or 6301638949 or 6480994221] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/book1ch1.lua',
	[6373539583 or 6485055338 or 6406571212 or 6485055836 or 6425178683 or 6485056556] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1c2p1.lua',
	[6472459099 or 6688734180 or 6682163754 or 6688734313 or 6682164423 or 6688734395] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1c3p1.lua',
	[6243699076] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/LOBBY.lua', --lobby 1
	[7068737459] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/LOBBY.lua', --lobby 2
	[7068738088 and 7068951438] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/TwT.lua', --TwT1
	[7068951914 and 7068951914] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/TwT2.lua', --TwT2
	[15989427413] = '', --lobby
	[15996404472] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs1.lua', --1.1
	[15996407335] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs2.lua', --1.2
	[15996410294] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs3.lua', --2.1
	[15996411979] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs4.lua', --2.2
	[15996413469] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs5.lua', --2.3
	[15996414738] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs6.lua', --3.1
	[15996416081] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs7.lua', --3.2
	[15996417416] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs8.lua', --3.3
	[7068740106 and 7068952294] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/TwT3.lua',--TwT3
	[7618863566] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/Jigoku.lua'--jigoku
}

local currentPlaceId = game.PlaceId
local gameUrl = games[currentPlaceId]

if gameUrl then
	loadstring(game:HttpGet(gameUrl))()
end

local function normal()
local games = {
	[6296321810 or 6479231833 or 6301638949 or 6480994221] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/book1ch1.lua',
	[6373539583 or 6485055338 or 6406571212 or 6485055836 or 6425178683 or 6485056556] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1c2p1.lua',
	[6472459099 or 6688734180 or 6682163754 or 6688734313 or 6682164423 or 6688734395] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/b1c3p1.lua',
	[6243699076 or 15989427413 or 7068737459] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/LOBBY.lua', --lobby 1
	[7068738088 or 7068951438 or 7068951914 or 7068951914 or 7068740106 or 7068952294] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/TwT.lua', --TwT1
	[15996404472 or 15996407335 or 15996411979 or 15996410294 or 15996413469 or 15996414738 or 15996416081 or 15996417416] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/cs1.lua', --1.1
	[7618863566] = 'https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/Jigoku.lua'--jigoku
}

local currentPlaceId = game.PlaceId
local gameUrl = games[currentPlaceId]

if gameUrl then
	loadstring(game:HttpGet(gameUrl))()
end
end

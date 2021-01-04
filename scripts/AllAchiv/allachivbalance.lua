
reset_refund_percentage = _G.REFUND_CONFIG

levelxpcap = _G.LEVELXP
attributepointsOnLevel = _G.LEVELPOINTS

----------------------------
--[AMOUNT NEEDED TO COMPLETE]
----------------------------
allachiv_eventdata={
--Food
["firsteat"] = nil, 
["eatrata"] = 10, 
["eatfish"] = 10, 
["eatturkey"] = 10, 
["eathot"] = 10, 
["eatcold"] = 10, 
["danding"] = 10, 
["eatmole"] = 10,
["eatwaffle"] = 10,  
["supereat"] = 100, 
["alldiet"] = 40, 
--Life
["noob"] = nil,
["tooyoung"] = nil,
["rose"] = nil,
["shroom"] = nil,
["rot"] = nil,
["deathalot"] = 10,
["secondchance"] = nil,
["messiah"] = 5,
["sleeptent"] = 12,
["sleepsiesta"] = 12,
["reviveamulet"] = 3,
["feedplayer"] = 10,
--Work
["nature"] = 300,
["fishmaster"] = 100,
["pickappren"] = 750,
["pickmaster"] = 1500,
["chopappren"] = 150,
["chopmaster"] = 300,
["mineappren"] = 150,
["minemaster"] = 300,
["cookappren"] = 100,
["cookmaster"] = 200,
["buildappren"] = 500,
["buildmaster"] = 1000,
--Like
["goodman"] = 20,
["brother"] = 20,
["catperson"] = 20,
["spooder"] = 100,
["evil"] = 3,
["birdclop"] = nil,
["pet"] = nil,
["lavae"] = nil,
["fuzzy"] = 5,
--Pain
["burn"] = nil,
["freeze"] = nil,
["sleep"] = nil,
["starve"] = 600,
["nosanity"] = 600,
["icebody"] = 600,
["firebody"] = 600,
["moistbody"] = 600,
["evilflower"] = 20,
["roses"] = 3,
["drown"] = nil,
["lightning"] = nil,
--Fight
["angry"] = 100000,
["tank"] = 3000,
["fortress"] = 5000,
["dmgnodmg"] = 10000,
["whipit"] = 9001,
["whack"] = 5000,
["bullseye"] = 5000,
["sheep"] = nil,
["tentacruel"] = 10,
--Hunt
["goatperd"] = 5,
["mossling"] = 10,
["weetusk"] = 3,
["tentacool"] = 10,
["treeguard"] = 10,
["varg"] = 2,
["koalefant"] = 5,
["monkey"] = 15,
["horrorhound"] = 10,
["slurtle"] = 10,
["werepig"] = 15,
--Boss
["santa"] = nil,
["dragonfly"] = nil,
["malbatross"] = nil,
["knight"] = nil,
["bishop"] = nil,
["rook"] = nil,
["minotaur"] = nil,
["ancient"] = nil,
["rigid"] = nil,
["queen"] = nil,
["crabking"] = nil,
["king"] = nil,
--Misc
["intogame"] = nil,
["trader"] = 20,
["knowledge"] = nil,
["dance"] = 50,
["teleport"] = 25,
["birchnut"] = 5,
--Emer
["eatgold"] = 5,  
["eatefc"] = 2,
["eathorn"] = 1,
["eateye"] = 1,
["emerald"] = 10,
["goldcoin"] = 99,
["baronsuit"] = 1,
--["luck"] = nil,
--Mile
["all"] = nil,
["longage"] = 70,
["oldage"] = 350,
["walkalot"] = 60*300,
["stopalot"] = 60*90,
["caveage"] = 60*90,
["superstar"] = 100,
["rider"] = 60*20,
["fullsanity"] = 60*30,
["fullhunger"] = 60*30,
["pacifist"] = 60*60,
}
----------------------------
--[STAR AMOUNT]
----------------------------
allachiv_coinget={
--Food
["firsteat"] = 1,
["eatrata"] = 2,
["eatfish"] = 2,
["eatturkey"] = 2,
["eathot"] = 2,
["eatcold"] = 2,
["danding"] = 3,
["eatmole"] = 3,
["eatwaffle"] = 3,
["supereat"] = 3,
["alldiet"] = 12,
--Life
["noob"] = 1,
["tooyoung"] = 3,
["rose"] = 3,
["shroom"] = 2,
["rot"] = 3,
["deathalot"] = 2,
["secondchance"] = 3,
["messiah"] = 4,
["sleeptent"] = 2,
["sleepsiesta"] = 2,
["reviveamulet"] = 3,
["feedplayer"] = 2,
--Work
["nature"] = 3,
["fishmaster"] = 4,
["pickappren"] = 3,
["pickmaster"] = 4,
["chopappren"] = 3,
["chopmaster"] = 4,
["mineappren"] = 3,
["minemaster"] = 4,
["cookappren"] = 3,
["cookmaster"] = 5,
["buildappren"] = 3,
["buildmaster"] = 5,
--Like
["goodman"] = 3,
["brother"] = 3,
["catperson"] = 2,
["spooder"] = 4,
["evil"] = 2,
["birdclop"] = 4,
["pet"] = 2,
["lavae"] = 5,
["fuzzy"] = 4,
--Pain
["burn"] = 1,
["freeze"] = 1,
["sleep"] = 1,
["starve"] = 5,
["nosanity"] = 3,
["icebody"] = 4,
["firebody"] = 4,
["moistbody"] = 5,
["evilflower"] = 2,
["roses"] = 2,
["drown"] = 1,
["lightning"] = 3,
--Fight
["angry"] = 5,
["tank"] = 2,
["fortress"] = 5,
["dmgnodmg"] = 3,
["whipit"] = 3,
["whack"] = 3,
["bullseye"] = 4,
["sheep"] = 5,
["tentacruel"] = 5,
--Hunt
["goatperd"] = 4,
["mossling"] = 2,
["weetusk"] = 2,
["tentacool"] = 3,
["treeguard"] = 2,
["varg"] = 5,
["koalefant"] = 2,
["monkey"] = 3,
["horrorhound"] = 3,
["slurtle"] = 2,
["werepig"] = 2,
--Boss
["santa"] = 6,
["dragonfly"] = 3,
["malbatross"] = 5,
["knight"] = 3,
["bishop"] = 3,
["rook"] = 3,
["minotaur"] = 4,
["ancient"] = 9,
["rigid"] = 10,
["queen"] = 8,
["crabking"] = 7,
["king"] = 15,
--Misc
["intogame"] = 10,
["superstar"] = 5,
["trader"] = 3,
["knowledge"] = 4,
["dance"] = 1,
["teleport"] = 2,
["birchnut"] = 3,
--Emer
["emerald"] = 2,
["goldcoin"] = 2,
["baronsuit"] = 2,
["eatgold"] = 2,  
["eatefc"] = 3,
["eathorn"] = 3,
["eateye"] = 3,
--["luck"] = 10,
--["saddle"] = 4,
--["citrin"] = 3,
--["amber"] = 3,
--["banana"] = 3,
--["gnome"] = 3,
--Mile
["all"] = 25,
["longage"] = 4,
["oldage"] = 5,
["walkalot"] = 3,
["stopalot"] = 2,
["caveage"] = 2,
["rider"] = 2,
["fullsanity"] = 2,
["fullhunger"] = 2,
["pacifist"] = 3,
}

--奖励获得数值
allachiv_coindata={
["hungerup"] = 1,
["sanityup"] = 1,
["healthup"] = 1,
["crit"] = .005,
["scale"] = .01,
["krampusxmas"] = .03,
}

--奖励消耗点数
allachiv_coinuse={
["hungerup"] = math.ceil(1*_G.MULT_CONFIG),
["sanityup"] = math.ceil(1*_G.MULT_CONFIG),
["healthup"] = math.ceil(1*_G.MULT_CONFIG),
["crit"] = math.ceil(5*_G.MULT_CONFIG),
["scale"] = math.ceil(5*_G.MULT_CONFIG),
["krampusxmas"] = math.ceil(50*_G.MULT_CONFIG),
["pickmaster"] = math.ceil(99*_G.MULT_CONFIG),
["cookmaster"] = math.ceil(50*_G.MULT_CONFIG),
["artsdegree"] = math.ceil(99*_G.MULT_CONFIG),
["minemaster"] = math.ceil(50*_G.MULT_CONFIG),
["ancientstation"] = math.ceil(75*_G.MULT_CONFIG),
["lunarcraft"] = math.ceil(50*_G.MULT_CONFIG),
["businessowner"] = math.ceil(99*_G.MULT_CONFIG),
["animallover"] = math.ceil(50*_G.MULT_CONFIG),
}

levelcoststep={
["hunger"] = 999,
["sanity"] = 999,
["health"] = 999,
}
achievementcoststep={
["hungerup"] = 1,
["sanityup"] = 1,
["healthup"] = 1,
["crit"] = 1,
["scale"] = 1,
}

if not _G.COSTRAISE_CONFIG then
	levelcoststep={
	["hunger"] = 999,
	["sanity"] = 999,
	["health"] = 999,
	}
	achievementcoststep={
	["hungerup"] = 999,
	["sanityup"] = 999,
	["healthup"] = 999,
	["crit"] = 999,
	["scale"] = 999,
	}
end

foodmenu = { "baconeggs", "butterflymuffin", "dragonpie", "fishtacos",
			 "fishsticks", "jammypreserves", "flowersalad", "frogglebunwich",
			 "fruitmedley", "guacamole", "honeyham", "honeynuggets",
			 "icecream", "jellybean", "kabobs", "mandrakesoup",
			 "meatballs", "bonestew", "watermelonicle", "monsterlasagna",
			 "perogies", "powcake", "pumpkincookie", "ratatouille",
			 "hotchili", "stuffedeggplant", "taffy", "trailmix",
			 "turkeydinner", "unagi", "waffles", "wetgoop",
			 "asparagussoup", "bananapop", "mashedpotatoes", "potatotornado",
			 "salsa", "pepperpopper", "vegstinger", "ceviche"
}

rocklist = {"marbletree", "marblepillar",
			"rock_ice", "rock_ice_tall", "rock_ice_medium", "rock_ice_short",
			"stalagmite", "stalagmite_full", "stalagmite_med", "stalagmite_low", 
			"stalagmite_tall", "stalagmite_tall_full", "stalagmite_tall_med", "stalagmite_tall_low", 
}


heatfood = {"dragonpie", "honeyham", "kabobs", "hotchili", "stuffedeggplant", "turkeydinner", "dragonchilisalad", "winter_food8", "winter_food7"}
coldfood = {"watermelon", "watermelon_cooked", "fruitmedley", "ice", "watermelonicle", "icecream", "ceviche", "bananapop", "gazpacho", "winter_food9"}
magiclist = {"amulet", "blueamulet", "purpleamulet", "firestaff", "icestaff", "telestaff", "orangestaff", "greenstaff", "yellowstaff","orangeamulet", "greenamulet", "yellowamulet", "opalstaff",}
--[[veggie = { "butterflymuffin", "dragonpie", "jammypreserves", "flowersalad","fruitmedley", "icecream", "mandrakesoup", "watermelonicle","powcake", "pumpkincookie", "ratatouille", "stuffedeggplant","trailmix", "waffles", "wetgoop","asparagussoup", "bananapop", "mashedpotatoes", "potatotornado","salsa", "vegstinger"}
meats = {"baconeggs", "fishtacos", "fishsticks", "frogglebunwich", "guacamole", "honeyham", "honeynuggets", "kabobs", "meatballs", "bonestew", "monsterlasagna", "perogies", "hotchili", "turkeydinner",
 "unagi", "pepperpopper", "ceviche"}]]
AchievementData = {}
LevelData = {}			   
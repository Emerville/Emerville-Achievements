require "components/eventfunctions" 

--Basics
local function findprefab(list,prefab)
    for index,value in pairs(list) do
        if value == prefab then
            return true
        end
    end
end

local function findindex(list,prefab)
    for index,value in pairs(list) do
        if value == prefab then
            return index
        end
    end
end

local function copylist(list)
	local tmp = {}
	for index,value in pairs(list) do
		table.insert(tmp,list[index])
	end
	return tmp
end

local allachivevent = Class(function(self, inst)
    self.inst = inst
	--Food
    self.firsteat = false	
    self.eatamount = 0	
	self.eatrata = false
	self.eatrataamount = 0
	self.eatfish = false
	self.eatfishamount = 0
	self.eatturkey = false
	self.eatturkeyamount = 0
    self.eattemp = false
    self.eathot = false
    self.eatcold = false
    self.eathotamount = 0
    self.eatcoldamount = 0
    self.danding = false
    self.eatmonsterlasagna = 0
	self.eatmole = false
	self.eatmoleamount = 0	
	self.eatwaffle = false
	self.eatwaffleamount = 0
    self.supereat = false
    self.alldiet = false
    self.eatlist = copylist(foodmenu)
    self.eatall = 0	
	--Life
    self.noob = false
    self.tooyoung = false
	self.rose = false
	self.shroom = false
    self.rot = false
    self.deathalot = false
    self.deathamouth = 0
	self.secondchance = false	
    self.messiah = false
    self.respawnamount = 0
	self.sleeptent = false
	self.sleeptentamount = 0
	self.sleepsiesta = false
	self.sleepsiestaamount = 0
	self.reviveamulet = false
	self.reviveamuletamount = 0
	self.feedplayer = false
	self.feedplayeramount = 0
    --Work
	self.nature = false
	self.natureamount = 0
    self.fishmaster = false
    self.fishamount = 0
	self.pickappren = false
    self.pickmaster = false
    self.pickamount = 0
	self.chopappren = false
    self.chopmaster = false
    self.chopamount = 0
	self.mineappren = false
	self.minemaster = false
	self.mineamount = 0
	self.cookappren = false
    self.cookmaster = false
    self.cookamount = 0
	self.buildappren = false
    self.buildmaster = false
    self.buildamount = 0
    --Like	
    self.goodman = false
    self.brother = false
    self.friendpig = 0
    self.friendbunny = 0
	self.catperson = false
	self.friendcat = 0
	self.spooder = false
	self.friendspider = 0
    self.evil = false
    self.evilamount = 0
    self.pet = false
    self.birdclop = false
	self.lavae = false
	self.fuzzy = false
	self.fuzzyamount = 0
	--Pain
    self.burn = false
    self.freeze = false
	self.sleep = false
	self.starve = false
	self.starvetime = 0
    self.nosanity = false
    self.nosanitytime = 0
    self.icebody = false
    self.icetime = 0
    self.firebody = false
    self.firetime = 0
    self.moistbody = false
    self.moisttime = 0
	self.evilflower = false
	self.evilfloweramount = 0
	self.roses = false
	self.rosesamount = 0
	self.drown = false	
	self.lightning = false
	--Fight
    self.angry = false
    self.onhitdamage = 0
    self.tank = false
	self.fortress = false
    self.attackeddamage = 0	
	self.dmgnodmg = false
	self.dmgnodmgamount = 0
	self.whipit = false
	self.whipitamount = 0
	self.whack = false
	self.whackamount = 0
	self.bullseye = false
	self.bullseyeamount = 0
    self.sheep = false
	self.tentacruel = false
	self.tentacruelamount = 0
	--Hunt
    self.goatperd = false
    self.goatperdamount = 0
    self.mossling = false
    self.mosslingamount = 0
    self.weetusk = false
    self.weetuskamount = 0
    self.tentacool = false	
    self.tentacoolamount = 0
	self.treeguard = false
	self.treeguardamount = 0
	self.varg = false
	self.vargamount = 0
	self.koalefant = false
	self.koalefantamount = 0
	self.monkey = false
	self.monkeyamount = 0	
	self.horrorhound = false
	self.horrorhoundamount = 0
	self.slurtle = false
	self.slurtleamount = 0
	self.werepig = false
	self.werepigamount = 0
	--Boss
    self.santa = false
	self.dragonfly = false
	self.malbatross = false
    self.knight = false
    self.bishop = false
    self.rook = false
	self.minotaur = false
    self.ancient = false
    self.rigid = false
    self.queen = false	
	self.crabking = false
    self.king = false
    self.bosswinter = false
    self.bossspring = false
    self.bossantlion = false
    self.bossautumn = false
	--Misc
    self.intogame = false
    self.superstar = false
    self.starspent = 0	
	self.trader = false
	self.tradeamount = 0	
    self.knowledge = false
    self.knowledgeamount = 0
    self.dance = false
    self.danceamount = 0	
    self.teleport = false
    self.teleportamount = 0		
	self.birchnut = false
	self.birchnutamount = 0	
    --Emer
	self.eatgold = false
	self.eatgoldamount = 0
	self.eatefc = false
	self.eatefcamount = 0
	self.eathorn = false
	self.eathornamount = 0
	self.eateye = false
	self.eateyeamount = 0
	self.emerald = false
	self.emeralds = 0	
	self.goldcoin = false
	self.goldcoinamount = 0
	self.baronsuit = false
	self.baronsuitamount = 0
--[[self.luck = false	
    self.citrins = 0
	self.ambers = 0
	self.saddles = 0
	self.bananas = 0
	self.moonrocks = 0
	self.gnomes = 0
	self.citrin = false
	self.amber = false
	self.saddle = false
	self.banana = false
	self.moonrock = false
	self.gnome = false
]]
	--Mile
    self.all = false
    self.starreset = 0
	self.runcount = 0
    self.longage = false
    self.oldage = false
    self.age = 1
    self.agereset = 0
    self.walkalot = false
    self.walktime = 0
    self.stopalot = false
    self.stoptime = 0
    self.caveage = false
    self.cavetime = 0
	self.rider = false
	self.rideramount = 0
	self.fullsanity = false
	self.fullsanityamount = 0
	self.fullhunger = false
	self.fullhungeramount = 0
	self.pacifist = false
	self.pacifistamount = 0	
end,
nil,
{	
	--Food
    firsteat = checkfirsteat,
	eatfish = checkeatfish,
	eatfishamount = currenteatfish,
	eatturkey = checkeatturkey,
	eatturkeyamount = currenteatturkey,
	eatrata = checkeatrata,
	eatrataamount = currenteatrata,
    eathot = checkeathot,
    eathotamount = currenteathotamount,
    eatcold = checkeatcold,
    eatcoldamount = currenteatcoldamount,
    danding = checkdanding,
    eatmonsterlasagna = currenteatmonsterlasagna,	
	eatmole = checkeatmole,
	eatmoleamount = currenteatmole,	
	eatwaffle = checkeatwaffle,
	eatwaffleamount = currenteatwaffle,
    supereat = checksupereat,
    alldiet = checkalldiet,	
    eatall = currenteatall,
	eatlist = currenteatlist,	
    eatamount = currenteatamount,		
	--Life
    noob = checknoob,
    tooyoung = checktooyoung,
	rose = checkrose,
	shroom = checkshroom,	
    rot = checkrot,	
    deathalot = checkdeathalot,	
    deathamouth = currentdeathamouth,
	secondchance = checksecondchance,	
    messiah = checkmessiah,
    respawnamount = currentrespawnamount,
	sleeptent = checksleeptent,
	sleeptentamount = currentsleeptent,
	sleepsiesta = checksleepsiesta,
	sleepsiestaamount = currentsleepsiesta,
	reviveamulet = checkreviveamulet,
	reviveamuletamount = currentreviveamulet,
	feedplayer = checkfeedplayer,
	feedplayeramount = currentfeedplayer,
	--Work
	nature = checknature,
	natureamount = currentnatureamount,
    fishmaster = checkfishmaster,
    fishamount = currentfishamount,
	pickappren = checkpickappren,
    pickmaster = checkpickmaster,
    pickamount = currentpickamount,
	chopappren = checkchopappren,	
    chopmaster = checkchopmaster,
    chopamount = currentchopamount,
	mineappren = checkmineappren,
	minemaster = checkminemaster,
	mineamount = currentmineamount,	
	cookappren = checkcookappren,	
    cookmaster = checkcookmaster,
    cookamount = currentcookamount,
	buildappren = checkbuildappren,	
    buildmaster = checkbuildmaster,
    buildamount = currentbuildamount,	
	--Like
    goodman = checkgoodman,
    friendpig = currentfriendpig,
    brother = checkbrother,
    friendbunny = currentfriendbunny,
	catperson = checkcatperson,
	friendcat = currentfriendcat,	
	spooder = checkspooder,
	friendspider = currentfriendspider,	
    evil = checkevil,
    evilamount = currentevilamount,	
    pet = checkpet,
    birdclop = checkbirdclop,
	lavae = checklavae,
	fuzzy = checkfuzzy,
	fuzzyamount = currentfuzzyamount,
    --Pain
    burn = checkburn,
    freeze = checkfreeze,
	sleep = checksleep,
	starve = checkstarve,	
	starvetime = currentstarvetime,
    nosanity = checknosanity,
    nosanitytime = currentnosanitytime,
    icebody = checkicebody,
    icetime = currenticetime,
    firebody = checkfirebody,
    firetime = currentfiretime,
    moistbody = checkmoistbody,	
    moisttime = currentmoisttime,
	evilflower = checkevilflower,
	evilfloweramount = currentevilflower,
	roses = checkroses,
	rosesamount = currentroses,
	drown = checkdrown,
	lightning = checklightning,
	--Fight    
	angry = checkangry,
    onhitdamage = currentonhitdamage,
    tank = checktank,
	fortress = checkfortress,
    attackeddamage = currentattackeddamage,
	dmgnodmg = checkdmgnodmg,
	dmgnodmgamount = currentdmgnodmg,	
	whipit = checkwhipit,
	whipitamount = currentwhipit,
	whack = checkwhack,
	whackamount = currentwhack,		
	bullseye = checkbullseye,
	bullseyeamount = currentbullseye,
    sheep = checksheep,
	tentacruel = checktentacruel,
	tentacruelamount = currenttentacruelamount,
	--Hunt
    goatperd = checkgoatperd,
    goatperdamount = currentgoatperdamount,
    mossling = checkmossling,
    mosslingamount = currentmosslingamount,	
    weetusk = checkweetusk,
    weetuskamount = currentweetuskamount,
    tentacool = checktentacool,	
    tentacoolamount = currenttentacoolamount,
	treeguard = checktreeguard,
	treeguardamount = currenttreeguard,
	varg = checkvarg,
	vargamount = currentvarg,
	koalefant = checkkoalefant,
	koalefantamount = currentkoalefant,
	monkey = checkmonkey,
	monkeyamount = currentmonkey,
	horrorhound = checkhorrorhound,
	horrorhoundamount = currenthorrorhound,
	slurtle = checkslurtle,
	slurtleamount = currentslurtle,
	werepig = checkwerepig,
	werepigamount = currentwerepig,	
	--Boss
    santa = checksanta,
	dragonfly = checkdragonfly,
	malbatross = checkmalbatross,
    knight = checkknight,
    bishop = checkbishop,
    rook = checkrook,
	minotaur = checkminotaur,
    ancient = checkancient,	
    rigid = checkrigid,
    queen = checkqueen,
	crabking = checkcrabking,
    king = checkking,
    bosswinter = checkbosswinter,
    bossspring = checkbossspring,
    bossantlion = checkbossantlion,
    bossautumn = checkbossautumn,
	--Misc
    intogame = checkintogame,
    superstar = checksuperstar,
    starspent = currentstarspent,	
	trader = checktrader,
	tradeamount = currenttradeamount,	
    knowledge = checkknowledge,
    dance = checkdance,
    danceamount = currentdanceamount,
    teleport = checkteleport,
    teleportamount = currentteleportamount,	
	birchnut = checkbirchnut,
	birchnutamount = currentbirchnut,	
    --Emer
	eatgold = checkeatgold,
	eatgoldamount = currenteatgold,
	eatefc = checkeatefc,
	eatefcamount = currenteatefc,		
	eathorn = checkeathorn,
	eathornamount = currenteathorn,	
	eateye = checkeateye,
	eateyeamount = currenteateye,	
	emerald = checkemerald,
	emeralds = currentemeralds,	
	goldcoin = checkgoldcoin,
	goldcoinamount = currentgoldcoin,	
	baronsuit = checkbaronsuit,
	baronsuitamount = currentbaronsuit,
--[[luck = checkluck,	
	citrins = currentcitrins,
	ambers = currentambers,
	saddles = currentsaddles,
	bananas = currentbananas,
	moonrocks = currentmoonrocks,
	gnomes = currentgnomes,
	citrin = checkcitrin,
	amber = checkamber,
	saddle = checksaddle,
	banana = checkbanana,
	moonrock = checkmoonrock,
	gnome = checkgnome,]]
	--Mile
    all = checkall,
	runcount = currentruncount,
    longage = checklongage,
    oldage = checkoldage,
    age = currentage,	
    walkalot = checkwalkalot,
    walktime = currentwalktime,
    stopalot = checkstopalot,
    stoptime = currentstoptime,
    caveage = checkcaveage,
    cavetime = currentcavetime,
	rider = checkrider,
	rideramount = currentrider,
	fullsanity = checkfullsanity,
	fullsanityamount = currentfullsanity,
	fullhunger = checkfullhunger,
	fullhungeramount = currentfullhunger,
	pacifist = checkpacifist,
	pacifistamount = currentpacifist,
})

--Save
function allachivevent:OnSave()
    local data = {
		--Food
        firsteat = self.firsteat,		
		eatrata = self.eatrata,
		eatrataamount = self.eatrataamount,		
		eatfish = self.eatfish,
		eatfishamount = self.eatfishamount,
		eatturkey = self.eatturkey,
		eatturkeyamount = self.eatturkeyamount,
        eattemp = self.eattemp,
        eathot = self.eathot,
        eathotamount = self.eathotamount,
        eatcold = self.eatcold,
        eatcoldamount = self.eatcoldamount,
        danding = self.danding,
        eatmonsterlasagna = self.eatmonsterlasagna,		
		eatmole = self.eatmole,
		eatmoleamount = self.eatmoleamount,		
		eatwaffle = self.eatwaffle,
		eatwaffleamount = self.eatwaffleamount,
        supereat = self.supereat,	
		alldiet = self.alldiet,
        eatall = self.eatall,
        eatlist = self.eatlist,
        eatamount = self.eatamount,
		--Life
        noob = self.noob,
        tooyoung = self.tooyoung,
		rose = self.rose,
		shroom = self.shroom,	
        rot = self.rot,				
        deathalot = self.deathalot,
        deathamouth = self.deathamouth,
		secondchance = self.secondchance,		
        messiah = self.messiah,
        respawnamount = self.respawnamount,		
		sleeptent = self.sleeptent,
		sleeptentamount = self.sleeptentamount,
		sleepsiesta = self.sleepsiesta,
		sleepsiestaamount = self.sleepsiestaamount,
		reviveamulet = self.reviveamulet,
		reviveamuletamount = self.reviveamuletamount,
		feedplayer = self.feedplayer,
		feedplayeramount = self.feedplayeramount,
		--Work
		nature = self.nature,
		natureamount = self.natureamount,
        fishmaster = self.fishmaster,
        fishamount = self.fishamount,
		pickappren = self.pickappren,		
        pickmaster = self.pickmaster,
        pickamount = self.pickamount,
		chopappren = self.chopappren,
        chopmaster = self.chopmaster,
        chopamount = self.chopamount,
		mineappren = self.mineappren,
		minemaster = self.minemaster,
		mineamount = self.mineamount,
		cookappren = self.cookappren,		
        cookmaster = self.cookmaster,
        cookamount = self.cookamount,
		buildappren = self.buildappren,		
        buildmaster = self.buildmaster,
        buildamount = self.buildamount,	
		--Like
        goodman = self.goodman,
        friendpig = self.friendpig,
        brother = self.brother,
        friendbunny = self.friendbunny,
		catperson = self.catperson,
		friendcat = self.friendcat,				
		spooder = self.spooder,
		friendspider = self.friendspider,		
        evil = self.evil,
        evilamount = self.evilamount,
        birdclop = self.birdclop,
        pet = self.pet,				
		lavae = self.lavae,	
		fuzzy = self.fuzzy,	
		fuzzyamount = self.fuzzyamount,	
		--Pain
        burn = self.burn,
        freeze = self.freeze,
		sleep = self.sleep,
		starve = self.starve,
		starvetime = self.starvetime,
        nosanity = self.nosanity,
        nosanitytime = self.nosanitytime,
        icebody = self.icebody,
        icetime = self.icetime,
        firebody = self.firebody,
        firetime = self.firetime,
        moistbody = self.moistbody,
        moisttime = self.moisttime,
		evilflower = self.evilflower,
		evilfloweramount = self.evilfloweramount,
		roses = self.roses,
		rosesamount = self.rosesamount,
		drown = self.drown,
		lightning = self.lightning,
		--Fight
        angry = self.angry,
        onhitdamage = self.onhitdamage,
        tank = self.tank,
		fortress = self.fortress,
        attackeddamage = self.attackeddamage,	
		dmgnodmg = self.dmgnodmg,
		dmgnodmgamount = self.dmgnodmgamount,
		whipit = self.whipit,
		whipitamount = self.whipitamount,
		whack = self.whack,
		whackamount = self.whackamount,
		bullseye = self.bullseye,
		bullseyeamount = self.bullseyeamount,
	    sheep = self.sheep,
		tentacruel = self.tentacruel,
		tentacruelamount = self.tentacruelamount,	
		--Hunt
        goatperd = self.goatperd,
        goatperdamount = self.goatperdamount,
        mossling = self.mossling,
        mosslingamount = self.mosslingamount,
        weetusk = self.weetusk,
        weetuskamount = self.weetuskamount,
        tentacoolamount = self.tentacoolamount,
        tentacool = self.tentacool,		
		horrorhound = self.horrorhound,
		horrorhoundamount = self.horrorhoundamount,
		slurtle = self.slurtle,
		slurtleamount = self.slurtleamount,
		werepig = self.werepig,
		werepigamount = self.werepigamount,
		treeguard = self.treeguard,
		treeguardamount = self.treeguardamount,
		varg = self.varg,
		vargamount = self.vargamount,
		koalefant = self.koalefant,
		koalefantamount = self.koalefantamount,
		monkey = self.monkey,
		monkeyamount = self.monkeyamount,
		--Boss
        santa = self.santa,
		dragonfly = self.dragonfly,
		malbatross = self.malbatross,
        knight = self.knight,
        bishop = self.bishop,
        rook = self.rook,
		minotaur = self.minotaur,
        ancient = self.ancient,
        rigid = self.rigid,
        queen = self.queen,
		crabking = self.crabking,
        king = self.king,
        bosswinter = self.bosswinter,
        bossspring = self.bossspring,
        bossantlion = self.bossantlion,
        bossautumn = self.bossautumn,
	    --Misc
        intogame = self.intogame,
        superstar = self.superstar,
        starspent = self.starspent,
		trader = self.trader,
		tradeamount = self.tradeamount,		
        knowledge = self.knowledge,
        knowledgeamount = self.knowledgeamount,
        dance = self.dance,
        danceamount = self.danceamount,		
        teleport = self.teleport,
        teleportamount = self.teleportamount,		
		birchnut = self.birchnut,
		birchnutamount = self.birchnutamount,		
		--Emer
		eatgold = self.eatgold,
		eatgoldamount = self.eatgoldamount,
		eatefc = self.eatefc,
		eatefcamount = self.eatefcamount,
		eathorn = self.eathorn,
		eathornamount = self.eathornamount,
		eateye = self.eateye,
		eateyeamount = self.eathorneye,			
		emeralds = self.emeralds,
		emerald = self.emerald,	
		goldcoin = self.goldcoin,
		goldcoinamount = self.goldcoinamount,	
		baronsuit = self.baronsuit,
		baronsuitamount = self.baronsuitamount,		
--[[	luck = self.luck,	
		citrin = self.citrin,
		amber = self.amber,
		saddle = self.saddle,
		banana = self.banana,
		moonrock = self.moonrock, 
		gnome = self.gnome,
		citrins = self.citrins,
		ambers = self.ambers,
		saddles = self.saddles,
		bananas = self.bananas,
		moonrocks = self.moonrocks,
		gnomes = self.gnomes,]]		
		--Mile
        all = self.all,
        starreset = self.starreset,
		runcount = self.runcount,		
        longage = self.longage,
        oldage = self.oldage,
        agereset = self.agereset,		
        walkalot = self.walkalot,
        walktime = self.walktime,
        stopalot = self.stopalot,
        stoptime = self.stoptime, 
        caveage = self.caveage,
        cavetime = self.cavetime,		
		rider = self.rider,
		rideramount = self.rideramount,
		fullsanity = self.fullsanity,
		fullsanityamount = self.fullsanityamount,
		fullhunger = self.fullhunger,
		fullhungeramount = self.fullhungeramount,
		pacifist = self.pacifist,
		pacifistamount = self.pacifistamount,
    }
    return data
end

--Load
function allachivevent:OnLoad(data)	
	--Food
    self.firsteat = data.firsteat or false
	self.eatrata = data.eatrata or false
	self.eatrataamount = data.eatrataamount or 0	
	self.eatfish = data.eatfish or false
	self.eatfishamount = data.eatfishamount or 0
	self.eatturkey = data.eatturkey or false
	self.eatturkeyamount = data.eatturkeyamount or 0
    self.eattemp = data.eattemp or false
    self.eathot = data.eathot or false
    self.eatcold = data.eatcold or false
    self.eathotamount = data.eathotamount or 0
    self.eatcoldamount = data.eatcoldamount or 0
    self.danding = data.danding or false
    self.eatmonsterlasagna = data.eatmonsterlasagna or 0
	self.eatmole = data.eatmole or false
	self.eatmoleamount = data.eatmoleamount or 0	
	self.eatwaffle = data.eatwaffle or false
	self.eatwaffleamount = data.eatwaffleamount or 0
    self.supereat = data.supereat or false
    self.eatamount = data.eatamount or 0
    self.alldiet = data.alldiet or false
    self.eatall = data.eatall or 0
    self.eatlist = data.eatlist or copylist(foodmenu)	
	--Life
    self.noob = data.noob or false
    self.tooyoung = data.tooyoung or false
	self.rose = data.rose or false
	self.shroom = data.shroom or false
    self.rot = data.rot or false
    self.deathalot = data.deathalot or false
    self.deathamouth = data.deathamouth or 0
	self.secondchance = data.secondchance or false
    self.messiah = data.messiah or false
    self.respawnamount = data.respawnamount or 0		
	self.sleeptent = data.sleeptent or false
	self.sleeptentamount = data.sleeptentamount or 0
	self.sleepsiesta = data.sleepsiesta or false
	self.sleepsiestaamount = data.sleepsiestaamount or 0
	self.reviveamulet = data.reviveamulet or false
	self.reviveamuletamount = data.reviveamuletamount or 0
	self.feedplayer = data.feedplayer or false
	self.feedplayeramount = data.feedplayeramount or 0	
	--Work
	self.nature = data.nature or false
	self.natureamount = data.natureamount or 0
    self.fishmaster = data.fishmaster or false
    self.fishamount = data.fishamount or 0
	self.pickappren = data.pickappren or false
    self.pickmaster = data.pickmaster or false
    self.pickamount = data.pickamount or 0
	self.chopappren = data.chopappren or false
    self.chopmaster = data.chopmaster or false
    self.chopamount = data.chopamount or 0
	self.cookappren = data.cookappren or false
    self.cookmaster = data.cookmaster or false
    self.cookamount = data.cookamount or 0
	self.mineappren = data.mineappren or false
    self.minemaster = data.minemaster or false
    self.mineamount = data.mineamount or 0	
	self.buildappren = data.buildappren or false
    self.buildmaster = data.buildmaster or false
    self.buildamount = data.buildamount or 0	
	--Like
    self.goodman = data.goodman or false
    self.friendpig = data.friendpig or 0 
    self.brother = data.brother or false
    self.friendbunny = data.friendbunny or 0
	self.catperson = data.catperson or false
	self.friendcat = data.friendcat or 0
	self.spooder = data.spooder or false
	self.friendspider = data.friendspider or 0	
    self.evil = data.evil or false
    self.evilamount = data.evilamount or 0
    self.birdclop = data.birdclop or false
    self.pet = data.pet or false
	self.lavae = data.lavae or false
	self.fuzzy = data.fuzzy or false
	self.fuzzyamount = data.fuzzyamount or 0
	--Pain
    self.burn = data.burn or false
    self.freeze = data.freeze or false
	self.sleep = data.sleep or false
	self.starve = data.starve or false
	self.starvetime = data.starvetime or 0
    self.nosanity = data.nosanity or false
    self.nosanitytime = data.nosanitytime or 0	
    self.icebody = data.icebody or false
    self.icetime = data.icetime or 0
    self.firebody = data.firebody or false
    self.firetime = data.firetime or 0
    self.moistbody = data.moistbody or false
    self.moisttime = data.moisttime or 0
	self.evilflower = data.evilflower or false
	self.evilfloweramount = data.evilfloweramount or 0
	self.roses = data.roses or false
	self.rosesamount = data.rosesamount or 0
	self.drown = data.drown or false
	self.lightning = data.lightning or false
	--Fight
    self.angry = data.angry or false
    self.onhitdamage = data.onhitdamage or 0
    self.tank = data.tank or false
	self.fortress = data.fortress or false
    self.attackeddamage = data.attackeddamage or 0	
	self.dmgnodmg = data.dmgnodmg or false
	self.dmgnodmgamount = data.dmgnodmgamount or 0	
	self.whipit = data.whipit or false
	self.whipitamount = data.whipitamount or 0
	self.whack = data.whack or false
	self.whackamount = data.whackamount or 0
	self.bullseye = data.bullseye or false
	self.bullseyeamount = data.bullseyeamount or 0
    self.sheep = data.sheep or false
	self.tentacruel = data.tentacruel or false
	self.tentacruelamount = data.tentacruelamount or 0
	--Hunt
    self.goatperd = data.goatperd or false
    self.goatperdamount = data.goatperdamount or 0
    self.mossling = data.mossling or false
    self.mosslingamount = data.mosslingamount or 0
    self.weetusk = data.weetusk or false
    self.weetuskamount = data.weetuskamount or 0
    self.tentacool = data.tentacool or false
    self.tentacoolamount = data.tentacoolamount or 0
	self.treeguard = data.treeguard or false
	self.treeguardamount = data.treeguardamount or 0
	self.varg = data.varg or false
	self.vargamount = data.vargamount or 0
	self.koalefant = data.koalefant or false
	self.koalefantamount = data.koalefantamount or 0
	self.monkey = data.monkey or false
	self.monkeyamount = data.monkeyamount or 0	
	self.horrorhound = data.horrorhound or false
	self.horrorhoundamount = data.horrorhoundamount or 0
	self.slurtle = data.slurtle or false
	self.slurtleamount = data.slurtleamount or 0
	self.werepig = data.werepig or false
	self.werepigamount = data.werepigamount or 0
	--Boss
    self.santa = data.santa or false
	self.dragonfly = data.dragonfly or false
	self.malbatross = data.malbatross or false
    self.knight = data.knight or false
    self.bishop = data.bishop or false
    self.rook = data.rook or false
	self.minotaur = data.minotaur or false	
    self.ancient = data.ancient or false
    self.rigid = data.rigid or false
    self.queen = data.queen or false
	self.crabking = data.crabking or false
    self.king = data.king or false
    self.bosswinter = data.bosswinter or false
    self.bossspring = data.bossspring or false
    self.bossantlion = data.bossantlion or false
    self.bossautumn = data.bossautumn or false
	--Misc
    self.intogame = data.intogame or false	
    self.superstar = data.superstar or false
    self.starspent = data.starspent or 0
	self.trader = data.trader or false
	self.tradeamount = data.tradeamount or 0
    self.knowledge = data.knowledge or false
    self.knowledgeamount = data.knowledgeamount or 0	
    self.dance = data.dance or false
    self.danceamount = data.danceamount or 0	
    self.teleport = data.teleport or false
    self.teleportamount = data.teleportamount or 0	
	self.birchnut = data.birchnut or false
	self.birchnutamount = data.birchnutamount or 0
    --Emer	
	self.eatgold = data.eatgold or false
	self.eatgoldamount = data.eatgoldamount or 0
	self.eatefc = data.eatefc or false
	self.eatefcamount = data.eatefcamount or 0
	self.eathorn = data.eathorn or false
	self.eathornamount = data.eathornamount or 0
	self.eateye = data.eateye or false
	self.eateyeamount = data.eateyeamount or 0
	self.emerald = data.emerald or false
	self.emeralds = data.emeralds or 0
	self.goldcoin = data.goldcoin or false
	self.goldcoinamount = data.goldcoinamount or 0	
	self.baronsuit = data.baronsuit or false
	self.baronsuitamount = data.baronsuitamount or 0	
--[[self.luck = data.luck or false	
	self.citrin = data.citrin or false
	self.amber = data.amber or false
	self.saddle = data.saddle or false 
	self.banana = data.banana or false
	self.moonrock = data.moonrock or false
	self.gnome = data.gnome or false
	self.citrins = data.citrins or 0
	self.ambers = data.ambers or 0
	self.saddles = data.saddles or 0
	self.bananas = data.bananas or 0
	self.moonrocks = data.moonrocks or 0 
	self.gnomes = data.gnomes or 0]]	
	--Mile
    self.all = data.all or false
    self.starreset = data.starreset or 0	
	self.runcount = data.runcount or 0
    self.longage = data.longage or false
    self.oldage = data.oldage or false
    self.agereset = data.agereset or 0
    self.walkalot = data.walkalot or false	
    self.walktime = data.walktime or 0
    self.stopalot = data.stopalot or false	
    self.stoptime = data.stoptime or 0
    self.caveage = data.caveage or false
    self.cavetime = data.cavetime or 0	
	self.rider = data.rider or false
	self.rideramount = data.rideramount or 0
	self.fullsanity = data.fullsanity or false
	self.fullsanityamount = data.fullsanityamount or 0
	self.fullhunger = data.fullhunger or false
	self.fullhungeramount = data.fullhungeramount or 0
	self.pacifist = data.pacifist or false
	self.pacifistamount = data.pacifistamount or 0
end

--Grant Reward
function allachivevent:seffc(inst, tag)
    SpawnPrefab("seffc").entity:SetParent(inst.entity)
    local str0 = STRINGS.ALLACHIVCURRENCY
    local strname = STRINGS.ALLACHIVNAME
    local strinfo = STRINGS.ALLACHIVINFO
    local strcoin = STRINGS.ALLACHIVCOIN
    if tag == "intogame" and self.all == true then
        TheNet:Announce(inst:GetDisplayName().."   "..strinfo["intogameafterall"]..str0[3]..str0[1]..strname[tag]..str0[2])
    else--if tag == "black" and self.blacktile == "spat" then
        --TheNet:Announce(inst:GetDisplayName().."   "..strinfo["blackspat"]..str0[3]..str0[1]..strname[tag]..str0[2])
    --else
        TheNet:Announce(inst:GetDisplayName().."   "..strinfo[tag]..str0[3]..str0[1]..strname[tag]..str0[2])
    end
    inst.components.talker:Say(str0[6]..strname[tag]..str0[2].."\n"..str0[4]..allachiv_coinget[tag]..str0[5])
    inst.components.allachivcoin:coinDoDelta(allachiv_coinget[tag])
end

--Enter Game
function allachivevent:intogamefn(inst)
    inst:DoTaskInTime(3, function()
        if self.intogame ~= true then
            self.intogame = true
            if AchievementData[inst:GetDisplayName()] ~= nil then
                --print("LOAD")
				local achievements = AchievementData[inst:GetDisplayName()]
				--Food
                self.firsteat = achievements["firsteat"]
				self.eatrata = achievements["eatrata"]
				self.eatrataamount = achievements["eatrataamount"]				
				self.eatfish = achievements["eatfish"]
				self.eatfishamount = achievements["eatfishamount"]
				self.eatturkey = achievements["eatturkey"]
				self.eatturkeyamount = achievements["eatturkeyamount"]
                self.eattemp = achievements["eattemp"]
                self.eathot = achievements["eathot"]
                self.eatcold = achievements["eatcold"]
                self.eathotamount = achievements["eathotamount"]
                self.eatcoldamount = achievements["eatcoldamount"]
                self.danding = achievements["danding"]
                self.eatmonsterlasagna = achievements["eatmonsterlasagna"]	
				self.eatmole = achievements["eatmole"]
				self.eatmoleamount = achievements["eatmoleamount"]
				self.eatwaffle = achievements["eatwaffle"]
				self.eatwaffleamount = achievements["eatwaffleamount"]
                self.supereat = achievements["supereat"]
                self.eatamount = achievements["eatamount"]	
                self.alldiet = achievements["alldiet"]
                self.eatall = achievements["eatall"]
                self.eatlist = achievements["eatlist"]	
				--Life
                self.noob = achievements["noob"]
                self.tooyoung = achievements["tooyoung"]
                self.rose = achievements["rose"]
                self.shroom = achievements["shroom"]
                self.rot = achievements["rot"]
                self.deathalot = achievements["deathalot"]
                self.deathamouth = achievements["deathamouth"]
                self.secondchance = achievements["secondchance"]
                self.messiah = achievements["messiah"]
                self.respawnamount = achievements["respawnamount"]
				self.sleeptent = achievements["sleeptent"]
				self.sleeptentamount = achievements["sleeptentamount"]
				self.sleepsiesta = achievements["sleepsiesta"]
				self.sleepsiestaamount = achievements["sleepsiestaamount"]
				self.reviveamulet = achievements["reviveamulet"]
				self.reviveamuletamount = achievements["reviveamuletamount"]
				self.feedplayer = achievements["feedplayer"]
				self.feedplayeramount = achievements["feedplayeramount"]
				--Work
                self.nature = achievements["nature"]
                self.natureamount = achievements["natureamount"]
                self.fishmaster = achievements["fishmaster"]
                self.fishamount = achievements["fishamount"]
                self.pickappren = achievements["pickappren"]
                self.pickmaster = achievements["pickmaster"]
                self.pickamount = achievements["pickamount"]
                self.chopappren = achievements["chopappren"]				
                self.chopmaster = achievements["chopmaster"]
                self.chopamount = achievements["chopamount"]
                self.cookappren = achievements["cookappren"]
                self.cookmaster = achievements["cookmaster"]
                self.cookamount = achievements["cookamount"]
                self.mineappren = achievements["mineappren"]
                self.minemaster = achievements["minemaster"]
                self.mineamount = achievements["mineamount"]
                self.buildappren = achievements["buildappren"]
                self.buildmaster = achievements["buildmaster"]
                self.buildamount = achievements["buildamount"]				
				--Like
                self.goodman = achievements["goodman"]
                self.friendpig = achievements["friendpig"]
                self.brother = achievements["brother"]
                self.friendbunny = achievements["friendbunny"]
                self.catperson = achievements["catperson"]
                self.friendcat = achievements["friendcat"]	
                self.spooder = achievements["spooder"]
                self.friendspider = achievements["friendspider"]				
                self.evil = achievements["evil"]
                self.evilamount = achievements["evilamount"]
                self.birdclop = achievements["birdclop"]
                self.pet = achievements["pet"]
				self.lavae = achievements["lavae"]
                self.fuzzy = achievements["fuzzy"]
                self.fuzzyamount = achievements["fuzzyamount"]				
				--Pain
                self.burn = achievements["burn"]
                self.freeze = achievements["freeze"]
                self.sleep = achievements["sleep"]
                self.starve = achievements["starve"]
                self.starvetime = achievements["starvetime"]
                self.nosanity = achievements["nosanity"]
                self.nosanitytime = achievements["nosanitytime"]
                self.icebody = achievements["icebody"]
                self.icetime = achievements["icetime"]
                self.firebody = achievements["firebody"]
                self.firetime = achievements["firetime"]
                self.moistbody = achievements["moistbody"]
                self.moisttime = achievements["moisttime"]
				self.evilflower = achievements["evilflower"]
				self.evilfloweramount = achievements["evilfloweramount"]
				self.roses = achievements["roses"]
				self.rosesamount = achievements["rosesamount"]
				self.drown = achievements["drown"]
				self.lightning = achievements["lightning"]
				--Fight
                self.angry = achievements["angry"]
                self.onhitdamage = achievements["onhitdamage"]
                self.tank = achievements["tank"]
				self.fortress = achievements["fortress"]
                self.attackeddamage = achievements["attackeddamage"]			
				self.dmgnodmg = achievements["dmgnodmg"]
				self.dmgnodmgamount = achievements["dmgnodmgamount"]
				self.whipit = achievements["whipit"]
				self.whipitamount = achievements["whipitamount"]
				self.whack = achievements["whack"]
				self.whackamount = achievements["whackamount"]
				self.bullseye = achievements["bullseye"]
				self.bullseyeamount = achievements["bullseyeamount"]
                self.sheep = achievements["sheep"]
                self.tentacruel = achievements["tentacruel"]
                self.tentacruelamount = achievements["tentacruelamount"]
				--Hunt
                self.goatperd = achievements["goatperd"]
                self.goatperdamount = achievements["goatperdamount"]
                self.mossling = achievements["mossling"]
                self.mosslingamount = achievements["mosslingamount"]
                self.weetusk = achievements["weetusk"]
                self.weetuskamount = achievements["weetuskamount"]
                self.tentacool = achievements["tentacool"]
                self.tentacoolamount = achievements["tentacoolamount"]
				self.treeguard = achievements["treeguard"]
				self.treeguardamount = achievements["treeguardamount"]
				self.varg = achievements["varg"]
				self.vargamount = achievements["vargamount"]
				self.koalefant = achievements["koalefant"]
				self.koalefantamount = achievements["koalefantamount"]
				self.monkey = achievements["monkey"]
				self.monkeyamount = achievements["monkeyamount"]			
				self.horrorhound = achievements["horrorhound"]
				self.horrorhoundamount = achievements["horrorhoundamount"]
				self.slurtle = achievements["slurtle"]
				self.slurtleamount = achievements["slurtleamount"]
				self.werepig = achievements["werepig"]
				self.werepigamount = achievements["werepigamount"]
				--Boss
                self.santa = achievements["santa"]
                self.dragonfly = achievements["dragonfly"]
				self.malbatross = achievements["malbatross"]
                self.knight = achievements["knight"]
                self.bishop = achievements["bishop"]
                self.rook = achievements["rook"]
                self.minotaur = achievements["minotaur"]
                self.ancient = achievements["ancient"]				
                self.rigid = achievements["rigid"]
                self.queen = achievements["queen"]
				self.crabking = achievements["crabking"]
                self.king = achievements["king"]
                self.bosswinter = achievements["bosswinter"]
                self.bossspring = achievements["bossspring"]
                self.bossantlion = achievements["bossantlion"]
                self.bossautumn = achievements["bossautumn"]				
				--Misc
                self.superstar = achievements["superstar"]
                self.starspent = achievements["starspent"]
                self.trader = achievements["trader"]
                self.tradeamount = achievements["tradeamount"]
                self.knowledge = achievements["knowledge"]
                self.knowledgeamount = achievements["knowledgeamount"]
                self.dance = achievements["dance"]
                self.danceamount = achievements["danceamount"]
                self.teleport = achievements["teleport"]
                self.teleportamount = achievements["teleportamount"]				
				self.birchnut = achievements["birchnut"]
				self.birchnutamount = achievements["birchnutamount"]			
				--Emer
				self.eatgold = achievements["eatgold"]
				self.eatgoldamount = achievements["eatgoldamount"]
				self.eatefc = achievements["eatefc"]
				self.eatefcamount = achievements["eatefcamount"]
				self.eathorn = achievements["eathorn"]
				self.eathornamount = achievements["eathornamount"]
				self.eateye = achievements["eateye"]
				self.eateyeamount = achievements["eateyeamount"]
				self.emeralds = achievements["emeralds"]
				self.emerald = achievements["emerald"]
				self.goldcoin = achievements["goldcoin"]
				self.goldcoinamount = achievements["goldcoinamount"]
				self.baronsuit = achievements["baronsuit"]
				self.baronsuitamount = achievements["baronsuitamount"]	
                --self.luck = achievements["luck"]				
				--self.citrin = achievements["citrin"]
				--self.amber = achievements["amber"] 
				--self.saddle = achievements["saddle"]  
				--self.banana = achievements["banana"]  
				--self.moonrock = achievements["moonrock"] 
				--self.gnome = achievements["gnome"]  
				--self.citrins = achievements["citrins"] 
				--self.ambers = achievements["ambers"] 
				--self.saddles = achievements["saddles"] 
				--self.bananas = achievements["bananas"]  
				--self.moonrocks = achievements["moonrocks"]  
				--self.gnomes = achievements["gnomes"] 				
				--Mile
                self.all = achievements["all"]
                self.starreset = achievements["starreset"]
				self.runcount = achievements["runcount"]
                self.longage = achievements["longage"]
                self.oldage = achievements["oldage"]
                self.agereset = achievements["agereset"] 
                self.walkalot = achievements["walkalot"]
                self.walktime = achievements["walktime"]
                self.stopalot = achievements["stopalot"]
                self.stoptime = achievements["stoptime"]
                self.caveage = achievements["caveage"]
                self.cavetime = achievements["cavetime"]				
				self.rider = achievements["rider"]
				self.rideramount = achievements["rideramount"]
				self.fullsanity = achievements["fullsanity"]
				self.fullsanityamount = achievements["fullsanityamount"]
				self.fullhunger = achievements["fullhunger"]
				self.fullhungeramount = achievements["fullhungeramount"]
				self.pacifist = achievements["pacifist"]
				self.pacifistamount = achievements["pacifistamount"]
                inst.components.allachivcoin.coinamount  = achievements["totalstar"]
                AchievementData[inst:GetDisplayName()] = nil
            else
                self:seffc(inst, "intogame")

                if self.all ~= true then
                    inst:DoTaskInTime(2, function()
						if _G.STARTGEAR_CONFIG == "fight" then 
							local item = SpawnPrefab("spear")				  
                            inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
                            item = SpawnPrefab("armorwood")
                            inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
							item = SpawnPrefab("boomerang")
                            inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
						end
						if _G.STARTGEAR_CONFIG == "survive" then
							local item = SpawnPrefab("axe")
                            inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
							item = SpawnPrefab("bonestew")				  
                            inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
                            item = SpawnPrefab("backpack_blueprint")
                            inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
							item = SpawnPrefab("bedroll_furry")
                            inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
							item = SpawnPrefab("torch")
                            inst.components.inventory:GiveItem(item, nil, inst:GetPosition())
						end												
                    end)
                end
            end
        end
		if(_G.CAVES_CONFIG == false) then
			self.tooyoung = true
			self.banana = true
			self.spore = true
			self.rot = true
			self.tentacruel = true
			self.rigid = true
			self.ancient = true
			self.minotaur = true
			self.brother = true
			self.caveage = true
			self.knowledge = true
			self.slurtle = true
			self.monkey = true
		end
		
	    --[[inst:DoTaskInTime(1, function()
			if inst.prefab == "wickerbottom" then
				self.sleeptent = true
				self.sleeptentamount = 12
				self.sleepsiesta = true
				self.sleepsiestaamount = 12
			end
			--Meatatarian case -> remove the veggie dishes from the eatlist.
			if inst.prefab == "wathgrithr" then
				self:updateMeatatarianFoodList()
			end
			-- Veggie case -> remove all meat dishes
			if inst.prefab == "wurt" then
				self:updateVeggieFoodList()
				self.eatmonsterlasagna = 10
				self.danding = true
				self:seffc(inst, "danding")
				self.eatfishamount = 10
                self.eatfish = true			
			end
		end)]]
    end)
end

--Eat Achievement
function allachivevent:eatfn(inst)
	inst:ListenForEvent("oneat", function(inst, data)
		if inst:GetDisplayName() ~= data.feeder:GetDisplayName() and data.feeder.components.allachivevent.feedplayer ~= true and findprefab(foodmenu, data.food.prefab) then
			data.feeder.components.allachivevent.feedplayeramount = data.feeder.components.allachivevent.feedplayeramount + 1
			if data.feeder.components.allachivevent.feedplayeramount >= allachiv_eventdata["feedplayer"] then
				data.feeder.components.allachivevent.feedplayer = true
				data.feeder.components.allachivevent:seffc(data.feeder, "feedplayer")
			end
		end
		if self.feedplayer ~= true and data.food.prefab == "monsterlasagna" then
			self.feedplayeramount = self.feedplayeramount + 0.5
			if self.feedplayeramount >= allachiv_eventdata["feedplayer"] then
				self.feedplayer = true
				self:seffc(inst, "feedplayer")
			end
		end
		local food = data.food
		--First Eat
		if self.firsteat ~= true then
			self.firsteat = true
			self:seffc(inst, "firsteat")
		end
		--Eat 100
		if self.supereat ~= true then
			self.eatamount = self.eatamount + 1
			if self.eatamount >= allachiv_eventdata["supereat"] then
				self.supereat = true
				self:seffc(inst, "supereat")
			    local item1 = SpawnPrefab("goldcoin")
                item1.components.stackable:SetStackSize(5)
                inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
			end
		end
		--Eat Lasagna
		if self.danding ~= true and food.prefab == "monsterlasagna" then
			self.eatmonsterlasagna = self.eatmonsterlasagna + 1
			if self.eatmonsterlasagna >= allachiv_eventdata["danding"] then
				self.danding = true
				self:seffc(inst, "danding")
			end
		end
		--Warm Up
		if inst.components.temperature.current <= 0 and inst.components.health.currenthealth > 0
			and findprefab(heatfood, food.prefab) and self.eathot ~= true and self.eattemp ~= true then
			self.eathotamount = self.eathotamount + 1
			self.eattemp = true
			if self.eathotamount >= allachiv_eventdata["eathot"] then
				self.eathot = true
				self:seffc(inst,"eathot")
			end
			inst:DoTaskInTime(5, function()
				self.eattemp = false
			end)
		end

		--Cool Down
		if inst.components.temperature.current >= 70 and inst.components.health.currenthealth > 0
			and findprefab(coldfood, food.prefab) and self.eatcold ~= true and self.eattemp ~= true then
			self.eatcoldamount = self.eatcoldamount + 1
			self.eattemp = true
			if self.eatcoldamount >= allachiv_eventdata["eatcold"] then
				self.eatcold = true
				self:seffc(inst,"eatcold")
			end
			inst:DoTaskInTime(5, function()
				self.eattemp = false
			end)
		end
		
		--Eat Fish
		if self.eatfish ~= true and food.prefab == "fishsticks" then
			self.eatfishamount = self.eatfishamount + 1
			if self.eatfishamount >= allachiv_eventdata["eatfish"] then
				self.eatfish = true
				self:seffc(inst, "eatfish")
			end
		end
		--Eat Turkey
		if self.eatturkey ~= true and food.prefab == "turkeydinner" then
			self.eatturkeyamount = self.eatturkeyamount + 1
			if self.eatturkeyamount >= allachiv_eventdata["eatturkey"] then
				self.eatturkey = true
				self:seffc(inst, "eatturkey")
			end
		end
		--Eat Rata
		if self.eatrata ~= true and food.prefab == "ratatouille" then
			self.eatrataamount = self.eatrataamount + 1
			if self.eatrataamount >= allachiv_eventdata["eatrata"] then
				self.eatrata = true
				self:seffc(inst, "eatrata")
				SpawnPrefab("luis_rat").Transform:SetPosition(inst.Transform:GetWorldPosition())
				SpawnPrefab("mario_rat").Transform:SetPosition(inst.Transform:GetWorldPosition())
				SpawnPrefab("whisper_rat").Transform:SetPosition(inst.Transform:GetWorldPosition())				
--				local item1 = SpawnPrefab("uncompromising_rat")
--				item1.components.stackable:SetStackSize(1)
--				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
                inst.SoundEmitter:PlaySound("rats/rats/snippet")
			end
		end
		--Eat Mole
		if self.eatmole ~= true and food.prefab == "guacamole" then
			self.eatmoleamount = self.eatmoleamount + 1
			if self.eatmoleamount >= allachiv_eventdata["eatmole"] then
				self.eatmole = true
				self:seffc(inst, "eatmole")
			end
		end
		--Eat Waffle
		if self.eatwaffle ~= true and food.prefab == "waffles" then
			self.eatwaffleamount = self.eatwaffleamount + 1
			if self.eatwaffleamount >= allachiv_eventdata["eatwaffle"] then
				self.eatwaffle = true
				self:seffc(inst, "eatwaffle")
			end
		end
		--Eat Gold
		if self.eatgold ~= true then 
			if food.prefab == "goldendrum" or
			   food.prefab == "goldenegg" then
			self.eatgoldamount = self.eatgoldamount + 1
			if self.eatgoldamount >= allachiv_eventdata["eatgold"] then
				self.eatgold = true
				self:seffc(inst, "eatgold")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(3)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
				end
			end
		end	
		--Eat Efc
		if self.eatefc ~= true and food.prefab == "efc" then
			self.eatefcamount = self.eatefcamount + 1
			if self.eatefcamount >= allachiv_eventdata["eatefc"] then
				self.eatefc = true
				self:seffc(inst, "eatefc")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(3)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
			end
		end	
		--Eat Horn
		if self.eathorn ~= true and food.prefab == "minotaurhorn" then
			self.eathornamount = self.eathornamount + 1
			if self.eathornamount >= allachiv_eventdata["eathorn"] then
				self.eathorn = true
				self:seffc(inst, "eathorn")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(5)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
			end
		end
		--Eat Eye
		if self.eateye ~= true and food.prefab == "deerclops_eyeball" then
			self.eateyeamount = self.eateyeamount + 1
			if self.eateyeamount >= allachiv_eventdata["eateye"] then
				self.eateye = true
				self:seffc(inst, "eateye")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(5)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
			end
		end		
		--All Crockpot Food
		if self.alldiet ~= true then
			if findprefab(self.eatlist,food.prefab) then
				self.eatall = self.eatall + 1
				table.remove(self.eatlist,findindex(self.eatlist,food.prefab))
				currenteatlist(self,self.eatlist)
				if next(self.eatlist) == nil then
					self.eatall = 40
					self.alldiet = true
					self:seffc(inst, "alldiet")
					local item1 = SpawnPrefab("goldcoin")
					item1.components.stackable:SetStackSize(15)
					inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
				end
			end
		end
	end)
end
	
--[[function allachivevent:updateMeatatarianFoodList()
	for index,value in pairs(veggie) do
		if findprefab(self.eatlist,value) then
			table.remove(self.eatlist,findindex(self.eatlist,value))
			self.eatall = self.eatall + 1
		end
	end
	currenteatlist(self,self.eatlist)
end

function allachivevent:updateVeggieFoodList()
	for index,value in pairs(meats) do
		if findprefab(self.eatlist,value) then
			table.remove(self.eatlist,findindex(self.eatlist,value))
			self.eatall = self.eatall + 1
		end
	end
	currenteatlist(self,self.eatlist)
end]]

--Movement
function allachivevent:onwalkfn(inst)
    inst:DoPeriodicTask(1, function()
        if inst:HasTag("playerghost") then return end
		if self.pacifist ~= true then
			self.pacifistamount = self.pacifistamount + 1
					if self.pacifistamount >= allachiv_eventdata["pacifist"] then
						self.pacifist = true
						self:seffc(inst, "pacifist")
					end
		end
        if inst.components.locomotor.wantstomoveforward then
            --Walk or Ride
			if inst.components.rider ~= nil and inst.components.rider:IsRiding() and inst.components.rider.mount ~= nil and inst.components.rider.mount.prefab == "beefalo" then
				if self.rider ~= true then
					self.rideramount = self.rideramount + 1
					if self.rideramount >= allachiv_eventdata["rider"] then
						self.rider = true
						self:seffc(inst, "rider")
					end
				end
			else
				if self.walkalot ~= true then
					self.walktime = self.walktime + 1
					if self.walktime >= allachiv_eventdata["walkalot"] then
						self.walkalot = true
						self:seffc(inst, "walkalot")
					end
				end
			end
            
        else
            --Stop
            if self.stopalot ~= true then
                self.stoptime = self.stoptime + 1
                if self.stoptime >= allachiv_eventdata["stopalot"] then
                    self.stopalot = true
                    self:seffc(inst, "stopalot")
                end
            end
        end
    end)
end
--Death
function allachivevent:onkilled(inst)
    inst:ListenForEvent("death", function(inst, data)
        local attacker = inst.components.combat.lastattacker
        --Cave Earthquake
        if attacker and attacker.prefab and attacker:IsValid() and self.tooyoung ~= true then
            if attacker.prefab == "flint"
            or attacker.prefab == "rocks"
            or attacker.prefab == "redgem"
            or attacker.prefab == "bluegem"
            or attacker.prefab == "goldnugget"
            or attacker.prefab == "nitre"
            or attacker.prefab == "marble" then
                inst:DoTaskInTime(2, function()
                    self.tooyoung = true
                    self:seffc(inst, "tooyoung")
                end)
            end
        end
        --Die 10 times
        if self.deathalot ~= true then
            self.deathamouth = self.deathamouth + 1
            if self.deathamouth >= allachiv_eventdata["deathalot"] then
                inst:DoTaskInTime(2, function()
                    self.deathalot = true
                    self:seffc(inst, "deathalot")
                end)
            end
        end
        --Charlie
        if data and data.cause and data.cause == "NIL" and self.noob ~= true then
            inst:DoTaskInTime(2, function()
                self.noob = true
                self:seffc(inst, "noob")
            end)
        end
        --Rose
        if data and data.cause and data.cause == "flower" and self.rose ~= true then
            inst:DoTaskInTime(2, function()
                self.rose = true
                self:seffc(inst, "rose")
            end)
        end
        --Shroom
        if data and data.cause and data.cause == "red_cap" and self.shroom ~= true then
            inst:DoTaskInTime(2, function()
                self.shroom = true
                self:seffc(inst, "shroom")
            end)
        end
        --Spore Cloud
        if data and data.cause and data.cause == "sporecloud" and self.rot ~= true then
            inst:DoTaskInTime(2, function()
                self.rot = true
                self:seffc(inst, "rot")
            end)
        end
        --Electrocuted
        -- if data and data.cause and data.cause == "lightning" and self.black ~= true then
            -- inst:DoTaskInTime(2, function()
                -- self.black = true
                -- self.blacktile = "thunder"
                -- self:seffc(inst, "black")
            -- end)
        -- end
    end)
end

--Zero Sanity
function allachivevent:sanitycheck(inst)
    inst:DoPeriodicTask(1, function()
        if inst.components.sanity.current < 1 and self.nosanity ~= true and inst.components.health.currenthealth > 0 then
            self.nosanitytime = self.nosanitytime + 1
            if self.nosanitytime >= allachiv_eventdata["nosanity"] then
                self.nosanity = true
                self:seffc(inst, "nosanity")
            end
        end
		if inst.components.sanity.current >= inst.components.sanity.max*0.95 and self.fullsanity ~= true and inst.components.health.currenthealth > 0 then
            self.fullsanityamount = self.fullsanityamount + 1
            if self.fullsanityamount >= allachiv_eventdata["fullsanity"] then
                self.fullsanity = true
                self:seffc(inst, "fullsanity")
            end
        end
    end)
end

--High hunger
function allachivevent:hungercheck(inst)
    inst:DoPeriodicTask(1, function()
		if inst.components.hunger.current >= inst.components.hunger.max*0.95 and self.fullhunger ~= true and inst.components.health.currenthealth > 0 then
            self.fullhungeramount = self.fullhungeramount + 1
            if self.fullhungeramount >= allachiv_eventdata["fullhunger"] then
                self.fullhunger = true
                self:seffc(inst, "fullhunger")
            end
        end
    end)
end

--Killing
function allachivevent:onkilledother(inst)
    inst:ListenForEvent("killed", function(inst, data)
        local victim = data.victim
        --Tentapillar
        if victim and victim.prefab == "tentacle_pillar" and self.tentacruel ~= true then
            local single = true
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 15)
            for k,v in pairs(ents) do
                if (v:HasTag("player") or v.prefab == "bunnyman" or v.prefab == "hutch" or v.prefab == "rocky" or v.prefab == "pigman" or v.prefab == "abigail") and v ~= inst then
                    single = false
                end
            end
            if single == true then
				self.tentacruelamount = self.tentacruelamount + 1
				if self.tentacruelamount >= allachiv_eventdata["tentacruel"] then
					self.tentacruel = true
					self:seffc(inst, "tentacruel")
					local item1 = SpawnPrefab("goldcoin")
					item1.components.stackable:SetStackSize(5)
					inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
				end
            end
        end
        --Tentacle
        if victim and victim.prefab == "tentacle" and self.tentacool ~= true then
            self.tentacoolamount = self.tentacoolamount + 1
            if self.tentacoolamount >= allachiv_eventdata["tentacool"] then
                self.tentacool = true
                self:seffc(inst, "tentacool")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(4)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
            end
        end
        --WeeTusk
        if victim and victim.prefab == "little_walrus" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.weetusk then
						v.components.allachivevent.weetuskamount = v.components.allachivevent.weetuskamount + 1
						if v.components.allachivevent.weetuskamount >= allachiv_eventdata["weetusk"] then
							v.components.allachivevent.weetusk = true
							v.components.allachivevent:seffc(v, "weetusk")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(2)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
        --Mossling
		if victim and victim.prefab == "mossling" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.mossling then
						v.components.allachivevent.mosslingamount = v.components.allachivevent.mosslingamount + 1
						if v.components.allachivevent.mosslingamount >= allachiv_eventdata["mossling"] then
							v.components.allachivevent.mossling = true
							v.components.allachivevent:seffc(v, "mossling")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(2)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
        --Goat
		if victim and victim.prefab == "lightninggoat" and victim:HasTag("charged") == true then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.goatperd then
						v.components.allachivevent.goatperdamount = v.components.allachivevent.goatperdamount + 1
						if v.components.allachivevent.goatperdamount >= allachiv_eventdata["goatperd"] then
							v.components.allachivevent.goatperd = true
							v.components.allachivevent:seffc(v, "goatperd")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(5)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
		--Horror Hound
		if victim and victim.prefab == "mutatedhound" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.horrorhound then
						v.components.allachivevent.horrorhoundamount = v.components.allachivevent.horrorhoundamount + 1
						if v.components.allachivevent.horrorhoundamount >= allachiv_eventdata["horrorhound"] then
							v.components.allachivevent.horrorhound = true
							v.components.allachivevent:seffc(v, "horrorhound")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(4)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
		--Slurtle
		if victim and victim.prefab == "slurtle" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.slurtle then
						v.components.allachivevent.slurtleamount = v.components.allachivevent.slurtleamount + 1
						if v.components.allachivevent.slurtleamount >= allachiv_eventdata["slurtle"] then
							v.components.allachivevent.slurtle = true
							v.components.allachivevent:seffc(v, "slurtle")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(2)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
		--Werepig
		if victim and (victim.prefab == "moonpig" or (victim.prefab == "pigman" and victim.components.werebeast:IsInWereState())) then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.werepig then
						v.components.allachivevent.werepigamount = v.components.allachivevent.werepigamount + 1
						if v.components.allachivevent.werepigamount >= allachiv_eventdata["werepig"] then
							v.components.allachivevent.werepig = true
							v.components.allachivevent:seffc(v, "werepig")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(3)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
		--Treeguards
		if victim and victim.prefab == "leif" or victim.prefab == "leif_sparse" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.treeguard then
						v.components.allachivevent.treeguardamount = v.components.allachivevent.treeguardamount + 1
						if v.components.allachivevent.treeguardamount >= allachiv_eventdata["treeguard"] then
							v.components.allachivevent.treeguard = true
							v.components.allachivevent:seffc(v, "treeguard")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(3)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
		--Varg
		if victim and victim.prefab == "warg" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.varg then
						v.components.allachivevent.vargamount = v.components.allachivevent.vargamount + 1
						if v.components.allachivevent.vargamount >= allachiv_eventdata["varg"] then
							v.components.allachivevent.varg = true
							v.components.allachivevent:seffc(v, "varg")
						    local item1 = SpawnPrefab("goldcoin")
                            item1.components.stackable:SetStackSize(8)
                            inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
		--Koalefant
		if victim and victim.prefab == "koalefant_summer" or victim.prefab == "koalefant_winter" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.koalefant then
						v.components.allachivevent.koalefantamount = v.components.allachivevent.koalefantamount + 1
						if v.components.allachivevent.koalefantamount >= allachiv_eventdata["koalefant"] then
							v.components.allachivevent.koalefant = true
							v.components.allachivevent:seffc(v, "koalefant")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(3)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
		--Monkey
		if victim and victim.prefab == "monkey" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if not v.components.allachivevent.monkey then
						v.components.allachivevent.monkeyamount = v.components.allachivevent.monkeyamount + 1
						if v.components.allachivevent.monkeyamount >= allachiv_eventdata["monkey"] then
							v.components.allachivevent.monkey = true
							v.components.allachivevent:seffc(v, "monkey")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(5)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						end
					end
                end
            end
        end
        --[[--Krampus
        if victim and victim.prefab == "krampus" then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            inst:DoTaskInTime(.1, function()
                local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 3)
                for k,v in pairs(ents) do
                    if v.prefab == "krampus_sack"
                    and v.components.inventoryitem.owner == nil
                    and v.components.ksmark.mark == false then
                        v.components.ksmark.mark = true
                        if self.luck ~= true then
                            self.luck = true
                            self:seffc(inst, "luck")
                        end
                    end
                end
            end)
        end]]
        --Klaus
        if victim and victim.prefab == "klaus" then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            inst:DoTaskInTime(1, function()
                local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 5)
                for k,v in pairs(ents) do
                    if v.prefab == "klaussackkey"
                    and v.components.inventoryitem.owner == nil
                    and v.components.ksmark.mark == false then
                        v.components.ksmark.mark = true
                        ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
                        for k,v in pairs(ents) do
                            if v:HasTag("player") then
                                if v.components.allachivevent.santa ~= true then
                                    v.components.allachivevent.santa = true
                                    v.components.allachivevent:seffc(v, "santa")
									local item1 = SpawnPrefab("goldcoin")
									item1.components.stackable:SetStackSize(6)
									inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
                                end
                            end
                        end
                    end
                end
            end)
        end
        --Shadow Chess
        if victim and (victim.prefab == "shadow_knight" or victim.prefab == "shadow_rook" or victim.prefab == "shadow_bishop") and victim.level == 3 then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            inst:DoTaskInTime(2, function()
                for k,v in pairs(ents) do
                    if v:HasTag("player") then
                        if v.components.allachivevent.knight ~= true and victim.prefab == "shadow_knight" then
                            v.components.allachivevent.knight = true
                            v.components.allachivevent:seffc(v, "knight")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(3)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
                        end
                        if v.components.allachivevent.bishop ~= true and victim.prefab == "shadow_bishop" then
                            v.components.allachivevent.bishop = true
                            v.components.allachivevent:seffc(v, "bishop")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(3)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
                        end
                        if v.components.allachivevent.rook ~= true and victim.prefab == "shadow_rook" then
                            v.components.allachivevent.rook = true
                            v.components.allachivevent:seffc(v, "rook")
							local item1 = SpawnPrefab("goldcoin")
							item1.components.stackable:SetStackSize(3)
							inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
                        end
                    end
                end
                --local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 5)
                --for k,v in pairs(ents) do
                    --if v.prefab == "shadowheart"
                    --and v.components.inventoryitem.owner == nil
                    --and v.components.ksmark.mark == false then
                        --v.components.ksmark.mark = true
                        --ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
                        --for k,v in pairs(ents) do
                            --if v:HasTag("player") then
                                --if v.components.allachivevent.knight ~= true and victim.prefab == "shadow_knight" then
                                    --v.components.allachivevent.knight = true
                                    --v.components.allachivevent:seffc(v, "knight")
                                --end
                                --if v.components.allachivevent.bishop ~= true and victim.prefab == "shadow_bishop" then
                                    --v.components.allachivevent.bishop = true
                                    --v.components.allachivevent:seffc(v, "bishop")
                                --end
                                --if v.components.allachivevent.rook ~= true and victim.prefab == "shadow_rook" then
                                    --v.components.allachivevent.rook = true
                                    --v.components.allachivevent:seffc(v, "rook")
                                --end
                            --end
                        --end
                    --end
                --end
            end)
        end
        --Ewecus
        if victim and victim.prefab == "spat" and self.sheep ~= true then
            local single = true
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 15)
            for k,v in pairs(ents) do
                if v:HasTag("player") and v ~= inst then
                    single = false
                end
            end
            if single == true then
                self.sheep = true
                self.blacktile = "spat"
                self:seffc(inst, "sheep")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(5)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
            end
        end
        --Misery Toad
        if victim and victim.prefab == "toadstool_dark" then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if v.components.allachivevent.rigid ~= true then
						v.components.allachivevent.rigid = true
						v.components.allachivevent:seffc(v, "rigid")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(10)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
                end
            end
        end
        --Ancient Fuelweaver
        if victim and victim.prefab == "stalker_atrium" then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if v.components.allachivevent.ancient ~= true then
						v.components.allachivevent.ancient = true
						v.components.allachivevent:seffc(v, "ancient")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(9)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
                end
            end
        end
        --Minotaur
        if victim and victim.prefab == "minotaur" then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if v.components.allachivevent.minotaur ~= true then
						v.components.allachivevent.minotaur = true
						v.components.allachivevent:seffc(v, "minotaur")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(4)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
                end
            end
        end
        --Dragonfly
        if victim and victim.prefab == "dragonfly" then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if v.components.allachivevent.dragonfly ~= true then
						v.components.allachivevent.dragonfly = true
						v.components.allachivevent:seffc(v, "dragonfly")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(3)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
                end
            end
        end
		--Malbatross
        if victim and victim.prefab == "malbatross" then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if v.components.allachivevent.malbatross ~= true then
						v.components.allachivevent.malbatross = true
						v.components.allachivevent:seffc(v, "malbatross")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(5)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
                end
            end
        end
        --Bee Queen
        if victim and victim.prefab == "beequeen" then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if v.components.allachivevent.queen ~= true then
						v.components.allachivevent.queen = true
						v.components.allachivevent:seffc(v, "queen")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(8)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
                end
            end
        end
        --Crab King
        if victim and victim.prefab == "crabking" then
            local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
            for k,v in pairs(ents) do
                if v:HasTag("player") then
					if v.components.allachivevent.crabking ~= true then
						v.components.allachivevent.crabking = true
						v.components.allachivevent:seffc(v, "crabking")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(7)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
                end
            end
        end
        --Season Bosses
        if victim and victim.prefab == "deerclops" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
			local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
			for k,v in pairs(ents) do
				if v:HasTag("player") then
					if v.components.allachivevent.bosswinter ~= true then
						v.components.allachivevent.bosswinter = true
					end
					if v.components.allachivevent.bossautumn and v.components.allachivevent.bossantlion and v.components.allachivevent.bossspring and v.components.allachivevent.bosswinter and v.components.allachivevent.king ~= true then
						v.components.allachivevent.king = true
						v.components.allachivevent:seffc(v, "king")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(15)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
				end
			end
        end
        if victim and victim.prefab == "moose" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
			local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
			for k,v in pairs(ents) do
				if v:HasTag("player") then
					if v.components.allachivevent.bossspring ~= true then
						v.components.allachivevent.bossspring = true
					end
					if v.components.allachivevent.bossautumn and v.components.allachivevent.bossantlion and v.components.allachivevent.bossspring and v.components.allachivevent.bosswinter and v.components.allachivevent.king ~= true then
						v.components.allachivevent.king = true
						v.components.allachivevent:seffc(v, "king")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(15)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
				end
			end
        end
        if victim and victim.prefab == "antlion" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
			local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
			for k,v in pairs(ents) do
				if v:HasTag("player") then
					if v.components.allachivevent.bossantlion ~= true then
						v.components.allachivevent.bossantlion = true
					end
					if v.components.allachivevent.bossautumn and v.components.allachivevent.bossantlion and v.components.allachivevent.bossspring and v.components.allachivevent.bosswinter and v.components.allachivevent.king ~= true then
						v.components.allachivevent.king = true
						v.components.allachivevent:seffc(v, "king")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(15)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
					
				end
			end
        end
        if victim and victim.prefab == "bearger" then
			local pos = Vector3(victim.Transform:GetWorldPosition())
			local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 30)
			for k,v in pairs(ents) do
				if v:HasTag("player") then
					if v.components.allachivevent.bossautumn ~= true then
						v.components.allachivevent.bossautumn = true
					end
					if v.components.allachivevent.bossautumn and v.components.allachivevent.bossantlion and v.components.allachivevent.bossspring and v.components.allachivevent.bosswinter and v.components.allachivevent.king ~= true then
						v.components.allachivevent.king = true
						v.components.allachivevent:seffc(v, "king")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(15)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
					end
				end
			end
        end
    end)
end

--Lightning Listener
function allachivevent:lightningListener(inst)
    inst:ListenForEvent("healthdelta", function(inst, data)
        if self.lightning ~= true and data.cause == "lightning" then
			self.lightning = true
			self:seffc(inst, "lightning")
		end
    end)
end


--Drown Listener
function allachivevent:drownListener(inst)
    inst:ListenForEvent("on_washed_ashore", function(inst, data)
        if self.drown ~= true then
			self.drown = true
			self:seffc(inst, "drown")
		end
    end)
end

--Wake up listener
function allachivevent:wakeupListener(inst)
    inst:ListenForEvent("wakeup", function(inst, data)
        if self.sleeptent ~= true and data == "tent" then
			self.sleeptentamount = self.sleeptentamount + 1
			if self.sleeptentamount >= allachiv_eventdata["sleeptent"] then
				self.sleeptent = true
				self:seffc(inst, "sleeptent")
			end
		end
		
		if self.sleepsiesta ~= true and data == "siestahut" then
			self.sleepsiestaamount = self.sleepsiestaamount + 1
			if self.sleepsiestaamount >= allachiv_eventdata["sleepsiesta"] then
				self.sleepsiesta = true
				self:seffc(inst, "sleepsiesta")
			end
		end
    end)
end

--Burn Freeze Sleep
function allachivevent:burnorfreezeorsleep(inst)
    inst:ListenForEvent("onignite", function(inst)
        if self.burn ~= true then
            self.burn = true
            self:seffc(inst, "burn")
        end
    end)
    inst:ListenForEvent("freeze", function(inst)
        if self.freeze ~= true then
            self.freeze = true
            self:seffc(inst, "freeze")
        end
    end)
	inst:ListenForEvent("knockedout", function(inst)
		if self.sleep ~= true then
			self.sleep = true
			self:seffc(inst, "sleep")
		end
	end)
end

--BeFriend
function allachivevent:makefriend(inst)
    function inst.components.leader:AddFollower(follower)
        if self.followers[follower] == nil and follower.components.follower ~= nil then
            local achiv = inst.components.allachivevent
            --Pigman
            if follower.prefab == "pigman" and achiv.goodman ~= true then
                achiv.friendpig = achiv.friendpig + 1
                if achiv.friendpig >= allachiv_eventdata["goodman"] then
                    achiv.goodman = true
                    achiv:seffc(inst, "goodman")
                end
            end
            --Bunnyman
            if follower.prefab == "bunnyman" and achiv.brother ~= true then
                achiv.friendbunny = achiv.friendbunny + 1
                if achiv.friendbunny >= allachiv_eventdata["brother"] then
                    achiv.brother = true
                    achiv:seffc(inst, "brother")
                end
            end
            --Catcoon
            if follower.prefab == "catcoon" and achiv.catperson ~= true then
                achiv.friendcat = achiv.friendcat + 1
                if achiv.friendcat >= allachiv_eventdata["catperson"] then
                    achiv.catperson = true
                    achiv:seffc(inst, "catperson")
                end
            end
            --Spooders
            if (follower.prefab == "spider" or 
				follower.prefab == "spider_dropper" or 
				follower.prefab == "spider_warrior" or 
				follower.prefab == "spider_hider" or 
				follower.prefab == "spider_spitter") and achiv.spooder ~= true then
                achiv.friendspider = achiv.friendspider + 1
                if achiv.friendspider >= allachiv_eventdata["spooder"] then
                    achiv.spooder = true
                    achiv:seffc(inst, "spooder")
                end
            end
            --Mandrake
            if follower.prefab == "mandrake_active" and achiv.evil ~= true and not TheWorld.components.worldstate.data.isday then
                achiv.evilamount = achiv.evilamount + 1
                if achiv.evilamount >= allachiv_eventdata["evil"] then
                    achiv.evil = true
                    achiv:seffc(inst, "evil")
                end
            end
            --TallBird
            if follower.prefab == "smallbird" and achiv.birdclop ~= true then
                achiv.birdclop = true
                achiv:seffc(inst, "birdclop")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(10)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
            end

            self.followers[follower] = true
            self.numfollowers = self.numfollowers + 1
            follower.components.follower:SetLeader(self.inst)
            follower:PushEvent("startfollowing", { leader = self.inst })

            if not follower.components.follower.keepdeadleader then
                self.inst:ListenForEvent("death", self._onfollowerdied, follower)
            end

            self.inst:ListenForEvent("onremove", self._onfollowerremoved, follower)

            if self.inst:HasTag("player") and follower.prefab ~= nil then
                ProfileStatsAdd("befriend_"..follower.prefab)
            end
        end
    end
end

--Fish
function allachivevent:onhook(inst)
    inst:ListenForEvent("fishingstrain", function()
        if self.fishmaster ~= true then
            self.fishamount = self.fishamount + 1
            if self.fishamount >= allachiv_eventdata["fishmaster"] then
                self.fishmaster = true
                self:seffc(inst, "fishmaster")
            end
        end
    end)
end

--Pick
function allachivevent:onpick(inst)
    inst:ListenForEvent("picksomething", function(inst, data)
        if data.object and data.object.components.pickable and not data.object.components.trader then
			if data.object.prefab == "flower_evil" and self.evilflower ~= true then
				self.evilfloweramount = self.evilfloweramount + 1
				if self.evilfloweramount >= allachiv_eventdata["evilflower"] then
					self.evilflower = true
					self:seffc(inst, "evilflower")
				end
			end
            if self.pickmaster ~= true or self.pickappren ~= true then
                self.pickamount = self.pickamount + 1
				if self.pickamount >= allachiv_eventdata["pickappren"] and self.pickappren ~= true then
					self.pickappren = true
					self:seffc(inst, "pickappren")
				end
                if self.pickamount >= allachiv_eventdata["pickmaster"] and self.pickmaster ~= true then
                    self.pickmaster = true
                    self:seffc(inst, "pickmaster")
                end
            end
        end
    end)
end

--Chop
function allachivevent:chopper(inst)
    inst:ListenForEvent("finishedwork", function(inst, data)
		if not self.birchnut and data.target and data.target.prefab == "deciduoustree" and data.target.monster then
			self.birchnutamount = self.birchnutamount + 1
				if self.birchnutamount >= allachiv_eventdata["birchnut"] then
					self.birchnut = true
					self:seffc(self.inst, "birchnut")
				end
		end
        if data.target and data.target:HasTag("tree") then
            if not self.chopmaster or not self.chopappren then
                self.chopamount = self.chopamount + 1
				if not self.chopappren and self.chopamount >= allachiv_eventdata["chopappren"] then
					self.chopappren = true
					self:seffc(self.inst, "chopappren")
				end
                if not self.chopmaster and self.chopamount >= allachiv_eventdata["chopmaster"] then
                    self.chopmaster = true
                    self:seffc(self.inst, "chopmaster")
                end
            end
        end
    end)
end

--Mine
function allachivevent:miner(inst)
    inst:ListenForEvent("finishedwork", function(inst, data)
        if data.target and (data.target:HasTag("boulder") or data.target:HasTag("statue") or rocklist[data.target.prefab]) then
            if not self.minemaster or not self.mineappren then
                self.mineamount = self.mineamount + 1
				if not self.mineappren and self.mineamount >= allachiv_eventdata["mineappren"] then
					self.mineappren = true
					self:seffc(self.inst, "mineappren")
				end
                if not self.minemaster and self.mineamount >= allachiv_eventdata["minemaster"] then
                    self.minemaster = true
                    self:seffc(self.inst, "minemaster")
                end
            end
        end
    end)
end

--Revive
function allachivevent:respawn(inst)
    inst:ListenForEvent("respawnfromghost", function(inst, data)
		--singleplayer addition to messiah
		if data and data.source and data.source.prefab == "resurrectionstone" and self.messiah ~= true then
			self.respawnamount = self.respawnamount + 1
			if self.respawnamount >= allachiv_eventdata["messiah"] then
				inst:DoTaskInTime(5, function()
					self.messiah = true
					self:seffc(inst, "messiah")
					local item1 = SpawnPrefab("goldcoin")
					item1.components.stackable:SetStackSize(10)
					inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
				end)
			end
        end
        if data and data.user and data.user.components.allachivevent then
            local allachivevent = data.user.components.allachivevent
            if allachivevent.messiah ~= true then
                allachivevent.respawnamount = allachivevent.respawnamount + 1
                if allachivevent.respawnamount >= allachiv_eventdata["messiah"] then
                    allachivevent.messiah = true
                    allachivevent:seffc(data.user, "messiah")
					local item1 = SpawnPrefab("goldcoin")
					item1.components.stackable:SetStackSize(10)
					inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
                end
            end
        end
        if data and data.source and data.source.prefab == "resurrectionstatue" and self.secondchance ~= true then
            inst:DoTaskInTime(2, function()
                self.secondchance = true
                self:seffc(inst, "secondchance")
            end)
        end
		if data and data.source and data.source.prefab == "amulet" and self.reviveamulet ~= true then
			self.reviveamuletamount = self.reviveamuletamount + 1
			if self.reviveamuletamount >= allachiv_eventdata["reviveamulet"] then
				inst:DoTaskInTime(2, function()
					self.reviveamulet = true
					self:seffc(inst, "reviveamulet")
					local item1 = SpawnPrefab("goldcoin")
					item1.components.stackable:SetStackSize(5)
					inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
				end)
			end
        end
    end)
end

--Emerville
--Eat (See Eat Tab)
		
		
--Have in inventory
function allachivevent:onhavefn(inst)
	inst:DoPeriodicTask(5, function()
		-- Green Gem
		if self.emerald ~= true then
			local items = inst.components.inventory:FindItems(function(item) return item.prefab=="greengem" end)
			local count = 0
			for i, item in ipairs(items) do
				count = count + (item.components.stackable ~= nil and item.components.stackable:StackSize() or 1)
			end
			self.emeralds = count
			if(count >= allachiv_eventdata["emerald"]) then
				self.emerald = true
				self:seffc(inst, "emerald")
		        local item1 = SpawnPrefab("goldnugget")
                item1.components.stackable:SetStackSize(1)
                inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())	
			end		
		end
		-- Gold Coin - goldcoin
		if self.goldcoin ~= true then
			local items = inst.components.inventory:FindItems(function(item) return item.prefab=="goldcoin" end)
			local count = 0
			for i, item in ipairs(items) do
				count = count + (item.components.stackable ~= nil and item.components.stackable:StackSize() or 1)
			end
			self.goldcoinamount = count
			if(count >= allachiv_eventdata["goldcoin"]) then
				self.goldcoin = true
				self:seffc(inst, "goldcoin")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(1)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
			end
		end
		-- Baron Suit - baronsuit
		if self.baronsuit ~= true then
			local items = inst.components.inventory:FindItems(function(item) return item.prefab=="baronsuit" end)
			local count = 0
			for i, item in ipairs(items) do
				count = count + (item.components.stackable ~= nil and item.components.stackable:StackSize() or 1)
			end
			self.baronsuitamount = count
			if(count >= allachiv_eventdata["baronsuit"]) then
				self.baronsuit = true
				self:seffc(inst, "baronsuit")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(5)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
			end
		end
		-- Yellow Gem - yellowgem
		--[[if self.citrin ~= true then
			local items = inst.components.inventory:FindItems(function(item) return item.prefab=="yellowgem" end)
			local count = 0
			for i, item in ipairs(items) do
				count = count + (item.components.stackable ~= nil and item.components.stackable:StackSize() or 1)
			end
			self.citrins = count
			if(count >= allachiv_eventdata["citrin"]) then
				self.citrin = true
				self:seffc(inst, "citrin")
			end
		end
		-- Orange Gem - orangegem
		if self.amber ~= true then
			local items = inst.components.inventory:FindItems(function(item) return item.prefab=="orangegem" end)
			local count = 0
			for i, item in ipairs(items) do
				count = count + (item.components.stackable ~= nil and item.components.stackable:StackSize() or 1)
			end
			self.ambers = count
			if(count >= allachiv_eventdata["amber"]) then
				self.amber = true
				self:seffc(inst, "amber")
			end
		end
		-- Glossamer Saddle - saddle_race
		if self.saddle ~= true then
			local item = inst.components.inventory:FindItem(function(item) return item.prefab=="saddle_race" end)
			if(item ~= nil) then
				self.saddles = 1
				self.saddle = true
				self:seffc(inst, "saddle")
			end
		end
		-- Cooked Cave Banana - cave_banana_cooked
		if self.banana ~= true then
			local items = inst.components.inventory:FindItems(function(item) return item.prefab=="cave_banana_cooked" end)
			local count = 0
			for i, item in ipairs(items) do
				count = count + (item.components.stackable ~= nil and item.components.stackable:StackSize() or 1)
			end
			self.bananas = count
			if(count >= allachiv_eventdata["banana"]) then
				self.banana = true
				self:seffc(inst, "banana")
			end
		end
		-- Moonrock - moonrocknugget
		if self.moonrock ~= true then
			local items = inst.components.inventory:FindItems(function(item) return item.prefab=="moonrocknugget" end)
			local count = 0
			for i, item in ipairs(items) do
				count = count + (item.components.stackable ~= nil and item.components.stackable:StackSize() or 1)
			end
			self.moonrocks = count
			if(count >= allachiv_eventdata["moonrock"]) then
				self.moonrock = true
				self:seffc(inst, "moonrock")
			end
		end
		-- Gnomes - trinket_4 and trinket_13
		if self.gnome ~= true then
			local items = inst.components.inventory:FindItems(function(item) return item.prefab=="trinket_4" or item.prefab=="trinket_13" end)
			local count = 0
			for i, item in ipairs(items) do
				count = count + (item.components.stackable ~= nil and item.components.stackable:StackSize() or 1)
			end
			self.gnomes = count
			if(count >= allachiv_eventdata["gnome"]) then
				self.gnome = true
				self:seffc(inst, "gnome")
			end
		end]]
	end)
end		


--Age and SuperStar
function allachivevent:ontimepass(inst)
    inst:DoPeriodicTask(5, function(inst)
        --Age
        if self.longage ~= true or self.oldage ~= true then
            if self.all ~= true then
                self.age = math.ceil(inst.components.age:GetAge() / TUNING.TOTAL_DAY_TIME)
            else
                self.age = math.ceil(inst.components.age:GetAge() / TUNING.TOTAL_DAY_TIME) - self.agereset + 1
            end
            if self.age >= allachiv_eventdata["longage"] and self.longage ~= true then
                self.longage = true
                self:seffc(inst, "longage")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(10)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
            end
            if self.age >= allachiv_eventdata["oldage"] and self.oldage ~= true then
                self.oldage = true
                self:seffc(inst,"oldage")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(20)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
            end
        end
        --Critters
        if self.pet ~= true then
            if inst.components.leader:IsBeingFollowedBy("critter_lamb") or
               inst.components.leader:IsBeingFollowedBy("critter_puppy") or
               inst.components.leader:IsBeingFollowedBy("critter_kitten") or
               inst.components.leader:IsBeingFollowedBy("critter_perdling") or
               inst.components.leader:IsBeingFollowedBy("critter_dragonling") or
               inst.components.leader:IsBeingFollowedBy("critter_glomling") or
               inst.components.leader:IsBeingFollowedBy("critter_lunarmothling") then
                self.pet = true
                self:seffc(inst, "pet")
            end
        end
		--Lavae
		if self.lavae ~= true then 
			local tooth = inst.components.inventory:FindItem(function(item) return item.prefab=="lavae_tooth" end)
			if tooth and tooth.components.leader:IsBeingFollowedBy("lavae_pet") then
				self.lavae = true
				self:seffc(inst, "lavae")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(20)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
			end
		end	
        --Super Star
        if self.superstar ~= true then
            self.starspent = inst.components.allachivcoin.starsspent
            --Star
            self.starspent = self.starspent - self.starreset
            if self.starspent >= allachiv_eventdata["superstar"] then
                self.starspent = allachiv_eventdata["superstar"]
                self.superstar = true
                self:seffc(inst,"superstar")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(10)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())				
            end
        end
        --Give Achievements
        if inst.components.allachivcoin.firebody == true and self.firebody ~= true then
            self.firebody = true
            self:seffc(inst,"firebody")
        end
        if inst.components.allachivcoin.firebody == true and self.eatcold ~= true then
            self.eatcold = true
            self:seffc(inst,"eatcold")
        end
        if inst.components.allachivcoin.icebody == true and self.icebody ~= true then
            self.icebody = true
            self:seffc(inst,"icebody")
        end
        if inst.components.allachivcoin.icebody == true and self.eathot ~= true then
            self.eathot = true
            self:seffc(inst,"eathot")
        end
        if inst.components.allachivcoin.nomoist == true and self.moistbody ~= true then
            self.moistbody = true
            self:seffc(inst,"moistbody")
        end
        if self.knowledgeamount == 6 and self.knowledge ~= true then
            self.knowledge = true
            self:seffc(inst,"knowledge")
        end
    end)
end

--Craft
function allachivevent:onbuild(inst)
    inst:ListenForEvent("consumeingredients", function(inst)
        if self.buildmaster ~= true or self.buildappren ~= true then
            self.buildamount = self.buildamount + 1
			if self.buildamount >= allachiv_eventdata["buildappren"] and self.buildappren ~= true then
				self.buildappren = true
				self:seffc(inst, "buildappren")
			end
            if self.buildamount >= allachiv_eventdata["buildmaster"] and self.buildmaster ~= true then
                self.buildmaster = true
                self:seffc(inst, "buildmaster")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(5)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
            end
        end
    end)
end

--Plant
function allachivevent:onplant(inst)
    inst:ListenForEvent("deployitem", function(inst,data)
        if (data.prefab == "pinecone" or data.prefab == "twiggy_nut" or data.prefab == "seeds" or data.prefab == "acorn") and self.nature ~= true then
            self.natureamount = self.natureamount + 1
            if self.natureamount >= allachiv_eventdata["nature"] then
                self.nature = true
                self:seffc(inst, "nature")
            end
        end
    end)
end

--Tank
function allachivevent:onattacked(inst)
    inst:ListenForEvent("attacked", function(inst, data)
		if self.dmgnodmg ~= true then
			self.dmgnodmgamount = 0
		end
		if self.roses ~= true and data.attacker and data.attacker.prefab == "flower" then
			self.rosesamount = self.rosesamount + 1
			if self.rosesamount >= allachiv_eventdata["roses"] then
				self.roses = true
				self:seffc(inst, "roses")
			end
		end
        if self.tank ~= true then
            if data.damage and data.damage >= 0 then
                self.attackeddamage = math.ceil(self.attackeddamage + data.damage)
	            if self.attackeddamage >= allachiv_eventdata["tank"] then
                    self.attackeddamage = allachiv_eventdata["tank"]
	                self.tank = true
	                self:seffc(inst, "tank")
	            end
	        end
        end
        if self.fortress ~= true then
            if data.damage and data.damage >= 0 then
                self.attackeddamage = math.ceil(self.attackeddamage + data.damage)
	            if self.attackeddamage >= allachiv_eventdata["fortress"] then
                    self.attackeddamage = allachiv_eventdata["fortress"]
	                self.fortress = true
	                self:seffc(inst, "fortress")
	            end
	        end
        end		
    end)
end

--Damage
function allachivevent:hitother(inst)
    inst:ListenForEvent("onhitother", function(inst, data)
		if self.pacifist ~= true and data.damage and data.damage >= 0 then
			self.pacifistamount = 0
		end
		if self.dmgnodmg ~= true and data.damage and data.damage >= 0 then
			self.dmgnodmgamount = math.ceil(self.dmgnodmgamount + data.damage)
			if self.dmgnodmgamount >= allachiv_eventdata["dmgnodmg"] then
                self.dmgnodmgamount = allachiv_eventdata["dmgnodmg"]
                self.dmgnodmg = true
                self:seffc(inst, "dmgnodmg")
            end
		end
		if self.whipit ~= true and data.weapon then
			if data.weapon.prefab == "whip" or 
			   data.weapon.prefab == "bullkelp_root" then
			if data.damage and data.damage >= 0 then
                self.whipitamount = math.ceil(self.whipitamount + data.damage)
            end
			if self.whipitamount >= allachiv_eventdata["whipit"] then
                self.whipitamount = allachiv_eventdata["whipit"]
                self.whipit = true
                self:seffc(inst, "whipit")
            end
		end
	end					
		if self.whack ~= true and data.weapon then
			if data.weapon.prefab == "cane" or
			   data.weapon.prefab == "greencane" or
			   data.weapon.prefab == "bluecane" or 
			   data.weapon.prefab == "redcane" or 
			   data.weapon.prefab == "blackcane" or
			   data.weapon.prefab == "chromecane" or
			   data.weapon.prefab == "pinkcane" then
			if data.damage and data.damage >= 0 then
                self.whackamount = math.ceil(self.whackamount + data.damage)
            end
			if self.whackamount >= allachiv_eventdata["whack"] then
                self.whackamount = allachiv_eventdata["whack"]
                self.whack = true
                self:seffc(inst, "whack")
            end
		end	
	end
		if self.bullseye ~= true and data.weapon and data.weapon.prefab == "blowdart_pipe" then
			if data.damage and data.damage >= 0 then
                self.bullseyeamount = math.ceil(self.bullseyeamount + data.damage)
            end
			if self.bullseyeamount >= allachiv_eventdata["bullseye"] then
                self.bullseyeamount = allachiv_eventdata["bullseye"]
                self.bullseye = true
                self:seffc(inst, "bullseye")
            end
		end
        if self.angry ~= true then
            if data.damage and data.damage >= 0 then
                self.onhitdamage = math.ceil(self.onhitdamage + data.damage)
            end
            if self.onhitdamage >= allachiv_eventdata["angry"] then
                self.onhitdamage = allachiv_eventdata["angry"]
                self.angry = true
                self:seffc(inst, "angry")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(10)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
            end
        end
    end)
end

--Freeze/Overheat
function allachivevent:ontemperature(inst)
    inst:DoPeriodicTask(1, function()
        if inst.components.temperature.current <= 0
        and self.icebody ~= true
        and inst.components.health.currenthealth > 0 then
            self.icetime = self.icetime + 1
            if self.icetime >= allachiv_eventdata["icebody"] then
                self.icebody = true
                self:seffc(inst, "icebody")
            end
        end
    end)
    inst:DoPeriodicTask(1, function()
        if inst.components.temperature.current >= 70
        and self.firebody ~= true
        and inst.components.health.currenthealth > 0 then
            self.firetime = self.firetime + 1
            if self.firetime >= allachiv_eventdata["firebody"] then
                self.firebody = true
                self:seffc(inst, "firebody")
            end
        end
    end)
end

--Live in Cave
function allachivevent:incave(inst)
    inst:DoPeriodicTask(1, function()
        if TheWorld:HasTag("cave") and inst:HasTag("playerghost") ~= true
        and self.caveage ~= true then
            self.cavetime = self.cavetime + 1
            if self.cavetime >= allachiv_eventdata["caveage"] then
                self.caveage = true
                self:seffc(inst, "caveage")
            end
        end
    end)
end

--Starving
function allachivevent:onhunger(inst)
    inst:DoPeriodicTask(1, function()
        if inst.components.hunger.current <= 0
        and self.starve ~= true
        and inst.components.health.currenthealth > 0 then
            self.starvetime = self.starvetime + 1
            if self.starvetime >= allachiv_eventdata["starve"] then
                self.starve = true
                self:seffc(inst, "starve")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(5)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
            end
        end
    end)
end

--Full Wet
function allachivevent:moist(inst)
	inst:DoPeriodicTask(1, function()
		if self.moistbody ~= true and inst.components.moisture.moisture == 100 then
			self.moisttime = self.moisttime + 1
			if self.moisttime >= allachiv_eventdata["moistbody"] then
				self.moistbody = true
				self:seffc(inst, "moistbody")
				local item1 = SpawnPrefab("goldcoin")
				item1.components.stackable:SetStackSize(5)
				inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
                inst.SoundEmitter:PlaySound("rainonme/rainonme/snippet")
			end
		end
	end)
end

--Learn Blueprint
function allachivevent:onlearn(inst)
    inst:ListenForEvent("learnrecipe", function(inst,data)
        local blueprint_str = data.recipe
        if blueprint_str:sub(-9):lower() == "blueprint" then
            blueprint_str = blueprint_str:sub(1,-11)
        end
        if blueprint_str == "ruinsrelic_table" or 
           blueprint_str == "ruinsrelic_chair" or 
           blueprint_str == "ruinsrelic_vase" or
           blueprint_str == "ruinsrelic_plate" or
           blueprint_str == "ruinsrelic_bowl" or
           blueprint_str == "ruinsrelic_chipbowl" then
            self.knowledgeamount = self.knowledgeamount + 1
            if self.knowledge ~= true then
                self.knowledge = true
                self:seffc(inst, "knowledge")
            end
        end
    end)
end

--Do Emotes
function allachivevent:doemote(inst)
    inst:ListenForEvent("emote", function()
        if self.dance ~= true then
            local single = true
            local pos = Vector3(inst.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 15)
            for k,v in pairs(ents) do
                if v:HasTag("player") and v ~= inst then
                    single = false
                end
				--singleplayer addition
				if v.prefab == "resurrectionstatue" then
                    single = false
                end
            end
            if single == false then
                self.danceamount = self.danceamount + 1
                if self.danceamount >= allachiv_eventdata["dance"] then
                    self.dance = true
                    self:seffc(inst, "dance")
					local item1 = SpawnPrefab("goldcoin")
					item1.components.stackable:SetStackSize(1)
					inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
                    inst.SoundEmitter:PlaySound("dancingqueen/dancingqueen/snippet")
                end
            end
        end
    end)
end

--Teleport
function allachivevent:onteleport(inst)
    inst:ListenForEvent("wormholetravel", function(inst)
        if self.teleport ~= true then
            self.teleportamount = self.teleportamount + 1
            if self.teleportamount >= allachiv_eventdata["teleport"] then
                self.teleport = true
                self:seffc(inst, "teleport")
            end
        end
    end)
    inst:ListenForEvent("soulhop", function(inst)
        if self.teleport ~= true then
            self.teleportamount = self.teleportamount + 1
            if self.teleportamount >= allachiv_eventdata["teleport"] then
                self.teleport = true
                self:seffc(inst, "teleport")
            end
        end
    end)
    inst:ListenForEvent("townportalteleport", function(inst)
        if self.teleport ~= true then
            self.teleportamount = self.teleportamount + 1
            if self.teleportamount >= allachiv_eventdata["teleport"] then
                self.teleport = true
                self:seffc(inst, "teleport")
            end
        end
    end)
end

function allachivevent:onreroll(inst)
    inst:ListenForEvent("ms_playerreroll", function(inst)
                local SaveAchieve = {}
				--Food
                SaveAchieve["firsteat"] = self.firsteat or false
				SaveAchieve["eatrata"] = self.eatrata or false
				SaveAchieve["eatrataamount"] = self.eatrataamount or 0				
				SaveAchieve["eatfish"] = self.eatfish or false
				SaveAchieve["eatfishamount"] = self.eatfishamount or 0
				SaveAchieve["eatturkey"] = self.eatturkey or false
				SaveAchieve["eatturkeyamount"] = self.eatturkeyamount or 0
                SaveAchieve["eattemp"] = self.eattemp or false
                SaveAchieve["eathot"] = self.eathot or false
                SaveAchieve["eatcold"] = self.eatcold or false
                SaveAchieve["eathotamount"] = self.eathotamount or 0
                SaveAchieve["eatcoldamount"] = self.eatcoldamount or 0
                SaveAchieve["danding"] = self.danding or false
                SaveAchieve["eatmonsterlasagna"] = self.eatmonsterlasagna or 0				
				SaveAchieve["eatmole"] = self.eatmole or false
				SaveAchieve["eatmoleamount"] = self.eatmoleamount or 0	
				SaveAchieve["eatwaffle"] = self.eatwaffle or false
				SaveAchieve["eatwaffleamount"] = self.eatwaffleamount or 0
                SaveAchieve["supereat"] = self.supereat or false
                SaveAchieve["eatamount"] = self.eatamount or 0				
                SaveAchieve["alldiet"] = self.alldiet or false
                SaveAchieve["eatall"] = self.eatall or 0
                SaveAchieve["eatlist"] = self.eatlist or copylist(foodmenu)
				--Life
                SaveAchieve["noob"] = self.noob or false
                SaveAchieve["tooyoung"] = self.tooyoung or false
                SaveAchieve["rose"] = self.rose or false
                SaveAchieve["shroom"] = self.shroom or false
                SaveAchieve["rot"] = self.rot or false
                SaveAchieve["deathalot"] = self.deathalot or false
                SaveAchieve["deathamouth"] = self.deathamouth or 0
                SaveAchieve["secondchance"] = self.secondchance or false				
                SaveAchieve["messiah"] = self.messiah or false
                SaveAchieve["respawnamount"] = self.respawnamount or 0		
				SaveAchieve["sleeptent"] = self.sleeptent or false
				SaveAchieve["sleeptentamount"] = self.sleeptentamount or 0
				SaveAchieve["sleepsiesta"] = self.sleepsiesta or false
				SaveAchieve["sleepsiestaamount"] = self.sleepsiestaamount or 0
				SaveAchieve["reviveamulet"] = self.reviveamulet or false
				SaveAchieve["reviveamuletamount"] = self.reviveamuletamount or 0
				SaveAchieve["feedplayer"] = self.feedplayer or false
				SaveAchieve["feedplayeramount"] = self.feedplayeramount or 0
				--Work
                SaveAchieve["nature"] = self.nature or false
                SaveAchieve["natureamount"] = self.natureamount or 0
                SaveAchieve["fishmaster"] = self.fishmaster or false
                SaveAchieve["fishamount"] = self.fishamount or 0
                SaveAchieve["pickappren"] = self.pickappren or false
                SaveAchieve["pickmaster"] = self.pickmaster or false
                SaveAchieve["pickamount"] = self.pickamount or 0
                SaveAchieve["chopappren"] = self.chopappren or false				
                SaveAchieve["chopmaster"] = self.chopmaster or false
                SaveAchieve["chopamount"] = self.chopamount or 0
                SaveAchieve["cookappren"] = self.cookappren or false
                SaveAchieve["cookmaster"] = self.cookmaster or false
                SaveAchieve["cookamount"] = self.cookamount or 0
                SaveAchieve["mineappren"] = self.mineappren or false
                SaveAchieve["minemaster"] = self.minemaster or false
                SaveAchieve["mineamount"] = self.mineamount or 0
                SaveAchieve["buildappren"] = self.buildappren or false
                SaveAchieve["buildmaster"] = self.buildmaster or false
                SaveAchieve["buildamount"] = self.buildamount or 0				
				--Life
                SaveAchieve["goodman"] = self.goodman or false
                SaveAchieve["friendpig"] = self.friendpig or 0
                SaveAchieve["brother"] = self.brother or false
                SaveAchieve["friendbunny"] = self.friendbunny or 0
                SaveAchieve["catperson"] = self.catperson or false
                SaveAchieve["friendcat"] = self.friendcat or 0
                SaveAchieve["spooder"] = self.spooder or false
                SaveAchieve["friendspider"] = self.friendspider or 0
                SaveAchieve["evil"] = self.evil or false
                SaveAchieve["evilamount"] = self.evilamount or 0
                SaveAchieve["birdclop"] = self.birdclop or false
                SaveAchieve["pet"] = self.pet or false
				SaveAchieve["lavae"] = self.lavae or false
                SaveAchieve["fuzzy"] = self.fuzzy or false
                SaveAchieve["fuzzyamount"] = self.fuzzyamount or 0
				--Pain
                SaveAchieve["burn"] = self.burn or false
                SaveAchieve["freeze"] = self.freeze or false
                SaveAchieve["sleep"] = self.sleep or false
                SaveAchieve["starve"] = self.starve or false
                SaveAchieve["starvetime"] = self.starvetime or 0
                SaveAchieve["nosanity"] = self.nosanity or false
                SaveAchieve["nosanitytime"] = self.nosanitytime or 0
                SaveAchieve["icebody"] = self.icebody or false
                SaveAchieve["icetime"] = self.icetime or 0
                SaveAchieve["firebody"] = self.firebody or false
                SaveAchieve["firetime"] = self.firetime or 0
                SaveAchieve["moistbody"] = self.moistbody or false
                SaveAchieve["moisttime"] = self.moisttime or 0
				SaveAchieve["evilflower"] = self.evilflower or false
				SaveAchieve["evilfloweramount"] = self.evilfloweramount or 0
				SaveAchieve["roses"] = self.roses or false
				SaveAchieve["rosesamount"] = self.rosesamount or 0
				SaveAchieve["drown"] = self.drown or false
				SaveAchieve["lightning"] = self.lightning or false
				--Fight
                SaveAchieve["angry"] = self.angry or false
                SaveAchieve["onhitdamage"] = self.onhitdamage or 0
                SaveAchieve["tank"] = self.tank or false
				SaveAchieve["fortress"] = self.fortress or false
                SaveAchieve["attackeddamage"] = self.attackeddamage or 0
				SaveAchieve["dmgnodmg"] = self.dmgnodmg or false
				SaveAchieve["dmgnodmgamount"] = self.dmgnodmgamount or 0
				SaveAchieve["whipit"] = self.whipit or false
				SaveAchieve["whipitamount"] = self.whipitamount or 0
				SaveAchieve["whack"] = self.whack or false
				SaveAchieve["whackamount"] = self.whackamount or 0
				SaveAchieve["bullseye"] = self.bullseye or false
				SaveAchieve["bullseyeamount"] = self.bullseyeamount or 0
                SaveAchieve["sheep"] = self.sheep or false
                SaveAchieve["tentacruel"] = self.tentacruel or false
                SaveAchieve["tentacruelamount"] = self.tentacruelamount or 0
				--Hunt
                SaveAchieve["goatperd"] = self.goatperd or false
                SaveAchieve["goatperdamount"] = self.goatperdamount or 0
                SaveAchieve["mossling"] = self.mossling or false
                SaveAchieve["mosslingamount"] = self.mosslingamount or 0
                SaveAchieve["weetusk"] = self.weetusk or false
                SaveAchieve["weetuskamount"] = self.weetuskamount or 0												
                SaveAchieve["tentacool"] = self.tentacool or false
                SaveAchieve["tentacoolamount"] = self.tentacoolamount or 0
				SaveAchieve["treeguard"] = self.treeguard or false
				SaveAchieve["treeguardamount"] = self.treeguardamount or 0
				SaveAchieve["varg"] = self.varg or false
				SaveAchieve["vargamount"] = self.vargamount or 0
				SaveAchieve["koalefant"] = self.koalefant or false
				SaveAchieve["koalefantamount"] = self.koalefantamount or 0
				SaveAchieve["monkey"] = self.monkey or false
				SaveAchieve["monkeyamount"] = self.monkeyamount or 0
				SaveAchieve["horrorhound"] = self.horrorhound or false
				SaveAchieve["horrorhoundamount"] = self.horrorhoundamount or 0
				SaveAchieve["slurtle"] = self.slurtle or false
				SaveAchieve["slurtleamount"] = self.slurtleamount or 0
				SaveAchieve["werepig"] = self.werepig or false
				SaveAchieve["werepigamount"] = self.werepigamount or 0
				--Boss
                SaveAchieve["santa"] = self.santa or false
                SaveAchieve["dragonfly"] = self.dragonfly or false
				SaveAchieve["malbatross"] = self.malbatross or false				
                SaveAchieve["knight"] = self.knight or false
                SaveAchieve["bishop"] = self.bishop or false
                SaveAchieve["rook"] = self.rook or false
                SaveAchieve["minotaur"] = self.minotaur or false
                SaveAchieve["ancient"] = self.ancient or false
                SaveAchieve["rigid"] = self.rigid or false
                SaveAchieve["queen"] = self.queen or false
				SaveAchieve["crabking"] = self.crabking or false
                SaveAchieve["king"] = self.king or false
                SaveAchieve["bosswinter"] = self.bosswinter or false
                SaveAchieve["bossspring"] = self.bossspring or false
                SaveAchieve["bossantlion"] = self.bossantlion or false
                SaveAchieve["bossautumn"] = self.bossautumn or false
				--Misc
                SaveAchieve["intogame"] = self.intogame or false
                SaveAchieve["superstar"] = self.superstar or false
                SaveAchieve["starspent"] = self.starspent or 0
                SaveAchieve["trader"] = self.trader or false
                SaveAchieve["tradeamount"] = self.tradeamount or 0
                SaveAchieve["knowledge"] = self.knowledge or false
                SaveAchieve["knowledgeamount"] = self.knowledgeamount or 0
                SaveAchieve["dance"] = self.dance or false
                SaveAchieve["danceamount"] = self.danceamount or 0
                SaveAchieve["teleport"] = self.teleport or false
                SaveAchieve["teleportamount"] = self.teleportamount or 0				
				SaveAchieve["birchnut"] = self.birchnut or false
				SaveAchieve["birchnutamount"] = self.birchnutamount or 0				
                --Emer
				SaveAchieve["eathorn"] = self.eathorn or false
				SaveAchieve["eathornamount"] = self.eathornamount or 0
				SaveAchieve["eateye"] = self.eateye or false
				SaveAchieve["eateyeamount"] = self.eateyeamount or 0
				SaveAchieve["eatgold"] = self.eatgold or false
				SaveAchieve["eatgoldamount"] = self.eatgoldamount or 0
				SaveAchieve["eatefc"] = self.eatefc or false
				SaveAchieve["eatefcamount"] = self.eatefcamount or 0
				SaveAchieve["emerald"] = self.emerald or false
				SaveAchieve["emeralds"] = self.emeralds or 0
				SaveAchieve["goldcoin"] = self.goldcoin or false
				SaveAchieve["goldcoinamount"] = self.goldcoinamount or 0
				SaveAchieve["baronsuit"] = self.baronsuit or false
				SaveAchieve["baronsuitamount"] = self.baronsuitamount or 0				
				--[[SaveAchieve["luck"] = self.luck or false
				SaveAchieve["citrin"] = self.citrin or false
				SaveAchieve["amber"] = self.amber or false 
				SaveAchieve["saddle"] = self.saddle or false
				SaveAchieve["banana"] = self.banana or false
				SaveAchieve["moonrock"] = self.moonrock or false
				SaveAchieve["gnome"] = self.gnome or false
				SaveAchieve["citrins"] = self.citrins or 0 
				SaveAchieve["ambers"] = self.ambers or 0
				SaveAchieve["saddles"] = self.saddles or 0 
				SaveAchieve["bananas"] = self.bananas or 0 
				SaveAchieve["moonrocks"] = self.moonrocks or 0
				SaveAchieve["gnomes"] = self.gnomes or 0]]
			    --Mile		
                SaveAchieve["all"] = self.all or false	
                SaveAchieve["starreset"] = self.starreset or 0
				SaveAchieve["runcount"] = self.runcount or 0
                SaveAchieve["longage"] = self.longage or false
                SaveAchieve["oldage"] = self.oldage or false
                SaveAchieve["agereset"] = self.agereset or 0
                SaveAchieve["walkalot"] = self.walkalot or false				
                SaveAchieve["walktime"] = self.walktime or 0
                SaveAchieve["stopalot"] = self.stopalot or false
                SaveAchieve["stoptime"] = self.stoptime or 0				
                SaveAchieve["caveage"] = self.caveage or false
                SaveAchieve["cavetime"] = self.cavetime or 0
				SaveAchieve["rider"] = self.rider or false
				SaveAchieve["rideramount"] = self.rideramount or 0
				SaveAchieve["fullsanity"] = self.fullsanity or false
				SaveAchieve["fullsanityamount"] = self.fullsanityamount or 0
				SaveAchieve["fullhunger"] = self.fullhunger or false
				SaveAchieve["fullhungeramount"] = self.fullhungeramount or 0
				SaveAchieve["pacifist"] = self.pacifist or false
				SaveAchieve["pacifistamount"] = self.pacifistamount or 0				
                SaveAchieve["totalstar"] = inst.components.allachivcoin.coinamount + math.ceil(inst.components.allachivcoin.starsspent)
				AchievementData[inst:GetDisplayName()] = SaveAchieve
                --print("SAVED")
    end)
end
--Init
function allachivevent:Init(inst)
	if _G.SYSTEM_CONFIG == "both" or _G.SYSTEM_CONFIG == "achieve" then
		inst:DoTaskInTime(.1, function()
			self:intogamefn(inst)
			self:eatfn(inst)
			self:onhavefn(inst)
			self:onwalkfn(inst)
			self:onkilled(inst)
			self:onkilledother(inst)
			self:wakeupListener(inst)
			self:drownListener(inst)
			self:lightningListener(inst)
			self:burnorfreezeorsleep(inst)
			self:makefriend(inst)
			self:onhook(inst)
			self:onpick(inst)
			self:chopper(inst)
			self:incave(inst)
			self:miner(inst)
			self:respawn(inst)
			self:ontimepass(inst)
			self:onbuild(inst)
			self:onattacked(inst)
			self:hitother(inst)
			self:sanitycheck(inst)
			self:hungercheck(inst)
			self:ontemperature(inst)
			self:onhunger(inst)
			self:moist(inst)
			self:allget(inst)
			self:onplant(inst)
			self:onlearn(inst)
			self:doemote(inst)
			self:onteleport(inst)
			self:onreroll(inst)			   
		end)
	end

    --inst.components.combat.damagemultiplier = inst.components.combat.damagemultiplier or 1
end

--only for debug purposes
-- AllPlayers[1].components.allachivcoin.coinamount = 200
-- AllPlayers[1].components.allachivevent:grantAll(AllPlayers[1])
-- AllPlayers[1]:ApplyScale("grow",2)
function allachivevent:grantAll(inst)
	--Food
	self.firsteat = true
	self.eatrata = true	
	self.eatfish = true
	self.eatturkey = true
	self.eathot = true
	self.eatcold = true
	self.danding = true
	self.eatmole = true
	self.eatwaffle = true
	self.supereat = true
	self.alldiet = true
	--Life
	self.noob = true
	self.tooyoung = true
	self.rose = true
	self.shroom = true
	self.rot = true	
	self.deathalot = true
	self.secondchance = true
	self.messiah = true
	self.sleeptent = true
	self.sleepsiesta = true
	self.reviveamulet = true
	self.feedplayer = true	
	--Work
	self.nature = true
	self.fishmaster = true
	self.pickappren = true
	self.pickmaster = true
	self.chopappren = true
	self.chopmaster = true
	self.mineappren = true
	self.minemaster = true
	self.cookappren = true
	self.cookmaster = true
	self.buildappren = true
	self.buildmaster = true	
	--Like
	self.goodman = true
	self.brother = true
	self.catperson = true
	self.spooder = true
	self.evil = true
	self.birdclop = true
    self.pet = true
	self.lavae = true
	self.fuzzy = true	
	--Pain
	self.burn = true
	self.freeze = true
	self.sleep = true
	self.starve = true
	self.nosanity = true
	self.icebody = true
	self.firebody = true
	self.moistbody = true
	self.evilflower = true
	self.roses = true
	self.drown = true
	self.lightning = true
    --Fight
	self.angry = true
	self.tank = true
	self.fortress = true
	self.dmgnodmg = true
	self.whipit = true
	self.whack = true
	self.bullseye = true
	self.sheep = true
	self.tentacruel = true
	--Hunt
	self.goatperd = true
	self.mossling = true
	self.weetusk = true
	self.tentacool = true
	self.treeguard = true
	self.varg = true
	self.koalefant = true
	self.monkey = true
	self.horrorhound = true
	self.slurtle = true
	self.werepig = true
	--Boss
	self.santa = true
	self.dragonfly = true
	self.malbatross = true
	self.knight = true
	self.bishop = true
	self.rook = true
	self.minotaur = true
	self.ancient = true
	self.rigid = true
	self.queen = true
	self.crabking = true
	self.king = true	
    --Misc
	self.intogame = true
	self.superstar = true
	self.trader = true	
	self.knowledge = true	
	self.dance = true
	self.teleport = true
	self.birchnut = true	
	--Emer
	self.eatgold = true
	self.eatefc = true	
	self.eathorn = true
	self.eateye = true
	self.emerald = true
	self.baronsuit = true
	self.goldcoin = true	
	--[[self.luck = true
	self.citrin = true
	self.amber = true
	self.saddle = true
	self.banana = true
	self.moonrock = true
	self.gnome = true]]
	--Mile
	self.longage = true
	self.oldage = true
	self.walkalot = true
	self.stopalot = true
	self.caveage = true
	self.rider = true
	self.fullsanity = true
	self.fullhunger = true
	self.pacifist = true
end

--All Star
function allachivevent:allget(inst)
    if self.all ~= true then
        inst:DoPeriodicTask(1, function()
            if self.all ~= true then
                if  self.intogame
				--Food
                and self.firsteat			
				and self.eatrata				
				and self.eatfish
				and self.eatturkey
                and self.eathot
                and self.eatcold	
                and self.danding
				and self.eatmole
				and self.eatwaffle
                and self.supereat
				and self.alldiet				
				--Life
                and self.noob
                and self.tooyoung
				and self.rose
				and self.shroom				
                and self.rot				
				and self.deathalot
				and self.secondchance				
				and self.messiah
				and self.sleeptent
				and self.sleepsiesta
				and self.reviveamulet
				and self.feedplayer	
				--Work
				and self.nature
                and self.fishmaster
				and self.pickappren
                and self.pickmaster
				and self.chopappren
                and self.chopmaster
				and self.mineappren
				and self.minemaster
				and self.cookappren
                and self.cookmaster
                and self.buildmaster
				and self.buildappren				
				--Like
                and self.goodman
                and self.brother
				and self.catperson
				and self.spooder
                and self.evil
                and self.birdclop
                and self.pet
				and self.lavae
				and self.fuzzy
				--Pain
                and self.burn
                and self.freeze
				and self.sleep
				and self.starve
                and self.nosanity
                and self.icebody
                and self.firebody
                and self.moistbody
				and self.evilflower
				and self.roses
				and self.drown
				and self.lightning
				--Fight
                and self.angry
                and self.tank
				and self.fortress
				and self.dmgnodmg
				and self.whipit	
				and self.whack
				and self.bullseye
                and self.sheep
				and self.tentacruel	
				--Hunt
				and self.goatperd
				and self.mossling
				and self.weetusk
                and self.tentacool
				and self.treeguard
				and self.varg
				and self.koalefant
				and self.monkey
				and self.horrorhound
				and self.slurtle
				and self.werepig				
				--Boss
				and self.santa
				and self.dragonfly
				and self.malbatross
				and self.knight
				and self.bishop
				and self.rook
				and self.minotaur
                and self.ancient
                and self.rigid
                and self.queen
				and self.crabking
                and self.king
				--Misc
                and self.superstar
				and self.trader				
                and self.knowledge				
                and self.dance				
                and self.teleport
				and self.birchnut								
				--Emer
				and self.eatgold
				and self.eatefc				
				and self.eathorn
				and self.eateye	
				and self.emerald				
				and self.goldcoin	
				and self.baronsuit					
                --[[
                and self.luck
				and self.citrin 
				and self.amber
				and self.saddle
				and self.banana
				and self.moonrock 
				and self.gnome]] 
				--Mile
                and self.longage
                and self.oldage
                and self.walkalot
                and self.stopalot
                and self.caveage
				and self.rider
				and self.fullsanity
				and self.fullhunger
				and self.pacifist	
                then
                    self.all = true
                    inst:DoTaskInTime(2.5, function()
                        self:seffc(inst, "all")
						local item1 = SpawnPrefab("goldcoin")
						item1.components.stackable:SetStackSize(99)
						inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
						local item2 = SpawnPrefab("emerdiploma")
						inst.components.inventory:GiveItem(item2, nil, inst:GetPosition())
                        inst:DoTaskInTime(.3, function()
                            inst.sg:GoToState("mime")
                            if not inst.components.locomotor.wantstomoveforward then inst.sg:AddStateTag("busy") end
                            for i=1, 25 do
                                inst:DoTaskInTime(i/25*3, function()
                                    local pos = Vector3(inst.Transform:GetWorldPosition())
                                    SpawnPrefab("explode_firecrackers").Transform:SetPosition(pos.x+math.random(-3,3), pos.y, pos.z+math.random(-3,3))
                                end)
                            end
                        end)
						print(self.runcount, _G._G.PLAYS_CONFIG)
						if self.runcount < _G.PLAYS_CONFIG then
							self.runcount = self.runcount + 1						
							--Food
							self.firsteat = false
							self.eatrata = false
							self.eatrataamount = 0							
							self.eatfish = false
							self.eatfishamount = 0
							self.eatturkey = false
							self.eatturkeyamount = 0
						    self.eathot = false
							self.eatcold = false
							self.eathotamount = 0
							self.eatcoldamount = 0							
							self.danding = false
							self.eatmonsterlasagna = 0							
							self.eatmole = false
							self.eatmoleamount = 0							
							self.eatwaffle = false
							self.eatwaffleamount = 0
							self.supereat = false
							self.eatamount = 0
							self.alldiet = false
							self.eatall = 0
							self.eatlist = copylist(foodmenu)
							self:updateMeatatarianFoodList()
							--Life
							self.noob = false
							self.tooyoung = false
							self.rose = false
							self.shroom = false
							self.rot = false
							self.deathalot = false
							self.deathamouth = 0
							self.secondchance = false							
						    self.messiah = false
							self.respawnamount = 0
							self.sleeptent = false
							self.sleeptentamount = 0
							self.sleepsiesta = false
							self.sleepsiestaamount = 0
							self.reviveamulet = false
							self.reviveamuletamount = 0
							self.feedplayer = false
							self.feedplayeramount = 0
							--Work
							self.nature = false
							self.natureamount = 0
							self.fishmaster = false
							self.fishamount = 0
							self.pickappren = false
							self.pickmaster = false
							self.pickamount = 0
							self.chopappren = false
							self.chopmaster = false
							self.chopamount = 0
							self.cookappren = false
							self.cookmaster = false
							self.cookamount = 0
							self.mineappren = false
							self.minemaster = false
							self.mineamount = 0
							self.buildappren = false
							self.buildmaster = false
							self.buildamount = 0						
							--Like
							self.goodman = false
							self.friendpig = 0
							self.brother = false
							self.friendbunny = 0
							self.catperson = false
							self.friendcat = 0
							self.spooder = false
							self.friendspider = 0
							self.evil = false
							self.evilamount = 0
							self.birdclop = false
							self.pet = false
							self.lavae = false
							self.fuzzy = false
							self.fuzzyamount = 0
							--Pain
							self.burn = false
							self.freeze = false
							self.sleep = false
							self.starve = false
							self.starvetime = 0
							self.nosanity = false
							self.nosanitytime = 0
							self.icebody = false
							self.icetime = 0
							self.firebody = false
							self.firetime = 0
							self.moistbody = false
							self.moisttime = 0
							self.evilflower = false
							self.evilfloweramount = 0
							self.roses = false
							self.rosesamount = 0
							self.drown = false
							self.lightning = false	
							--Fight
							self.angry = false
							self.onhitdamage = 0
							self.tank = false
							self.fortress = false
							self.attackeddamage = 0											
							self.dmgnodmg = false
							self.dmgnodmgamount = 0
							self.whipit = false
							self.whipitamount = 0
							self.whack = false
							self.whackamount = 0
							self.bullseye = false
							self.bullseyeamount = 0
							self.sheep = false
							self.tentacruel = false
							self.tentacruelamount = 0
							--Hunt
							self.goatperd = false
							self.goatperdamount = 0
							self.mossling = false
							self.mosslingamount = 0
							self.weetusk = false
							self.weetuskamount = 0
							self.tentacool = false
							self.tentacoolamount = 0
							self.treeguard = false
							self.treeguardamount = 0
							self.varg = false
							self.vargamount = 0
							self.koalefant = false
							self.koalefantamount = 0
							self.monkey = false
							self.monkeyamount = 0
							self.horrorhound = false
							self.horrorhoundamount = 0
							self.slurtle = false
							self.slurtleamount = 0
							self.werepig = false
							self.werepigamount = 0
							--Boss
							self.santa = false
							self.dragonfly = false
							self.malbatross = false	
							self.knight = false
							self.bishop = false
							self.rook = false
							self.minotaur = false						
							self.ancient = false
							self.rigid = false
							self.queen = false
							self.crabking = false
							self.king = false
							self.bosswinter = false
							self.bossspring = false
							self.bossantlion = false
							self.bossautumn = false
							--Misc
							self.intogame = true
							self.superstar = false
							self.starspent = 0							
							self.trader = false
							self.tradeamount = 0
							self.knowledge = false							
							self.dance = false
							self.danceamount = 0
							self.teleport = false
							self.teleportamount = 0							
							self.birchnut = false
							self.birchnutamount = 0													
							--Emer
							self.eatgold = false
							self.eatgoldamount = 0	
							self.eatefc = false
							self.eatefcamount = 0							
							self.eathorn = false
							self.eathornamount = 0
							self.eateye = false
							self.eateyenamount = 0
							self.emerald = false
							self.emeralds = 0							
							self.goldcoin = false
							self.goldcoinamount = 0
							self.baronsuit = false
							self.baronsuitamount = 0														
							--[[self.luck = false
							self.citrin = false
							self.amber = false
							self.saddle = false
							self.banana = false
							self.moonrock = false
							self.gnome = false
							self.mosquito = false
							self.citrins = 0
							self.ambers = 0
							self.saddles = 0
							self.bananas = 0
							self.moonrocks = 0
							self.gnomes = 0]]
							--Mile
							self.all = false
							self.longage = false
							self.oldage = false
							self.age = 1						
							self.walkalot = false
							self.walktime = 0
							self.stopalot = false
							self.stoptime = 0
							self.caveage = false
							self.cavetime = 0
							self.rider = false
							self.rideramount = 0
							self.fullsanity = false
							self.fullsanityamount = 0
							self.fullhunger = false
							self.fullhungeramount = 0
							self.pacifist = false
							self.pacifistamount = 0
							
							self.starreset = inst.components.allachivcoin.starsspent
							self.agereset = math.ceil(inst.components.age:GetAge() / TUNING.TOTAL_DAY_TIME)
							self:intogamefn(inst)
						end
                    end)
                end
            end
        end)
    end
end

return allachivevent
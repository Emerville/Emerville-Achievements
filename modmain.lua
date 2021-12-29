local _G = GLOBAL
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local Recipe = GLOBAL.Recipe
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local TECH = GLOBAL.TECH
local ACTIONS = GLOBAL.ACTIONS
local ActionHandler = GLOBAL.ActionHandler
local TUNING = _G.TUNING
local CUSTOM_RECIPETABS = _G.CUSTOM_RECIPETABS

_G.CAVES_CONFIG = GetModConfigData('CAVES')
_G.MULT_CONFIG = GetModConfigData('MULT')
_G.REFUND_CONFIG = GetModConfigData('REFUND')
_G.SYSTEM_CONFIG = GetModConfigData('SYSTEM')
_G.HIDEPERK_CONFIG = GetModConfigData('HIDEPERK')
_G.STARTGEAR_CONFIG = GetModConfigData('GEAR')
_G.COSTRAISE_CONFIG = GetModConfigData('COSTRAISE')
_G.PLAYS_CONFIG = GetModConfigData('PLAYS')
_G.GAMEBREAKER = GetModConfigData('GAMEBREAKER')
_G.EXPMULT = GetModConfigData('EXPMULT')
_G.LEVELXP = GetModConfigData('LEVELXP')
_G.LEVELPOINTS = GetModConfigData('LEVELPOINTS')


require 'AllAchiv/allachivbalance'
require "AllAchiv/allachivrpc"
_G.LANGUAGE = GetModConfigData('LANGUAGE')
if _G.LANGUAGE == "kr" then
	require 'AllAchiv/strings_acm_kr'
elseif _G.LANGUAGE == "ptbr" then
	require 'AllAchiv/strings_acm_ptbr'
elseif _G.LANGUAGE == "es" then
	require 'AllAchiv/strings_acm_es'
elseif _G.LANGUAGE == "it" then
	require 'AllAchiv/strings_acm_it'
elseif _G.LANGUAGE == "chs" then
	require 'AllAchiv/strings_acm_chs'
elseif _G.LANGUAGE == "cht" then
	require 'AllAchiv/strings_acm_cht'
elseif _G.LANGUAGE == "ru" then
	require 'AllAchiv/strings_acm_ru'
elseif _G.LANGUAGE == "de" then
	require 'AllAchiv/strings_acm_de'
elseif _G.LANGUAGE == "vi" then
	require 'AllAchiv/strings_acm_vi'
else
	require 'AllAchiv/strings_acm_e'
end



local MANRESPAWN = GetModConfigData('MANDRAKEBOI')
if MANRESPAWN then
    if GLOBAL.STRINGS.NAMES.MIGRATION_PORTAL then
        AddPrefabPostInit("forest", function(inst)
            if inst.ismastersim then
                inst:AddComponent("minspawner")
            end
        end)
    else
        AddPrefabPostInit("world", function(inst)
            if inst.ismastersim then
                inst:AddComponent("minspawner")
            end
        end)
    end
end

PrefabFiles = {
    "seffc",
    "pigking",
    "antlion",
	"emerdiploma",
    "cabinchair1",
    "cabinchair2",
    "girlychair1",
    "girlychair2",
    "circuschair1",	
    "circuschair2",
	"diningtable",	
	"uncompromising_rat",
	"luis_rat",
	"mario_rat",
	"whisper_rat",
	
	--Flutes
	"sleep_flute",
	"flute_light",
	"flute_harvest",
	"flute_spirit",
	"flute_fortification",
	"flute_frost",
	"rock_iceperk",
	"stalker_bulb_perk",
	"sand_spikeperk",
    "maxwell",
}

_G.SECONDRUN = GetModConfigData('SECOND')										 

Assets = {
	Asset("SOUNDPACKAGE", "sound/dancingqueen.fev"),
	Asset("SOUND", "sound/dancingqueen.fsb"),
	Asset("SOUNDPACKAGE", "sound/rainonme.fev"),
	Asset("SOUND", "sound/rainonme.fsb"),
	Asset("SOUNDPACKAGE", "sound/rats.fev"),
	Asset("SOUND", "sound/rats.fsb"),

    Asset("ATLAS", "images/inventoryimages/achivbook_birds.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_birds.tex"),
    Asset("ATLAS", "images/inventoryimages/achivbook_brimstone.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_brimstone.tex"),
    Asset("ATLAS", "images/inventoryimages/achivbook_gardening.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_gardening.tex"),
    Asset("ATLAS", "images/inventoryimages/achivbook_sleep.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_sleep.tex"),
    Asset("ATLAS", "images/inventoryimages/achivbook_tentacles.xml"),
    Asset("IMAGE", "images/inventoryimages/achivbook_tentacles.tex"),
    Asset("ATLAS", "images/inventoryimages/book_carrot.xml"),
    Asset("IMAGE", "images/inventoryimages/book_carrot.tex"),	
	Asset("ATLAS", "images/inventoryimages/altar.xml"),
    Asset("IMAGE", "images/inventoryimages/altar.tex"),
	
	Asset("ATLAS", "images/hud/background_lmod.xml"),
    Asset("IMAGE", "images/hud/background_lmod.tex"),
	Asset("ATLAS", "images/hud/background_info.xml"),
    Asset("IMAGE", "images/hud/background_info.tex"),
	Asset("ATLAS", "images/hud/star.xml"),
    Asset("IMAGE", "images/hud/star.tex"),
	Asset("ATLAS", "images/hud/reset_info.xml"),
    Asset("IMAGE", "images/hud/reset_info.tex"),
	Asset("ATLAS", "images/hud/xpbar_empty.xml"),
    Asset("IMAGE", "images/hud/xpbar_empty.tex"),
	Asset("ATLAS", "images/hud/levelbadge.xml"),
    Asset("IMAGE", "images/hud/levelbadge.tex"),
	Asset("ATLAS", "images/hud/xpbar_filled.xml"),
    Asset("IMAGE", "images/hud/xpbar_filled.tex"),

	Asset("ATLAS", "images/button/perk.xml"),
    Asset("IMAGE", "images/button/perk.tex"),
	Asset("ATLAS", "images/button/perk_active.xml"),
    Asset("IMAGE", "images/button/perk_active.tex"),
	Asset("ATLAS", "images/button/button_bg.xml"),
    Asset("IMAGE", "images/button/button_bg.tex"),
	Asset("ATLAS", "images/button/button_bg_inactive.xml"),
    Asset("IMAGE", "images/button/button_bg_inactive.tex"),
	Asset("ATLAS", "images/button/achievement.xml"),
    Asset("IMAGE", "images/button/achievement.tex"),
	Asset("ATLAS", "images/button/achievement_active.xml"),
    Asset("IMAGE", "images/button/achievement_active.tex"),
    Asset("ATLAS", "images/button/checkbutton.xml"),
    Asset("IMAGE", "images/button/checkbutton.tex"),
    Asset("ATLAS", "images/button/coinbutton.xml"),
    Asset("IMAGE", "images/button/coinbutton.tex"),
    Asset("ATLAS", "images/button/config_act.xml"),
    Asset("IMAGE", "images/button/config_act.tex"),
    Asset("ATLAS", "images/button/config_bg.xml"),
    Asset("IMAGE", "images/button/config_bg.tex"),
    Asset("ATLAS", "images/button/config_bigger.xml"),
    Asset("IMAGE", "images/button/config_bigger.tex"),
    Asset("ATLAS", "images/button/config_smaller.xml"),
    Asset("IMAGE", "images/button/config_smaller.tex"),
	Asset("ATLAS", "images/button/config_language.xml"),
    Asset("IMAGE", "images/button/config_language.tex"),
	Asset("ATLAS", "images/button/levelplus.xml"),
    Asset("IMAGE", "images/button/levelplus.tex"),
	Asset("ATLAS", "images/button/mainbutton_bg.xml"),
    Asset("IMAGE", "images/button/mainbutton_bg.tex"),
	Asset("ATLAS", "images/button/mainbutton_bg_achieve.xml"),
    Asset("IMAGE", "images/button/mainbutton_bg_achieve.tex"),

	--Flutes
	Asset("IMAGE", "images/inventoryimages/brimstone_flute.tex"),
	Asset("ATLAS", "images/inventoryimages/brimstone_flute.xml"),
	Asset("IMAGE", "images/inventoryimages/sleep_flute.tex"),
	Asset("ATLAS", "images/inventoryimages/sleep_flute.xml"),	
	Asset("IMAGE", "images/inventoryimages/gardening_flute.tex"),
	Asset("ATLAS", "images/inventoryimages/gardening_flute.xml"),	
	Asset("IMAGE", "images/inventoryimages/birds_flute.tex"),
	Asset("ATLAS", "images/inventoryimages/birds_flute.xml"),
	Asset("IMAGE", "images/inventoryimages/tentacles_flute.tex"),
	Asset("ATLAS", "images/inventoryimages/tentacles_flute.xml"),
    
-----Tab
    Asset( "ATLAS", "images/inventoryimages/perk_tab.xml" ),

	Asset("ANIM", "anim/altar.zip"),	
}
AddMinimapAtlas("images/inventoryimages/altar.xml")

--Dining Table
modimport("scripts/diningtableaction.lua")
TUNING.DINING_BUFF = 1.20 --Dinner Table stat buff.

STRINGS.NAMES.PERK_TAB = "REWARD"
STRINGS.TABS.PERK_TAB = "Rewards"
GLOBAL.RECIPETABS['PERK_TAB'] = {str = "PERK_TAB", sort=25, icon = "perk_tab.tex", icon_atlas = "images/inventoryimages/perk_tab.xml"}

---MOON ALTAR
local moonglassaxe = AddRecipe("moonglassaxe_perk", {Ingredient("twigs", 4), Ingredient("moonglass", 4)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "lunarcraft")
moonglassaxe.image = "moonglassaxe.tex"
moonglassaxe.product = "moonglassaxe"
GLOBAL.STRINGS.RECIPE_DESC.MOONGLASSAXE_PERK = GLOBAL.STRINGS.RECIPE_DESC.MOONGLASSAXE
GLOBAL.STRINGS.NAMES.MOONGLASSAXE_PERK = GLOBAL.STRINGS.NAMES.MOONGLASSAXE

local glasscutter = AddRecipe("glasscutter_perk", {Ingredient("boards", 2), Ingredient("moonglass", 7)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "lunarcraft")
glasscutter.image = "glasscutter.tex"
glasscutter.product = "glasscutter"
GLOBAL.STRINGS.RECIPE_DESC.GLASSCUTTER_PERK = GLOBAL.STRINGS.RECIPE_DESC.GLASSCUTTER
GLOBAL.STRINGS.NAMES.GLASSCUTTER_PERK = GLOBAL.STRINGS.NAMES.GLASSCUTTER

local turf_meteor = AddRecipe("turf_meteor_perk", {Ingredient("moonrocknugget", 1), Ingredient("moonglass", 3)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, 6, "lunarcraft")
turf_meteor.image = "turf_meteor.tex"
turf_meteor.product = "turf_meteor"
GLOBAL.STRINGS.RECIPE_DESC.TURF_METEOR_PERK = GLOBAL.STRINGS.RECIPE_DESC.TURF_METEOR
GLOBAL.STRINGS.NAMES.TURF_METEOR_PERK = GLOBAL.STRINGS.NAMES.TURF_METEOR

local bathbomb = AddRecipe("bathbomb_perk", {Ingredient("moon_tree_blossom", 8), Ingredient("nitre", 1)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "lunarcraft")
bathbomb.image = "bathbomb.tex"
bathbomb.product = "bathbomb"
GLOBAL.STRINGS.RECIPE_DESC.BATHBOMB_PERK = GLOBAL.STRINGS.RECIPE_DESC.BATHBOMB
GLOBAL.STRINGS.NAMES.BATHBOMB_PERK = GLOBAL.STRINGS.NAMES.BATHBOMB

local chesspiece_butterfly_sketch = AddRecipe("chesspiece_butterfly_sketch_perk", {Ingredient("papyrus", 2)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "lunarcraft")
chesspiece_butterfly_sketch.image = "chesspiece_butterfly_sketch.tex"
chesspiece_butterfly_sketch.product = "chesspiece_butterfly_sketch"
GLOBAL.STRINGS.RECIPE_DESC.CHESSPIECE_BUTTERFLY_SKETCH_PERK = GLOBAL.STRINGS.RECIPE_DESC.CHESSPIECE_BUTTERFLY_SKETCH
GLOBAL.STRINGS.NAMES.CHESSPIECE_BUTTERFLY_SKETCH_PERK = GLOBAL.STRINGS.NAMES.CHESSPIECE_BUTTERFLY_SKETCH

local chesspiece_moon_sketch = AddRecipe("chesspiece_moon_sketch_perk", {Ingredient("papyrus", 2)},
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "lunarcraft")
chesspiece_moon_sketch.image = "chesspiece_moon_sketch.tex"
chesspiece_moon_sketch.product = "chesspiece_moon_sketch"
GLOBAL.STRINGS.RECIPE_DESC.CHESSPIECE_MOON_SKETCH_PERK = GLOBAL.STRINGS.RECIPE_DESC.CHESSPIECE_MOON_SKETCH
GLOBAL.STRINGS.NAMES.CHESSPIECE_MOON_SKETCH_PERK = GLOBAL.STRINGS.NAMES.CHESSPIECE_MOON_SKETCH

--[[
----ANCIENT ALTAR----
local thulecite = AddRecipe("thulecite_perk", {Ingredient("thulecite_pieces", 6)}, 
GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, nil, nil, nil, nil, "ancientstation")
thulecite.image = "thulecite.tex"
thulecite.product = "thulecite"
GLOBAL.STRINGS.RECIPE_DESC.THULECITE_PERK = GLOBAL.STRINGS.RECIPE_DESC.THULECITE
GLOBAL.STRINGS.NAMES.THULECITE_PERK = GLOBAL.STRINGS.NAMES.THULECITE]]

--------------------------------------------------------------------------
--[[ ANCIENT RESEARCH ]]
--------------------------------------------------------------------------
local box_gear_ingredient = Ingredient("box_gear", 1)
box_gear_ingredient.atlas = "images/inventoryimages/box_gear.xml"

local box_gear = AddRecipe("box_gear_perk",
{Ingredient("minotaurhorn", 1), Ingredient("gears", 12), Ingredient("yellowgem", 2)},  
RECIPETABS.PERK_TAB,
TECH.NONE,
nil,
nil,
nil,
nil,
"ancientstation")
box_gear.atlas = "images/inventoryimages/box_gear.xml"
box_gear.image = "box_gear.tex"
box_gear.product = "box_gear"

local gears_hat_goggles = AddRecipe("gears_hat_goggles_perk",
{box_gear_ingredient, Ingredient("thulecite", 5), Ingredient("yellowgem", 1)},  
RECIPETABS.PERK_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
"ancientstation")
gears_hat_goggles.atlas = "images/inventoryimages/gears_hat_goggles.xml"
gears_hat_goggles.image = "gears_hat_goggles.tex"
gears_hat_goggles.product = "gears_hat_goggles"

local gears_staff = AddRecipe("gears_staff_perk",
{box_gear_ingredient, Ingredient("thulecite", 10), Ingredient("yellowgem", 1)}, 
RECIPETABS.PERK_TAB,
TECH.NONE,
nil,
nil,
nil,
nil,
"ancientstation")
gears_staff.atlas = "images/inventoryimages/gears_staff.xml"
gears_staff.image = "gears_staff.tex"
gears_staff.product = "gears_staff"

local gears_mace = AddRecipe("gears_mace_perk",
{box_gear_ingredient, Ingredient("thulecite", 8), Ingredient("purplegem", 2)}, 
RECIPETABS.PERK_TAB,
TECH.NONE,
nil,
nil,
nil,
nil,
"ancientstation")
gears_mace.atlas = "images/inventoryimages/gears_mace.xml"
gears_mace.image = "gears_mace.tex"
gears_mace.product = "gears_mace"

local stampede = AddRecipe("stampede_perk", 
{Ingredient("minotaurhorn", 1), Ingredient("bearger_fur", 1), Ingredient("purplegem", 3)}, 
RECIPETABS.PERK_TAB,
TECH.NONE,
nil,
nil,
nil,
nil,
"ancientstation")
stampede.atlas = "images/inventoryimages/stampede.xml"
stampede.image = "stampede.tex"
stampede.product = "stampede"

local hornucopia = AddRecipe("hornucopia_perk",
{Ingredient("minotaurhorn", 1),Ingredient("horn", 1),Ingredient("bonestew", 3)},  
RECIPETABS.PERK_TAB,
TECH.NONE,
nil,
nil,
nil,
nil,
"ancientstation")
hornucopia.atlas = "images/inventoryimages/hornucopia.xml"
hornucopia.image = "hornucopia.tex"
hornucopia.product = "hornucopia"

--------------------------------------------------------------------------
--[[ BUSINESS OWNER ]]
--------------------------------------------------------------------------
local cabinchair1 = AddRecipe("cabinchair1", 
{Ingredient("boards", 1), Ingredient("twigs", 3)}, 
RECIPETABS.PERK_TAB,
TECH.NONE,
"cabinchair1_placer",
1,
nil,
nil,
"businessowner")
cabinchair1.atlas = "images/inventoryimages/cabinchair1.xml"
cabinchair1.image = "cabinchair1.tex"
cabinchair1.product = "cabinchair1"

local cabinchair2 = AddRecipe("cabinchair2", 
{Ingredient("boards", 1), Ingredient("twigs", 3)}, 
RECIPETABS.PERK_TAB,
TECH.NONE,
"cabinchair2_placer",
1,
nil,
nil,
"businessowner")
cabinchair2.atlas = "images/inventoryimages/cabinchair2.xml"
cabinchair2.image = "cabinchair2.tex"
cabinchair2.product = "cabinchair2"

local girlychair1 = AddRecipe("girlychair1", 
{Ingredient("boards", 1), Ingredient("petals", 3), Ingredient("twigs", 3)}, 
RECIPETABS.PERK_TAB,
TECH.NONE, 
"girlychair1_placer",
1,
nil,
nil,
"businessowner")
girlychair1.atlas = "images/inventoryimages/girlychair1.xml"
girlychair1.image = "girlychair1.tex"
girlychair1.product = "girlychair1"

local girlychair2 = AddRecipe("girlychair2", 
{Ingredient("boards", 1), Ingredient("petals", 3), Ingredient("twigs", 3)}, 
RECIPETABS.PERK_TAB,
TECH.NONE, 
"girlychair2_placer",
1,
nil,
nil,
"businessowner")
girlychair2.atlas = "images/inventoryimages/girlychair2.xml"
girlychair2.image = "girlychair2.tex"
girlychair2.product = "girlychair2"

local circuschair1 = AddRecipe("circuschair1", 
{Ingredient("boards", 2), Ingredient("beefalowool", 3), Ingredient("berries", 4)}, 
RECIPETABS.PERK_TAB,
TECH.NONE, 
"circuschair1_placer",
1,
nil,
nil,
"businessowner")
circuschair1.atlas = "images/inventoryimages/circuschair1.xml"
circuschair1.image = "circuschair1.tex"
circuschair1.product = "circuschair1"

local circuschair2 = AddRecipe("circuschair2", 
{Ingredient("boards", 2), Ingredient("beefalowool", 3), Ingredient("berries", 4)}, 
RECIPETABS.PERK_TAB,
TECH.NONE, 
"circuschair2_placer",
1,
nil,
nil,
"businessowner")
circuschair2.atlas = "images/inventoryimages/circuschair2.xml"
circuschair2.image = "circuschair2.tex"
circuschair2.product = "circuschair2"

local diningtable = AddRecipe("diningtable",
{Ingredient("marble", 4), Ingredient("boards", 4), Ingredient("bluegem", 15)},
RECIPETABS.PERK_TAB,
TECH.NONE,
"diningtable_placer",
1.4,
nil,
nil,
"businessowner")
diningtable.atlas = "images/inventoryimages/diningtable.xml"
diningtable.image = "diningtable.tex"
diningtable.product = "diningtable"

--[[AddRecipe("ancient_altar", {Ingredient("thulecite", 15), Ingredient("cutstone", 20), Ingredient("purplegem", 2)}, GLOBAL.RECIPETABS.PERK_TAB, TECH.NONE, 
"ancient_altar_placer", --placer
nil, -- min_spacing
nil, -- nounlock
nil, -- numtogive
"ancientstation", -- builder_tag
"images/inventoryimages/altar.xml", -- atlas
"altar.tex") -- image]]

--------------------------------------------------------------------------
--[[ ARTS DEGREE ]]
--------------------------------------------------------------------------
local flute_light = AddRecipe("flute_light",
{Ingredient("papyrus", 2), Ingredient("nightmarefuel", 2), Ingredient("poop", 1)},
RECIPETABS.PERK_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
"artsdegree")
flute_light.atlas = "images/inventoryimages/birds_flute.xml"
flute_light.image = "birds_flute.tex"
flute_light.product = "flute_light"

local flute_harvest = AddRecipe("flute_harvest",
{Ingredient("papyrus", 2), Ingredient("nightmarefuel", 3), Ingredient("lureplantbulb", 1)},
RECIPETABS.PERK_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
"artsdegree")
flute_harvest.atlas = "images/inventoryimages/gardening_flute.xml"
flute_harvest.image = "gardening_flute.tex"
flute_harvest.product = "flute_harvest"

local flute_frost = AddRecipe("flute_frost",
{Ingredient("papyrus", 2), Ingredient("nightmarefuel", 5), Ingredient("bluegem", 2)},
RECIPETABS.PERK_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
"artsdegree")
flute_frost.atlas = "images/inventoryimages/sleep_flute.xml"
flute_frost.image = "sleep_flute.tex"
flute_frost.product = "flute_frost"

local flute_fortification = AddRecipe("flute_fortification",
{Ingredient("papyrus", 2), Ingredient("nightmarefuel", 5), Ingredient("townportaltalisman", 2)},
RECIPETABS.PERK_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
"artsdegree")
flute_fortification.atlas = "images/inventoryimages/brimstone_flute.xml"
flute_fortification.image = "brimstone_flute.tex"
flute_fortification.product = "flute_fortification"

local flute_spirit = AddRecipe("flute_spirit",
{Ingredient("papyrus", 2), Ingredient("nightmarefuel", 5), Ingredient("purplegem", 2)},
RECIPETABS.PERK_TAB, 
TECH.NONE,
nil,
nil,
nil,
nil,
"artsdegree")
flute_spirit.atlas = "images/inventoryimages/tentacles_flute.xml"
flute_spirit.image = "tentacles_flute.tex"
flute_spirit.product = "flute_spirit"


AddPlayerPostInit(function(inst)	
	--Food
	inst.checkfirsteat = GLOBAL.net_shortint(inst.GUID,"checkfirsteat")
	inst.checksupereat = GLOBAL.net_shortint(inst.GUID,"checksupereat")
	inst.checkeatrata = GLOBAL.net_shortint(inst.GUID,"checkeatrata")
	inst.checkeatfish = GLOBAL.net_shortint(inst.GUID,"checkeatfish")
	inst.checkeatturkey = GLOBAL.net_shortint(inst.GUID,"checkeatturkey")
    inst.checkeathot = GLOBAL.net_shortint(inst.GUID,"checkeathot")
    inst.checkeatcold = GLOBAL.net_shortint(inst.GUID,"checkeatcold")	
	inst.checkdanding = GLOBAL.net_shortint(inst.GUID,"checkdanding")	
	inst.checkeatmole = GLOBAL.net_shortint(inst.GUID,"checkeatmole")	
	inst.checkeatwaffle = GLOBAL.net_shortint(inst.GUID,"checkeatwaffle")
    inst.checkalldiet = GLOBAL.net_shortint(inst.GUID,"checkalldiet")
	--Life
    inst.checknoob = GLOBAL.net_shortint(inst.GUID,"checknoob")
    inst.checktooyoung = GLOBAL.net_shortint(inst.GUID,"checktooyoung")
    inst.checkrose = GLOBAL.net_shortint(inst.GUID,"checkrose")
    inst.checkshroom = GLOBAL.net_shortint(inst.GUID,"checkshroom")
    inst.checkrot = GLOBAL.net_shortint(inst.GUID,"checkrot")
    inst.checkdeathalot = GLOBAL.net_shortint(inst.GUID,"checkdeathalot")
    inst.checksecondchance = GLOBAL.net_shortint(inst.GUID,"checksecondchance")
    inst.checkmessiah = GLOBAL.net_shortint(inst.GUID,"checkmessiah")
	inst.checksleeptent = GLOBAL.net_shortint(inst.GUID,"checksleeptent")
	inst.checksleepsiesta = GLOBAL.net_shortint(inst.GUID,"checksleepsiesta")
	inst.checkreviveamulet = GLOBAL.net_shortint(inst.GUID,"checkreviveamulet")
	inst.checkfeedplayer = GLOBAL.net_shortint(inst.GUID,"checkfeedplayer")
	--Work
    inst.checknature = GLOBAL.net_shortint(inst.GUID,"checknature")
    inst.checkfishmaster = GLOBAL.net_shortint(inst.GUID,"checkfishmaster")
    inst.checkpickappren = GLOBAL.net_shortint(inst.GUID,"checkpickappren")
    inst.checkpickmaster = GLOBAL.net_shortint(inst.GUID,"checkpickmaster")
    inst.checkchopappren = GLOBAL.net_shortint(inst.GUID,"checkchopappren")
    inst.checkchopmaster = GLOBAL.net_shortint(inst.GUID,"checkchopmaster")
    inst.checkmineappren = GLOBAL.net_shortint(inst.GUID,"checkmineappren")
    inst.checkminemaster = GLOBAL.net_shortint(inst.GUID,"checkminemaster")
    inst.checkcookappren = GLOBAL.net_shortint(inst.GUID,"checkcookappren")
    inst.checkcookmaster = GLOBAL.net_shortint(inst.GUID,"checkcookmaster")
    inst.checkbuildappren = GLOBAL.net_shortint(inst.GUID,"checkbuildappren")
    inst.checkbuildmaster = GLOBAL.net_shortint(inst.GUID,"checkbuildmaster")		
	--Like
    inst.checkgoodman = GLOBAL.net_shortint(inst.GUID,"checkgoodman")
    inst.checkbrother = GLOBAL.net_shortint(inst.GUID,"checkbrother")
    inst.checkcatperson = GLOBAL.net_shortint(inst.GUID,"checkcatperson")
    inst.checkspooder = GLOBAL.net_shortint(inst.GUID,"checkspooder")
    inst.checkevil = GLOBAL.net_shortint(inst.GUID,"checkevil")
    inst.checkbirdclop = GLOBAL.net_shortint(inst.GUID,"checkbirdclop")
    inst.checkpet = GLOBAL.net_shortint(inst.GUID,"checkpet")
	inst.checklavae = GLOBAL.net_shortint(inst.GUID,"checklavae")
	inst.checkfuzzy = GLOBAL.net_shortint(inst.GUID,"checkfuzzy")
	--Pain
    inst.checkburn = GLOBAL.net_shortint(inst.GUID,"checkburn")
    inst.checkfreeze = GLOBAL.net_shortint(inst.GUID,"checkfreeze")
    inst.checksleep = GLOBAL.net_shortint(inst.GUID,"checksleep")
    inst.checkstarve = GLOBAL.net_shortint(inst.GUID,"checkstarve")
    inst.checknosanity = GLOBAL.net_shortint(inst.GUID,"checknosanity")
    inst.checkicebody = GLOBAL.net_shortint(inst.GUID,"checkicebody")
    inst.checkfirebody = GLOBAL.net_shortint(inst.GUID,"checkfirebody")
    inst.checkmoistbody = GLOBAL.net_shortint(inst.GUID,"checkmoistbody")
	inst.checkevilflower = GLOBAL.net_shortint(inst.GUID,"checkevilflower")
	inst.checkroses = GLOBAL.net_shortint(inst.GUID,"checkroses")
	inst.checkdrown = GLOBAL.net_shortint(inst.GUID,"checkdrown")
	inst.checklightning = GLOBAL.net_shortint(inst.GUID,"checklightning")
	--Fight
    inst.checkangry = GLOBAL.net_shortint(inst.GUID,"checkangry")
    inst.checktank = GLOBAL.net_shortint(inst.GUID,"checktank")
    inst.checkfortress = GLOBAL.net_shortint(inst.GUID,"checkfortress")
	inst.checkdmgnodmg = GLOBAL.net_shortint(inst.GUID,"checkdmgnodmg")
	inst.checkwhipit = GLOBAL.net_shortint(inst.GUID,"checkwhipit")
	inst.checkwhack = GLOBAL.net_shortint(inst.GUID,"checkwhack")
	inst.checkbullseye = GLOBAL.net_shortint(inst.GUID,"checkbullseye")
    inst.checksheep = GLOBAL.net_shortint(inst.GUID,"checksheep")
    inst.checktentacruel = GLOBAL.net_shortint(inst.GUID,"checktentacruel")
	--Hunt
    inst.checkgoatperd = GLOBAL.net_shortint(inst.GUID,"checkgoatperd")
    inst.checkmossling = GLOBAL.net_shortint(inst.GUID,"checkmossling")
    inst.checkweetusk = GLOBAL.net_shortint(inst.GUID,"checkweetusk")
    inst.checktentacool = GLOBAL.net_shortint(inst.GUID,"checktentacool")
	inst.checktreeguard = GLOBAL.net_shortint(inst.GUID,"checktreeguard")
	inst.checkvarg = GLOBAL.net_shortint(inst.GUID,"checkvarg")
	inst.checkkoalefant = GLOBAL.net_shortint(inst.GUID,"checkkoalefant")
	inst.checkmonkey = GLOBAL.net_shortint(inst.GUID,"checkmonkey")
	inst.checkhorrorhound = GLOBAL.net_shortint(inst.GUID,"checkhorrorhound")
	inst.checkslurtle = GLOBAL.net_shortint(inst.GUID,"checkslurtle")
	inst.checkwerepig = GLOBAL.net_shortint(inst.GUID,"checkwerepig")
	--Boss
    inst.checksanta = GLOBAL.net_shortint(inst.GUID,"checksanta")
	inst.checkdragonfly = GLOBAL.net_shortint(inst.GUID,"checkdragonfly")
	inst.checkmalbatross = GLOBAL.net_shortint(inst.GUID,"checkmalbatross")
    inst.checkknight = GLOBAL.net_shortint(inst.GUID,"checkknight")
    inst.checkbishop = GLOBAL.net_shortint(inst.GUID,"checkbishop")
    inst.checkrook = GLOBAL.net_shortint(inst.GUID,"checkrook")
    inst.checkminotaur = GLOBAL.net_shortint(inst.GUID,"checkminotaur")	
    inst.checkancient = GLOBAL.net_shortint(inst.GUID,"checkancient")
    inst.checkrigid = GLOBAL.net_shortint(inst.GUID,"checkrigid")
    inst.checkqueen = GLOBAL.net_shortint(inst.GUID,"checkqueen")
	inst.checkcrabking = GLOBAL.net_shortint(inst.GUID,"checkcrabking")
    inst.checkking = GLOBAL.net_shortint(inst.GUID,"checkking")
    inst.checkbosswinter = GLOBAL.net_shortint(inst.GUID,"checkbosswinter")
    inst.checkbossspring = GLOBAL.net_shortint(inst.GUID,"checkbossspring")
    inst.checkbossantlion = GLOBAL.net_shortint(inst.GUID,"checkbossantlion")
    inst.checkbossautumn = GLOBAL.net_shortint(inst.GUID,"checkbossautumn")
	--Misc
	inst.checkintogame = GLOBAL.net_shortint(inst.GUID,"checkintogame")
    inst.checksuperstar = GLOBAL.net_shortint(inst.GUID,"checksuperstar")
	inst.checktrader = GLOBAL.net_shortint(inst.GUID,"checktrader")
    inst.checkknowledge = GLOBAL.net_shortint(inst.GUID,"checkknowledge")
    inst.checkdance = GLOBAL.net_shortint(inst.GUID,"checkdance")	
    inst.checkteleport = GLOBAL.net_shortint(inst.GUID,"checkteleport")	
	inst.checkbirchnut = GLOBAL.net_shortint(inst.GUID,"checkbirchnut")
	--Emer
	inst.checkeatgold = GLOBAL.net_shortint(inst.GUID,"checkeatgold")
	inst.checkeatefc = GLOBAL.net_shortint(inst.GUID,"checkeatefc")
	inst.checkeathorn = GLOBAL.net_shortint(inst.GUID,"checkeathorn")
	inst.checkeateye = GLOBAL.net_shortint(inst.GUID,"checkeateye")
	inst.checkemerald = GLOBAL.net_shortint(inst.GUID,"checkemerald")
	inst.checkgoldcoin = GLOBAL.net_shortint(inst.GUID,"checkgoldcoin")
	inst.checkbaronsuit = GLOBAL.net_shortint(inst.GUID,"checkbaronsuit")
--[[inst.checkluck = GLOBAL.net_shortint(inst.GUID,"checkluck")	
	inst.checkcitrin = GLOBAL.net_shortint(inst.GUID,"checkcitrin")
	inst.checkamber = GLOBAL.net_shortint(inst.GUID,"checkamber")
	inst.checksaddle = GLOBAL.net_shortint(inst.GUID,"checksaddle")
	inst.checkbanana = GLOBAL.net_shortint(inst.GUID,"checkbanana")
	inst.checkmoonrock = GLOBAL.net_shortint(inst.GUID,"checkmoonrock")
	inst.checkgnome = GLOBAL.net_shortint(inst.GUID,"checkgnome")]]	
	--Mile
    inst.checkall = GLOBAL.net_shortint(inst.GUID,"checkall")
    inst.checklongage = GLOBAL.net_shortint(inst.GUID,"checklongage")
    inst.checkoldage = GLOBAL.net_shortint(inst.GUID,"checkoldage")
    inst.checkwalkalot = GLOBAL.net_shortint(inst.GUID,"checkwalkalot")
    inst.checkstopalot = GLOBAL.net_shortint(inst.GUID,"checkstopalot")
    inst.checkcaveage = GLOBAL.net_shortint(inst.GUID,"checkcaveage")
	inst.checkrider = GLOBAL.net_shortint(inst.GUID,"checkrider")
	inst.checkfullsanity = GLOBAL.net_shortint(inst.GUID,"checkfullsanity")
	inst.checkfullhunger = GLOBAL.net_shortint(inst.GUID,"checkfullhunger")
	inst.checkpacifist = GLOBAL.net_shortint(inst.GUID,"checkpacifist")
	
-----------------------------------------------------------------------------

    --Food
	inst.currenteatamount = GLOBAL.net_shortint(inst.GUID,"currenteatamount")	
	inst.currenteatrata = GLOBAL.net_shortint(inst.GUID,"currenteatrata")	
	inst.currenteatfish = GLOBAL.net_shortint(inst.GUID,"currenteatfish")
	inst.currenteatturkey = GLOBAL.net_shortint(inst.GUID,"currenteatturkey")
    inst.currenteathotamount = GLOBAL.net_shortint(inst.GUID,"currenteathotamount")
    inst.currenteatcoldamount = GLOBAL.net_shortint(inst.GUID,"currenteatcoldamount")
	inst.currenteatmonsterlasagna = GLOBAL.net_shortint(inst.GUID,"currenteatmonsterlasagna")	
	inst.currenteatmole = GLOBAL.net_shortint(inst.GUID,"currenteatmole")	
	inst.currenteatwaffle = GLOBAL.net_shortint(inst.GUID,"currenteatwaffle")
    inst.currenteatall = GLOBAL.net_shortint(inst.GUID,"currenteatall")
	inst.currenteatlist = GLOBAL.net_string(inst.GUID,"currenteatlist")
	--Life
    inst.currentdeathamouth = GLOBAL.net_shortint(inst.GUID,"currentdeathamouth")
    inst.currentrespawnamount = GLOBAL.net_shortint(inst.GUID,"currentrespawnamount")
	inst.currentsleeptent = GLOBAL.net_shortint(inst.GUID,"currentsleeptent")
	inst.currentsleepsiesta = GLOBAL.net_shortint(inst.GUID,"currentsleepsiesta")
	inst.currentreviveamulet = GLOBAL.net_shortint(inst.GUID,"currentreviveamulet")
	inst.currentfeedplayer = GLOBAL.net_shortint(inst.GUID,"currentfeedplayer")
	--Work
    inst.currentnatureamount = GLOBAL.net_shortint(inst.GUID,"currentnatureamount")
    inst.currentfishamount = GLOBAL.net_shortint(inst.GUID,"currentfishamount")
    inst.currentpickamount = GLOBAL.net_shortint(inst.GUID,"currentpickamount")
    inst.currentchopamount = GLOBAL.net_shortint(inst.GUID,"currentchopamount")
    inst.currentmineamount = GLOBAL.net_shortint(inst.GUID,"currentmineamount")
    inst.currentcookamount = GLOBAL.net_shortint(inst.GUID,"currentcookamount")
    inst.currentbuildamount = GLOBAL.net_shortint(inst.GUID,"currentbuildamount")	
	--Like
    inst.currentfriendpig = GLOBAL.net_shortint(inst.GUID,"currentfriendpig")
    inst.currentfriendbunny = GLOBAL.net_shortint(inst.GUID,"currentfriendbunny")
    inst.currentfriendcat = GLOBAL.net_shortint(inst.GUID,"currentfriendcat")
    inst.currentfriendspider = GLOBAL.net_shortint(inst.GUID,"currentfriendspider")
    inst.currentevilamount = GLOBAL.net_shortint(inst.GUID,"currentevilamount")	
    inst.currentfuzzyamount = GLOBAL.net_shortint(inst.GUID,"currentfuzzyamount")	
	--Pain
    inst.currentstarvetime = GLOBAL.net_shortint(inst.GUID,"currentstarvetime")	
    inst.currentnosanitytime = GLOBAL.net_shortint(inst.GUID,"currentnosanitytime")
    inst.currenticetime = GLOBAL.net_shortint(inst.GUID,"currenticetime")
    inst.currentfiretime = GLOBAL.net_shortint(inst.GUID,"currentfiretime")
    inst.currentmoisttime = GLOBAL.net_shortint(inst.GUID,"currentmoisttime")
	inst.currentevilflower = GLOBAL.net_shortint(inst.GUID,"currentevilflower")
	inst.currentroses = GLOBAL.net_shortint(inst.GUID,"currentroses")
	--Fight
    inst.currentonhitdamage = GLOBAL.net_int(inst.GUID,"currentonhitdamage")
    inst.currentattackeddamage = GLOBAL.net_shortint(inst.GUID,"currentattackeddamage")
	inst.currentdmgnodmg = GLOBAL.net_shortint(inst.GUID,"currentdmgnodmg")
	inst.currentwhack = GLOBAL.net_shortint(inst.GUID,"currentwhack")
	inst.currentwhipit = GLOBAL.net_shortint(inst.GUID,"currentwhipit")
	inst.currentbullseye = GLOBAL.net_shortint(inst.GUID,"currentbullseye")	
    inst.currenttentacruelamount = GLOBAL.net_shortint(inst.GUID,"currenttentacruelamount")	
	--Hunt	
    inst.currentgoatperdamount = GLOBAL.net_shortint(inst.GUID,"currentgoatperdamount")
    inst.currentmosslingamount = GLOBAL.net_shortint(inst.GUID,"currentmosslingamount")
    inst.currentweetuskamount = GLOBAL.net_shortint(inst.GUID,"currentweetuskamount")
    inst.currenttentacoolamount = GLOBAL.net_shortint(inst.GUID,"currenttentacoolamount")
	inst.currenttreeguard = GLOBAL.net_shortint(inst.GUID,"currenttreeguard")
	inst.currentvarg = GLOBAL.net_shortint(inst.GUID,"currentvarg")
	inst.currentkoalefant = GLOBAL.net_shortint(inst.GUID,"currentkoalefant")
	inst.currentmonkey = GLOBAL.net_shortint(inst.GUID,"currentmonkey")
	inst.currenthorrorhound = GLOBAL.net_shortint(inst.GUID,"currenthorrorhound")
	inst.currentslurtle = GLOBAL.net_shortint(inst.GUID,"currentslurtle")
	inst.currentwerepig = GLOBAL.net_shortint(inst.GUID,"currentwerepig")
	--Misc
    inst.currenttradeamount = GLOBAL.net_shortint(inst.GUID,"currenttradeamount")
    inst.currentdanceamount = GLOBAL.net_shortint(inst.GUID,"currentdanceamount")
    inst.currentstarspent = GLOBAL.net_shortint(inst.GUID,"currentstarspent")
    inst.currentteleportamount = GLOBAL.net_shortint(inst.GUID,"currentteleportamount")	
	inst.currentbirchnut = GLOBAL.net_shortint(inst.GUID,"currentbirchnut")	
    --Emer
	inst.currenteatgold = GLOBAL.net_shortint(inst.GUID,"currenteatgold")
	inst.currenteatefc = GLOBAL.net_shortint(inst.GUID,"currenteatefc")
	inst.currenteathorn = GLOBAL.net_shortint(inst.GUID,"currenteathorn")
	inst.currenteateye = GLOBAL.net_shortint(inst.GUID,"currenteateye")
	inst.currentemeralds = GLOBAL.net_shortint(inst.GUID,"currentemeralds")	
	inst.currentgoldcoin = GLOBAL.net_shortint(inst.GUID,"currentgoldcoin")	
	inst.currentbaronsuit = GLOBAL.net_shortint(inst.GUID,"currentbaronsuit")
--[[	inst.currentcitrins = GLOBAL.net_shortint(inst.GUID,"currentcitrins")
	inst.currentambers = GLOBAL.net_shortint(inst.GUID,"currentambers")
	inst.currentsaddles = GLOBAL.net_shortint(inst.GUID,"currentsaddles")
	inst.currentbananas = GLOBAL.net_shortint(inst.GUID,"currentbananas")
	inst.currentmoonrocks = GLOBAL.net_shortint(inst.GUID,"currentmoonrocks")
	inst.currentgnomes = GLOBAL.net_shortint(inst.GUID,"currentgnomes")]]
	--Mile
    inst.currentage = GLOBAL.net_shortint(inst.GUID,"currentage")
	inst.currentruncount = GLOBAL.net_shortint(inst.GUID,"currentruncount")
    inst.currentwalktime = GLOBAL.net_shortint(inst.GUID,"currentwalktime")	
    inst.currentstoptime = GLOBAL.net_shortint(inst.GUID,"currentstoptime")
    inst.currentcavetime = GLOBAL.net_shortint(inst.GUID,"currentcavetime")
	inst.currentrider = GLOBAL.net_shortint(inst.GUID,"currentrider")
	inst.currentfullsanity = GLOBAL.net_shortint(inst.GUID,"currentfullsanity")
	inst.currentfullhunger = GLOBAL.net_shortint(inst.GUID,"currentfullhunger")
	inst.currentpacifist = GLOBAL.net_shortint(inst.GUID,"currentpacifist")	

	inst.currentcoinamount = GLOBAL.net_shortint(inst.GUID,"currentcoinamount")

	inst.currenthungerup = GLOBAL.net_shortint(inst.GUID,"currenthungerup")
	inst.currentsanityup = GLOBAL.net_shortint(inst.GUID,"currentsanityup")
	inst.currenthealthup = GLOBAL.net_shortint(inst.GUID,"currenthealthup")
	inst.currentcrit = GLOBAL.net_shortint(inst.GUID,"currentcrit")
	inst.currentscaleup = GLOBAL.net_shortint(inst.GUID,"currentscaleup")
	
	inst.currenthungerachivcost = GLOBAL.net_shortint(inst.GUID,"currenthungerachivcost")
	inst.currentsanityachivcost = GLOBAL.net_shortint(inst.GUID,"currentsanityachivcost")
	inst.currenthealthachivcost = GLOBAL.net_shortint(inst.GUID,"currenthealthachivcost")
	inst.currentcritachivcost = GLOBAL.net_shortint(inst.GUID,"currentcritachivcost")
	inst.currentscalecost = GLOBAL.net_shortint(inst.GUID,"currentscalecost")

	inst.currentkrampusxmas = GLOBAL.net_shortint(inst.GUID,"currentcurrentkrampusxmas")
	inst.currentanimallover = GLOBAL.net_shortint(inst.GUID,"currentanimallover")
	inst.currentcookmaster = GLOBAL.net_shortint(inst.GUID,"currentcookmaster")
	inst.currentpickmaster = GLOBAL.net_shortint(inst.GUID,"currentpickmaster")
	inst.currentartsdegree = GLOBAL.net_shortint(inst.GUID,"currentartsdegree")
	inst.currentlunarcraft = GLOBAL.net_shortint(inst.GUID,"currentlunarcraft")
	inst.currentbusinessowner = GLOBAL.net_shortint(inst.GUID,"currentbusinessowner")
	inst.currenthomeowner = GLOBAL.net_shortint(inst.GUID,"currenthomeowner")
	inst.currentminemaster = GLOBAL.net_shortint(inst.GUID,"currentminemaster")
	inst.currentancientstation = GLOBAL.net_shortint(inst.GUID,"currentancientstation")
	
	inst.currentlevel = GLOBAL.net_shortint(inst.GUID,"currentlevel")
	inst.currentlevelxp = GLOBAL.net_uint(inst.GUID,"currentlevelxp")
	inst.currentoverallxp = GLOBAL.net_uint(inst.GUID,"currentoverallxp")
	inst.currentattributepoints = GLOBAL.net_shortint(inst.GUID,"currentattributepoints")
	
	inst.currenthungeruplevel = GLOBAL.net_shortint(inst.GUID,"currenthungeruplevel")
	inst.currentsanityuplevel = GLOBAL.net_shortint(inst.GUID,"currentsanityuplevel")
	inst.currenthealthuplevel = GLOBAL.net_shortint(inst.GUID,"currenthealthuplevel")
	
	inst.currenthungercost = GLOBAL.net_shortint(inst.GUID,"currenthungercost")
	inst.currentsanitycost = GLOBAL.net_shortint(inst.GUID,"currentsanitycost")
	inst.currenthealthcost = GLOBAL.net_shortint(inst.GUID,"currenthealthcost")
	
	inst.currenthungermax = GLOBAL.net_shortint(inst.GUID,"currenthungermax")
	inst.currentsanitymax = GLOBAL.net_shortint(inst.GUID,"currentsanitymax")
	inst.currenthealthmax = GLOBAL.net_shortint(inst.GUID,"currenthealthmax")
	
	inst.currentzoomlevel = GLOBAL.net_float(inst.GUID,"currentzoomlevel")
	inst.currentwidgetxpos = GLOBAL.net_float(inst.GUID,"currentwidgetxpos")
	inst.currentlanguage = GLOBAL.net_string(inst.GUID,"currentlanguage")
	
    inst:AddComponent("allachivevent")
	inst:AddComponent("allachivcoin")
	inst:AddComponent("levelsystem")
	if not GLOBAL.TheNet:GetIsClient() then
		inst.components.allachivevent:Init(inst)
		inst.components.allachivcoin:Init(inst)
		inst.components.levelsystem:Init(inst)
	end
end)

--UI尺寸
local function PositionUI(self, screensize)
	local hudscale = self.top_root:GetScale()
	local screenw_full, screenh_full = GLOBAL.unpack(screensize)
	local screenw = screenw_full/hudscale.x
	local screenh = screenh_full/hudscale.y
	
	self.uiachievement:SetScale(.60*hudscale.x,.60*hudscale.y,1)
	self.uiachievement.mainbutton.hudscale = self.top_root:GetScale()
	self.uiachievement.mainbutton:SetScale(hudscale.x,hudscale.y,1)
	local pos = self.uiachievement.mainbutton:GetPosition()
	if _G.SYSTEM_CONFIG == "level" then
		self.uiachievement.mainbutton:SetPosition(pos.x, 36*hudscale.y, pos.z)
	end
	pos = self.uiachievement.mainbutton:GetPosition()
	if self.uiachievement.menuposition == nil then
		self.uiachievement.mainbutton:SetPosition(screenw_full*0.09, pos.y, pos.z)
		--SendModRPCToServer(MOD_RPC["DSTAchievement"]["saveWidgetXPos"],self.uiachievement.mainbutton:GetPosition().x)
	else
		if self.uiachievement.menuposition.x > screenw_full then
			self.uiachievement.mainbutton:SetPosition(screenw_full-256, pos.y, pos.z)
			--SendModRPCToServer(MOD_RPC["DSTAchievement"]["saveWidgetXPos"],self.uiachievement.mainbutton:GetPosition().x)
		end
	end
end

--UI
local uiachievement = require("widgets/uiachievement")
local uiachievementWidget = nil
local function hideMenus()
	if type(GLOBAL.ThePlayer) ~= "table" or type(GLOBAL.ThePlayer.HUD) ~= "table" then return end
	uiachievementWidget.mainui.allachiv:Hide()
	uiachievementWidget.mainui.allcoin:Hide()
	uiachievementWidget.mainui.levelbg:Hide()
	uiachievementWidget.mainui.achievement_bg:Hide()
	uiachievementWidget.mainui.infobutton:Hide()
	uiachievementWidget.mainui.perk_cat:Hide()
end
local function Adduiachievement(self)
    self.uiachievement = self.top_root:AddChild(uiachievement(self.owner))
	uiachievementWidget = self.uiachievement
    local screensize = {GLOBAL.TheSim:GetScreenSize()}
    PositionUI(self, screensize)
    self.uiachievement:SetHAnchor(0)
    self.uiachievement:SetVAnchor(0)
    self.uiachievement:MoveToFront()
    local OnUpdate_base = self.OnUpdate
	self.OnUpdate = function(self, dt)
		OnUpdate_base(self, dt)
		local curscreensize = {GLOBAL.TheSim:GetScreenSize()}
		if curscreensize[1] ~= screensize[1] or curscreensize[2] ~= screensize[2] then
			PositionUI(self, curscreensize)
			screensize = curscreensize
		end
	end
	
	GLOBAL.TheInput:AddKeyUpHandler(GLOBAL.KEY_ESCAPE, hideMenus)
end

AddClassPostConstruct("widgets/controls", Adduiachievement)

--Emperor Test
AddPrefabPostInit("krampus_sack", function(inst)
    inst:AddComponent("ksmark")
end)
AddPrefabPostInit("klaussackkey", function(inst)
    inst:AddComponent("ksmark")
end)

--Emperor Test
AddPlayerPostInit(function(inst)
    GLOBAL.STRINGS.CHARACTERS.GENERIC.ANNOUNCE_EAT['GENERIC'] = ""
    GLOBAL.STRINGS.CHARACTERS.GENERIC.ACTIONFAIL['COOK']['GENERIC'] = ""
    local name = string.upper(inst.prefab)
    if GLOBAL.STRINGS.CHARACTERS[name] then
		if GLOBAL.STRINGS.CHARACTERS[name].ANNOUNCE_EAT and GLOBAL.STRINGS.CHARACTERS[name].ANNOUNCE_EAT['GENERIC'] then 
			GLOBAL.STRINGS.CHARACTERS[name].ANNOUNCE_EAT['GENERIC'] = ""
		end
		if GLOBAL.STRINGS.CHARACTERS[name].ACTIONFAIL and GLOBAL.STRINGS.CHARACTERS[name].ACTIONFAIL['COOK'] and GLOBAL.STRINGS.CHARACTERS[name].ACTIONFAIL['COOK']['GENERIC'] then
			GLOBAL.STRINGS.CHARACTERS[name].ACTIONFAIL['COOK']['GENERIC'] = ""
		end
    end
end)

STRINGS.NAMES.FLUTE_SPIRIT = "Melody of Evil Spirit"
STRINGS.RECIPE_DESC.FLUTE_SPIRIT = "Play it to summon an evil spirit."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FLUTE_SPIRIT = "The melody it plays is eerie..."

STRINGS.NAMES.FLUTE_LIGHT = "Melody of Enlightment"
STRINGS.RECIPE_DESC.FLUTE_LIGHT = "A song of hope and light."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FLUTE_LIGHT = "To me I call upon the light, bring hope and bright."

STRINGS.NAMES.FLUTE_FORTIFICATION = "Melody of Fortification"
STRINGS.RECIPE_DESC.FLUTE_FORTIFICATION = "Fortify yourself with music"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FLUTE_FORTIFICATION = "I'm going in defense mode!"

STRINGS.NAMES.FLUTE_FROST = "Melody of Frost"
STRINGS.RECIPE_DESC.FLUTE_FROST = "A chilling song of ice."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FLUTE_FROST = "Cool me down and bring me frost. I'll pay the cost."

STRINGS.NAMES.FLUTE_HARVEST = "Melody of Harvest"
STRINGS.RECIPE_DESC.FLUTE_HARVEST = "A melody for the harvest season!"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.FLUTE_HARVEST = "The crops grew well this season - time to pick 'em!"
------------------------------------------------------------------------------------------------------------
STRINGS.NAMES.CABINCHAIR1 = "Cabin Chair L"
STRINGS.RECIPE_DESC.CABINCHAIR1 = "Roughly hewn, but sturdy."

STRINGS.CHARACTERS.GENERIC.DESCRIBE.CABINCHAIR1 		= "I won't have to sit in the dirt."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.CABINCHAIR1 			= "A chair, for my butt."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.CABINCHAIR1 		= "Wolfgang would like to have a seat."
STRINGS.CHARACTERS.WENDY.DESCRIBE.CABINCHAIR1 			= "To sit and ponder death."
STRINGS.CHARACTERS.WX78.DESCRIBE.CABINCHAIR1 			= "A CHAIR, MADE FROM ORGANIC MATERIAL"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.CABINCHAIR1 	= "A firm wooden chair."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.CABINCHAIR1 			= "Comfy as can be."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.CABINCHAIR1 		= "Only marginally better than being shackled to a throne."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.CABINCHAIR1 		= "A warrior does not sit until her last enemy has fallen!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.CABINCHAIR1 			= "Is this seat taken?"
------------------------------------------------------------------------------------------------------------
STRINGS.NAMES.CABINCHAIR2 = "Cabin Chair R"
STRINGS.RECIPE_DESC.CABINCHAIR2 = "Roughly hewn, but sturdy."

STRINGS.CHARACTERS.GENERIC.DESCRIBE.CABINCHAIR2 		= "I won't have to sit in the dirt."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.CABINCHAIR2 			= "A chair, for my butt."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.CABINCHAIR2 		= "Wolfgang would like to have a seat."
STRINGS.CHARACTERS.WENDY.DESCRIBE.CABINCHAIR2 			= "To sit and ponder death."
STRINGS.CHARACTERS.WX78.DESCRIBE.CABINCHAIR2 			= "A CHAIR, MADE FROM ORGANIC MATERIAL"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.CABINCHAIR2 	= "A firm wooden chair."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.CABINCHAIR2 			= "Comfy as can be."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.CABINCHAIR2 		= "Only marginally better than being shackled to a throne."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.CABINCHAIR2 		= "A warrior does not sit until her last enemy has fallen!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.CABINCHAIR2   		= "Is this seat taken?"
------------------------------------------------------------------------------------------------------------
STRINGS.NAMES.GIRLYCHAIR1 = "Flower Chair L"
STRINGS.RECIPE_DESC.GIRLYCHAIR1 = "A chair with a pretty flower backing."

STRINGS.CHARACTERS.GENERIC.DESCRIBE.GIRLYCHAIR1 		= "Carefully chiseled."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.GIRLYCHAIR1 			= "Sit? Don't mind if I do."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GIRLYCHAIR1 		= "Flowers are little and weak but chair is not!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.GIRLYCHAIR1 			= "I like the style."
STRINGS.CHARACTERS.WX78.DESCRIBE.GIRLYCHAIR1 			= "'FLOWERS' ARE NOT THE FIRST THING I ASSOCIATE WITH STRUCTURAL INTEGRITY"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GIRLYCHAIR1    = "Chiseled marble looks good on the eye but isn't comfortable for sitting on."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.GIRLYCHAIR1 			= "It's super solid, I'll give it that."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GIRLYCHAIR1 		= "It takes a true sculpture to make this."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GIRLYCHAIR1 		= "It stands through all elements!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.GIRLYCHAIR1 			= "Perfect for our height." 
------------------------------------------------------------------------------------------------------------
STRINGS.NAMES.GIRLYCHAIR2 = "Flower Chair R"
STRINGS.RECIPE_DESC.GIRLYCHAIR2 = "A solid chair with a pretty flower backing."

STRINGS.CHARACTERS.GENERIC.DESCRIBE.GIRLYCHAIR2 		= "Carefully chiseled."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.GIRLYCHAIR2 			= "Sit? Don't mind if I do."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.GIRLYCHAIR2 		= "Flowers are little and weak but chair is not!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.GIRLYCHAIR2 			= "I like the style."
STRINGS.CHARACTERS.WX78.DESCRIBE.GIRLYCHAIR2 			= "'FLOWERS' ARE NOT THE FIRST THING I ASSOCIATE WITH STRUCTURAL INTEGRITY"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.GIRLYCHAIR2    = "Chiseled marble looks good on the eye but isn't comfortable for sitting on."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.GIRLYCHAIR2 			= "It's super solid, I'll give it that."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.GIRLYCHAIR2 		= "It takes a true sculpture to make this."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.GIRLYCHAIR2 		= "It stands through all elements!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.GIRLYCHAIR2			= "Perfect for our height." 
------------------------------------------------------------------------------------------------------------
STRINGS.NAMES.CIRCUSCHAIR1 = "Striped Chair L"
STRINGS.RECIPE_DESC.CIRCUSCHAIR1 = "Sit back and relax."

STRINGS.CHARACTERS.GENERIC.DESCRIBE.CIRCUSCHAIR1 		= "Quite a fanciful piece of furniture."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.CIRCUSCHAIR1 		= "You mean it isn't meant for setting on fire?"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.CIRCUSCHAIR1 		= "Is bestest of chairs!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.CIRCUSCHAIR1 			= "A seat fit for merrymaking. I am not much of a merrymaker."
STRINGS.CHARACTERS.WX78.DESCRIBE.CIRCUSCHAIR1 			= "GAUDY VAUDEVILLE AESTHETICS DETECTED"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.CIRCUSCHAIR1 	= "A jubilant chair."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.CIRCUSCHAIR1 		= "I'll take a break after a long day."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.CIRCUSCHAIR1 		= "Fine, I'll take the day off." 
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.CIRCUSCHAIR1 	= "Warriors need rest too."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.CIRCUSCHAIR1 		= "It oddly reminds us of the beach and circus."
------------------------------------------------------------------------------------------------------------
STRINGS.NAMES.CIRCUSCHAIR2 = "Striped Chair R"
STRINGS.RECIPE_DESC.CIRCUSCHAIR2 = "Sit back and relax."

STRINGS.CHARACTERS.GENERIC.DESCRIBE.CIRCUSCHAIR2 		= "Quite a fanciful piece of furniture."
STRINGS.CHARACTERS.WILLOW.DESCRIBE.CIRCUSCHAIR2 		= "You mean it isn't meant for setting on fire?"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.CIRCUSCHAIR2 		= "Is bestest of chairs!"
STRINGS.CHARACTERS.WENDY.DESCRIBE.CIRCUSCHAIR2 			= "A seat fit for merrymaking. I am not much of a merrymaker."
STRINGS.CHARACTERS.WX78.DESCRIBE.CIRCUSCHAIR2 			= "GAUDY VAUDEVILLE AESTHETICS DETECTED"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.CIRCUSCHAIR2 	= "A jubilant chair."
STRINGS.CHARACTERS.WOODIE.DESCRIBE.CIRCUSCHAIR2 		= "I'll take a break after a long day."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.CIRCUSCHAIR2 		= "Fine, I'll take the day off." 
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.CIRCUSCHAIR2 	= "Warriors need rest too."
STRINGS.CHARACTERS.WEBBER.DESCRIBE.CIRCUSCHAIR2 		= "It oddly reminds us of the beach and circus."
------------------------------------------------------------------------------------------------------------
STRINGS.NAMES.DININGTABLE = "Dining Table"    
STRINGS.RECIPE_DESC.DININGTABLE = "Fine dining." 

STRINGS.CHARACTERS.GENERIC.DESCRIBE.DININGTABLE 		= "I sure am hungry." 
STRINGS.DININGTABLE_NONE = "It's empty."  
STRINGS.HUNGER_DINING = "Hunger"  
STRINGS.HEALTH_DINING = "Health"  
STRINGS.SANITY_DINING = "Sanity" 
------------------------------------------------------------------------------------------------------------
STRINGS.NAMES.BOOK_CARROT = "Taste of Life"
STRINGS.RECIPE_DESC.BOOK_CARROT = "Read about your secret dreams."

STRINGS.CHARACTERS.GENERIC.DESCRIBE.BOOK_CARROT         = "This book is the one I've always wanted to read!"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.BOOK_CARROT 			= "Sometimes I like to burry myself in dirt and pretend I'm a carrot."
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.BOOK_CARROT 		= "Wolfgang is shy about dreams."
STRINGS.CHARACTERS.WENDY.DESCRIBE.BOOK_CARROT 		    = "My deepest darkest dreams lie in here."
STRINGS.CHARACTERS.WX78.DESCRIBE.BOOK_CARROT 			= "YES GROW BIGGER AND TASTIER"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.BOOK_CARROT    = "Oh dear, I didn't want you finding this. I'm so embarrassed!"
STRINGS.CHARACTERS.WOODIE.DESCRIBE.BOOK_CARROT		    = "Hmm, the pictures inside are very revealing."
STRINGS.CHARACTERS.WAXWELL.DESCRIBE.BOOK_CARROT		    = "I thought these dreams had stopped."
STRINGS.CHARACTERS.WATHGRITHR.DESCRIBE.BOOK_CARROT 		= "A book detailing my greatest dreams!"
STRINGS.CHARACTERS.WEBBER.DESCRIBE.BOOK_CARROT 	        = "Mother used to have this book on the side of her bed."
------------------------------------------------------------------------------------------------------------
STRINGS.NAMES.EMERDIPLOMA = "Emer Diploma"

STRINGS.CHARACTERS.GENERIC.DESCRIBE.EMERDIPLOMA       = "I have completed all the achievements and graduated with my Emer Diploma!"
------------------------------------------------------------------------------------------------------------
--Luis Rat
STRINGS.NAMES.LUIS_RAT = "Luis the Giant Rat"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.LUIS_RAT          = "Luis is the giant rat that makes all of the rules!"
--Mario Rat
STRINGS.NAMES.MARIO_RAT = "Mario the Rat"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.MARIO_RAT         = "Mario is the rat responsible for everything that goes wrong."
--Whisper Rat
STRINGS.NAMES.WHISPER_RAT = "Whisper the Rat"
STRINGS.CHARACTERS.GENERIC.DESCRIBE.WHISPER_RAT       = "Whisper is the rat queen."


AddComponentPostInit("crop", function(self)
local _Harvest = self.Harvest
	self.Harvest = function(self, harvester)
		local pos = self.inst:GetPosition()
		local ret, product = _Harvest(self, harvester)
		--print(harvester.components.allachivcoin.pickmaster)
		if ret and product and harvester and pos and harvester.components.allachivcoin and harvester.components.allachivcoin.pickmaster then
			local wetness = GLOBAL.TheWorld.state.wetness
			local iswet = GLOBAL.TheWorld.state.iswet
			local item = GLOBAL.SpawnPrefab(product.prefab)
			item.components.inventoryitem:InheritMoisture(wetness, iswet)
			harvester.components.inventory:GiveItem(item, nil, pos)
		end
		return ret, product
	end
end)

local function onwakeup(self)
	if self and self.components.sleepingbag then
		local onwake_old = self.components.sleepingbag.onwake
		self.components.sleepingbag.onwake = function(self, sleeper, nostatechange)                   
			sleeper:PushEvent("wakeup", self.prefab)      
			onwake_old(self, sleeper, nostatechange)                                                       
		end
	end
end
AddPrefabPostInit("siestahut", onwakeup)
AddPrefabPostInit("tent", onwakeup)

local function onfinishedwork_miner(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst:DoTaskInTime(0, function()
            local leader = inst.components.follower:GetLeader()
            leader.components.allachivevent:miner(inst)
        end)
    end
end

local function onfinishedwork_lumber(inst)
    if GLOBAL.TheWorld.ismastersim then
        inst:DoTaskInTime(0, function()
            local leader = inst.components.follower:GetLeader()
            leader.components.allachivevent:chopper(inst)
        end)
    end
end

AddPrefabPostInit("shadowminer", onfinishedwork_miner)
AddPrefabPostInit("shadowlumber", onfinishedwork_lumber)

function GLOBAL.getFoodList(player)
    if player == nil then
        player = GLOBAL.ThePlayer
    end
    local eatlist = player.components.allachivevent.eatlist
    for k,v in pairs(eatlist) do
        print(k, v)
    end
end

-- ##################
-- example usage of saving and loading data from other mods when worldjumping/after worldjumping with teleportato
-- ##################
if GLOBAL.TUNING.TELEPORTATOMOD then
	print("##### achievement and level system with teleportato mod loaded #####")
	local functionsavewithteleportato = GLOBAL.TUNING.TELEPORTATOMOD.functionsavewithteleportato
	GLOBAL.TUNING.TELEPORTATOMOD.functionsavewithteleportato = function(player) -- called for server
		local mods_data = {}
		if functionsavewithteleportato~=nil then -- call a previous funtion from another mod, if there is one
			mods_data = functionsavewithteleportato(player)
		end
		mods_data["achievementsMod"] = player.components.allachivcoin:OnSave() -- you can use onsave, or use other values from your mod, to save them
		mods_data["levelMod"] = player.components.levelsystem:OnSave() -- you can use onsave, or use other values from your mod, to save them
		mods_data["achievementEvents"] = player.components.allachivevent:OnSave() -- you can use onsave, or use other values from your mod, to save them
		return mods_data
	end

	AddPlayerPostInit(function(player)
		player:ListenForEvent("teleportatojumpLoadData", function(player,mods_data) -- load the mods_data
			if mods_data~=nil and mods_data["achievementsMod"]~=nil and mods_data["levelMod"]~=nil and mods_data["achievementEvents"]~=nil then -- you can add a modsetting if sth should be loaded or not
				_G.CAVES_CONFIG = GetModConfigData('CAVES')
				_G.MULT_CONFIG = GetModConfigData('MULT')
				_G.REFUND_CONFIG = GetModConfigData('REFUND')
				_G.SYSTEM_CONFIG = GetModConfigData('SYSTEM')
				_G.HIDEPERK_CONFIG = GetModConfigData('HIDEPERK')
				_G.STARTGEAR_CONFIG = GetModConfigData('GEAR')
				_G.COSTRAISE_CONFIG = GetModConfigData('COSTRAISE')
				_G.PLAYS_CONFIG = GetModConfigData('PLAYS')
				_G.GAMEBREAKER = GetModConfigData('GAMEBREAKER')
				_G.EXPMULT = GetModConfigData('EXPMULT')
				_G.SECONDRUN = GetModConfigData('SECOND')	
				_G.LANGUAGE = GetModConfigData('LANGUAGE')
				if _G.LANGUAGE == "e" then
					require 'AllAchiv/strings_acm_e'
				elseif _G.LANGUAGE == "es" then
					require 'AllAchiv/strings_acm_es'
				end				
--[[			if _G.LANGUAGE == "kr" then
					require 'AllAchiv/strings_acm_kr'
				elseif _G.LANGUAGE == "ptbr" then
					require 'AllAchiv/strings_acm_ptbr'
				if _G.LANGUAGE == "es" then
					require 'AllAchiv/strings_acm_es'
				elseif _G.LANGUAGE == "it" then
					require 'AllAchiv/strings_acm_it'
				elseif _G.LANGUAGE == "chs" then
					require 'AllAchiv/strings_acm_chs'
				elseif _G.LANGUAGE == "cht" then
					require 'AllAchiv/strings_acm_cht'
				elseif _G.LANGUAGE == "ru" then
					require 'AllAchiv/strings_acm_ru'
				elseif _G.LANGUAGE == "de" then
					require 'AllAchiv/strings_acm_de'
				elseif _G.LANGUAGE == "vi" then
					require 'AllAchiv/strings_acm_vi'
				elseif _G.LANGUAGE == "e" then
					require 'AllAchiv/strings_acm_e'
				end]]
				local MANRESPAWN = GetModConfigData('MANDRAKEBOI')
				if MANRESPAWN then
					if GLOBAL.STRINGS.NAMES.MIGRATION_PORTAL then
						AddPrefabPostInit("forest", function(inst)
							if inst.ismastersim then
								inst:AddComponent("minspawner")
							end
						end)
					else
						AddPrefabPostInit("world", function(inst)
							if inst.ismastersim then
								inst:AddComponent("minspawner")
							end
						end)
					end
				end
				player.components.allachivcoin:OnLoad(mods_data["achievementsMod"])
				player.components.levelsystem:OnLoad(mods_data["levelMod"])
				player.components.allachivevent:OnLoad(mods_data["achievementEvents"])
			end
		end)
	end)
end

--Removed antlion.lua from scripts/prefabs. Fix for Antlion spawning outside of summer. --KoreanWaffles
AddPrefabPostInit("antlion", function(inst)
    if not GLOBAL.TheNet:GetIsServer() then return end
    local _OnGivenItem = inst.components.trader.onaccept
    inst.components.trader.onaccept = function(inst, giver, item)
        if item.prefab == "heatrock" and item.currentTempRange > 1 and item.currentTempRange < 4 then
            if giver.components.allachivevent and giver.components.allachivevent.fuzzy ~= true then
                giver.components.allachivevent.fuzzyamount = giver.components.allachivevent.fuzzyamount + 1
                if giver.components.allachivevent.fuzzyamount >= GLOBAL.allachiv_eventdata["fuzzy"] then
                    giver.components.allachivevent.fuzzy = true
                    giver.components.allachivevent:seffc(giver, "fuzzy")
                end
            end
        end
        _OnGivenItem(inst, giver, item)
    end
end)

--Removed blinkstaff.lua from scripts/prefabs. Fix for crash on orange staff reskin. --Platypus
AddPrefabPostInit("orangestaff", function(inst)
    if inst.components.blinkstaff then
        old_onblinkfn = inst.components.blinkstaff.onblinkfn
        inst.components.blinkstaff.onblinkfn = function(inst, pt, caster)
            if not caster.components.allachivevent.teleport then
                caster.components.allachivevent.teleportamount = caster.components.allachivevent.teleportamount + 1
                if caster.components.allachivevent.teleportamount >= GLOBAL.allachiv_eventdata["teleport"] then
                    caster.components.allachivevent.teleport = true
                    caster.components.allachivevent:seffc(caster, "teleport")
                end
            end
            if old_onblinkfn ~= nil then
                old_onblinkfn(inst, pt, caster)
            end
        end
    end
end)
-- ##################
-- ##################

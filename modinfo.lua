name =
[[Emerville Achievements and Level System]]
description =
[[v3.5.0
Adds a achievement and leveling system to the game.
To gain level xp eat food or kill monster.
Spend available attribute points to upgrade your stats
To gain achievement stars fullfil the quests.
Spend achievement stars to upgrade stats or unlock permanent abilities.
If you complete all achievements you can enable multiple playthroughs in the mod configuration.
]]
author = "Lavax" --Modified by Luis95R for Emerville
version = "1.2.10"
priority = -1000
server_filter_tags = {"achievement", "level"}

forumthread = ""

api_version = 10

dst_compatible = true
dont_starve_compatible = false
reign_of_giants_compatible = false
all_clients_require_mod = true

icon_atlas = "modicon.xml"
icon = "modicon.tex"

configuration_options =
{
	{
        name = "SYSTEM",
        label = "Active Systems",
        options =   {
                        {description = "Both", data = "both"},
                        {description = "Only Level", data = "level"},
						{description = "Only Achievments", data = "achieve"},
                    },
        default = "both",
		hover = "Choose with which systems you want to play",
    },
	{
        name = "LANGUAGE",
        label = "Language",
        options =   {
                        {description = "English", data = "e"},
                        {description = "Korean", data = "kr"},
						{description = "Portuguese (Brazil)", data = "ptbr"},
						{description = "Spanish", data = "es"},
						{description = "Italian", data = "it"},
						{description = "simplified Chinese", data = "chs"},
						{description = "traditional Chinese", data = "cht"},
						{description = "Russian", data = "ru"},
						{description = "German", data = "de"},
						{description = "Vietnamese", data = "vi"},
                    },
        default = "e",
        hover = "Choose your language",
    },
	{
        name = "MULT",
        label = "Perk Cost Multiplier",
        options =   {
						{description = "0.5x", data = 0.5},
						{description = "0.75x", data = 0.75},
                        {description = "1.0x", data = 1},
                        {description = "1.5x", data = 1.5},
						{description = "2.0x", data = 2.0},
						{description = "2.5x", data = 2.5},
                    },
        default = 1,
		hover = "Modify the perk costs",
    },
	{
        name = "EXPMULT",
        label = "XP Multiplier",
        options =   {
						{description = "0.5x", data = 0.5},
						{description = "0.75x", data = 0.75},
                        {description = "1.0x", data = 1},
                        {description = "1.25x", data = 1.25},
						{description = "1.5x", data = 1.5},
						{description = "2.0x", data = 2.0},
                    },
        default = 0.5,
		hover = "Modifiy the experience gain",
    },
	{
        name = "HIDEPERK",
        label = "Disable Perk Categories",
        options =   {
						{description = "None", data = "none"},
						{description = "Abilities", data = "ab"},
						{description = "Crafting", data = "cr"},
						{description = "Abil. and Craft.", data = "abcr"},

                    },
        default = "none",
		hover = "Hides the Abilities and/or Crafting Tab in Achievement Rewards",
    },
	{
        name = "GAMEBREAKER",
        label = "Game Changing Perks",
        options =   {
						{description = "Enabled", data = true},
						{description = "Disabled", data = false},
                    },
        default = true,
		hover = "Disables game changing perks",
    },
	{
        name = "REFUND",
        label = "Refund Percentage on Reset",
        options =   {
                        {description = "75%", data = 0.75},
                        {description = "85%", data = 0.85},
						{description = "95%", data = 0.95},
						{description = "100%", data = 1},
                    },
        default = 0.85,
		hover = "Choose how many points you get refunded when resetting",
    },
	{
        name = "COSTRAISE",
        label = "Raising Perk Cost",
        options =   {
                        {description = "Enabled", data = true},
                        {description = "Disabled", data = false},
                    },
        default = true,
		hover = "Choose if costs for repeatable upgrades should raise",
    },
	{
        name = "GEAR",
        label = "Starting Gear",
        options =   {
						{description = "Nothing", data = "nothing"},
                        {description = "Fighter", data = "fight"},
                        {description = "Survivalist", data = "survive"},
                    },
        default = "nothing",
		hover = "Choose which items you start with",
    },
	{
        name = "PLAYS",
        label = "Achievement Repeat",
        options =   {
						{description = "0", data = 0},
                        {description = "1", data = 1},
                        {description = "2", data = 2},
						{description = "3", data = 3},
						{description = "Unlimited", data = 999},
                    },
        default = 0,
        hover = "After completing all achievements they will be reset for this many times",
    },
	{
        name = "LEVELXP",
        label = "Level XP cap",
        options =   {
						{description = "500", data = 500},
						{description = "1000", data = 1000},
						{description = "2000", data = 2000},
                        {description = "3000", data = 3000},
                        {description = "4000", data = 4000},
                        {description = "5000", data = 5000},						
                    },
        default = 5000,
        hover = "Maximum XP needed to gain a level up",
    },
	{
        name = "LEVELPOINTS",
        label = "Level Up Points",
        options =   {
						{description = "1", data = 1},
						{description = "2", data = 2},
                        {description = "3", data = 3},
                        {description = "4", data = 4},
						{description = "5", data = 5},
                    },
        default = 1,
        hover = "Points awarded after leveling up",
    },
	{
        name = "MANDRAKEBOI",
        label = "Mandrake Respawn",
        options =   {
                        {description = "Off", data = false},
                        {description = "On", data = true},
                    },
        default = true,
        hover = "Spawn up to 4 mandrakes every new autumn on grass turf",
    },
	{
        name = "CAVES",
        label = "Caves enabled?",
        options =   {
                        {description = "No Caves", data = false},
                        {description = "With Caves", data = true},
                    },
        default = true,
		hover = "Grant the cave achievements without reward if you play without caves",
    },
}
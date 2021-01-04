--SendModRPCToServer(MOD_RPC["DSTAchievement"]["healthup"])
--modname的名字不能有中文！！！

AddModRPCHandler("DSTAchievement", "hungerup", function(player)
	player.components.allachivcoin:hungerupcoin(player)
end)

AddModRPCHandler("DSTAchievement", "sanityup", function(player)
	player.components.allachivcoin:sanityupcoin(player)
end)

AddModRPCHandler("DSTAchievement", "healthup", function(player)
	player.components.allachivcoin:healthupcoin(player)
end)

AddModRPCHandler("DSTAchievement", "crit", function(player)
	player.components.allachivcoin:critcoin(player)
end)

AddModRPCHandler("DSTAchievement", "scale", function(player)
	player.components.allachivcoin:scaleupcoin(player)
end)

AddModRPCHandler("DSTAchievement", "krampusxmas", function(player)
	player.components.allachivcoin:krampusxmascoin(player)
end)

AddModRPCHandler("DSTAchievement", "animallover", function(player)
	player.components.allachivcoin:animallovercoin(player)
end)

AddModRPCHandler("DSTAchievement", "pickmaster", function(player)
	player.components.allachivcoin:pickmastercoin(player)
end)

AddModRPCHandler("DSTAchievement", "cookmaster", function(player)
	player.components.allachivcoin:cookmastercoin(player)
end)

AddModRPCHandler("DSTAchievement", "businessowner", function(player)
	player.components.allachivcoin:businessownercoin(player)
end)

AddModRPCHandler("DSTAchievement", "lunarcraft", function(player)
	player.components.allachivcoin:lunarcraftcoin(player)
end)

AddModRPCHandler("DSTAchievement", "artsdegree", function(player)
	player.components.allachivcoin:artsdegreecoin(player)
end)

AddModRPCHandler("DSTAchievement", "minemaster", function(player)
	player.components.allachivcoin:minemastercoin(player)
end)

AddModRPCHandler("DSTAchievement", "ancientstation", function(player)
	player.components.allachivcoin:ancientstationcoin(player)
end)

AddModRPCHandler("DSTAchievement", "removecoin", function(player)
	player.components.allachivcoin:removecoin(player)
end)

AddModRPCHandler("DSTAchievement", "hungeruplevel", function(player)
	player.components.levelsystem:hungeruplevel(player)
end)

AddModRPCHandler("DSTAchievement", "sanityuplevel", function(player)
	player.components.levelsystem:sanityuplevel(player)
end)

AddModRPCHandler("DSTAchievement", "healthuplevel", function(player)
	player.components.levelsystem:healthuplevel(player)
end)

AddModRPCHandler("DSTAchievement", "removeattributepoints", function(player)
	player.components.levelsystem:removeattributepoints(player)
end)

-- AddModRPCHandler("DSTAchievement", "addxp", function(player)
	-- player.components.levelsystem:addxp(player)
-- end)

-- AddModRPCHandler("DSTAchievement", "addcoins", function(player)
	-- player.components.allachivcoin:addcoins(player)
-- end)

AddModRPCHandler("DSTAchievement", "saveZoomlevel", function(player, zoomlevel)
	player.components.levelsystem:saveZoomLevel(player, zoomlevel)
end)

AddModRPCHandler("DSTAchievement", "saveWidgetXPos", function(player, xpos)
	player.components.levelsystem:savewidgetXPos(player, xpos)
end)

AddModRPCHandler("DSTAchievement", "saveLanguage", function(player, language)
	player.components.levelsystem:saveLanguage(player, language)
end)
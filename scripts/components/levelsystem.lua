local function getlevel(self,level) self.inst.currentlevel:set(level) end
local function getlevelxp(self,levelxp) self.inst.currentlevelxp:set(levelxp) end
local function getoverallxp(self,overallxp) self.inst.currentoverallxp:set(overallxp) end
local function getattributepoints(self,attributepoints) self.inst.currentattributepoints:set(attributepoints) end

local function currenthungeruplevel(self,hungerupamount) self.inst.currenthungeruplevel:set(hungerupamount) end
local function currentsanityuplevel(self,sanityupamount) self.inst.currentsanityuplevel:set(sanityupamount) end
local function currenthealthuplevel(self,healthupamount) self.inst.currenthealthuplevel:set(healthupamount) end

local function currenthungercost(self,hungercost) self.inst.currenthungercost:set(hungercost) end
local function currentsanitycost(self,sanitycost) self.inst.currentsanitycost:set(sanitycost) end
local function currenthealthcost(self,healthcost) self.inst.currenthealthcost:set(healthcost) end

local function currenthungermax(self,hunger) self.inst.currenthungermax:set(hunger) end
local function currentsanitymax(self,sanity) self.inst.currentsanitymax:set(sanity) end
local function currenthealthmax(self,health) self.inst.currenthealthmax:set(health) end

local function currentzoomlevel(self,zoomlevel) self.inst.currentzoomlevel:set(zoomlevel) end
local function currentwidgetxpos(self,widgetxpos) self.inst.currentwidgetxpos:set(widgetxpos) end
local function currentlanguage(self,language) self.inst.currentlanguage:set(language) end


local levelsystem = Class(function(self, inst)
    self.inst = inst
	self.level = 1
    self.levelxp = 0
	self.overallxp = 0
	
	self.attributepoints = 0
	self.attributepointsspent = 0

    self.hungerupamount = 0
    self.sanityupamount = 0
    self.healthupamount = 0

	
	self.hungercost = 1
	self.sanitycost = 1
	self.healthcost = 1
	
	self.hungermax = -1
	self.sanitymax = -1
	self.healthmax = -1
	
	self.achievementhungerup = 0
	self.achievementsanityup = 0
	self.achievementhealthup = 0
	
	self.levelhungerup = 0
	self.levelsanityup = 0
	self.levelhealthup = 0
	
	self.zoomlevel = 1
	self.widgetXpos = -1
	self.language = _G.LANGUAGE
	
end,
nil,
{
    level = getlevel,
	levelxp = getlevelxp,
	overallxp = getoverallxp,
	
	attributepoints = getattributepoints,

    hungerupamount = currenthungeruplevel,
    sanityupamount = currentsanityuplevel,
    healthupamount = currenthealthuplevel,
	
	hungercost = currenthungercost,
	sanitycost = currentsanitycost,
	healthcost = currenthealthcost,
	
	hungermax = currenthungermax,
    sanitymax = currentsanitymax,
    healthmax = currenthealthmax,
	
	zoomlevel = currentzoomlevel,
	widgetXpos = currentwidgetxpos,
	language = currentlanguage,
})


function levelsystem:OnSave()
    local data = {
        level = self.level,
		levelxp = self.levelxp,
		overallxp = self.overallxp,
		
		attributepoints = self.attributepoints,
		attributepointsspent = self.attributepointsspent,
		
        hungerupamount = self.hungerupamount,
        sanityupamount = self.sanityupamount,
        healthupamount = self.healthupamount,
		
		hungercost = self.hungercost,
		sanitycost = self.sanitycost,
		healthcost = self.healthcost,
		
		widgetXpos = self.widgetXpos,
		zoomlevel = self.zoomlevel,
		language = self.language,
		
    }
    return data
end


function levelsystem:OnLoad(data)
    self.level = data.level or 1
	self.levelxp = data.levelxp or 0
	self.overallxp = data.overallxp or 0
	
	self.attributepoints = data.attributepoints or 0
	
    self.hungerupamount = data.hungerupamount or 0
    self.sanityupamount = data.sanityupamount or 0
    self.healthupamount = data.healthupamount or 0
	
	self.attributepointsspent = data.attributepointsspent or self.hungerupamount+self.sanityupamount+self.healthupamount
	
	self.hungercost = data.hungercost or 1
	self.sanitycost = data.sanitycost or 1
	self.healthcost = data.healthcost or 1
	
	self.widgetXpos = data.widgetXpos or -1
	self.zoomlevel = data.zoomlevel or 1
	self.language = data.language or _G.LANGUAGE

end

function levelsystem:savewidgetXPos(inst, xpos)
	self.widgetXpos = xpos
end

function levelsystem:saveZoomLevel(inst, zoomlevel)
	self.zoomlevel = zoomlevel
end

function levelsystem:saveLanguage(inst, language)
	self.language = language
end

function levelsystem:onlevelup(inst)
    inst.SoundEmitter:PlaySound("dontstarve/HUD/research_available")
	
end

function levelsystem:attributepointDoDelta(value)
    self.attributepoints = self.attributepoints + value
end

function levelsystem:levelDoDelta()
    self.level = self.level + 1
	self:attributepointDoDelta(attributepointsOnLevel)
end

function levelsystem:xpDoDelta(value,inst)
	self.overallxp = self.overallxp + value
    self.levelxp = self.levelxp + value
	while(math.min(levelxpcap, self.level*100) <= self.levelxp) do 
		self.levelxp = self.levelxp - math.min(levelxpcap,self.level*100)
		self:levelDoDelta()
		self:onlevelup(inst)
	end
		
end

function levelsystem:hungeruplevel(inst)
    if self.attributepoints >= self.hungercost then
        self.hungerupamount = self.hungerupamount + 1
		self.attributepointsspent = self.attributepointsspent + self.hungercost
		self:attributepointDoDelta(-self.hungercost)
		self.hungercost = math.min(3,1 + math.floor(self.hungerupamount/levelcoststep["hunger"]))
        self:onlevelup(inst)
    end
end

function levelsystem:sanityuplevel(inst)
    if self.attributepoints >= self.sanitycost then
        self.sanityupamount = self.sanityupamount + 1
		self.attributepointsspent = self.attributepointsspent + self.sanitycost
		self:attributepointDoDelta(-self.sanitycost)
		self.sanitycost = math.min(3,1 + math.floor(self.sanityupamount/levelcoststep["sanity"]))
        self:onlevelup(inst)
    end
end

function levelsystem:healthuplevel(inst)
    if self.attributepoints >= self.healthcost then
        self.healthupamount = self.healthupamount + 1
		self.attributepointsspent = self.attributepointsspent + self.healthcost
		self:attributepointDoDelta(-self.healthcost)
		self.healthcost = math.min(3,1 + math.floor(self.healthupamount/levelcoststep["health"]))
        self:onlevelup(inst)
    end
end

function levelsystem:addxp(inst)
	self:xpDoDelta(30000, inst)
end

function levelsystem:removeattributepoints(inst)

	local spentpoints = (self.level-1)*attributepointsOnLevel - self.attributepoints
    self.attributepoints = self.attributepoints + math.ceil(spentpoints*reset_refund_percentage)
	self.attributepointsspent = 0
    self:resetbuff(inst)

    self.hungerupamount = 0
    self.sanityupamount = 0
    self.healthupamount = 0
	
	self.hungercost = 1
    self.sanitycost = 1
    self.healthcost = 1

    if inst.components.health.currenthealth > 0 and not inst.components.rider:IsRiding() then
        inst.components.locomotor:Stop()
        inst.sg:GoToState("changeoutsidewardrobe")
    end
    SpawnPrefab("shadow_despawn").Transform:SetPosition(inst.Transform:GetWorldPosition())
    SpawnPrefab("statue_transition_2").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

function levelsystem:resetbuff(inst)

end

function levelsystem:onreroll(inst)
    inst:ListenForEvent("ms_playerreroll", function(inst)
				local returnattributepoints = 
				self.hungerupamount +
				self.sanityupamount +
				self.healthupamount 
                local SaveLevel = {}
                SaveLevel["level"] = self.level or 1
				SaveLevel["levelxp"] = self.levelxp or 0
				SaveLevel["overallxp"] = self.overallxp or 0
				SaveLevel["attributepoints"] = self.attributepoints + returnattributepoints or 0--+ math.ceil(returnattributepoints*_G.REFUND_CONFIG)
				SaveLevel["widgetXpos"] = self.widgetXpos or -1
				SaveLevel["zoomlevel"] = self.zoomlevel or 1
				SaveLevel["language"] = self.language or _G.LANGUAGE
				LevelData[inst:GetDisplayName()] = SaveLevel
    end)
end

function levelsystem:intogamefn(inst)
    inst:DoTaskInTime(3, function()
		if self.overallxp == 0 and LevelData[inst:GetDisplayName()] ~= nil then
			local leveldata = LevelData[inst:GetDisplayName()]
			self.level = leveldata["level"]
			self.levelxp = leveldata["levelxp"]
			self.overallxp = leveldata["overallxp"]
			self.attributepoints = leveldata["attributepoints"]
			self.widgetXpos = leveldata["widgetXpos"]
			self.zoomlevel = leveldata["zoomlevel"]
			self.language = leveldata["language"]
			LevelData[inst:GetDisplayName()] = nil
		end
    end)
end

function levelsystem:Init(inst)
	--for key,value in pairs(inst.components) do print(key,value) end
	if _G.SYSTEM_CONFIG == "both" or _G.SYSTEM_CONFIG == "level" then
		inst:DoTaskInTime(.1, function()
			self:onkilledother(inst)
			self:intogamefn(inst)
			self:onreroll(inst)
			self:eatfn(inst)
		end)
	end

	inst.components.combat.damagemultiplier = inst.components.combat.damagemultiplier or 1
    inst:DoPeriodicTask(.5, function() self:onupdate(inst) end)
end

function levelsystem:onupdate(inst)
	--hunger
	local achievementhungerup = allachiv_coindata["hungerup"]*inst.currenthungerup:value()
	if achievementhungerup ~= self.achievementhungerup then
		local hunger_percent = inst.components.hunger:GetPercent()
		local addhunger = achievementhungerup - self.achievementhungerup
		inst.components.hunger:SetMax(inst.components.hunger.max + addhunger)
		inst.components.hunger:SetPercent(hunger_percent)
		self.achievementhungerup = achievementhungerup
		self.hungermax = inst.components.hunger.max
	end
	if self.hungerupamount ~= self.levelhungerup then
        local hunger_percent = inst.components.hunger:GetPercent()
		local addhunger = self.hungerupamount - self.levelhungerup
        inst.components.hunger:SetMax(inst.components.hunger.max + addhunger)
        inst.components.hunger:SetPercent(hunger_percent)
		self.levelhungerup = self.hungerupamount
		self.hungermax = inst.components.hunger.max
    end
	--in case hunger changes due to other events like when WX eats gears. Upgrades have to be applied again
	if self.hungermax ~= inst.components.hunger.max then
		local hunger_percent = inst.components.hunger:GetPercent()
        inst.components.hunger:SetMax(inst.components.hunger.max + self.hungerupamount + achievementhungerup)
        inst.components.hunger:SetPercent(hunger_percent)
		self.hungermax = inst.components.hunger.max
	end
    
	--sanity
	local achievementsanityup = allachiv_coindata["sanityup"]*inst.currentsanityup:value()
	if achievementsanityup ~= self.achievementsanityup then
		local sanity_percent = inst.components.sanity:GetPercent()
		local addsanity = achievementsanityup - self.achievementsanityup
		inst.components.sanity:SetMax(inst.components.sanity.max + addsanity)
		inst.components.sanity:SetPercent(sanity_percent)
		self.achievementsanityup = achievementsanityup
		self.sanitymax = inst.components.sanity.max
	end
	if self.sanityupamount ~= self.levelsanityup then
        local sanity_percent = inst.components.sanity:GetPercent()
		local addsanity = self.sanityupamount - self.levelsanityup
        inst.components.sanity:SetMax(inst.components.sanity.max + addsanity)
        inst.components.sanity:SetPercent(sanity_percent)
		self.levelsanityup = self.sanityupamount
		self.sanitymax = inst.components.sanity.max
    end
	--in case sanity changes due to other events like when WX eats gears. Upgrades have to be applied again
	if self.sanitymax ~= inst.components.sanity.max then
		local sanity_percent = inst.components.sanity:GetPercent()
        inst.components.sanity:SetMax(inst.components.sanity.max + self.sanityupamount + achievementsanityup)
        inst.components.sanity:SetPercent(sanity_percent)
		self.sanitymax = inst.components.sanity.max
	end
	
	--health
	local achievementhealthup = allachiv_coindata["healthup"]*inst.currenthealthup:value()
	if achievementhealthup ~= self.achievementhealthup then
		local health_percent = inst.components.health:GetPercent()
		local addhealth = achievementhealthup - self.achievementhealthup
		inst.components.health.maxhealth = inst.components.health.maxhealth + addhealth
		inst.components.health:SetPercent(health_percent)
		self.achievementhealthup = achievementhealthup
		self.healthmax = inst.components.health.maxhealth
	end
	if self.healthupamount ~= self.levelhealthup then
        local health_percent = inst.components.health:GetPercent()
		local addhealth = self.healthupamount - self.levelhealthup
		inst.components.health.maxhealth = inst.components.health.maxhealth + addhealth
		inst.components.health:SetPercent(health_percent)
		self.levelhealthup = self.healthupamount
		self.healthmax = inst.components.health.maxhealth
    end
	--in case health changes due to other events like when WX eats gears. Upgrades have to be applied again
	if self.healthmax ~= inst.components.health.maxhealth then
		local health_percent = inst.components.health:GetPercent()
        inst.components.health.maxhealth = inst.components.health.maxhealth + self.healthupamount + achievementhealthup
        inst.components.health:SetPercent(health_percent)
		self.healthmax = inst.components.health.maxhealth
	end

end

--Debug
--AllPlayers[1].components.levelsystem:xpDoDelta(10000,AllPlayers[1])
--gain xp
function levelsystem:onkilledother(inst)
    inst:ListenForEvent("killed", function(killer, data)
        local victim = data.victim
        if victim and victim.components.health and killer:HasTag("player") and
				not victim:HasTag("veggie") and 
                not victim:HasTag("structure") and 
                not victim:HasTag("wall") and 
                not victim:HasTag("balloon") and 
                not victim:HasTag("groundspike") and 
                not victim:HasTag("smashable") and 
                not victim:HasTag("companion") then
			local xp = math.floor(victim.components.health.maxhealth*0.1+0.5)
			if xp > 11000 then return end
			if victim:HasTag("epic") then xp = math.floor(victim.components.health.maxhealth*0.25+0.5) end
			
			local pos = Vector3(victim.Transform:GetWorldPosition())
            local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 15)
			
			local playercount = 0
			for k,v in pairs(ents) do
                if v:HasTag("player") then
					playercount = playercount + 1
                end
            end
			
			for k,v in pairs(ents) do
                if v:HasTag("player") then
					v.components.levelsystem:xpDoDelta(math.ceil(xp*_G.EXPMULT/playercount), v)
                end
            end
        end
	end)
end

function levelsystem:eatfn(inst)
    inst:DoTaskInTime(1, function()
        local oldeatfn = inst.components.eater.oneatfn
        function inst.components.eater.oneatfn(inst, food)
			local hunger = food.components.edible.hungervalue
			if food.components.perishable ~= nil then
				if food.components.perishable:IsStale() then
					hunger = hunger * TUNING.STALE_FOOD_HUNGER
				elseif food.components.perishable:IsSpoiled() then
					hunger = hunger * TUNING.SPOILED_FOOD_HUNGER
				end
			end
			if hunger <= 0 then return end 
			self:xpDoDelta(math.floor(hunger/2*_G.EXPMULT+0.5), inst)
            if oldeatfn ~= nil then
                oldeatfn(inst, food)
            end
        end
    end)
end


return levelsystem
local function getcoinamount(self,coinamount) self.inst.currentcoinamount:set(coinamount) end

local function currenthungerup(self,hungerupamount) self.inst.currenthungerup:set(hungerupamount) end
local function currentsanityup(self,sanityupamount) self.inst.currentsanityup:set(sanityupamount) end
local function currenthealthup(self,healthupamount) self.inst.currenthealthup:set(healthupamount) end
local function currentcrit(self,crit) self.inst.currentcrit:set(crit) end
local function currentscaleup(self,scale) self.inst.currentscaleup:set(scale) end

local function currenthungerachivcost(self,hungerachivcost) self.inst.currenthungerachivcost:set(hungerachivcost) end
local function currentsanityachivcost(self,sanityachivcost) self.inst.currentsanityachivcost:set(sanityachivcost) end
local function currenthealthachivcost(self,healthachivcost) self.inst.currenthealthachivcost:set(healthachivcost) end
local function currentcritachivcost(self,critachivcost) self.inst.currentcritachivcost:set(critachivcost) end
local function currentscalecost(self,scalecost) self.inst.currentscalecost:set(scalecost) end

local function currentkrampusxmas(self,krampusxmas) local c = 0 if krampusxmas then c=1 end self.inst.currentkrampusxmas:set(c) end
local function currentanimallover(self,animallover) local c = 0 if animallover then c=1 end self.inst.currentanimallover:set(c) end
local function currentcookmaster(self,cookmaster) local c = 0 if cookmaster then c=1 end self.inst.currentcookmaster:set(c) end
local function currentpickmaster(self,pickmaster) local c = 0 if pickmaster then c=1 end self.inst.currentpickmaster:set(c) end
local function currentlunarcraft(self,lunarcraft) local c = 0 if lunarcraft then c=1 end self.inst.currentlunarcraft:set(c) end
local function currentbusinessowner(self,businessowner) local c = 0 if businessowner then c=1 end self.inst.currentbusinessowner:set(c) end
local function currenthomeowner(self,homeowner) local c = 0 if homeowner then c=1 end self.inst.currenthomeowner:set(c) end
local function currentartsdegree(self,artsdegree) local c = 0 if artsdegree then c=1 end self.inst.currentartsdegree:set(c) end

local function currentminemaster(self,minemaster) local c = 0 if minemaster then c=1 end self.inst.currentminemaster:set(c) end
local function currentancientstation(self,ancientstation) local c = 0 if ancientstation then c=1 end self.inst.currentancientstation:set(c) end

local function findprefab(list,prefab)
    for index,value in pairs(list) do
        if value == prefab then
            return true
        end
    end
end

local allachivcoin = Class(function(self, inst)
    self.inst = inst
    self.coinamount = 0

    self.hungerupamount = 0
    self.sanityupamount = 0
    self.healthupamount = 0
    self.crit = 0
	self.scaleupamount = 0
	
	self.hungerachivcost = allachiv_coinuse["hungerup"]
    self.sanityachivcost = allachiv_coinuse["sanityup"]
    self.healthachivcost = allachiv_coinuse["healthup"]
    self.critachivcost = allachiv_coinuse["crit"]
	self.scalecost = allachiv_coinuse["scale"]
	
	self.starsspent = 0

	self.krampusxmas = false
	self.animallover = false
    self.cookmaster = false
    self.pickmaster = false
	self.lunarcraft = false
	self.businessowner = false
	self.homeowner = false
    self.artsdegree = false
	self.minemaster = false
	self.anicentstation = false

    self.maxMoistureRate = math.pi
end,
nil,
{
    coinamount = getcoinamount,

    hungerupamount = currenthungerup,
    sanityupamount = currentsanityup,
    healthupamount = currenthealthup,
    crit = currentcrit,
	scaleupamount = currentscaleup,
	
	hungerachivcost = currenthungerachivcost,
    sanityachivcost = currentsanityachivcost,
    healthachivcost = currenthealthachivcost,
    critachivcost = currentcritachivcost,
	scalecost = currentscalecost,
	
	krampusxmas = currentkrampusxmas,
	animallover = currentanimallover,
    cookmaster = currentcookmaster,
    pickmaster = currentpickmaster,
	lunarcraft = currentlunarcraft,
	businessowner = currentbusinessowner,
	homeowner = currenthomeowner,
    artsdegree = currentartsdegree,
	
	minemaster = currentminemaster,
	ancientstation = currentancientstation,
})

--保存
function allachivcoin:OnSave()
    local data = {
        coinamount = self.coinamount,
        hungerupamount = self.hungerupamount,
        sanityupamount = self.sanityupamount,
        healthupamount = self.healthupamount,
        crit = self.crit,
		scaleupamount = self.scaleupamount,
		starsspent = self.starsspent,
		krampusxmas = self.krampusxmas,
		animallover = self.animallover,
        cookmaster = self.cookmaster,
        pickmaster = self.pickmaster,
		lunarcraft = self.lunarcraft,
		businessowner = self.businessowner,
		homeowner = self.homeowner,
        artsdegree = self.artsdegree,
		minemaster = self.minemaster,
		ancientstation = self.ancientstation,
    }
    return data
end

--载入
function allachivcoin:OnLoad(data)
    self.coinamount = data.coinamount or 0

    self.hungerupamount = data.hungerupamount or 0
    self.sanityupamount = data.sanityupamount or 0
    self.healthupamount = data.healthupamount or 0
    self.crit = data.crit or 0
	self.scaleupamount = data.scaleupamount or 0
	self.hungerachivcost = allachiv_coinuse["hungerup"] + math.floor(self.hungerupamount/achievementcoststep["hungerup"])
    self.sanityachivcost = allachiv_coinuse["sanityup"] + math.floor(self.sanityupamount/achievementcoststep["sanityup"])
    self.healthachivcost = allachiv_coinuse["healthup"] + math.floor(self.healthupamount/achievementcoststep["healthup"])
    self.critachivcost = allachiv_coinuse["crit"] + math.floor(self.crit/achievementcoststep["crit"])
	self.scalecost = allachiv_coinuse["scale"] + math.floor(self.scaleupamount/achievementcoststep["scale"])
	self.starsspent = data.starsspent or 0
	self.krampusxmas = data.krampusxmas or false
	self.animallover = data.animallover or false
    self.cookmaster = data.cookmaster or false
    self.pickmaster = data.pickmaster or false
	self.lunarcraft = data.lunarcraft or false
	self.businessowner = data.businessowner or false
	self.homeowner = data.homeowner or false
    self.artsdegree = data.artsdegree or false
	self.minemaster = data.minemaster or false
	self.ancientstation = data.ancientstation or false
end

--通用效果器 获取成功
function allachivcoin:ongetcoin(inst)
    inst.SoundEmitter:PlaySound("dontstarve/HUD/research_available")
end

--通用效果器 获取失败
function allachivcoin:cantgetcoin(inst)
    --播放声音
end

function allachivcoin:coinDoDelta(value)
    self.coinamount = self.coinamount + value
end

--提升饱腹获取
function allachivcoin:hungerupcoin(inst)
    if self.coinamount >= self.hungerachivcost then
        self.hungerupamount = self.hungerupamount + 1
        self:coinDoDelta(-self.hungerachivcost)
		self.starsspent = self.starsspent + self.hungerachivcost
		self.hungerachivcost = allachiv_coinuse["hungerup"] + math.floor(self.hungerupamount / achievementcoststep["hungerup"])
        self:ongetcoin(inst)
        
        inst.components.levelsystem:UpdateMaxHunger(inst)
    end
end

--提升精神获取
function allachivcoin:sanityupcoin(inst)
    if self.coinamount >= self.sanityachivcost then
        self.sanityupamount = self.sanityupamount + 1
        self:coinDoDelta(-self.sanityachivcost)
		self.starsspent = self.starsspent + self.sanityachivcost
		self.sanityachivcost = allachiv_coinuse["sanityup"] + math.floor(self.sanityupamount / achievementcoststep["sanityup"])
        self:ongetcoin(inst)
        
        inst.components.levelsystem:UpdateMaxSanity(inst)
    end
end

function allachivcoin:healthupcoin(inst)
    if self.coinamount >= self.healthachivcost then
		self.healthupamount = self.healthupamount + 1
        self:coinDoDelta(-self.healthachivcost)
		self.starsspent = self.starsspent + self.healthachivcost
		self.healthachivcost = allachiv_coinuse["healthup"] + math.floor(self.healthupamount / achievementcoststep["healthup"])
        self:ongetcoin(inst)
        
        inst.components.levelsystem:UpdateMaxHealth(inst)
    end
end

function allachivcoin:critcoin(inst)
    if self.coinamount >= self.critachivcost then
        self.crit = self.crit + 1
        self:coinDoDelta(-self.critachivcost)
		self.starsspent = self.starsspent + self.critachivcost
		self.critachivcost = allachiv_coinuse["crit"] + math.floor(self.crit / achievementcoststep["crit"])
        self:ongetcoin(inst)
    end
end

function allachivcoin:critfn(inst)
    inst:ListenForEvent("onhitother", function(inst, data)
        local chance = allachiv_coindata["crit"]*self.crit*100
        local damage = data.damage
        local target = data.target
        if target and target.components.combat and math.random(1,100) <= chance and not target:HasTag("wall") and self.crit > 0 and self.attackcheck ~= true and data.target.components.health and data.target.components.health.currenthealth > 0 then
            self.attackcheck = true
			target.components.combat:GetAttacked(inst, damage)
            local snap = SpawnPrefab("impact")
            snap.Transform:SetScale(3, 3, 3)
            snap.Transform:SetPosition(target.Transform:GetWorldPosition())
            if target.SoundEmitter ~= nil then
                target.SoundEmitter:PlaySound("dontstarve/common/whip_large", nil, 0.3)
            end
            -- if target.components.lootdropper and target.components.health:IsDead() then
                -- if target.components.freezable or target:HasTag("monster") then
                    -- target.components.lootdropper:DropLoot()
                -- end
            -- end
            inst:DoTaskInTime(.1, function() self.attackcheck = false end)
        end
    end)
end

local function IsValidVictim(victim)
    return victim ~= nil
        and not ((victim:HasTag("prey") and not victim:HasTag("hostile")) or
                victim:HasTag("veggie") or
                victim:HasTag("structure") or
                victim:HasTag("wall") or
                victim:HasTag("balloon") or
                victim:HasTag("groundspike") or
                victim:HasTag("smashable") or
                victim:HasTag("companion"))
        and victim.components.health ~= nil
        and victim.components.combat ~= nil
end

--[[function allachivcoin:hungerupcoin(inst)
    if self.coinamount >= self.hungerachivcost then
        self.hungerupamount = self.hungerupamount + 1
		
		-- stats are currently updated in levelsystem:onupdate
        -- local hunger_percent = inst.components.hunger:GetPercent()
        -- inst.components.hunger:SetMax(inst.components.hunger.max + allachiv_coindata["hungerup"])
        -- inst.components.hunger:SetPercent(hunger_percent)
        self:coinDoDelta(-self.hungerachivcost)
		self.starsspent = self.starsspent + self.hungerachivcost
		self.hungerachivcost = allachiv_coinuse["hungerup"] + math.floor(self.hungerupamount/achievementcoststep["hungerup"])
        self:ongetcoin(inst)
    end
end]]

function allachivcoin:scaleupcoin(inst)
    if self.coinamount >= self.scalecost then
        self.scaleupamount = self.scaleupamount + 1
        self:coinDoDelta(-self.scalecost)
		self.starsspent = self.starsspent + self.scalecost
		self.scalecost = allachiv_coinuse["scale"] + math.floor(self.scaleupamount/achievementcoststep["scale"])
        self:ongetcoin(inst)
		self:scalefn(inst)
    end
end

function allachivcoin:scalefn(inst)
	if self.scaleupamount > 0 then
		print(1+allachiv_coindata["scale"]*self.scaleupamount)
		inst:ApplyScale("achievementScale", 1+allachiv_coindata["scale"]*self.scaleupamount)
	end
end

SetSharedLootTable( 'krampusxmas',
{
    {'monstermeat',		1.0},
    {'pumpkincookie',	1.0},
    {'krampus_sack', 	allachiv_coindata["krampusxmas"]},
})

function allachivcoin:krampusxmascoin(inst)
    if self.krampusxmas ~= true and self.coinamount >= allachiv_coinuse["krampusxmas"] then
        self.krampusxmas = true
		self.starsspent = self.starsspent + allachiv_coinuse["krampusxmas"]
        self:coinDoDelta(-allachiv_coinuse["krampusxmas"])
        self:krampusxmasfn(inst)
        self:ongetcoin(inst)
    end
end

function allachivcoin:krampusxmasfn(inst)
    inst:ListenForEvent("onhitother", function(inst, data)
	local target = data.target
        if self.krampusxmas and target.prefab == "krampus" then
			target.components.lootdropper:SetChanceLootTable('krampusxmas')
		end
    end)
end
		
function allachivcoin:animallovercoin(inst)
    if self.animallover ~= true and self.coinamount >= allachiv_coinuse["animallover"] then
        self.animallover = true
		self.starsspent = self.starsspent + allachiv_coinuse["animallover"]
        self:coinDoDelta(-allachiv_coinuse["animallover"])
        self:ongetcoin(inst)
		self:animalloverfn(inst)
    end
end

function allachivcoin:animalloverfn(inst)
    if self.animallover then
		inst:RemoveTag("scarytoprey")
		inst:AddTag("animallover")
	end
end

--Double Gathering
function allachivcoin:pickmastercoin(inst)
    if self.pickmaster ~= true and self.coinamount >= allachiv_coinuse["pickmaster"] then
        self.pickmaster = true
		self.starsspent = self.starsspent + allachiv_coinuse["pickmaster"]
        self:coinDoDelta(-allachiv_coinuse["pickmaster"])
        self:ongetcoin(inst)
    end
end

--Double Gather Effect
function allachivcoin:pickmasterfn(inst)
    inst:ListenForEvent("picksomething", function(inst, data)
        if self.pickmaster and data.object and data.object.components.pickable and not data.object.components.trader then
            if data.object.components.pickable.product ~= nil then
                local item = SpawnPrefab(data.object.components.pickable.product)
                if item.components.stackable then
                    item.components.stackable:SetStackSize(data.object.components.pickable.numtoharvest)
                end
                inst.components.inventory:GiveItem(item, nil, data.object:GetPosition())
            end
        end
    end)
end

--Acquired cooking hand
function allachivcoin:cookmastercoin(inst)
    if self.cookmaster ~= true and self.coinamount >= allachiv_coinuse["cookmaster"] then
        self.cookmaster = true
		self.starsspent = self.starsspent + allachiv_coinuse["cookmaster"]
        self:coinDoDelta(-allachiv_coinuse["cookmaster"])
        self:ongetcoin(inst)
        if inst:HasTag("expertchef") ~= true then
            inst:AddTag("expertchef")
        end
    end
end

--Cooking holy hand effect & cooking event built-in
function allachivcoin:cookmasterfn(inst)
    if self.cookmaster == true and inst:HasTag("expertchef") ~= true then
        inst:AddTag("expertchef")
    end
    local COOK = ACTIONS.COOK
    local old_cook_fn = COOK.fn
    COOK.fn = function(act, ...)
        local result = old_cook_fn(act)
        local stewer = act.target.components.stewer
        local allachivcoin = act.doer.components.allachivcoin
        local allachivevent = act.doer.components.allachivevent
        if result and stewer ~= nil then
            if allachivevent.cookmaster ~= true or allachivevent.cookappren ~= true then
                allachivevent.cookamount = allachivevent.cookamount + 1
                if allachivevent.cookamount >= allachiv_eventdata["cookappren"] and allachivevent.cookappren ~= true then
                    allachivevent.cookappren = true
                    allachivevent:seffc(act.doer, "cookappren")
                end
                if allachivevent.cookamount >= allachiv_eventdata["cookmaster"] and allachivevent.cookmaster ~= true then
                    allachivevent.cookmaster = true
                    allachivevent:seffc(act.doer, "cookmaster")
					local item1 = SpawnPrefab("goldcoin")
					item1.components.stackable:SetStackSize(15)
					inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
                end
            end
            if allachivcoin.cookmaster then
                local fn = stewer.task.fn
                stewer.task:Cancel()
                fn(act.target, stewer)
            end
        end
    end
end

function allachivcoin:lunarcraftcoin(inst)
    if self.lunarcraft ~= true and self.coinamount >= allachiv_coinuse["lunarcraft"] then
        self.lunarcraft = true
		self.starsspent = self.starsspent + allachiv_coinuse["lunarcraft"]
        self:coinDoDelta(-allachiv_coinuse["lunarcraft"])
        self:lunarcraftfn(inst)
        local item1 = SpawnPrefab("moonglass")
        item1.components.stackable:SetStackSize(7)
        inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
        self:ongetcoin(inst)
    end
end

function allachivcoin:lunarcraftfn(inst)
    if self.lunarcraft then
        inst:AddTag("lunarcraft")
    end
end

function allachivcoin:businessownercoin(inst)
    if self.businessowner ~= true and self.coinamount >= allachiv_coinuse["businessowner"] then
        self.businessowner = true
		self.starsspent = self.starsspent + allachiv_coinuse["businessowner"]
        self:coinDoDelta(-allachiv_coinuse["businessowner"])
        self:businessownerfn(inst)
        local item1 = SpawnPrefab("boards")
        item1.components.stackable:SetStackSize(10)
        inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
        self:ongetcoin(inst)
    end
end

function allachivcoin:businessownerfn(inst)
    if self.businessowner then
        inst:AddTag("businessowner")
    end
end

function allachivcoin:homeownercoin(inst, player)
    if self.homeowner ~= true and self.coinamount >= allachiv_coinuse["homeowner"] then
        self.homeowner = true
		self.starsspent = self.starsspent + allachiv_coinuse["homeowner"]
        self:coinDoDelta(-allachiv_coinuse["homeowner"])
        self:homeownerfn(inst)
        self:ongetcoin(inst)
   end
end

function allachivcoin:homeownerfn(inst)
    if self.homeowner then
        inst:AddTag("homeowner")
    end
end

--Flute Crafting
function allachivcoin:artsdegreecoin(inst)
    if self.artsdegree ~= true and self.coinamount >= allachiv_coinuse["artsdegree"] then
        self.artsdegree = true
		self.starsspent = self.starsspent + allachiv_coinuse["artsdegree"]
        self:coinDoDelta(-allachiv_coinuse["artsdegree"])
        self:artsdegreefn(inst)
        local item1 = SpawnPrefab("papyrus")
        item1.components.stackable:SetStackSize(6)
        inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
        self:ongetcoin(inst)
    end
end

--Flute Playing Effect
function allachivcoin:artsdegreefn(inst)
    if self.artsdegree then
        inst:AddTag("artsdegree")
    end
end

function allachivcoin:minemastercoin(inst)
    if self.minemaster ~= true and self.coinamount >= allachiv_coinuse["minemaster"] then
        self.minemaster = true
		self.starsspent = self.starsspent + allachiv_coinuse["minemaster"]
        self:coinDoDelta(-allachiv_coinuse["minemaster"])
        self:minemasterfn(inst)
        self:ongetcoin(inst)
    end
end

function allachivcoin:minemasterfn(inst)
    if self.minemaster then
        inst:ListenForEvent("working", function(inst, data)
			if self.minemaster and data.target and (data.target:HasTag("boulder") or data.target:HasTag("statue") or rocklist[data.target.prefab]) then
                if data.target.prefab == "rock_ice" then
                    data.target.components.workable:Destroy(data.target) -- Stage only goes down by 1 if worker is player, so pass glacier as the worker
                else
                    data.target.components.workable.workleft = 0
                end
			end
		end)
    end
end

function allachivcoin:ancientstationcoin(inst)
    if self.ancientstation ~= true and self.coinamount >= allachiv_coinuse["ancientstation"] then
        self.ancientstation = true
		self.starsspent = self.starsspent + allachiv_coinuse["ancientstation"]
        self:coinDoDelta(-allachiv_coinuse["ancientstation"])
        self:ancientstationfn(inst)
		local item1 = SpawnPrefab("goldnugget")
        item1.components.stackable:SetStackSize(8)
        inst.components.inventory:GiveItem(item1, nil, inst:GetPosition())
        self:ongetcoin(inst)
    end
end

function allachivcoin:ancientstationfn(inst)
    if self.ancientstation then
		inst:AddTag("ancientstation")
    end
end

function allachivcoin:addcoins(inst)
	self.coinamount = self.coinamount + 100
end

--Reset Rewards
function allachivcoin:removecoin(inst)

    self.coinamount = self.coinamount + math.ceil(self.starsspent*reset_refund_percentage)
    self:resetbuff(inst)

    self.hungerupamount = 0
    self.sanityupamount = 0
    self.healthupamount = 0
    
    inst.components.levelsystem:UpdateMaxHunger(inst)
    inst.components.levelsystem:UpdateMaxSanity(inst)
    inst.components.levelsystem:UpdateMaxHealth(inst)
    
    self.crit = 0
	self.scaleupamount = 0
    inst.components.allachivevent.starreset = 0
	
	self.hungerachivcost = allachiv_coinuse["hungerup"]
    self.sanityachivcost = allachiv_coinuse["sanityup"]
    self.healthachivcost = allachiv_coinuse["healthup"]
    self.critachivcost = allachiv_coinuse["crit"]
	self.scalecost = allachiv_coinuse["scale"]
	self.starsspent = 0

	self.krampusxmas = false
	self.animallover = false
    self.cookmaster = false
    self.pickmaster = false
	self.lunarcraft = false
	self.businessowner = false
	self.homeowner = false
    self.artsdegree = false
	self.minemaster = false
	self.ancientstation = false

    if inst.components.health.currenthealth > 0 and not inst.components.rider:IsRiding() then
        inst.components.locomotor:Stop()
        inst.sg:GoToState("changeoutsidewardrobe")
    end
    SpawnPrefab("shadow_despawn").Transform:SetPosition(inst.Transform:GetWorldPosition())
    SpawnPrefab("statue_transition_2").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

--Reset Attributes
function allachivcoin:resetbuff(inst)

	inst.components.hunger.burnratemodifiers:RemoveModifier("achievementperk")
	
	inst:ApplyScale("achievementScale", 1)

	inst:RemoveTag("ancientstation")
	inst:RemoveTag("lunarcraft")
	inst:RemoveTag("businessowner")
	inst:RemoveTag("homeowner")
	inst:RemoveTag("animallover")
	if self.animallover then inst:AddTag("scarytoprey") end
    inst:RemoveTag("artsdegree")

    if inst.prefab ~= "warly" then
        inst:RemoveTag("expertchef")
    end
end

--Pre-Run
function allachivcoin:Init(inst)
	if _G.SYSTEM_CONFIG == "both" or _G.SYSTEM_CONFIG == "achieve" then
		inst:DoTaskInTime(.1, function()
			self:lunarcraftfn(inst)
			self:businessownerfn(inst)
			self:homeownerfn(inst)
			self:cookmasterfn(inst)
			self:pickmasterfn(inst)
			self:animalloverfn(inst)
			self:krampusxmasfn(inst)
			self:critfn(inst)
			self:scalefn(inst)
			self:artsdegreefn(inst)
			self:minemasterfn(inst)
			self:ancientstationfn(inst)
		end)
	end

    inst:DoPeriodicTask(.5, function() self:onupdate(inst) end)
end

--Detect data that is not changed by this mod and update it in real time, and at the same time be responsible for validating the reward when loading
function allachivcoin:onupdate(inst)
    --Stats are updated in the levelsystem:onupdate function
	--only moisture is here // maybe create a new component for stat updates
    if self.maxMoistureRate ~= inst.components.moisture.maxMoistureRate then
        if self.nomoist then
            inst.components.moisture.maxMoistureRate = 0
        end
    end
end


return allachivcoin
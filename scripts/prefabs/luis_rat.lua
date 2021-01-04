local assets =
{
	Asset("ANIM", "anim/uncompromising_rat.zip"),
	Asset("ANIM", "anim/carrat_basic.zip"),
	
	Asset("ANIM", "anim/uncompromising_rat_burrow.zip"),
}

local prefabs =
{
	
}

local carratsounds =
{
	idle = "turnoftides/creatures/together/carrat/idle",
	hit = "turnoftides/creatures/together/carrat/hit",
	sleep = "turnoftides/creatures/together/carrat/sleep",
	death = "turnoftides/creatures/together/carrat/death",
	emerge = "turnoftides/creatures/together/carrat/emerge",
	submerge = "turnoftides/creatures/together/carrat/submerge",
	eat = "turnoftides/creatures/together/carrat/eat",
	stunned = "turnoftides/creatures/together/carrat/stunned",
}

SetSharedLootTable("raidrat",
{
	{"monstermeat",		1.00},
	{"goldnugget",		0.33},
})

local brain = require "brains/uncompromising_ratbrain"

local function on_burnt(inst)
	inst.components.lootdropper:DropLoot()
	inst:Remove()
end

local function OnDeath(inst)
	if inst._item ~= nil then
		inst._item:Remove()
	end
end

local function OnPickup(inst, data)
	if data.item.components.explosive == nil then
		inst:AddTag("carrying")
		data.item:AddTag("raided")
		local item = string.lower(data.item.prefab)
		local skin_build = data.item:GetSkinBuild()
		inst._item = SpawnPrefab(item)
		
		if inst._item ~= nil then
			inst._item.components.inventoryitem.canbepickedup = false
			inst._item.entity:SetParent(inst.entity)
			inst._item.entity:AddFollower()
			inst._item.Follower:FollowSymbol(inst.GUID, "carrat_body", 0, -60, 0)
			inst._item.Transform:SetScale(0.8, 0.8, 0.8)
			if skin_build ~= nil then
				--TODO : Need to match the item skin here
			end
			inst._item:AddComponent("pickable")
			inst._item.components.pickable.quickpick = true
			inst._item.components.pickable.canbepicked = true
			inst._item.components.pickable.onpickedfn = function()
				inst.components.inventory:DropEverything()
				inst:RemoveTag("carrying")
				inst._item:Remove()
			end
		end
	else
		data.item.components.explosive:OnBurnt()
	end
end

local function onsave_rat(inst, data)
	if inst:HasTag("carrying") then
		data.carrying = true
	end
end

local function onload_rat(inst, data)
	local is_carrying = data.carrying or inst:HasTag("carrying")
	if is_carrying then
		inst.components.inventory:DropEverything()
	end
end

local function DoRipple(inst)
    if inst.components.drownable ~= nil and inst.components.drownable:IsOverWater() then
        SpawnPrefab("weregoose_ripple"..tostring(math.random(2))).entity:SetParent(inst.entity)
    end
end

local function removerat(inst)
	inst.components.inventory:DropEverything()
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()
	
	MakeCharacterPhysics(inst, 1, 0.5)
	
	inst.DynamicShadow:SetSize(1, .75)
	inst.DynamicShadow:Enable(false)
	inst.Transform:SetSixFaced()
	
	inst.AnimState:SetBank("carrat")
	inst.AnimState:SetBuild("uncompromising_rat")
	inst.AnimState:PlayAnimation("planted")
	inst.AnimState:SetScale(1,1,1)
	
	inst:AddTag("raidrat")
	inst:AddTag("animal")
	inst:AddTag("hostile")
	inst:AddTag("herdmember")
	inst:AddTag("smallcreature")
	--inst:AddTag("canbetrapped")
	inst:AddTag("cattoy")
	inst:AddTag("catfood")
	
	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("drownable")
	inst.components.drownable.enabled = false
	
	if inst.gooserippletask == nil then
            inst.gooserippletask = inst:DoPeriodicTask(.25, DoRipple, FRAMES)
        end
	
	inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.GROUND)
    --inst.Physics:CollidesWith(COLLISION.OBSTACLES)
    --inst.Physics:CollidesWith(COLLISION.SMALLOBSTACLES)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
    inst.Physics:CollidesWith(COLLISION.GIANTS)
    inst.Physics:Teleport(inst.Transform:GetWorldPosition())
	
	inst.sounds = carratsounds
	
	inst:AddComponent("locomotor")
	inst.components.locomotor.walkspeed = 2
	inst.components.locomotor.runspeed = 3
	inst.components.locomotor:EnableGroundSpeedMultiplier(false)
	inst.components.locomotor:SetTriggersCreep(false)
	inst:SetStateGraph("SGuncompromising_rat")
	
	inst:SetBrain(brain)
	
	inst:AddComponent("eater")
	inst.components.eater:SetDiet({ FOODTYPE.HORRIBLE }, { FOODTYPE.HORRIBLE })
	inst.components.eater.strongstomach = true
	inst.components.eater:SetCanEatRaw()
	
	inst:AddComponent("health")
	inst.components.health:SetMaxHealth(100)
	
	inst:AddComponent("lootdropper")
	inst.components.lootdropper:AddRandomLoot("monstersmallmeat", 0.34)
	inst.components.lootdropper:AddRandomLoot("disease_puff", 0.34)
	inst.components.lootdropper.numrandomloot = 1
	
	inst:AddComponent("sleeper")
	inst.components.sleeper:SetResistance(1)
	
	inst:AddComponent("knownlocations")
	
	inst:AddComponent("inventory")
	inst.components.inventory.maxslots = 1
	
	inst:AddComponent("inspectable")
	
	inst:ListenForEvent("death", OnDeath)
	inst:ListenForEvent("onpickupitem", OnPickup)
	
	MakeHauntablePanic(inst)
	
	MakeSmallBurnableCharacter(inst, "carrat_body")
	MakeSmallFreezableCharacter(inst, "carrat_body")
	
    inst:DoPeriodicTask(19, function()
    removerat(inst)
end)	
	
	inst.OnSave = onsave_rat
	inst.OnLoad = onload_rat
	
	return inst
end

return Prefab("luis_rat", fn, assets, prefabs)
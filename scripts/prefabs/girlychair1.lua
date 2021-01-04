local assets =
{
    Asset("ANIM", "anim/girlychair1.zip"),
	
    Asset("ATLAS", "images/inventoryimages/girlychair1.xml"),
    Asset("IMAGE", "images/inventoryimages/girlychair1.tex"),
}

local prefabs = 
{
	"collapse_small",
}

----------------

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("hit")
	inst.AnimState:PushAnimation("idle")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:PushAnimation("idle")
end

----------------

local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

    inst:AddTag("structure")
    
    inst.AnimState:SetBank("girlychair1")
    inst.AnimState:SetBuild("girlychair1")
	inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    	
    inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(3)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
    
	inst:ListenForEvent("onbuilt", onbuilt)
    
    return inst
end

return Prefab("girlychair1", fn, assets, prefabs),
       MakePlacer("girlychair1_placer", "girlychair1", "girlychair1", "idle")
	   
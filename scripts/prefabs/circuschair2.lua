local assets =
{
    Asset("ANIM", "anim/circuschair2.zip"),
	
    Asset("ATLAS", "images/inventoryimages/circuschair2.xml"),
    Asset("IMAGE", "images/inventoryimages/circuschair2.tex"),
}

local prefabs = 
{
	"ash",
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

local function onburnt(inst)
	SpawnPrefab("ash").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst:Remove()
end

----------------

local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()	   
    
    inst:AddTag("structure")
    
    inst.AnimState:SetBank("circuschair2")
    inst.AnimState:SetBuild("circuschair2")
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
	
	MakeSmallBurnable(inst, nil, nil, true)
	inst.components.burnable:SetOnBurntFn(onburnt)	
	
    MakeSmallPropagator(inst)	
    
	inst:ListenForEvent("onbuilt", onbuilt)
   
    return inst
end

return Prefab("circuschair2", fn, assets, prefabs),
       MakePlacer("circuschair2_placer", "circuschair2", "circuschair2", "idle") 
	   
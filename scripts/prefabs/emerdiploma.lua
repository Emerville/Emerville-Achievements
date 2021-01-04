local assets = 
{
    Asset("ANIM", "anim/emerdiploma.zip"),
	
    Asset("ATLAS", "images/inventoryimages/emerdiploma.xml"),
    Asset("IMAGE", "images/inventoryimages/emerdiploma.tex"),
}

local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

    inst:AddTag("diploma")
    
    inst.AnimState:SetBank("emerdiploma")
    inst.AnimState:SetBuild("emerdiploma")
	inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    	
    inst:AddComponent("inspectable")
	
	inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "emerdiploma"	
    inst.components.inventoryitem.atlasname = "images/inventoryimages/emerdiploma.xml"
    
    return inst
end

return Prefab("emerdiploma", fn, assets, prefabs)
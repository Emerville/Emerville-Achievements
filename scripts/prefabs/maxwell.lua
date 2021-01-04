local assets = {
	Asset("ANIM", "anim/maxwell_build.zip"),
	Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
    inst.Transform:SetTwoFaced()
	inst.entity:AddNetwork()

    inst.AnimState:SetBank("maxwell")
    inst.AnimState:SetBuild("maxwell_build")
    inst.AnimState:PlayAnimation("appear5")
	inst.AnimState:SetScale(1,1,1)
	
	inst.entity:SetPristine()
	
	if not TheWorld.ismastersim then
        return inst
    end
    
    inst:AddComponent("talker")
    inst.components.talker.fontsize = 28
    inst.components.talker.font = TALKINGFONT
    inst.components.talker.colour = Vector3(.9, .0, .0, 1) --Vector3(133/255, 140/255, 167/255) 
    inst.components.talker.offset = Vector3(0,-600,0)
    --inst.components.talker:MakeChatter()
	
    inst:AddComponent("inspectable")
	
	inst.persists = false
    return inst
end

return Prefab("common/characters/maxwell", fn, assets)  

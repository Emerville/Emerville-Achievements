local assets =
{
    Asset("ANIM", "anim/flutes.zip"),
    Asset("IMAGE", "images/inventoryimages/gardening_flute.tex"),
    Asset("ATLAS", "images/inventoryimages/gardening_flute.xml"),
}

local function OnPlayFn(inst, musician)
    musician.components.sanity:DoDelta(-TUNING.SANITY_HUGE)
    local pos = Vector3(inst.Transform:GetWorldPosition())
    local ents = TheSim:FindEntities(pos.x,pos.y,pos.z, 25)
    for k,v in pairs(ents) do
        if v.components.pickable and v.prefab ~= "flower" and v.prefab ~= "flower_evil" then
            v.components.pickable:Pick(musician)
        end
        if v.components.crop then
            v.components.crop:Harvest(musician)
        end
    end
    return true
end


local function fn() -- (inst, musician, instrument)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst:AddTag("flute")

    inst.AnimState:SetBank("flutes")
    inst.AnimState:SetBuild("flutes")
    inst.AnimState:PlayAnimation("gardening")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("instrument")
    inst.components.instrument:SetOnPlayedFn(OnPlayFn)

    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.PLAY)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(10)
    inst.components.finiteuses:SetUses(10)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst.components.finiteuses:SetConsumption(ACTIONS.PLAY, 1)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "gardening_flute"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/gardening_flute.xml"

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("flute_harvest", fn, assets)
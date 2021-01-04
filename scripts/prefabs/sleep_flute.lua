local assets =
{
    Asset("ANIM", "anim/flutes.zip"),
	Asset("IMAGE", "images/inventoryimages/sleep_flute.tex"),
	Asset("ATLAS", "images/inventoryimages/sleep_flute.xml"),
}

local function Play_fn(inst, musician)
	musician.components.sanity:DoDelta(-5)
	
	local x, y, z = musician.Transform:GetWorldPosition()
	local range = 30
	local ents = TheNet:GetPVPEnabled() and
	            TheSim:FindEntities(x, y, z, range, nil, { "playerghost", "FX", "DECOR", "INLIMBO" }, { "sleeper", "player" }) or
                TheSim:FindEntities(x, y, z, range, { "sleeper" }, { "player", "FX", "DECOR", "INLIMBO" })
    for i, v in ipairs(ents) do
        if v ~= musician and
            not (v.components.freezable ~= nil and v.components.freezable:IsFrozen()) and
            not (v.components.pinnable ~= nil and v.components.pinnable:IsStuck()) then
            local mount = v.components.rider ~= nil and v.components.rider:GetMount() or nil
            if mount ~= nil then
                mount:PushEvent("ridersleep", { sleepiness = 10, sleeptime = 20 })
            end
            if v.components.sleeper ~= nil then
                v.components.sleeper:AddSleepiness(10, 20)
            elseif v.components.grogginess ~= nil then
                v.components.grogginess:AddGrogginess(10, 20)
            else
                v:PushEvent("knockedout")
            end
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
    inst.AnimState:PlayAnimation("sleep")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("instrument")
	inst.components.instrument:SetOnPlayedFn(Play_fn)
	

    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.PLAY)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(13)
    inst.components.finiteuses:SetUses(13)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst.components.finiteuses:SetConsumption(ACTIONS.PLAY, 1)

    inst:AddComponent("inventoryitem")
	
    inst.replica.inventoryitem:SetImage("sleep_flute")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sleep_flute.xml"

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("sleep_flute", fn, assets)

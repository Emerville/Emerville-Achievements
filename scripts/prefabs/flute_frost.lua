local assets =
{
    Asset("ANIM", "anim/flutes.zip"),
    Asset("IMAGE", "images/inventoryimages/sleep_flute.tex"),
    Asset("ATLAS", "images/inventoryimages/sleep_flute.xml"),
}

--[[local function spawn_ice(inst)
--        SpawnPrefab("deer_ice_circle")
--        fin.Transform:SetPosition(inst.Transform:GetWorldPosition())
--        SpawnPrefab("crab_king_icefx").Transform:SetPosition(inst.Transform:GetWorldPosition())
            inst.castfx = "deer_ice_circle"
            inst.castduration = 6
 --         fin:DoTaskInTime(3, fin:Remove())
end]]

local function SpawnSpell(inst)
    local spell = SpawnPrefab(inst.castfx)
    local x, y, z = inst.Transform:GetWorldPosition()
    SpawnPrefab("crab_king_icefx").Transform:SetPosition(x, y, z)
    spell.Transform:SetPosition(x, y, z)
    spell:DoTaskInTime(inst.castduration, spell.KillFX)
    return spell
end

local function OnPlayFn(inst, musician)
    SpawnSpell(inst)
    local pt = musician:GetPosition()
    local numice = 3

    musician.components.sanity:DoDelta(-25)
    musician:StartThread(function()
        for k = 1, numice do
            local theta = math.random() * 2 * PI
            local radius = math.random(3, 8)

            -- we have to special case this one because birds can't land on creep
            local result_offset = FindValidPositionByFan(theta, radius, 12, function(offset)
                local pos = pt + offset
                --NOTE: The first search includes invisible entities
                return #TheSim:FindEntities(pos.x, 0, pos.z, 1, nil, { "INLIMBO", "FX" }) <= 0
                    and TheWorld.Map:IsDeployPointClear(pos, nil, 1)
            end)

            if result_offset ~= nil then
                local x, z = pt.x + result_offset.x, pt.z + result_offset.z
                local ice = SpawnPrefab("rock_iceperk")
                ice.Transform:SetPosition(x, 0, z)

                --need a better effect
                SpawnPrefab("ice").Transform:SetPosition(x, 0, z) --"ice_splash"
                SpawnPrefab("ice_splash").Transform:SetPosition(x, 0, z)
                ShakeAllCameras(CAMERASHAKE.FULL, .2, .02, .25, musician, 40)
            end

            Sleep(.33)
        end
    end)
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
    inst.components.instrument:SetOnPlayedFn(OnPlayFn)

    inst:AddComponent("tool")
    inst.components.tool:SetAction(ACTIONS.PLAY)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(10)
    inst.components.finiteuses:SetUses(10)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst.components.finiteuses:SetConsumption(ACTIONS.PLAY, 1)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "sleep_flute"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/sleep_flute.xml"

    inst.castfx = "deer_ice_circle"
    inst.castduration = 4

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("flute_frost", fn, assets)

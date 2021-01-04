local assets =
{
    Asset("ANIM", "anim/flutes.zip"),
	Asset("IMAGE", "images/inventoryimages/brimstone_flute.tex"),
	Asset("ATLAS", "images/inventoryimages/brimstone_flute.xml"),
}

local function Play_fn(inst, musician)
            local pt = musician:GetPosition()
            local numtentacles = 100

            musician.components.sanity:DoDelta(-TUNING.SANITY_HUGE)

            musician:StartThread(function()
                for k = 1, numtentacles do
                    local theta = math.random() * 2 * PI
                    local radius = math.random(3, 3)

                    -- we have to special case this one because birds can't land on creep
                    local result_offset = FindValidPositionByFan(theta, radius, 12, function(offset)
                        local pos = pt + offset
                        --NOTE: The first search includes invisible entities
                        return #TheSim:FindEntities(pos.x, 0, pos.z, 1, nil, { "INLIMBO", "FX" }) <= 0
                            and TheWorld.Map:IsDeployPointClear(pos, nil, 1)
                    end)

                    if result_offset ~= nil then
                        local x, z = pt.x + result_offset.x, pt.z + result_offset.z
                        local tentacle = SpawnPrefab("sandspike_tallperk")
                        tentacle.Transform:SetPosition(x, 0, z)
                        tentacle:DoTaskInTime(0, tentacle.TriggerFX)
						tentacle:DoTaskInTime(10, tentacle.KillFX)

                        --need a better effect
                        SpawnPrefab("sanity_raise").Transform:SetPosition(x, 0, z)
                    end
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
    inst.AnimState:PlayAnimation("brimstone")

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
    inst.components.finiteuses:SetMaxUses(10)
    inst.components.finiteuses:SetUses(10)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst.components.finiteuses:SetConsumption(ACTIONS.PLAY, 1)

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "brimstone_flute"	
    inst.components.inventoryitem.atlasname = "images/inventoryimages/brimstone_flute.xml"

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("flute_fortification", fn, assets)

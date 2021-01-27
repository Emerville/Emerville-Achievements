require "prefabutil"

local cooking = require("cooking")

local assets =
{
    Asset("ANIM", "anim/diningtable.zip"),
    Asset("SOUND", "sound/sfx.fsb"),
    Asset("ATLAS", "images/inventoryimages/diningtable.xml"),
    Asset("IMAGE", "images/inventoryimages/diningtable.tex"),
}

local prefabs =
{
    "collapse_small",
}

local function setsymbol(inst, product)
    local recipe = cooking.GetRecipe("cookpot", product)
    local build = (recipe and recipe.overridebuild) or "cook_pot_food"
    local overridesymbol = (recipe and recipe.overridesymbol) or product

    inst.AnimState:ShowSymbol("swap_flower")
    inst.AnimState:OverrideSymbol("swap_flower", build, overridesymbol)
end

local function onhammered(inst)
    inst.components.dining:DropFood()
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker, workleft)
    inst.components.dining:DropFood()
    if workleft > 0 then
        inst.SoundEmitter:PlaySound("dontstarve/creatures/together/stagehand/hit")
        inst.AnimState:PlayAnimation("hit")
        inst.AnimState:PushAnimation("idle")
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle", false)
    inst.SoundEmitter:PlaySound("dontstarve/creatures/together/stagehand/hit")
end

local function onsave(inst, data)
    if inst.foodname ~= nil then
        data.foodname = inst.foodname
        data.foodhunger = inst.foodhunger
        data.foodhealth = inst.foodhealth
        data.foodsanity = inst.foodsanity
        data.foodnum = inst.foodnum
    end
end

local function onload(inst, data)
    if data == nil or data.foodname == nil then
        return nil
    end

    inst.foodname = data.foodname
    inst.foodhunger = data.foodhunger
    inst.foodhealth = data.foodhealth
    inst.foodsanity = data.foodsanity
    inst.foodnum = data.foodnum

    setsymbol(inst, inst.foodname)
end

local function abletoaccepttest(inst, item)
    if not item:HasTag("preparedfood") then
        return false, "WRONGTYPE"
    elseif inst.foodname and inst.foodname ~= item.prefab then
        return false, "SLOTFULL"
    end
    return true
end

local function ongivenitem(inst, giver, item)
    local count = 1
    
    if item.components.stackable then
        count = item.components.stackable.stacksize
    end
    
    if inst.foodname == nil then
        inst.foodname = item.prefab
        inst.foodhunger = item.components.edible.hungervalue * TUNING.DINING_BUFF
        inst.foodhealth = item.components.edible.healthvalue * TUNING.DINING_BUFF
        inst.foodsanity = item.components.edible.sanityvalue * TUNING.DINING_BUFF
        inst.foodnum = count

        setsymbol(inst, inst.foodname)
    else
        inst.foodnum = inst.foodnum + count
    end
end

--For future reference about spiced food. Added by me (Luis) on November 22, 2020, so I can attempt to fix invisible spiced food.

--[[        local food_symbol_build = nil
        if spicename ~= nil then
            inst.AnimState:SetBuild("plate_food")
            inst.AnimState:SetBank("plate_food")
            inst.AnimState:OverrideSymbol("swap_garnish", "spices", spicename)

            inst:AddTag("spicedfood")

            inst.inv_image_bg = { image = (data.basename or data.name)..".tex" }
            inst.inv_image_bg.atlas = GetInventoryItemAtlas(inst.inv_image_bg.image)

            food_symbol_build = data.overridebuild or "cook_pot_food"
        else
            inst.AnimState:SetBuild(data.overridebuild or "cook_pot_food")
            inst.AnimState:SetBank("cook_pot_food")
        end

        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap_food", data.overridebuild or "cook_pot_food", data.basename or data.name)]]



local function getDescription(inst,viewer)
    local desc = STRINGS.NAMES.DININGTABLE..": "
    if inst.foodnum and inst.foodnum > 0 and inst.foodname then
        desc = inst.foodnum.." "..(STRINGS.NAMES[string.upper(inst.foodname)] or string.upper(inst.foodname))
        if inst.foodhunger or inst.foodhealth or inst.foodsanity then
            desc = desc.."\n"..STRINGS.HUNGER_DINING..": "..(inst.foodhunger or 0).."\n"..STRINGS.HEALTH_DINING..": "..(inst.foodhealth or 0).."\n"..STRINGS.SANITY_DINING..": "..(inst.foodsanity or 0)
        end
    else
        desc = STRINGS.DININGTABLE_NONE
    end
    return desc
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddLight()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, .3)

    inst.AnimState:SetBank("diningtable")
    inst.AnimState:SetBuild("diningtable")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:HideSymbol("swap_flower")
    inst.AnimState:HideSymbol("swap_vase")

    inst:AddTag("structure")
    inst:AddTag("trader")
    inst:AddTag("stacktrader")
    inst:AddTag("diningtable")

    MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("dining")

    inst:AddComponent("lootdropper")

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("trader")
    inst.components.trader:SetAbleToAcceptTest(abletoaccepttest)
    inst.components.trader.onaccept = ongivenitem

    inst:AddComponent("inspectable")
    inst.components.inspectable.descriptionfn = getDescription

    MakeHauntableWork(inst)
    MakeSnowCovered(inst)

    inst:ListenForEvent("onbuilt", onbuilt)

    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

return Prefab("diningtable", fn, assets, prefabs),
    MakePlacer("diningtable_placer", "diningtable", "diningtable", "idle", nil, nil, nil, nil, nil, nil,
    function(inst) inst.AnimState:HideSymbol("swap_flower") inst.AnimState:HideSymbol("swap_vase")  end)
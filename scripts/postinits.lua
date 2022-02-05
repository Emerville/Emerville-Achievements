--Removed antlion.lua from scripts/prefabs. Fix for Antlion spawning outside of summer. --KoreanWaffles
AddPrefabPostInit("antlion", function(inst)
    if not GLOBAL.TheNet:GetIsServer() then return end
    local _OnGivenItem = inst.components.trader.onaccept
    inst.components.trader.onaccept = function(inst, giver, item)
        if item.prefab == "heatrock" and item.currentTempRange > 1 and item.currentTempRange < 4 then
            if giver.components.allachivevent and giver.components.allachivevent.fuzzy ~= true then
                giver.components.allachivevent.fuzzyamount = giver.components.allachivevent.fuzzyamount + 1
                if giver.components.allachivevent.fuzzyamount >= GLOBAL.allachiv_eventdata["fuzzy"] then
                    giver.components.allachivevent.fuzzy = true
                    giver.components.allachivevent:seffc(giver, "fuzzy")
                end
            end
        end
        _OnGivenItem(inst, giver, item)
    end
end)

--Removed blinkstaff.lua from scripts/prefabs. Fix for crash on orange staff reskin. --Platypus
AddPrefabPostInit("orangestaff", function(inst)
    if inst.components.blinkstaff then
        old_onblinkfn = inst.components.blinkstaff.onblinkfn
        inst.components.blinkstaff.onblinkfn = function(inst, pt, caster)
            if not caster.components.allachivevent.teleport then
                caster.components.allachivevent.teleportamount = caster.components.allachivevent.teleportamount + 1
                if caster.components.allachivevent.teleportamount >= GLOBAL.allachiv_eventdata["teleport"] then
                    caster.components.allachivevent.teleport = true
                    caster.components.allachivevent:seffc(caster, "teleport")
                end
            end
            if old_onblinkfn ~= nil then
                old_onblinkfn(inst, pt, caster)
            end
        end
    end
end)

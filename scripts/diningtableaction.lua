----DINING TABLE---
local ACTIONS = GLOBAL.ACTIONS
local ActionHandler = GLOBAL.ActionHandler

local DINE = GLOBAL.Action({ mount_valid = true })
DINE.str = "Dine"
DINE.id = "DINE"
DINE.fn = function(act)
    if act.doer and act.target and act.target.components.dining and act.target.foodname then
        act.doer.components.eater:Eat(act.target.components.dining:GetFood(), act.doer)
        return true
    end
    return false
end

AddAction(DINE)

AddComponentAction("SCENE", "dining", function(inst, doer, actions, right)
    if right then
        table.insert(actions, ACTIONS.DINE)
    end
end)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DINE, "doshortaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DINE, "doshortaction"))

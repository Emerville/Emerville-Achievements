----DINING TABLE---
local ACTIONS = GLOBAL.ACTIONS
local ActionHandler = GLOBAL.ActionHandler

local DINE = GLOBAL.Action({ mount_valid = true })
DINE.str = "Dine"
DINE.id = "DINE"
DINE.fn = function(act)
    if act.doer and act.target and act.target.components.dining then
        if act.target:HasTag("uid_private") then
            if act.doer.userid and act.target:HasTag("uid_"..act.doer.userid)
                or act.doer.Network and act.doer.Network:IsServerAdmin() then
                return act.target.components.dining:Dine(act.doer)
            end
            return false
        end
        return act.target.components.dining:Dine(act.doer)
    end
end

AddAction(DINE)

AddComponentAction("SCENE", "dining", function(inst, doer, actions, right)
    if right then
        table.insert(actions, ACTIONS.DINE)
    end
end)

AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.DINE, "doshortaction"))
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.DINE, "doshortaction"))

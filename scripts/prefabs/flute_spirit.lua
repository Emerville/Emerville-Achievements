local assets =
{
    Asset("ANIM", "anim/flutes.zip"),
	Asset("IMAGE", "images/inventoryimages/tentacles_flute.tex"),
	Asset("ATLAS", "images/inventoryimages/tentacles_flute.xml"),
}

local prefabs =
{
	"maxwell",
}

local function RandomTalk(sayings) return sayings[math.random(#sayings)] end		

local function Play_fn(inst, musician)	
    local pt = Vector3(musician.Transform:GetWorldPosition())
    local numbershadows = 1
	
    musician:DoTaskInTime(1.5, function()
	if musician:HasTag("dappereffects") then
		musician.components.talker:Say(RandomTalk(MAXWELLSAYS))	
	elseif musician:HasTag("soulless") then
		musician.components.talker:Say(RandomTalk(WX78SAYS))
	elseif musician:HasTag("mime") then
		musician.components.talker:Say("")
	else
		musician.components.talker:Say(RandomTalk(GENERICSAYS))	
		end
	end)
	
	musician.components.sanity:DoDelta(-50) 	
	musician:DoTaskInTime(2.5, function()
	
	local range = 30
	local ents = TheSim:FindEntities(pt.x,pt.y,pt.z, range, nil, { "INLIMBO", "playerghost", "player", "companion", "abigail" })
	
    for k,v in pairs(ents) do
		
		local collapse = SpawnPrefab("collapse_big")
		local collapse2 = SpawnPrefab("explode_small")
		local tpos = Vector3(v.Transform:GetWorldPosition())
		
		if v ~= musician or v:HasTag("abigail") then end

			if not v:HasTag("player") then
				if v.components.health and v.components.combat then
					v.components.health:DoDelta(-200)
					collapse2.Transform:SetPosition(tpos.x, 0, tpos.z)
					if v.sg and v.sg.sg.states.hit and not v.components.health:IsDead() then
						v.sg:GoToState("hit")
					end
				end
			end
		end

	ShakeAllCameras(CAMERASHAKE.FULL, 2, 0.05, .5, 40)
	musician.SoundEmitter:PlaySound("dontstarve/maxwell/throne_scream", "throne") 
	musician.SoundEmitter:SetVolume("throne", 0.6)

	musician.SoundEmitter:PlaySound("dontstarve/creatures/slurtle/mound_explode")
	end)

		musician:StartThread(function()
        for k = 1, numbershadows do
            local theta = math.random() * 2 * PI
            local radius = math.random(3, 10)
			
            local result_offset = FindValidPositionByFan(theta, radius, 12, function(offset)
                local x,y,z = (pt + offset):Get()
                local ents = TheSim:FindEntities(x,y,z , 1)
                return not next(ents) 
            end)

            if result_offset then
                local angle = math.random(0, 1)*180
				local shadow = SpawnPrefab("maxwell")
				if shadow.components.inspectable then shadow:RemoveComponent("inspectable") end
				shadow.Transform:SetRotation(angle)
                shadow.SoundEmitter:PlaySound("dontstarve/maxwell/disappear")
                shadow.Transform:SetPosition((pt + result_offset):Get())
				
				ShakeAllCameras(CAMERASHAKE.FULL, 2, 0.01, .3, 40)
				
                local fx = SpawnPrefab("maxwell_smoke")
                local pos = pt + result_offset
                fx.Transform:SetPosition(pos.x, pos.y, pos.z)
				shadow:DoTaskInTime(1, function()
					ShakeAllCameras(CAMERASHAKE.FULL, 2, 0.01, .5, 40)
					shadow.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world3", "talking")
					shadow.AnimState:PlayAnimation("dialog5_pre")
						shadow.components.talker.fontsize = 40
						shadow.components.talker.font = TALKINGFONT
						shadow.components.talker.colour = Vector3(.9, .0, .0, 1) --Vector3(0/255, 0/255, 0/255)
						shadow.components.talker.offset = Vector3(0,-800,0)
						shadow.components.talker:Say(RandomTalk(GOAWAY))
							shadow:DoTaskInTime(0.8, function()
								shadow.AnimState:PlayAnimation("dialog5_loop")

										shadow:DoTaskInTime(2, function()
											shadow.SoundEmitter:KillSound("talking")
											shadow.AnimState:PlayAnimation("disappear5")
												shadow:DoTaskInTime(0.7, function()
													ShakeAllCameras(CAMERASHAKE.FULL, 0.5, 0.08, .5, 40)
													shadow.SoundEmitter:PlaySound("dontstarve/maxwell/disappear")
													local fx = SpawnPrefab("maxwell_smoke")
													fx.Transform:SetPosition(pos.x, pos.y, pos.z)
													shadow:Remove()
								
												end)
										end)
							end)
				end)
            end
            Sleep(.33)
        end
		end)
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
    inst.AnimState:PlayAnimation("tentacles")

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
    inst.components.finiteuses:SetMaxUses(5)
    inst.components.finiteuses:SetUses(5)
    inst.components.finiteuses:SetOnFinished(inst.Remove)
    inst.components.finiteuses:SetConsumption(ACTIONS.PLAY, 1)
	
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.imagename = "tentacles_flute"	
    inst.components.inventoryitem.atlasname = "images/inventoryimages/tentacles_flute.xml"

    MakeHauntableLaunch(inst)

    return inst
end

--Evil Maxwell
GOAWAY = {	"GO AWAY!", "STUPID BEINGS.", "DISAPPEAR!", "GET OUT!", "I WILL TEACH 'EM.", 
			"DIE!", "DON'T EVEN THINK ABOUT IT.",}
			
--Maxwell
MAXWELLSAYS = {	"My evil spirit haunts me!", "Stay away from me!", "Leave me alone!",}

--Maxwell
WX78SAYS = { "IT'S AN EVIL SPIRIT", "TERRIFYING", "MAYBE THAT WASN'T A GOOD IDEA",}		
		
--Generic
GENERICSAYS = {	"It's an evil spirit!", "Terrifying!", "Maybe that wasn't a good idea.",}

return Prefab("flute_spirit", fn, assets)
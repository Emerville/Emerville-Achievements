local Dining = Class(function(self, inst) 
	self.inst = inst end, nil, { })
	
function Dining:GetFood() 
	if self.inst.foodname then 
	local food = SpawnPrefab(self.inst.foodname) 
			self.inst.foodnum = self.inst.foodnum - 1 
			if self.inst.foodnum == 0 then
				self.inst.foodname = nil 
				self.inst.AnimState:HideSymbol("swap_flower") 
			end 
				food.components.edible.healthvalue = food.components.edible.healthvalue*TUNING.DINING_BUFF 
				food.components.edible.hungervalue = food.components.edible.hungervalue*TUNING.DINING_BUFF 
				food.components.edible.sanityvalue = food.components.edible.sanityvalue*TUNING.DINING_BUFF
		
	return food 
end 
	return nil 
end

function Dining:DropFood() 
	if self.inst.foodname then
	local food = SpawnPrefab(self.inst.foodname) 
		if food.components.stackable then  
		local maxsize = food.components.stackable.maxsize while self.inst.foodnum > maxsize do  
		local addition = SpawnPrefab(self.inst.foodname)  
				addition.components.stackable.stacksize = maxsize  
				addition.Transform:SetPosition(self.inst.Transform:GetWorldPosition())  
				self.inst.foodnum = self.inst.foodnum - maxsize  
				end  
				food.components.stackable.stacksize = self.inst.foodnum 
			end 
			food.Transform:SetPosition(self.inst.Transform:GetWorldPosition()) 
		end 
	self.inst.foodname = nil 
	self.inst.foodnum = 0 self.inst.AnimState:HideSymbol("swap_flower")
end 

return Dining
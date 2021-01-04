local function arrayToString(arr)
	local s = ""
	local sortedNames = {}
	for k, v in pairs(arr) do
		table.insert(sortedNames, STRINGS.NAMES[string.upper(v)])
	end
	table.sort(sortedNames)
	for k, v in pairs(sortedNames) do
		s = s .. v .. ", "
	end
	s = s:sub(1,-3)
	return s
end

--Food
function currenteatamount(self,eatamount) self.inst.currenteatamount:set(eatamount) end
function currenteatrata(self,eatrata) self.inst.currenteatrata:set(eatrata) end
function currenteatfish(self,eatfish) self.inst.currenteatfish:set(eatfish) end
function currenteatturkey(self,eatturkey) self.inst.currenteatturkey:set(eatturkey) end
function currenteathotamount(self,eathotamount) self.inst.currenteathotamount:set(eathotamount) end
function currenteatcoldamount(self,eatcoldamount) self.inst.currenteatcoldamount:set(eatcoldamount) end
function currenteatmonsterlasagna(self,eatmonsterlasagna) self.inst.currenteatmonsterlasagna:set(eatmonsterlasagna) end
function currenteatmole(self,eatmole) self.inst.currenteatmole:set(eatmole) end
function currenteatwaffle(self,eatwaffle) self.inst.currenteatwaffle:set(eatwaffle) end
function currenteatall(self,eatall) self.inst.currenteatall:set(eatall) end
function currenteatlist(self,eatlist) self.inst.currenteatlist:set(arrayToString(eatlist)) end
--Life
function currentdeathamouth(self,deathamouth) self.inst.currentdeathamouth:set(deathamouth) end
function currentrespawnamount(self,respawnamount) self.inst.currentrespawnamount:set(respawnamount) end
function currentsleeptent(self,sleeptent) self.inst.currentsleeptent:set(sleeptent) end
function currentsleepsiesta(self,sleepsiesta) self.inst.currentsleepsiesta:set(sleepsiesta) end
function currentreviveamulet(self,reviveamulet) self.inst.currentreviveamulet:set(reviveamulet) end
function currentfeedplayer(self,feedplayer) self.inst.currentfeedplayer:set(feedplayer) end
--Work
function currentnatureamount(self,natureamount) self.inst.currentnatureamount:set(natureamount) end
function currentfishamount(self,fishamount) self.inst.currentfishamount:set(fishamount) end
function currentpickamount(self,pickamount) self.inst.currentpickamount:set(pickamount) end
function currentchopamount(self,chopamount) self.inst.currentchopamount:set(chopamount) end
function currentmineamount(self,mineamount) self.inst.currentmineamount:set(mineamount) end
function currentcookamount(self,cookamount) self.inst.currentcookamount:set(cookamount) end
function currentbuildamount(self,buildamount) self.inst.currentbuildamount:set(buildamount) end
--Like
function currentfriendpig(self,friendpig) self.inst.currentfriendpig:set(friendpig) end
function currentfriendbunny(self,friendbunny) self.inst.currentfriendbunny:set(friendbunny) end
function currentfriendcat(self,friendcat) self.inst.currentfriendcat:set(friendcat) end
function currentfriendspider(self,friendspider) self.inst.currentfriendspider:set(friendspider) end
function currentevilamount(self,evilamount) self.inst.currentevilamount:set(evilamount) end
function currentfuzzyamount(self,fuzzyamount) self.inst.currentfuzzyamount:set(fuzzyamount) end
--Pain
function currentstarvetime(self,starvetime) self.inst.currentstarvetime:set(starvetime) end
function currentnosanitytime(self,nosanitytime) self.inst.currentnosanitytime:set(nosanitytime) end
function currenticetime(self,icetime) self.inst.currenticetime:set(icetime) end
function currentfiretime(self,firetime) self.inst.currentfiretime:set(firetime) end
function currentmoisttime(self,moisttime) self.inst.currentmoisttime:set(moisttime) end
function currentevilflower(self,evilflower) self.inst.currentevilflower:set(evilflower) end
function currentroses(self,roses) self.inst.currentroses:set(roses) end
--Fight
function currentonhitdamage(self,onhitdamage) self.inst.currentonhitdamage:set(onhitdamage) end
function currentattackeddamage(self,attackeddamage) self.inst.currentattackeddamage:set(attackeddamage) end
function currentdmgnodmg(self,dmgnodmg) self.inst.currentdmgnodmg:set(dmgnodmg) end
function currentwhipit(self,whipit) self.inst.currentwhipit:set(whipit) end
function currentwhack(self,whack) self.inst.currentwhack:set(whack) end
function currentbullseye(self,bullseye) self.inst.currentbullseye:set(bullseye) end
function currenttentacruelamount(self,tentacruelamount) self.inst.currenttentacruelamount:set(tentacruelamount) end
--Hunt
function currentgoatperdamount(self,goatperdamount) self.inst.currentgoatperdamount:set(goatperdamount) end
function currentmosslingamount(self,mosslingamount) self.inst.currentmosslingamount:set(mosslingamount) end
function currentweetuskamount(self,weetuskamount) self.inst.currentweetuskamount:set(weetuskamount) end
function currenttentacoolamount(self,tentacoolamount) self.inst.currenttentacoolamount:set(tentacoolamount) end
function currenttreeguard(self,treeguard) self.inst.currenttreeguard:set(treeguard) end
function currentvarg(self,varg) self.inst.currentvarg:set(varg) end
function currentkoalefant(self,koalefant) self.inst.currentkoalefant:set(koalefant) end
function currentmonkey(self,monkey) self.inst.currentmonkey:set(monkey) end
function currenthorrorhound(self,horrorhound) self.inst.currenthorrorhound:set(horrorhound) end
function currentslurtle(self,slurtle) self.inst.currentslurtle:set(slurtle) end
function currentwerepig(self,werepig) self.inst.currentwerepig:set(werepig) end
--Misc
function currentstarspent(self,starspent) self.inst.currentstarspent:set(starspent) end
function currenttradeamount(self,tradeamount) self.inst.currenttradeamount:set(tradeamount) end
function currentdanceamount(self,danceamount) self.inst.currentdanceamount:set(danceamount) end
function currentteleportamount(self,teleportamount) self.inst.currentteleportamount:set(teleportamount) end
function currentbirchnut(self,birchnut) self.inst.currentbirchnut:set(birchnut) end
--Emer
function currenteatgold(self,eatgold) self.inst.currenteatgold:set(eatgold) end
function currenteatefc(self,eatefc) self.inst.currenteatefc:set(eatefc) end
function currenteathorn(self,eathorn) self.inst.currenteathorn:set(eathorn) end
function currenteateye(self,eateye) self.inst.currenteateye:set(eateye) end
function currentemeralds(self,emeralds) self.inst.currentemeralds:set(emeralds) end
function currentgoldcoin(self,goldcoin) self.inst.currentgoldcoin:set(goldcoin) end
function currentbaronsuit(self,baronsuit) self.inst.currentbaronsuit:set(baronsuit) end
--[[function currentcitrins(self,citrins) self.inst.currentcitrins:set(citrins) end
function currentambers(self,ambers) self.inst.currentambers:set(ambers) end
function currentsaddles(self,saddles) self.inst.currentsaddles:set(saddles) end
function currentbananas(self,bananas) self.inst.currentbananas:set(bananas) end
function currentmoonrocks(self,moonrocks) self.inst.currentmoonrocks:set(moonrocks) end
function currentgnomes(self,gnomes) self.inst.currentgnomes:set(gnomes) end]]
--Mile
function currentruncount(self,runcount) self.inst.currentruncount:set(runcount) end
function currentwalktime(self,walktime) self.inst.currentwalktime:set(walktime) end
function currentstoptime(self,stoptime) self.inst.currentstoptime:set(stoptime) end
function currentage(self,age) self.inst.currentage:set(age) end
function currentcavetime(self,cavetime) self.inst.currentcavetime:set(cavetime) end
function currentrider(self,rider) self.inst.currentrider:set(rider) end
function currentfullsanity(self,fullsanity) self.inst.currentfullsanity:set(fullsanity) end
function currentfullhunger(self,fullhunger) self.inst.currentfullhunger:set(fullhunger) end
function currentpacifist(self,pacifist) self.inst.currentpacifist:set(pacifist) end

---------------------------------------------------------------------------------------

--Food
function checkfirsteat(self,firsteat) local c = 0 if firsteat then c=1 end self.inst.checkfirsteat:set(c) end
function checkeatrata(self,eatrata) local c = 0 if eatrata then c=1 end self.inst.checkeatrata:set(c) end
function checkeatfish(self,eatfish) local c = 0 if eatfish then c=1 end self.inst.checkeatfish:set(c) end
function checkeatturkey(self,eatturkey) local c = 0 if eatturkey then c=1 end self.inst.checkeatturkey:set(c) end
function checkeathot(self,eathot) local c = 0 if eathot then c=1 end self.inst.checkeathot:set(c) end
function checkeatcold(self,eatcold) local c = 0 if eatcold then c=1 end self.inst.checkeatcold:set(c) end
function checkdanding(self,danding) local c = 0 if danding then c=1 end self.inst.checkdanding:set(c) end
function checkeatmole(self,eatmole) local c = 0 if eatmole then c=1 end self.inst.checkeatmole:set(c) end
function checkeatwaffle(self,eatwaffle) local c = 0 if eatwaffle then c=1 end self.inst.checkeatwaffle:set(c) end
function checksupereat(self,supereat) local c = 0 if supereat then c=1 end self.inst.checksupereat:set(c) end
function checkalldiet(self,alldiet) local c = 0 if alldiet then c=1 end self.inst.checkalldiet:set(c) end
--Life
function checknoob(self,noob) local c = 0 if noob then c=1 end self.inst.checknoob:set(c) end
function checktooyoung(self,tooyoung) local c = 0 if tooyoung then c=1 end self.inst.checktooyoung:set(c) end
function checkrose(self,rose) local c = 0 if rose then c=1 end self.inst.checkrose:set(c) end
function checkshroom(self,shroom) local c = 0 if shroom then c=1 end self.inst.checkshroom:set(c) end
function checkrot(self,rot) local c = 0 if rot then c=1 end self.inst.checkrot:set(c) end
function checkdeathalot(self,deathalot) local c = 0 if deathalot then c=1 end self.inst.checkdeathalot:set(c) end
function checksecondchance(self,secondchance) local c = 0 if secondchance then c=1 end self.inst.checksecondchance:set(c) end
function checkmessiah(self,messiah) local c = 0 if messiah then c=1 end self.inst.checkmessiah:set(c) end
function checksleeptent(self,sleeptent) local c = 0 if sleeptent then c=1 end self.inst.checksleeptent:set(c) end
function checksleepsiesta(self,sleepsiesta) local c = 0 if sleepsiesta then c=1 end self.inst.checksleepsiesta:set(c) end
function checkreviveamulet(self,reviveamulet) local c = 0 if reviveamulet then c=1 end self.inst.checkreviveamulet:set(c) end
function checkfeedplayer(self,feedplayer) local c = 0 if feedplayer then c=1 end self.inst.checkfeedplayer:set(c) end
--Work
function checknature(self,nature) local c = 0 if nature then c=1 end self.inst.checknature:set(c) end
function checkfishmaster(self,fishmaster) local c = 0 if fishmaster then c=1 end self.inst.checkfishmaster:set(c) end
function checkpickappren(self,pickappren) local c = 0 if pickappren then c=1 end self.inst.checkpickappren:set(c) end
function checkpickmaster(self,pickmaster) local c = 0 if pickmaster then c=1 end self.inst.checkpickmaster:set(c) end
function checkchopappren(self,chopappren) local c = 0 if chopappren then c=1 end self.inst.checkchopappren:set(c) end
function checkchopmaster(self,chopmaster) local c = 0 if chopmaster then c=1 end self.inst.checkchopmaster:set(c) end
function checkmineappren(self,mineappren) local c = 0 if mineappren then c=1 end self.inst.checkmineappren:set(c) end
function checkminemaster(self,minemaster) local c = 0 if minemaster then c=1 end self.inst.checkminemaster:set(c) end
function checkcookappren(self,cookappren) local c = 0 if cookappren then c=1 end self.inst.checkcookappren:set(c) end
function checkcookmaster(self,cookmaster) local c = 0 if cookmaster then c=1 end self.inst.checkcookmaster:set(c) end
function checkbuildappren(self,buildappren) local c = 0 if buildappren then c=1 end self.inst.checkbuildappren:set(c) end
function checkbuildmaster(self,buildmaster) local c = 0 if buildmaster then c=1 end self.inst.checkbuildmaster:set(c) end
--Life
function checkgoodman(self,goodman) local c = 0 if goodman then c=1 end self.inst.checkgoodman:set(c) end
function checkbrother(self,brother) local c = 0 if brother then c=1 end self.inst.checkbrother:set(c) end
function checkcatperson(self,catperson) local c = 0 if catperson then c=1 end self.inst.checkcatperson:set(c) end
function checkspooder(self,spooder) local c = 0 if spooder then c=1 end self.inst.checkspooder:set(c) end
function checkevil(self,evil) local c = 0 if evil then c=1 end self.inst.checkevil:set(c) end
function checkbirdclop(self,birdclop) local c = 0 if birdclop then c=1 end self.inst.checkbirdclop:set(c) end
function checkpet(self,pet) local c = 0 if pet then c=1 end self.inst.checkpet:set(c) end
function checklavae(self,lavae) local c = 0 if lavae then c=1 end self.inst.checklavae:set(c) end
function checkfuzzy(self,fuzzy) local c = 0 if fuzzy then c=1 end self.inst.checkfuzzy:set(c) end
--Pain
function checkburn(self,burn) local c = 0 if burn then c=1 end self.inst.checkburn:set(c) end
function checkfreeze(self,freeze) local c = 0 if freeze then c=1 end self.inst.checkfreeze:set(c) end
function checksleep(self,sleep) local c = 0 if sleep then c=1 end self.inst.checksleep:set(c) end
function checkstarve(self,starve) local c = 0 if starve then c=1 end self.inst.checkstarve:set(c) end
function checknosanity(self,nosanity) local c = 0 if nosanity then c=1 end self.inst.checknosanity:set(c) end
function checkicebody(self,icebody) local c = 0 if icebody then c=1 end self.inst.checkicebody:set(c) end
function checkfirebody(self,firebody) local c = 0 if firebody then c=1 end self.inst.checkfirebody:set(c) end
function checkmoistbody(self,moistbody) local c = 0 if moistbody then c=1 end self.inst.checkmoistbody:set(c) end
function checkevilflower(self,evilflower) local c = 0 if evilflower then c=1 end self.inst.checkevilflower:set(c) end
function checkroses(self,roses) local c = 0 if roses then c=1 end self.inst.checkroses:set(c) end
function checkdrown(self,drown) local c = 0 if drown then c=1 end self.inst.checkdrown:set(c) end
function checklightning(self,lightning) local c = 0 if lightning then c=1 end self.inst.checklightning:set(c) end
--Fight
function checkangry(self,angry) local c = 0 if angry then c=1 end self.inst.checkangry:set(c) end
function checktank(self,tank) local c = 0 if tank then c=1 end self.inst.checktank:set(c) end
function checkfortress(self,fortress) local c = 0 if fortress then c=1 end self.inst.checkfortress:set(c) end
function checkdmgnodmg(self,dmgnodmg) local c = 0 if dmgnodmg then c=1 end self.inst.checkdmgnodmg:set(c) end
function checkwhipit(self,whipit) local c = 0 if whipit then c=1 end self.inst.checkwhipit:set(c) end
function checkwhack(self,whack) local c = 0 if whack then c=1 end self.inst.checkwhack:set(c) end
function checkbullseye(self,bullseye) local c = 0 if bullseye then c=1 end self.inst.checkbullseye:set(c) end
function checksheep(self,sheep) local c = 0 if sheep then c=1 end self.inst.checksheep:set(c) end
function checktentacruel(self,tentacruel) local c = 0 if tentacruel then c=1 end self.inst.checktentacruel:set(c) end
--Hunt
function checkgoatperd(self,goatperd) local c = 0 if goatperd then c=1 end self.inst.checkgoatperd:set(c) end
function checkmossling(self,mossling) local c = 0 if mossling then c=1 end self.inst.checkmossling:set(c) end
function checkweetusk(self,weetusk) local c = 0 if weetusk then c=1 end self.inst.checkweetusk:set(c) end
function checktentacool(self,tentacool) local c = 0 if tentacool then c=1 end self.inst.checktentacool:set(c) end
function checktreeguard(self,treeguard) local c = 0 if treeguard then c=1 end self.inst.checktreeguard:set(c) end
function checkvarg(self,varg) local c = 0 if varg then c=1 end self.inst.checkvarg:set(c) end
function checkkoalefant(self,koalefant) local c = 0 if koalefant then c=1 end self.inst.checkkoalefant:set(c) end
function checkmonkey(self,monkey) local c = 0 if monkey then c=1 end self.inst.checkmonkey:set(c) end
function checkhorrorhound(self,horrorhound) local c = 0 if horrorhound then c=1 end self.inst.checkhorrorhound:set(c) end
function checkslurtle(self,slurtle) local c = 0 if slurtle then c=1 end self.inst.checkslurtle:set(c) end
function checkwerepig(self,werepig) local c = 0 if werepig then c=1 end self.inst.checkwerepig:set(c) end
--Boss
function checksanta(self,santa) local c = 0 if santa then c=1 end self.inst.checksanta:set(c) end
function checkdragonfly(self,dragonfly) local c = 0 if dragonfly then c=1 end self.inst.checkdragonfly:set(c) end
function checkmalbatross(self,malbatross) local c = 0 if malbatross then c=1 end self.inst.checkmalbatross:set(c) end
function checkknight(self,knight) local c = 0 if knight then c=1 end self.inst.checkknight:set(c) end
function checkbishop(self,bishop) local c = 0 if bishop then c=1 end self.inst.checkbishop:set(c) end
function checkrook(self,rook) local c = 0 if rook then c=1 end self.inst.checkrook:set(c) end
function checkminotaur(self,minotaur) local c = 0 if minotaur then c=1 end self.inst.checkminotaur:set(c) end
function checkancient(self,ancient) local c = 0 if ancient then c=1 end self.inst.checkancient:set(c) end
function checkrigid(self,rigid) local c = 0 if rigid then c=1 end self.inst.checkrigid:set(c) end
function checkqueen(self,queen) local c = 0 if queen then c=1 end self.inst.checkqueen:set(c) end
function checkcrabking(self,crabking) local c = 0 if crabking then c=1 end self.inst.checkcrabking:set(c) end
function checkking(self,king) local c = 0 if king then c=1 end self.inst.checkking:set(c) end
function checkbosswinter(self,bosswinter) local c = 0 if bosswinter then c=1 end self.inst.checkbosswinter:set(c) end
function checkbossspring(self,bossspring) local c = 0 if bossspring then c=1 end self.inst.checkbossspring:set(c) end
function checkbossantlion(self,bossantlion) local c = 0 if bossantlion then c=1 end self.inst.checkbossantlion:set(c) end
function checkbossautumn(self,bossautumn) local c = 0 if bossautumn then c=1 end self.inst.checkbossautumn:set(c) end
--Misc
function checkintogame(self,intogame) local c = 0 if intogame then c=1 end self.inst.checkintogame:set(c) end
function checksuperstar(self,superstar) local c = 0 if superstar then c=1 end self.inst.checksuperstar:set(c) end
function checktrader(self,trader) local c = 0 if trader then c=1 end self.inst.checktrader:set(c) end
function checkknowledge(self,knowledge) local c = 0 if knowledge then c=1 end self.inst.checkknowledge:set(c) end
function checkdance(self,dance) local c = 0 if dance then c=1 end self.inst.checkdance:set(c) end
function checkteleport(self,teleport) local c = 0 if teleport then c=1 end self.inst.checkteleport:set(c) end
function checkbirchnut(self,birchnut) local c = 0 if birchnut then c=1 end self.inst.checkbirchnut:set(c) end
--Emer
function checkeatgold(self,eatgold) local c = 0 if eatgold then c=1 end self.inst.checkeatgold:set(c) end
function checkeatefc(self,eatefc) local c = 0 if eatefc then c=1 end self.inst.checkeatefc:set(c) end
function checkeathorn(self,eathorn) local c = 0 if eathorn then c=1 end self.inst.checkeathorn:set(c) end
function checkeateye(self,eateye) local c = 0 if eateye then c=1 end self.inst.checkeateye:set(c) end
function checkemerald(self,emerald) local c = 0 if emerald then c=1 end self.inst.checkemerald:set(c) end
function checkgoldcoin(self,goldcoin) local c = 0 if goldcoin then c=1 end self.inst.checkgoldcoin:set(c) end
function checkbaronsuit(self,baronsuit) local c = 0 if baronsuit then c=1 end self.inst.checkbaronsuit:set(c) end
--[[function checkluck(self,luck) local c = 0 if luck then c=1 end self.inst.checkluck:set(c) end
function checkcitrin(self,citrin) local c = 0 if citrin then c=1 end self.inst.checkcitrin:set(c) end
function checkamber(self,amber) local c = 0 if amber then c=1 end self.inst.checkamber:set(c) end
function checksaddle(self,saddle) local c = 0 if saddle then c=1 end self.inst.checksaddle:set(c) end
function checkbanana(self,banana) local c = 0 if banana then c=1 end self.inst.checkbanana:set(c) end
function checkmoonrock(self,moonrock) local c = 0 if moonrock then c=1 end self.inst.checkmoonrock:set(c) end
function checkgnome(self,gnome) local c = 0 if gnome then c=1 end self.inst.checkgnome:set(c) end]]
--Mile
function checkall(self,all) local c = 0 if all then c=1 end self.inst.checkall:set(c) end
function checklongage(self,longage) local c = 0 if longage then c=1 end self.inst.checklongage:set(c) end
function checkoldage(self,oldage) local c = 0 if oldage then c=1 end self.inst.checkoldage:set(c) end
function checkwalkalot(self,walkalot) local c = 0 if walkalot then c=1 end self.inst.checkwalkalot:set(c) end
function checkstopalot(self,stopalot) local c = 0 if stopalot then c=1 end self.inst.checkstopalot:set(c) end
function checkcaveage(self,caveage) local c = 0 if caveage then c=1 end self.inst.checkcaveage:set(c) end
function checkrider(self,rider) local c = 0 if rider then c=1 end self.inst.checkrider:set(c) end
function checkfullsanity(self,fullsanity) local c = 0 if fullsanity then c=1 end self.inst.checkfullsanity:set(c) end
function checkfullhunger(self,fullhunger) local c = 0 if fullhunger then c=1 end self.inst.checkfullhunger:set(c) end
function checkpacifist(self,pacifist) local c = 0 if pacifist then c=1 end self.inst.checkpacifist:set(c) end
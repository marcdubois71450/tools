local select = 1;
gamestart = false
boomvalue = 255
lose = false
loset = false
wind = true
hit = false
blackscreen = 255
blackscreenstart = true
tubevalue = 0
points = 0
pointsa = 0
pointsb = 0
pointsc = 0
savegame = false
score = 0
scorea = 0
scoreb = 0
scorec = 0
dofile("multibird.cfg")
dofile("bkg.cfg")
pointcount = false

pause = false

place = 0
scoreup = 580
ad = math.random(1,3)

dofile("scoresave.cfg")
dofile("scoreasave.cfg")
dofile("scorebsave.cfg")
dofile("scorecsave.cfg")

tubespeedzero = 480
tubespeedone = 480
tubespeedtwo = 480
tubespeedthree = 480
tubespeedfour = 480
tubespeedfive = 480
tubespeedsix = 480
tubespeedseven = 480
tubespeedeigth = 480
tubespeednine = 480
tubespeedten = 480
tubespeedeleven = 480

tubetypezero = false
tubetypeone = false
tubetypetwo = false
tubetypethree = false
tubetypefour = false
tubetypefive = false
tubetypesix = false
tubetypeseven = false
tubetypeeigth = false
tubetypenine = false
tubetypeten = false
tubetypeeleven = false

speed = 0

endjump = 0
birdtimer = 1
birdjump = 0
birdtimerb = 1
birdjumpb = 0
push = 1
r = 0
levelspeed = 0
x = 3.3
y = 40
ya = 40
xa = 3.3
xb = 3.3
yb = 30
yyb = 100

endjumpt = 0
birdtimert = 1
birdjumpt = 0
birdtimerbt = 1
birdjumpbt = 0
rt = 0
xt = 3.3
yt = 40
yat = 40
xat = 3.3
xbt = 3.3
ybt = 30
yybt = 110
while pge.running() do
 pge.controls.update()
 pge.gfx.startdrawing()
 pge.gfx.clearscreen()
 pge.controls.update()


if background == 0 then
	background = math.random(1,4)
end

if background == 1 then
	bg:activate();
	bg:draweasy(0,0,0,255)
end
if background == 2 then
	bg1:activate();
	bg1:draweasy(0,0,0,255)
end
if background == 3 then
	bg2:activate();
	bg2:draweasy(0,0,0,255)
end
if background == 4 then
	bg3:activate();
	bg3:draweasy(0,0,0,255)
end

speed = speed - 2

if tubevalue == 0 and gamestart == true then
	tubetypezero = true
end
if tubetypezero == true and gamestart == true then
	tubespeedzero = tubespeedzero - 2
end
if tubetypezero == true then
	tubes:activate();
	tubes:draweasy(tubespeedzero,0,0,255)
end
if tubespeedzero <= -52 then
	tubetypezero = false
	tubespeedzero = 480
end
if tubespeedzero == 300 then
	tubevalue = math.random(4,7)
end
if tubespeedzero == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedzero = tubespeedzero + 0.00000000000000000001
end
if tubespeedzero <= 250 and tubespeedzero >= 176 and yyb < 122 or tubespeedzero <= 250 and tubespeedzero >= 176 and yyb > 176 then
	gamestart = false
	lose = true 
end
if tubespeedzero <= 210 and tubespeedzero >= 136 and yybt < 122 or tubespeedzero <= 210 and tubespeedzero >= 136 and yybt > 176 then
	gamestart = false
	loset = true 
end


if tubevalue == 1 and gamestart == true  then
	tubetypeone = true
end
if tubetypeone == true and gamestart == true then
	tubespeedone = tubespeedone - 2
end
if tubetypeone == true then
	tubes:activate();
	tubes:draweasy(tubespeedone,-25,0,255)
end
if tubespeedone <= -52 then
	tubetypeone = false
	tubespeedone = 480
end
if tubespeedone == 300 then
	tubevalue = math.random(4,7)
end
if tubespeedone == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedone = tubespeedone + 0.00000000000000000001
end
if tubespeedone <= 250 and tubespeedone >= 176 and yyb < 97 or tubespeedone <= 250 and tubespeedone >= 176 and yyb > 150 then
	gamestart = false
	lose = true 
end
if tubespeedone <= 210 and tubespeedone >= 136 and yybt < 97 or tubespeedone <= 210 and tubespeedone >= 136 and yybt > 150 then
	gamestart = false
	loset = true 
end


if tubevalue == 2 and gamestart == true  then
	tubetypetwo = true
end
if tubetypetwo == true and gamestart == true then
	tubespeedtwo = tubespeedtwo - 2
end
if tubetypetwo == true then
	tubes:activate();
	tubes:draweasy(tubespeedtwo,-50,0,255)
end
if tubespeedtwo <= -52 then
	tubetypetwo = false
	tubespeedtwo = 480
end
if tubespeedtwo == 300 then
	tubevalue = math.random(4,7)
end
if tubespeedtwo == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedtwo = tubespeedtwo + 0.00000000000000000001
end
if tubespeedtwo <= 250 and tubespeedtwo >= 176 and yyb < 72 or tubespeedtwo <= 250 and tubespeedtwo >= 176 and yyb > 125 then
	gamestart = false
	lose = true 
end
if tubespeedtwo <= 210 and tubespeedtwo >= 136 and yybt < 72 or tubespeedtwo <= 210 and tubespeedtwo >= 136 and yybt > 125 then
	gamestart = false
	loset = true 
end


if tubevalue == 3 and gamestart == true  then
	tubetypethree = true
end
if tubetypethree == true and gamestart == true then
	tubespeedthree = tubespeedthree - 2
end
if tubetypethree == true then
	tubes:activate();
	tubes:draweasy(tubespeedthree,-75,0,255)
end
if tubespeedthree <= -52 then
	tubetypethree = false
	tubespeedthree = 480
end
if tubespeedthree == 300 then
	tubevalue = math.random(4,7)
end
if tubespeedthree == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedthree = tubespeedthree + 0.00000000000000000001
end
if tubespeedthree <= 250 and tubespeedthree >= 176 and yyb < 47 or tubespeedthree <= 250 and tubespeedthree >= 176 and yyb > 100 then
	gamestart = false
	lose = true 
end
if tubespeedthree <= 210 and tubespeedthree >= 136 and yybt < 47 or tubespeedthree <= 210 and tubespeedthree >= 136 and yybt > 100 then
	gamestart = false
	loset = true 
end


if tubevalue == 4 and gamestart == true  then
	tubetypefour = true
end
if tubetypefour == true and gamestart == true then
	tubespeedfour = tubespeedfour - 2
end
if tubetypefour == true then
	tubes:activate();
	tubes:draweasy(tubespeedfour,0,0,255)
end
if tubespeedfour <= -52 then
	tubetypefour = false
	tubespeedfour = 480
end
if tubespeedfour == 300 then
	tubevalue = math.random(8,11)
end
if tubespeedfour == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedfour = tubespeedfour + 0.00000000000000000001
end
if tubespeedfour <= 250 and tubespeedfour >= 176 and yyb < 122 or tubespeedfour <= 250 and tubespeedfour >= 176 and yyb > 176 then
	gamestart = false
	lose = true 
end
if tubespeedfour <= 210 and tubespeedfour >= 136 and yybt < 122 or tubespeedfour <= 210 and tubespeedfour >= 136 and yybt > 176 then
	gamestart = false
	loset = true 
end


if tubevalue == 5 and gamestart == true  then
	tubetypefive = true
end
if tubetypefive == true and gamestart == true then
	tubespeedfive = tubespeedfive - 2
end
if tubetypefive == true then
	tubes:activate();
	tubes:draweasy(tubespeedfive,-25,0,255)
end
if tubespeedfive <= -52 then
	tubetypefive = false
	tubespeedfive = 480
end
if tubespeedfive == 300 then
	tubevalue = math.random(8,11)
end
if tubespeedfive == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedfive = tubespeedfive + 0.00000000000000000001
end
if tubespeedfive <= 250 and tubespeedfive >= 176 and yyb < 97 or tubespeedfive <= 250 and tubespeedfive >= 176 and yyb > 150 then
	gamestart = false
	lose = true 
end
if tubespeedfive <= 210 and tubespeedfive >= 136 and yybt < 97 or tubespeedfive <= 210 and tubespeedfive >= 136 and yybt > 150 then
	gamestart = false
	loset = true 
end


if tubevalue == 6 and gamestart == true  then
	tubetypesix = true
end
if tubetypesix == true and gamestart == true then
	tubespeedsix = tubespeedsix - 2
end
if tubetypesix == true then
	tubes:activate();
	tubes:draweasy(tubespeedsix,-50,0,255)
end
if tubespeedsix <= -52 then
	tubetypesix = false
	tubespeedsix = 480
end
if tubespeedsix == 300 then
	tubevalue = math.random(8,11)
end
if tubespeedsix == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedsix = tubespeedsix + 0.00000000000000000001
end
if tubespeedsix <= 250 and tubespeedsix >= 176 and yyb < 72 or tubespeedsix <= 250 and tubespeedsix >= 176 and yyb > 125 then
	gamestart = false
	lose = true 
end
if tubespeedsix <= 210 and tubespeedsix >= 136 and yybt < 72 or tubespeedsix <= 210 and tubespeedsix >= 136 and yybt > 125 then
	gamestart = false
	loset = true 
end


if tubevalue == 7 and gamestart == true  then
	tubetypeseven = true
end
if tubetypeseven == true and gamestart == true then
	tubespeedseven = tubespeedseven - 2
end
if tubetypeseven == true then
	tubes:activate();
	tubes:draweasy(tubespeedseven,-75,0,255)
end
if tubespeedseven <= -52 then
	tubetypeseven = false
	tubespeedseven = 480
end
if tubespeedseven == 300 then
	tubevalue = math.random(8,11)
end
if tubespeedseven == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedseven = tubespeedseven + 0.00000000000000000001
end
if tubespeedseven <= 250 and tubespeedseven >= 176 and yyb < 47 or tubespeedseven <= 250 and tubespeedseven >= 176 and yyb > 100 then
	gamestart = false
	lose = true 
end
if tubespeedseven <= 210 and tubespeedseven >= 136 and yybt < 47 or tubespeedseven <= 210 and tubespeedseven >= 136 and yybt > 100 then
	gamestart = false
	loset = true 
end


if tubevalue == 8 and gamestart == true  then
	tubetypeeigth = true
end
if tubetypeeigth == true and gamestart == true then
	tubespeedeigth = tubespeedeigth - 2
end
if tubetypeeigth == true then
	tubes:activate();
	tubes:draweasy(tubespeedeigth,0,0,255)
end
if tubespeedeigth <= -52 then
	tubetypeeigth = false
	tubespeedeigth = 480
end
if tubespeedeigth == 300 then
	tubevalue = math.random(0,3)
end
if tubespeedeigth == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedeigth = tubespeedeigth + 0.00000000000000000001
end
if tubespeedeigth <= 250 and tubespeedeigth >= 176 and yyb < 122 or tubespeedeigth <= 250 and tubespeedeigth >= 176 and yyb > 176 then
	gamestart = false
	lose = true 
end
if tubespeedeigth <= 210 and tubespeedeigth >= 136 and yybt < 122 or tubespeedeigth <= 210 and tubespeedeigth >= 136 and yybt > 176 then
	gamestart = false
	loset = true 
end


if tubevalue == 9 and gamestart == true  then
	tubetypenine = true
end
if tubetypenine == true and gamestart == true then
	tubespeednine = tubespeednine - 2
end
if tubetypenine == true then
	tubes:activate();
	tubes:draweasy(tubespeednine,-25,0,255)
end
if tubespeednine <= -52 then
	tubetypenine = false
	tubespeednine = 480
end
if tubespeednine == 300 then
	tubevalue = math.random(0,3)
end
if tubespeednine == 174 then
	points = points + 1
	sfx_point:play()
	tubespeednine = tubespeednine + 0.00000000000000000001
end
if tubespeednine <= 250 and tubespeednine >= 176 and yyb < 97 or tubespeednine <= 250 and tubespeednine >= 176 and yyb > 150 then
	gamestart = false
	lose = true 
end
if tubespeednine <= 210 and tubespeednine >= 136 and yybt < 97 or tubespeednine <= 210 and tubespeednine >= 136 and yybt > 150 then
	gamestart = false
	loset = true 
end



if tubevalue == 10 and gamestart == true  then
	tubetypeten = true
end
if tubetypeten == true then
	tubes:activate();
	tubes:draweasy(tubespeedten,-50,0,255)
end
if tubetypeten == true and gamestart == true then
	tubespeedten = tubespeedten - 2
end
if tubespeedten <= -52 then
	tubetypeten = false
	tubespeedten = 480
end
if tubespeedten == 300 then
	tubevalue = math.random(0,3)
end
if tubespeedten == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedten = tubespeedten + 0.00000000000000000001
end
if tubespeedten <= 250 and tubespeedten >= 176 and yyb < 72 or tubespeedten <= 250 and tubespeedten >= 176 and yyb > 125 then
	gamestart = false
	lose = true 
end
if tubespeedten <= 210 and tubespeedten >= 136 and yybt < 72 or tubespeedten <= 210 and tubespeedten >= 136 and yybt > 125 then
	gamestart = false
	loset = true 
end


if tubevalue == 11 and gamestart == true  then
	tubetypeeleven = true
end
if tubetypeeleven == true and gamestart == true then
	tubespeedeleven = tubespeedeleven - 2
end
if tubetypeeleven == true then
	tubes:activate();
	tubes:draweasy(tubespeedeleven,-75,0,255)
end
if tubespeedeleven <= -52 then
	tubetypeeleven = false
	tubespeedeleven = 480
end
if tubespeedeleven == 300 then
	tubevalue = math.random(0,3)
end
if tubespeedeleven == 174 then
	points = points + 1
	sfx_point:play()
	tubespeedeleven = tubespeedeleven + 0.00000000000000000001
end
if tubespeedeleven <= 250 and tubespeedeleven >= 176 and yyb < 47 or tubespeedeleven <= 250 and tubespeedeleven >= 176 and yyb > 100 then
	gamestart = false
	lose = true 
end
if tubespeedeleven <= 210 and tubespeedeleven >= 136 and yybt < 47 or tubespeedeleven <= 210 and tubespeedeleven >= 136 and yybt > 100 then
	gamestart = false
	loset = true 
end
if background == 4 and tubetypezero == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedzero,0,0,255)
end
if background == 4 and tubetypeone == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedone,-25,0,255)
end
if background == 4 and tubetypetwo == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedtwo,-50,0,255)
end
if background == 4 and tubetypethree == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedthree,-75,0,255)
end
if background == 4 and tubetypefour == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedfour,0,0,255)
end
if background == 4 and tubetypefive == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedfive,-25,0,255)
end
if background == 4 and tubetypesix == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedsix,-50,0,255)
end
if background == 4 and tubetypeseven == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedseven,-75,0,255)
end
if background == 4 and tubetypeeigth == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedeigth,0,0,255)
end
if background == 4 and tubetypenine == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeednine,-25,0,255)
end
if background == 4 and tubetypeten == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedten,-50,0,255)
end
if background == 4 and tubetypeeleven == true  then
	cattubes:activate();
	cattubes:draweasy(tubespeedeleven,-75,0,255)
end






if multitype == 0 then
	multitype = math.random(1,4)
end
if multitype == 1 then
	if birdtimer >= 1 and birdtimer <= 2 then
		bird:activate();
		bird:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 2 and birdtimer <= 3 then
		birda:activate();
		birda:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 3 and birdtimer <= 4 then
		birdb:activate();
		birdb:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimert >= 1 and birdtimert <= 2 then
		bluea:activate();
		bluea:draweasy(180,0+yybt,0-rt,255)
	end
	if birdtimert >= 2 and birdtimert <= 3 then
		blueb:activate();
		blueb:draweasy(180,0+yybt,0-rt,255)
	end
	if birdtimert >= 3 and birdtimert <= 4 then
		bluec:activate();
		bluec:draweasy(180,0+yybt,0-rt,255)
	end
end
if multitype == 2 then
	if birdtimer >= 1 and birdtimer <= 2 then
		birdreda:activate();
		birdreda:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 2 and birdtimer <= 3 then
		birdredb:activate();
		birdredb:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 3 and birdtimer <= 4 then
		birdredc:activate();
		birdredc:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimert >= 1 and birdtimert <= 2 then
		gray:activate();
		gray:draweasy(180,0+yybt,0-rt,255)
	end
	if birdtimert >= 2 and birdtimert <= 3 then
		graya:activate();
		graya:draweasy(180,0+yybt,0-rt,255)
	end
	if birdtimert >= 3 and birdtimert <= 4 then
		grayb:activate();
		grayb:draweasy(180,0+yybt,0-rt,255)
	end

end
if multitype == 3 then
	if birdtimer >= 1 and birdtimer <= 2 then
		pink:activate();
		pink:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 2 and birdtimer <= 3 then
		pinka:activate();
		pinka:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 3 and birdtimer <= 4 then
		pinkb:activate();
		pinkb:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimert >= 1 and birdtimert <= 2 then
		green:activate();
		green:draweasy(180,0+yybt,0-rt,255)
	end
	if birdtimert >= 2 and birdtimert <= 3 then
		greena:activate();
		greena:draweasy(180,0+yybt,0-rt,255)
	end
	if birdtimert >= 3 and birdtimert <= 4 then
		greenb:activate();
		greenb:draweasy(180,0+yybt,0-rt,255)
	end

end
if multitype == 4 then
	if birdtimer >= 1 and birdtimer <= 2 then
		dark:activate();
		dark:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 2 and birdtimer <= 3 then
		darkb:activate();
		darkb:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 3 and birdtimer <= 4 then
		darkc:activate();
		darkc:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimert >= 1 and birdtimert <= 2 then
		bird:activate();
		bird:draweasy(180,0+yybt,0-rt,255)
	end
	if birdtimert >= 2 and birdtimert <= 3 then
		birda:activate();
		birda:draweasy(180,0+yybt,0-rt,255)
	end
	if birdtimert >= 3 and birdtimert <= 4 then
		birdb:activate();
		birdb:draweasy(180,0+yybt,0-rt,255)
	end

end



road:activate();
road:draweasy(levelspeed,242,0,255)
road:activate();
road:draweasy(levelspeed+480,242,0,255)
if background == 4 then
	catroad:activate();
	catroad:draweasy(levelspeed,242,0,255)
	catroad:activate();
	catroad:draweasy(levelspeed+480,242,0,255)
end

if birdtimer == 4 then
	birdtimer = 1
end
if birdtimert == 4 then
	birdtimert = 1
end
if levelspeed <= -480 then
	levelspeed = 0
end

if gamestart == false and lose == false and loset == false then
	r = 0
	rt = 0
	getreadym:activate();
	getreadym:draweasy(101,32,0,255)
end

if gamestart == true then
	y = y + 1.66
	yb = yb + 1.66
	ya = ya + 1.66
	yyb = yb + y + ya
	if r >= 0.3 then
		r = 0.3
	end
	if r <= -1 then
		r = -1
	end
	if birdjump == 0 then
		r = r - 0.10
	end
end

if gamestart == true then
	yt = yt + 1.66
	ybt = ybt + 1.66
	yat = yat + 1.66
	yybt = ybt + yt + yat
	if rt >= 0.3 then
		rt = 0.3
	end
	if rt <= -1 then
		rt = -1
	end
	if birdjumpt == 0 then
		rt = rt - 0.10
	end
end



if pge.controls.pressed(PGE_CTRL_SELECT) and lose == false and loset == false or pge.controls.pressed(PGE_CTRL_LTRIGGER) and lose == false and loset == false then
	pause = true
	sfx_pause:play()
	gamestart = false
end
if pge.controls.pressed(PGE_CTRL_RTRIGGER) then
	dofile("menu.lua")
end

if pge.controls.pressed(PGE_CTRL_CIRCLE) and lose == false and loset == false or pge.controls.pressed(PGE_CTRL_CROSS) and lose == false and loset == false or pge.controls.pressed(PGE_CTRL_SQUARE) and lose == false and loset == false or pge.controls.pressed(PGE_CTRL_TRIANGLE) and lose == false and loset == false then
	pause = false
	sfx_wing:play()
	gamestart = true
	birdjump = birdjump + 1
end
if birdjump == 1 then
	r = r + 0.2
	x = x - 0.10
	y = y - x^2
end
if x <= 0.89 and birdjump == 1 then
	birdjump = 0
	x = 3.3
end
if x <= 0.89 and birdjump == 2 then
	endjump = 1
	birdjump = 0
	x = 3.3
end
if x <= 0.89 and birdjump == 3 then
	endjump = 2
	birdjump = 0
	x = 3.3
end
if endjump == 1 then
	r = r + 0.2
	xb = xb - 0.10
	yb = yb - xb^2
end
if endjump == 2 then
	r = r + 0.2
	xb = xb - 0.10
	yb = yb - xb^2
	xa = xa - 0.10
	ya = ya - xa^2

end
if endjump == 3 then
	r = r + 0.2
	xa = xa - 0.10
	ya = ya - xa^2

end
if xa <= 0.89 and endjump == 3 then
	endjump = 0
	xa = 3.3
end
if xb <= 0.89 and endjump == 2 then
	endjump = 3
	xb = 3.3
end
if xb <= 0.89 and endjump == 1 then
	endjump = 0
	xb = 3.3
end
if birdjump == 2 then
	r = r + 0.2
	x = x - 0.10
	y = y - x^2
	xb = xb - 0.10
	yb = yb - xb^2
end
if birdjump == 3 then
	r = r + 0.2
	x = x - 0.10
	y = y - x^2
	xa = xa - 0.10
	ya = ya - xa^2
	xb = xb - 0.10
	yb = yb - xb^2
end
if birdjump == 4 then
	birdjump = 3
end
if yyb > 214 then
	gamestart = false
	lose = true 
	y = 70
	yb = 70
	ya = 70
end


if pge.controls.pressed(PGE_CTRL_DOWN) and lose == false and loset == false or pge.controls.pressed(PGE_CTRL_LEFT) and lose == false and loset == false then
	pause = false
	sfx_wing:play()
	gamestart = true
	birdjumpt = birdjumpt + 1
end
if birdjumpt == 1 then
	rt = rt + 0.2
	xt = xt - 0.10
	yt = yt - xt^2
end
if xt <= 0.89 and birdjumpt == 1 then
	birdjumpt = 0
	xt = 3.3
end
if xt <= 0.89 and birdjumpt == 2 then
	endjumpt = 1
	birdjumpt = 0
	xt = 3.3
end
if xt <= 0.89 and birdjumpt == 3 then
	endjumpt = 2
	birdjumpt = 0
	xt = 3.3
end
if endjumpt == 1 then
	rt = rt + 0.2
	xbt = xbt - 0.10
	ybt = ybt - xbt^2
end
if endjumpt == 2 then
	rt = rt + 0.2
	xbt = xbt - 0.10
	ybt = ybt - xbt^2
	xat = xat - 0.10
	yat = yat - xat^2

end
if endjumpt == 3 then
	rt = rt + 0.2
	xat = xat - 0.10
	yat = yat - xat^2

end
if xat <= 0.89 and endjumpt == 3 then
	endjumpt = 0
	xat = 3.3
end
if xbt <= 0.89 and endjumpt == 2 then
	endjumpt = 3
	xbt = 3.3
end
if xbt <= 0.89 and endjumpt == 1 then
	endjumpt = 0
	xbt = 3.3
end
if birdjumpt == 2 then
	rt = rt + 0.2
	xt = xt - 0.10
	yt = yt - xt^2
	xbt = xbt - 0.10
	ybt = ybt - xbt^2
end
if birdjumpt == 3 then
	rt = rt + 0.2
	xt = xt - 0.10
	yt = yt - xt^2
	xat = xat - 0.10
	yat = yat - xat^2
	xbt = xbt - 0.10
	ybt = ybt - xbt^2
end
if birdjumpt == 4 then
	birdjumpt = 3
end
if yybt > 214 then
	gamestart = false
	loset = true 
	yt = 70
	ybt = 70
	yat = 70
end



if wind == true then
	sfx_swooshing:play()
	wind = false
end


if lose == false and pause == false and loset == false then
	levelspeed = levelspeed - 2
	birdtimer = birdtimer + 0.25
	birdtimert = birdtimert + 0.25
end

if lose == true and loset == false then
	hit = true
	boomvalue = boomvalue - 20
	scoreup = scoreup - 10
	winii:activate();
	winii:draweasy(120,30+scoreup,0,255)
	boom:activate();
	boom:draweasy(0,0,0,boomvalue)
end

if loset == true and lose == false then
	hit = true
	boomvalue = boomvalue - 20
	scoreup = scoreup - 10
	wini:activate();
	wini:draweasy(120,30+scoreup,0,255)
	boom:activate();
	boom:draweasy(0,0,0,boomvalue)
end

if lose == true and loset == true then
	hit = true
	boomvalue = boomvalue - 20
	scoreup = scoreup - 10
	tie:activate();
	tie:draweasy(120,30+scoreup,0,255)
	boom:activate();
	boom:draweasy(0,0,0,boomvalue)
end


if scoreup <= 0 then
	scoreup = 0
end 

if scoreup == 380 then
	sfx_swooshing:play()
end


if boomvalue == 235 then
	sfx_hit:play()
end

if points == 10 then
	pointsa = pointsa + 1
	points = 0
end
if pointsa == 10 then
	pointsb = pointsb + 1
	pointsa = 0
end
if pointsb == 10 then
	pointsc = pointsc + 1
	pointsb = 0
end

if pointsc > scorec and lose == true or pointsc == scorec and pointsb > scoreb and lose == true or pointsc == scorec and pointsb == scoreb and pointsa > scorea and lose == true or pointsc == scorec and pointsb == scoreb and pointsa == scorea and points > score and lose == true then
	savegame = true
end


if points == 0 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 0")
	file_scoresave:close()
end
if points == 1 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 1")
	file_scoresave:close()
end
if points == 2 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 2")
	file_scoresave:close()
end
if points == 3 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 3")
	file_scoresave:close()
end
if points == 4 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 4")
	file_scoresave:close()
end
if points == 5 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 5")
	file_scoresave:close()
end
if points == 6 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 6")
	file_scoresave:close()
end
if points == 7 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 7")
	file_scoresave:close()
end
if points == 8 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 8")
	file_scoresave:close()
end
if points == 9 and lose == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 9")
	file_scoresave:close()
end

if pointsa == 0 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 0")
	file_scoreasave:close()
end
if pointsa == 1 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 1")
	file_scoreasave:close()
end
if pointsa == 2 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 2")
	file_scoreasave:close()
end
if pointsa == 3 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 3")
	file_scoreasave:close()
end
if pointsa == 4 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 4")
	file_scoreasave:close()
end
if pointsa == 5 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 5")
	file_scoreasave:close()
end
if pointsa == 6 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 6")
	file_scoreasave:close()
end
if pointsa == 7 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 7")
	file_scoreasave:close()
end
if pointsa == 8 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 8")
	file_scoreasave:close()
end
if pointsa == 9 and lose == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 9")
	file_scoreasave:close()
end

if pointsb == 0 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 0")
	file_scorebsave:close()
end
if pointsb == 1 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 1")
	file_scorebsave:close()
end
if pointsb == 2 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 2")
	file_scorebsave:close()
end
if pointsb == 3 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 3")
	file_scorebsave:close()
end
if pointsb == 4 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 4")
	file_scorebsave:close()
end
if pointsb == 5 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 5")
	file_scorebsave:close()
end
if pointsb == 6 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 6")
	file_scorebsave:close()
end
if pointsb == 7 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 7")
	file_scorebsave:close()
end
if pointsb == 8 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 8")
	file_scorebsave:close()
end
if pointsb == 9 and lose == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 9")
	file_scorebsave:close()
end

if pointsc == 0 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 0")
	file_scorecsave:close()
end
if pointsc == 1 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 1")
	file_scorecsave:close()
end
if pointsc == 2 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 2")
	file_scorecsave:close()
end
if pointsc == 3 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 3")
	file_scorecsave:close()
end
if pointsc == 4 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 4")
	file_scorecsave:close()
end
if pointsc == 5 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 5")
	file_scorecsave:close()
end
if pointsc == 6 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 6")
	file_scorecsave:close()
end
if pointsc == 7 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 7")
	file_scorecsave:close()
end
if pointsc == 8 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 8")
	file_scorecsave:close()
end
if pointsc == 9 and lose == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 9")
	file_scorecsave:close()
end



if points == 0 and lose == false and gamestart == true then
	zero:activate();
	zero:draweasy(228,20,0,255)
end
if pointsa == 0 and lose == false and gamestart == true and pointsb >= 1 then
	zero:activate();
	zero:draweasy(204,20,0,255)
end
if pointsb == 0 and lose == false and gamestart == true and pointsc >= 1 then
	zero:activate();
	zero:draweasy(180,20,0,255)
end
if points == 1 and lose == false and gamestart == true then
	one:activate();
	one:draweasy(228,20,0,255)
end
if pointsa == 1 and lose == false and gamestart == true then
	one:activate();
	one:draweasy(208,20,0,255)
end
if pointsb == 1 and lose == false and gamestart == true then
	one:activate();
	one:draweasy(188,20,0,255)
end
if pointsc == 1 and lose == false and gamestart == true then
	one:activate();
	one:draweasy(168,20,0,255)
end
if points == 2 and lose == false and gamestart == true then
	two:activate();
	two:draweasy(228,20,0,255)
end
if pointsa == 2 and lose == false and gamestart == true then
	two:activate();
	two:draweasy(204,20,0,255)
end
if pointsb == 2 and lose == false and gamestart == true then
	two:activate();
	two:draweasy(180,20,0,255)
end
if pointsc == 2 and lose == false and gamestart == true then
	two:activate();
	two:draweasy(156,20,0,255)
end
if points == 3 and lose == false and gamestart == true then
	three:activate();
	three:draweasy(228,20,0,255)
end
if pointsa == 3 and lose == false and gamestart == true then
	three:activate();
	three:draweasy(204,20,0,255)
end
if pointsb == 3 and lose == false and gamestart == true then
	three:activate();
	three:draweasy(180,20,0,255)
end
if pointsc == 3 and lose == false and gamestart == true then
	three:activate();
	three:draweasy(156,20,0,255)
end
if points == 4 and lose == false and gamestart == true then
	four:activate();
	four:draweasy(228,20,0,255)
end
if pointsa == 4 and lose == false and gamestart == true then
	four:activate();
	four:draweasy(204,20,0,255)
end
if pointsb == 4 and lose == false and gamestart == true then
	four:activate();
	four:draweasy(180,20,0,255)
end
if pointsc == 4 and lose == false and gamestart == true then
	four:activate();
	four:draweasy(156,20,0,255)
end
if points == 5 and lose == false and gamestart == true then
	five:activate();
	five:draweasy(228,20,0,255)
end
if pointsa == 5 and lose == false and gamestart == true then
	five:activate();
	five:draweasy(204,20,0,255)
end
if pointsb == 5 and lose == false and gamestart == true then
	five:activate();
	five:draweasy(180,20,0,255)
end
if pointsc == 5 and lose == false and gamestart == true then
	five:activate();
	five:draweasy(156,20,0,255)
end
if points == 6 and lose == false and gamestart == true then
	six:activate();
	six:draweasy(228,20,0,255)
end
if pointsa == 6 and lose == false and gamestart == true then
	six:activate();
	six:draweasy(204,20,0,255)
end
if pointsb == 6 and lose == false and gamestart == true then
	six:activate();
	six:draweasy(180,20,0,255)
end
if pointsc == 6 and lose == false and gamestart == true then
	six:activate();
	six:draweasy(156,20,0,255)
end
if points == 7 and lose == false and gamestart == true then
	seven:activate();
	seven:draweasy(228,20,0,255)
end
if pointsa == 7 and lose == false and gamestart == true then
	seven:activate();
	seven:draweasy(204,20,0,255)
end
if pointsb == 7 and lose == false and gamestart == true then
	seven:activate();
	seven:draweasy(180,20,0,255)
end
if pointsc == 7 and lose == false and gamestart == true then
	seven:activate();
	seven:draweasy(156,20,0,255)
end
if points == 8 and lose == false and gamestart == true then
	eight:activate();
	eight:draweasy(228,20,0,255)
end
if pointsa == 8 and lose == false and gamestart == true then
	eight:activate();
	eight:draweasy(204,20,0,255)
end
if pointsb == 8 and lose == false and gamestart == true then
	eight:activate();
	eight:draweasy(180,20,0,255)
end
if pointsc == 8 and lose == false and gamestart == true then
	eight:activate();
	eight:draweasy(156,20,0,255)
end
if points == 9 and lose == false and gamestart == true then
	nine:activate();
	nine:draweasy(228,20,0,255)
end
if pointsa == 9 and lose == false and gamestart == true then
	nine:activate();
	nine:draweasy(204,20,0,255)
end
if pointsb == 9 and lose == false and gamestart == true then
	nine:activate();
	nine:draweasy(180,20,0,255)
end
if pointsc == 9 and lose == false and gamestart == true then
	nine:activate();
	nine:draweasy(156,20,0,255)
end




if points == 0 and lose == true then
	zerosmall:activate();
	zerosmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 0 and lose == true and pointsb >= 1 then
	zerosmall:activate();
	zerosmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 0 and lose == true and pointsc >= 1 then
	zerosmall:activate();
	zerosmall:draweasy(222,95+scoreup,0,255)
end
if points == 1 and lose == true then
	onesmall:activate();
	onesmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 1 and lose == true then
	onesmall:activate();
	onesmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 1 and lose == true then
	onesmall:activate();
	onesmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 1 and lose == true then
	onesmall:activate();
	onesmall:draweasy(208,95+scoreup,0,255)
end
if points == 2 and lose == true then
	twosmall:activate();
	twosmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 2 and lose == true then
	twosmall:activate();
	twosmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 2 and lose == true then
	twosmall:activate();
	twosmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 2 and lose == true then
	twosmall:activate();
	twosmall:draweasy(208,95+scoreup,0,255)
end
if points == 3 and lose == true then
	threesmall:activate();
	threesmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 3 and lose == true then
	threesmall:activate();
	threesmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 3 and lose == true then
	threesmall:activate();
	threesmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 3 and lose == true then
	threesmall:activate();
	threesmall:draweasy(208,95+scoreup,0,255)
end
if points == 4 and lose == true then
	foursmall:activate();
	foursmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 4 and lose == true then
	foursmall:activate();
	foursmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 4 and lose == true then
	foursmall:activate();
	foursmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 4 and lose == true then
	foursmall:activate();
	foursmall:draweasy(208,95+scoreup,0,255)
end
if points == 5 and lose == true then
	fivesmall:activate();
	fivesmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 5 and lose == true then
	fivesmall:activate();
	fivesmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 5 and lose == true then
	fivesmall:activate();
	fivesmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 5 and lose == true then
	fivesmall:activate();
	fivesmall:draweasy(208,95+scoreup,0,255)
end
if points == 6 and lose == true then
	sixsmall:activate();
	sixsmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 6 and lose == true then
	sixsmall:activate();
	sixsmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 6 and lose == true then
	sixsmall:activate();
	sixsmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 6 and lose == true then
	sixsmall:activate();
	sixsmall:draweasy(208,95+scoreup,0,255)
end
if points == 7 and lose == true then
	sevensmall:activate();
	sevensmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 7 and lose == true then
	sevensmall:activate();
	sevensmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 7 and lose == true then
	sevensmall:activate();
	sevensmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 7 and lose == true then
	sevensmall:activate();
	sevensmall:draweasy(208,95+scoreup,0,255)
end
if points == 8 and lose == true then
	eightsmall:activate();
	eightsmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 8 and lose == true then
	eightsmall:activate();
	eightsmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 8 and lose == true then
	eightsmall:activate();
	eightsmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 8 and lose == true then
	eightsmall:activate();
	eightsmall:draweasy(208,95+scoreup,0,255)
end
if points == 9 and lose == true then
	ninesmall:activate();
	ninesmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 9 and lose == true then
	ninesmall:activate();
	ninesmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 9 and lose == true then
	ninesmall:activate();
	ninesmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 9 and lose == true then
	ninesmall:activate();
	ninesmall:draweasy(208,95+scoreup,0,255)
end




if pointsa >= 1 and pointsa <= 2 and pointsb == 0 and pointsc == 0 and lose == true then
	medalbronze:activate();
	medalbronze:draweasy(274,104+scoreup,0,255)
end
if pointsa >= 3 and pointsa <= 5 and pointsb == 0 and pointsc == 0 and lose == true then
	medalsilver:activate();
	medalsilver:draweasy(274,104+scoreup,0,255)
end
if pointsa >= 6 and pointsa <= 9 and pointsb == 0 and pointsc == 0 and lose == true then
	medalgold:activate();
	medalgold:draweasy(274,104+scoreup,0,255)
end
if  pointsb >= 1 and lose == true or pointsc >= 1 and lose == true then
	medalplatin:activate();
	medalplatin:draweasy(274,104+scoreup,0,255)
end




if score == 0 and lose == true then
	zerosmall:activate();
	zerosmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 0 and lose == true and scoreb >= 1 then
	zerosmall:activate();
	zerosmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 0 and lose == true and scorec >= 1 then
	zerosmall:activate();
	zerosmall:draweasy(222,135+scoreup,0,255)
end
if score == 1 and lose == true then
	onesmall:activate();
	onesmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 1 and lose == true then
	onesmall:activate();
	onesmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 1 and lose == true then
	onesmall:activate();
	onesmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 1 and lose == true then
	onesmall:activate();
	onesmall:draweasy(208,135+scoreup,0,255)
end
if score == 2 and lose == true then
	twosmall:activate();
	twosmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 2 and lose == true then
	twosmall:activate();
	twosmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 2 and lose == true then
	twosmall:activate();
	twosmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 2 and lose == true then
	twosmall:activate();
	twosmall:draweasy(208,135+scoreup,0,255)
end
if score == 3 and lose == true then
	threesmall:activate();
	threesmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 3 and lose == true then
	threesmall:activate();
	threesmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 3 and lose == true then
	threesmall:activate();
	threesmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 3 and lose == true then
	threesmall:activate();
	threesmall:draweasy(208,135+scoreup,0,255)
end
if score == 4 and lose == true then
	foursmall:activate();
	foursmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 4 and lose == true then
	foursmall:activate();
	foursmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 4 and lose == true then
	foursmall:activate();
	foursmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 4 and lose == true then
	foursmall:activate();
	foursmall:draweasy(208,135+scoreup,0,255)
end
if score == 5 and lose == true then
	fivesmall:activate();
	fivesmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 5 and lose == true then
	fivesmall:activate();
	fivesmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 5 and lose == true then
	fivesmall:activate();
	fivesmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 5 and lose == true then
	fivesmall:activate();
	fivesmall:draweasy(208,135+scoreup,0,255)
end
if score == 6 and lose == true then
	sixsmall:activate();
	sixsmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 6 and lose == true then
	sixsmall:activate();
	sixsmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 6 and lose == true then
	sixsmall:activate();
	sixsmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 6 and lose == true then
	sixsmall:activate();
	sixsmall:draweasy(208,135+scoreup,0,255)
end
if score == 7 and lose == true then
	sevensmall:activate();
	sevensmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 7 and lose == true then
	sevensmall:activate();
	sevensmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 7 and lose == true then
	sevensmall:activate();
	sevensmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 7 and lose == true then
	sevensmall:activate();
	sevensmall:draweasy(208,135+scoreup,0,255)
end
if score == 8 and lose == true then
	eightsmall:activate();
	eightsmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 8 and lose == true then
	eightsmall:activate();
	eightsmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 8 and lose == true then
	eightsmall:activate();
	eightsmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 8 and lose == true then
	eightsmall:activate();
	eightsmall:draweasy(208,135+scoreup,0,255)
end
if score == 9 and lose == true then
	ninesmall:activate();
	ninesmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 9 and lose == true then
	ninesmall:activate();
	ninesmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 9 and lose == true then
	ninesmall:activate();
	ninesmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 9 and lose == true then
	ninesmall:activate();
	ninesmall:draweasy(208,135+scoreup,0,255)
end





























if pointsc > scorec and loset == true or pointsc == scorec and pointsb > scoreb and loset == true or pointsc == scorec and pointsb == scoreb and pointsa > scorea and loset == true or pointsc == scorec and pointsb == scoreb and pointsa == scorea and points > score and loset == true then
	savegame = true
end


if points == 0 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 0")
	file_scoresave:close()
end
if points == 1 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 1")
	file_scoresave:close()
end
if points == 2 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 2")
	file_scoresave:close()
end
if points == 3 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 3")
	file_scoresave:close()
end
if points == 4 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 4")
	file_scoresave:close()
end
if points == 5 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 5")
	file_scoresave:close()
end
if points == 6 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 6")
	file_scoresave:close()
end
if points == 7 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 7")
	file_scoresave:close()
end
if points == 8 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 8")
	file_scoresave:close()
end
if points == 9 and loset == true and savegame == true and boomvalue == 15 then
	file_scoresave = io.open("scoresave.cfg","w")
	file_scoresave:write("score = 9")
	file_scoresave:close()
end

if pointsa == 0 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 0")
	file_scoreasave:close()
end
if pointsa == 1 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 1")
	file_scoreasave:close()
end
if pointsa == 2 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 2")
	file_scoreasave:close()
end
if pointsa == 3 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 3")
	file_scoreasave:close()
end
if pointsa == 4 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 4")
	file_scoreasave:close()
end
if pointsa == 5 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 5")
	file_scoreasave:close()
end
if pointsa == 6 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 6")
	file_scoreasave:close()
end
if pointsa == 7 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 7")
	file_scoreasave:close()
end
if pointsa == 8 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 8")
	file_scoreasave:close()
end
if pointsa == 9 and loset == true and savegame == true and boomvalue == 15 then
	file_scoreasave = io.open("scoreasave.cfg","w")
	file_scoreasave:write("scorea = 9")
	file_scoreasave:close()
end

if pointsb == 0 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 0")
	file_scorebsave:close()
end
if pointsb == 1 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 1")
	file_scorebsave:close()
end
if pointsb == 2 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 2")
	file_scorebsave:close()
end
if pointsb == 3 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 3")
	file_scorebsave:close()
end
if pointsb == 4 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 4")
	file_scorebsave:close()
end
if pointsb == 5 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 5")
	file_scorebsave:close()
end
if pointsb == 6 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 6")
	file_scorebsave:close()
end
if pointsb == 7 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 7")
	file_scorebsave:close()
end
if pointsb == 8 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 8")
	file_scorebsave:close()
end
if pointsb == 9 and loset == true and savegame == true and boomvalue == 15 then
	file_scorebsave = io.open("scorebsave.cfg","w")
	file_scorebsave:write("scoreb = 9")
	file_scorebsave:close()
end

if pointsc == 0 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 0")
	file_scorecsave:close()
end
if pointsc == 1 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 1")
	file_scorecsave:close()
end
if pointsc == 2 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 2")
	file_scorecsave:close()
end
if pointsc == 3 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 3")
	file_scorecsave:close()
end
if pointsc == 4 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 4")
	file_scorecsave:close()
end
if pointsc == 5 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 5")
	file_scorecsave:close()
end
if pointsc == 6 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 6")
	file_scorecsave:close()
end
if pointsc == 7 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 7")
	file_scorecsave:close()
end
if pointsc == 8 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 8")
	file_scorecsave:close()
end
if pointsc == 9 and loset == true and savegame == true and boomvalue == 15 then
	file_scorecsave = io.open("scorecsave.cfg","w")
	file_scorecsave:write("scorec = 9")
	file_scorecsave:close()
end



if points == 0 and loset == false and gamestart == true then
	zero:activate();
	zero:draweasy(228,20,0,255)
end
if pointsa == 0 and loset == false and gamestart == true and pointsb >= 1 then
	zero:activate();
	zero:draweasy(204,20,0,255)
end
if pointsb == 0 and loset == false and gamestart == true and pointsc >= 1 then
	zero:activate();
	zero:draweasy(180,20,0,255)
end
if points == 1 and loset == false and gamestart == true then
	one:activate();
	one:draweasy(228,20,0,255)
end
if pointsa == 1 and loset == false and gamestart == true then
	one:activate();
	one:draweasy(208,20,0,255)
end
if pointsb == 1 and loset == false and gamestart == true then
	one:activate();
	one:draweasy(188,20,0,255)
end
if pointsc == 1 and loset == false and gamestart == true then
	one:activate();
	one:draweasy(168,20,0,255)
end
if points == 2 and loset == false and gamestart == true then
	two:activate();
	two:draweasy(228,20,0,255)
end
if pointsa == 2 and loset == false and gamestart == true then
	two:activate();
	two:draweasy(204,20,0,255)
end
if pointsb == 2 and loset == false and gamestart == true then
	two:activate();
	two:draweasy(180,20,0,255)
end
if pointsc == 2 and loset == false and gamestart == true then
	two:activate();
	two:draweasy(156,20,0,255)
end
if points == 3 and loset == false and gamestart == true then
	three:activate();
	three:draweasy(228,20,0,255)
end
if pointsa == 3 and loset == false and gamestart == true then
	three:activate();
	three:draweasy(204,20,0,255)
end
if pointsb == 3 and loset == false and gamestart == true then
	three:activate();
	three:draweasy(180,20,0,255)
end
if pointsc == 3 and loset == false and gamestart == true then
	three:activate();
	three:draweasy(156,20,0,255)
end
if points == 4 and loset == false and gamestart == true then
	four:activate();
	four:draweasy(228,20,0,255)
end
if pointsa == 4 and loset == false and gamestart == true then
	four:activate();
	four:draweasy(204,20,0,255)
end
if pointsb == 4 and loset == false and gamestart == true then
	four:activate();
	four:draweasy(180,20,0,255)
end
if pointsc == 4 and loset == false and gamestart == true then
	four:activate();
	four:draweasy(156,20,0,255)
end
if points == 5 and loset == false and gamestart == true then
	five:activate();
	five:draweasy(228,20,0,255)
end
if pointsa == 5 and loset == false and gamestart == true then
	five:activate();
	five:draweasy(204,20,0,255)
end
if pointsb == 5 and loset == false and gamestart == true then
	five:activate();
	five:draweasy(180,20,0,255)
end
if pointsc == 5 and loset == false and gamestart == true then
	five:activate();
	five:draweasy(156,20,0,255)
end
if points == 6 and loset == false and gamestart == true then
	six:activate();
	six:draweasy(228,20,0,255)
end
if pointsa == 6 and loset == false and gamestart == true then
	six:activate();
	six:draweasy(204,20,0,255)
end
if pointsb == 6 and loset == false and gamestart == true then
	six:activate();
	six:draweasy(180,20,0,255)
end
if pointsc == 6 and loset == false and gamestart == true then
	six:activate();
	six:draweasy(156,20,0,255)
end
if points == 7 and loset == false and gamestart == true then
	seven:activate();
	seven:draweasy(228,20,0,255)
end
if pointsa == 7 and loset == false and gamestart == true then
	seven:activate();
	seven:draweasy(204,20,0,255)
end
if pointsb == 7 and loset == false and gamestart == true then
	seven:activate();
	seven:draweasy(180,20,0,255)
end
if pointsc == 7 and loset == false and gamestart == true then
	seven:activate();
	seven:draweasy(156,20,0,255)
end
if points == 8 and loset == false and gamestart == true then
	eight:activate();
	eight:draweasy(228,20,0,255)
end
if pointsa == 8 and loset == false and gamestart == true then
	eight:activate();
	eight:draweasy(204,20,0,255)
end
if pointsb == 8 and loset == false and gamestart == true then
	eight:activate();
	eight:draweasy(180,20,0,255)
end
if pointsc == 8 and loset == false and gamestart == true then
	eight:activate();
	eight:draweasy(156,20,0,255)
end
if points == 9 and loset == false and gamestart == true then
	nine:activate();
	nine:draweasy(228,20,0,255)
end
if pointsa == 9 and loset == false and gamestart == true then
	nine:activate();
	nine:draweasy(204,20,0,255)
end
if pointsb == 9 and loset == false and gamestart == true then
	nine:activate();
	nine:draweasy(180,20,0,255)
end
if pointsc == 9 and loset == false and gamestart == true then
	nine:activate();
	nine:draweasy(156,20,0,255)
end




if points == 0 and loset == true then
	zerosmall:activate();
	zerosmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 0 and loset == true and pointsb >= 1 then
	zerosmall:activate();
	zerosmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 0 and loset == true and pointsc >= 1 then
	zerosmall:activate();
	zerosmall:draweasy(222,95+scoreup,0,255)
end
if points == 1 and loset == true then
	onesmall:activate();
	onesmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 1 and loset == true then
	onesmall:activate();
	onesmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 1 and loset == true then
	onesmall:activate();
	onesmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 1 and loset == true then
	onesmall:activate();
	onesmall:draweasy(208,95+scoreup,0,255)
end
if points == 2 and loset == true then
	twosmall:activate();
	twosmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 2 and loset == true then
	twosmall:activate();
	twosmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 2 and loset == true then
	twosmall:activate();
	twosmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 2 and loset == true then
	twosmall:activate();
	twosmall:draweasy(208,95+scoreup,0,255)
end
if points == 3 and loset == true then
	threesmall:activate();
	threesmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 3 and loset == true then
	threesmall:activate();
	threesmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 3 and loset == true then
	threesmall:activate();
	threesmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 3 and loset == true then
	threesmall:activate();
	threesmall:draweasy(208,95+scoreup,0,255)
end
if points == 4 and loset == true then
	foursmall:activate();
	foursmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 4 and loset == true then
	foursmall:activate();
	foursmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 4 and loset == true then
	foursmall:activate();
	foursmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 4 and loset == true then
	foursmall:activate();
	foursmall:draweasy(208,95+scoreup,0,255)
end
if points == 5 and loset == true then
	fivesmall:activate();
	fivesmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 5 and loset == true then
	fivesmall:activate();
	fivesmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 5 and loset == true then
	fivesmall:activate();
	fivesmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 5 and loset == true then
	fivesmall:activate();
	fivesmall:draweasy(208,95+scoreup,0,255)
end
if points == 6 and loset == true then
	sixsmall:activate();
	sixsmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 6 and loset == true then
	sixsmall:activate();
	sixsmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 6 and loset == true then
	sixsmall:activate();
	sixsmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 6 and loset == true then
	sixsmall:activate();
	sixsmall:draweasy(208,95+scoreup,0,255)
end
if points == 7 and loset == true then
	sevensmall:activate();
	sevensmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 7 and loset == true then
	sevensmall:activate();
	sevensmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 7 and loset == true then
	sevensmall:activate();
	sevensmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 7 and loset == true then
	sevensmall:activate();
	sevensmall:draweasy(208,95+scoreup,0,255)
end
if points == 8 and loset == true then
	eightsmall:activate();
	eightsmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 8 and loset == true then
	eightsmall:activate();
	eightsmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 8 and loset == true then
	eightsmall:activate();
	eightsmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 8 and loset == true then
	eightsmall:activate();
	eightsmall:draweasy(208,95+scoreup,0,255)
end
if points == 9 and loset == true then
	ninesmall:activate();
	ninesmall:draweasy(250,95+scoreup,0,255)
end
if pointsa == 9 and loset == true then
	ninesmall:activate();
	ninesmall:draweasy(236,95+scoreup,0,255)
end
if pointsb == 9 and loset == true then
	ninesmall:activate();
	ninesmall:draweasy(222,95+scoreup,0,255)
end
if pointsc == 9 and loset == true then
	ninesmall:activate();
	ninesmall:draweasy(208,95+scoreup,0,255)
end




if pointsa >= 1 and pointsa <= 2 and pointsb == 0 and pointsc == 0 and loset == true then
	medalbronze:activate();
	medalbronze:draweasy(274,104+scoreup,0,255)
end
if pointsa >= 3 and pointsa <= 5 and pointsb == 0 and pointsc == 0 and loset == true then
	medalsilver:activate();
	medalsilver:draweasy(274,104+scoreup,0,255)
end
if pointsa >= 6 and pointsa <= 9 and pointsb == 0 and pointsc == 0 and loset == true then
	medalgold:activate();
	medalgold:draweasy(274,104+scoreup,0,255)
end
if  pointsb >= 1 and loset == true or pointsc >= 1 and loset == true then
	medalplatin:activate();
	medalplatin:draweasy(274,104+scoreup,0,255)
end




if score == 0 and loset == true then
	zerosmall:activate();
	zerosmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 0 and loset == true and scoreb >= 1 then
	zerosmall:activate();
	zerosmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 0 and loset == true and scorec >= 1 then
	zerosmall:activate();
	zerosmall:draweasy(222,135+scoreup,0,255)
end
if score == 1 and loset == true then
	onesmall:activate();
	onesmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 1 and loset == true then
	onesmall:activate();
	onesmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 1 and loset == true then
	onesmall:activate();
	onesmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 1 and loset == true then
	onesmall:activate();
	onesmall:draweasy(208,135+scoreup,0,255)
end
if score == 2 and loset == true then
	twosmall:activate();
	twosmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 2 and loset == true then
	twosmall:activate();
	twosmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 2 and loset == true then
	twosmall:activate();
	twosmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 2 and loset == true then
	twosmall:activate();
	twosmall:draweasy(208,135+scoreup,0,255)
end
if score == 3 and loset == true then
	threesmall:activate();
	threesmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 3 and loset == true then
	threesmall:activate();
	threesmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 3 and loset == true then
	threesmall:activate();
	threesmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 3 and loset == true then
	threesmall:activate();
	threesmall:draweasy(208,135+scoreup,0,255)
end
if score == 4 and loset == true then
	foursmall:activate();
	foursmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 4 and loset == true then
	foursmall:activate();
	foursmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 4 and loset == true then
	foursmall:activate();
	foursmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 4 and loset == true then
	foursmall:activate();
	foursmall:draweasy(208,135+scoreup,0,255)
end
if score == 5 and loset == true then
	fivesmall:activate();
	fivesmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 5 and loset == true then
	fivesmall:activate();
	fivesmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 5 and loset == true then
	fivesmall:activate();
	fivesmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 5 and loset == true then
	fivesmall:activate();
	fivesmall:draweasy(208,135+scoreup,0,255)
end
if score == 6 and loset == true then
	sixsmall:activate();
	sixsmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 6 and loset == true then
	sixsmall:activate();
	sixsmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 6 and loset == true then
	sixsmall:activate();
	sixsmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 6 and loset == true then
	sixsmall:activate();
	sixsmall:draweasy(208,135+scoreup,0,255)
end
if score == 7 and loset == true then
	sevensmall:activate();
	sevensmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 7 and loset == true then
	sevensmall:activate();
	sevensmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 7 and loset == true then
	sevensmall:activate();
	sevensmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 7 and loset == true then
	sevensmall:activate();
	sevensmall:draweasy(208,135+scoreup,0,255)
end
if score == 8 and loset == true then
	eightsmall:activate();
	eightsmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 8 and loset == true then
	eightsmall:activate();
	eightsmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 8 and loset == true then
	eightsmall:activate();
	eightsmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 8 and loset == true then
	eightsmall:activate();
	eightsmall:draweasy(208,135+scoreup,0,255)
end
if score == 9 and loset == true then
	ninesmall:activate();
	ninesmall:draweasy(250,135+scoreup,0,255)
end
if scorea == 9 and loset == true then
	ninesmall:activate();
	ninesmall:draweasy(236,135+scoreup,0,255)
end
if scoreb == 9 and loset == true then
	ninesmall:activate();
	ninesmall:draweasy(222,135+scoreup,0,255)
end
if scorec == 9 and loset == true then
	ninesmall:activate();
	ninesmall:draweasy(208,135+scoreup,0,255)
end



bar:activate();
bar:draweasy(0,0,0,255)


if blackscreenstart == true then
	blackscreen = blackscreen - 20
end
if blackscreen <= 0 then
	blackscreenstart = false
	blackscreen = 0
end
black:activate();
black:draweasy(0,0,0,blackscreen)

if pge.controls.pressed(PGE_CTRL_START) or pge.controls.pressed(PGE_CTRL_CIRCLE) and lose == true or pge.controls.pressed(PGE_CTRL_CROSS) and lose == true or pge.controls.pressed(PGE_CTRL_SQUARE) and lose == true or pge.controls.pressed(PGE_CTRL_TRIANGLE) and lose == true then
	local select = 1;
	gamestart = false
	boomvalue = 255
	lose = false
	loset = false
	wind = true
	hit = false
	blackscreen = 255
	blackscreenstart = true
	tubevalue = 0
	points = 0
	pointsa = 0
	pointsb = 0
	pointsc = 0
	savegame = false
	score = 0
	scorea = 0
	scoreb = 0
	scorec = 0
	dofile("multibird.cfg")
	pointcount = false
	pause = false
	place = 0
	scoreup = 580
	ad = math.random(1,3)
	dofile("bkg.cfg")
	dofile("scoresave.cfg")
	dofile("scoreasave.cfg")
	dofile("scorebsave.cfg")
	dofile("scorecsave.cfg")
	tubespeedzero = 480
	tubespeedone = 480
	tubespeedtwo = 480
	tubespeedthree = 480
	tubespeedfour = 480
	tubespeedfive = 480
	tubespeedsix = 480
	tubespeedseven = 480
	tubespeedeigth = 480
	tubespeednine = 480
	tubespeedten = 480
	tubespeedeleven = 480
	tubetypezero = false
	tubetypeone = false
	tubetypetwo = false
	tubetypethree = false
	tubetypefour = false
	tubetypefive = false
	tubetypesix = false
	tubetypeseven = false
	tubetypeeigth = false
	tubetypenine = false
	tubetypeten = false
	tubetypeeleven = false
	speed = 0
	endjump = 0
	birdtimer = 1
	birdjump = 0
	birdtimerb = 1
	birdjumpb = 0
	push = 1
	r = 0
	levelspeed = 0
	x = 3.3
	y = 40
	ya = 40
	xa = 3.3
	xb = 3.3
	yb = 40
	yyb = 100
	endjumpt = 0
	birdtimert = 1
	birdjumpt = 0
	birdtimerbt = 1
	birdjumpbt = 0
	rt = 0
	xt = 3.3
	yt = 40
	yat = 40
	xat = 3.3
	xbt = 3.3
	ybt = 40
	yybt = 110
end

 pge.gfx.enddrawing()
 pge.gfx.swapbuffers()
end
texture = nil
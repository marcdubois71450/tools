local select = 1;
gamestart = false
boomvalue = 255
lose = false
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
dofile("bird.cfg")
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
yyb = 120
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

if birdtype == 0 then
	birdtype = math.random(1,7)
end

if birdtype == 1 then
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
end
if birdtype == 2 then
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
end
if birdtype == 3 then
	if birdtimer >= 1 and birdtimer <= 2 then
		bluea:activate();
		bluea:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 2 and birdtimer <= 3 then
		blueb:activate();
		blueb:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 3 and birdtimer <= 4 then
		bluec:activate();
		bluec:draweasy(220,0+yyb,0-r,255)
	end
end
if birdtype == 4 then
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
end
if birdtype == 5 then
	if birdtimer >= 1 and birdtimer <= 2 then
		green:activate();
		green:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 2 and birdtimer <= 3 then
		greena:activate();
		greena:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 3 and birdtimer <= 4 then
		greenb:activate();
		greenb:draweasy(220,0+yyb,0-r,255)
	end
end
if birdtype == 6 then
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
end
if birdtype == 7 then
	if birdtimer >= 1 and birdtimer <= 2 then
		gray:activate();
		gray:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 2 and birdtimer <= 3 then
		graya:activate();
		graya:draweasy(220,0+yyb,0-r,255)
	end
	if birdtimer >= 3 and birdtimer <= 4 then
		grayb:activate();
		grayb:draweasy(220,0+yyb,0-r,255)
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
if levelspeed <= -480 then
	levelspeed = 0
end

if gamestart == false and lose == false then
	r = 0
	getready:activate();
	getready:draweasy(101,48,0,255)
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


if pge.controls.pressed(PGE_CTRL_SELECT) and lose == false or pge.controls.pressed(PGE_CTRL_LTRIGGER) and lose == false then
	pause = true
	sfx_pause:play()
	gamestart = false
end
if pge.controls.pressed(PGE_CTRL_RTRIGGER) then
	dofile("menu.lua")
end

if pge.controls.pressed(PGE_CTRL_CIRCLE) and lose == false or pge.controls.pressed(PGE_CTRL_CROSS) and lose == false or pge.controls.pressed(PGE_CTRL_SQUARE) and lose == false or pge.controls.pressed(PGE_CTRL_TRIANGLE) and lose == false then
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
if yyb <= 0 then
	y = 0
	yb = 0
	ya = 0
end

if wind == true then
	sfx_swooshing:play()
	wind = false
end


if lose == false and pause == false then
	levelspeed = levelspeed - 2
	birdtimer = birdtimer + 0.25
end

if lose == true then
	hit = true
	boomvalue = boomvalue - 20
	scoreup = scoreup - 10
	scores:activate();
	scores:draweasy(150,90+scoreup,0,255)
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


if blackscreenstart == true then
	blackscreen = blackscreen - 20
end
if blackscreen <= 0 then
	blackscreenstart = false
	blackscreen = 0
end
bar:activate();
bar:draweasy(0,0,0,255)

black:activate();
black:draweasy(0,0,0,blackscreen)

if pge.controls.pressed(PGE_CTRL_START) or pge.controls.pressed(PGE_CTRL_CIRCLE) and lose == true or pge.controls.pressed(PGE_CTRL_CROSS) and lose == true or pge.controls.pressed(PGE_CTRL_SQUARE) and lose == true or pge.controls.pressed(PGE_CTRL_TRIANGLE) and lose == true then
	local select = 1;
	gamestart = false
	boomvalue = 255
	lose = false
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
	dofile("bird.cfg")
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
	yyb = 120
end
 pge.gfx.enddrawing()
 pge.gfx.swapbuffers()
end
texture = nil
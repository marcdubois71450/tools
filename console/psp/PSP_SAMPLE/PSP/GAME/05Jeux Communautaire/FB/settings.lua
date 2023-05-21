select = 1;
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
groundback = 0

tap = false
tapb = false
tapc = false
typebird = 0
typemulti = 0

pause = false

place = 0
scoreup = 580
ad = math.random(1,3)

dofile("scoresave.cfg")
dofile("scoreasave.cfg")
dofile("scorebsave.cfg")
dofile("scorecsave.cfg")


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
yybt = 120
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

road:activate();
road:draweasy(levelspeed,242,0,255)
road:activate();
road:draweasy(levelspeed+480,242,0,255)

settings:activate();
settings:draweasy(0,0,0,255)

if birdtimer == 4 then
	birdtimer = 1
end
if birdtimert == 4 then
	birdtimert = 1
end
if levelspeed <= -480 then
	levelspeed = 0
end

if gamestart == false and lose == false then
	r = 0
	rt = 0
end



if wind == true then
	sfx_swooshing:play()
	wind = false
end


if lose == false and pause == false then
	levelspeed = levelspeed - 2
	birdtimer = birdtimer + 0.25
	birdtimert = birdtimert + 0.25
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

if typebird == 0 and tap == true then
	file_bird = io.open("bird.cfg","w")
	file_bird:write("birdtype = 0")
	file_bird:close()
	tap = false
end
if typebird == 0 then
	random:activate();
	random:draweasy(32,36,0,255)
end
if typebird == 1 and tap == true then
	file_bird = io.open("bird.cfg","w")
	file_bird:write("birdtype = 1")
	file_bird:close()
	tap = false
end
if typebird == 1 then
	bird:activate();
	bird:draweasy(24,38,0,255)
end
if typebird == 2 and tap == true then
	file_bird = io.open("bird.cfg","w")
	file_bird:write("birdtype = 2")
	file_bird:close()
	tap = false
end
if typebird == 2 then
	birdreda:activate();
	birdreda:draweasy(24,38,0,255)
end
if typebird == 3 and tap == true then
	file_bird = io.open("bird.cfg","w")
	file_bird:write("birdtype = 3")
	file_bird:close()
	tap = false
end
if typebird == 3 then
	bluea:activate();
	bluea:draweasy(24,38,0,255)
end
if typebird == 4 and tap == true then
	file_bird = io.open("bird.cfg","w")
	file_bird:write("birdtype = 4")
	file_bird:close()
	tap = false
end
if typebird == 4 then
	darkc:activate();
	darkc:draweasy(24,38,0,255)
end
if typebird == 5 and tap == true then
	file_bird = io.open("bird.cfg","w")
	file_bird:write("birdtype = 5")
	file_bird:close()
	tap = false
end
if typebird == 5 then
	green:activate();
	green:draweasy(24,38,0,255)
end
if typebird == 6 and tap == true then
	file_bird = io.open("bird.cfg","w")
	file_bird:write("birdtype = 6")
	file_bird:close()
	tap = false
end
if typebird == 6 then
	pink:activate();
	pink:draweasy(24,38,0,255)
end
if typebird == 7 and tap == true then
	file_bird = io.open("bird.cfg","w")
	file_bird:write("birdtype = 7")
	file_bird:close()
	tap = false
end
if typebird == 7 then
	gray:activate();
	gray:draweasy(24,38,0,255)
end
if typebird == 8 then
	typebird = 0
end
if typebird == -1 then
	typebird = 7
end



if typemulti == 0 and tapb == true then
	file_multibird = io.open("multibird.cfg","w")
	file_multibird:write("multitype = 0")
	file_multibird:close()
	tapb = false
end
if typemulti == 0 then
	random:activate();
	random:draweasy(32,66,0,255)
end
if typemulti == 1 and tapb == true then
	file_multibird = io.open("multibird.cfg","w")
	file_multibird:write("multitype = 1")
	file_multibird:close()
	tapb = false
end
if typemulti == 1 then
	bluea:activate();
	bluea:draweasy(14,68,0,255)
	bird:activate();
	bird:draweasy(24,68,0,255)
end
if typemulti == 2 and tapb == true then
	file_multibird = io.open("multibird.cfg","w")
	file_multibird:write("multitype = 2")
	file_multibird:close()
	tapb = false
end
if typemulti == 2 then
	gray:activate();
	gray:draweasy(14,68,0,255)
	birdreda:activate();
	birdreda:draweasy(24,68,0,255)
end
if typemulti == 3 and tapb == true then
	file_multibird = io.open("multibird.cfg","w")
	file_multibird:write("multitype = 3")
	file_multibird:close()
	tapb = false
end
if typemulti == 3 then
	pink:activate();
	pink:draweasy(14,68,0,255)
	green:activate();
	green:draweasy(24,68,0,255)
end
if typemulti == 4 and tapb == true then
	file_multibird = io.open("multibird.cfg","w")
	file_multibird:write("multitype = 4")
	file_multibird:close()
	tapb = false
end
if typemulti == 4 then
	bird:activate();
	bird:draweasy(14,68,0,255)
	darkc:activate();
	darkc:draweasy(24,68,0,255)
end
if typemulti == 5 then
	typemulti = 0
end
if typemulti == -1 then
	typemulti = 4
end


if groundback == 0 and tapc == true then
	background = 0
	file_bkg = io.open("bkg.cfg","w")
	file_bkg:write("background = 0")
	file_bkg:close()
	dofile("bkg.cfg")
	tapc = false
end
if groundback == 0 then
	random:activate();
	random:draweasy(32,96,0,255)
end
if groundback == 1 and tapc == true then
	background = 1
	file_bkg = io.open("bkg.cfg","w")
	file_bkg:write("background = 1")
	file_bkg:close()
	tapc = false
end
if groundback == 2 and tapc == true then
	background = 2
	file_bkg = io.open("bkg.cfg","w")
	file_bkg:write("background = 2")
	file_bkg:close()
	tapc = false
end
if groundback == 3 and tapc == true then
	background = 3
	file_bkg = io.open("bkg.cfg","w")
	file_bkg:write("background = 3")
	file_bkg:close()
	tapc = false
end
if groundback == 4 and tapc == true then
	background = 4
	file_bkg = io.open("bkg.cfg","w")
	file_bkg:write("background = 4")
	file_bkg:close()
	tapc = false
end
if groundback == 5 then
	groundback = 0
end
if groundback == -1 then
	groundback = 4
end




if select == 1 then
	if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) or pge.controls.pressed(PGE_CTRL_RIGHT) then
		typebird = typebird + 1
		tap = true
	end
	if pge.controls.pressed(PGE_CTRL_LEFT) then
		typebird = typebird - 1
		tap = true
	end
	choose:activate();
	choose:draweasy(36,48,0,255)
end
if select == 2 then
	if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) or pge.controls.pressed(PGE_CTRL_RIGHT) then
		typemulti = typemulti + 1
		tapb = true
	end
	if pge.controls.pressed(PGE_CTRL_LEFT) then
		typemulti = typemulti - 1
		tapb = true
	end
	choose:activate();
	choose:draweasy(36,78,0,255)
end
if select == 3 then
	if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) or pge.controls.pressed(PGE_CTRL_RIGHT) then
		groundback = groundback + 1
		tapc = true
	end
	if pge.controls.pressed(PGE_CTRL_LEFT) then
		groundback = groundback - 1
		tapc = true
	end
	choose:activate();
	choose:draweasy(36,112,0,255)
end
if select == 4 then
	if scoreb > 0 or scorec > 0 or scorea >= 5 then
		if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) then
			dofile("free.lua")
		end
	end
	choose:activate();
	choose:draweasy(36,148,0,255)
end
if select == 5 then
	if scoreb > 0 or scorec > 0 or scorea >= 7 and score >= 5 then
		if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) then
			dofile("longbird.lua")
		end
	end
	choose:activate();
	choose:draweasy(36,184,0,255)
end
if select == 6 then
	if scoreb > 0 or scorec > 0 then
		if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) then
			dofile("nyan.lua")
		end
	end
	choose:activate();
	choose:draweasy(36,212,0,255)
end
if select == 7 then
	if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) then
		dofile("dead.lua")
	end
	choose:activate();
	choose:draweasy(36,250,0,255)
end


if pge.controls.pressed(PGE_CTRL_UP) and select > 0 then
	select = select - 1;
end
if pge.controls.pressed(PGE_CTRL_DOWN) and select < 8 then
	select = select + 1;
end
if select == 8 then
	select = 1
end
if select == 0 then
	select = 7
end

if blackscreenstart == true then
	blackscreen = blackscreen - 20
end
if blackscreen <= 0 then
	blackscreenstart = false
	blackscreen = 0
end

if pge.controls.pressed(PGE_CTRL_RTRIGGER) or pge.controls.pressed(PGE_CTRL_TRIANGLE) then
	dofile("menu.lua")
end

black:activate();
black:draweasy(0,0,0,blackscreen)


 pge.gfx.enddrawing()
 pge.gfx.swapbuffers()
end
texture = nil
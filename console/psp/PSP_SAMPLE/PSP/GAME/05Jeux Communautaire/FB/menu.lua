select = 1;
pge.mp3.stop()
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
pointcount = false

dofile("bird.cfg")
dofile("bkg.cfg")

pause = false

place = 0
scoreup = 580
ad = math.random(1,3)

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

if ad == 1 and lose == true then
	ada:activate();
	ada:draweasy(0,-5-scoreup,0,255)
end
if ad == 2 and lose == true then
	adb:activate();
	adb:draweasy(0,-3-scoreup,0,255)
end
if ad == 3 and lose == true then
	adc:activate();
	adc:draweasy(0,-5-scoreup,0,255)
end

if scoreup == 380 then
	sfx_swooshing:play()
end


if boomvalue == 235 then
	sfx_hit:play()
end

menu:activate();
menu:draweasy(0,0,0,255)

if select == 1 then
	if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) then
		dofile("game.lua")
	end
	choose:activate();
	choose:draweasy(94,218,0,255)
end
if select == 2 then
	if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) then
		dofile("multi.lua")
	end
	choose:activate();
	choose:draweasy(232,218,0,255)
end
if select == 3 then
	if pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_START) then
		dofile("settings.lua")
	end
	choose:activate();
	choose:draweasy(368,218,0,255)
end


if pge.controls.pressed(PGE_CTRL_LEFT) and select > 0 then
	select = select - 1;
end
if pge.controls.pressed(PGE_CTRL_RIGHT) and select < 4 then
	select = select + 1;
end

if blackscreenstart == true then
	blackscreen = blackscreen - 20
end
if blackscreen <= 0 then
	blackscreenstart = false
	blackscreen = 0
end
black:activate();
black:draweasy(0,0,0,blackscreen)


 pge.gfx.enddrawing()
 pge.gfx.swapbuffers()
end
texture = nil
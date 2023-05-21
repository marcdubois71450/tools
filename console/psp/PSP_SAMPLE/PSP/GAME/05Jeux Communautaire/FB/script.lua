introload = 0
introstart = true
local loaded = false;
function loadeverything()
	if loaded == false then
		new = pge.texture.load("new.png")
		blood1 = pge.texture.load("blood1.png")
		blood2 = pge.texture.load("blood2.png")
		blood3 = pge.texture.load("blood3.png")
		blood4 = pge.texture.load("blood4.png")
		blood5 = pge.texture.load("blood5.png")
		blood6 = pge.texture.load("blood6.png")
		blood7 = pge.texture.load("blood7.png")
		deadtube = pge.texture.load("deadtube.png")
		deadtube1 = pge.texture.load("deadtube1.png")
		zero = pge.texture.load("number/0.png")
		one = pge.texture.load("number/1.png")
		two = pge.texture.load("number/2.png")
		three = pge.texture.load("number/3.png")
		four = pge.texture.load("number/4.png")
		five = pge.texture.load("number/5.png")
		six = pge.texture.load("number/6.png")
		seven = pge.texture.load("number/7.png")
		eight = pge.texture.load("number/8.png")
		nine = pge.texture.load("number/9.png")
		zerosmall = pge.texture.load("number/00.png")
		onesmall = pge.texture.load("number/11.png")
		twosmall = pge.texture.load("number/22.png")
		threesmall = pge.texture.load("number/33.png")
		foursmall = pge.texture.load("number/44.png")
		fivesmall = pge.texture.load("number/55.png")
		sixsmall = pge.texture.load("number/66.png")
		sevensmall = pge.texture.load("number/77.png")
		eightsmall = pge.texture.load("number/88.png")
		ninesmall = pge.texture.load("number/99.png")
		bar = pge.texture.load("bar.png")
		rainbow = pge.texture.load("rainbow.png")
		rainbow1 = pge.texture.load("rainbow1.png")
		wini = pge.texture.load("wini.png")
		winii = pge.texture.load("winii.png")
		tie = pge.texture.load("tie.png")
		longbird = pge.texture.load("longbird.png")
		longbird1 = pge.texture.load("longbird1.png")
		longbird2 = pge.texture.load("longbird2.png")
		settings = pge.texture.load("settings.png")
		random = pge.texture.load("random.png")
		cat1 = pge.texture.load("cat1.png")
		cat2 = pge.texture.load("cat2.png")
		cat3 = pge.texture.load("cat3.png")
		catbg = pge.texture.load("catbg.png")
		catroad = pge.texture.load("catroad.png")
		cattubes = pge.texture.load("cattubes.png")
		green = pge.texture.load("green.png")
		greena = pge.texture.load("greena.png")
		greenb = pge.texture.load("greenb.png")
		pink = pge.texture.load("pink.png")
		pinka = pge.texture.load("pinka.png")
		pinkb = pge.texture.load("pinkb.png")
		bg = pge.texture.load("bg.png")
		bg1 = pge.texture.load("bg1.png")
		bg2 = pge.texture.load("bg2.png")
		bg3 = pge.texture.load("bg3.png")
		star1 = pge.texture.load("star1.png")
		star2 = pge.texture.load("star2.png")
		star3 = pge.texture.load("star3.png")
		tubes = pge.texture.load("tubes.png")
		black = pge.texture.load("black.png")
		road = pge.texture.load("road.png")
		getready = pge.texture.load("getready.png")
		getreadym = pge.texture.load("getreadym.png")
		scores = pge.texture.load("score.png")
		intro = pge.texture.load("intro.png")
		boom = pge.texture.load("boom.png")
		bird = pge.texture.load("bird.png")
		birda = pge.texture.load("birda.png")
		birdb = pge.texture.load("birdb.png")
		birdredc = pge.texture.load("birdredc.png")
		birdreda = pge.texture.load("birdreda.png")
		birdredb = pge.texture.load("birdredb.png")
		bluea = pge.texture.load("bluea.png")
		blueb = pge.texture.load("blueb.png")
		bluec = pge.texture.load("bluec.png")
		graya = pge.texture.load("graya.png")
		grayb = pge.texture.load("grayb.png")
		gray = pge.texture.load("gray.png")
		dark = pge.texture.load("dark.png")
		darkb = pge.texture.load("darkb.png")
		darkc = pge.texture.load("darkc.png")
		medalgold = pge.texture.load("medalgold.png")
		medalplatin = pge.texture.load("medalplatin.png")
		medalsilver = pge.texture.load("medalsilver.png")
		medalbronze = pge.texture.load("medalbronze.png")
		menu = pge.texture.load("menu.png")
		choose = pge.texture.load("choose.png")
		sfx_wing = pge.wav.load("wing.wav")
		sfx_pause = pge.wav.load("pause.wav")
		sfx_hit = pge.wav.load("hit.wav")
		sfx_point = pge.wav.load("point.wav")
		sfx_swooshing = pge.wav.load("swooshing.wav")
		sfx_dzzz = pge.wav.load("dzzz.wav")
		sfx_shhh = pge.wav.load("shhh.wav")
		loaded = true;
	end
end
math.randomseed(math.random(0,100000))
loadeverything()
while pge.running() do
 pge.controls.update()
 pge.gfx.startdrawing()
 pge.gfx.clearscreen()
 pge.controls.update()
if introstart == true then
	introload = introload + 3
end
if introstart == false then
	introload = introload - 3
end


intro:activate();
intro:draweasy(0,0,0,introload)

if introload > 500 then
	introstart = false
	introload = 250
end
if pge.controls.pressed(PGE_CTRL_SELECT) or pge.controls.pressed(PGE_CTRL_START) or pge.controls.pressed(PGE_CTRL_CIRCLE) or pge.controls.pressed(PGE_CTRL_CROSS) or pge.controls.pressed(PGE_CTRL_SQUARE) or pge.controls.pressed(PGE_CTRL_TRIANGLE) then
	dofile("menu.lua")
end

if introload < 0 then
	dofile("menu.lua")
end


 pge.gfx.enddrawing()
 pge.gfx.swapbuffers()
end
texture = nil
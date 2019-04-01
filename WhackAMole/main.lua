-- Title: Whack a mole
-- Name: Liam Csiffary
-- Course: ICS2O/3C
-- This program allows me to beat mo9le while getting score for it.

display.setStatusBar(display.HiddenStatusBar)

local bkg = display.newRect( -530, 0, display.contentWidth, display.contentHeight )

	bkg = display.setDefault("background", 0, 1, 0)

local mole = display.newImage( "Images/bee.png", 0, 0 )

--setting position
mole.x = display.contentCenterX
mole.y = display.contentCenterY

mole.isVisible = false

local score = 0

local backgroundSound
local whackedSound
-------------------------------------------------FUNCTIONS--------------------------------------------
-- this function makes the mole appear in random locations
function PopUp( )

	-- chosing random position x, y, for mole
	mole.x = math.random( 0, display.contentWidth )
	mole.y = math.random( 0, display.contentHeight )
	mole.isVisible = true
	timer.performWithDelay( 900, Hide)
end

function BackgroundSound( )
	backgroundSound = audio.loadSound( "Sounds/bkgMusic.mp3" )
	timer.performWithDelay(6600000, BackgroundSound)
end

-- calls popo up after 3 seconds
function PopUpDelay( )
	timer.performWithDelay( 3000, PopUp )
end

-- this function makes the mole invisible then calls PopUpDelay
function Hide( )

	-- hide mole
	mole.isVisible = false
	PopUpDelay()
end

-- this funcxtion starts the game
function GameStart( )
	PopUpDelay()
end

-- delete mole if whacked and add score
function Whacked( event )
	-- if touch phase just started
	if (event.phase == "began") then
		whackedSound = audio.loadSound( "Sounds/correctSound.mp3" )
		score = score + 1
		print(score)
		scoreText.text = "" .. score .. ""
	end
end


-------------------------------------ONJECTS---------------------------
scoreText = display.newText( "" .. score .. "", 90, 130, nil, 300)
scoreText:setTextColor(1, 0, 0)
--------------------------------------------EVENT LISTENERSW------------------------------
-- is mole == whacked call "Whacked"
mole:addEventListener( "touch", Whacked )

----------------------------START GAME--------------------------------------
GameStart()
BackgroundSound()
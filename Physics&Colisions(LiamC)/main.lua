-- Title: PhysicsAndCollisions
-- Name: Liam Csiffary
-- Course: ICS2O/3C
-- This program is teaching me how to do phisics in corona

local beam
local beam2
local ball2
local ball1


display.setStatusBar(display.HiddenStatusBar)
local backgroundImage = display.newImageRect("Images/bkg.png", 2050, 1536)
-----------------------------------------------------------
-- VARIAVLES
------------------------------------------------

-- load physics
local physics = require("physics")

-- start physics
physics.start()
---------------------------------------------------------------------------
--OBJECTS
-------------------------------------------------------------------------------
--ground
local ground = display.newImage("Images/ground.png", 0, 0)
ground.x = display.contentWidth/2
ground.y = display.contentWidth*5/7

-- change the width to be the same as the screen
ground.width = display.contentWidth

-- add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.8})

------------------------------------------------------------------------------------------
local beam = display.newImage("Images/beam.png", 30, 620)


-- rotate the beam - 45 degrees
beam:rotate(-45)
beam:scale(2, 2)
-- add physics to the beam
physics.addBody( beam, "static", { friction = 0.5, bounce = 1})

-- send it to the back layer

local beam2 = display.newImage("Images/beam.png", 1000, 620)


-- rotate the beam - 45 degrees
beam2:rotate(35)
beam2:scale(2, 2)
-- add physics to the beam
physics.addBody( beam2, "static", { friction = 0.5, bounce = 1})

-- create background
local bkg = display.newImage("Images/bkg.png", 2048, 1200)

bkg:toBack()

---------------------------------------------------------------------------------
--FUNCTIONS
-------------------------------------------------------------------------------

--create the first ball
local function firstBall()
	--create first ball
	local ball1 = display.newImage("Images/super_ball.png", 0, 0)
	ball1:scale(1, 1)

	-- add physics
	physics.addBody(ball1, {density=1, friction=0.5, bounce=.7, radius=25})
end

--create the second ball
local function secondBall()
	--create second ball
	local ball2 = display.newImage("Images/super_ball.png", 0, 0)

	-- add physics
	physics.addBody(ball2, {density=1, friction=0.5, bounce=.7, radius=12.5})
	ball2:scale(.5, .5)
end

------------------------------------------------------------------------------
--TIMERDELAYS - call each function after given time
---------------------------------------------------------
timer.performWithDelay( 0, firstBall)
timer.performWithDelay( 500, secondBall)

-- Title: TouchAndDrag
-- Name: Liam Csiffary
-- Course: ICS2O/3C
-- This program displays images that react to a person's mouse.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables.
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local purpleGirl = display.newImageRect("Images/girl2.png", 150,150)
local purpleGirlWidth = purpleGirl.width
local purpleGirlHeight = purpleGirl.height

local yellowGirl = display.newImageRect("Images/girl3.png", 150,150)
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

local blueGirl = display.newImageRect("Images/girl1.png", 150,150)
local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedPurpleGirl = false
local alreadyTouchedYellowGirl = false
local alreadyTouchedBlueGirl = false

-- set the initial x and y position of myImage
purpleGirl.x = 300
purpleGirl.y = 375

yellowGirl.x = 700
yellowGirl.y = 375

blueGirl.x = 500
blueGirl.y = 275


-- Function: YellowGirlListener
-- Input: touch Listener
-- Output: none
-- Description: when blue girl is touched, move her
local function BlueGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedYellowGirl == false) then
			alreadyTouchedPurpleGirl = true
		end
	end
	
	if ( (touch.phase == "moved") and (alreadyTouchedPurpleGirl == true) ) then
		purpleGirl.x = touch.x
		purpleGirl.y = touch.y
	end
	
	if (touch.phase == "ended") then
		alreadyTouchedPurpleGirl = false
		alreadyTouchedYellowGirl = false
	end	
end

-- add the respective listeners to each object
purpleGirl:addEventListener("touch", BlueGirlListener)	

----------------------------------------------------------------------------
----------------------------------------------------------------------------

local function YellowGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedPurpleGirl == false) then
			alreadyTouchedYellowGirl = true
		end
	end
	
	if ( (touch.phase == "moved") and (alreadyTouchedYellowGirl == true) ) then
		yellowGirl.x = touch.x
		yellowGirl.y = touch.y
	end
	
	if (touch.phase == "ended") then
		alreadyTouchedYellowGirl = false
		alreadyTouchedPurpleGirl = false
	end	
end

-- add the respective listeners to each object
yellowGirl:addEventListener("touch", YellowGirlListener)	

----------------------------------------------------------------------------
----------------------------------------------------------------------------

local function PurpleGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedBlueGirl == false) then
			alreadyTouchedBlueGirl = true
		end
	end
	
	if ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
		blueGirl.x = touch.x
		blueGirl.y = touch.y
	end
	
	if (touch.phase == "ended") then
		alreadyTouchedYellowGirl = false
		alreadyTouchedPurpleGirl = false
		alreadyTouchedBlueGirl = false
	end	
end

-- add the respective listeners to each object
blueGirl:addEventListener("touch", PurpleGirlListener)	
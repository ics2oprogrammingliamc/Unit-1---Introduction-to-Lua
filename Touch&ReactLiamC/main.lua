-- Title: TouchAndReact
-- Name: Your Name
-- Course: ICS2O/3C
-- This program does something when I click on the button.

-- set background color
display.setDefault ("background", 1, 0, 1)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

local explosionSound = audio.loadSound( "Sounds/explosion.mp3" )
local explosionSoundChannel

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/playButton.png", 200, 200)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/playButton - Copy.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- cr3eate text object, set itsd position and make it visible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

-- create function
local function blueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true 
		explosionSoundChannel = audio.play(explosionSound)

	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		redButton.isVisible = false
	end
end


local function redButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = false
		redButton.isVisible = true
		redButton.isVisible = true
	end
end

blueButton:addEventListener("touch", blueButtonListener)
redButton:addEventListener("touch", redButtonListener)
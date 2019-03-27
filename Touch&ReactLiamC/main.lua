-- Title: TouchAndReact
-- Name: Your Name
-- Course: ICS2O/3C
-- This program does something when I click on the button.

-- set background color
display.setDefault ("background", 1, 0, 1)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/playButton.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/playButton.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
blueButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentHeight/3
textObject.y = display.contentWidth/2
textObject:setTextColor(0,0,0)
textObject.isVisible = false

local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end
end

blueButton:addEventListener("touch", BlueButtonListener)

local function RedButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then
		blueButton.isVisible = false
		redButton.isVisible = true
		textObject.isVisible = true
	end
end

redButton:addEventListener("touch", RedButtonListener)
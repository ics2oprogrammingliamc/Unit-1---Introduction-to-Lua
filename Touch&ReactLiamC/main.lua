-- Title: TouchAndReact
-- Name: Your Name
-- Course: ICS2O/3C
-- This program does something when I click on the button.

-- set background color
display.setDefault ("background", 1, 0, 1)

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/playButton.png", 200, 200)

blueButton.x = 512
blueButton.y = 375
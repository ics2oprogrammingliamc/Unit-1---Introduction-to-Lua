-- Title: TouchAndDrag
-- Name: Liam Csiffary
-- Course: ICS2O/3C
-- This program displays images that react to a person's mouse.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Variables.
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local purpleGirl = display.newImageRect("Images/girl1.png", 150,150)
local purpleGirlWidth = purpleGirl.width
local purpleGirlHeight = purpleGirl.height

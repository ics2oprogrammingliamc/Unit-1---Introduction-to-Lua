-- Title: MovingImages
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays images that move across the screen

--hide status bar
display.setStatusBar(display.HiddenStatusBar)

--global Variables
local scrollSpeed = 3

-- background image with width and height
local backgroundImages = display.newImageRect("Images/background.png", 2048, 1536)

-- chsaracter image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)
-- set the image to be transparent
beetleship.alpha = 0

--set the initial x and y position of beetleship
beetleship.x = 0
beetleship.y = display.contentHeight/3

-- function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Descrpition: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so the it fades out
	beetleship.alpha = beetleship.alpha + .004
	-- make the beetleship grow
	beetleship:scale(1.001,1.001)
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- Next image---------------------------------------------------------------------------
-- set octopus scroll speed
local scrollSpeed = -2

-- chsaracter image with width and height
local octopus = display.newImageRect("Images/Backwards_octopus.png", 250, 250)

-- set the image to be transparent
octopus.alpha = 1

--set the initial x and y position of octopus
octopus.x = 1000
octopus.y = display.contentHeight/2

-- function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Descrpition: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
	-- add the scroll speed to the x-value of the ship
	octopus.x = octopus.x + scrollSpeed
	-- change the transparency of the ship every time it moves so the it fades out
	octopus.alpha = octopus.alpha - .0025

	-- shrink the octopus
	octopus:scale(0.99755,0.99755)
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)
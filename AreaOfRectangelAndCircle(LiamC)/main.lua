-- Title: AreaOfRectangleAndCircle
-- Name: Liam Csiffary
-- Course: ICS2O/3C
-- This program displays a rectangle and shows its area


-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 300
local heightOfRectangle = 200
local areaOfRectangle 
local radiusOfCircle = 25
local myCircle
local pi = 3.14
local areaOfCircle
local areaText2
-- set background color of my screen.remember that colors are between 0 and 1
display.setDefault("background", 255/255, 0/255, 100/255)

-- removes status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the circle
myCircle = display.newCircle(0, 0, radiusOfCircle, radiusOfCircle)

--anchor the circle at the bottom right of the page and set its (x,y) position 
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 600
myCircle.y = 140

-- set the width of the border
myCircle.strokeWidth = 15

-- set the color of the circle and the border
myCircle:setFillColor(1,1,1)
myCircle:setStrokeColor(0,0,0)

-- calculate the area of the circle
areaOfCircle = radiusOfCircle * radiusOfCircle * pi

-- write the area on the screen.
areaText2 = display.newText("the area of a circle with a radius of \n" ..
	radiusOfCircle .. " is " ..
	areaOfCircle .. " pixels².", 0, 0, arial, textSize)

-- move text to readable position
areaText2.anchorX = 0
areaText2.anchorY = 0
areaText2.x = 25
areaText2.y = 550

--draw the rectangle that is half the width and height of the screen size.S
myRectangle=display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 175
myRectangle.y = 150     

-- set the width of the borber    
myRectangle.strokeWidth = 10

--set the color of the rectangle
myRectangle:setFillColor(0, 1, 1)

-- set the color of the border
myRectangle:setStrokeColor(0, 0, 0)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. take into account the size of the font when positioning it on the screen
areaText = display.newText("the area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of " .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels².", 0, 0, arial, textSize)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 21
areaText.y = display.contentHeight/2

-- set the color of the newText
areaText:setTextColor(0, 1, 0)
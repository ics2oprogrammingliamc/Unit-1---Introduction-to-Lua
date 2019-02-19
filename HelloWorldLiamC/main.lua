-- Title: HelloWorld
-- Name: Liam Csiffary
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.

-- print "Hello, World" to the command terminal
print ("***Helloooooooooooooo!")

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background color
display.setDefault("background", 124/255, 249/255, 199/255)

--create a local variable
local textObject

--displays text on the screen at position x = 500 and y = 350 with
-- default font style and font size of 50
textObject = display.newText("Hello, Ms Raffin!", 500, 350, nil, 55)

-- sets the color of the text
textObject:setTextColor(155/255, 42/255, 198/255)

--creat another local var
local textObjectSignature

-- says my nam e on the iPad air
textObjectSignature = display.newText("Hello, my name is liam C.This program is just a prictice!", 500, 400, nil, 25)

--set color of textObjectSignature to red
textObjectSignature:setTextColor(255/255, 0/255, 0/255)

-- print "Hi testing" to command terminal
print ("Hi testing")

-- create another var
local texter

-- says a new text on iPad at x = 500 y = 450, nil, 25
texter = display.newText("I love coding!", 500, 450, nil, 25)

--set color of texter to blue
texter:setTextColor(100/255, 0/255, 255/255)

-- print "This is awesome!" to command terminal
print("This is awesome!") 


-- Title: MathFun
-- Name: Your Name
-- Course: ICS2O/3C
-- This program frces you to add/subtract/divide/multiply and get the correct answer
------------------------------------------------------------------------------------------------------------

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background color
display.setDefault("background", 0, 1, 0)

--------------------------------------------------------------------------------
-- LOCAL VARIABLES
--------------------------------------------------------------------------------------------------------

-- create local vars
local questionObject
local correctObject
local numericFields
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectObject
local randomOperator
local rounder

-----------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate a random number between 1-2
	randomOperator = math.random(4, 4)
	
	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then
-- generate 2 random numbers between 0-10 then add them
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	-- calculate the correct answer
	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise do subtraction
	elseif (randomOperator == 2) then
		-- generate 2 random numbers between 0-10 then add them
		randomNumber1 = math.random(5, 10)
		randomNumber2 = math.random(0, 5)
		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create question in text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
		elseif (randomOperator == 3) then
			-- generate 2 random numbers between 0-10 then add them
			randomNumber1 = math.random(0, 10)
			randomNumber2 = math.random(0, 10)
			-- calculate the answer
			correctAnswer = randomNumber1 * randomNumber2

			-- create question in text object
			questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. " = "	elseif (randomOperator == 3) then
			
			elseif (randomOperator == 4) then
			-- generate 2 random numbers between 0-10 then add them
			randomNumber1 = math.random(0, 10)
			randomNumber2 = math.random(0, 10)
			-- calculate the answer
			correctAnswer = randomNumber1 / randomNumber2
			print( math.round( correctAnswer ) )
			correctAnswer = math.round( correctAnswer )

			-- create question in text object
			questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = "

	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function Hideincorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener( event )

	-- User begins editing "numbericFeild"
	if ( event.phase == "began" ) then

		--clear text feild
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set the user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			timer.performWithDelay(2000, HideCorrect)
		elseif event.phase == "submitted" then
			if (userAnswer +- correctAnswer) then
				correctObject.isVisible = false
				incorrectObject.isVisible = true
				timer.performWithDelay(2000, Hideincorrect)
			end
		end
	end
end

---------------------------------------------------------------------------------------------------
-- OBJECT CREATION
-------------------------------------------------------------------------------------------------

-- displays a qu3estion and sets the color 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(1,0,0)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentHeight*2/3, display.contentWidth/2, nil, 50 )
correctObject:setTextColor(0,0,1)
correctObject.isVisible = false

-- create incorect object make it invisible
incorrectObject = display.newText( "Incorrect!", display.contentHeight*2/3, display.contentWidth/2, nil, 50 )
incorrectObject:setTextColor(1,0,0)
incorrectObject.isVisible = false

--create numeric feild
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80 )
numericField.inputType = "number"

-- add the event listener fr the numeric field
numericField:addEventListener( "userInput", NumericFieldListener)

--------------------------------------------------------------
-- FUNCTION CALLS
---------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
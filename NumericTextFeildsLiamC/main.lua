-- Title: NumericTextFields
-- Name: Liam Csiffary 
-- Course: ICS2O/3C
-- This program displays a math question and asks the user to answer in a numeric textfeild.
-- terminal.
------------------------------------------------------------------------------------------------------------

-- hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background color
display.setDefault("background", 124/255, 1, 200/255)

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

-----------------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
------------------------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between 0-10 then add them
	randomNumber1 = math.random(0, 10)
	randomNumber2 = math.random(0, 10)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

end

local function HideCorrect()
	correctObject.isVisible = false
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
repeat
	set num to text returned of (display dialog "How many times should a picture be taken?" default answer "") -- Ask for number of pictures
	do shell script "open " & POSIX path of (path to resource "Image.jpg")
	display dialog "Ready?"
	try
		tell application "Preview" to quit
	end try
	set Thepic to "~/Documents/Zoom.jpg" -- This can be changed to wherever you want the final picture stored
	do shell script "screencapture " & Thepic
	try
		repeat num times
			tell application "Preview" to quit
			do shell script "open " & Thepic
			delay 1
			do shell script "screencapture " & Thepic
		end repeat
	on error
		display dialog "Not a number!"
	end try
	display dialog "Again?"
	if button returned of result is "Cancel" then exit repeat
end repeat

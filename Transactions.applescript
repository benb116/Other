set Dte to text returned of (display dialog "Please enter the date of the transaction." default answer "")
set mon to text returned of (display dialog "Please enter the amount of the transaction." default answer "")
set des to text returned of (display dialog "Please enter the description of the transaction." default answer "")
do shell script "open /Users/Ben/Dropbox/Financial/2013.xlsx"
tell application "Microsoft Excel"
	set wrkbk to active workbook
	tell worksheet "overview"
		repeat with x from 3 to 50
			set jnam to "J" & x
			set Lnam to "L" & x
			if value of range jnam is equal to ("") then
				set value of range (jnam & ":" & Lnam as string) to {Dte, mon, des}
				exit repeat
			end if
		end repeat
	end tell
	save wrkbk
	quit
end tell

do shell script "open /Users/Ben/Dropbox/Financial/2013.xlsx"
set cash to text returned of (display dialog "Enter the amount of cash." default answer "")
set catm to (do shell script "curl http://www.google.com/finance?q=catm | grep 'ref_690507_l' | cut -d '>' -f 2 | cut -d '<' -f 1") as number
set tan to (do shell script "curl http://www.google.com/finance?q=tan | grep 'ref_723029_l' | cut -d '>' -f 2 | cut -d '<' -f 1") as number
set vtsmx to (do shell script "curl http://www.google.com/finance?q=vtsmx | grep '<span class=pr>'  | cut -d '>' -f 2 | cut -d '<' -f 1") as number
tell application "Microsoft Excel"
	set wrkbk to active workbook
	tell worksheet "overview"
		set value of range "F16" to ((catm * 10) as text)
		set value of range "E16" to ((vtsmx * 46) as text)
		set value of range "D16" to ((tan * 1.5) as text)
		set value of range "B16" to (cash as text)
	end tell
	tell worksheet "Investments"
		set Dte to (current date)
		set newdte to (do shell script "echo " & Dte & " | cut -d ' ' -f 1-4") as text
		set usedte to (do shell script "date '+%m/%d/%Y' | cut -d '/' -f 2")
		if usedte = "06" then
			repeat with x from 1 to 15
				set Anam to "A" & x
				if (value of range Anam as text) contains newdte then
					set newx to x
					set Bnam to "B" & newx
					set Gnam to "G" & newx
					set Lnam to "L" & newx
					set value of range Bnam to tan
					set value of range Gnam to vtsmx
					set value of range Lnam to catm
					exit repeat
				end if
			end repeat
		end if
	end tell
	save wrkbk
end tell

do shell script "open /Users/Ben/Dropbox/Financial/2013.xlsx"
repeat
	tell application "Microsoft Excel"
		set wrkbk to active workbook
		tell worksheet "overview"
			set cval to value of range "B16"
		end tell
		exit repeat
	end tell
end repeat
set cash to text returned of (display dialog "Enter the amount of cash." default answer cval)
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
		set newdte to (do shell script "echo " & (current date) & " | cut -d ' ' -f 1-4") as text
		if (do shell script "date '+%m/%d/%Y' | cut -d '/' -f 2") = "01" then
			repeat with x from 1 to 15
				if (value of range ("A" & x) as text) contains newdte then
					set value of range ("B" & x) to tan
					set value of range ("G" & x) to vtsmx
					set value of range ("L" & x) to catm
					exit repeat
				end if
			end repeat
		end if
	end tell
	save wrkbk
end tell
do shell script "open /Users/Ben/Dropbox/Financial/2015.xlsx"
set tan to (do shell script "curl http://www.google.com/finance?q=tan | grep 'ref_723029_l' | cut -d '>' -f 2 | cut -d '<' -f 1") as number
set vtsmx to (do shell script "curl http://www.google.com/finance?q=vtsmx | grep '<span class=pr>'  | cut -d '>' -f 2 | cut -d '<' -f 1") as number
set vttsx to (do shell script "curl http://www.google.com/finance?q=vttsx | grep '<span class=pr>'  | cut -d '>' -f 2 | cut -d '<' -f 1") as number
set orb to first paragraph of (do shell script "curl http://dev.markitondemand.com/Api/v2/Quote/jsonp?symbol=ORB | cut -d ':' -f 5 | cut -d ',' -f 1") as number
set brkb to first paragraph of (do shell script "curl http://dev.markitondemand.com/Api/v2/Quote/jsonp?symbol=BRK.B | cut -d ':' -f 5 | cut -d ',' -f 1") as number
set v to first paragraph of (do shell script "curl http://dev.markitondemand.com/Api/v2/Quote/jsonp?symbol=V | cut -d ':' -f 5 | cut -d ',' -f 1") as number
repeat
	tell application "Microsoft Excel"
		delay 0.5
		set wrkbk to active workbook
		exit repeat
	end tell
end repeat
tell application "Microsoft Excel"
	set wrkbk to active workbook
	tell worksheet "Overview"
		set value of range "E16" to ((vtsmx * 91.611) as text)
		set value of range "F16" to ((tan * 1.5) as text)
		set value of range "G16" to ((brkb * 3) as text)
		set value of range "H16" to ((orb * 8) as text)
		set value of range "I16" to ((v * 2) as text)
		set value of range "J16" to ((vttsx * 36.114) as text)
		set newdte to (do shell script "echo " & (current date) & " | cut -d ' ' -f 1-4") as text
		if (do shell script "date '+%m/%d/%Y' | cut -d '/' -f 2") = "01" then
			repeat with x from 3 to 15
				if (value of range ("A" & x) as text) contains newdte then
					set value of range ("E" & x) to ((vtsmx * 91.611) as text)
					set value of range ("F" & x) to ((tan * 1.5) as text)
					set value of range ("G" & x) to ((brkb * 3) as text)
					set value of range ("H" & x) to ((orb * 8) as text)
					set value of range ("I" & x) to ((v * 2) as text)
					set value of range ("J" & x) to ((vttsx * 36.114) as text)
					exit repeat
				end if
			end repeat
		end if
	end tell
	save wrkbk
end tell
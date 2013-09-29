global newc, isactive, needslink, codez, thelink

log "Checking..."
set oldc to ""
repeat
	delay 1
	try
		if isactivecode() then set codez to (do shell script "curl sbcodez.com | grep 'class=\"code\"' | cut -d '>' -f 3 | cut -d '<' -f 1")
		set newc to paragraph 1 of codez
		if newc is not equal to oldc then
			log "New Code - " & newc
			set oldc to newc
			if newc contains "XXXX" then
				set needslink to true
				getlink()
			else
				set needslink to false
			end if
			calctime()
			displaycode(newc, timemsg, isactive, needslink)
		end if
	end try
end repeat

on isactivecode()
	set check to (do shell script "curl sbcodez.com/activecodes/sbcodez.html | grep 'sbcodez' | cut -d '>' -f 5 | cut -d '<' -f 1")
	if check is "" then
		return false
	else
		return true
	end if
end isactivecode

on getlink()
	set thelink to characters 1 thru -2 of (first paragraph of (do shell script "curl sbcodez.com | grep 'Instructions:' | cut -d '/' -f 3-6 | grep 'blog' | cut -d '>' -f 1")) as string
	set thelink to "http://" & thelink
end getlink

on calctime()
	
	try
		set keyword to first paragraph of (do shell script "curl sbcodez.com | grep '<span>Expires:' | cut -d '[' -f 2 | cut -d ']' -f 1")
		set fulltime to paragraph 2 of (do shell script "curl sbcodez.com | grep '" & quoted form of keyword & "'")
		set timeex to (do shell script "echo " & quoted form of fulltime & " | cut -d ' ' -f 3-4")
		set hr to (first word of timeex as number) + 3
		if hr is greater than 12 then set hr to hr - 12
		set newhr to (hr as text)
		set exptime to newhr & ":" & (second word of timeex)
		set mydate to current date
		set mytime to time of mydate
		set amorpm to (third word of timeex)
		set newdatetext to (do shell script "echo " & mydate & " | cut -d ' ' -f 1-4") & " " & exptime & ":00 " & amorpm
		set newdate to date newdatetext
		set newtime to time of newdate
		set timeleft to newtime - mytime
		set isactive to true
		set hrsleft to ((timeleft / 3600) as text) as integer
		set minleft to (((timeleft - (hrsleft * 3600)) / 60) as text) as integer
		set secleft to (timeleft - (hrsleft * 3600) - (minleft * 60)) as integer
		if secleft is less than 0 then
			set minleft to minleft - 1
			set secleft to secleft + 60
		end if
		if minleft is less than 0 then
			set hrsleft to hrsleft - 1
			set minleft to minleft + 60
		end if
		if minleft is less than 10 then set minleft to 0 & minleft
		if secleft is less than 10 then set secleft to 0 & secleft
		set timemsg to "This swagcode expires in " & (hrsleft as text) & ":" & (minleft as text) & ":" & (secleft as text) & "."
	on error
		set timemsg to ""
	end try
end calctime

on displaycode(newc, timemsg, isactive, needslink)
	
	if isactive = true then
		if needslink = false then
			set buttontwo to "Open Swagbucks.com"
		else if needslink = true then
			set buttontwo to "Get full code"
		end if
		set quest to (display dialog timemsg default answer newc with title "Active swag code" buttons {"See more", buttontwo, "Dismiss"} default button 2)
	else
		set quest to (display dialog "There are currently no active swag codes" with title "Swagcode Checker" buttons {"See more", "Open Swagbucks.com", "Dismiss"} default button 3)
	end if
	
	if button returned of quest = "See more" then
		set newq to button returned of (display dialog "" default answer codez with title "Most recent swag codes" buttons {"Swagbucks.com", "Sbcodez.com", "Dismiss"} default button 1) -- Show previous codes
		if newq is not equal to "Dismiss" then
			set pg to "http://" & (newq as text)
			openurl((pg))
		end if
	end if
	
	if button returned of quest = "Open Swagbucks.com" then
		openurl("http://swagbucks.com/account/summary")
		set the clipboard to newc
	end if
	
	if button returned of quest = "Get full code" then
		openurl(thelink)
	end if
	
end displaycode
c
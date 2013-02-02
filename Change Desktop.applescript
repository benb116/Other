set li to {}
set fld to (POSIX path of "/Users/Ben/Dropbox/Pictures/Desktops/")
set nms to (paragraphs of (do shell script "ls " & fld))
set co to (count of nms)
repeat with N from 1 to co
	set li to li & N
end repeat

display dialog "Ready?" default button "OK"

repeat with y from 18 to 21
	try
		
		set rn to (random number from 1 to (count of li))
		set ch to (item rn of li)
		if rn is not equal to 1 and rn is not equal to (count of li) then
			set li to (items 1 thru (rn - 1) of li & items (rn + 1) thru -1 of li)
		else if rn = 1 then
			set li to (items 2 thru (count of li) of li)
		else
			set li to (items 1 through (rn - 1) of li)
		end if
		
		
		
		set fi to (item ch of nms)
		tell application "Finder"
			set fld to "Mac:Users:Ben:Dropbox:Pictures:Desktops:"
			set np to (fld & fi)
		end tell
		
		tell application "System Events" to key code y using {option down}
		delay 0.5
		tell application "Finder" to set desktop picture to np
		delay 0.5
	end try
end repeat

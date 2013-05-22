global fld, nms, co
set fld to (POSIX path of "/Users/Ben/Dropbox/Pictures/Desktops/")
set nms to (paragraphs of (do shell script "ls " & fld))
set co to (count of nms)
tell application "System Events"
	set theds to (get display name of every desktop)
end tell
set prev to {}
repeat with theD in theds
	set end of prev to prevdesk(theD)
end repeat
set new to {}
repeat
	set d1 to selectd()
	if prev does not contain d1 and new does not contain d1 then
		set end of new to d1
		if (count of new) = (count of theds) then exit repeat
	end if
end repeat
repeat with y from 1 to (count of theds)
	setd((item y of new), (item y of theds))
end repeat

on prevdesk(theD)
	tell application "System Events"
		tell (every desktop whose display name is theD)
			(get picture) as text
		end tell
	end tell
end prevdesk

on selectd()
	set rn to (random number from 1 to co)
	set ch to (item rn of nms)
	tell application "Finder"
		set fld to "Mac:Users:Ben:Dropbox:Pictures:Desktops:"
		set np to (fld & ch)
	end tell
	return np
end selectd

on setd(d, theD)
	tell application "System Events"
		tell (every desktop whose display name is theD)
			set picture to file d
		end tell
	end tell
end setd
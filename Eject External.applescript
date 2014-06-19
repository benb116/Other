set drives to paragraphs of (do shell script "ls /Volumes")
try
	tell application "Finder"
		repeat with drive in drives
			log drive
			if drive is not "Mac" and drive is not "Ben" then
				eject disk drive
			end if
		end repeat
	end tell
	display alert "Drive unmounted." giving up after 1
end try

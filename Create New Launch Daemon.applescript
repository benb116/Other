set nameof to text returned of (display dialog "Enter the name of the LaunchAgent" default answer "com..plist")
if nameof does not end with ".plist" then
	set nameof to nameof & ".plist"
end if
set program to (choose file)
tell application "Finder"
	set thetype to file type of program
end tell
if thetype = "APPL" then
	set programdir to (POSIX path of program) & "Contents/MacOS/"
	set programname to first paragraph of (do shell script "ls " & quoted form of programdir)
	set programpath to programdir & programname
else if thetype = "osas" then
	set programpath to "-array 'osascript' '" & POSIX path of program
else
	set programpath to (POSIX path of program)
end if

set q1 to (display dialog "Run at Load?" buttons {"No", "Yes"} default button 2)

set q2 to (display dialog "Run Interval (number of seconds)" default answer "" buttons {"Only Once", "OK"} default button 2)


set agentpath to "~/Library/LaunchAgents/" & nameof
do shell script "touch " & agentpath
do shell script "defaults write " & agentpath & " 'Label' '" & nameof & "'"
do shell script "defaults write " & agentpath & " 'Program' '" & programpath & "'"
if button returned of q1 = "Yes" then do shell script "defaults write " & agentpath & " 'RunAtLoad' -bool true"
if button returned of q2 = "OK" and text returned of q2 is not equal to "" then
	do shell script "defaults write " & agentpath & " 'StartInterval' -int '" & text returned of q2 & "'"
end if
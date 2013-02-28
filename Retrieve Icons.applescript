set apppath to (POSIX path of (choose file default location "/Applications"))
set appname to (do shell script "echo " & apppath & " | cut -d '/' -f 3 | cut -d '.' -f 1")
set resourcePath to quoted form of (apppath & "/Contents/Resources/")
set allicns to (do shell script "ls " & resourcePath & " | grep 'icns'")
set listoficns to (paragraphs of allicns)
if (count of listoficns) is not equal to 1 then
	set theicon to (choose from list listoficns with prompt "Which icon would you like to retrieve?") as text
else
	set theicon to (item 1 of listoficns) as text
end if
set iconpath to resourcePath & theicon
set copylocation to (POSIX path of (path to desktop))
try
	do shell script "cp " & iconpath & " " & copylocation
	do shell script "mv " & copylocation & theicon & " " & copylocation & appname & ".icns"
end try
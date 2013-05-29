set apppaths to (choose file of type ("app") default location "/Applications" with multiple selections allowed)
repeat with singleapp in apppaths
	try
		tell application "Finder"
			set appname to name of singleapp
			set appname to quoted form of (do shell script "echo " & appname & " | cut -d '.' -f 1")
		end tell
		set apppath to POSIX path of singleapp
		set quotedappname to quoted form of appname
		set resourcePath to quoted form of (apppath & "Contents/Resources/")
		set allicns to (do shell script "ls " & resourcePath & " | grep 'icns'")
		set listoficns to (paragraphs of allicns)
		
		set theicon to ""
		if (count of listoficns) is not equal to 1 then
			set possiblenames to {"icon.icns", "app.icns", "appicon.icns", appname & ".icns"}
			repeat with possibleicon in listoficns
				if possiblenames contains possibleicon then
					set theicon to possibleicon as text
					exit repeat
				end if
			end repeat
		else
			set theicon to (item 1 of listoficns) as text
		end if
		if theicon = "" then
			set definetext to quoted form of (POSIX path of (path to me)) & "Contents/Resources/appicon.txt"
			do shell script "touch " & definetext
			set theicon to (do shell script "cat " & definetext & " | grep " & quotedappname & " | cut -d ':' -f 2")
			if theicon = "" then
				set theq to (choose from list listoficns with prompt "Which icon would you like to retrieve for " & appname & "?") as text
				if theq is "false" then
					error
				end if
				set theicon to theq as text
				do shell script "echo " & appname & " : " & theicon & " >> " & definetext
			end if
		end if
		log theicon
		set iconpath to resourcePath & theicon
		if (count of apppaths) is greater than 1 then
			set iconfolder to "~/Desktop/Icons/"
			try
				do shell script "mkdir " & iconfolder
			end try
		else
			set iconfolder to "~/Desktop/"
		end if
		try
			do shell script "cp " & iconpath & " " & iconfolder
			do shell script "mv " & iconfolder & theicon & " " & iconfolder & quotedappname & ".icns"
		end try
	on error
		display dialog "Could not get " & appname & "'s icon" buttons {"Quit", "Continue"} default button 2
		if button returned of result = "Quit" then exit repeat
	end try
end repeat
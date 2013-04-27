set oldscriptable to ""
repeat
	delay 1
	set fulltext to (do shell script "curl http://benbern.dyndns.info/pushnoti/pushnoti.html")
	set pars to paragraphs of fulltext
	repeat with x from 1 to (count of pars)
		if (item x of pars) contains "div" then
			set y to x
			exit repeat
		end if
	end repeat
	set newscriptable to paragraphs (y + 1) thru (y + 4) of fulltext
	if newscriptable is not equal to oldscriptable then
		set oldscriptable to newscriptable
		set tit to (do shell script "echo " & quoted form of (item 1 of newscriptable) & " | cut -d '>' -f 2 | cut -d '<' -f 1")
		set sub to (do shell script "echo " & quoted form of (item 2 of newscriptable) & " | cut -d '>' -f 2 | cut -d '<' -f 1")
		set msg to (do shell script "echo " & quoted form of (item 3 of newscriptable) & " | cut -d '>' -f 2 | cut -d '<' -f 1")
		set link to (do shell script "echo " & quoted form of (item 4 of newscriptable) & " | cut -d '>' -f 2 | cut -d '<' -f 1")
		
		do shell script "terminal-notifier -title " & quoted form of tit & " -subtitle " & quoted form of sub & " -message " & quoted form of msg & " -open " & quoted form of ("http://" & link)
	end if
end repeat
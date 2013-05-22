set oldscriptable to ""
repeat
	delay 1
	set fulltext to (do shell script "curl http://benbern.dyndns.info/pushnoti/pushnoti.txt")
	set pars to paragraphs of fulltext
	try
		set newscriptable to paragraphs 1 thru 4 of fulltext
		if newscriptable is not equal to oldscriptable then
			set oldscriptable to newscriptable
			set tit to (item 1 of newscriptable)
			set sub to (item 2 of newscriptable)
			set msg to (item 3 of newscriptable)
			set link to (item 4 of newscriptable)
			do shell script "terminal-notifier -title " & quoted form of tit & " -subtitle " & quoted form of sub & " -message " & quoted form of msg & " -open " & quoted form of ("http://" & link)
		end if
	end try
end repeat
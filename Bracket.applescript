set newlist to {"0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0"}
repeat with yr from 1988 to 2012
	set fulltext to (do shell script "curl http://www.cbssports.com/collegebasketball/ncaa-tournament/history/yearbyyear/" & yr) as string
	set f to 0
	repeat with d from 1 to (count of paragraphs in fulltext)
		if paragraph d of fulltext contains "First Round" then
			set goodt to (paragraphs d through (d + 100) of fulltext)
			set f to 1
		end if
	end repeat
	if f = 0 then
		repeat with d from 1 to (count of paragraphs in fulltext)
			if paragraph d of fulltext contains "Second Round" then
				set goodt to (paragraphs d through (d + 100) of fulltext)
			end if
		end repeat
	end if
	repeat with e from 1 to (count of goodt)
		if (item e of goodt as text) contains "No." then
			try
				do shell script "echo '" & (item e of goodt as text) & "' >> " & (POSIX path of "/Users/Ben/Desktop/Brackets/" & yr & ".txt")
				
			end try
		end if
	end repeat
	
	set thefile to (POSIX path of "/Users/Ben/Desktop/Brackets/" & yr & ".txt")
	set prer to (do shell script "cat " & thefile & " | cut -d '.' -f 2 | cut -d ',' -f 1 | cut -d ' ' -f 2")
	set round1 to (paragraphs of prer)
	set new1 to {} as list
	repeat with x from 1 to 16
		set val to 0
		repeat with i from 1 to (count of round1)
			if item i of round1 is "" & x & "" then
				set val to val + 1
			end if
		end repeat
		set new1 to new1 & val as list
	end repeat
	repeat with i from 1 to (count of new1)
		set item i of newlist to ((item i of newlist as string) + (item i of new1 as string))
	end repeat
end repeat
set finallist to {}
repeat with g from 1 to (count of newlist)
	set finallist to finallist & (((item g of newlist) / 96) * 100)
end repeat
repeat with h from 1 to (count of finallist)
	set item h of finallist to (round ((item h of finallist) * 100) / 100)
end repeat
finallist
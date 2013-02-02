repeat
	set A to (random number from 1 to 6) as text
	set B to (random number from 1 to 6) as text
	if A = B then
		set prompt to (display dialog "Doubles! " & A & " and " & B & " = " & A + B buttons ["Quit", "Again"] default button 2)
		if button returned of prompt = "Quit" then exit repeat
	else
		set prompt to (display dialog "" & A + B & "" buttons ["Quit", "Again"] default button 2)
		if button returned of prompt = "Quit" then exit repeat
	end if
end repeat
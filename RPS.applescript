set X to 0
set Y to 0
repeat
	set pick to (display dialog "Choose one." buttons {"Rock", "Paper", "Scissors"})
	if button returned of pick = "Rock" then set p to 1
	if button returned of pick = "Paper" then set p to 2
	if button returned of pick = "Scissors" then set p to 3
	set q to (random number from 1 to 3)
	if p = 1 and q = 1 then
		display dialog "Tie! Your score is " & X & " out of " & Y & ""
	end if
	
	if p = 1 and q = 2 then
		set Y to Y + 1
		display dialog "Lose! Your score is " & X & " out of " & Y & ""
	end if
	
	if p = 1 and q = 3 then
		set Y to Y + 1
		set X to X + 1
		display dialog "Win! Your score is " & X & " out of " & Y & ""
	end if
	
	if p = 2 and q = 1 then
		set Y to Y + 1
		set X to X + 1
		display dialog "Win! Your score is " & X & " out of " & Y & ""
	end if
	
	if p = 2 and q = 2 then display dialog "Tie! Your score is " & X & " out of " & Y & ""
	
	if p = 2 and q = 3 then
		set Y to Y + 1
		display dialog "Lose! Your score is " & X & " out of " & Y & ""
	end if
	
	if p = 3 and q = 1 then
		set Y to Y + 1
		display dialog "Lose! Your score is " & X & " out of " & Y & ""
	end if
	
	if p = 3 and q = 2 then
		set Y to Y + 1
		set X to X + 1
		display dialog "Win! Your score is " & X & " out of " & Y & ""
		
	end if
	
	if p = 3 and q = 3 then display dialog "Tie! Your score is " & X & " out of " & Y & ""
end repeat
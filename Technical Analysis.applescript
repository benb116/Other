repeat
	set sym to text returned of (display dialog "Enter the symbol to see Technical Analysis" default button 2 default answer "")
	if sym is not equal to "" then exit repeat
	if sym = "" then display dialog "Please enter a symbol."
end repeat
set ma to (choose from list {"20", "50", "100"} with prompt "Choose MA:" OK button name "Next" cancel button name "Quit" default items "50")
if ma = false then quit
set yr to (choose from list {"1d", "5d", "3m", "6m", "1y", "2y", "5y"} with prompt "Choose time range:" OK button name "Next" cancel button name "Quit" default items "1y")
if yr = false then quit
tell application "Google Chrome"
	activate
	try
		make new tab at end of tabs of window 1
	on error
		make new window
	end try
	set URL of last tab of window 1 to "http://finance.yahoo.com/q/ta?s=" & sym & "&t=" & yr & "&l=off&z=l&q=l&p=m" & ma & "%2Ce" & ma & "&a=&c="
end tell
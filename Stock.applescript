repeat
	set sym to text returned of (display dialog "Enter symbol:" default button 2 default answer "")
	if sym is not equal to "" then exit repeat
	if sym = "" then display dialog "Please enter a symbol."
end repeat
set ma to (choose from list {"20", "50", "100"} with prompt "Technical Analysis - Choose MA:" OK button name "Next" cancel button name "Quit" default items "50")
if ma = false then quit
set yr to (choose from list {"1d", "5d", "3m", "6m", "1y", "2y", "5y"} with prompt "Technical Analysis - Choose time range:" OK button name "Next" cancel button name "Quit" default items "1y")
if yr = false then quit
tell application "Google Chrome"
	activate
	try
		make new window
		set URL of last tab of front window to "http://finance.yahoo.com/q?s=" & sym & "&ql=1"
		make new tab at end of tabs of front window
		set URL of last tab of window 1 to "http://finance.yahoo.com/q/ta?s=" & sym & "&t=" & yr & "&l=off&z=l&q=l&p=m" & ma & "%2Ce" & ma & "&a=&c="
		make new tab at end of tabs of front window
		set URL of last tab of window 1 to "http://finance.yahoo.com/q/ks?s=" & sym & "+Key+Statistics"
		make new tab at end of tabs of front window
		set URL of last tab of window 1 to "http://finance.yahoo.com/q/co?s=" & sym & "+Competitors"
		make new tab at end of tabs of front window
		set URL of last tab of window 1 to "http://finance.yahoo.com/q/ao?s=" & sym & "+Analyst+Opinion"
		make new tab at end of tabs of front window
		set URL of last tab of window 1 to "http://finance.yahoo.com/q/ae?s=" & sym & "+Analyst+Estimates"
		make new tab at end of tabs of front window
		set URL of last tab of window 1 to "http://finance.yahoo.com/q/it?s=" & sym & "+Insider+Transactions"
		make new tab at front of tabs of front window
		set URL of front tab of front window to "http://www.google.com/finance?hl=en&q=" & sym
	end try
end tell
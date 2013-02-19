repeat
	try
		set LANIP to (do shell script "ipconfig getifaddr en1") -- Get LAN IP
		exit repeat
	on error
		display dialog "Not connected. Try again?"
	end try
end repeat
try
	do shell script "curl http://checkip.dyndns.org | cut -d ':' -f 2 | cut -d '<' -f 1"
	set WANIP to (characters 2 through -1 of result) as text -- Get WAN IP
on error
	set WANIP to "Not connected to the internet"
end try

display dialog "WAN: " & WANIP & " - LAN: " & LANIP & "

You can copy the text below" with title "IP Address" default answer WANIP & " - " & LANIP

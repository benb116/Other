set thekeychain to "~/Library/Keychains/login.keychain"
do shell script "touch /Users/Ben/Desktop/pwd.txt"
set websites to paragraphs of (do shell script "security dump-keychain " & thekeychain & " | grep 'srvr' | cut -d '\"' -f 4")
repeat with sitename in websites
	try
		set acct to (do shell script "security find-internet-password -gs " & sitename & " | grep 'acct' | cut -d '\"' -f 4")
		if acct is not equal to "" then do shell script "security find-internet-password -gs " & sitename & " | grep 'password'"
	on error txt
		set pwd to (do shell script "echo " & txt & " | cut -d '\"' -f 2 | cut -d ' ' -f 2")
		
		if pwd is not equal to "command" then do shell script "echo " & sitename & " - " & acct & " " & pwd & " >> /Users/Ben/Desktop/pwd.txt"
	end try
end repeat
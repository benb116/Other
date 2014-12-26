set copyitems to paragraphs of (do shell script "ls /Library/Webserver/Documents")
repeat with copyitem in copyitems
	try
		do shell script "cp -rf /Library/Webserver/Documents/" & quoted form of copyitem & " /Users/Ben/Dropbox/Developer/benb116.github.io/"
	end try
end repeat


(*do shell script "rsync -va --delete /Library/Webserver/Documents/ /Users/Ben/Dropbox/Developer/benb116.github.io/"*)
(*sudo chmod -R a+rX /Library/WebServer/Document*)
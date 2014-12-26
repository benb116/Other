set prefix to "~/Library/Preferences/"
set backfiles to {"org.tynsoe.geeklet.shell.plist", "org.tynsoe.geektool3.plist", "org.tynsoe.GeekTool.plist"}
repeat with backfile in backfiles
	do shell script "cp -f " & prefix & backfile & " /Users/Ben/Dropbox/Developer/GeekTool/"
end repeat
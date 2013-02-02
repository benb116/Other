set toggleView to (do shell script "defaults read com.apple.finder AppleShowAllFiles")
if toggleView is "TRUE" then
	do shell script "defaults write com.apple.finder AppleShowAllFiles false"
end if
if toggleView is "FALSE" then
	do shell script "defaults write com.apple.finder AppleShowAllFiles true"
end if
delay 1
do shell script "killall Finder"
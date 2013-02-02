set toggleView to (do shell script "defaults read com.apple.Finder AppleShowAllFiles")
if toggleView is "Yes" then
	do shell script "defaults write com.apple.Finder AppleShowAllFiles NO"
end if
if toggleView is "NO" then
	do shell script "defaults write com.apple.Finder AppleShowAllFiles YES"
end if
do shell script "killall Finder"
set apppath to POSIX path of (choose file of type ("app") default location "/Users/Ben/Desktop")
set infile to quoted form of (apppath & "Contents/Info.plist")
do shell script "defaults write " & infile & " 'NSUIElement' '1'"

set apppath to POSIX path of (choose file of type ("app") default location "/Users/Ben/Desktop")
set infile to quoted form of (apppath & "Contents/Info.plist")
set pars to paragraphs of (do shell script "cat " & infile)
try
	do shell script "rm " & infile
end try
do shell script "touch " & infile
repeat with x from 1 to ((count of pars) - 2)
	do shell script "echo " & quoted form of (item x of pars) & " >> " & infile
end repeat
do shell script "echo '<key>NSUIElement</key>' >> " & infile
do shell script "echo '<string>1</string>' >> " & infile
do shell script "echo " & quoted form of (item -2 of pars) & " >> " & infile
do shell script "echo " & quoted form of (item -1 of pars) & " >> " & infile

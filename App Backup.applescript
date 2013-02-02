set apps to (do shell script "ls /applications | cut -d '.' -f 1")
set appt to "~/Dropbox/Save/Apps.txt"
do shell script "touch " & appt
do shell script "echo " & apps & " > " & appt
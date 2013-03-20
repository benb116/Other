#!/usr/bin/python
print "Thanks for using Ben's Matchmaking tool"
print ""
listofavailablegirls = []
listofavailableguys = []
newcouples = {}
print "Please enter the available girls in the grade. Enter 'done' when finished"
keepgoing = True
while keepgoing == True:
	newgirl = raw_input("Enter a girl's name:")
	if (newgirl == "done" or newgirl == "Done"):
		keepgoing = False
	else:
		listofavailablegirls.append(newgirl)
print "Please enter the available guys in the grade. Enter 'done' when finished"
keepgoing = True
while keepgoing == True:
	newguy = raw_input("Enter a guy's name:	")
	if (newguy == "done" or newguy == "Done"):
		keepgoing = False
	else:
		listofavailableguys.append(newguy)

print ""
print "Girls:"
print listofavailablegirls
print "Guys: "
print listofavailableguys
print ""
for female in listofavailablegirls:
	print "Find a date for " + female
	print "Available guys:"
	for male in listofavailableguys:
		print male
	choiceforfemale = raw_input("Who is " + female + " going to take?	")
	if choiceforfemale in listofavailableguys:
		for male in listofavailableguys:
			if choiceforfemale == male:
				newcouples[female] = choiceforfemale
				listofavailableguys.remove(male)
	print ""
	print "Couples created:"
	for girl in newcouples:
		print girl + " is going with " + newcouples[girl]
	print ""

if listofavailableguys != []:
	print "These are the people who don't have dates :("
	for guy in listofavailableguys:
		print guy

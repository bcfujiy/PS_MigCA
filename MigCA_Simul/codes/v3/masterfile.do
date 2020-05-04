clear all
set more off

***********************
*** SET DIRECTORIES ***
***********************

	*** Brian's Computer
	if "`c(username)'" == "Petrichor" {
		global root = "/Users/`c(username)'/Dropbox/RA/PS_TariffsStructChange/"
	}
	
	global outputs "$root/outputs"
	global codes "$root/codes/v3"
	global paper "$root/paper"

	exit

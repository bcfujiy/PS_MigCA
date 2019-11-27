********************************************************************************
*** setup
********************************************************************************

* housekeeping
clear all

*** set directory

* Brian's computer
if "`c(username)'" == "Petrichor" {
	cd "/Users/`c(username)'/RA/PS_MigCA/MigCA_RegsOtherCountries/data/code"
}

* Sebastian's computer

* Heitor's computer

********************************************************************************
*** Creating list of origin/destination
********************************************************************************

*** LIST OF LOCATIONS
* open
use ".././output/SouthAfrica", clear

* define locations
keep muniza

* generate auxiliary variable
gen baba = 0

* list of locations
collapse (sum) baba, by(muniza)
drop if muniza == .
drop baba

* save
*sort geo1_za2007
sort muniza
save ".././temp/locations_za_municip", replace

*** LIST OF LOCATIONS 1
* open
use ".././temp/locations_za_municip", clear

* repeat
expand 220
sort muniza
rename muniza origin

* save
gen glue = _n
sort glue
save ".././temp/locations1_za_municip", replace

*** LIST OF LOCATIONS 2
* open
use ".././temp/locations_za_municip", clear

* repeat
forval i = 1(1)219 {

	append using ".././temp/locations_za_municip"

}

* list of locations
rename muniza destination

* save
gen glue = _n
sort glue
save ".././temp/locations2_za_municip", replace

*** MERGE
* open
use ".././temp/locations1_za_municip", clear

* merge
merge glue using ".././temp/locations2_za_municip"
drop _merge glue

* creating crops
expand 36
sort origin destination
bys origin destination: gen crop = _n - 1
replace crop = crop + 111
replace crop = crop + 2 if crop >= 119
replace crop = crop + 10 if crop >= 131
replace crop = crop + 8 if crop >= 143
replace crop = crop + 6 if crop >= 154
replace crop = crop + 10 if crop >= 161
replace crop = crop + 2 if crop >= 179
replace crop = crop + 6 if crop >= 184

* creating years
expand 2
sort origin destination crop
bys origin destination crop: gen year = _n + 2000
replace year = year + 5 if year == 2002

* save
sort origin destination crop
save ".././output/origin_dest_crop_za_municip", replace

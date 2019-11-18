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
*keep geo1_za2007
keep geolev2

* generate auxiliary variable
gen baba = 0

* list of locations
collapse (sum) baba, by(geolev2)
drop if geolev2 == .
drop baba

* save
*sort geo1_za2007
sort geolev2
save ".././temp/locations_za", replace

*** LIST OF LOCATIONS 1
* open
use ".././temp/locations_za", clear

* repeat
expand 26
sort geolev2
rename geolev2 origin

* save
gen glue = _n
sort glue
save ".././temp/locations1_za", replace

*** LIST OF LOCATIONS 2
* open
use ".././temp/locations_za", clear

* repeat
forval i = 1(1)25 {

	append using ".././temp/locations_za"

}

* list of locations
rename geolev2 destination

* save
gen glue = _n
sort glue
save ".././temp/locations2_za", replace

*** MERGE
* open
use ".././temp/locations1_za", clear

* merge
merge glue using ".././temp/locations2_za"
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
save ".././output/origin_dest_crop_za", replace

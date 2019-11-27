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
use ".././output/Brazil", clear

* define locations
keep geo1_br

* generate auxiliary variable
gen baba = 0

* list of locations
collapse (sum) baba, by(geo1_br)
drop baba

* save
sort geo1_br
save ".././temp/locations_br", replace

*** LIST OF LOCATIONS 1
* open
use ".././temp/locations_br", clear

* repeat
expand 25
sort geo1_br
rename geo1_br origin

* save
gen glue = _n
sort glue
save ".././temp/locations1_br", replace

*** LIST OF LOCATIONS 2
* open
use ".././temp/locations_br", clear

* repeat
forval i = 1(1)24 {

	append using ".././temp/locations_br"

}

* list of locations
rename geo1_br destination

* save
gen glue = _n
sort glue
save ".././temp/locations2_br", replace

*** MERGE
* open
use ".././temp/locations1_br", clear

* merge
merge glue using ".././temp/locations2_br"
drop _merge glue

* creating crops
expand 14
sort origin destination
bys origin destination: gen crop = _n - 1

* creating years
expand 2
sort origin destination crop
bys origin destination crop: gen year = (_n - 1)*30 + 1980

* save
sort origin destination crop
save ".././output/origin_dest_crop_br", replace

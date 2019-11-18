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
use ".././output/Thailand", clear

* define locations
keep geo1_th

* generate auxiliary variable
gen baba = 0

* list of locations
collapse (sum) baba, by(geo1_th)
drop baba

* save
sort geo1_th
save ".././temp/locations", replace

*** LIST OF LOCATIONS 1
* open
use ".././temp/locations", clear

* repeat
expand 68
sort geo1_th
rename geo1_th origin

* save
gen glue = _n
sort glue
save ".././temp/locations1", replace

*** LIST OF LOCATIONS 2
* open
use ".././temp/locations", clear

* repeat
forval i = 1(1)67 {

	append using ".././temp/locations"

}

* list of locations
rename geo1_th destination

* save
gen glue = _n
sort glue
save ".././temp/locations2", replace

*** MERGE
* open
use ".././temp/locations1", clear

* merge
merge glue using ".././temp/locations2"
drop _merge glue

* creating crops
expand 13
sort origin destination
bys origin destination: gen crop = _n - 1

* creating years
expand 2
sort origin destination crop
bys origin destination crop: gen year = _n*10 - 20 + 1980

* save
sort origin destination crop
save ".././output/origin_dest_crop", replace

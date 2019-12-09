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
*** Origin (state)
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

* repeat
expand 137
sort geo1_br

* glue
gen glue = _n
sort glue

* save
save ".././temp/origin_br", replace

********************************************************************************
*** Destination (mesoregion)
********************************************************************************

*** LIST OF LOCATIONS
* open
use ".././output/Brazil", clear

* define locations
keep mesobr

* generate auxiliary variable
gen baba = 0

* list of locations
collapse (sum) baba, by(mesobr)
drop baba
drop if mesobr == .

* save
save ".././temp/dest_br_aux", replace

*** REPEATING VALUES
* open
use ".././temp/dest_br_aux", clear

forval i = 1(1)24 {

	append using ".././temp/dest_br_aux"

}

* save
gen glue = _n
sort glue
save ".././temp/dest_br", replace

********************************************************************************
*** Crops
********************************************************************************

*** MERGE
* open
use ".././temp/origin_br", clear
merge glue using ".././temp/dest_br"
drop glue _merge
rename geo1_br origin
rename mesobr destination

* creating crops (all the ones in the paper MINUS horticulture)
expand 13
sort origin destination
bys origin destination: gen crop = _n

* creating years
expand 2
sort origin destination crop
bys origin destination crop: gen year = (_n - 1)*10 + 2000

* save
sort origin destination crop year
save ".././output/origin_dest_crop_br", replace

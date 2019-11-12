********************************************************************************
*** setup
********************************************************************************

* housekeeping
clear all

*** set directory

* Brian's computer
if "`c(username)'" == "Petrichor" {
	cd "/Users/`c(username)'/RA/PS_MigCA/MigCA_RegsOtherCountries/analysis/code"
}

* Sebastian's computer

* Heitor's computer

********************************************************************************
*** Creating list of origin/destination
********************************************************************************

*** LIST OF LOCATIONS
* open
use "../../data/output/Thailand", clear

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

* save
sort origin destination crop
save ".././temp/origin_dest_crop", replace

********************************************************************************
*** Thailand, 1970
********************************************************************************
/*
* open
use "../../data/output/Thailand", clear

* 1970
keep if year == 1970

* keep HH head
keep if relate == 1

* keep relevant crops: 0 (rice), 1 (corn), 2 (rubber), 3 (cassava), 
* 4 (coconut), 5 (tabacco + cotton + tea + coffee + hemp), 6 (vegetables?), 
* 7 (fruits), 8 (other agric.), 9 (poultry + other animals), 10 (wood), 
* 11 (fish), 12 (hunting)
keep if ind >= 0 & ind <= 12

* drop unknown previous location
drop if geomig1_p == 764999 | geomig1_p == 764098 | geomig1_p == 764997 ///
| geomig1_p == 764998

* attaching previous location
replace geomig1_p = geo1_th if geomig1_p == 764097

* RHS variable
gen L_iktlag_aux = 1
bys geomig1_p ind: egen L_iktlag = count(L_iktlag_aux)

* Migration flows
gen L_ijkt_aux = 1
bys geomig1_p geo1_th ind: egen L_ijkt = count(L_ijkt_aux)

* renames
rename geomig1_p origin
rename geo1_th destination
rename ind crop

* collapse
collapse (mean) L_ijkt L_iktlag, by(origin destination crop)

* merge with mold
sort origin destination crop
merge origin destination crop using ".././output/origin_dest_crop"
sort origin destination crop
*/
********************************************************************************
*** L_iktlag
********************************************************************************

* open
use "../../data/output/Thailand", clear

* 1970
keep if year == 1970

* keep HH head
keep if relate == 1

* keep relevant crops: 0 (rice), 1 (corn), 2 (rubber), 3 (cassava), 
* 4 (coconut), 5 (tabacco + cotton + tea + coffee + hemp), 6 (vegetables?), 
* 7 (fruits), 8 (other agric.), 9 (poultry + other animals), 10 (wood), 
* 11 (fish), 12 (hunting)
keep if ind >= 0 & ind <= 12

* RHS variable
gen L_iktlag = 1

* renames
rename geo1_th origin
rename ind crop

* collapse
collapse (sum) L_iktlag, by(origin crop)

* save
sort origin crop
save ".././temp/L_iktlag", replace

********************************************************************************
*** L_ijkt
********************************************************************************

* open
use "../../data/output/Thailand", clear

* 1980
keep if year == 1980

* keep HH head
keep if relate == 1

* keep relevant crops: 0 (rice), 1 (corn), 2 (rubber), 3 (cassava), 
* 4 (coconut), 5 (tabacco + cotton + tea + coffee + hemp), 6 (vegetables?), 
* 7 (fruits), 8 (other agric.), 9 (poultry + other animals), 10 (wood), 
* 11 (fish), 12 (hunting)
keep if ind >= 0 & ind <= 12

* drop unknown previous location
drop if geomig1_p == 764999 | geomig1_p == 764098 | geomig1_p == 764997 ///
| geomig1_p == 764998

* attaching previous location
replace geomig1_p = geo1_th if geomig1_p == 764097

* renames
rename geomig1_p origin
rename geo1_th destination
rename ind crop

* Migration flows
gen L_ijkt = 1

* collapse
collapse (sum) L_ijkt, by(origin destination crop)

* save
sort origin destination crop
save ".././temp/L_ijkt", replace

********************************************************************************
*** Forming database
********************************************************************************

* open
use ".././temp/origin_dest_crop", clear

* merge with L_iktlag
sort origin crop
merge origin crop using ".././temp/L_iktlag"
drop _merge

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using ".././temp/L_ijkt"
sort origin destination crop
drop _merge

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .

* variables in logs
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)

* fixed effects
egen iota_jkt = group(destination crop)
egen iota_ijt = group(origin destination)

********************************************************************************
*** Regressions
********************************************************************************

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

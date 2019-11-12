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
*** L_iktlag
********************************************************************************

* open
use "../../data/output/Thailand", clear

* 1970
keep if year == 1970

* keep HH head
*keep if relate == 1

* keep relevant crops: 0 (rice), 1 (corn), 2 (rubber), 3 (cassava), 
* 4 (coconut), 9 (poultry + other animals), 10 (wood), 
* 11 (fish), 12 (hunting)
keep if (ind >= 0 & ind <= 4) | (ind >= 9 & ind <= 12)

* RHS variable
gen L_iktlag = 1

* Weighting
replace L_iktlag = L_iktlag*perwt

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
*keep if relate == 1

* keep relevant crops: 0 (rice), 1 (corn), 2 (rubber), 3 (cassava), 
* 4 (coconut), 9 (poultry + other animals), 10 (wood), 
* 11 (fish), 12 (hunting)
keep if (ind >= 0 & ind <= 4) | (ind >= 9 & ind <= 12)

* place of birth, dropping unknowns or foreign country
drop if bplth >= 97 & bplth <= 99

* drop unknown previous location
*drop if geomig1_p == 764999 | geomig1_p == 764098 | geomig1_p == 764997 ///
*| geomig1_p == 764998

* attaching previous location
*replace geomig1_p = geo1_th if geomig1_p == 764097

* keep ages 30-65
keep if age >= 30 & age <= 65

* RHS variable
gen L_ijkt = 1

* Weighting
replace L_ijkt = L_ijkt*perwt

* renames
rename bplth origin
rename geo1_th destination
rename ind crop

* collapse
collapse (sum) L_ijkt, by(origin destination crop)

* fixing origin variable
replace origin = origin + 764000

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

* Regression (11), REGHDFE (VERY LOW AMOUNT OF OBSERVATIONS DUE TO SINGLETON GROUPS)
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

* Regression (11), PPML (WORKS WELL!)
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

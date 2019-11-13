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
*** L_iktlag
********************************************************************************

* open
use ".././output/Thailand", clear

* 1970
keep if year == 1980

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
collapse (sum) L_iktlag, by(origin crop year)

* save
sort origin crop
save ".././output/L_iktlag_80", replace

********************************************************************************
*** L_ijkt
********************************************************************************

* open
use ".././output/Thailand", clear

* 1980
keep if year == 1980

* keep HH head
keep if relate == 1

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
collapse (sum) L_ijkt, by(origin destination crop year)

* fixing origin variable
replace origin = origin + 764000

* save
sort origin destination crop
save ".././output/L_ijkt_80", replace

********************************************************************************
*** L_ijkt, only men HH heads
********************************************************************************

* open
use ".././output/Thailand", clear

* 1980
keep if year == 1980

* keep HH head
keep if relate == 1

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

* keep men
keep if sex == 1

* RHS variable
gen L_ijkt = 1

* Weighting
replace L_ijkt = L_ijkt*perwt

* renames
rename bplth origin
rename geo1_th destination
rename ind crop

* collapse
collapse (sum) L_ijkt, by(origin destination crop year)

* fixing origin variable
replace origin = origin + 764000

* save
sort origin destination crop
save ".././output/L_ijkt_80_men", replace

********************************************************************************
*** L_ijkt, only men HH heads, ages 20-65
********************************************************************************

* open
use ".././output/Thailand", clear

* 1980
keep if year == 1980

* keep HH head
keep if relate == 1

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
keep if age >= 20 & age <= 65

* keep men
keep if sex == 1

* RHS variable
gen L_ijkt = 1

* Weighting
replace L_ijkt = L_ijkt*perwt

* renames
rename bplth origin
rename geo1_th destination
rename ind crop

* collapse
collapse (sum) L_ijkt, by(origin destination crop year)

* fixing origin variable
replace origin = origin + 764000

* save
sort origin destination crop
save ".././output/L_ijkt_80_men_20-65", replace

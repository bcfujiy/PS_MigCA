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

* keep relevant crops: 1 (rice), 2 (corn), 3 (rubber), 5 (cassava), 
* 6 (coconut), 19 (wood), 20 (fish), 21 (hunting)
keep if (ind >= 1 & ind <= 3) | (ind >= 5 & ind <= 6) | (ind >= 19 & ind <= 21)

* matching with 1970 census industries
replace ind = 0 if ind == 1
replace ind = 1 if ind == 2
replace ind = 2 if ind == 3
replace ind = 3 if ind == 5
replace ind = 4 if ind == 6
replace ind = 10 if ind == 19
replace ind = 11 if ind == 20
replace ind = 12 if ind == 21

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

* keep relevant crops: 1 (rice), 2 (corn), 3 (rubber), 5 (cassava), 
* 6 (coconut), 19 (wood), 20 (fish), 21 (hunting)
keep if (ind >= 1 & ind <= 3) | (ind >= 5 & ind <= 6) | (ind >= 19 & ind <= 21)

* matching with 1970 census industries
replace ind = 0 if ind == 1
replace ind = 1 if ind == 2
replace ind = 2 if ind == 3
replace ind = 3 if ind == 5
replace ind = 4 if ind == 6
replace ind = 10 if ind == 19
replace ind = 11 if ind == 20
replace ind = 12 if ind == 21

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

* keep relevant crops: 1 (rice), 2 (corn), 3 (rubber), 5 (cassava), 
* 6 (coconut), 19 (wood), 20 (fish), 21 (hunting)
keep if (ind >= 1 & ind <= 3) | (ind >= 5 & ind <= 6) | (ind >= 19 & ind <= 21)

* matching with 1970 census industries
replace ind = 0 if ind == 1
replace ind = 1 if ind == 2
replace ind = 2 if ind == 3
replace ind = 3 if ind == 5
replace ind = 4 if ind == 6
replace ind = 10 if ind == 19
replace ind = 11 if ind == 20
replace ind = 12 if ind == 21

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

* keep relevant crops: 1 (rice), 2 (corn), 3 (rubber), 5 (cassava), 
* 6 (coconut), 19 (wood), 20 (fish), 21 (hunting)
keep if (ind >= 1 & ind <= 3) | (ind >= 5 & ind <= 6) | (ind >= 19 & ind <= 21)

* matching with 1970 census industries
replace ind = 0 if ind == 1
replace ind = 1 if ind == 2
replace ind = 2 if ind == 3
replace ind = 3 if ind == 5
replace ind = 4 if ind == 6
replace ind = 10 if ind == 19
replace ind = 11 if ind == 20
replace ind = 12 if ind == 21

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

********************************************************************************
*** L_ijkt, person level
********************************************************************************

* open
use ".././output/Thailand", clear

* 1980
keep if year == 1980

* keep HH head
keep if relate == 1

* keep relevant crops: 1 (rice), 2 (corn), 3 (rubber), 5 (cassava), 
* 6 (coconut), 19 (wood), 20 (fish), 21 (hunting)
keep if (ind >= 1 & ind <= 3) | (ind >= 5 & ind <= 6) | (ind >= 19 & ind <= 21)

* matching with 1970 census industries
replace ind = 0 if ind == 1
replace ind = 1 if ind == 2
replace ind = 2 if ind == 3
replace ind = 3 if ind == 5
replace ind = 4 if ind == 6
replace ind = 10 if ind == 19
replace ind = 11 if ind == 20
replace ind = 12 if ind == 21

* place of birth, dropping unknowns or foreign country
drop if bplth >= 97 & bplth <= 99

* drop unknown previous location
*drop if geomig1_p == 764999 | geomig1_p == 764098 | geomig1_p == 764997 ///
*| geomig1_p == 764998

* attaching previous location
*replace geomig1_p = geo1_th if geomig1_p == 764097

* keep ages 30-65
keep if age >= 30 & age <= 65

* LHS variable
gen L_wijkt = 1

* Weighting
*replace L_wijkt = L_wijkt*perwt

* renames
rename bplth origin
rename geo1_th destination
rename ind crop

* fixing origin variable
replace origin = origin + 764000

* keep relevant variables
keep L_wijkt origin destination crop year perwt

* save
sort origin destination crop
save ".././output/L_ijkt_80_person", replace

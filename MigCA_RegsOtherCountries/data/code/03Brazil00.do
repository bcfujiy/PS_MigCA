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
/*
* open
use ".././output/Brazil", clear

* 2000
keep if year == 2000

* keep relevant crops (there is no cassava here)
replace ind = 1 if ind == 14
replace ind = 3 if ind == 27
replace ind = 4 if ind == 15
replace ind = 5 if ind == 16
replace ind = 6 if ind == 12
replace ind = 7 if ind == 20
replace ind = 8 if ind == 41
replace ind = 9 if ind == 26
replace ind = 10 if ind == 13
replace ind = 11 if ind == 21
replace ind = 12 if ind == 17
replace ind = 13 if ind == 18
keep if ind >= 1 & ind <= 13

* RHS variable
gen L_iktlag = 1

* Weighting
replace L_iktlag = L_iktlag*perwt

* renames
rename geo1_br origin
rename ind crop

* collapse
collapse (sum) L_iktlag, by(origin crop year)

* save
sort origin crop
save ".././output/L_iktlag_br_80", replace
*/
********************************************************************************
*** L_ijkt
********************************************************************************

* open
use ".././output/Brazil", clear

* 2000
keep if year == 2000

* keep HH head
keep if relate == 1

* keep relevant crops
replace ind = 1 if ind == 1116
replace ind = 2 if ind == 1108
replace ind = 3 if ind == 1205
replace ind = 4 if ind == 1114
replace ind = 5 if ind == 1113
replace ind = 6 if ind == 1104
replace ind = 7 if ind == 1102
replace ind = 8 if ind == 5001
replace ind = 9 if ind == 1201
replace ind = 10 if ind == 1101
replace ind = 11 if ind == 1107
replace ind = 12 if ind == 1105
replace ind = 13 if ind == 1106
keep if ind >= 1 & ind <= 13

* place of birth, dropping unknowns or foreign country
drop if bplbr >= 97 & bplbr <= 98

* keep ages 30-65
keep if age >= 30 & age <= 65

* RHS variable
gen L_ijkt_00 = 1

* Weighting
replace L_ijkt_00 = L_ijkt_00*perwt

* renames
rename bplbr origin
rename mesobr destination
rename ind crop

* collapse
collapse (sum) L_ijkt_00, by(origin destination crop year)

* fixing origin variable
replace origin = origin + 76000

* drop new states
drop if origin == 76017
drop if origin == 76050

* save
sort origin destination crop year
save ".././output/L_ijkt_br_00", replace

********************************************************************************
*** w_ijkt
********************************************************************************

* open
use ".././output/Brazil", clear

* 2000
keep if year == 2000

* keep HH head
keep if relate == 1

* keep relevant crops
replace ind = 1 if ind == 1116
replace ind = 2 if ind == 1108
replace ind = 3 if ind == 1205
replace ind = 4 if ind == 1114
replace ind = 5 if ind == 1113
replace ind = 6 if ind == 1104
replace ind = 7 if ind == 1102
replace ind = 8 if ind == 5001
replace ind = 9 if ind == 1201
replace ind = 10 if ind == 1101
replace ind = 11 if ind == 1107
replace ind = 12 if ind == 1105
replace ind = 13 if ind == 1106
keep if ind >= 1 & ind <= 13

* place of birth, dropping unknowns or foreign country
drop if bplbr >= 97 & bplbr <= 98

* keep ages 30-65
keep if age >= 30 & age <= 65

* renames
rename bplbr origin
rename mesobr destination
rename ind crop

* LHS variable, intermediate step
gen w_ijkt_00 = inctot*perwt
bys origin destination crop: egen w_ijkt_00_den = total(perwt)

* collapse
collapse (sum) w_ijkt_00 (mean) w_ijkt_00_den, by(origin destination crop year)

* LHS variable
replace w_ijkt_00 = w_ijkt_00/w_ijkt_00_den
drop w_ijkt_00_den

* fixing origin variable
replace origin = origin + 76000

* drop new states
drop if origin == 76017
drop if origin == 76050

* save
sort origin destination crop year
save ".././output/w_ijkt_br_00", replace

********************************************************************************
*** L_ijkt, only men HH heads
********************************************************************************
/*
* open
use ".././output/Thailand", clear

* 1980
keep if year == 1970

* keep HH head
keep if relate == 1

* keep relevant crops: 0 (rice), 1 (corn), 2 (rubber), 3 (cassava), 
* 4 (coconut), 10 (wood), 11 (fish), 12 (hunting)
keep if (ind >= 0 & ind <= 4) | (ind >= 10 & ind <= 12)

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
save ".././output/L_ijkt_70_men", replace

********************************************************************************
*** L_ijkt, only men HH heads, ages 20-65
********************************************************************************

* open
use ".././output/Thailand", clear

* 1980
keep if year == 1970

* keep HH head
keep if relate == 1

* keep relevant crops: 0 (rice), 1 (corn), 2 (rubber), 3 (cassava), 
* 4 (coconut), 10 (wood), 11 (fish), 12 (hunting)
keep if (ind >= 0 & ind <= 4) | (ind >= 10 & ind <= 12)

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
save ".././output/L_ijkt_70_men_20-65", replace

********************************************************************************
*** L_ijkt, person level
********************************************************************************

* open
use ".././output/Thailand", clear

* 1980
keep if year == 1970

* keep HH head
keep if relate == 1

* keep relevant crops: 0 (rice), 1 (corn), 2 (rubber), 3 (cassava), 
* 4 (coconut), 10 (wood), 11 (fish), 12 (hunting)
keep if (ind >= 0 & ind <= 4) | (ind >= 10 & ind <= 12)

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
replace L_wijkt = L_wijkt*perwt

* renames
rename bplth origin
rename geo1_th destination
rename ind crop

* fixing origin variable
replace origin = origin + 764000

* keep relevant variables
keep L_wijkt origin destination crop year

* save
sort origin destination crop
save ".././output/L_ijkt_70_person", replace
*/

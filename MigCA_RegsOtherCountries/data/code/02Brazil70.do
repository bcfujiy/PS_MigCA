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
use ".././output/Brazil", clear

* 1970 (t - 1), 2000 (t)
keep if year == 1970
replace year = 2000

* keep relevant crops (there is no cassava, corn, or soy here)
replace ind = 1 if ind == 114
replace ind = 3 if ind == 124
replace ind = 4 if ind == 115
replace ind = 5 if ind == 116
replace ind = 6 if ind == 112
replace ind = 8 if ind == 222
replace ind = 9 if ind == 123
replace ind = 10 if ind == 113
replace ind = 12 if ind == 117
replace ind = 13 if ind == 118
keep if ind >= 1 & ind <= 13

* RHS variable
gen L_iktlag_70 = 1

* Weighting
replace L_iktlag_70 = L_iktlag_70*perwt

* renames
rename geo1_br origin
rename ind crop

* collapse
collapse (sum) L_iktlag_70, by(origin crop year)

* save
sort origin crop year
save ".././output/L_iktlag_br_70", replace

********************************************************************************
*** L_ijkt
********************************************************************************
/*
* open
use ".././output/Brazil", clear

* 1980
keep if year == 2010

* keep HH head
keep if relate == 1

* keep relevant crops: 1116 (banana), 1108 (manioc root), 1205 (poultry raising), 
* 1114 (cocoa beans), 1113 (coffee), 1104 (herbaceous cotton), 1102 (corn), 
* 3001 (fishing), 1111 (flowers, ornamental plants), 1201 (cattle raising), 
* 1101 (rice), 1107 (soy beans), 1105 (sugar cane), 1106 (tobacco)
keep if ind == 1101 | ind == 1102 | (ind >= 1104 & ind <= 1108) | ind == 1111 ///
| ind == 1113 | ind == 1114 | ind == 1116 | ind == 1201 | ind == 1205 | ind == 3001

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
save ".././output/L_ijkt_70", replace

********************************************************************************
*** L_ijkt, only men HH heads
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

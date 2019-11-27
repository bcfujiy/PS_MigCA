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
use ".././output/SouthAfrica", clear

* 2001
keep if year == 2007

* keep relevant crops
*keep if (ind >= 111 & ind <= 118) | (ind >= 121 & ind <= 130) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153) ///
*| (ind == 160) | (ind >= 171 & ind <= 178) ///
*| (ind >= 181 & ind <= 183) | (ind == 190)

*keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153)

keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
| (ind >= 151 & ind <= 153) | ind == 160

* RHS variable
gen L_iktlag = 1

* Weighting
replace L_iktlag = L_iktlag*perwt

* renames
rename geo1_za2007 origin
rename ind crop

* collapse
collapse (sum) L_iktlag, by(origin crop year)

* save
sort origin crop
save ".././output/L_iktlag_za_07", replace

********************************************************************************
*** L_ijkt
********************************************************************************

* open
use ".././output/SouthAfrica", clear

* 2007
keep if year == 2007

* keep HH head
keep if relate == 1
*keep if sex == 1

* keep relevant crops
*keep if (ind >= 111 & ind <= 118) | (ind >= 121 & ind <= 130) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153) ///
*| (ind == 160) | (ind >= 171 & ind <= 178) ///
*| (ind >= 181 & ind <= 183) | (ind == 190)

*keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153)

keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
| (ind >= 151 & ind <= 153) | ind == 160

* place of birth, dropping unknowns or foreign country
drop if bplza == 98 | bplza == 90

* keep ages 30-65
keep if age >= 30 & age <= 65
*keep if age >= 20 & age <= 65

* RHS variable
gen L_ijkt = 1

* Weighting
replace L_ijkt = L_ijkt*perwt

* renames
rename bplza origin
rename geo1_za2007 destination
rename ind crop

* collapse
collapse (sum) L_ijkt, by(origin destination crop year)

* save
sort origin destination crop
save ".././output/L_ijkt_za_07", replace

********************************************************************************
*** L_ijkt, HH men
********************************************************************************

* open
use ".././output/SouthAfrica", clear

* 2007
keep if year == 2007

* keep men HH head
keep if relate == 1
keep if sex == 1

* keep relevant crops
*keep if (ind >= 111 & ind <= 118) | (ind >= 121 & ind <= 130) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153) ///
*| (ind == 160) | (ind >= 171 & ind <= 178) ///
*| (ind >= 181 & ind <= 183) | (ind == 190)

*keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153)

keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
| (ind >= 151 & ind <= 153) | ind == 160

* place of birth, dropping unknowns or foreign country
drop if bplza == 98 | bplza == 90

* keep ages 30-65
keep if age >= 30 & age <= 65
*keep if age >= 20 & age <= 65

* RHS variable
gen L_ijkt = 1

* Weighting
replace L_ijkt = L_ijkt*perwt

* renames
rename bplza origin
rename geo1_za2007 destination
rename ind crop

* collapse
collapse (sum) L_ijkt, by(origin destination crop year)

* save
sort origin destination crop
save ".././output/L_ijkt_za_07_men", replace

********************************************************************************
*** L_ijkt, HH men, 20-65
********************************************************************************

* open
use ".././output/SouthAfrica", clear

* 2007
keep if year == 2007

* keep men HH head
keep if relate == 1
keep if sex == 1

* keep relevant crops
*keep if (ind >= 111 & ind <= 118) | (ind >= 121 & ind <= 130) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153) ///
*| (ind == 160) | (ind >= 171 & ind <= 178) ///
*| (ind >= 181 & ind <= 183) | (ind == 190)

*keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153)

keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
| (ind >= 151 & ind <= 153) | ind == 160

* place of birth, dropping unknowns or foreign country
drop if bplza == 98 | bplza == 90

* keep ages 30-65
*keep if age >= 30 & age <= 65
keep if age >= 20 & age <= 65

* RHS variable
gen L_ijkt = 1

* Weighting
replace L_ijkt = L_ijkt*perwt

* renames
rename bplza origin
rename geo1_za2007 destination
rename ind crop

* collapse
collapse (sum) L_ijkt, by(origin destination crop year)

* save
sort origin destination crop
save ".././output/L_ijkt_za_07_men_20-65", replace

********************************************************************************
*** w_ijkt
********************************************************************************

* open
use ".././output/SouthAfrica", clear

* 2007
keep if year == 2007

* keep HH head
keep if relate == 1
*keep if sex == 1

* keep relevant crops
*keep if (ind >= 111 & ind <= 118) | (ind >= 121 & ind <= 130) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153) ///
*| (ind == 160) | (ind >= 171 & ind <= 178) ///
*| (ind >= 181 & ind <= 183) | (ind == 190)

*keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153)

keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
| (ind >= 151 & ind <= 153) | ind == 160

* place of birth, dropping unknowns or foreign country
drop if bplza == 98 | bplza == 90

* keep ages 30-65
keep if age >= 30 & age <= 65
*keep if age >= 20 & age <= 65

* drop missing income
drop if inctot >= 9999998

* renames
rename bplza origin
rename geo1_za2007 destination
rename ind crop

* LHS variable, intermediate step
gen w_ijkt = inctot*perwt
bys origin destination crop: egen w_ijkt_den = total(perwt)

* collapse
collapse (sum) w_ijkt (mean) w_ijkt_den, by(origin destination crop year)

* LHS variable
replace w_ijkt = w_ijkt/w_ijkt_den
drop w_ijkt_den

* save
sort origin destination crop
save ".././output/w_ijkt_za_07", replace

********************************************************************************
*** w_ijkt, meh HH head
********************************************************************************

* open
use ".././output/SouthAfrica", clear

* 2007
keep if year == 2007

* keep HH head
keep if relate == 1
keep if sex == 1

* keep relevant crops
*keep if (ind >= 111 & ind <= 118) | (ind >= 121 & ind <= 130) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153) ///
*| (ind == 160) | (ind >= 171 & ind <= 178) ///
*| (ind >= 181 & ind <= 183) | (ind == 190)

*keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153)

keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
| (ind >= 151 & ind <= 153) | ind == 160

* place of birth, dropping unknowns or foreign country
drop if bplza == 98 | bplza == 90

* keep ages 30-65
keep if age >= 30 & age <= 65
*keep if age >= 20 & age <= 65

* drop missing income
drop if inctot >= 9999998

* renames
rename bplza origin
rename geo1_za2007 destination
rename ind crop

* LHS variable, intermediate step
gen w_ijkt = inctot*perwt
bys origin destination crop: egen w_ijkt_den = total(perwt)

* collapse
collapse (sum) w_ijkt (mean) w_ijkt_den, by(origin destination crop year)

* LHS variable
replace w_ijkt = w_ijkt/w_ijkt_den
drop w_ijkt_den

* save
sort origin destination crop
save ".././output/w_ijkt_za_07_men", replace

********************************************************************************
*** w_ijkt, meh HH head, 20-65
********************************************************************************

* open
use ".././output/SouthAfrica", clear

* 2007
keep if year == 2007

* keep HH head
keep if relate == 1
keep if sex == 1

* keep relevant crops
*keep if (ind >= 111 & ind <= 118) | (ind >= 121 & ind <= 130) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153) ///
*| (ind == 160) | (ind >= 171 & ind <= 178) ///
*| (ind >= 181 & ind <= 183) | (ind == 190)

*keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
*| (ind >= 141 & ind <= 142) | (ind >= 151 & ind <= 153)

keep if (ind >= 111 & ind <= 117) | (ind >= 121 & ind <= 127) ///
| (ind >= 151 & ind <= 153) | ind == 160

* place of birth, dropping unknowns or foreign country
drop if bplza == 98 | bplza == 90

* keep ages 30-65
*keep if age >= 30 & age <= 65
keep if age >= 20 & age <= 65

* drop missing income
drop if inctot >= 9999998

* renames
rename bplza origin
rename geo1_za2007 destination
rename ind crop

* LHS variable, intermediate step
gen w_ijkt = inctot*perwt
bys origin destination crop: egen w_ijkt_den = total(perwt)

* collapse
collapse (sum) w_ijkt (mean) w_ijkt_den, by(origin destination crop year)

* LHS variable
replace w_ijkt = w_ijkt/w_ijkt_den
drop w_ijkt_den

* save
sort origin destination crop
save ".././output/w_ijkt_za_07_men_20-65", replace

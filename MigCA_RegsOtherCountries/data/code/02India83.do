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
use ".././output/India", clear

* 1970
keep if year == 1983

* (1983, 1987) = [ (0,0);(1,1);(2,2);(3+4,3);(6,5);(7,6);(10,10);(11,11);(12,12)
* (13,13);(14+15,14);(16,16);(17,17);(18,18);(20,20+21);(21,22);(22,23);(23,24)
* (24,25);(25,26);(60,60);(61,61);(62,62) ]

* recode crops according to 1987 categories
replace ind = 3 if ind == 4
replace ind = 5 if ind == 6
replace ind = 6 if ind == 7
replace ind = 14 if ind == 15
replace ind = 26 if ind == 25
replace ind = 25 if ind == 24
replace ind = 24 if ind == 23
replace ind = 23 if ind == 22
replace ind = 22 if ind == 21

keep if (ind >= 0 & ind <= 3) | ind == 5 | ind == 6 | (ind >= 10 & ind <= 14) | ///
(ind >= 16 & ind <= 18) | ind == 20 | (ind >= 22 & ind <= 26) | (ind >= 60 & ind <= 62)

* RHS variable
gen L_iktlag = 1

* Weighting
replace L_iktlag = L_iktlag*perwt

* renames
rename geo1_in origin
rename ind crop

* collapse
collapse (sum) L_iktlag, by(origin crop year)

* save
sort origin crop
save ".././output/L_iktlag_ind_83", replace

********************************************************************************
*** L_ijkt
********************************************************************************

* open
use ".././output/India", clear

* 1980
keep if year == 1983

* keep HH head
keep if relate == 1

* (1983, 1987) = [ (0,0);(1,1);(2,2);(3+4,3);(6,5);(7,6);(10,10);(11,11);(12,12)
* (13,13);(14+15,14);(16,16);(17,17);(18,18);(20,20+21);(21,22);(22,23);(23,24)
* (24,25);(25,26);(60,60);(61,61);(62,62) ]

* recode crops according to 1987 categories
replace ind = 3 if ind == 4
replace ind = 5 if ind == 6
replace ind = 6 if ind == 7
replace ind = 14 if ind == 15
replace ind = 26 if ind == 25
replace ind = 25 if ind == 24
replace ind = 24 if ind == 23
replace ind = 23 if ind == 22
replace ind = 22 if ind == 21

keep if (ind >= 0 & ind <= 3) | ind == 5 | ind == 6 | (ind >= 10 & ind <= 14) | ///
(ind >= 16 & ind <= 18) | ind == 20 | (ind >= 22 & ind <= 26) | (ind >= 60 & ind <= 62)

* place of birth, dropping unknowns or foreign country
drop if geomig1_p == 356099 | geomig1_p == 356098

* keep ages 30-65
keep if age >= 30 & age <= 65

* RHS variable
gen L_ijkt = 1

* Weighting
replace L_ijkt = L_ijkt*perwt

* renames
rename geomig1_p origin
rename geo1_in destination
rename ind crop

* collapse
collapse (sum) L_ijkt, by(origin destination crop year)

* save
sort origin destination crop
save ".././output/L_ijkt_ind_83", replace

********************************************************************************
*** w_ijkt
********************************************************************************

* open
use ".././output/India", clear

* 2007
keep if year == 1983

* keep HH head
keep if relate == 1

* (1983, 1987) = [ (0,0);(1,1);(2,2);(3+4,3);(6,5);(7,6);(10,10);(11,11);(12,12)
* (13,13);(14+15,14);(16,16);(17,17);(18,18);(20,20+21);(21,22);(22,23);(23,24)
* (24,25);(25,26);(60,60);(61,61);(62,62) ]

* recode crops according to 1987 categories
replace ind = 3 if ind == 4
replace ind = 5 if ind == 6
replace ind = 6 if ind == 7
replace ind = 14 if ind == 15
replace ind = 26 if ind == 25
replace ind = 25 if ind == 24
replace ind = 24 if ind == 23
replace ind = 23 if ind == 22
replace ind = 22 if ind == 21

keep if (ind >= 0 & ind <= 3) | ind == 5 | ind == 6 | (ind >= 10 & ind <= 14) | ///
(ind >= 16 & ind <= 18) | ind == 20 | (ind >= 22 & ind <= 26) | (ind >= 60 & ind <= 62)

* place of birth, dropping unknowns or foreign country
drop if geomig1_p == 356099 | geomig1_p == 356098

* keep ages 30-65
keep if age >= 30 & age <= 65

* drop missing income
drop if incwage == 9999998

* renames
rename geomig1_p origin
rename geo1_in destination
rename ind crop

* LHS variable, intermediate step
gen w_ijkt = incwage*perwt
bys origin destination crop: egen w_ijkt_den = total(perwt)

* collapse
collapse (sum) w_ijkt (mean) w_ijkt_den, by(origin destination crop year)

* LHS variable
replace w_ijkt = w_ijkt/w_ijkt_den
drop w_ijkt_den

* save
sort origin destination crop
save ".././output/w_ijkt_ind_83", replace

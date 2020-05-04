
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
*** Wages, districts
********************************************************************************
/*
* open
use "../../data/output/origin_dest_crop_za_municip", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_za_01_municip"
drop _merge year

* merge with w_ijkt
sort destination crop
merge destination crop using "../../data/output/w_ijkt_za_07"
sort origin destination crop
drop _merge year

* variables in logs
gen L_iktlag_log = log(L_iktlag)
gen w_ijkt_log = log(w_ijkt)

* fixed effects
egen iota_jkt = group(destination crop)
egen iota_ijt = group(origin destination)

* Regression (11), OLS
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_70lag80_ols

* Regression (11), PPML
ppmlhdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_70lag80_ppml1

* Regression (11), PPML with only jkt fixed effects
ppmlhdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_70lag80_ppml3

* Regression (11), OLS with only jkt fixed effects
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_70lag80_ols1
*/
********************************************************************************
*** 2001 (t-1), 2007 (t)
********************************************************************************
/*
* open
use "../../data/output/origin_dest_crop_za", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_za_01"
drop _merge year

* merge with w_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/w_ijkt_za_07"
drop _merge year

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/L_ijkt_za_07"
sort origin destination crop
drop _merge year

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .
replace w_ijkt = . if w_ijkt == 0

* variables in logs
gen L_iktlag_log = log(L_iktlag)
gen w_ijkt_log = log(w_ijkt)
gen L_ijkt_log = log(L_ijkt)

* fixed effects
egen iota_jkt = group(destination crop)
egen iota_ijt = group(origin destination)

*** MIGRATION

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ols

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml1

* Regression (11), PPML without zeros
ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml2

* Regression (11), PPML with only jkt fixed effects
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ppml3

* Regression (11), OLS with only jkt fixed effects
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ols1

*** WAGES

* Regression (11), OLS
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ols

* Regression (11), PPML
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml1

* Regression (11), PPML without zeros
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml2

* Regression (11), PPML with only jkt fixed effects
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ppml3

* Regression (11), OLS with only jkt fixed effects
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ols1

********************************************************************************
*** 2001 (t, and t-1)
********************************************************************************

* open
use "../../data/output/origin_dest_crop_za", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_za_01"
drop _merge

* merge with w_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/w_ijkt_za_01"
drop _merge year

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/L_ijkt_za_01"
sort origin destination crop
drop _merge year

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .
replace w_ijkt = . if w_ijkt == 0

* variables in logs
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)
gen w_ijkt_log = log(w_ijkt)

* fixed effects
egen iota_jkt = group(destination crop)
egen iota_ijt = group(origin destination)

*** MIGRATION

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ols

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml1

* Regression (11), PPML without zeros
ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml2

* Regression (11), PPML with only jkt fixed effects
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ppml3

* Regression (11), OLS with only jkt fixed effects
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ols1

*** WAGES

* Regression (11), OLS
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ols

* Regression (11), PPML
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml1

* Regression (11), PPML without zeros
ppmlhdfe w_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml2

* Regression (11), PPML with only jkt fixed effects
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ppml3

* Regression (11), OLS with only jkt fixed effects
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ols1
*/
********************************************************************************
*** 2007 (t, and t-1)
********************************************************************************

* open
use "../../data/output/origin_dest_crop_za", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_za_07"
drop _merge

* merge with w_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/w_ijkt_za_07"
drop _merge year

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/L_ijkt_za_07"
sort origin destination crop
drop _merge year

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .
*replace w_ijkt = . if w_ijkt == 0

* variables in logs
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)
gen w_ijkt_log = log(w_ijkt)

* fixed effects
egen iota_jkt = group(destination crop)
egen iota_ijt = group(origin destination)

*** MIGRATION

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_za_ols

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_za_ppml1

* Regression (11), PPML without zeros
ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_za_ppml2

* Regression (11), PPML with only jkt fixed effects
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_za_ppml3

* Regression (11), OLS with only jkt fixed effects
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_za_ols1

* Tables
noi: esttab reg11_za_ols reg11_za_ppml1 reg11_za_ppml2 reg11_za_ppml3 reg11_za_ols1 using ".././output/reg11_za.tex", ///
se compress drop(_cons) stats(N r2 r2_p, label("Observations" "R2" "Pseudo R2")) ///
label nodepvars nomtitles replace ///
star (* 0.10 ** 0.05 *** 0.01)

*** WAGES

* Regression (10), OLS
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg10_za_ols

* Regression (10), PPML
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg10_za_ppml1

* Regression (10), PPML with only jkt fixed effects
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg10_za_ppml2

* Regression (10), OLS with only jkt fixed effects
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg10_za_ols1

* Tables
noi: esttab reg10_za_ols reg10_za_ppml1 reg10_za_ppml2 reg10_za_ols1 using ".././output/reg10_za.tex", ///
se compress drop(_cons) stats(N r2 r2_p, label("Observations" "R2" "Pseudo R2")) ///
label nodepvars nomtitles replace ///
star (* 0.10 ** 0.05 *** 0.01)

********************************************************************************
*** 2001 and 2007 together, year dimension becomes important
********************************************************************************
/*
* sort datasets
use "../../data/output/L_iktlag_za_01", clear
sort origin crop year
save "../../data/output/L_iktlag_za_01", replace

use "../../data/output/L_iktlag_za_07", clear
sort origin crop year
save "../../data/output/L_iktlag_za_07", replace

use "../../data/output/L_ijkt_za_01", clear
sort origin destination crop year
save "../../data/output/L_ijkt_za_01", replace

use "../../data/output/L_ijkt_za_07", clear
sort origin destination crop year
save "../../data/output/L_ijkt_za_07", replace

use "../../data/output/w_ijkt_za_01", clear
sort origin destination crop year
save "../../data/output/w_ijkt_za_01", replace

use "../../data/output/w_ijkt_za_07", clear
sort origin destination crop year
save "../../data/output/w_ijkt_za_07", replace

* open
use "../../data/output/origin_dest_crop_za", clear

* merge with L_iktlag, 2001
sort origin crop year
merge origin crop year using "../../data/output/L_iktlag_za_01"
drop _merge

* merge with L_ijkt, 2001
sort origin destination crop year
merge origin destination crop year using "../../data/output/L_ijkt_za_01"
drop _merge

* merge with w_ijkt, 2001
sort origin destination crop year
merge origin destination crop year using "../../data/output/w_ijkt_za_01"
drop _merge

* save
keep if year == 2001
sort origin destination crop year
save ".././temp/Brazil_01", replace

* open
use "../../data/output/origin_dest_crop_za", clear

* merge with L_iktlag, 2001
sort origin crop year
merge origin crop year using "../../data/output/L_iktlag_za_07"
drop _merge

* merge with L_ijkt, 2001
sort origin destination crop year
merge origin destination crop year using "../../data/output/L_ijkt_za_07"
drop _merge

* merge with w_ijkt, 2001
sort origin destination crop year
merge origin destination crop year using "../../data/output/w_ijkt_za_07"
drop _merge

* save
keep if year == 2007
sort origin destination crop year
save ".././temp/Brazil_07", replace

* append
use ".././temp/Brazil_01", clear
append using ".././temp/Brazil_07"
sort origin destination crop year

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .
replace w_ijkt = . if w_ijkt == 0

* variables in logs
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)
gen w_ijkt_log = log(w_ijkt)

* fixed effects
egen iota_jkt = group(destination crop year)
egen iota_ijt = group(origin destination year)

*** MIGRATION

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ols

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml1

* Regression (11), PPML without zeros
ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml2

* Regression (11), PPML with only jkt fixed effects
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ppml3

* Regression (11), OLS with only jkt fixed effects
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ols1

*** WAGES

* Regression (11), OLS
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ols

* Regression (11), PPML
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml1

* Regression (11), PPML without zeros
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml2

* Regression (11), PPML with only jkt fixed effects
ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ppml3

* Regression (11), OLS with only jkt fixed effects
reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
estimates store reg11_80_ols1
*/

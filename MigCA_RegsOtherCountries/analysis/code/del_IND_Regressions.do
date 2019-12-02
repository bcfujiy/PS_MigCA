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
*** 1970 (t-1), 1980 (t)
********************************************************************************

* open
use "../../data/output/origin_dest_crop_ind", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_ind_83"
drop _merge

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/L_ijkt_ind_87"
sort origin destination crop
drop _merge

* merge with w_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/w_ijkt_ind_87"
sort origin destination crop
drop _merge

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .
replace w_ijkt = . if w_ijkt == 0

* variables in logs
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)
gen w_ijkt_log = log(w_ijkt)

* fixed effects
*egen iota_jkt = group(destination crop year)
*egen iota_ijt = group(origin destination year)
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
*** 1970 (t, and t-1)
********************************************************************************

* open
use "../../data/output/origin_dest_crop_ind", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_ind_83"
drop _merge

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/L_ijkt_ind_83"
sort origin destination crop
drop _merge

* merge with w_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/w_ijkt_ind_83"
sort origin destination crop
drop _merge

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .
replace w_ijkt = . if w_ijkt == 0

* variables in logs
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)
gen w_ijkt_log = log(w_ijkt)

* fixed effects
*egen iota_jkt = group(destination crop year)
*egen iota_ijt = group(origin destination year)
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
*** 1970 (t, and t-1)
********************************************************************************

* open
use "../../data/output/origin_dest_crop_ind", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_ind_87"
drop _merge

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/L_ijkt_ind_87"
sort origin destination crop
drop _merge

* merge with w_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/w_ijkt_ind_87"
sort origin destination crop
drop _merge

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .
*replace w_ijkt = . if w_ijkt == 0

* variables in logs
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)
gen w_ijkt_log = log(w_ijkt)

* fixed effects
*egen iota_jkt = group(destination crop year)
*egen iota_ijt = group(origin destination year)
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
*** 1983 and 1987 together, year dimension becomes important
********************************************************************************

* sort datasets
use "../../data/output/L_iktlag_ind_83", clear
sort origin crop year
save "../../data/output/L_iktlag_ind_83", replace

use "../../data/output/L_iktlag_ind_87", clear
sort origin crop year
save "../../data/output/L_iktlag_ind_87", replace

use "../../data/output/L_ijkt_ind_83", clear
sort origin destination crop year
save "../../data/output/L_ijkt_ind_83", replace

use "../../data/output/L_ijkt_ind_87", clear
sort origin destination crop year
save "../../data/output/L_ijkt_ind_87", replace

use "../../data/output/w_ijkt_ind_83", clear
sort origin destination crop year
save "../../data/output/w_ijkt_ind_83", replace

use "../../data/output/w_ijkt_ind_87", clear
sort origin destination crop year
save "../../data/output/w_ijkt_ind_87", replace

* open
use "../../data/output/origin_dest_crop_ind", clear

* merge with L_iktlag, 1983
sort origin crop year
merge origin crop year using "../../data/output/L_iktlag_ind_83"
drop _merge

* merge with L_ijkt, 1983
sort origin destination crop year
merge origin destination crop year using "../../data/output/L_ijkt_ind_83"
drop _merge

* merge with w_ijkt, 1983
sort origin destination crop year
merge origin destination crop year using "../../data/output/w_ijkt_ind_83"
drop _merge

* save
keep if year == 1983
sort origin destination crop year
save ".././temp/India_83", replace

* open
use "../../data/output/origin_dest_crop_ind", clear

* merge with L_iktlag, 1987
sort origin crop year
merge origin crop year using "../../data/output/L_iktlag_ind_87"
drop _merge

* merge with L_ijkt, 1987
sort origin destination crop year
merge origin destination crop year using "../../data/output/L_ijkt_ind_87"
drop _merge

* merge with w_ijkt, 1987
sort origin destination crop year
merge origin destination crop year using "../../data/output/w_ijkt_ind_87"
drop _merge

* save
keep if year == 1987
sort origin destination crop year
save ".././temp/India_87", replace

* append
use ".././temp/India_83", clear
append using ".././temp/India_87"
sort origin destination crop year

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .
replace w_ijkt = . if w_ijkt == 0

* variables in logs
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)
gen w_ijkt_log = log(w_ijkt)

* fixed effects
*egen iota_jkt = group(destination crop year)
*egen iota_ijt = group(origin destination year)
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

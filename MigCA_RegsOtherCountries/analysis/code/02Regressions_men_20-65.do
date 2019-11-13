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
use "../../data/output/origin_dest_crop", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_70"
drop _merge

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/L_ijkt_80_men_20-65"
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

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_70lag80_ols

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_70lag80_ppml1

* Regression (11), PPML without zeros
ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_70lag80_ppml2

* Tables
noi: esttab reg11_70lag80_ols reg11_70lag80_ppml1 reg11_70lag80_ppml2 using ".././output/reg11_70lag80_men_20-65.tex", ///
se compress drop(_cons) stats(N r2_p, label("Observations" "Pseudo R-sq")) ///
label nodepvars nomtitles replace

********************************************************************************
*** 1970 (t, and t-1)
********************************************************************************

* open
use "../../data/output/origin_dest_crop", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_70"
drop _merge

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/L_ijkt_70_men_20-65"
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

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_70_ols

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_70_ppml1

* Regression (11), PPML without zeros
ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_70_ppml2

* Tables
noi: esttab reg11_70_ols reg11_70_ppml1 reg11_70_ppml2 using ".././output/reg11_70_men_20-65.tex", ///
se compress drop(_cons) stats(N r2_p, label("Observations" "Pseudo R-sq")) ///
label nodepvars nomtitles replace

********************************************************************************
*** 1980 (t, and t-1)
********************************************************************************

* open
use "../../data/output/origin_dest_crop", clear
collapse (mean) year, by(origin destination crop)
drop year

* merge with L_iktlag
sort origin crop
merge origin crop using "../../data/output/L_iktlag_80"
drop _merge

* merge with L_ijkt
sort origin destination crop
merge origin destination crop using "../../data/output/L_ijkt_80_men_20-65"
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

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ols

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml1

* Regression (11), PPML without zeros
ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_80_ppml2

* Tables
noi: esttab reg11_80_ols reg11_80_ppml1 reg11_80_ppml2 using ".././output/reg11_80_men_20-65.tex", ///
se compress drop(_cons) stats(N r2_p, label("Observations" "Pseudo R-sq")) ///
label nodepvars nomtitles replace

********************************************************************************
*** 1970 and 1980 together, year dimension becomes important
********************************************************************************

* sort datasets
use "../../data/output/L_iktlag_70", clear
sort origin crop year
save "../../data/output/L_iktlag_70", replace

use "../../data/output/L_iktlag_80", clear
sort origin crop year
save "../../data/output/L_iktlag_80", replace

use "../../data/output/L_ijkt_70_men_20-65", clear
sort origin destination crop year
save "../../data/output/L_ijkt_70_men_20-65", replace

use "../../data/output/L_ijkt_80_men_20-65", clear
sort origin destination crop year
save "../../data/output/L_ijkt_80_men_20-65", replace

* open
use "../../data/output/origin_dest_crop", clear

* merge with L_iktlag, 1970
sort origin crop year
merge origin crop year using "../../data/output/L_iktlag_70"
drop _merge

* merge with L_ijkt, 1970
sort origin destination crop year
merge origin destination crop year using "../../data/output/L_ijkt_70_men_20-65"
drop _merge

* save
keep if year == 1970
sort origin destination crop year
save ".././temp/Thailand_70", replace

* open
use "../../data/output/origin_dest_crop", clear

* merge with L_iktlag, 1980
sort origin crop year
merge origin crop year using "../../data/output/L_iktlag_80"
drop _merge

* merge with L_ijkt, 1980
sort origin destination crop year
merge origin destination crop year using "../../data/output/L_ijkt_80_men_20-65"
drop _merge

* save
keep if year == 1980
sort origin destination crop year
save ".././temp/Thailand_80", replace

* append
use ".././temp/Thailand_70", clear
append using ".././temp/Thailand_80"
sort origin destination crop year

* migration flows that are zero
replace L_ijkt = 0 if L_ijkt == .

* variables in logs
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)

* fixed effects
egen iota_jkt = group(destination crop year)
egen iota_ijt = group(origin destination year)

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_7080_ols

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_7080_ppml1

* Regression (11), PPML without zeros
ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
estimates store reg11_7080_ppml2

* Tables
noi: esttab reg11_7080_ols reg11_7080_ppml1 reg11_7080_ppml2 using ".././output/reg11_7080_men_20-65.tex", ///
se compress drop(_cons) stats(N r2_p, label("Observations" "Pseudo R-sq")) ///
label nodepvars nomtitles replace

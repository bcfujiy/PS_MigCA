********************************************************************************
*** setup
********************************************************************************

* housekeeping
clear all
set matsize 10000
set maxvar 25000

*** set directory

* Brian's computer
if "`c(username)'" == "Petrichor" {
	cd "/Users/`c(username)'/RA/PS_MigCA/MigCA_RegsOtherCountries/analysis/code"
}

* Sebastian's computer

* Heitor's computer

********************************************************************************
*** w_ijkt
********************************************************************************

* open
use "../../data/output/Brazil", clear

* keep HH head
keep if relate == 1

* keep relevant crops, 1970
replace ind = 1 if ind == 114 & year == 1970
replace ind = 3 if ind == 124 & year == 1970
replace ind = 4 if ind == 115 & year == 1970
replace ind = 5 if ind == 116 & year == 1970
replace ind = 6 if ind == 112 & year == 1970
replace ind = 8 if ind == 222 & year == 1970
replace ind = 9 if ind == 123 & year == 1970
replace ind = 10 if ind == 113 & year == 1970
replace ind = 12 if ind == 117 & year == 1970
replace ind = 13 if ind == 118 & year == 1970

* keep relevant crops, 1980
replace ind = 1 if ind == 14 & year == 1980
replace ind = 3 if ind == 27 & year == 1980
replace ind = 4 if ind == 15 & year == 1980
replace ind = 5 if ind == 16 & year == 1980
replace ind = 6 if ind == 12 & year == 1980
replace ind = 7 if ind == 20 & year == 1980
replace ind = 8 if ind == 41 & year == 1980
replace ind = 9 if ind == 26 & year == 1980
replace ind = 10 if ind == 13 & year == 1980
replace ind = 11 if ind == 21 & year == 1980
replace ind = 12 if ind == 17 & year == 1980
replace ind = 13 if ind == 18 & year == 1980

* keep relevant crops, 1991
replace ind = 1 if ind == 14 & year == 1991
replace ind = 2 if ind == 19 & year == 1991
replace ind = 3 if ind == 27 & year == 1991
replace ind = 4 if ind == 15 & year == 1991
replace ind = 5 if ind == 16 & year == 1991
replace ind = 6 if ind == 12 & year == 1991
replace ind = 7 if ind == 20 & year == 1991
replace ind = 8 if ind == 41 & year == 1991
replace ind = 9 if ind == 26 & year == 1991
replace ind = 10 if ind == 13 & year == 1991
replace ind = 11 if ind == 21 & year == 1991
replace ind = 12 if ind == 17 & year == 1991
replace ind = 13 if ind == 18 & year == 1991

* keep relevant crops, 2000
replace ind = 1 if ind == 1116 & year == 2000
replace ind = 2 if ind == 1108 & year == 2000
replace ind = 3 if ind == 1205 & year == 2000
replace ind = 4 if ind == 1114 & year == 2000
replace ind = 5 if ind == 1113 & year == 2000
replace ind = 6 if ind == 1104 & year == 2000
replace ind = 7 if ind == 1102 & year == 2000
replace ind = 8 if ind == 5001 & year == 2000
replace ind = 9 if ind == 1201 & year == 2000
replace ind = 10 if ind == 1101 & year == 2000
replace ind = 11 if ind == 1107 & year == 2000
replace ind = 12 if ind == 1105 & year == 2000
replace ind = 13 if ind == 1106 & year == 2000

* keep relevant crops, 2010
replace ind = 1 if ind == 1116 & year == 2010
replace ind = 2 if ind == 1108 & year == 2010
replace ind = 3 if ind == 1205 & year == 2010
replace ind = 4 if ind == 1114 & year == 2010
replace ind = 5 if ind == 1113 & year == 2010
replace ind = 6 if ind == 1104 & year == 2010
replace ind = 7 if ind == 1102 & year == 2010
replace ind = 8 if ind == 3001 & year == 2010
replace ind = 9 if ind == 1201 & year == 2010
replace ind = 10 if ind == 1101 & year == 2010
replace ind = 11 if ind == 1107 & year == 2010
replace ind = 12 if ind == 1105 & year == 2010
replace ind = 13 if ind == 1106 & year == 2010
keep if ind >= 1 & ind <= 13

* place of birth, dropping unknowns or foreign country
drop if bplbr >= 97 & bplbr <= 98

* keep ages 30-65
keep if age >= 30 & age <= 65

* renames
rename bplbr origin
rename mesobr destination
rename ind crop

* fixing origin variable
replace origin = origin + 76000

* drop new states
drop if origin == 76017
drop if origin == 76050

* LHS variable, intermediate step
gen w_ijkt = incearn*perwt
bys origin destination crop year: egen w_ijkt_den = total(perwt)

* collapse
collapse (sum) w_ijkt (mean) w_ijkt_den, by(origin destination crop year)

* LHS variable
replace w_ijkt = w_ijkt/w_ijkt_den
drop w_ijkt_den

* clean
sort origin destination crop year
merge origin destination crop year using "../../data/output/origin_dest_crop_br"
sort origin destination crop year
drop _merge
keep if year >= 2000
egen ijk = group(origin destination crop)
xtset ijk year
sort ijk year
bys ijk: gen w_ijkt_g = w_ijkt - w_ijkt[_n - 1]
keep if year == 2010

* graphs
histogram w_ijkt_g
graph export ".././output/w_ijkt_histogram.png", replace

histogram w_ijkt_g if w_ijkt_g > -5000 & w_ijkt_g < 5000
graph export ".././output/w_ijkt_histogram_zoom.png", replace

********************************************************************************
*** L_jt over time
********************************************************************************

* open
use "../../data/output/Brazil", clear

* RHS variable
gen L_jt = 1

* Weighting
replace L_jt = L_jt*perwt

* renames
rename geo1_br destination

* collapse
collapse (sum) L_jt, by(destination year)

* keep
keep if year >= 1970

* denominator
gen L_jt_den = L_jt if year == 1970
bysort destination: carryforward L_jt_den, replace
replace L_jt = L_jt/L_jt_den
drop L_jt_den

* graph
sort destination year
xtset destination year
xtline L_jt, overlay
graph export ".././output/L_jt_overtime.png", replace

********************************************************************************
*** L_kt over time, base 1970
********************************************************************************

* open
use "../../data/output/Brazil", clear

* keep relevant crops, 1970
replace ind = 1 if ind == 114 & year == 1970
replace ind = 3 if ind == 124 & year == 1970
replace ind = 4 if ind == 115 & year == 1970
replace ind = 5 if ind == 116 & year == 1970
replace ind = 6 if ind == 112 & year == 1970
replace ind = 8 if ind == 222 & year == 1970
replace ind = 9 if ind == 123 & year == 1970
replace ind = 10 if ind == 113 & year == 1970
replace ind = 12 if ind == 117 & year == 1970
replace ind = 13 if ind == 118 & year == 1970

* keep relevant crops, 1980
replace ind = 1 if ind == 14 & year == 1980
replace ind = 3 if ind == 27 & year == 1980
replace ind = 4 if ind == 15 & year == 1980
replace ind = 5 if ind == 16 & year == 1980
replace ind = 6 if ind == 12 & year == 1980
replace ind = 8 if ind == 41 & year == 1980
replace ind = 9 if ind == 26 & year == 1980
replace ind = 10 if ind == 13 & year == 1980
replace ind = 12 if ind == 17 & year == 1980
replace ind = 13 if ind == 18 & year == 1980

* keep relevant crops, 1991
replace ind = 1 if ind == 14 & year == 1991
replace ind = 3 if ind == 27 & year == 1991
replace ind = 4 if ind == 15 & year == 1991
replace ind = 5 if ind == 16 & year == 1991
replace ind = 6 if ind == 12 & year == 1991
replace ind = 8 if ind == 41 & year == 1991
replace ind = 9 if ind == 26 & year == 1991
replace ind = 10 if ind == 13 & year == 1991
replace ind = 12 if ind == 17 & year == 1991
replace ind = 13 if ind == 18 & year == 1991

* keep relevant crops, 2000
replace ind = 1 if ind == 1116 & year == 2000
replace ind = 3 if ind == 1205 & year == 2000
replace ind = 4 if ind == 1114 & year == 2000
replace ind = 5 if ind == 1113 & year == 2000
replace ind = 6 if ind == 1104 & year == 2000
replace ind = 8 if ind == 5001 & year == 2000
replace ind = 9 if ind == 1201 & year == 2000
replace ind = 10 if ind == 1101 & year == 2000
replace ind = 12 if ind == 1105 & year == 2000
replace ind = 13 if ind == 1106 & year == 2000

* keep relevant crops, 2010
replace ind = 1 if ind == 1116 & year == 2010
replace ind = 3 if ind == 1205 & year == 2010
replace ind = 4 if ind == 1114 & year == 2010
replace ind = 5 if ind == 1113 & year == 2010
replace ind = 6 if ind == 1104 & year == 2010
replace ind = 8 if ind == 3001 & year == 2010
replace ind = 9 if ind == 1201 & year == 2010
replace ind = 10 if ind == 1101 & year == 2010
replace ind = 12 if ind == 1105 & year == 2010
replace ind = 13 if ind == 1106 & year == 2010
keep if ind >= 1 & ind <= 13

* RHS variable
gen L_kt = 1

* Weighting
replace L_kt = L_kt*perwt

* renames
rename ind crop

* collapse
collapse (sum) L_kt, by(crop year)

* keep
keep if year >= 1970

* denominator
gen L_kt_den = L_kt if year == 1970
bysort crop: carryforward L_kt_den, replace
replace L_kt = L_kt/L_kt_den
drop L_kt_den

* graph
sort crop year
xtset crop year
xtline L_kt, overlay
graph export ".././output/L_kt1_overtime.png", replace

********************************************************************************
*** L_kt over time, base 1991
********************************************************************************

* open
use "../../data/output/Brazil", clear

* keep relevant crops, 1991
replace ind = 1 if ind == 14 & year == 1991
replace ind = 2 if ind == 19 & year == 1991
replace ind = 3 if ind == 27 & year == 1991
replace ind = 4 if ind == 15 & year == 1991
replace ind = 5 if ind == 16 & year == 1991
replace ind = 6 if ind == 12 & year == 1991
replace ind = 7 if ind == 20 & year == 1991
replace ind = 8 if ind == 41 & year == 1991
replace ind = 9 if ind == 26 & year == 1991
replace ind = 10 if ind == 13 & year == 1991
replace ind = 11 if ind == 21 & year == 1991
replace ind = 12 if ind == 17 & year == 1991
replace ind = 13 if ind == 18 & year == 1991

* keep relevant crops, 2000
replace ind = 1 if ind == 1116 & year == 2000
replace ind = 2 if ind == 1108 & year == 2000
replace ind = 3 if ind == 1205 & year == 2000
replace ind = 4 if ind == 1114 & year == 2000
replace ind = 5 if ind == 1113 & year == 2000
replace ind = 6 if ind == 1104 & year == 2000
replace ind = 7 if ind == 1102 & year == 2000
replace ind = 8 if ind == 5001 & year == 2000
replace ind = 9 if ind == 1201 & year == 2000
replace ind = 10 if ind == 1101 & year == 2000
replace ind = 11 if ind == 1107 & year == 2000
replace ind = 12 if ind == 1105 & year == 2000
replace ind = 13 if ind == 1106 & year == 2000

* keep relevant crops, 2010
replace ind = 1 if ind == 1116 & year == 2010
replace ind = 2 if ind == 1108 & year == 2010
replace ind = 3 if ind == 1205 & year == 2010
replace ind = 4 if ind == 1114 & year == 2010
replace ind = 5 if ind == 1113 & year == 2010
replace ind = 6 if ind == 1104 & year == 2010
replace ind = 7 if ind == 1102 & year == 2010
replace ind = 8 if ind == 3001 & year == 2010
replace ind = 9 if ind == 1201 & year == 2010
replace ind = 10 if ind == 1101 & year == 2010
replace ind = 11 if ind == 1107 & year == 2010
replace ind = 12 if ind == 1105 & year == 2010
replace ind = 13 if ind == 1106 & year == 2010
keep if ind >= 1 & ind <= 13

* RHS variable
gen L_kt = 1

* Weighting
replace L_kt = L_kt*perwt

* renames
rename ind crop

* collapse
collapse (sum) L_kt, by(crop year)

* keep
keep if year >= 1991

* denominator
gen L_kt_den = L_kt if year == 1991
bysort crop: carryforward L_kt_den, replace
replace L_kt = L_kt/L_kt_den
drop L_kt_den

* graph
sort crop year
xtset crop year
xtline L_kt, overlay
graph export ".././output/L_kt1_overtime.png", replace

********************************************************************************
*** Migration flows
********************************************************************************

* open
use "../../data/output/Brazil", clear

* 2010
keep if year == 2010 | year == 2000

* keep HH head
keep if relate == 1

* keep relevant crops, 2000
replace ind = 1 if ind == 1116 & year == 2000
replace ind = 2 if ind == 1108 & year == 2000
replace ind = 3 if ind == 1205 & year == 2000
replace ind = 4 if ind == 1114 & year == 2000
replace ind = 5 if ind == 1113 & year == 2000
replace ind = 6 if ind == 1104 & year == 2000
replace ind = 7 if ind == 1102 & year == 2000
replace ind = 8 if ind == 5001 & year == 2000
replace ind = 9 if ind == 1201 & year == 2000
replace ind = 10 if ind == 1101 & year == 2000
replace ind = 11 if ind == 1107 & year == 2000
replace ind = 12 if ind == 1105 & year == 2000
replace ind = 13 if ind == 1106 & year == 2000

* keep relevant crops, 2010
replace ind = 1 if ind == 1116 & year == 2010
replace ind = 2 if ind == 1108 & year == 2010
replace ind = 3 if ind == 1205 & year == 2010
replace ind = 4 if ind == 1114 & year == 2010
replace ind = 5 if ind == 1113 & year == 2010
replace ind = 6 if ind == 1104 & year == 2010
replace ind = 7 if ind == 1102 & year == 2010
replace ind = 8 if ind == 3001 & year == 2010
replace ind = 9 if ind == 1201 & year == 2010
replace ind = 10 if ind == 1101 & year == 2010
replace ind = 11 if ind == 1107 & year == 2010
replace ind = 12 if ind == 1105 & year == 2010
replace ind = 13 if ind == 1106 & year == 2010
keep if ind >= 1 & ind <= 13

* place of birth, dropping unknowns or foreign country
drop if bplbr >= 97 & bplbr <= 98

* keep ages 30-65
keep if age >= 30 & age <= 65

* RHS variable
gen L_ijkt = 1

* Weighting
replace L_ijkt = L_ijkt*perwt

* renames
rename bplbr origin
rename mesobr destination
rename ind crop

* collapse
collapse (sum) L_ijkt, by(origin destination crop year)

* fixing origin variable
replace origin = origin + 76000

* drop new states
drop if origin == 76017
drop if origin == 76050

* clean
sort origin destination crop year
merge origin destination crop year using "../../data/output/origin_dest_crop_br"
sort origin destination crop year
drop _merge
replace L_ijkt = 0 if L_ijkt == .
egen ijk = group(origin destination crop)
xtset ijk year
sort ijk year
bys ijk: gen L_ijkt_g = L_ijkt - L_ijkt[_n - 1]
keep if year == 2010

* graphs
histogram L_ijkt_g
graph export ".././output/L_ijkt_histogram.png", replace

histogram L_ijkt_g if L_ijkt_g != 0
graph export ".././output/L_ijkt_histogram_nozeros.png", replace

histogram L_ijkt_g if L_ijkt_g != 0 & L_ijkt_g > -1000 & L_ijkt_g < 1000
graph export ".././output/w_ijkt_histogram_nozeroz_zoom.png", replace

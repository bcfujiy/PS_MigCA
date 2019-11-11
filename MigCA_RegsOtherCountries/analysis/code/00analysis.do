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
*** Creating list of origin/destination
********************************************************************************

*** LIST OF LOCATIONS
* open
use "../../data/output/Thailand", clear

* define locations
keep geo1_th

* generate auxiliary variable
gen baba = 0

* list of locations
collapse (sum) baba, by(geo1_th)
drop baba

* save
sort geo1_th
save ".././output/locations", replace

*** LIST OF LOCATIONS 1
* open
use ".././output/locations", clear

* repeat
expand 68
sort geo1_th
rename geo1_th origin

* save
gen glue = _n
sort glue
save ".././output/locations1", replace

*** LIST OF LOCATIONS 2
* open
use ".././output/locations", clear

* repeat
forval i = 1(1)67 {

	append using ".././output/locations"

}

* list of locations
rename geo1_th destination

* save
gen glue = _n
sort glue
save ".././output/locations2", replace

*** MERGE
* open
use ".././output/locations1", clear

* merge
merge glue using ".././output/locations2"
drop _merge glue

* creating crops
expand 13
sort origin destination
bys origin destination: gen crop = _n

* save
sort origin destination crop
save ".././output/origin_dest_crop", replace

********************************************************************************
*** Thailand, 1970
********************************************************************************

* open
use "../../data/output/Thailand", clear

* 1970
keep if year == 1970

* keep HH head
keep if relate == 1

* keep relevant crops: 0 (rice), 1 (corn), 2 (rubber), 3 (cassava), 
* 4 (coconut), 5 (tabacco + cotton + tea + coffee + hemp), 6 (vegetables?), 
* 7 (fruits), 8 (other agric.), 9 (poultry + other animals), 10 (wood), 
* 11 (fish), 12 (hunting)
keep if ind >= 0 & ind <= 12

* drop unknown previous location
drop if geomig1_p == 764999 | geomig1_p == 764098 | geomig1_p == 764997 ///
| geomig1_p == 764998

* attaching previous location
replace geomig1_p = geo1_th if geomig1_p == 764097

* RHS variable
gen L_iktlag_aux = 1
bys geomig1_p ind: egen L_iktlag = count(L_iktlag_aux)

* Migration flows
gen L_ijkt_aux = 1
bys geomig1_p geo1_th ind: egen L_ijkt = count(L_ijkt_aux)

* renames
rename geomig1_p origin
rename geo1_th destination
rename ind crop

* collapse
collapse (mean) L_ijkt L_iktlag, by(origin destination crop)

* merge with mold
sort origin destination crop
merge origin destination crop using ".././output/origin_dest_crop"
sort origin destination crop

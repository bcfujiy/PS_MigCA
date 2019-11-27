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
*** Creating list of origin/destination
********************************************************************************

*** LIST OF LOCATIONS
* open
use ".././output/India", clear

* define locations
keep geo1_in

* generate auxiliary variable
gen baba = 0

* list of locations
collapse (sum) baba, by(geo1_in)
drop if geo1_in == .
drop baba

* save
sort geo1_in
save ".././temp/locations_ind", replace

*** LIST OF LOCATIONS 1
* open
use ".././temp/locations_ind", clear

* repeat
expand 31
sort geo1_in
rename geo1_in origin

* save
gen glue = _n
sort glue
save ".././temp/locations1_ind", replace

*** LIST OF LOCATIONS 2
* open
use ".././temp/locations_ind", clear

* repeat
forval i = 1(1)30 {

	append using ".././temp/locations_ind"

}

* list of locations
rename geo1_in destination

* save
gen glue = _n
sort glue
save ".././temp/locations2_ind", replace

*** MERGE
* open
use ".././temp/locations1_ind", clear

* merge
merge glue using ".././temp/locations2_ind"
drop _merge glue

* Crops:
* (1983, 1987) = [ (0,0);(1,1);(2,2);(3+4,3);(6,5);(7,6);(10,10);(11,11);(12,12)
* (13,13);(14+15,14);(16,16);(17,17);(18,18);(20,20+21);(21,22);(22,23);(23,24)
* (24,25);(25,26);(60,60);(61,61);(62,62) ]

* creating crops
expand 23
sort origin destination
bys origin destination: gen crop = _n
replace crop = 0 if crop == 1
replace crop = 1 if crop == 2
replace crop = 2 if crop == 3
replace crop = 3 if crop == 4
replace crop = 5 if crop == 5
replace crop = 6 if crop == 6
replace crop = 62 if crop == 23
replace crop = 61 if crop == 22
replace crop = 60 if crop == 21
replace crop = 26 if crop == 20
replace crop = 25 if crop == 19
replace crop = 24 if crop == 18
replace crop = 23 if crop == 17
replace crop = 22 if crop == 16
replace crop = 20 if crop == 15
replace crop = 18 if crop == 14
replace crop = 17 if crop == 13
replace crop = 16 if crop == 12
replace crop = 14 if crop == 11
replace crop = 13 if crop == 10
replace crop = 12 if crop == 9
replace crop = 11 if crop == 8
replace crop = 10 if crop == 7

* creating years
expand 2
sort origin destination crop
bys origin destination crop: gen year = _n + 1982
replace year = year + 3 if year == 1984

* save
sort origin destination crop
save ".././output/origin_dest_crop_ind", replace

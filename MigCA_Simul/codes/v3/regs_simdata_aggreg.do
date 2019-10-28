* Open simulated data
import delimited using "$outputs/simulated_aggreg.csv", clear

* Renaming
rename v1 dim_i
rename v2 dim_j
rename v3 dim_k
rename v4 dim_t
rename v5 earn
rename v6 L_ijkt
rename v7 L_iktlag

* Variables in logs
gen earn_log = log(earn)
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)

* FEs
egen iota_jkt = group(dim_j dim_k dim_t)
egen iota_ijt = group(dim_i dim_j dim_t)

* Regression (10), OLS
reghdfe earn_log L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

* Regression (10), PPML
ppmlhdfe earn L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

* Regression (11), OLS
reghdfe L_ijkt_log L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

* Regression (11), PPML
ppmlhdfe L_ijkt L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

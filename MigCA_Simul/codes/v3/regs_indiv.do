* Open simulated data
import delimited using "$outputs/simulated_sampled.csv", clear

* Renaming
rename v1 dim_i
rename v2 dim_j
rename v3 dim_k
rename v4 dim_t
rename v5 sample_earn
rename v6 sample_L_ijkt
rename v7 sample_L_iktlag
rename v8 L_iktlag

* Variables in logs
gen sample_earn_log = log(sample_earn)
gen sample_L_ijkt_log = log(sample_L_ijkt)
gen sample_L_iktlag_log = log(sample_L_iktlag)
gen L_iktlag_log = log(L_iktlag)

* FEs
egen iota_jkt = group(dim_j dim_k dim_t)
egen iota_ijt = group(dim_i dim_j dim_t)

* Regression (10), OLS
reghdfe sample_earn_log sample_L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
reghdfe sample_earn_log L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

* Regression (10), PPML
ppmlhdfe sample_earn sample_L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
ppmlhdfe sample_earn L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

* Regression (11), OLS
reghdfe sample_L_ijkt_log sample_L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
reghdfe sample_L_ijkt_log L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

* Regression (11), PPML
ppmlhdfe sample_L_ijkt sample_L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
ppmlhdfe sample_L_ijkt L_iktlag_log, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)

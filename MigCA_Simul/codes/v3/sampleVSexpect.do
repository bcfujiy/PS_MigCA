* Open simulated data
import delimited using "$outputs/simulated_sampled_all.csv", clear

* Renaming
rename v1 N_s // 1: 0.05 | 2: 0.1 | 3: 0.25 | 4: 0.5 | 5: 1
rename v2 dim_i
rename v3 dim_j
rename v4 dim_k
rename v5 dim_t
rename v6 sample_earn
rename v7 sample_L_ijkt
rename v8 sample_L_iktlag
rename v9 L_ijkt
rename v10 L_iktlag

* Correcting variables
replace sample_earn = . if sample_earn == 0

* Variables in logs
gen sample_earn_log = log(sample_earn)
gen sample_L_ijkt_log = log(sample_L_ijkt)
gen sample_L_iktlag_log = log(sample_L_iktlag)
gen L_ijkt_log = log(L_ijkt)
gen L_iktlag_log = log(L_iktlag)

* Scatterplot comparing sampled vs expect L_ijkt, in levels
twoway (scatter L_ijkt sample_L_ijkt) (function y = x, range(0 0.01)), ///
ytitle("Migration flows") xtitle("Sampled migration flows") graphregion(color(white)) ///
ylabel(, nogrid) legend(off)
graph export "$outputs/L_ijkt_compare.png", replace

* Scatterplot comparing sampled vs expect L_ijkt, in logs
twoway (scatter L_ijkt_log sample_L_ijkt_log) (function y = x, range(-12 -4.6)), ///
ytitle("Migration flows, log") xtitle("Sampled migration flows, log") graphregion(color(white)) ///
ylabel(, nogrid) legend(off)
graph export "$outputs/L_ijkt_log_compare.png", replace

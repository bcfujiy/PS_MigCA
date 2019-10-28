* Housekeeping
clear all

* Open simulated data
import delimited using "$outputs/simulated_sampled_all_mod6.csv", clear

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

* FEs
egen iota_jkt = group(dim_j dim_k dim_t)
egen iota_ijt = group(dim_i dim_j dim_t)

* Median of labor allocations
bys N_s dim_t: egen med_L_iktlag_log = median(L_iktlag_log)
bys N_s dim_t: egen med_sample_L_iktlag_log = median(sample_L_iktlag_log)
sort N_s dim_i dim_j dim_k dim_t

* Regression (10), RHS is the sampled one
forval i = 1/5 {

	reghdfe sample_earn_log sample_L_iktlag_log if N_s == `i' & ///
	dim_i != dim_j & sample_L_iktlag_log >= med_sample_L_iktlag_log, ///
	absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	
	estimates store reg10_sample_ols_`i'
		
}

noi: esttab reg10_sample_ols_* using "$paper/reg10_sample_mod7_ols.tex", ///
se(2) compress drop(_cons) stats(N r2, label("Observations" "R-sq")) ///
nodepvars nomtitles replace

forval i = 1/5 {
	
	ppmlhdfe sample_earn sample_L_iktlag_log if N_s == `i' & ///
	dim_i != dim_j & L_iktlag_log >= med_L_iktlag_log, ///
	absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
		
	estimates store reg10_sample_ppml`i'
	
}

noi: esttab reg10_sample_ppml* using "$paper/reg10_sample_mod7_ppml.tex", ///
se(2) compress drop(_cons) stats(N r2_p, label("Observations" "Pseudo R-sq")) ///
nodepvars nomtitles replace

* Regression (10), RHS is the expectational one
forval i = 1/5 {

	reghdfe sample_earn_log L_iktlag_log if N_s == `i' & ///
	dim_i != dim_j & L_iktlag_log >= med_L_iktlag_log, ///
	absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	
	estimates store reg10_expect_ols_`i'
	
}

noi: esttab reg10_expect_ols_* using "$paper/reg10_expect_mod7_ols.tex", ///
se compress drop(_cons) stats(N r2, label("Observations" "R-sq")) ///
label nodepvars nomtitles replace

forval i = 1/5 {
	
	ppmlhdfe sample_earn L_iktlag_log if N_s == `i' & ///
	dim_i != dim_j & L_iktlag_log >= med_L_iktlag_log, ///
	absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
		
	estimates store reg10_expect_ppml`i'
	
}

noi: esttab reg10_expect_ppml* using "$paper/reg10_expect_mod7_ppml.tex", ///
se compress drop(_cons) stats(N r2_p, label("Observations" "Pseudo R-sq")) ///
label nodepvars nomtitles replace

* Regression (11), RHS is the sampled one
forval i = 1/5 {

	reghdfe sample_L_ijkt_log sample_L_iktlag_log if N_s == `i' & ///
	dim_i != dim_j & sample_L_iktlag_log >= med_sample_L_iktlag_log, ///
	absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	
	estimates store reg11_sample_ols_`i'
	
}

noi: esttab reg11_sample_ols_* using "$paper/reg11_sample_mod7_ols.tex", ///
se compress drop(_cons) stats(N r2, label("Observations" "R-sq")) ///
label nodepvars nomtitles replace

forval i = 1/5 {
	
	ppmlhdfe sample_L_ijkt sample_L_iktlag_log if N_s == `i' & ///
	dim_i != dim_j & sample_L_iktlag_log >= med_sample_L_iktlag_log, ///
	absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	
	estimates store reg11_sample_ppml`i'
	
}

noi: esttab reg11_sample_ppml* using "$paper/reg11_sample_mod7_ppml.tex", ///
se compress drop(_cons) stats(N r2_p, label("Observations" "Pseudo R-sq")) ///
label nodepvars nomtitles replace

* Regression (11), RHS is the expectational one
forval i = 1/5 {

	reghdfe sample_L_ijkt_log L_iktlag_log if N_s == `i' & ///
	dim_i != dim_j & L_iktlag_log >= med_L_iktlag_log, ///
	absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	
	estimates store reg11_expect_ols_`i'
	
}

noi: esttab reg11_expect_ols_* using "$paper/reg11_expect_mod7_ols.tex", ///
se compress drop(_cons) stats(N r2, label("Observations" "R-sq")) ///
label nodepvars nomtitles replace

* Regression for i = 1 does not converge
forval i = 2/5 {
	
	ppmlhdfe sample_L_ijkt L_iktlag_log if N_s == `i' & ///
	dim_i != dim_j & L_iktlag_log >= med_L_iktlag_log, ///
	absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	
	estimates store reg11_expect_ppml`i'
	
}

noi: esttab reg11_expect_ppml* using "$paper/reg11_expect_mod7_ppml.tex", ///
se compress drop(_cons) stats(N r2_p, label("Observations" "Pseudo R-sq")) ///
label nodepvars nomtitles replace

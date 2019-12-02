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
*** programs, 1970 (t-1), 1980 (t)
********************************************************************************

program main
	run_regressions_L_07
	make_table_L_07
	run_regressions_w_07
	make_table_w_07
end

program run_regressions_L_07
	
	* coefficients and significance
	mat coef = J(10,9,.)
	mat sign = J(2,9,.)

	*** ORIGINAL SAMPLE
	* open
	use "../../data/output/origin_dest_crop_za", clear
	collapse (mean) year, by(origin destination crop)
	drop year

	* merge with L_iktlag
	sort origin crop
	merge origin crop using "../../data/output/L_iktlag_za_07"
	drop _merge

	* merge with L_ijkt
	sort origin destination crop
	merge origin destination crop using "../../data/output/L_ijkt_za_07"
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
	get_results 1 1 L_iktlag_log
	* Regression (11), OLS without zeros
	reghdfe L_ijkt_log L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 1 2 L_iktlag_log
	* Regression (11), OLS with only jkt fixed effects
	reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 1 3 L_iktlag_log
	* Regression (11), PPML
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 1 L_iktlag_log
	* Regression (11), PPML without zeros
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 2 L_iktlag_log
	* Regression (11), PPML with only jkt fixed effects
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 2 3 L_iktlag_log
	
	*** SAMPLE OF MEN HH HEADS
	* open
	use "../../data/output/origin_dest_crop_za", clear
	collapse (mean) year, by(origin destination crop)
	drop year

	* merge with L_iktlag
	sort origin crop
	merge origin crop using "../../data/output/L_iktlag_za_07"
	drop _merge

	* merge with L_ijkt
	sort origin destination crop
	merge origin destination crop using "../../data/output/L_ijkt_za_07_men"
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
	get_results 1 4 L_iktlag_log
	* Regression (11), OLS without zeros
	reghdfe L_ijkt_log L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 1 5 L_iktlag_log
	* Regression (11), OLS with only jkt fixed effects
	reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 1 6 L_iktlag_log
	* Regression (11), PPML
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 4 L_iktlag_log
	* Regression (11), PPML without zeros
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 5 L_iktlag_log
	* Regression (11), PPML with only jkt fixed effects
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 2 6 L_iktlag_log
	
	*** SAMPLE OF MEN HH HEADS, 20-65 YEARS OLD
	* open
	use "../../data/output/origin_dest_crop_za", clear
	collapse (mean) year, by(origin destination crop)
	drop year

	* merge with L_iktlag
	sort origin crop
	merge origin crop using "../../data/output/L_iktlag_za_07"
	drop _merge

	* merge with L_ijkt
	sort origin destination crop
	merge origin destination crop using "../../data/output/L_ijkt_za_07_men_20-65"
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
	get_results 1 7 L_iktlag_log
	* Regression (11), OLS without zeros
	reghdfe L_ijkt_log L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 1 8 L_iktlag_log
	* Regression (11), OLS with only jkt fixed effects
	reghdfe L_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 1 9 L_iktlag_log
	* Regression (11), PPML
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 7 L_iktlag_log
	* Regression (11), PPML without zeros
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 8 L_iktlag_log
	* Regression (11), PPML with only jkt fixed effects
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 2 9 L_iktlag_log

end

program make_table_L_07
	clear
	svmat coef
	
	foreach var of varlist coef* {
		gen aux`var' = string(`var')
		drop `var'
		gen `var' = aux`var'
		drop aux`var'
		replace `var' = "0" + substr(`var',1,4) if (_n == 2 | _n == 7) & substr(`var',1,1) != "-"
		replace `var' = "-0" + substr(`var',2,4) if (_n == 2 | _n == 7) & substr(`var',1,1) == "-"
		replace `var' = "0" + substr(`var',1,4) if _n == 3 | _n == 4 | _n == 8 | _n == 9
		replace `var' = "(" + `var' + ")" if _n == 3 | _n == 8		
		replace `var' = "" if `var' == "."
		replace `var' = "-" if `var' == "0."
		replace `var' = "-" if `var' == "(0.)"
		}
		
	forvalues ii = 1/2 {
		local jj = 1
		foreach var of varlist coef* {			
			local auxvar = sign[`ii',`jj']
			local obs = (`ii'-1)*5 + 2
			if `auxvar' < 0.01{
			replace `var' = `var' + "***" if _n == `obs'
			}
			else if (`auxvar'>=0.01 & `auxvar'<=0.05){
			replace `var' = `var' + "**" if _n == `obs'
			}
			else if (`auxvar'>0.05 & `auxvar'<=0.10){
			replace `var' = `var' + "*" if _n == `obs'
			}
			local jj = `jj' + 1
			}
		}
		
	gen col1 = ""
	replace col1 = "\emph{Migration Flows, OLS} \\ %%%" if _n == 1
	replace col1 = "\hline \emph{Migration Flows, PPML} \\ %%%" if _n == 6
	replace col1 = "Farmers in origin" if _n == 2 | _n == 7
	replace col1 = "R$^2$" if _n == 4 | _n == 9
	replace col1 = "Obs" if _n == 5 | _n == 10

	#delimit;
	listtab col1 coef1 coef2 coef3 coef4 coef5 coef6 coef7 coef8 coef9
			using ".././output/regs_ZA_L.tex", type 		
			rstyle(tabular) 									
			head("\begin{sideways}\begin{tabular}{l|ccc|ccc|ccc}\hline"
			"& (1) & (2) & (3) & (4) & (5) & (6) & (7) & (8) & (9) \\ \hline") 
			foot("\hline"
				"Dest-Crop-Year FE     		& Y & Y &   & Y & Y &   & Y & Y &   \\"				
				"Orig-Dest-Year FE 	  		& Y & Y & Y & Y & Y & Y & Y & Y & Y \\"				
				"Without zeros        		&   & Y &   &   & Y &   &   & Y &   \\"								
				"Men HH heads        		&   &   &   & Y & Y & Y &   &   &   \\"								
				"Men HH heads, 20-65 y/o    &   &   &   &   &   &   & Y & Y & Y \\"								
				"\hline"
				"\\ \multicolumn{10}{p{19cm}}{\textbf{Notes:} * / ** / *** denotes significance at the 10 / 5 / 1 percent level. Standard errors are clustered at the destination-crop-year level, and are reported in parentheses. An observation is a cell at the origin-destination-crop-year level. Columns (1), (2), and (3) are based on a sample of 30-65 years old migrants. In columns (4), (5), and (6) the sample is comprised by men between 30-65 years old. In columns (7), (8), and (9) the sample is comprised by men between 20-65 years old. The covariate is the log of of agricultural workers in the same activity in the region of origin. The dependent variable is the log of migrant agricultural workers from an origin to a destination region working in an activity. Both the covariate and the dependent variable are are based on the 2007 census. We exclude non-migrants from the sample.}"
				"\end{tabular}\end{sideways}")
				replace;
	#delimit cr	
end

program run_regressions_w_07
	
	* coefficients and significance
	mat coef = J(10,6,.)
	mat sign = J(2,6,.)

	*** ORIGINAL SAMPLE
	* open
	use "../../data/output/origin_dest_crop_za", clear
	collapse (mean) year, by(origin destination crop)
	drop year

	* merge with L_iktlag
	sort origin crop
	merge origin crop using "../../data/output/L_iktlag_za_07"
	drop _merge

	* merge with L_ijkt
	sort origin destination crop
	merge origin destination crop using "../../data/output/w_ijkt_za_07"
	sort origin destination crop
	drop _merge

	* variables in logs
	gen w_ijkt_log = log(w_ijkt)
	gen L_iktlag_log = log(L_iktlag)

	* fixed effects
	egen iota_jkt = group(destination crop)
	egen iota_ijt = group(origin destination)

	* Regression (11), OLS
	reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 1 1 L_iktlag_log
	* Regression (11), OLS with only jkt fixed effects
	reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 1 2 L_iktlag_log
	* Regression (11), PPML
	ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 1 L_iktlag_log
	* Regression (11), PPML with only jkt fixed effects
	ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 2 2 L_iktlag_log
	
	*** SAMPLE OF MEN HH HEADS
	* open
	use "../../data/output/origin_dest_crop_za", clear
	collapse (mean) year, by(origin destination crop)
	drop year

	* merge with L_iktlag
	sort origin crop
	merge origin crop using "../../data/output/L_iktlag_za_07"
	drop _merge

	* merge with L_ijkt
	sort origin destination crop
	merge origin destination crop using "../../data/output/L_ijkt_za_07_men"
	sort origin destination crop
	drop _merge

	* variables in logs
	gen w_ijkt_log = log(L_ijkt)
	gen L_iktlag_log = log(L_iktlag)

	* fixed effects
	egen iota_jkt = group(destination crop)
	egen iota_ijt = group(origin destination)

	* Regression (11), OLS
	reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 1 3 L_iktlag_log
	* Regression (11), OLS with only jkt fixed effects
	reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 1 4 L_iktlag_log
	* Regression (11), PPML
	ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 3 L_iktlag_log
	* Regression (11), PPML with only jkt fixed effects
	ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 2 4 L_iktlag_log
	
	*** SAMPLE OF MEN HH HEADS, 20-65 YEARS OLD
	* open
	use "../../data/output/origin_dest_crop_za", clear
	collapse (mean) year, by(origin destination crop)
	drop year

	* merge with L_iktlag
	sort origin crop
	merge origin crop using "../../data/output/L_iktlag_za_07"
	drop _merge

	* merge with L_ijkt
	sort origin destination crop
	merge origin destination crop using "../../data/output/L_ijkt_za_07_men_20-65"
	sort origin destination crop
	drop _merge

	* variables in logs
	gen w_ijkt_log = log(L_ijkt)
	gen L_iktlag_log = log(L_iktlag)

	* fixed effects
	egen iota_jkt = group(destination crop)
	egen iota_ijt = group(origin destination)

	* Regression (11), OLS
	reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 1 5 L_iktlag_log
	* Regression (11), OLS with only jkt fixed effects
	reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 1 6 L_iktlag_log
	* Regression (11), PPML
	ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 5 L_iktlag_log
	* Regression (11), PPML with only jkt fixed effects
	ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 2 6 L_iktlag_log

end

program make_table_w_07
	clear
	svmat coef
	
	foreach var of varlist coef* {
		gen aux`var' = string(`var')
		drop `var'
		gen `var' = aux`var'
		drop aux`var'
		replace `var' = "0" + substr(`var',1,4) if (_n == 2 | _n == 7) & substr(`var',1,1) != "-"
		replace `var' = "-0" + substr(`var',2,4) if (_n == 2 | _n == 7) & substr(`var',1,1) == "-"
		replace `var' = "0" + substr(`var',1,4) if _n == 3 | _n == 4 | _n == 8 | _n == 9
		replace `var' = "(" + `var' + ")" if _n == 3 | _n == 8		
		replace `var' = "" if `var' == "."
		replace `var' = "-" if `var' == "0."
		replace `var' = "-" if `var' == "(0.)"
		}
		
	forvalues ii = 1/2 {
		local jj = 1
		foreach var of varlist coef* {			
			local auxvar = sign[`ii',`jj']
			local obs = (`ii'-1)*5 + 2
			if `auxvar' < 0.01{
			replace `var' = `var' + "***" if _n == `obs'
			}
			else if (`auxvar'>=0.01 & `auxvar'<=0.05){
			replace `var' = `var' + "**" if _n == `obs'
			}
			else if (`auxvar'>0.05 & `auxvar'<=0.10){
			replace `var' = `var' + "*" if _n == `obs'
			}
			local jj = `jj' + 1
			}
		}
		
	gen col1 = ""
	replace col1 = "\emph{Earnings, OLS} \\ %%%" if _n == 1
	replace col1 = "\hline \emph{Earnings, PPML} \\ %%%" if _n == 6
	replace col1 = "Farmers in origin" if _n == 2 | _n == 7
	replace col1 = "R$^2$" if _n == 4 | _n == 9
	replace col1 = "Obs" if _n == 5 | _n == 10

	#delimit;
	listtab col1 coef1 coef2 coef3 coef4 coef5 coef6
			using ".././output/regs_ZA_w.tex", type 		
			rstyle(tabular) 									
			head("\begin{sideways}\begin{tabular}{l|cc|cc|cc}\hline"
			"& (1) & (2) & (3) & (4) & (5) & (6) \\ \hline") 
			foot("\hline"
				"Dest-Crop-Year FE     		& Y  &   & Y  &   & Y  &   \\"				
				"Orig-Dest-Year FE 	  		& Y  & Y & Y  & Y & Y  & Y \\"				
				"Men HH heads        		&    &   & Y  & Y &    &   \\"								
				"Men HH heads, 20-65 y/o    &    &   &    &   & Y  & Y \\"								
				"\hline"
				"\\ \multicolumn{7}{p{13cm}}{\textbf{Notes:} * / ** / *** denotes significance at the 10 / 5 / 1 percent level. Standard errors are clustered at the destination-crop-year level, and are reported in parentheses. An observation is a cell at the origin-destination-crop-year level. Columns (1) and (2) are based on a sample of 30-65 years old migrants. In columns (3) and (4) the sample is comprised by men between 30-65 years old. In columns (5) and (6) the sample is comprised by men between 20-65 years old. The covariate is the log of of agricultural workers in the same activity in the region of origin. The dependent variable is the log of average wages of migrant agricultural workers from an origin to a destination region working in an activity. Both the covariate and the dependent variable are based on the 2007 census. We exclude non-migrants from the sample.}"
				"\end{tabular}\end{sideways}")
				replace;
	#delimit cr	
end

program get_results
	mat coef[5*(`1'-1)+2,`2'] = _b[`3']
	mat coef[5*(`1'-1)+3,`2'] = _se[`3']
	mat coef[5*(`1'-1)+4,`2'] = e(r2)
	mat coef[5*(`1'-1)+5,`2'] = e(N_full)
	mat sign[`1',`2'] = 2*ttail(10000,abs(_b[`3']/_se[`3']))
end

main

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
	run_regressions_70lag80
	make_table_70lag80
	run_regressions_70
	make_table_70
	run_regressions_80
	make_table_80
	run_regressions_7080
	make_table_7080
end

program run_regressions_70lag80
	
	* coefficients and significance
	mat coef = J(10,9,.)
	mat sign = J(2,9,.)

	*** ORIGINAL SAMPLE
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
	merge origin destination crop using "../../data/output/L_ijkt_80"
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
	use "../../data/output/origin_dest_crop", clear
	collapse (mean) year, by(origin destination crop)
	drop year

	* merge with L_iktlag
	sort origin crop
	merge origin crop using "../../data/output/L_iktlag_70"
	drop _merge

	* merge with L_ijkt
	sort origin destination crop
	merge origin destination crop using "../../data/output/L_ijkt_80_men"
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

program make_table_70lag80
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
	replace col1 = "\emph{Migration flows, OLS} \\ %%%" if _n == 1
	replace col1 = "\hline \emph{Migration flows, PPML} \\ %%%" if _n == 6
	replace col1 = "Farmers in origin" if _n == 2 | _n == 7
	replace col1 = "R$^2$" if _n == 4 | _n == 9
	replace col1 = "Obs" if _n == 5 | _n == 10

	#delimit;
	listtab col1 coef1 coef2 coef3 coef4 coef5 coef6 coef7 coef8 coef9
			using ".././output/regs_TH_70lag80.tex", type 		
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
				"\\ \multicolumn{10}{p{19cm}}{\textbf{Notes:} * / ** / *** denotes significance at the 10 / 5 / 1 percent level. Standard errors are clustered at the destination-crop-year level, and are reported in parentheses. An observation is a cell at the origin-destination-crop-year level. Columns (1), (2), and (3) are based on a sample of 30-65 years old migrants. In columns (4), (5), and (6) the sample is comprised by men between 30-65 years old. In columns (7), (8), and (9) the sample is comprised by men between 20-65 years old. The covariate is the log of of agricultural workers in the same activity in the region of origin. The dependent variable is the log of migrant agricultural workers from an origin to a destination region working in an activity. The covariate is based on the 1970 census, while the dependent variable is based on the 1980 census. We exclude non-migrants from the sample.}"
				"\end{tabular}\end{sideways}")
				replace;
	#delimit cr	
end

program run_regressions_70
	
	* coefficients and significance
	mat coef = J(10,9,.)
	mat sign = J(2,9,.)

	*** ORIGINAL SAMPLE
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
	merge origin destination crop using "../../data/output/L_ijkt_70"
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
	use "../../data/output/origin_dest_crop", clear
	collapse (mean) year, by(origin destination crop)
	drop year

	* merge with L_iktlag
	sort origin crop
	merge origin crop using "../../data/output/L_iktlag_70"
	drop _merge

	* merge with L_ijkt
	sort origin destination crop
	merge origin destination crop using "../../data/output/L_ijkt_70_men"
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

program make_table_70
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
	replace col1 = "\emph{Migration flows, OLS} \\ %%%" if _n == 1
	replace col1 = "\hline \emph{Migration flows, PPML} \\ %%%" if _n == 6
	replace col1 = "Farmers in origin" if _n == 2 | _n == 7
	replace col1 = "R$^2$" if _n == 4 | _n == 9
	replace col1 = "Obs" if _n == 5 | _n == 10

	#delimit;
	listtab col1 coef1 coef2 coef3 coef4 coef5 coef6 coef7 coef8 coef9
			using ".././output/regs_TH_70.tex", type 		
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
				"\\ \multicolumn{10}{p{19cm}}{\textbf{Notes:} * / ** / *** denotes significance at the 10 / 5 / 1 percent level. Standard errors are clustered at the destination-crop-year level, and are reported in parentheses. An observation is a cell at the origin-destination-crop-year level. Columns (1), (2), and (3) are based on a sample of 30-65 years old migrants. In columns (4), (5), and (6) the sample is comprised by men between 30-65 years old. In columns (7), (8), and (9) the sample is comprised by men between 20-65 years old. The covariate is the log of of agricultural workers in the same activity in the region of origin. The dependent variable is the log of migrant agricultural workers from an origin to a destination region working in an activity. Both the covariate and the dependent variable are based on the 1970 census. We exclude non-migrants from the sample.}"
				"\end{tabular}\end{sideways}")
				replace;
	#delimit cr	
end

program run_regressions_80
	
	* coefficients and significance
	mat coef = J(10,9,.)
	mat sign = J(2,9,.)

	*** ORIGINAL SAMPLE
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
	merge origin destination crop using "../../data/output/L_ijkt_80"
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
	use "../../data/output/origin_dest_crop", clear
	collapse (mean) year, by(origin destination crop)
	drop year

	* merge with L_iktlag
	sort origin crop
	merge origin crop using "../../data/output/L_iktlag_80"
	drop _merge

	* merge with L_ijkt
	sort origin destination crop
	merge origin destination crop using "../../data/output/L_ijkt_80_men"
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

program make_table_80
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
	replace col1 = "\emph{Migration flows, OLS} \\ %%%" if _n == 1
	replace col1 = "\hline \emph{Migration flows, PPML} \\ %%%" if _n == 6
	replace col1 = "Farmers in origin" if _n == 2 | _n == 7
	replace col1 = "R$^2$" if _n == 4 | _n == 9
	replace col1 = "Obs" if _n == 5 | _n == 10

	#delimit;
	listtab col1 coef1 coef2 coef3 coef4 coef5 coef6 coef7 coef8 coef9
			using ".././output/regs_TH_80.tex", type 		
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
				"\\ \multicolumn{10}{p{19cm}}{\textbf{Notes:} * / ** / *** denotes significance at the 10 / 5 / 1 percent level. Standard errors are clustered at the destination-crop-year level, and are reported in parentheses. An observation is a cell at the origin-destination-crop-year level. Columns (1), (2), and (3) are based on a sample of 30-65 years old migrants. In columns (4), (5), and (6) the sample is comprised by men between 30-65 years old. In columns (7), (8), and (9) the sample is comprised by men between 20-65 years old. The covariate is the log of of agricultural workers in the same activity in the region of origin. The dependent variable is the log of migrant agricultural workers from an origin to a destination region working in an activity. Both the covariate and the dependent variable are based on the 1980 census. We exclude non-migrants from the sample.}"
				"\end{tabular}\end{sideways}")
				replace;
	#delimit cr	
end

program run_regressions_7080
	
	* coefficients and significance
	mat coef = J(10,9,.)
	mat sign = J(2,9,.)

	*** ORIGINAL SAMPLE
	* sort datasets
	use "../../data/output/L_iktlag_70", clear
	sort origin crop year
	save "../../data/output/L_iktlag_70", replace

	use "../../data/output/L_iktlag_80", clear
	sort origin crop year
	save "../../data/output/L_iktlag_80", replace

	use "../../data/output/L_ijkt_70", clear
	sort origin destination crop year
	save "../../data/output/L_ijkt_70", replace

	use "../../data/output/L_ijkt_80", clear
	sort origin destination crop year
	save "../../data/output/L_ijkt_80", replace

	* open
	use "../../data/output/origin_dest_crop", clear

	* merge with L_iktlag, 1970
	sort origin crop year
	merge origin crop year using "../../data/output/L_iktlag_70"
	drop _merge

	* merge with L_ijkt, 1970
	sort origin destination crop year
	merge origin destination crop year using "../../data/output/L_ijkt_70"
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
	merge origin destination crop year using "../../data/output/L_ijkt_80"
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
	* sort datasets
	use "../../data/output/L_iktlag_70", clear
	sort origin crop year
	save "../../data/output/L_iktlag_70", replace

	use "../../data/output/L_iktlag_80", clear
	sort origin crop year
	save "../../data/output/L_iktlag_80", replace

	use "../../data/output/L_ijkt_70_men", clear
	sort origin destination crop year
	save "../../data/output/L_ijkt_70_men", replace

	use "../../data/output/L_ijkt_80_men", clear
	sort origin destination crop year
	save "../../data/output/L_ijkt_80_men", replace

	* open
	use "../../data/output/origin_dest_crop", clear

	* merge with L_iktlag, 1970
	sort origin crop year
	merge origin crop year using "../../data/output/L_iktlag_70"
	drop _merge

	* merge with L_ijkt, 1970
	sort origin destination crop year
	merge origin destination crop year using "../../data/output/L_ijkt_70_men"
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
	merge origin destination crop year using "../../data/output/L_ijkt_80_men"
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

program make_table_7080
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
	replace col1 = "\emph{Migration flows, OLS} \\ %%%" if _n == 1
	replace col1 = "\hline \emph{Migration flows, PPML} \\ %%%" if _n == 6
	replace col1 = "Farmers in origin" if _n == 2 | _n == 7
	replace col1 = "R$^2$" if _n == 4 | _n == 9
	replace col1 = "Obs" if _n == 5 | _n == 10

	#delimit;
	listtab col1 coef1 coef2 coef3 coef4 coef5 coef6 coef7 coef8 coef9
			using ".././output/regs_TH_7080.tex", type 		
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
				"\\ \multicolumn{10}{p{19cm}}{\textbf{Notes:} * / ** / *** denotes significance at the 10 / 5 / 1 percent level. Standard errors are clustered at the destination-crop-year level, and are reported in parentheses. An observation is a cell at the origin-destination-crop-year level. Columns (1), (2), and (3) are based on a sample of 30-65 years old migrants. In columns (4), (5), and (6) the sample is comprised by men between 30-65 years old. In columns (7), (8), and (9) the sample is comprised by men between 20-65 years old. The covariate is the log of of agricultural workers in the same activity in the region of origin. The dependent variable is the log of migrant agricultural workers from an origin to a destination region working in an activity. Both the covariate and the dependent variable are based on both the 1970 and 1980 census. We exclude non-migrants from the sample.}"
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

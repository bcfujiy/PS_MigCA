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
*** programs
********************************************************************************

program main
	run_regressions
	make_table
end

program run_regressions
	
	* coefficients and significance
	mat coef = J(10,6,.)
	mat sign = J(2,6,.)

	*** ORIGINAL SAMPLE
	* open
	use "../../data/output/origin_dest_crop_br", clear

	* merge with L_iktlag, 2000
	sort origin crop year
	merge origin crop year using "../../data/output/L_iktlag_br_70"
	drop _merge
	
	* merge with L_iktlag, 2010
	sort origin crop year
	merge origin crop year using "../../data/output/L_iktlag_br_80"
	drop _merge
	
	* L_iktlag
	gen L_iktlag = .
	replace L_iktlag = L_iktlag_70 if L_iktlag_70 != .
	replace L_iktlag = L_iktlag_80 if L_iktlag_80 != .
	drop L_iktlag_70 L_iktlag_80
	replace L_iktlag = 0 if L_iktlag == .

	* merge with L_ijkt, 2000
	sort origin destination crop year
	merge origin destination crop year using "../../data/output/L_ijkt_br_00"
	drop _merge
	
	* merge with L_ijkt, 2010
	sort origin destination crop year
	merge origin destination crop year using "../../data/output/L_ijkt_br_10"
	drop _merge
	
	* L_ijkt
	gen L_ijkt = .
	replace L_ijkt = L_ijkt_00 if L_ijkt_00 != .
	replace L_ijkt = L_ijkt_10 if L_ijkt_10 != .
	drop L_ijkt_00 L_ijkt_10
	replace L_ijkt = 0 if L_ijkt == .
	
	* merge with w_ijkt, 2000
	sort origin destination crop year
	merge origin destination crop year using "../../data/output/w_ijkt_br_00"
	drop _merge
	
	* merge with w_ijkt, 2010
	sort origin destination crop year
	merge origin destination crop year using "../../data/output/w_ijkt_br_10"
	drop _merge
	
	* w_ijkt
	gen w_ijkt = .
	replace w_ijkt = w_ijkt_00 if w_ijkt_00 != .
	replace w_ijkt = w_ijkt_10 if w_ijkt_10 != .
	drop w_ijkt_00 w_ijkt_10

	* variables in logs
	gen L_ijkt_log = log(L_ijkt)
	gen w_ijkt_log = log(w_ijkt)
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
	get_results 1 4 L_iktlag_log
	* Regression (11), PPML without zeros
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 1 5 L_iktlag_log
	* Regression (11), PPML with only jkt fixed effects
	ppmlhdfe L_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 1 6 L_iktlag_log
	
	
	* Regression (11), OLS
	reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 1 L_iktlag_log
	* Regression (11), OLS without zeros
	reghdfe w_ijkt_log L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 2 L_iktlag_log
	* Regression (11), OLS with only jkt fixed effects
	reghdfe w_ijkt_log L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 2 3 L_iktlag_log
	* Regression (11), PPML
	ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 4 L_iktlag_log
	* Regression (11), PPML without zeros
	ppmlhdfe w_ijkt L_iktlag_log if origin != destination & L_ijkt != 0, absorb(iota_jkt iota_ijt) vce(cluster iota_jkt)
	get_results 2 5 L_iktlag_log
	* Regression (11), PPML with only jkt fixed effects
	ppmlhdfe w_ijkt L_iktlag_log if origin != destination, absorb(iota_jkt) vce(cluster iota_jkt)
	get_results 2 6 L_iktlag_log

end

program make_table
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
	replace col1 = "\emph{A. Migration Flows} \\ %%%" if _n == 1
	replace col1 = "\hline \emph{B. Earnings} \\ %%%" if _n == 6
	replace col1 = "Farmers in origin" if _n == 2 | _n == 7
	replace col1 = "R$^2$" if _n == 4 | _n == 9
	replace col1 = "Obs" if _n == 5 | _n == 10

	#delimit;
	listtab col1 coef1 coef2 coef3 coef4 coef5 coef6
			using ".././output/regs_BR.tex", type 		
			rstyle(tabular) 									
			head("\begin{tabular}{l|ccc|ccc} \hline"
			"& \multicolumn{3}{c}{OLS} & \multicolumn{3}{c}{PPML} \\"
			"& (1) & (2) & (3) & (4) & (5) & (6) \\ \hline") 
			foot("\hline"
				"Dest-Crop-Year FE     		& Y & Y &   & Y & Y &   \\"
				"Orig-Dest-Year FE 	  		& Y & Y & Y & Y & Y & Y \\"
				"Without zeros        		&   & Y &   &   & Y &   \\"
				"\hline"
				"\\ \multicolumn{7}{p{13cm}}{\textbf{Notes:} * / ** / *** denotes significance at the 10 / 5 / 1 percent level. Standard errors are clustered at the destination-crop-year level, and are reported in parentheses. An observation is a cell at the origin-destination-crop-year level. For migration flows, origin is the state where the person was born, and destination is the mesoregion where the person currently lives. The sample is comprised by 30-65 year old migrants. Columns (1), (2), and (3) show results using OLS estimators; while columns (4), (5), and (6) use PPML estimators. The covariate is the log of of agricultural workers in the same activity in the region of origin lagged by thirty years. We include the census of 2000 and 2010 in our regressions. We exclude non-migrants from the sample.}"
				"\end{tabular}")
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

* ===========================================================
* ECON 358
* Problem Set 1
* Suggested Solutions
* ===========================================================

clear all
pause on

use ps1_new.dta, clear

* Rename the variables to match the course notation

	rename X_ij_D_q X_ni_D_q
	rename X_ij_N_q X_ni_N_q
	rename X_ji_D_q X_in_D_q
	rename X_ji_N_q X_in_N_q
	rename X_sa_ii_D_q X_sa_nn_D_q
	rename X_sa_ii_N_q X_sa_nn_N_q
	rename X_sa_jj_D_q X_sa_ii_D_q
	rename country_i country_n
	rename country_j country_i
	
* Collapse the data to generate the yearly flows
	
	collapse (sum)  X_ni_D = X_ni_D_q X_ni_N = X_ni_N_q /*
				*/	X_in_D = X_in_D_q X_in_N = X_in_N_q /*
				*/  X_nn_D = X_sa_nn_D_q X_nn_N = X_sa_nn_N_q /*
				*/ 	X_ii_D = X_sa_ii_D_q, by(country_n country_i)
				
* Compute X_ii_N (useful later)
	gen temp_X_ii_N = X_nn_N if country_n == country_i
	bysort country_i: egen X_ii_N = max(temp_X_ii_N)
	drop temp*

* Generate aggregates
	gen X_ni_Agg = X_ni_D + X_ni_N
	gen X_in_Agg = X_in_D + X_in_N
	gen X_nn_Agg = X_nn_D + X_nn_N
	
save ps1_yearly.dta, replace	

* ---------------------------
* QUESTION 1
* ---------------------------

* Find largest international flows
	* Top international flows, by sector
	preserve	
		replace X_ni_D = X_ni_D/1000000000
		replace X_ni_N = X_ni_N/1000000000
		replace X_ni_Agg = X_ni_Agg/1000000000
		gsort -X_ni_D
		noi: display "Top international flows in Durables"
		noi: list country_n country_i X_ni_D in 1/5
		listtex country_n country_i X_ni_D in 1/5 using table1a.tex,/*
		*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
		*/" \multicolumn{3}{c}{Table 1a. Top International Flows in Durables} \\ \cline{1-3}"/*
		*/" Country n & Country i & Flow (billion USD) \\ \hline")/*
		*/ foot("\hline \end{tabular}") replace		
		
		gsort -X_ni_N
		noi: display "Top international flows in Non-durables"
		noi: list country_n country_i X_ni_N in 1/5
		listtex country_n country_i X_ni_N in 1/5 using table1b.tex,/*
		*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
		*/" \multicolumn{3}{c}{Table 1b. Top International Flows in Non-durables} \\ \cline{1-3}"/*
		*/" Country n & Country i & Flow (billion USD) \\ \hline")/*	
		*/ foot("\hline \end{tabular}") replace
		
	* Top international flows, aggregate
		gsort -X_ni_Agg
		noi: display "Top Aggregate international flows"
		noi: list country_n country_i X_ni_Agg in 1/5
		listtex country_n country_i X_ni_Agg in 1/5 using table1c.tex,/*
		*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
		*/" \multicolumn{3}{c}{Table 1c. Top International Flows (Aggregate)} \\ \cline{1-3}"/*
		*/" Country n & Country i & Flow (billion USD) \\ \hline")/*
		*/ foot("\hline \end{tabular}") replace		
	restore

		
		
* Top flows, not only international
	replace X_ni_D = X_nn_D if country_n == country_i
	replace X_ni_N = X_nn_N if country_n == country_i
	replace X_in_D = X_nn_D if country_n == country_i
	replace X_in_N = X_nn_N if country_n == country_i	
	replace X_ni_Agg = X_nn_Agg if country_n == country_i
	replace X_in_Agg = X_nn_Agg if country_n == country_i
	
	preserve
	replace X_ni_D = X_ni_D/1000000000
	replace X_ni_N = X_ni_N/1000000000
	replace X_ni_Agg = X_ni_Agg/1000000000
	* By sector
		gsort -X_ni_D
		noi: display "Top flows in Durables"
		noi: list country_n country_i X_ni_D in 1/5
		listtex country_n country_i X_ni_D in 1/5 using table2a.tex,/*
		*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
		*/" \multicolumn{3}{c}{Table 2a. Top Flows in Durables} \\ \cline{1-3}"/*
		*/" Country n & Country i & Flow (billion USD) \\ \hline")/*
		*/ foot("\hline \end{tabular}") replace		
		
		gsort -X_ni_N
		noi: display "Top flows in Non-durables"
		noi: list country_n country_i X_ni_N in 1/5
		listtex country_n country_i X_ni_N in 1/5 using table2b.tex,/*
		*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
		*/" \multicolumn{3}{c}{Table 2b. Top Flows in Non-durables} \\ \cline{1-3}"/*
		*/" Country n & Country i & Flow (billion USD) \\ \hline")/*
		*/ foot("\hline \end{tabular}") replace		
		
	* Aggregate
		gsort -X_ni_Agg
		noi: display "Top Aggregate international flows"
		noi: list country_n country_i X_ni_Agg in 1/5
		listtex country_n country_i X_ni_Agg in 1/5 using table2c.tex,/*
		*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
		*/" \multicolumn{3}{c}{Table 2c. Top Flows (Aggregate)} \\ \cline{1-3}"/*
		*/" Country n & Country i & Flow (billion USD) \\ \hline")/*
		*/ foot("\hline \end{tabular}") replace			



	restore

* ---------------------------
* QUESTION 2
* ---------------------------	

* Calculate the Head-Ries index, by sector and aggregate
	gen HRindex_D = X_ni_D*X_in_D/(X_nn_D*X_ii_D)
	gen HRindex_N = X_ni_N*X_in_N/(X_nn_N*X_ii_N)
	label var HRindex_D "Head-Ries Index (Durables)"
	label var HRindex_N "Head-Ries Index (Non-durables)"
	
	gen l_HRindex_D = log(HRindex_D)
	gen l_HRindex_N = log(HRindex_N)
* Find the 5 highest and the 5 lowest values of the index
	preserve
		egen code_n = group(country_n)
		egen code_i = group(country_i)
		drop if code_i >= code_n
		gen one_ref = .
		replace one_ref = 1 in 1
		* Durables
			gsort -HRindex_D
			noi: display "Head-Ries Index for Durables (5 highest)
			noi: list country_n country_i HRindex_D in 1/5, ab(10)
			listtex country_n country_i HRindex_D in 1/5 using table3a.tex,/*
			*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
			*/" \multicolumn{3}{c}{Table 3a. Highest 5 values of the Head-Ries Index (Durables)} \\ \cline{1-3}"/*
			*/" Country n & Country i & Index \\ \hline")/*
			*/ foot("\hline \end{tabular}") replace

			gsort +HRindex_D
			noi: display "Head-Ries Index for Durables (5 lowest)
			noi: list country_n country_i HRindex_D in 1/5, ab(10)
			listtex country_n country_i HRindex_D in 1/5 using table3b.tex,/*
			*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
			*/" \multicolumn{3}{c}{Table 3b. Lowest 5 values of the Head-Ries Index (Durables)} \\ \cline{1-3}"/*
			*/" Country n & Country i & Index \\ \hline")/*
			*/ foot("\hline \end{tabular}") replace
			
		* Non-durables
			gsort -HRindex_N
			noi: display "Head-Ries Index for Non-durables (5 highest)
			noi: list country_n country_i HRindex_N in 1/5, ab(10)
			listtex country_n country_i HRindex_N in 1/5 using table4a.tex,/*
			*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
			*/" \multicolumn{3}{c}{Table 4a. Highest 5 values of the Head-Ries Index (Non-durables)} \\ \cline{1-3}"/*
			*/" Country n & Country i & Index \\ \hline")/*
			*/ foot("\hline \end{tabular}") replace

			gsort +HRindex_N
			noi: display "Head-Ries Index for Non-durables (5 lowest)
			noi: list country_n country_i HRindex_N in 1/5, ab(10)
			listtex country_n country_i HRindex_N in 1/5 using table4b.tex,/*
			*/ rstyle(tabular) head("\begin{tabular}{llr} \hline"/*
			*/" \multicolumn{3}{c}{Table 4b. Lowest 5 values of the Head-Ries Index (Non-durables)} \\ \cline{1-3}"/*
			*/" Country n & Country i & Index \\ \hline")/*
			*/ foot("\hline \end{tabular}") replace
		
	* ---------------------------
	* QUESTION 3
	* ---------------------------	

	* Scatter plot of the Head-Ries index
	* Note that we still work only with the lower portion of the matrices
		twoway (scatter HRindex_N HRindex_D, xscale(log) yscale(log) /*
		*/xlab(0.000001 0.0001 0.01 1) ylab(0.000001 0.0001 0.01 1)) /*
		*/ (function y=x, range(0.0000002 1) xscale(log) yscale(log))/*
		*/ (scatter one_ref one_ref, mcolor(magenta) msize(large)/*
		*/ legend(off) /*
		*/ xtitle("Durables") ytitle("Non-Durables")/*
		*/ title("Head-Ries index: Non-Durables vs Durables"))
		graph save figure1, replace
		
		noi: display "regression of the HR index in logs"
		noi: reg l_HRindex_N l_HRindex_D

	* ---------------------------
	* QUESTION 4
	* ---------------------------	

	* Scatter plot of the iceberg costs
	* Assume \sigma - 1 = 8
		* Note that we still work only with the lower portion of the matrices
			gen d_N = HRindex_N^(-1/16)
			gen d_D = HRindex_D^(-1/16)	
			label var d_N "iceberg non-dur (8)"
			label var d_D "iceberg dur (8)"
			twoway (scatter d_N d_D, xscale(log) yscale(log) /*
			*/ xlab(1 1.4 2 2.8) ylab(1 1.4 2 2.8)) /*
			*/ (function y=x, range(1.1 2.8) xscale(log) yscale(log)/*
			*/ legend(off) /*
			*/ xtitle("Durables") ytitle("Non-Durables")/*			
			*/ title("Iceberg trade costs (elasticity = 8)"))
			graph save figure2, replace
		
	* Assume \sigma - 1 = 2
			gen d_N2 = HRindex_N^(-1/4)
			gen d_D2 = HRindex_D^(-1/4)
			label var d_N "iceberg non-dur (2)"
			label var d_D "iceberg dur (2)"
			twoway (scatter d_N2 d_D2, xscale(log) yscale(log) /*
			*/ xlab(2 4 8 16 32 64) ylab(2 4 8 16 32 64)) /*
			*/ (function y=x, range(2 50) xscale(log) yscale(log)/*
			*/ legend(off) /*
			*/ xtitle("Durables") ytitle("Non-Durables")/*
			*/ title("Iceberg trade costs (elasticity = 2)"))
			graph save figure3, replace
			pause
	restore

win man close graph all
	
* Transform figures for import in latex
	graph use figure1.gph
	graph export fig1.eps, replace
	graph use figure2.gph
	graph export fig2.eps, replace
	graph use figure3.gph
	graph export fig3.eps, replace	

	
	
	
	
	
	
	

* ===========================================================
* ECON 358
* Problem Set 3
* Suggested Solutions
* This file
* 	Prepares Tables 2 and 3
* ===========================================================

clear all
pause on


* Table 2
insheet omega_hat rho_hat wr_hat using Q3.txt
save q3.dta, replace

use ps3_gdp, clear
sort n_country
keep n_country
merge 1:1 _n using q3.dta

format omega_hat rho_hat wr_hat %9.3f
listtex n_country  omega_hat rho_hat wr_hat using table2.tex,/*
	*/ rstyle(tabular) head("\begin{tabular}{lccc} \hline"/*
	*/" \multicolumn{4}{c}{Table 2. Effect of eliminating deficits} \\ \cline{1-4}"/*
	*/" Country & Relative Wage & Mfg. Price & Real Wage \\" /*
	*/"  & (relative to baseline) & (relative to baseline)  & (relative to baseline) \\ \hline")/*
	*/ foot("\hline \end{tabular}") replace

erase q3.dta

clear 

* Table 3
insheet omega_hat rho_hat wr_hat using Q4_1.txt
save q4.dta, replace

use ps3_gdp, clear
sort n_country
keep n_country
merge 1:1 _n using q4.dta

format omega_hat rho_hat wr_hat %9.3f
listtex n_country  omega_hat rho_hat wr_hat using table3.tex,/*
	*/ rstyle(tabular) head("\begin{tabular}{lccc} \hline"/*
	*/" \multicolumn{4}{c}{Table 3. Effect of 20 Pct increase in US technology} \\ \cline{1-4}"/*
	*/" Country & Mfg. Price & Wage/Mfg. Price & Real Wage \\" /*
	*/"  & (relative to baseline) & (relative to baseline)  & (relative to baseline) \\ \hline")/*
	*/ foot("\hline \end{tabular}") replace

erase q4.dta

clear

* Table 4 (Not used in the end)
insheet wr_hat using Q4_2.txt
save q4.dta, replace

use ps3_gdp, clear
sort n_country
keep n_country
merge 1:1 _n using q4.dta

format wr_hat %9.2f
listtex n_country  wr_hat using table4.tex,/*
	*/ rstyle(tabular) head("\begin{tabular}{lc} \hline"/*
	*/" \multicolumn{2}{c}{Table 4. Effect of 20 Pct increase in US technology} \\ \cline{1-2}"/*
	*/" Country & Real Wage \\" /*
	*/"  & (relative to US) \\ \hline")/*
	*/ foot("\hline \end{tabular}") replace

erase q4.dta

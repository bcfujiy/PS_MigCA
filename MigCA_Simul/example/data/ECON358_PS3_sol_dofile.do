* ===========================================================
* ECON 358
* Problem Set 3
* Suggested Solutions
* This file
* 	Merges the GDP data with Trade data
* 	Prepares data for matlab
* 	Prepares Table 1
* ===========================================================

clear all
pause on

local beta = .312 /* From DEK (2007)*/

* First we get the data on trade flows from Problem Set 1
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

* Generate Total Trade (Mfg + NonMfg) and expressing in US$ billions
	gen X_ni = (X_ni_D + X_ni_N)/(10^9)
	gen X_in = (X_in_D + X_in_N)/(10^9)
	gen X_nn = (X_nn_D + X_nn_N)/(10^9)
	replace X_ni = X_nn if country_i == country_n
	replace X_in = X_nn if country_i == country_n
	
* Fill in the main diagonal of the matrix
	
	
* Coding countries to merge
	gen str i_id = "ZZZZ"
	replace i_id = "AT" if country_i == "austria"
	replace i_id = "CA" if country_i == "canada"
	replace i_id = "CN" if country_i == "china"
	replace i_id = "CZ" if country_i == "czechrepublic"
	replace i_id = "DK" if country_i == "denmark"
	replace i_id = "FI" if country_i == "finland"
	replace i_id = "FR" if country_i == "france"
	replace i_id = "DE" if country_i == "germany"
	replace i_id = "GR" if country_i == "greece"
	replace i_id = "HU" if country_i == "hungary"
	replace i_id = "IN" if country_i == "india"
	replace i_id = "IT" if country_i == "italy"
	replace i_id = "JP" if country_i == "japan"
	replace i_id = "MX" if country_i == "mexico"
	replace i_id = "PL" if country_i == "poland"
	replace i_id = "RO" if country_i == "romania"
	replace i_id = "SK" if country_i == "slovakia"
	replace i_id = "KR" if country_i == "southkorea"
	replace i_id = "ES" if country_i == "spain"
	replace i_id = "SE" if country_i == "sweden"
	replace i_id = "GB" if country_i == "unitedkingdom"
	replace i_id = "US" if country_i == "unitedstates"
	
	* Coding countries to merge
	gen str n_id = "ZZZZ"
	replace n_id = "AT" if country_n == "austria"
	replace n_id = "CA" if country_n == "canada"
	replace n_id = "CN" if country_n == "china"
	replace n_id = "CZ" if country_n == "czechrepublic"
	replace n_id = "DK" if country_n == "denmark"
	replace n_id = "FI" if country_n == "finland"
	replace n_id = "FR" if country_n == "france"
	replace n_id = "DE" if country_n == "germany"
	replace n_id = "GR" if country_n == "greece"
	replace n_id = "HU" if country_n == "hungary"
	replace n_id = "IN" if country_n == "india"
	replace n_id = "IT" if country_n == "italy"
	replace n_id = "JP" if country_n == "japan"
	replace n_id = "MX" if country_n == "mexico"
	replace n_id = "PL" if country_n == "poland"
	replace n_id = "RO" if country_n == "romania"
	replace n_id = "SK" if country_n == "slovakia"
	replace n_id = "KR" if country_n == "southkorea"
	replace n_id = "ES" if country_n == "spain"
	replace n_id = "SE" if country_n == "sweden"
	replace n_id = "GB" if country_n == "unitedkingdom"
	replace n_id = "US" if country_n == "unitedstates"
	
	keep i_id n_id X_ni X_in
	
save ps3_trade.dta, replace	

* Now we import the data on GDP by countries
* source: EIU
* I first saved the data in a csv file

insheet country id gdp using ps3_eiudata.csv, clear
gen i_id = id
gen n_id = id
gen i_country = country
gen n_country = country
gen i_gdp = gdp
gen n_gdp = gdp
egen n_share = pc(gdp), prop

* We eliminate the countries that are not in the top 20
drop if id == "HK"
gsort -gdp
keep in 1/20

save ps3_gdp.dta, replace

* Now we merge the two databases

use ps3_trade.dta, clear
merge m:1 n_id using ps3_gdp.dta, keepus(n_*) gen(merge_i)
merge m:1 i_id using ps3_gdp.dta, keepus(i_*) gen(merge_n)

drop if n_id == "HK" | i_id == "HK"

* Drop the trade flows for countries that are not in the top20
* by using the merge indicators

keep if merge_n == 3 & merge_i == 3

* Generate numeric codes to work with the lower portion of the trade matrix

sort n_id
egen n_code = group(n_id)
sort i_id
egen i_code = group(i_id)

* We follow the steps in the writeup Question 1 to obtain alpha
	
	* Compute gross manufacturing production and absorption in country i
	bysort n_id: egen double XM_n = total(X_ni)
	bysort n_id: egen double YM_n = total(X_in)
	
	* Compute adjusted manufacturing deficit by country
	gen double DM_n = XM_n - YM_n
	gen DM_n_GDP = DM_n/n_gdp*100
	
	* Compute final absorption
	gen X_n = DM_n + n_gdp
	
	* Compute alpha by country
	gen alpha_n = (XM_n - (1-`beta')*YM_n)/(X_n)
	
	* Produce Table 1
	format alpha_n DM_n_GDP %9.3f
	egen tag_destination = tag(n_id)
	sort n_country
	noi: list n_country n_gdp DM_n DM_n_GDP alpha_n /*
	*/ if tag_destination == 1
	
	format DM_n DM_n_GDP %9.1f
	listtex n_country n_gdp DM_n DM_n_GDP alpha_n using table1.tex if tag_destination == 1,/*
		*/ rstyle(tabular) head("\begin{tabular}{lrrrr} \hline"/*
		*/" \multicolumn{4}{c}{Table 1. Variables by country} \\ \cline{1-5}"/*
		*/" Country & GDP (USD bill) & Deficit (USD bill) & Deficit (pct of GDP) & Alpha \\ \hline")/*
		*/ foot("\hline \end{tabular}") replace

* Export the data for use in MATLAB

	* Export data on Y, YM, D, X, XM
	preserve
		format %9.4f YM_n DM_n X_n XM_n alpha_n
		keep if tag == 1
		sort n_country
		outfile n_gdp using Y.raw, replace
		outfile YM_n using YM.raw, replace
		outfile DM_n using DM.raw, replace
		outfile X_n using X.raw, replace
		outfile XM_n using XM.raw, replace	
		outfile alpha_n using alpha.raw, replace
	restore

* Export data for import shares
	sort n_country i_country
	gen pi_ni = X_ni/XM
	outfile pi_ni using pi_ni.raw, replace
	outfile X_ni using X_ni.raw, replace

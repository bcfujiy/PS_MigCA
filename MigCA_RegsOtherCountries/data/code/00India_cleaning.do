********************************************************************************
*** setup
********************************************************************************

* housekeeping
clear all

*** set directory

* Brian's computer
if "`c(username)'" == "Petrichor" {
	cd "/Users/`c(username)'/RA/PS_MigCA/MigCA_RegsOtherCountries/data/code"
}

* Sebastian's computer

* Heitor's computer

********************************************************************************
*** South Africa, 2007
********************************************************************************

* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                     ///
  int     country        1-3      ///
  int     year           4-7      ///
  double  sample         8-16     ///
  double  serial         17-28    ///
  double  hhwt           29-36    ///
  byte    urban          37-37    ///
  byte    regionw        38-39    ///
  long    geolev1        40-45    ///
  long    geo1_in        46-51    ///
  int     geo1_in1983    52-54    ///
  int     geo1_in1987    55-57    ///
  int     geo1_in1993    58-60    ///
  double  geo2_in        61-69    ///
  long    geo2_in1987    70-75    ///
  byte    dhs_ipumsi_in  76-77    ///
  int     pernum         78-81    ///
  double  perwt          82-89    ///
  byte    relate         90-90    ///
  int     related        91-94    ///
  int     age            95-97    ///
  byte    sex            98-98    ///
  byte    empstat        99-99    ///
  int     empstatd       100-102  ///
  byte    labforce       103-103  ///
  int     occ            104-107  ///
  long    ind            108-112  ///
  byte    empsect        113-114  ///
  long    incwage        115-121  ///
  byte    migratep       122-123  ///
  long    geomig1_p      124-129  ///
  long    mig1_p_in      130-135  ///
  using `".././input/India/ipumsi_00012.dat"'

replace hhwt          = hhwt          / 100
replace perwt         = perwt         / 100

format sample        %9.0g
format serial        %12.0g
format hhwt          %8.2f
format geo2_in       %9.0g
format perwt         %8.2f

label var country       `"Country"'
label var year          `"Year"'
label var sample        `"IPUMS sample identifier"'
label var serial        `"Household serial number"'
label var hhwt          `"Household weight"'
label var urban         `"Urban-rural status"'
label var regionw       `"Continent and region of country"'
label var geolev1       `"1st subnational geographic level, world [consistent boundaries over time]"'
label var geo1_in       `"India, State 1983 - 2009 [Level 1; consistent boundaries, GIS]"'
label var geo1_in1983   `"India, State 1983 [Level 1, GIS]"'
label var geo1_in1987   `"India, State 1987 [Level 1, GIS]"'
label var geo1_in1993   `"India, State 1993 [Level 1, GIS]"'
label var geo2_in       `"India, District 1987 - 2009 [Level 2; consistent boundaries, GIS]"'
label var geo2_in1987   `"India, District 1987 [Level 2, GIS]"'
label var dhs_ipumsi_in `"DHS-IPUMS-I India regions, 1983-2009 [consistent boundaries, GIS]"'
label var pernum        `"Person number"'
label var perwt         `"Person weight"'
label var relate        `"Relationship to household head [general version]"'
label var related       `"Relationship to household head [detailed version]"'
label var age           `"Age"'
label var sex           `"Sex"'
label var empstat       `"Activity status (employment status) [general version]"'
label var empstatd      `"Activity status (employment status) [detailed version]"'
label var labforce      `"Labor force participation"'
label var occ           `"Occupation, unrecoded"'
label var ind           `"Industry, unrecoded"'
label var empsect       `"Sector of employment"'
label var incwage       `"Wage and salary income"'
label var migratep      `"Migration status, previous residence"'
label var geomig1_p     `"1st subnational geographic level of previous residence, world [consistent bounda"'
label var mig1_p_in     `"State of previous residence, India; consistent boundaries, GIS"'

label define country_lbl 032 `"Argentina"'
label define country_lbl 051 `"Armenia"', add
label define country_lbl 040 `"Austria"', add
label define country_lbl 050 `"Bangladesh"', add
label define country_lbl 112 `"Belarus"', add
label define country_lbl 204 `"Benin"', add
label define country_lbl 068 `"Bolivia"', add
label define country_lbl 072 `"Botswana"', add
label define country_lbl 076 `"Brazil"', add
label define country_lbl 854 `"Burkina Faso"', add
label define country_lbl 116 `"Cambodia"', add
label define country_lbl 120 `"Cameroon"', add
label define country_lbl 124 `"Canada"', add
label define country_lbl 152 `"Chile"', add
label define country_lbl 156 `"China"', add
label define country_lbl 170 `"Colombia"', add
label define country_lbl 188 `"Costa Rica"', add
label define country_lbl 192 `"Cuba"', add
label define country_lbl 208 `"Denmark"', add
label define country_lbl 214 `"Dominican Republic"', add
label define country_lbl 218 `"Ecuador"', add
label define country_lbl 818 `"Egypt"', add
label define country_lbl 222 `"El Salvador"', add
label define country_lbl 231 `"Ethiopia"', add
label define country_lbl 242 `"Fiji"', add
label define country_lbl 250 `"France"', add
label define country_lbl 276 `"Germany"', add
label define country_lbl 288 `"Ghana"', add
label define country_lbl 300 `"Greece"', add
label define country_lbl 320 `"Guatemala"', add
label define country_lbl 324 `"Guinea"', add
label define country_lbl 332 `"Haiti"', add
label define country_lbl 340 `"Honduras"', add
label define country_lbl 348 `"Hungary"', add
label define country_lbl 352 `"Iceland"', add
label define country_lbl 356 `"India"', add
label define country_lbl 360 `"Indonesia"', add
label define country_lbl 364 `"Iran"', add
label define country_lbl 368 `"Iraq"', add
label define country_lbl 372 `"Ireland"', add
label define country_lbl 376 `"Israel"', add
label define country_lbl 380 `"Italy"', add
label define country_lbl 388 `"Jamaica"', add
label define country_lbl 400 `"Jordan"', add
label define country_lbl 404 `"Kenya"', add
label define country_lbl 417 `"Kyrgyz Republic"', add
label define country_lbl 418 `"Laos"', add
label define country_lbl 426 `"Lesotho"', add
label define country_lbl 430 `"Liberia"', add
label define country_lbl 454 `"Malawi"', add
label define country_lbl 458 `"Malaysia"', add
label define country_lbl 466 `"Mali"', add
label define country_lbl 484 `"Mexico"', add
label define country_lbl 496 `"Mongolia"', add
label define country_lbl 504 `"Morocco"', add
label define country_lbl 508 `"Mozambique"', add
label define country_lbl 524 `"Nepal"', add
label define country_lbl 528 `"Netherlands"', add
label define country_lbl 558 `"Nicaragua"', add
label define country_lbl 566 `"Nigeria"', add
label define country_lbl 578 `"Norway"', add
label define country_lbl 586 `"Pakistan"', add
label define country_lbl 275 `"Palestine"', add
label define country_lbl 591 `"Panama"', add
label define country_lbl 598 `"Papua New Guinea"', add
label define country_lbl 600 `"Paraguay"', add
label define country_lbl 604 `"Peru"', add
label define country_lbl 608 `"Philippines"', add
label define country_lbl 616 `"Poland"', add
label define country_lbl 620 `"Portugal"', add
label define country_lbl 630 `"Puerto Rico"', add
label define country_lbl 642 `"Romania"', add
label define country_lbl 643 `"Russia"', add
label define country_lbl 646 `"Rwanda"', add
label define country_lbl 662 `"Saint Lucia"', add
label define country_lbl 686 `"Senegal"', add
label define country_lbl 694 `"Sierra Leone"', add
label define country_lbl 705 `"Slovenia"', add
label define country_lbl 710 `"South Africa"', add
label define country_lbl 728 `"South Sudan"', add
label define country_lbl 724 `"Spain"', add
label define country_lbl 729 `"Sudan"', add
label define country_lbl 752 `"Sweden"', add
label define country_lbl 756 `"Switzerland"', add
label define country_lbl 834 `"Tanzania"', add
label define country_lbl 764 `"Thailand"', add
label define country_lbl 768 `"Togo"', add
label define country_lbl 780 `"Trinidad and Tobago"', add
label define country_lbl 792 `"Turkey"', add
label define country_lbl 800 `"Uganda"', add
label define country_lbl 804 `"Ukraine"', add
label define country_lbl 826 `"United Kingdom"', add
label define country_lbl 840 `"United States"', add
label define country_lbl 858 `"Uruguay"', add
label define country_lbl 862 `"Venezuela"', add
label define country_lbl 704 `"Vietnam"', add
label define country_lbl 894 `"Zambia"', add
label define country_lbl 716 `"Zimbabwe"', add
label values country country_lbl

label define year_lbl 1703 `"1703"'
label define year_lbl 1729 `"1729"', add
label define year_lbl 1787 `"1787"', add
label define year_lbl 1801 `"1801"', add
label define year_lbl 1819 `"1819"', add
label define year_lbl 1850 `"1850"', add
label define year_lbl 1851 `"1851"', add
label define year_lbl 1852 `"1852"', add
label define year_lbl 1860 `"1860"', add
label define year_lbl 1861 `"1861"', add
label define year_lbl 1865 `"1865"', add
label define year_lbl 1870 `"1870"', add
label define year_lbl 1871 `"1871"', add
label define year_lbl 1875 `"1875"', add
label define year_lbl 1880 `"1880"', add
label define year_lbl 1881 `"1881"', add
label define year_lbl 1890 `"1890"', add
label define year_lbl 1891 `"1891"', add
label define year_lbl 1900 `"1900"', add
label define year_lbl 1901 `"1901"', add
label define year_lbl 1910 `"1910"', add
label define year_lbl 1911 `"1911"', add
label define year_lbl 1960 `"1960"', add
label define year_lbl 1961 `"1961"', add
label define year_lbl 1962 `"1962"', add
label define year_lbl 1963 `"1963"', add
label define year_lbl 1964 `"1964"', add
label define year_lbl 1966 `"1966"', add
label define year_lbl 1968 `"1968"', add
label define year_lbl 1969 `"1969"', add
label define year_lbl 1970 `"1970"', add
label define year_lbl 1971 `"1971"', add
label define year_lbl 1972 `"1972"', add
label define year_lbl 1973 `"1973"', add
label define year_lbl 1974 `"1974"', add
label define year_lbl 1975 `"1975"', add
label define year_lbl 1976 `"1976"', add
label define year_lbl 1977 `"1977"', add
label define year_lbl 1978 `"1978"', add
label define year_lbl 1979 `"1979"', add
label define year_lbl 1980 `"1980"', add
label define year_lbl 1981 `"1981"', add
label define year_lbl 1982 `"1982"', add
label define year_lbl 1983 `"1983"', add
label define year_lbl 1984 `"1984"', add
label define year_lbl 1985 `"1985"', add
label define year_lbl 1986 `"1986"', add
label define year_lbl 1987 `"1987"', add
label define year_lbl 1989 `"1989"', add
label define year_lbl 1990 `"1990"', add
label define year_lbl 1991 `"1991"', add
label define year_lbl 1992 `"1992"', add
label define year_lbl 1993 `"1993"', add
label define year_lbl 1994 `"1994"', add
label define year_lbl 1995 `"1995"', add
label define year_lbl 1996 `"1996"', add
label define year_lbl 1997 `"1997"', add
label define year_lbl 1998 `"1998"', add
label define year_lbl 1999 `"1999"', add
label define year_lbl 2000 `"2000"', add
label define year_lbl 2001 `"2001"', add
label define year_lbl 2002 `"2002"', add
label define year_lbl 2003 `"2003"', add
label define year_lbl 2004 `"2004"', add
label define year_lbl 2005 `"2005"', add
label define year_lbl 2006 `"2006"', add
label define year_lbl 2007 `"2007"', add
label define year_lbl 2008 `"2008"', add
label define year_lbl 2009 `"2009"', add
label define year_lbl 2010 `"2010"', add
label define year_lbl 2011 `"2011"', add
label define year_lbl 2012 `"2012"', add
label define year_lbl 2013 `"2013"', add
label define year_lbl 2014 `"2014"', add
label define year_lbl 2015 `"2015"', add
label define year_lbl 2016 `"2016"', add
label define year_lbl 2017 `"2017"', add
label define year_lbl 2018 `"2018"', add
label values year year_lbl

label define sample_lbl 032197001 `"Argentina 1970"'
label define sample_lbl 032198001 `"Argentina 1980"', add
label define sample_lbl 032199101 `"Argentina 1991"', add
label define sample_lbl 032200101 `"Argentina 2001"', add
label define sample_lbl 032201001 `"Argentina 2010"', add
label define sample_lbl 051200101 `"Armenia 2001"', add
label define sample_lbl 051201101 `"Armenia 2011"', add
label define sample_lbl 040197101 `"Austria 1971"', add
label define sample_lbl 040198101 `"Austria 1981"', add
label define sample_lbl 040199101 `"Austria 1991"', add
label define sample_lbl 040200101 `"Austria 2001"', add
label define sample_lbl 040201101 `"Austria 2011"', add
label define sample_lbl 050199101 `"Bangladesh 1991"', add
label define sample_lbl 050200101 `"Bangladesh 2001"', add
label define sample_lbl 050201101 `"Bangladesh 2011"', add
label define sample_lbl 112199901 `"Belarus 1999"', add
label define sample_lbl 112200901 `"Belarus 2009"', add
label define sample_lbl 204197901 `"Benin 1979"', add
label define sample_lbl 204199201 `"Benin 1992"', add
label define sample_lbl 204200201 `"Benin 2002"', add
label define sample_lbl 204201301 `"Benin 2013"', add
label define sample_lbl 068197601 `"Bolivia 1976"', add
label define sample_lbl 068199201 `"Bolivia 1992"', add
label define sample_lbl 068200101 `"Bolivia 2001"', add
label define sample_lbl 072198101 `"Botswana 1981"', add
label define sample_lbl 072199101 `"Botswana 1991"', add
label define sample_lbl 072200101 `"Botswana 2001"', add
label define sample_lbl 072201101 `"Botswana 2011"', add
label define sample_lbl 076196001 `"Brazil 1960"', add
label define sample_lbl 076197001 `"Brazil 1970"', add
label define sample_lbl 076198001 `"Brazil 1980"', add
label define sample_lbl 076199101 `"Brazil 1991"', add
label define sample_lbl 076200001 `"Brazil 2000"', add
label define sample_lbl 076201001 `"Brazil 2010"', add
label define sample_lbl 854198501 `"Burkina Faso 1985"', add
label define sample_lbl 854199601 `"Burkina Faso 1996"', add
label define sample_lbl 854200601 `"Burkina Faso 2006"', add
label define sample_lbl 116199801 `"Cambodia 1998"', add
label define sample_lbl 116200401 `"Cambodia 2004"', add
label define sample_lbl 116200801 `"Cambodia 2008"', add
label define sample_lbl 116201301 `"Cambodia 2013"', add
label define sample_lbl 120197601 `"Cameroon 1976"', add
label define sample_lbl 120198701 `"Cameroon 1987"', add
label define sample_lbl 120200501 `"Cameroon 2005"', add
label define sample_lbl 124185201 `"Canada 1852"', add
label define sample_lbl 124187101 `"Canada 1871"', add
label define sample_lbl 124188101 `"Canada 1881"', add
label define sample_lbl 124189101 `"Canada 1891"', add
label define sample_lbl 124190101 `"Canada 1901"', add
label define sample_lbl 124191101 `"Canada 1911"', add
label define sample_lbl 124197101 `"Canada 1971"', add
label define sample_lbl 124198101 `"Canada 1981"', add
label define sample_lbl 124199101 `"Canada 1991"', add
label define sample_lbl 124200101 `"Canada 2001"', add
label define sample_lbl 124201101 `"Canada 2011"', add
label define sample_lbl 152196001 `"Chile 1960"', add
label define sample_lbl 152197001 `"Chile 1970"', add
label define sample_lbl 152198201 `"Chile 1982"', add
label define sample_lbl 152199201 `"Chile 1992"', add
label define sample_lbl 152200201 `"Chile 2002"', add
label define sample_lbl 156198201 `"China 1982"', add
label define sample_lbl 156199001 `"China 1990"', add
label define sample_lbl 156200001 `"China 2000"', add
label define sample_lbl 170196401 `"Colombia 1964"', add
label define sample_lbl 170197301 `"Colombia 1973"', add
label define sample_lbl 170198501 `"Colombia 1985"', add
label define sample_lbl 170199301 `"Colombia 1993"', add
label define sample_lbl 170200501 `"Colombia 2005"', add
label define sample_lbl 188196301 `"Costa Rica 1963"', add
label define sample_lbl 188197301 `"Costa Rica 1973"', add
label define sample_lbl 188198401 `"Costa Rica 1984"', add
label define sample_lbl 188200001 `"Costa Rica 2000"', add
label define sample_lbl 188201101 `"Costa Rica 2011"', add
label define sample_lbl 192200201 `"Cuba 2002"', add
label define sample_lbl 208178701 `"Denmark 1787"', add
label define sample_lbl 208180101 `"Denmark 1801"', add
label define sample_lbl 214196001 `"Dominican Republic 1960"', add
label define sample_lbl 214197001 `"Dominican Republic 1970"', add
label define sample_lbl 214198101 `"Dominican Republic 1981"', add
label define sample_lbl 214200201 `"Dominican Republic 2002"', add
label define sample_lbl 214201001 `"Dominican Republic 2010"', add
label define sample_lbl 218196201 `"Ecuador 1962"', add
label define sample_lbl 218197401 `"Ecuador 1974"', add
label define sample_lbl 218198201 `"Ecuador 1982"', add
label define sample_lbl 218199001 `"Ecuador 1990"', add
label define sample_lbl 218200101 `"Ecuador 2001"', add
label define sample_lbl 218201001 `"Ecuador 2010"', add
label define sample_lbl 818198601 `"Egypt 1986"', add
label define sample_lbl 818199601 `"Egypt 1996"', add
label define sample_lbl 818200601 `"Egypt 2006"', add
label define sample_lbl 222199201 `"El Salvador 1992"', add
label define sample_lbl 222200701 `"El Salvador 2007"', add
label define sample_lbl 231198401 `"Ethiopia 1984"', add
label define sample_lbl 231199401 `"Ethiopia 1994"', add
label define sample_lbl 231200701 `"Ethiopia 2007"', add
label define sample_lbl 242196601 `"Fiji 1966"', add
label define sample_lbl 242197601 `"Fiji 1976"', add
label define sample_lbl 242198601 `"Fiji 1986"', add
label define sample_lbl 242199601 `"Fiji 1996"', add
label define sample_lbl 242200701 `"Fiji 2007"', add
label define sample_lbl 242201401 `"Fiji 2014"', add
label define sample_lbl 250196201 `"France 1962"', add
label define sample_lbl 250196801 `"France 1968"', add
label define sample_lbl 250197501 `"France 1975"', add
label define sample_lbl 250198201 `"France 1982"', add
label define sample_lbl 250199001 `"France 1990"', add
label define sample_lbl 250199901 `"France 1999"', add
label define sample_lbl 250200601 `"France 2006"', add
label define sample_lbl 250201101 `"France 2011"', add
label define sample_lbl 276181901 `"Germany 1819 (Mecklenburg)"', add
label define sample_lbl 276197001 `"Germany 1970 (West)"', add
label define sample_lbl 276197101 `"Germany 1971 (East)"', add
label define sample_lbl 276198101 `"Germany 1981 (East)"', add
label define sample_lbl 276198701 `"Germany 1987 (West)"', add
label define sample_lbl 288198401 `"Ghana 1984"', add
label define sample_lbl 288200001 `"Ghana 2000"', add
label define sample_lbl 288201001 `"Ghana 2010"', add
label define sample_lbl 300197101 `"Greece 1971"', add
label define sample_lbl 300198101 `"Greece 1981"', add
label define sample_lbl 300199101 `"Greece 1991"', add
label define sample_lbl 300200101 `"Greece 2001"', add
label define sample_lbl 300201101 `"Greece 2011"', add
label define sample_lbl 320196401 `"Guatemala 1964"', add
label define sample_lbl 320197301 `"Guatemala 1973"', add
label define sample_lbl 320198101 `"Guatemala 1981"', add
label define sample_lbl 320199401 `"Guatemala 1994"', add
label define sample_lbl 320200201 `"Guatemala 2002"', add
label define sample_lbl 324198301 `"Guinea 1983"', add
label define sample_lbl 324199601 `"Guinea 1996"', add
label define sample_lbl 332197101 `"Haiti 1971"', add
label define sample_lbl 332198201 `"Haiti 1982"', add
label define sample_lbl 332200301 `"Haiti 2003"', add
label define sample_lbl 340196101 `"Honduras 1961"', add
label define sample_lbl 340197401 `"Honduras 1974"', add
label define sample_lbl 340198801 `"Honduras 1988"', add
label define sample_lbl 340200101 `"Honduras 2001"', add
label define sample_lbl 348197001 `"Hungary 1970"', add
label define sample_lbl 348198001 `"Hungary 1980"', add
label define sample_lbl 348199001 `"Hungary 1990"', add
label define sample_lbl 348200101 `"Hungary 2001"', add
label define sample_lbl 348201101 `"Hungary 2011"', add
label define sample_lbl 352170301 `"Iceland 1703"', add
label define sample_lbl 352172901 `"Iceland 1729"', add
label define sample_lbl 352180101 `"Iceland 1801"', add
label define sample_lbl 352190101 `"Iceland 1901"', add
label define sample_lbl 352191001 `"Iceland 1910"', add
label define sample_lbl 356198341 `"India 1983"', add
label define sample_lbl 356198741 `"India 1987"', add
label define sample_lbl 356199341 `"India 1993"', add
label define sample_lbl 356199941 `"India 1999"', add
label define sample_lbl 356200441 `"India 2004"', add
label define sample_lbl 356200941 `"India 2009"', add
label define sample_lbl 360197101 `"Indonesia 1971"', add
label define sample_lbl 360197601 `"Indonesia 1976"', add
label define sample_lbl 360198001 `"Indonesia 1980"', add
label define sample_lbl 360198501 `"Indonesia 1985"', add
label define sample_lbl 360199001 `"Indonesia 1990"', add
label define sample_lbl 360199501 `"Indonesia 1995"', add
label define sample_lbl 360200001 `"Indonesia 2000"', add
label define sample_lbl 360200501 `"Indonesia 2005"', add
label define sample_lbl 360201001 `"Indonesia 2010"', add
label define sample_lbl 364200601 `"Iran 2006"', add
label define sample_lbl 364201101 `"Iran 2011"', add
label define sample_lbl 368199701 `"Iraq 1997"', add
label define sample_lbl 372197101 `"Ireland 1971"', add
label define sample_lbl 372197901 `"Ireland 1979"', add
label define sample_lbl 372198101 `"Ireland 1981"', add
label define sample_lbl 372198601 `"Ireland 1986"', add
label define sample_lbl 372199101 `"Ireland 1991"', add
label define sample_lbl 372199601 `"Ireland 1996"', add
label define sample_lbl 372200201 `"Ireland 2002"', add
label define sample_lbl 372200601 `"Ireland 2006"', add
label define sample_lbl 372201101 `"Ireland 2011"', add
label define sample_lbl 376197201 `"Israel 1972"', add
label define sample_lbl 376198301 `"Israel 1983"', add
label define sample_lbl 376199501 `"Israel 1995"', add
label define sample_lbl 380200101 `"Italy 2001"', add
label define sample_lbl 380201101 `"Italy 2011"', add
label define sample_lbl 380201121 `"Italy 2011 Q1 LFS"', add
label define sample_lbl 380201221 `"Italy 2012 Q1 LFS"', add
label define sample_lbl 380201321 `"Italy 2013 Q1 LFS"', add
label define sample_lbl 380201421 `"Italy 2014 Q1 LFS"', add
label define sample_lbl 380201521 `"Italy 2015 Q1 LFS"', add
label define sample_lbl 380201621 `"Italy 2016 Q1 LFS"', add
label define sample_lbl 380201721 `"Italy 2017 Q1 LFS"', add
label define sample_lbl 380201821 `"Italy 2018 Q1 LFS"', add
label define sample_lbl 388198201 `"Jamaica 1982"', add
label define sample_lbl 388199101 `"Jamaica 1991"', add
label define sample_lbl 388200101 `"Jamaica 2001"', add
label define sample_lbl 400200401 `"Jordan 2004"', add
label define sample_lbl 404196901 `"Kenya 1969"', add
label define sample_lbl 404197901 `"Kenya 1979"', add
label define sample_lbl 404198901 `"Kenya 1989"', add
label define sample_lbl 404199901 `"Kenya 1999"', add
label define sample_lbl 404200901 `"Kenya 2009"', add
label define sample_lbl 417199901 `"Kyrgyz Republic 1999"', add
label define sample_lbl 417200901 `"Kyrgyz Republic 2009"', add
label define sample_lbl 418200501 `"Laos 2005"', add
label define sample_lbl 426199601 `"Lesotho 1996"', add
label define sample_lbl 426200601 `"Lesotho 2006"', add
label define sample_lbl 430197401 `"Liberia 1974"', add
label define sample_lbl 430200801 `"Liberia 2008"', add
label define sample_lbl 454198701 `"Malawi 1987"', add
label define sample_lbl 454199801 `"Malawi 1998"', add
label define sample_lbl 454200801 `"Malawi 2008"', add
label define sample_lbl 458197001 `"Malaysia 1970"', add
label define sample_lbl 458198001 `"Malaysia 1980"', add
label define sample_lbl 458199101 `"Malaysia 1991"', add
label define sample_lbl 458200001 `"Malaysia 2000"', add
label define sample_lbl 466198701 `"Mali 1987"', add
label define sample_lbl 466199801 `"Mali 1998"', add
label define sample_lbl 466200901 `"Mali 2009"', add
label define sample_lbl 484196001 `"Mexico 1960"', add
label define sample_lbl 484197001 `"Mexico 1970"', add
label define sample_lbl 484199001 `"Mexico 1990"', add
label define sample_lbl 484199501 `"Mexico 1995"', add
label define sample_lbl 484200001 `"Mexico 2000"', add
label define sample_lbl 484200501 `"Mexico 2005"', add
label define sample_lbl 484201001 `"Mexico 2010"', add
label define sample_lbl 484201501 `"Mexico 2015"', add
label define sample_lbl 496198901 `"Mongolia 1989"', add
label define sample_lbl 496200001 `"Mongolia 2000"', add
label define sample_lbl 504198201 `"Morocco 1982"', add
label define sample_lbl 504199401 `"Morocco 1994"', add
label define sample_lbl 504200401 `"Morocco 2004"', add
label define sample_lbl 508199701 `"Mozambique 1997"', add
label define sample_lbl 508200701 `"Mozambique 2007"', add
label define sample_lbl 524200101 `"Nepal 2001"', add
label define sample_lbl 524201101 `"Nepal 2011"', add
label define sample_lbl 528196001 `"Netherlands 1960"', add
label define sample_lbl 528197101 `"Netherlands 1971"', add
label define sample_lbl 528200101 `"Netherlands 2001"', add
label define sample_lbl 528201101 `"Netherlands 2011"', add
label define sample_lbl 558197101 `"Nicaragua 1971"', add
label define sample_lbl 558199501 `"Nicaragua 1995"', add
label define sample_lbl 558200501 `"Nicaragua 2005"', add
label define sample_lbl 566200621 `"Nigeria 2006"', add
label define sample_lbl 566200721 `"Nigeria 2007"', add
label define sample_lbl 566200821 `"Nigeria 2008"', add
label define sample_lbl 566200921 `"Nigeria 2009"', add
label define sample_lbl 566201021 `"Nigeria 2010"', add
label define sample_lbl 578180101 `"Norway 1801"', add
label define sample_lbl 578186501 `"Norway 1865"', add
label define sample_lbl 578187501 `"Norway 1875"', add
label define sample_lbl 578190001 `"Norway 1900"', add
label define sample_lbl 578191001 `"Norway 1910"', add
label define sample_lbl 586197301 `"Pakistan 1973"', add
label define sample_lbl 586198101 `"Pakistan 1981"', add
label define sample_lbl 586199801 `"Pakistan 1998"', add
label define sample_lbl 275199701 `"Palestine 1997"', add
label define sample_lbl 275200701 `"Palestine 2007"', add
label define sample_lbl 591196001 `"Panama 1960"', add
label define sample_lbl 591197001 `"Panama 1970"', add
label define sample_lbl 591198001 `"Panama 1980"', add
label define sample_lbl 591199001 `"Panama 1990"', add
label define sample_lbl 591200001 `"Panama 2000"', add
label define sample_lbl 591201001 `"Panama 2010"', add
label define sample_lbl 598198001 `"Papua New Guinea 1980"', add
label define sample_lbl 598199001 `"Papua New Guinea 1990"', add
label define sample_lbl 598200001 `"Papua New Guinea 2000"', add
label define sample_lbl 600196201 `"Paraguay 1962"', add
label define sample_lbl 600197201 `"Paraguay 1972"', add
label define sample_lbl 600198201 `"Paraguay 1982"', add
label define sample_lbl 600199201 `"Paraguay 1992"', add
label define sample_lbl 600200201 `"Paraguay 2002"', add
label define sample_lbl 604199301 `"Peru 1993"', add
label define sample_lbl 604200701 `"Peru 2007"', add
label define sample_lbl 608199001 `"Philippines 1990"', add
label define sample_lbl 608199501 `"Philippines 1995"', add
label define sample_lbl 608200001 `"Philippines 2000"', add
label define sample_lbl 608201001 `"Philippines 2010"', add
label define sample_lbl 616197801 `"Poland 1978"', add
label define sample_lbl 616198801 `"Poland 1988"', add
label define sample_lbl 616200201 `"Poland 2002"', add
label define sample_lbl 616201101 `"Poland 2011"', add
label define sample_lbl 620198101 `"Portugal 1981"', add
label define sample_lbl 620199101 `"Portugal 1991"', add
label define sample_lbl 620200101 `"Portugal 2001"', add
label define sample_lbl 620201101 `"Portugal 2011"', add
label define sample_lbl 630197001 `"Puerto Rico 1970"', add
label define sample_lbl 630198001 `"Puerto Rico 1980"', add
label define sample_lbl 630199001 `"Puerto Rico 1990"', add
label define sample_lbl 630200001 `"Puerto Rico 2000"', add
label define sample_lbl 630200501 `"Puerto Rico 2005"', add
label define sample_lbl 630201001 `"Puerto Rico 2010"', add
label define sample_lbl 642197701 `"Romania 1977"', add
label define sample_lbl 642199201 `"Romania 1992"', add
label define sample_lbl 642200201 `"Romania 2002"', add
label define sample_lbl 642201101 `"Romania 2011"', add
label define sample_lbl 643200201 `"Russia 2002"', add
label define sample_lbl 643201001 `"Russia 2010"', add
label define sample_lbl 646199101 `"Rwanda 1991"', add
label define sample_lbl 646200201 `"Rwanda 2002"', add
label define sample_lbl 646201201 `"Rwanda 2012"', add
label define sample_lbl 662198001 `"Saint Lucia 1980"', add
label define sample_lbl 662199101 `"Saint Lucia 1991"', add
label define sample_lbl 686198801 `"Senegal 1988"', add
label define sample_lbl 686200201 `"Senegal 2002"', add
label define sample_lbl 694200401 `"Sierra Leone 2004"', add
label define sample_lbl 705200201 `"Slovenia 2002"', add
label define sample_lbl 710199601 `"South Africa 1996"', add
label define sample_lbl 710200101 `"South Africa 2001"', add
label define sample_lbl 710200701 `"South Africa 2007"', add
label define sample_lbl 710201101 `"South Africa 2011"', add
label define sample_lbl 728200801 `"South Sudan 2008"', add
label define sample_lbl 724198101 `"Spain 1981"', add
label define sample_lbl 724199101 `"Spain 1991"', add
label define sample_lbl 724200101 `"Spain 2001"', add
label define sample_lbl 724201101 `"Spain 2011"', add
label define sample_lbl 724200521 `"Spain 2005 Q1 LFS"', add
label define sample_lbl 724200522 `"Spain 2005 Q2 LFS"', add
label define sample_lbl 724200523 `"Spain 2005 Q3 LFS"', add
label define sample_lbl 724200524 `"Spain 2005 Q4 LFS"', add
label define sample_lbl 724200621 `"Spain 2006 Q1 LFS"', add
label define sample_lbl 724200622 `"Spain 2006 Q2 LFS"', add
label define sample_lbl 724200623 `"Spain 2006 Q3 LFS"', add
label define sample_lbl 724200624 `"Spain 2006 Q4 LFS"', add
label define sample_lbl 724200721 `"Spain 2007 Q1 LFS"', add
label define sample_lbl 724200722 `"Spain 2007 Q2 LFS"', add
label define sample_lbl 724200723 `"Spain 2007 Q3 LFS"', add
label define sample_lbl 724200724 `"Spain 2007 Q4 LFS"', add
label define sample_lbl 724200821 `"Spain 2008 Q1 LFS"', add
label define sample_lbl 724200822 `"Spain 2008 Q2 LFS"', add
label define sample_lbl 724200823 `"Spain 2008 Q3 LFS"', add
label define sample_lbl 724200824 `"Spain 2008 Q4 LFS"', add
label define sample_lbl 724200921 `"Spain 2009 Q1 LFS"', add
label define sample_lbl 724200922 `"Spain 2009 Q2 LFS"', add
label define sample_lbl 724200923 `"Spain 2009 Q3 LFS"', add
label define sample_lbl 724200924 `"Spain 2009 Q4 LFS"', add
label define sample_lbl 724201021 `"Spain 2010 Q1 LFS"', add
label define sample_lbl 724201022 `"Spain 2010 Q2 LFS"', add
label define sample_lbl 724201023 `"Spain 2010 Q3 LFS"', add
label define sample_lbl 724201024 `"Spain 2010 Q4 LFS"', add
label define sample_lbl 724201121 `"Spain 2011 Q1 LFS"', add
label define sample_lbl 724201122 `"Spain 2011 Q2 LFS"', add
label define sample_lbl 724201123 `"Spain 2011 Q3 LFS"', add
label define sample_lbl 724201124 `"Spain 2011 Q4 LFS"', add
label define sample_lbl 724201221 `"Spain 2012 Q1 LFS"', add
label define sample_lbl 724201222 `"Spain 2012 Q2 LFS"', add
label define sample_lbl 724201223 `"Spain 2012 Q3 LFS"', add
label define sample_lbl 724201224 `"Spain 2012 Q4 LFS"', add
label define sample_lbl 724201321 `"Spain 2013 Q1 LFS"', add
label define sample_lbl 724201322 `"Spain 2013 Q2 LFS"', add
label define sample_lbl 724201323 `"Spain 2013 Q3 LFS"', add
label define sample_lbl 724201324 `"Spain 2013 Q4 LFS"', add
label define sample_lbl 724201421 `"Spain 2014 Q1 LFS"', add
label define sample_lbl 724201422 `"Spain 2014 Q2 LFS"', add
label define sample_lbl 724201423 `"Spain 2014 Q3 LFS"', add
label define sample_lbl 724201424 `"Spain 2014 Q4 LFS"', add
label define sample_lbl 724201521 `"Spain 2015 Q1 LFS"', add
label define sample_lbl 724201522 `"Spain 2015 Q2 LFS"', add
label define sample_lbl 724201523 `"Spain 2015 Q3 LFS"', add
label define sample_lbl 724201524 `"Spain 2015 Q4 LFS"', add
label define sample_lbl 724201621 `"Spain 2016 Q1 LFS"', add
label define sample_lbl 724201622 `"Spain 2016 Q2 LFS"', add
label define sample_lbl 724201623 `"Spain 2016 Q3 LFS"', add
label define sample_lbl 724201624 `"Spain 2016 Q4 LFS"', add
label define sample_lbl 724201721 `"Spain 2017 Q1 LFS"', add
label define sample_lbl 724201722 `"Spain 2017 Q2 LFS"', add
label define sample_lbl 724201723 `"Spain 2017 Q3 LFS"', add
label define sample_lbl 724201724 `"Spain 2017 Q4 LFS"', add
label define sample_lbl 724201821 `"Spain 2018 Q1 LFS"', add
label define sample_lbl 724201822 `"Spain 2018 Q2 LFS"', add
label define sample_lbl 724201823 `"Spain 2018 Q3 LFS"', add
label define sample_lbl 724201824 `"Spain 2018 Q4 LFS"', add
label define sample_lbl 729200801 `"Sudan 2008"', add
label define sample_lbl 752188001 `"Sweden 1880"', add
label define sample_lbl 752189001 `"Sweden 1890"', add
label define sample_lbl 752190001 `"Sweden 1900"', add
label define sample_lbl 752191001 `"Sweden 1910"', add
label define sample_lbl 756197001 `"Switzerland 1970"', add
label define sample_lbl 756198001 `"Switzerland 1980"', add
label define sample_lbl 756199001 `"Switzerland 1990"', add
label define sample_lbl 756200001 `"Switzerland 2000"', add
label define sample_lbl 834198801 `"Tanzania 1988"', add
label define sample_lbl 834200201 `"Tanzania 2002"', add
label define sample_lbl 834201201 `"Tanzania 2012"', add
label define sample_lbl 764197001 `"Thailand 1970"', add
label define sample_lbl 764198001 `"Thailand 1980"', add
label define sample_lbl 764199001 `"Thailand 1990"', add
label define sample_lbl 764200001 `"Thailand 2000"', add
label define sample_lbl 768196001 `"Togo 1960"', add
label define sample_lbl 768197001 `"Togo 1970"', add
label define sample_lbl 768201001 `"Togo 2010"', add
label define sample_lbl 780197001 `"Trinidad and Tobago 1970"', add
label define sample_lbl 780198001 `"Trinidad and Tobago 1980"', add
label define sample_lbl 780199001 `"Trinidad and Tobago 1990"', add
label define sample_lbl 780200001 `"Trinidad and Tobago 2000"', add
label define sample_lbl 780201101 `"Trinidad and Tobago 2011"', add
label define sample_lbl 792198501 `"Turkey 1985"', add
label define sample_lbl 792199001 `"Turkey 1990"', add
label define sample_lbl 792200001 `"Turkey 2000"', add
label define sample_lbl 800199101 `"Uganda 1991"', add
label define sample_lbl 800200201 `"Uganda 2002"', add
label define sample_lbl 804200101 `"Ukraine 2001"', add
label define sample_lbl 826185101 `"United Kingdom 1851 (England and Wales)"', add
label define sample_lbl 826185102 `"United Kingdom 1851 (Scotland)"', add
label define sample_lbl 826185103 `"United Kingdom 1851 (2% sample)"', add
label define sample_lbl 826186101 `"United Kingdom 1861 (England and Wales)"', add
label define sample_lbl 826186102 `"United Kingdom 1861 (Scotland)"', add
label define sample_lbl 826187101 `"United Kingdom 1871 (Scotland)"', add
label define sample_lbl 826188101 `"United Kingdom 1881 (England and Wales)"', add
label define sample_lbl 826188102 `"United Kingdom 1881 (Scotland)"', add
label define sample_lbl 826189101 `"United Kingdom 1891 (England and Wales)"', add
label define sample_lbl 826189102 `"United Kingdom 1891 (Scotland)"', add
label define sample_lbl 826190101 `"United Kingdom 1901 (England and Wales)"', add
label define sample_lbl 826190102 `"United Kingdom 1901 (Scotland)"', add
label define sample_lbl 826191101 `"United Kingdom 1911 (England and Wales)"', add
label define sample_lbl 826199101 `"United Kingdom 1991"', add
label define sample_lbl 826200101 `"United Kingdom 2001"', add
label define sample_lbl 840185001 `"United States 1850 (100%)"', add
label define sample_lbl 840185002 `"United States 1850 (1%)"', add
label define sample_lbl 840186001 `"United States 1860 (1%)"', add
label define sample_lbl 840187001 `"United States 1870 (1%)"', add
label define sample_lbl 840188001 `"United States 1880 (100%)"', add
label define sample_lbl 840188002 `"United States 1880 (10%)"', add
label define sample_lbl 840190001 `"United States 1900 (5%)"', add
label define sample_lbl 840191001 `"United States 1910 (1%)"', add
label define sample_lbl 840196001 `"United States 1960"', add
label define sample_lbl 840197001 `"United States 1970"', add
label define sample_lbl 840198001 `"United States 1980"', add
label define sample_lbl 840199001 `"United States 1990"', add
label define sample_lbl 840200001 `"United States 2000"', add
label define sample_lbl 840200501 `"United States 2005"', add
label define sample_lbl 840201001 `"United States 2010"', add
label define sample_lbl 840201501 `"United States 2015"', add
label define sample_lbl 858196301 `"Uruguay 1963"', add
label define sample_lbl 858196302 `"Uruguay 1963 (full count)"', add
label define sample_lbl 858197501 `"Uruguay 1975"', add
label define sample_lbl 858197502 `"Uruguay 1975 (full count)"', add
label define sample_lbl 858198501 `"Uruguay 1985"', add
label define sample_lbl 858198502 `"Uruguay 1985 (full count)"', add
label define sample_lbl 858199601 `"Uruguay 1996"', add
label define sample_lbl 858199602 `"Uruguay 1996 (full count)"', add
label define sample_lbl 858200621 `"Uruguay 2006"', add
label define sample_lbl 858201101 `"Uruguay 2011"', add
label define sample_lbl 858201102 `"Uruguay 2011 (full count)"', add
label define sample_lbl 862197101 `"Venezuela 1971"', add
label define sample_lbl 862198101 `"Venezuela 1981"', add
label define sample_lbl 862199001 `"Venezuela 1990"', add
label define sample_lbl 862200101 `"Venezuela 2001"', add
label define sample_lbl 704198901 `"Vietnam 1989"', add
label define sample_lbl 704199901 `"Vietnam 1999"', add
label define sample_lbl 704200901 `"Vietnam 2009"', add
label define sample_lbl 894199001 `"Zambia 1990"', add
label define sample_lbl 894200001 `"Zambia 2000"', add
label define sample_lbl 894201001 `"Zambia 2010"', add
label define sample_lbl 716201201 `"Zimbabwe 2012"', add
label values sample sample_lbl

label define urban_lbl 1 `"Rural"'
label define urban_lbl 2 `"Urban"', add
label define urban_lbl 9 `"Unknown"', add
label values urban urban_lbl

label define regionw_lbl 11 `"Eastern Africa"'
label define regionw_lbl 12 `"Middle Africa"', add
label define regionw_lbl 13 `"Northern Africa"', add
label define regionw_lbl 14 `"Southern Africa"', add
label define regionw_lbl 15 `"Western Africa"', add
label define regionw_lbl 21 `"Caribbean"', add
label define regionw_lbl 22 `"Central America"', add
label define regionw_lbl 23 `"North America"', add
label define regionw_lbl 24 `"South America"', add
label define regionw_lbl 31 `"Central Asia"', add
label define regionw_lbl 32 `"Eastern Asia"', add
label define regionw_lbl 33 `"Southern Asia"', add
label define regionw_lbl 34 `"South-Eastern Asia"', add
label define regionw_lbl 35 `"Western Asia"', add
label define regionw_lbl 41 `"Eastern Europe"', add
label define regionw_lbl 42 `"Northern Europe"', add
label define regionw_lbl 43 `"Southern Europe"', add
label define regionw_lbl 44 `"Western Europe"', add
label define regionw_lbl 51 `"Australia and New Zealand"', add
label define regionw_lbl 52 `"Melanesia"', add
label define regionw_lbl 53 `"Micronesia"', add
label define regionw_lbl 54 `"Polynesia"', add
label values regionw regionw_lbl

label define geo1_in_lbl 356001 `"Jammu and Kashmir"'
label define geo1_in_lbl 356002 `"Himachal Pradesh"', add
label define geo1_in_lbl 356003 `"Punjab"', add
label define geo1_in_lbl 356004 `"Chandigarh"', add
label define geo1_in_lbl 356006 `"Haryana"', add
label define geo1_in_lbl 356007 `"Delhi"', add
label define geo1_in_lbl 356008 `"Rajasthan"', add
label define geo1_in_lbl 356009 `"Uttar Pradesh, Uttaranchal"', add
label define geo1_in_lbl 356010 `"Bihar, Jharkhand"', add
label define geo1_in_lbl 356011 `"Sikkim"', add
label define geo1_in_lbl 356012 `"Arunachal Pradesh"', add
label define geo1_in_lbl 356013 `"Nagaland"', add
label define geo1_in_lbl 356014 `"Manipur"', add
label define geo1_in_lbl 356015 `"Mizoram"', add
label define geo1_in_lbl 356016 `"Tripura"', add
label define geo1_in_lbl 356017 `"Meghalaya"', add
label define geo1_in_lbl 356018 `"Assam"', add
label define geo1_in_lbl 356019 `"West Bengal"', add
label define geo1_in_lbl 356021 `"Orissa"', add
label define geo1_in_lbl 356023 `"Madhya Pradesh, Chhattisgarh"', add
label define geo1_in_lbl 356024 `"Gujarat"', add
label define geo1_in_lbl 356026 `"Dadra and Nagar Haveli"', add
label define geo1_in_lbl 356027 `"Maharashtra"', add
label define geo1_in_lbl 356028 `"Andhra Pradesh"', add
label define geo1_in_lbl 356029 `"Karnataka"', add
label define geo1_in_lbl 356030 `"Goa, Daman and Diu"', add
label define geo1_in_lbl 356031 `"Lakshadweep"', add
label define geo1_in_lbl 356032 `"Kerala"', add
label define geo1_in_lbl 356033 `"Tamil Nadu"', add
label define geo1_in_lbl 356034 `"Pondicherry"', add
label define geo1_in_lbl 356035 `"Andaman and Nicobar Islands"', add
label values geo1_in geo1_in_lbl

label define geo1_in1983_lbl 002 `"Andhra Pradesh"'
label define geo1_in1983_lbl 003 `"Assam"', add
label define geo1_in1983_lbl 004 `"Bihar"', add
label define geo1_in1983_lbl 005 `"Gujarat"', add
label define geo1_in1983_lbl 006 `"Haryana"', add
label define geo1_in1983_lbl 007 `"Himachal Pradesh"', add
label define geo1_in1983_lbl 008 `"Jammu and Kashmir"', add
label define geo1_in1983_lbl 009 `"Karnataka"', add
label define geo1_in1983_lbl 010 `"Kerala"', add
label define geo1_in1983_lbl 011 `"Madhya Pradesh"', add
label define geo1_in1983_lbl 012 `"Maharashtra"', add
label define geo1_in1983_lbl 013 `"Manipur"', add
label define geo1_in1983_lbl 014 `"Meghalaya"', add
label define geo1_in1983_lbl 015 `"Nagaland"', add
label define geo1_in1983_lbl 016 `"Orissa"', add
label define geo1_in1983_lbl 017 `"Punjab"', add
label define geo1_in1983_lbl 018 `"Rajasthan"', add
label define geo1_in1983_lbl 019 `"Sikkim"', add
label define geo1_in1983_lbl 020 `"Tamil Nadu"', add
label define geo1_in1983_lbl 021 `"Tripura"', add
label define geo1_in1983_lbl 022 `"Uttar Pradesh"', add
label define geo1_in1983_lbl 023 `"West Bengal"', add
label define geo1_in1983_lbl 024 `"Andaman and Nicobar Islands"', add
label define geo1_in1983_lbl 025 `"Arunachal Pradesh"', add
label define geo1_in1983_lbl 026 `"Chandigarh"', add
label define geo1_in1983_lbl 027 `"Dadra and Nagar Haveli"', add
label define geo1_in1983_lbl 028 `"Delhi"', add
label define geo1_in1983_lbl 029 `"Goa, Daman and Diu"', add
label define geo1_in1983_lbl 030 `"Lakshadweep"', add
label define geo1_in1983_lbl 031 `"Mizoram"', add
label define geo1_in1983_lbl 032 `"Pondicherry"', add
label values geo1_in1983 geo1_in1983_lbl

label define geo1_in1987_lbl 002 `"Andhra Pradesh"'
label define geo1_in1987_lbl 003 `"Assam"', add
label define geo1_in1987_lbl 004 `"Bihar"', add
label define geo1_in1987_lbl 005 `"Gujarat"', add
label define geo1_in1987_lbl 006 `"Haryana"', add
label define geo1_in1987_lbl 007 `"Himachal Pradesh"', add
label define geo1_in1987_lbl 008 `"Jammu and Kashmir"', add
label define geo1_in1987_lbl 009 `"Karnataka"', add
label define geo1_in1987_lbl 010 `"Kerala"', add
label define geo1_in1987_lbl 011 `"Madhya Pradesh"', add
label define geo1_in1987_lbl 012 `"Maharashtra"', add
label define geo1_in1987_lbl 013 `"Manipur"', add
label define geo1_in1987_lbl 014 `"Meghalaya"', add
label define geo1_in1987_lbl 015 `"Nagaland"', add
label define geo1_in1987_lbl 016 `"Orissa"', add
label define geo1_in1987_lbl 017 `"Punjab"', add
label define geo1_in1987_lbl 018 `"Rajasthan"', add
label define geo1_in1987_lbl 019 `"Sikkim"', add
label define geo1_in1987_lbl 020 `"Tamil Nadu"', add
label define geo1_in1987_lbl 021 `"Tripura"', add
label define geo1_in1987_lbl 022 `"Uttar Pradesh"', add
label define geo1_in1987_lbl 023 `"West Bengal"', add
label define geo1_in1987_lbl 024 `"Andaman and Nicobar Islands"', add
label define geo1_in1987_lbl 025 `"Arunachal Pradesh"', add
label define geo1_in1987_lbl 026 `"Chandigarh"', add
label define geo1_in1987_lbl 027 `"Dadra and Nagar Haveli"', add
label define geo1_in1987_lbl 028 `"Delhi"', add
label define geo1_in1987_lbl 029 `"Goa, Daman and Diu"', add
label define geo1_in1987_lbl 030 `"Lakshadweep"', add
label define geo1_in1987_lbl 031 `"Mizoram"', add
label define geo1_in1987_lbl 032 `"Pondicherry"', add
label values geo1_in1987 geo1_in1987_lbl

label define geo1_in1993_lbl 002 `"Andhra Pradesh"'
label define geo1_in1993_lbl 003 `"Arunachal Pradesh"', add
label define geo1_in1993_lbl 004 `"Assam"', add
label define geo1_in1993_lbl 005 `"Bihar"', add
label define geo1_in1993_lbl 006 `"Goa"', add
label define geo1_in1993_lbl 007 `"Gujarat"', add
label define geo1_in1993_lbl 008 `"Haryana"', add
label define geo1_in1993_lbl 009 `"Himachal Pradesh"', add
label define geo1_in1993_lbl 010 `"Jammu and Kashmir"', add
label define geo1_in1993_lbl 011 `"Karnataka"', add
label define geo1_in1993_lbl 012 `"Kerala"', add
label define geo1_in1993_lbl 013 `"Madhya Pradesh"', add
label define geo1_in1993_lbl 014 `"Maharashtra"', add
label define geo1_in1993_lbl 015 `"Manipur"', add
label define geo1_in1993_lbl 016 `"Meghalaya"', add
label define geo1_in1993_lbl 017 `"Mizoram"', add
label define geo1_in1993_lbl 018 `"Nagaland"', add
label define geo1_in1993_lbl 019 `"Orissa"', add
label define geo1_in1993_lbl 020 `"Punjab"', add
label define geo1_in1993_lbl 021 `"Rajasthan"', add
label define geo1_in1993_lbl 022 `"Sikkim"', add
label define geo1_in1993_lbl 023 `"Tamil Nadu"', add
label define geo1_in1993_lbl 024 `"Tripura"', add
label define geo1_in1993_lbl 025 `"Uttar Pradesh"', add
label define geo1_in1993_lbl 026 `"West Bengal"', add
label define geo1_in1993_lbl 027 `"Andaman and Nicobar Islands"', add
label define geo1_in1993_lbl 028 `"Chandigarh"', add
label define geo1_in1993_lbl 029 `"Dadra and Nagar Haveli"', add
label define geo1_in1993_lbl 030 `"Daman and Diu"', add
label define geo1_in1993_lbl 031 `"Delhi"', add
label define geo1_in1993_lbl 032 `"Lakshadweep"', add
label define geo1_in1993_lbl 033 `"Pondicherry"', add
label values geo1_in1993 geo1_in1993_lbl

label define geo2_in_lbl 356001001 `"Kupwara"'
label define geo2_in_lbl 356001002 `"Baramula"', add
label define geo2_in_lbl 356001003 `"Srinagar"', add
label define geo2_in_lbl 356001004 `"Badgam"', add
label define geo2_in_lbl 356001005 `"Pulwama"', add
label define geo2_in_lbl 356001006 `"Anantnag"', add
label define geo2_in_lbl 356001007 `"Ladakh"', add
label define geo2_in_lbl 356001008 `"Kargil, Doda"', add
label define geo2_in_lbl 356001009 `"Doda"', add
label define geo2_in_lbl 356001010 `"Udhampur"', add
label define geo2_in_lbl 356001011 `"Punch"', add
label define geo2_in_lbl 356001012 `"Rajauri"', add
label define geo2_in_lbl 356001013 `"Jammu"', add
label define geo2_in_lbl 356001014 `"Kathua"', add
label define geo2_in_lbl 356001099 `"Jammu and Kashmir, district unknown"', add
label define geo2_in_lbl 356002001 `"Chamba"', add
label define geo2_in_lbl 356002002 `"Kangra"', add
label define geo2_in_lbl 356002003 `"Lahul & Spiti"', add
label define geo2_in_lbl 356002004 `"Kullu"', add
label define geo2_in_lbl 356002005 `"Mandi"', add
label define geo2_in_lbl 356002006 `"Hamirpur"', add
label define geo2_in_lbl 356002007 `"Una"', add
label define geo2_in_lbl 356002008 `"Bilaspur"', add
label define geo2_in_lbl 356002009 `"Solan"', add
label define geo2_in_lbl 356002010 `"Sirmaur"', add
label define geo2_in_lbl 356002011 `"Shimla"', add
label define geo2_in_lbl 356002012 `"Kinnaur"', add
label define geo2_in_lbl 356002099 `"Himachal Pradesh, district unknown"', add
label define geo2_in_lbl 356003001 `"Gurdaspur"', add
label define geo2_in_lbl 356003002 `"Amritsar"', add
label define geo2_in_lbl 356003003 `"Kapurthala"', add
label define geo2_in_lbl 356003004 `"Hoshiarpur, Jalandhar, Nawanshahr"', add
label define geo2_in_lbl 356003005 `"Fatehgarh Sahib, Ludhiana, Patiala, Rupnagar, S.A.S. nagar (Mohali)"', add
label define geo2_in_lbl 356003006 `"Faridkot, Firozpur, Moga, Muktsar"', add
label define geo2_in_lbl 356003007 `"Bathinda, Mansa"', add
label define geo2_in_lbl 356003008 `"Sangrur"', add
label define geo2_in_lbl 356003099 `"Punjab, district unknown"', add
label define geo2_in_lbl 356004001 `"Chandigarh"', add
label define geo2_in_lbl 356006001 `"Ambala, Kaithal, Kurukshetra, Panchkula, Yamunanagar"', add
label define geo2_in_lbl 356006002 `"Karnal, Panipat"', add
label define geo2_in_lbl 356006003 `"Sonipat"', add
label define geo2_in_lbl 356006004 `"Jind"', add
label define geo2_in_lbl 356006005 `"Fatehabad, Hisar"', add
label define geo2_in_lbl 356006006 `"Sirsa"', add
label define geo2_in_lbl 356006007 `"Bhiwani"', add
label define geo2_in_lbl 356006008 `"Jhajjar, Rohtak"', add
label define geo2_in_lbl 356006009 `"Mahendragarh, Rewari"', add
label define geo2_in_lbl 356006010 `"Mewat, Gurgaon"', add
label define geo2_in_lbl 356006011 `"Faridabad"', add
label define geo2_in_lbl 356007001 `"Delhi North West, Delhi South, Delhi North, Delhi North East, Delhi South West, Delhi West, Delhi East, New Delhi, Delhi Central"', add
label define geo2_in_lbl 356008001 `"Ganganagar, Hanumangarh"', add
label define geo2_in_lbl 356008002 `"Bikaner"', add
label define geo2_in_lbl 356008003 `"Churu"', add
label define geo2_in_lbl 356008004 `"Jhunjhunun"', add
label define geo2_in_lbl 356008005 `"Alwar"', add
label define geo2_in_lbl 356008006 `"Bharatpur"', add
label define geo2_in_lbl 356008007 `"Dhaulpur"', add
label define geo2_in_lbl 356008008 `"Dausa, Jaipur, Karauli, Sawai Madhopur"', add
label define geo2_in_lbl 356008009 `"Sikar"', add
label define geo2_in_lbl 356008010 `"Nagaur"', add
label define geo2_in_lbl 356008011 `"Jodhpur"', add
label define geo2_in_lbl 356008012 `"Jaisalmer"', add
label define geo2_in_lbl 356008013 `"Barmer"', add
label define geo2_in_lbl 356008014 `"Jalor"', add
label define geo2_in_lbl 356008015 `"Sirohi"', add
label define geo2_in_lbl 356008016 `"Pali"', add
label define geo2_in_lbl 356008017 `"Ajmer"', add
label define geo2_in_lbl 356008018 `"Tonk"', add
label define geo2_in_lbl 356008019 `"Bundi"', add
label define geo2_in_lbl 356008020 `"Bhilwara"', add
label define geo2_in_lbl 356008021 `"Rajsamand, Udaipur"', add
label define geo2_in_lbl 356008022 `"Dungarpur"', add
label define geo2_in_lbl 356008023 `"Banswara"', add
label define geo2_in_lbl 356008024 `"Chittaurgarh"', add
label define geo2_in_lbl 356008025 `"Baran, Kota"', add
label define geo2_in_lbl 356008026 `"Jhalawar"', add
label define geo2_in_lbl 356008099 `"Rajasthan, district unknown"', add
label define geo2_in_lbl 356009001 `"Uttarkashi"', add
label define geo2_in_lbl 356009002 `"Chamoli, Rudraprayag"', add
label define geo2_in_lbl 356009003 `"Tehri Garhwal"', add
label define geo2_in_lbl 356009004 `"Dehradun"', add
label define geo2_in_lbl 356009005 `"Garhwal"', add
label define geo2_in_lbl 356009006 `"Champawat, Pithoragarh"', add
label define geo2_in_lbl 356009007 `"Almora, Bageshwar"', add
label define geo2_in_lbl 356009008 `"Nainital, Udham Singh Nagar"', add
label define geo2_in_lbl 356009009 `"Saharanpur, Hardwar"', add
label define geo2_in_lbl 356009010 `"Muzaffarnagar"', add
label define geo2_in_lbl 356009011 `"Bijnor"', add
label define geo2_in_lbl 356009012 `"J Phule Nagar, Moradabad"', add
label define geo2_in_lbl 356009013 `"Rampur"', add
label define geo2_in_lbl 356009014 `"Baghpat, Meerut"', add
label define geo2_in_lbl 356009015 `"Bulandshahr, G. Buddha Nagar, Ghaziabad"', add
label define geo2_in_lbl 356009016 `"Aligarh, Hathras, Mathura"', add
label define geo2_in_lbl 356009017 `"Agra, Firozabad, Mainpuri"', add
label define geo2_in_lbl 356009018 `"Etah"', add
label define geo2_in_lbl 356009019 `"Budaun"', add
label define geo2_in_lbl 356009020 `"Bareilly"', add
label define geo2_in_lbl 356009021 `"Pilibhit"', add
label define geo2_in_lbl 356009022 `"Shahjahanpur"', add
label define geo2_in_lbl 356009023 `"Kheri"', add
label define geo2_in_lbl 356009024 `"Sitapur"', add
label define geo2_in_lbl 356009025 `"Hardoi"', add
label define geo2_in_lbl 356009026 `"Unnao"', add
label define geo2_in_lbl 356009027 `"Lucknow"', add
label define geo2_in_lbl 356009028 `"Rae Bareli"', add
label define geo2_in_lbl 356009029 `"Farrukhabad, Kannauj"', add
label define geo2_in_lbl 356009030 `"Auraiya, Etawah"', add
label define geo2_in_lbl 356009031 `"Kanpur Dehat, Kanpur Nagar"', add
label define geo2_in_lbl 356009032 `"Jalaun"', add
label define geo2_in_lbl 356009033 `"Jhansi"', add
label define geo2_in_lbl 356009034 `"Lalitpur"', add
label define geo2_in_lbl 356009035 `"Hamirpur, Mahoba"', add
label define geo2_in_lbl 356009036 `"Banda, Chitrakoot"', add
label define geo2_in_lbl 356009037 `"Fatehpur"', add
label define geo2_in_lbl 356009038 `"Pratapgarh"', add
label define geo2_in_lbl 356009039 `"Allahabad, Kaushambi"', add
label define geo2_in_lbl 356009040 `"Barabanki"', add
label define geo2_in_lbl 356009041 `"Ambedkar Nag., Faizabad"', add
label define geo2_in_lbl 356009042 `"Sultanpur"', add
label define geo2_in_lbl 356009043 `"Bahraich, Shrawasti"', add
label define geo2_in_lbl 356009044 `"Balrampur, Gonda"', add
label define geo2_in_lbl 356009045 `"Basti, S. Kabir Nagar, Siddharthnagar"', add
label define geo2_in_lbl 356009046 `"Gorakhpur, Maharajganj"', add
label define geo2_in_lbl 356009047 `"Deoria, Kushinagar"', add
label define geo2_in_lbl 356009048 `"Azamgarh, Mau"', add
label define geo2_in_lbl 356009049 `"Ballia"', add
label define geo2_in_lbl 356009050 `"Jaunpur"', add
label define geo2_in_lbl 356009051 `"Ghazipur"', add
label define geo2_in_lbl 356009052 `"Chandauli, S.R. Nagar (Bhadohi), Varanasi"', add
label define geo2_in_lbl 356009053 `"Mirzapur, Sonbhadra"', add
label define geo2_in_lbl 356009099 `"Uttar Pradesh and Uttaranchal, district unknown"', add
label define geo2_in_lbl 356010001 `"Champaran (W)"', add
label define geo2_in_lbl 356010002 `"Champaran (E)"', add
label define geo2_in_lbl 356010003 `"Sheohar, Sitamarhi"', add
label define geo2_in_lbl 356010004 `"Madhubani"', add
label define geo2_in_lbl 356010005 `"Saharsa, Supaul"', add
label define geo2_in_lbl 356010006 `"Kishanganj, Purnia, Araria"', add
label define geo2_in_lbl 356010007 `"Katihar"', add
label define geo2_in_lbl 356010008 `"Madhepura"', add
label define geo2_in_lbl 356010009 `"Darbhanga"', add
label define geo2_in_lbl 356010010 `"Muzaffarpur"', add
label define geo2_in_lbl 356010011 `"Gopalganj"', add
label define geo2_in_lbl 356010012 `"Siwan"', add
label define geo2_in_lbl 356010013 `"Saran"', add
label define geo2_in_lbl 356010014 `"Vaishali"', add
label define geo2_in_lbl 356010015 `"Samastipur"', add
label define geo2_in_lbl 356010016 `"Begusarai"', add
label define geo2_in_lbl 356010017 `"Khagaria"', add
label define geo2_in_lbl 356010018 `"Banka, Bhagalpur"', add
label define geo2_in_lbl 356010019 `"Jamui, Lakhisarai, Munger, Sheikhpura"', add
label define geo2_in_lbl 356010020 `"Nalanda"', add
label define geo2_in_lbl 356010021 `"Patna"', add
label define geo2_in_lbl 356010022 `"Bhojpur, Buxar"', add
label define geo2_in_lbl 356010023 `"Kaimur    Bhabua, Rohtas"', add
label define geo2_in_lbl 356010024 `"Gaya, Jehanabad, Arwal"', add
label define geo2_in_lbl 356010025 `"Aurangabad"', add
label define geo2_in_lbl 356010026 `"Nawada"', add
label define geo2_in_lbl 356010027 `"Garhwa, Palamu, Latehar"', add
label define geo2_in_lbl 356010028 `"Chatra, Hazaribag, Kodarma"', add
label define geo2_in_lbl 356010029 `"Bokaro, Dhanbad, Giridih"', add
label define geo2_in_lbl 356010030 `"Deoghar"', add
label define geo2_in_lbl 356010031 `"Godda"', add
label define geo2_in_lbl 356010032 `"Pakaur, Sahibganj"', add
label define geo2_in_lbl 356010033 `"Dumka, Jamtara"', add
label define geo2_in_lbl 356010034 `"Ranchi"', add
label define geo2_in_lbl 356010035 `"Lohardaga"', add
label define geo2_in_lbl 356010036 `"Gumla, Simdega"', add
label define geo2_in_lbl 356010037 `"Singhbhum (W), Singhbhum (E), Saraikela Khareswan"', add
label define geo2_in_lbl 356010099 `"Bihar and Jharkhand, district unknown"', add
label define geo2_in_lbl 356011001 `"North Mongam"', add
label define geo2_in_lbl 356011002 `"West Gyalshing"', add
label define geo2_in_lbl 356011003 `"South Nimachai"', add
label define geo2_in_lbl 356011004 `"East Gangtok"', add
label define geo2_in_lbl 356012001 `"Tawang, West Kameng"', add
label define geo2_in_lbl 356012002 `"East Kameng"', add
label define geo2_in_lbl 356012003 `"Kurungkumey, Papum Pare, Lower Subansiri"', add
label define geo2_in_lbl 356012004 `"Upper Subansiri"', add
label define geo2_in_lbl 356012005 `"West Siang"', add
label define geo2_in_lbl 356012006 `"East Siang, Upper Siang"', add
label define geo2_in_lbl 356012007 `"Dibang Valley, Lower Dibang Valley"', add
label define geo2_in_lbl 356012008 `"Anjaw, Lohit"', add
label define geo2_in_lbl 356012009 `"Changlang, Tirap"', add
label define geo2_in_lbl 356012099 `"Arunachal Pradesh, district unknown"', add
label define geo2_in_lbl 356013001 `"Mon"', add
label define geo2_in_lbl 356013002 `"Tuensang, Kiphire, Longleng"', add
label define geo2_in_lbl 356013003 `"Mokokchung"', add
label define geo2_in_lbl 356013004 `"Zunheboto"', add
label define geo2_in_lbl 356013005 `"Wokha"', add
label define geo2_in_lbl 356013006 `"Dimapur, Peren, Kohima"', add
label define geo2_in_lbl 356013007 `"Phek"', add
label define geo2_in_lbl 356014001 `"Senapati"', add
label define geo2_in_lbl 356014002 `"Tamenglong"', add
label define geo2_in_lbl 356014003 `"Churachandpur"', add
label define geo2_in_lbl 356014004 `"Bishnupur"', add
label define geo2_in_lbl 356014005 `"Thoubal"', add
label define geo2_in_lbl 356014006 `"Imphal East, Imphal West"', add
label define geo2_in_lbl 356014007 `"Ukhrul"', add
label define geo2_in_lbl 356014008 `"Chandel"', add
label define geo2_in_lbl 356014099 `"Manipur, district unknown"', add
label define geo2_in_lbl 356015001 `"Aizwal, Champhai, Kolasib, Mamit, Serchip"', add
label define geo2_in_lbl 356015002 `"Lunglei"', add
label define geo2_in_lbl 356015003 `"Lawngtlai, Saiha"', add
label define geo2_in_lbl 356015099 `"Mizoram, district unknown"', add
label define geo2_in_lbl 356016001 `"West Tripura"', add
label define geo2_in_lbl 356016002 `"Dhalai, North Tripura, South Tripura"', add
label define geo2_in_lbl 356016099 `"Tripura, district unknown"', add
label define geo2_in_lbl 356017001 `"South Garo Hills, West Garo Hills"', add
label define geo2_in_lbl 356017002 `"East Garo Hills"', add
label define geo2_in_lbl 356017003 `"West Khasi Hills"', add
label define geo2_in_lbl 356017004 `"East Khasi Hills, Ri Bhoi"', add
label define geo2_in_lbl 356017005 `"Jaintia Hills"', add
label define geo2_in_lbl 356017099 `"Meghalaya, district unknown"', add
label define geo2_in_lbl 356018001 `"Bongaigaon, Goalpara, Kokrajhar, Dhubri, Chirang"', add
label define geo2_in_lbl 356018002 `"Barpeta, Kamrup, Guwahati, Nalbari, Baksa"', add
label define geo2_in_lbl 356018003 `"Udalguri, Sonitpur, Darrang"', add
label define geo2_in_lbl 356018004 `"Marigaon, Nagaon"', add
label define geo2_in_lbl 356018005 `"Dhemaji, Lakhimpur"', add
label define geo2_in_lbl 356018006 `"Dibrugarh, Tinsukia"', add
label define geo2_in_lbl 356018007 `"Golaghat, Jorhat, Sibsagar"', add
label define geo2_in_lbl 356018008 `"Karbi Anglong"', add
label define geo2_in_lbl 356018009 `"North Cachar Hills"', add
label define geo2_in_lbl 356018010 `"Cachar, Hai Lakandi, Karimganj"', add
label define geo2_in_lbl 356018099 `"Assam, district unknown"', add
label define geo2_in_lbl 356019001 `"Darjiling"', add
label define geo2_in_lbl 356019002 `"Jalpaiguri"', add
label define geo2_in_lbl 356019003 `"Koch Bihar"', add
label define geo2_in_lbl 356019004 `"Dakshin Dinajpur, Uttar Dinajpur"', add
label define geo2_in_lbl 356019005 `"Maldah"', add
label define geo2_in_lbl 356019006 `"Murshidabad"', add
label define geo2_in_lbl 356019007 `"Birbhum"', add
label define geo2_in_lbl 356019008 `"Barddhaman"', add
label define geo2_in_lbl 356019009 `"Nadia"', add
label define geo2_in_lbl 356019010 `"North 24-Parganas"', add
label define geo2_in_lbl 356019011 `"Hugli"', add
label define geo2_in_lbl 356019012 `"Bankura"', add
label define geo2_in_lbl 356019013 `"Puruliya"', add
label define geo2_in_lbl 356019014 `"Paschim Midnapur, Purba Midnapur"', add
label define geo2_in_lbl 356019015 `"Howrah"', add
label define geo2_in_lbl 356019016 `"Kolkata"', add
label define geo2_in_lbl 356019017 `"South 24-Parganas"', add
label define geo2_in_lbl 356019099 `"West Bengal, district unknown"', add
label define geo2_in_lbl 356021001 `"Bargarh, Debagarh, Jharsuguda, Sambalpur"', add
label define geo2_in_lbl 356021002 `"Sundargarh"', add
label define geo2_in_lbl 356021003 `"Kendujhar"', add
label define geo2_in_lbl 356021004 `"Mayurbhanj"', add
label define geo2_in_lbl 356021005 `"Baleshwar, Bhadrak"', add
label define geo2_in_lbl 356021006 `"Cuttack, Jagatsinghapur, Jajapur, Kendrapara"', add
label define geo2_in_lbl 356021007 `"Anugul, Dhenkanal"', add
label define geo2_in_lbl 356021008 `"Khordha, Nayagarh, Puri"', add
label define geo2_in_lbl 356021009 `"Gajapati, Ganjam"', add
label define geo2_in_lbl 356021010 `"Baudh, Kandhamal (Phoolbani)"', add
label define geo2_in_lbl 356021011 `"Balangir, Sonapur"', add
label define geo2_in_lbl 356021012 `"Kalahandi, Nuapada"', add
label define geo2_in_lbl 356021013 `"Koraput, Malkangiri, Nabarangapur, Rayagada"', add
label define geo2_in_lbl 356021099 `"Orissa, district unknown"', add
label define geo2_in_lbl 356023001 `"Koriya, Surguja"', add
label define geo2_in_lbl 356023002 `"Jashpur, Raigarh"', add
label define geo2_in_lbl 356023003 `"Bilaspur, Janjgir-Champa, Kawardha, Korba, Rajnandgaon"', add
label define geo2_in_lbl 356023004 `"Durg"', add
label define geo2_in_lbl 356023005 `"Dhamtari, Mahasamund, Raipur"', add
label define geo2_in_lbl 356023006 `"Bastar, Dantewada, Kanker"', add
label define geo2_in_lbl 356023007 `"Morena, Sheopur"', add
label define geo2_in_lbl 356023008 `"Bhind"', add
label define geo2_in_lbl 356023009 `"Gwalior"', add
label define geo2_in_lbl 356023010 `"Datia"', add
label define geo2_in_lbl 356023011 `"Shivpuri"', add
label define geo2_in_lbl 356023012 `"Guna, Ashoknagar"', add
label define geo2_in_lbl 356023013 `"Tikamgarh"', add
label define geo2_in_lbl 356023014 `"Chhatarpur"', add
label define geo2_in_lbl 356023015 `"Panna"', add
label define geo2_in_lbl 356023016 `"Sagar"', add
label define geo2_in_lbl 356023017 `"Damoh"', add
label define geo2_in_lbl 356023018 `"Satna"', add
label define geo2_in_lbl 356023019 `"Rewa"', add
label define geo2_in_lbl 356023020 `"Shahdol, Umaria, Anuppur"', add
label define geo2_in_lbl 356023021 `"Sidhi"', add
label define geo2_in_lbl 356023022 `"Mandsaur, Neemuch"', add
label define geo2_in_lbl 356023023 `"Ratlam"', add
label define geo2_in_lbl 356023024 `"Ujjain"', add
label define geo2_in_lbl 356023025 `"Shajapur"', add
label define geo2_in_lbl 356023026 `"Dewas"', add
label define geo2_in_lbl 356023027 `"Jhabua"', add
label define geo2_in_lbl 356023028 `"Dhar"', add
label define geo2_in_lbl 356023029 `"Indore"', add
label define geo2_in_lbl 356023030 `"Barwani, W. Nimar"', add
label define geo2_in_lbl 356023031 `"E. Nimar, Burhampur"', add
label define geo2_in_lbl 356023032 `"Rajgarh"', add
label define geo2_in_lbl 356023033 `"Vidisha"', add
label define geo2_in_lbl 356023034 `"Bhopal"', add
label define geo2_in_lbl 356023035 `"Sehore"', add
label define geo2_in_lbl 356023036 `"Raisen"', add
label define geo2_in_lbl 356023037 `"Betul"', add
label define geo2_in_lbl 356023038 `"Harda, Hoshangabad"', add
label define geo2_in_lbl 356023039 `"Jabalpur, Katni"', add
label define geo2_in_lbl 356023040 `"Narsimhapur"', add
label define geo2_in_lbl 356023041 `"Dindori, Mandla"', add
label define geo2_in_lbl 356023042 `"Chhindwara"', add
label define geo2_in_lbl 356023043 `"Seoni"', add
label define geo2_in_lbl 356023044 `"Balaghat"', add
label define geo2_in_lbl 356023099 `"Madhya Pradesh and Chhattisgarh, district unknown"', add
label define geo2_in_lbl 356024001 `"Kachchh"', add
label define geo2_in_lbl 356024002 `"Bans Kantha, Mahesana, Patan"', add
label define geo2_in_lbl 356024003 `"Sabar Kantha"', add
label define geo2_in_lbl 356024004 `"Gandhinagar"', add
label define geo2_in_lbl 356024005 `"Ahmedabad"', add
label define geo2_in_lbl 356024006 `"Surendranagar"', add
label define geo2_in_lbl 356024007 `"Rajkot"', add
label define geo2_in_lbl 356024008 `"Jamnagar"', add
label define geo2_in_lbl 356024009 `"Junagadh, Porbandar"', add
label define geo2_in_lbl 356024010 `"Amreli"', add
label define geo2_in_lbl 356024011 `"Bhavnagar"', add
label define geo2_in_lbl 356024012 `"Anand, Kheda"', add
label define geo2_in_lbl 356024013 `"Dohad, Panch Mahals"', add
label define geo2_in_lbl 356024014 `"Vadodara"', add
label define geo2_in_lbl 356024015 `"Narmada, Bharuch"', add
label define geo2_in_lbl 356024016 `"Surat"', add
label define geo2_in_lbl 356024017 `"The Dangs"', add
label define geo2_in_lbl 356024018 `"Navsari, Valsad"', add
label define geo2_in_lbl 356024099 `"Gujarat, district unknown"', add
label define geo2_in_lbl 356026001 `"Dadra and Nagar Havelira  & NH"', add
label define geo2_in_lbl 356027001 `"Dhule, Nandurbar"', add
label define geo2_in_lbl 356027002 `"Jalgaon"', add
label define geo2_in_lbl 356027003 `"Buldana"', add
label define geo2_in_lbl 356027004 `"Akola, Washim"', add
label define geo2_in_lbl 356027005 `"Amravati"', add
label define geo2_in_lbl 356027006 `"Wardha"', add
label define geo2_in_lbl 356027007 `"Nagpur"', add
label define geo2_in_lbl 356027008 `"Gondiya, Bhandara"', add
label define geo2_in_lbl 356027009 `"Chandrapur, Gadchiroli"', add
label define geo2_in_lbl 356027010 `"Yavatmal"', add
label define geo2_in_lbl 356027011 `"Nanded"', add
label define geo2_in_lbl 356027012 `"Hingoli, Parbhani"', add
label define geo2_in_lbl 356027013 `"Jalna"', add
label define geo2_in_lbl 356027014 `"Aurangabad"', add
label define geo2_in_lbl 356027015 `"Nashik"', add
label define geo2_in_lbl 356027016 `"Thane"', add
label define geo2_in_lbl 356027017 `"Mumbai Suburban, Mumbai"', add
label define geo2_in_lbl 356027018 `"Raigarh"', add
label define geo2_in_lbl 356027019 `"Pune"', add
label define geo2_in_lbl 356027020 `"Ahmadnagar"', add
label define geo2_in_lbl 356027021 `"Bid"', add
label define geo2_in_lbl 356027022 `"Latur"', add
label define geo2_in_lbl 356027023 `"Osmanabad"', add
label define geo2_in_lbl 356027024 `"Solapur"', add
label define geo2_in_lbl 356027025 `"Satara"', add
label define geo2_in_lbl 356027026 `"Ratnagiri"', add
label define geo2_in_lbl 356027027 `"Sindhudurg"', add
label define geo2_in_lbl 356027028 `"Kolhapur"', add
label define geo2_in_lbl 356027029 `"Sangli"', add
label define geo2_in_lbl 356027099 `"Maharashtra, district unknown"', add
label define geo2_in_lbl 356028001 `"Adilabad"', add
label define geo2_in_lbl 356028002 `"Nizamabad"', add
label define geo2_in_lbl 356028003 `"Karimnagar"', add
label define geo2_in_lbl 356028004 `"Medak"', add
label define geo2_in_lbl 356028005 `"Hyderabad"', add
label define geo2_in_lbl 356028006 `"Rangareddi"', add
label define geo2_in_lbl 356028007 `"Mahbubnagar"', add
label define geo2_in_lbl 356028008 `"Nalgonda"', add
label define geo2_in_lbl 356028009 `"Warangal"', add
label define geo2_in_lbl 356028010 `"Khammam"', add
label define geo2_in_lbl 356028011 `"Srikakulam"', add
label define geo2_in_lbl 356028012 `"Vizianagaram"', add
label define geo2_in_lbl 356028013 `"Visakhapatnam"', add
label define geo2_in_lbl 356028014 `"East Godavari"', add
label define geo2_in_lbl 356028015 `"West Godavari"', add
label define geo2_in_lbl 356028016 `"Krishna"', add
label define geo2_in_lbl 356028017 `"Guntur"', add
label define geo2_in_lbl 356028018 `"Prakasam"', add
label define geo2_in_lbl 356028019 `"Nellore"', add
label define geo2_in_lbl 356028020 `"Cuddapah"', add
label define geo2_in_lbl 356028021 `"Kurnool"', add
label define geo2_in_lbl 356028022 `"Anantapur"', add
label define geo2_in_lbl 356028023 `"Chittoor"', add
label define geo2_in_lbl 356028099 `"Andhra Pradesh, district unknown"', add
label define geo2_in_lbl 356029001 `"Belgaum"', add
label define geo2_in_lbl 356029002 `"Bagalkot, Bijapur"', add
label define geo2_in_lbl 356029003 `"Gulbarga"', add
label define geo2_in_lbl 356029004 `"Bidar"', add
label define geo2_in_lbl 356029005 `"Koppal, Raichur"', add
label define geo2_in_lbl 356029006 `"Dharwad, Gadag, Haveri"', add
label define geo2_in_lbl 356029007 `"Uttara Kannada"', add
label define geo2_in_lbl 356029008 `"Bellary, Chitradurga, Davanagere, Shimoga"', add
label define geo2_in_lbl 356029009 `"Udupi, Dakshina Kannada"', add
label define geo2_in_lbl 356029010 `"Chikmagalur"', add
label define geo2_in_lbl 356029011 `"Tumkur"', add
label define geo2_in_lbl 356029012 `"Kolar"', add
label define geo2_in_lbl 356029013 `"Bangalore Rural, Bangalore"', add
label define geo2_in_lbl 356029014 `"Mandya"', add
label define geo2_in_lbl 356029015 `"Hassan"', add
label define geo2_in_lbl 356029016 `"Kodagu"', add
label define geo2_in_lbl 356029017 `"Chamarajanagar, Mysore"', add
label define geo2_in_lbl 356029099 `"Karnataka, district unknown"', add
label define geo2_in_lbl 356030001 `"Diu"', add
label define geo2_in_lbl 356030002 `"Daman"', add
label define geo2_in_lbl 356030003 `"South Goa, North Goa"', add
label define geo2_in_lbl 356031001 `"Lakshadweep"', add
label define geo2_in_lbl 356032001 `"Kasaragod"', add
label define geo2_in_lbl 356032002 `"Kannur"', add
label define geo2_in_lbl 356032003 `"Wayanad"', add
label define geo2_in_lbl 356032004 `"Kozhikode"', add
label define geo2_in_lbl 356032005 `"Malappuram"', add
label define geo2_in_lbl 356032006 `"Palakkad"', add
label define geo2_in_lbl 356032007 `"Thrissur"', add
label define geo2_in_lbl 356032008 `"Ernakulam"', add
label define geo2_in_lbl 356032009 `"Idukki"', add
label define geo2_in_lbl 356032010 `"Kottayam"', add
label define geo2_in_lbl 356032011 `"Alappuzha"', add
label define geo2_in_lbl 356032012 `"Pathanamthitta"', add
label define geo2_in_lbl 356032013 `"Kollam"', add
label define geo2_in_lbl 356032014 `"Thiruvananthapuram"', add
label define geo2_in_lbl 356033001 `"Kancheepuram, Thiruvallur"', add
label define geo2_in_lbl 356033002 `"Chennai"', add
label define geo2_in_lbl 356033003 `"Tiruvanamalai, Vellore"', add
label define geo2_in_lbl 356033004 `"Krishnagiri, Dharmapuri"', add
label define geo2_in_lbl 356033005 `"Cuddalore, Viluppuram"', add
label define geo2_in_lbl 356033006 `"Namakkal, Salem"', add
label define geo2_in_lbl 356033007 `"Erode"', add
label define geo2_in_lbl 356033008 `"The Nilgiris"', add
label define geo2_in_lbl 356033009 `"Coimbatore"', add
label define geo2_in_lbl 356033010 `"Dindigul"', add
label define geo2_in_lbl 356033011 `"Ariyalur, Karur, Perambalur, Tiruchirappalli"', add
label define geo2_in_lbl 356033012 `"Nagapattinam, Thanjavur, Thiruvarur"', add
label define geo2_in_lbl 356033013 `"Pudukkottai"', add
label define geo2_in_lbl 356033014 `"Sivaganga"', add
label define geo2_in_lbl 356033015 `"Madurai, Theni"', add
label define geo2_in_lbl 356033016 `"Virudhunagar"', add
label define geo2_in_lbl 356033017 `"Ramanathapuram"', add
label define geo2_in_lbl 356033018 `"Toothukudi, Tirunelveli"', add
label define geo2_in_lbl 356033019 `"Kanniyakumari"', add
label define geo2_in_lbl 356033099 `"Tamil Nadu, district unknown"', add
label define geo2_in_lbl 356034001 `"Yanam"', add
label define geo2_in_lbl 356034002 `"Pondicherry"', add
label define geo2_in_lbl 356034003 `"Mahe"', add
label define geo2_in_lbl 356034004 `"Karaikal"', add
label define geo2_in_lbl 356034099 `"Pondicherry, district unknown"', add
label define geo2_in_lbl 356035001 `"South Andaman, North and Middle Andaman"', add
label define geo2_in_lbl 356035002 `"Nicobars"', add
label values geo2_in geo2_in_lbl

label define geo2_in1987_lbl 002001 `"Srikakulam"'
label define geo2_in1987_lbl 002002 `"Vizianagaram"', add
label define geo2_in1987_lbl 002003 `"Visakhapatnam"', add
label define geo2_in1987_lbl 002004 `"East Godavari"', add
label define geo2_in1987_lbl 002005 `"West Godavari"', add
label define geo2_in1987_lbl 002006 `"Krishna"', add
label define geo2_in1987_lbl 002007 `"Guntur"', add
label define geo2_in1987_lbl 002008 `"Prakasam"', add
label define geo2_in1987_lbl 002009 `"Nellore"', add
label define geo2_in1987_lbl 002010 `"Chittoor"', add
label define geo2_in1987_lbl 002011 `"Guddapah"', add
label define geo2_in1987_lbl 002012 `"Anantapur"', add
label define geo2_in1987_lbl 002013 `"Kurnool"', add
label define geo2_in1987_lbl 002014 `"Mahbubnagar"', add
label define geo2_in1987_lbl 002015 `"Ranga Reddy"', add
label define geo2_in1987_lbl 002016 `"Hyderabad"', add
label define geo2_in1987_lbl 002017 `"Medak"', add
label define geo2_in1987_lbl 002018 `"Nizamabad"', add
label define geo2_in1987_lbl 002019 `"Adilabad"', add
label define geo2_in1987_lbl 002020 `"Karimnagar"', add
label define geo2_in1987_lbl 002021 `"Warangal"', add
label define geo2_in1987_lbl 002022 `"Khamman"', add
label define geo2_in1987_lbl 002023 `"Nalgonda"', add
label define geo2_in1987_lbl 002099 `"Andhra Pradesh, district unknown"', add
label define geo2_in1987_lbl 003001 `"Goalpara"', add
label define geo2_in1987_lbl 003002 `"Kamrup"', add
label define geo2_in1987_lbl 003003 `"Darrang"', add
label define geo2_in1987_lbl 003004 `"Lakhimpur"', add
label define geo2_in1987_lbl 003005 `"Dibrugarh"', add
label define geo2_in1987_lbl 003006 `"Sibsagar"', add
label define geo2_in1987_lbl 003007 `"Novgong"', add
label define geo2_in1987_lbl 003008 `"Karbi Anglong"', add
label define geo2_in1987_lbl 003009 `"North Cachar Hills"', add
label define geo2_in1987_lbl 003010 `"Cachar"', add
label define geo2_in1987_lbl 003099 `"Assam, district unknown"', add
label define geo2_in1987_lbl 004001 `"Patna"', add
label define geo2_in1987_lbl 004002 `"Nalanda"', add
label define geo2_in1987_lbl 004003 `"Nawadah"', add
label define geo2_in1987_lbl 004004 `"Gaya"', add
label define geo2_in1987_lbl 004005 `"Aurangabad"', add
label define geo2_in1987_lbl 004006 `"Rohtas"', add
label define geo2_in1987_lbl 004007 `"Bhojpur"', add
label define geo2_in1987_lbl 004008 `"Saran"', add
label define geo2_in1987_lbl 004009 `"Siwan"', add
label define geo2_in1987_lbl 004010 `"Gopalganj"', add
label define geo2_in1987_lbl 004011 `"Chaparan West"', add
label define geo2_in1987_lbl 004012 `"Chaparan East"', add
label define geo2_in1987_lbl 004013 `"Sitamarhi"', add
label define geo2_in1987_lbl 004014 `"Mizaffarpur"', add
label define geo2_in1987_lbl 004015 `"Vaishali"', add
label define geo2_in1987_lbl 004016 `"Begusarai"', add
label define geo2_in1987_lbl 004017 `"Samastipur"', add
label define geo2_in1987_lbl 004018 `"Darbhanga"', add
label define geo2_in1987_lbl 004019 `"Madhubani"', add
label define geo2_in1987_lbl 004020 `"Saharasa"', add
label define geo2_in1987_lbl 004021 `"Purnea"', add
label define geo2_in1987_lbl 004022 `"Katihar"', add
label define geo2_in1987_lbl 004023 `"Monghya"', add
label define geo2_in1987_lbl 004024 `"Bhagalpur"', add
label define geo2_in1987_lbl 004025 `"Dumka"', add
label define geo2_in1987_lbl 004026 `"Dhanbad"', add
label define geo2_in1987_lbl 004027 `"Giridih"', add
label define geo2_in1987_lbl 004028 `"Hazaribagh"', add
label define geo2_in1987_lbl 004029 `"Palamau"', add
label define geo2_in1987_lbl 004030 `"Ranchi"', add
label define geo2_in1987_lbl 004031 `"Singbhum"', add
label define geo2_in1987_lbl 004032 `"Madhapura"', add
label define geo2_in1987_lbl 004033 `"Khageria"', add
label define geo2_in1987_lbl 004034 `"Deoghar"', add
label define geo2_in1987_lbl 004035 `"Godda"', add
label define geo2_in1987_lbl 004036 `"Sahebganj"', add
label define geo2_in1987_lbl 004037 `"Gulma"', add
label define geo2_in1987_lbl 004038 `"Lohardagga"', add
label define geo2_in1987_lbl 004099 `"Bihar, district unknown"', add
label define geo2_in1987_lbl 005001 `"Jamnagar"', add
label define geo2_in1987_lbl 005002 `"Rajkot"', add
label define geo2_in1987_lbl 005003 `"Surendranagar"', add
label define geo2_in1987_lbl 005004 `"Bhavnagar"', add
label define geo2_in1987_lbl 005005 `"Amrali"', add
label define geo2_in1987_lbl 005006 `"Junagadh"', add
label define geo2_in1987_lbl 005007 `"Kachehha"', add
label define geo2_in1987_lbl 005008 `"Binaskantha"', add
label define geo2_in1987_lbl 005009 `"Sabarkantha"', add
label define geo2_in1987_lbl 005010 `"Mahesana"', add
label define geo2_in1987_lbl 005011 `"Gandhinagar"', add
label define geo2_in1987_lbl 005012 `"Ahmedabad"', add
label define geo2_in1987_lbl 005013 `"Kheda"', add
label define geo2_in1987_lbl 005014 `"Panchmahals"', add
label define geo2_in1987_lbl 005015 `"Vadodara"', add
label define geo2_in1987_lbl 005016 `"Bharuch"', add
label define geo2_in1987_lbl 005017 `"Surat"', add
label define geo2_in1987_lbl 005018 `"Valsad"', add
label define geo2_in1987_lbl 005019 `"The Dangs"', add
label define geo2_in1987_lbl 006001 `"Ambala"', add
label define geo2_in1987_lbl 006002 `"Kurukshetra"', add
label define geo2_in1987_lbl 006003 `"Karnal"', add
label define geo2_in1987_lbl 006004 `"Jind"', add
label define geo2_in1987_lbl 006005 `"Sonepat"', add
label define geo2_in1987_lbl 006006 `"Rohtak"', add
label define geo2_in1987_lbl 006007 `"Faridabad"', add
label define geo2_in1987_lbl 006008 `"Guragon"', add
label define geo2_in1987_lbl 006009 `"Mahendragarh"', add
label define geo2_in1987_lbl 006010 `"Bhiwani"', add
label define geo2_in1987_lbl 006011 `"Hissar"', add
label define geo2_in1987_lbl 006012 `"Sirsa"', add
label define geo2_in1987_lbl 005099 `"Gujarat, district unknown"', add
label define geo2_in1987_lbl 007001 `"Chamba"', add
label define geo2_in1987_lbl 007002 `"Kangra"', add
label define geo2_in1987_lbl 007003 `"Hamirpur"', add
label define geo2_in1987_lbl 007004 `"Una"', add
label define geo2_in1987_lbl 007005 `"Bilaspur"', add
label define geo2_in1987_lbl 007006 `"Mandi"', add
label define geo2_in1987_lbl 007007 `"Kulu"', add
label define geo2_in1987_lbl 007008 `"Lahaul  Spiti"', add
label define geo2_in1987_lbl 007009 `"Simla"', add
label define geo2_in1987_lbl 007010 `"Solan"', add
label define geo2_in1987_lbl 007011 `"Sirmaur"', add
label define geo2_in1987_lbl 007012 `"Kinnaur"', add
label define geo2_in1987_lbl 007099 `"Himachal Pradesh, district unknown"', add
label define geo2_in1987_lbl 008001 `"Anantang, Kargil, Doda, Ladakh"', add
label define geo2_in1987_lbl 008002 `"Pulwama"', add
label define geo2_in1987_lbl 008003 `"Srinagar"', add
label define geo2_in1987_lbl 008004 `"Badgam"', add
label define geo2_in1987_lbl 008005 `"Barmula"', add
label define geo2_in1987_lbl 008006 `"Kupwara"', add
label define geo2_in1987_lbl 008010 `"Udhampur"', add
label define geo2_in1987_lbl 008011 `"Kathua"', add
label define geo2_in1987_lbl 008012 `"Jammu"', add
label define geo2_in1987_lbl 008013 `"Rajouri"', add
label define geo2_in1987_lbl 008014 `"Poonch"', add
label define geo2_in1987_lbl 008099 `"Jammu and Kashmir, district unknown"', add
label define geo2_in1987_lbl 009001 `"Bangalore"', add
label define geo2_in1987_lbl 009002 `"Belgaum"', add
label define geo2_in1987_lbl 009003 `"Bellary"', add
label define geo2_in1987_lbl 009004 `"Bidar"', add
label define geo2_in1987_lbl 009005 `"Bijapur"', add
label define geo2_in1987_lbl 009006 `"Chikmagalur"', add
label define geo2_in1987_lbl 009007 `"Chitradurga"', add
label define geo2_in1987_lbl 009008 `"Dakshin Kannada"', add
label define geo2_in1987_lbl 009009 `"Dharwar"', add
label define geo2_in1987_lbl 009010 `"Gulbarga"', add
label define geo2_in1987_lbl 009011 `"Hassan"', add
label define geo2_in1987_lbl 009012 `"Kodagu"', add
label define geo2_in1987_lbl 009013 `"Kolar"', add
label define geo2_in1987_lbl 009014 `"Mandya"', add
label define geo2_in1987_lbl 009015 `"Mysore"', add
label define geo2_in1987_lbl 009016 `"Raichur"', add
label define geo2_in1987_lbl 009017 `"Shimoga"', add
label define geo2_in1987_lbl 009018 `"Thumkur"', add
label define geo2_in1987_lbl 009019 `"Uttar Kannad"', add
label define geo2_in1987_lbl 009099 `"Karnataka, district unknown"', add
label define geo2_in1987_lbl 010001 `"Cannanore"', add
label define geo2_in1987_lbl 010002 `"Wynad"', add
label define geo2_in1987_lbl 010003 `"Kozhikode"', add
label define geo2_in1987_lbl 010004 `"Malappuram"', add
label define geo2_in1987_lbl 010005 `"Palghat"', add
label define geo2_in1987_lbl 010006 `"Trichur"', add
label define geo2_in1987_lbl 010007 `"Ernakulam"', add
label define geo2_in1987_lbl 010008 `"Idukki"', add
label define geo2_in1987_lbl 010009 `"Kottayam"', add
label define geo2_in1987_lbl 010010 `"Alleppey"', add
label define geo2_in1987_lbl 010011 `"Quilon"', add
label define geo2_in1987_lbl 010012 `"Trivandrum"', add
label define geo2_in1987_lbl 010013 `"Kasarged"', add
label define geo2_in1987_lbl 010014 `"Pathanamthitta"', add
label define geo2_in1987_lbl 011001 `"Morena"', add
label define geo2_in1987_lbl 011002 `"Bhind"', add
label define geo2_in1987_lbl 011003 `"Gwalior"', add
label define geo2_in1987_lbl 011004 `"Datian"', add
label define geo2_in1987_lbl 011005 `"Shivpuri"', add
label define geo2_in1987_lbl 011006 `"Guna"', add
label define geo2_in1987_lbl 011007 `"Tikamgarh"', add
label define geo2_in1987_lbl 011008 `"Chhatarpur"', add
label define geo2_in1987_lbl 011009 `"Panna"', add
label define geo2_in1987_lbl 011010 `"Sagar"', add
label define geo2_in1987_lbl 011011 `"Demoh"', add
label define geo2_in1987_lbl 011012 `"Satna"', add
label define geo2_in1987_lbl 011013 `"Rewa"', add
label define geo2_in1987_lbl 011014 `"Shahdol"', add
label define geo2_in1987_lbl 011015 `"Sidhi"', add
label define geo2_in1987_lbl 011016 `"Manisaur"', add
label define geo2_in1987_lbl 011017 `"Ratlam"', add
label define geo2_in1987_lbl 011018 `"Ujjain"', add
label define geo2_in1987_lbl 011019 `"Shajapur"', add
label define geo2_in1987_lbl 011020 `"Dewas"', add
label define geo2_in1987_lbl 011021 `"Jhabua"', add
label define geo2_in1987_lbl 011022 `"Dharwar"', add
label define geo2_in1987_lbl 011023 `"Indore"', add
label define geo2_in1987_lbl 011024 `"Khargone (W. Nirmar)"', add
label define geo2_in1987_lbl 011025 `"Khandwa (E. Nirmar)"', add
label define geo2_in1987_lbl 011026 `"Rajgarh"', add
label define geo2_in1987_lbl 011027 `"Vidisha"', add
label define geo2_in1987_lbl 011028 `"Bhopal"', add
label define geo2_in1987_lbl 011029 `"Sahore"', add
label define geo2_in1987_lbl 011030 `"Raisen"', add
label define geo2_in1987_lbl 011031 `"Betul"', add
label define geo2_in1987_lbl 011032 `"Hoshangabad"', add
label define geo2_in1987_lbl 011033 `"Jabalpur"', add
label define geo2_in1987_lbl 011034 `"Narshinhapur"', add
label define geo2_in1987_lbl 011035 `"Mandla"', add
label define geo2_in1987_lbl 011036 `"Chhindwara"', add
label define geo2_in1987_lbl 011037 `"Seoni"', add
label define geo2_in1987_lbl 011038 `"Balaghat"', add
label define geo2_in1987_lbl 011039 `"Surguja"', add
label define geo2_in1987_lbl 011040 `"Bilaspur"', add
label define geo2_in1987_lbl 011041 `"Raigarh"', add
label define geo2_in1987_lbl 011042 `"Rajnandgaon"', add
label define geo2_in1987_lbl 011043 `"Durg"', add
label define geo2_in1987_lbl 011044 `"Raipur"', add
label define geo2_in1987_lbl 011045 `"Bastar"', add
label define geo2_in1987_lbl 011099 `"Madhya Pradesh, district unknown"', add
label define geo2_in1987_lbl 012001 `"Greater Bombay"', add
label define geo2_in1987_lbl 012002 `"Thane"', add
label define geo2_in1987_lbl 012003 `"Raigarh (Kulaba)"', add
label define geo2_in1987_lbl 012004 `"Retangiri"', add
label define geo2_in1987_lbl 012005 `"Nasik"', add
label define geo2_in1987_lbl 012006 `"Dhule"', add
label define geo2_in1987_lbl 012007 `"Jalgaon"', add
label define geo2_in1987_lbl 012008 `"Ahmednagar"', add
label define geo2_in1987_lbl 012009 `"Pune"', add
label define geo2_in1987_lbl 012010 `"Satara"', add
label define geo2_in1987_lbl 012011 `"Sangli"', add
label define geo2_in1987_lbl 012012 `"Solapur"', add
label define geo2_in1987_lbl 012013 `"Kolhapur"', add
label define geo2_in1987_lbl 012014 `"Aurangabad"', add
label define geo2_in1987_lbl 012015 `"Parbhani"', add
label define geo2_in1987_lbl 012016 `"Beed"', add
label define geo2_in1987_lbl 012017 `"Nanded"', add
label define geo2_in1987_lbl 012018 `"Usmanabad"', add
label define geo2_in1987_lbl 012019 `"Buldana"', add
label define geo2_in1987_lbl 012020 `"Akola"', add
label define geo2_in1987_lbl 012021 `"Amravati"', add
label define geo2_in1987_lbl 012022 `"Yavatmal"', add
label define geo2_in1987_lbl 012023 `"Wardha"', add
label define geo2_in1987_lbl 012024 `"Nagpur"', add
label define geo2_in1987_lbl 012025 `"Shandara"', add
label define geo2_in1987_lbl 012026 `"Chanrapur"', add
label define geo2_in1987_lbl 012027 `"Jalna"', add
label define geo2_in1987_lbl 012028 `"Sindhudurg"', add
label define geo2_in1987_lbl 012029 `"Latur"', add
label define geo2_in1987_lbl 012099 `"Maharashtra, district unknown"', add
label define geo2_in1987_lbl 013001 `"Manipur North"', add
label define geo2_in1987_lbl 013002 `"Manipur West"', add
label define geo2_in1987_lbl 013003 `"Manipur South"', add
label define geo2_in1987_lbl 013004 `"Tengnoupal"', add
label define geo2_in1987_lbl 013005 `"Imphal"', add
label define geo2_in1987_lbl 013006 `"Bishnupur"', add
label define geo2_in1987_lbl 013007 `"Thoubal"', add
label define geo2_in1987_lbl 013008 `"Manipur East"', add
label define geo2_in1987_lbl 013099 `"Manipur, district unknown"', add
label define geo2_in1987_lbl 014001 `"Jaintia Hills"', add
label define geo2_in1987_lbl 014002 `"East Khasi Hills"', add
label define geo2_in1987_lbl 014003 `"West Khasi Hills"', add
label define geo2_in1987_lbl 014004 `"East Garo Hills"', add
label define geo2_in1987_lbl 014005 `"West Garo Hills"', add
label define geo2_in1987_lbl 014099 `"Meghalaya, district unknown"', add
label define geo2_in1987_lbl 015001 `"Kohima"', add
label define geo2_in1987_lbl 015004 `"Wokha, Zonhebato"', add
label define geo2_in1987_lbl 015005 `"Makokohung"', add
label define geo2_in1987_lbl 015006 `"Tuensang, Mou"', add
label define geo2_in1987_lbl 016001 `"Sambalpur"', add
label define geo2_in1987_lbl 016002 `"Sundargarh"', add
label define geo2_in1987_lbl 016003 `"Keonjhar"', add
label define geo2_in1987_lbl 016004 `"Mayurbhanj"', add
label define geo2_in1987_lbl 016005 `"Balasore"', add
label define geo2_in1987_lbl 016006 `"Cukkack"', add
label define geo2_in1987_lbl 016007 `"Dhen Kahal"', add
label define geo2_in1987_lbl 016008 `"Baudh"', add
label define geo2_in1987_lbl 016009 `"Bolangir"', add
label define geo2_in1987_lbl 016010 `"Kalahandi"', add
label define geo2_in1987_lbl 016011 `"Koraput"', add
label define geo2_in1987_lbl 016012 `"Ganjam"', add
label define geo2_in1987_lbl 016013 `"Puri"', add
label define geo2_in1987_lbl 016099 `"Orissa, district unknown"', add
label define geo2_in1987_lbl 017001 `"Gurudaspur"', add
label define geo2_in1987_lbl 017002 `"Amritsar"', add
label define geo2_in1987_lbl 017003 `"Ferozpur"', add
label define geo2_in1987_lbl 017004 `"Ludhiana"', add
label define geo2_in1987_lbl 017005 `"Jullundur"', add
label define geo2_in1987_lbl 017006 `"Kapurthala"', add
label define geo2_in1987_lbl 017007 `"Hoshiarpur"', add
label define geo2_in1987_lbl 017008 `"Rupnagar"', add
label define geo2_in1987_lbl 017009 `"Patiala"', add
label define geo2_in1987_lbl 017010 `"Sangrur"', add
label define geo2_in1987_lbl 017011 `"Bhatinda"', add
label define geo2_in1987_lbl 017012 `"Faridkot"', add
label define geo2_in1987_lbl 017099 `"Punjab, district unknown"', add
label define geo2_in1987_lbl 018001 `"Ganganagar"', add
label define geo2_in1987_lbl 018002 `"Bikaner"', add
label define geo2_in1987_lbl 018003 `"Cauru"', add
label define geo2_in1987_lbl 018004 `"Jhunjhunun"', add
label define geo2_in1987_lbl 018005 `"Alwar"', add
label define geo2_in1987_lbl 018006 `"Bharatpur"', add
label define geo2_in1987_lbl 018007 `"Sawai-Modhopur"', add
label define geo2_in1987_lbl 018008 `"Jaipur"', add
label define geo2_in1987_lbl 018009 `"Sikar"', add
label define geo2_in1987_lbl 018010 `"Ajmer"', add
label define geo2_in1987_lbl 018011 `"Tonk"', add
label define geo2_in1987_lbl 018012 `"Jaisalmer"', add
label define geo2_in1987_lbl 018013 `"Jodhpur"', add
label define geo2_in1987_lbl 018014 `"Nagpur"', add
label define geo2_in1987_lbl 018015 `"Pali"', add
label define geo2_in1987_lbl 018016 `"Parmer"', add
label define geo2_in1987_lbl 018017 `"Jalor"', add
label define geo2_in1987_lbl 018018 `"Sirchi"', add
label define geo2_in1987_lbl 018019 `"Bhilwara"', add
label define geo2_in1987_lbl 018020 `"Udaipur"', add
label define geo2_in1987_lbl 018021 `"Chittorgarh"', add
label define geo2_in1987_lbl 018022 `"Dungarpur"', add
label define geo2_in1987_lbl 018023 `"Banswara"', add
label define geo2_in1987_lbl 018024 `"Bundi"', add
label define geo2_in1987_lbl 018025 `"Kota"', add
label define geo2_in1987_lbl 018026 `"Jhalawar"', add
label define geo2_in1987_lbl 018027 `"Dholpur"', add
label define geo2_in1987_lbl 018099 `"Rajasthan, district unknown"', add
label define geo2_in1987_lbl 019001 `"North East"', add
label define geo2_in1987_lbl 019002 `"East"', add
label define geo2_in1987_lbl 019003 `"South"', add
label define geo2_in1987_lbl 019004 `"West"', add
label define geo2_in1987_lbl 020001 `"Madras"', add
label define geo2_in1987_lbl 020002 `"Chingalpattu"', add
label define geo2_in1987_lbl 020003 `"North Arcot"', add
label define geo2_in1987_lbl 020004 `"South Arcot"', add
label define geo2_in1987_lbl 020005 `"Dharmapuri"', add
label define geo2_in1987_lbl 020006 `"Salem"', add
label define geo2_in1987_lbl 020007 `"Periyar"', add
label define geo2_in1987_lbl 020008 `"Coimbatore"', add
label define geo2_in1987_lbl 020009 `"Nilgiris"', add
label define geo2_in1987_lbl 020010 `"Madurai"', add
label define geo2_in1987_lbl 020011 `"Tiruchirapalli"', add
label define geo2_in1987_lbl 020012 `"Thanjavu"', add
label define geo2_in1987_lbl 020013 `"Pudukkottai"', add
label define geo2_in1987_lbl 020014 `"Ramanathapuram"', add
label define geo2_in1987_lbl 020015 `"Tirunelvalli"', add
label define geo2_in1987_lbl 020016 `"Kannya"', add
label define geo2_in1987_lbl 020017 `"Kumari Pasumpon Mathuramalingam"', add
label define geo2_in1987_lbl 020018 `"Kamarajar"', add
label define geo2_in1987_lbl 020019 `"Anna"', add
label define geo2_in1987_lbl 020099 `"Tamil Nadu, district unknown"', add
label define geo2_in1987_lbl 021001 `"West Tripura"', add
label define geo2_in1987_lbl 021002 `"North Tripura"', add
label define geo2_in1987_lbl 021003 `"South Tripura"', add
label define geo2_in1987_lbl 021099 `"Tripura, district unknown"', add
label define geo2_in1987_lbl 022001 `"Uttar Kashi"', add
label define geo2_in1987_lbl 022002 `"Chamoli"', add
label define geo2_in1987_lbl 022003 `"Their Garwal"', add
label define geo2_in1987_lbl 022004 `"Dehra Dun"', add
label define geo2_in1987_lbl 022005 `"Garhwal"', add
label define geo2_in1987_lbl 022006 `"Pithora Garh"', add
label define geo2_in1987_lbl 022007 `"Almora"', add
label define geo2_in1987_lbl 022008 `"Nainital"', add
label define geo2_in1987_lbl 022009 `"Saharanpur"', add
label define geo2_in1987_lbl 022010 `"Muzaffarnagar"', add
label define geo2_in1987_lbl 022011 `"Disnor"', add
label define geo2_in1987_lbl 022012 `"Meerut"', add
label define geo2_in1987_lbl 022013 `"Ghaziabad"', add
label define geo2_in1987_lbl 022014 `"Bulandshahr"', add
label define geo2_in1987_lbl 022015 `"Moradabad"', add
label define geo2_in1987_lbl 022016 `"Rampur"', add
label define geo2_in1987_lbl 022017 `"Budaun"', add
label define geo2_in1987_lbl 022018 `"Bareilly"', add
label define geo2_in1987_lbl 022019 `"Pilibhit"', add
label define geo2_in1987_lbl 022020 `"Shahjahanpur"', add
label define geo2_in1987_lbl 022021 `"Aligarh"', add
label define geo2_in1987_lbl 022022 `"Mathura"', add
label define geo2_in1987_lbl 022023 `"Agra"', add
label define geo2_in1987_lbl 022024 `"Etah"', add
label define geo2_in1987_lbl 022025 `"Mainpuri"', add
label define geo2_in1987_lbl 022026 `"Farukhabad"', add
label define geo2_in1987_lbl 022027 `"Etawah"', add
label define geo2_in1987_lbl 022028 `"Kanpur"', add
label define geo2_in1987_lbl 022029 `"Fatehpur"', add
label define geo2_in1987_lbl 022030 `"Allahabad"', add
label define geo2_in1987_lbl 022031 `"Jalaun"', add
label define geo2_in1987_lbl 022032 `"Jhansi"', add
label define geo2_in1987_lbl 022033 `"Lalitpur"', add
label define geo2_in1987_lbl 022034 `"Hamirpur"', add
label define geo2_in1987_lbl 022035 `"Banda"', add
label define geo2_in1987_lbl 022036 `"Kheri"', add
label define geo2_in1987_lbl 022037 `"Sitapur"', add
label define geo2_in1987_lbl 022038 `"Hardoi"', add
label define geo2_in1987_lbl 022039 `"Unnao"', add
label define geo2_in1987_lbl 022040 `"Lucknow"', add
label define geo2_in1987_lbl 022041 `"Raibareli"', add
label define geo2_in1987_lbl 022042 `"Baharaich"', add
label define geo2_in1987_lbl 022043 `"Gonia"', add
label define geo2_in1987_lbl 022044 `"Barabanki"', add
label define geo2_in1987_lbl 022045 `"Faizabad"', add
label define geo2_in1987_lbl 022046 `"Sultanpur"', add
label define geo2_in1987_lbl 022047 `"Pratapgarh"', add
label define geo2_in1987_lbl 022048 `"Basti"', add
label define geo2_in1987_lbl 022049 `"Gorakhpur"', add
label define geo2_in1987_lbl 022050 `"Deoria"', add
label define geo2_in1987_lbl 022051 `"Azamgarh"', add
label define geo2_in1987_lbl 022052 `"Jaunpur"', add
label define geo2_in1987_lbl 022053 `"Balia"', add
label define geo2_in1987_lbl 022054 `"Ghazipur"', add
label define geo2_in1987_lbl 022055 `"Varanasi"', add
label define geo2_in1987_lbl 022056 `"Mirzapur"', add
label define geo2_in1987_lbl 022099 `"Uttar Pradesh, district unknown"', add
label define geo2_in1987_lbl 023001 `"Cooch Behar"', add
label define geo2_in1987_lbl 023002 `"Jalpaiguri"', add
label define geo2_in1987_lbl 023003 `"Darjeeling"', add
label define geo2_in1987_lbl 023004 `"West Dinajpur"', add
label define geo2_in1987_lbl 023005 `"Maldah"', add
label define geo2_in1987_lbl 023006 `"Murshidabad"', add
label define geo2_in1987_lbl 023007 `"Nadia"', add
label define geo2_in1987_lbl 023008 `"24 Parganas (North)"', add
label define geo2_in1987_lbl 023009 `"Calcutta"', add
label define geo2_in1987_lbl 023010 `"Howrah"', add
label define geo2_in1987_lbl 023011 `"Hoogly"', add
label define geo2_in1987_lbl 023012 `"Midnapur"', add
label define geo2_in1987_lbl 023013 `"Bankura"', add
label define geo2_in1987_lbl 023014 `"Purulia"', add
label define geo2_in1987_lbl 023015 `"Burdwan"', add
label define geo2_in1987_lbl 023016 `"Birbhum"', add
label define geo2_in1987_lbl 023017 `"24 Parganas (South)"', add
label define geo2_in1987_lbl 023099 `"West Bengal, district unknown"', add
label define geo2_in1987_lbl 024001 `"Andaman"', add
label define geo2_in1987_lbl 024002 `"Nicobar"', add
label define geo2_in1987_lbl 025001 `"West Kameng"', add
label define geo2_in1987_lbl 025002 `"East Kameng"', add
label define geo2_in1987_lbl 025003 `"Lower Subansiri"', add
label define geo2_in1987_lbl 025004 `"Upper Subansiri"', add
label define geo2_in1987_lbl 025005 `"West Siang"', add
label define geo2_in1987_lbl 025006 `"East Siang"', add
label define geo2_in1987_lbl 025008 `"Dibang Valley, Lohit"', add
label define geo2_in1987_lbl 025009 `"Tirap"', add
label define geo2_in1987_lbl 025099 `"Arunachal Pradesh, district unknown"', add
label define geo2_in1987_lbl 026001 `"Chandigarh"', add
label define geo2_in1987_lbl 027001 `"Dadra and Nagar Haveli"', add
label define geo2_in1987_lbl 028001 `"Delhi"', add
label define geo2_in1987_lbl 029001 `"Goa"', add
label define geo2_in1987_lbl 029002 `"Daman"', add
label define geo2_in1987_lbl 029003 `"Diu"', add
label define geo2_in1987_lbl 030001 `"Lakshadweep"', add
label define geo2_in1987_lbl 031001 `"Aizwal"', add
label define geo2_in1987_lbl 031002 `"Linglee"', add
label define geo2_in1987_lbl 031003 `"Chhimtuipui"', add
label define geo2_in1987_lbl 031099 `"Mizoram, district unknown"', add
label define geo2_in1987_lbl 032001 `"Pondicherry"', add
label define geo2_in1987_lbl 032002 `"Karaikal"', add
label define geo2_in1987_lbl 032003 `"Mahe"', add
label define geo2_in1987_lbl 032004 `"Yanam"', add
label define geo2_in1987_lbl 032099 `"Pondicherry, district unknown"', add
label values geo2_in1987 geo2_in1987_lbl

label define dhs_ipumsi_in_lbl 01 `"Jammu and Kashmir"'
label define dhs_ipumsi_in_lbl 02 `"Himachal Pradesh"', add
label define dhs_ipumsi_in_lbl 03 `"Punjab"', add
label define dhs_ipumsi_in_lbl 06 `"Haryana"', add
label define dhs_ipumsi_in_lbl 07 `"Delhi"', add
label define dhs_ipumsi_in_lbl 08 `"Rajasthan"', add
label define dhs_ipumsi_in_lbl 09 `"Uttar Pradesh and Uttaranchal"', add
label define dhs_ipumsi_in_lbl 10 `"Bihar and Jharkhand"', add
label define dhs_ipumsi_in_lbl 11 `"Sikkim"', add
label define dhs_ipumsi_in_lbl 12 `"Arunachal Pradesh"', add
label define dhs_ipumsi_in_lbl 13 `"Nagaland"', add
label define dhs_ipumsi_in_lbl 14 `"Manipur"', add
label define dhs_ipumsi_in_lbl 15 `"Mizoram"', add
label define dhs_ipumsi_in_lbl 16 `"Tripura"', add
label define dhs_ipumsi_in_lbl 17 `"Meghalaya"', add
label define dhs_ipumsi_in_lbl 18 `"Assam"', add
label define dhs_ipumsi_in_lbl 19 `"West Bengal"', add
label define dhs_ipumsi_in_lbl 21 `"Orissa"', add
label define dhs_ipumsi_in_lbl 23 `"Madhya Pradesh and Chhattisgarh"', add
label define dhs_ipumsi_in_lbl 24 `"Gujarat"', add
label define dhs_ipumsi_in_lbl 27 `"Maharashtra"', add
label define dhs_ipumsi_in_lbl 28 `"Andhra Pradesh and Telangana"', add
label define dhs_ipumsi_in_lbl 29 `"Karnataka"', add
label define dhs_ipumsi_in_lbl 30 `"Goa, Daman and Diu"', add
label define dhs_ipumsi_in_lbl 32 `"Kerala"', add
label define dhs_ipumsi_in_lbl 33 `"Tamil Nadu"', add
label define dhs_ipumsi_in_lbl 41 `"Andaman and Nicobar Islands"', add
label define dhs_ipumsi_in_lbl 42 `"Chandigarh"', add
label define dhs_ipumsi_in_lbl 43 `"Dadra and Nagar Haveli"', add
label define dhs_ipumsi_in_lbl 44 `"Lakshadweep"', add
label define dhs_ipumsi_in_lbl 45 `"Pondicherry"', add
label values dhs_ipumsi_in dhs_ipumsi_in_lbl

label define relate_lbl 1 `"Head"'
label define relate_lbl 2 `"Spouse/partner"', add
label define relate_lbl 3 `"Child"', add
label define relate_lbl 4 `"Other relative"', add
label define relate_lbl 5 `"Non-relative"', add
label define relate_lbl 6 `"Other relative or non-relative"', add
label define relate_lbl 9 `"Unknown"', add
label values relate relate_lbl

label define related_lbl 1000 `"Head"'
label define related_lbl 2000 `"Spouse/partner"', add
label define related_lbl 2100 `"Spouse"', add
label define related_lbl 2200 `"Unmarried partner"', add
label define related_lbl 2300 `"Same-sex spouse/partner"', add
label define related_lbl 3000 `"Child"', add
label define related_lbl 3100 `"Biological child"', add
label define related_lbl 3200 `"Adopted child"', add
label define related_lbl 3300 `"Stepchild"', add
label define related_lbl 3400 `"Child/child-in-law"', add
label define related_lbl 3500 `"Child/child-in-law/grandchild"', add
label define related_lbl 3600 `"Child of unmarried partner"', add
label define related_lbl 4000 `"Other relative"', add
label define related_lbl 4100 `"Grandchild"', add
label define related_lbl 4110 `"Grandchild or great grandchild"', add
label define related_lbl 4120 `"Great grandchild"', add
label define related_lbl 4130 `"Great-great grandchild"', add
label define related_lbl 4200 `"Parent/parent-in-law"', add
label define related_lbl 4210 `"Parent"', add
label define related_lbl 4211 `"Stepparent"', add
label define related_lbl 4220 `"Parent-in-law"', add
label define related_lbl 4300 `"Child-in-law"', add
label define related_lbl 4301 `"Daughter-in-law"', add
label define related_lbl 4302 `"Spouse/partner of child"', add
label define related_lbl 4310 `"Unmarried partner of child"', add
label define related_lbl 4400 `"Sibling/sibling-in-law"', add
label define related_lbl 4410 `"Sibling"', add
label define related_lbl 4420 `"Stepsibling"', add
label define related_lbl 4430 `"Sibling-in-law"', add
label define related_lbl 4431 `"Sibling of spouse/partner"', add
label define related_lbl 4432 `"Spouse/partner of sibling"', add
label define related_lbl 4500 `"Grandparent"', add
label define related_lbl 4510 `"Great grandparent"', add
label define related_lbl 4600 `"Parent/grandparent/ascendant"', add
label define related_lbl 4700 `"Aunt/uncle"', add
label define related_lbl 4800 `"Other specified relative"', add
label define related_lbl 4810 `"Nephew/niece"', add
label define related_lbl 4820 `"Cousin"', add
label define related_lbl 4830 `"Sibling of sibling-in-law"', add
label define related_lbl 4900 `"Other relative, not elsewhere classified"', add
label define related_lbl 4910 `"Other relative with same family name"', add
label define related_lbl 4920 `"Other relative with different family name"', add
label define related_lbl 4930 `"Other relative, not specified (secondary family)"', add
label define related_lbl 5000 `"Non-relative"', add
label define related_lbl 5100 `"Friend/guest/visitor/partner"', add
label define related_lbl 5110 `"Partner/friend"', add
label define related_lbl 5111 `"Friend"', add
label define related_lbl 5112 `"Partner/roommate"', add
label define related_lbl 5113 `"Housemate/roommate"', add
label define related_lbl 5120 `"Visitor"', add
label define related_lbl 5130 `"Ex-spouse"', add
label define related_lbl 5140 `"Godparent"', add
label define related_lbl 5150 `"Godchild"', add
label define related_lbl 5200 `"Employee"', add
label define related_lbl 5210 `"Domestic employee"', add
label define related_lbl 5220 `"Relative of employee, n.s."', add
label define related_lbl 5221 `"Spouse of servant"', add
label define related_lbl 5222 `"Child of servant"', add
label define related_lbl 5223 `"Other relative of servant"', add
label define related_lbl 5300 `"Roomer/boarder/lodger/foster child"', add
label define related_lbl 5310 `"Boarder"', add
label define related_lbl 5311 `"Boarder or guest"', add
label define related_lbl 5320 `"Lodger"', add
label define related_lbl 5330 `"Foster child"', add
label define related_lbl 5340 `"Tutored/foster child"', add
label define related_lbl 5350 `"Tutored child"', add
label define related_lbl 5400 `"Employee, boarder or guest"', add
label define related_lbl 5500 `"Other specified non-relative"', add
label define related_lbl 5510 `"Agregado"', add
label define related_lbl 5520 `"Temporary resident, guest"', add
label define related_lbl 5600 `"Group quarters"', add
label define related_lbl 5610 `"Group quarters, non-inmates"', add
label define related_lbl 5620 `"Institutional inmates"', add
label define related_lbl 5900 `"Non-relative, n.e.c."', add
label define related_lbl 6000 `"Other relative or non-relative"', add
label define related_lbl 9999 `"Unknown"', add
label values related related_lbl

label define age_lbl 000 `"Less than 1 year"'
label define age_lbl 001 `"1 year"', add
label define age_lbl 002 `"2 years"', add
label define age_lbl 003 `"3"', add
label define age_lbl 004 `"4"', add
label define age_lbl 005 `"5"', add
label define age_lbl 006 `"6"', add
label define age_lbl 007 `"7"', add
label define age_lbl 008 `"8"', add
label define age_lbl 009 `"9"', add
label define age_lbl 010 `"10"', add
label define age_lbl 011 `"11"', add
label define age_lbl 012 `"12"', add
label define age_lbl 013 `"13"', add
label define age_lbl 014 `"14"', add
label define age_lbl 015 `"15"', add
label define age_lbl 016 `"16"', add
label define age_lbl 017 `"17"', add
label define age_lbl 018 `"18"', add
label define age_lbl 019 `"19"', add
label define age_lbl 020 `"20"', add
label define age_lbl 021 `"21"', add
label define age_lbl 022 `"22"', add
label define age_lbl 023 `"23"', add
label define age_lbl 024 `"24"', add
label define age_lbl 025 `"25"', add
label define age_lbl 026 `"26"', add
label define age_lbl 027 `"27"', add
label define age_lbl 028 `"28"', add
label define age_lbl 029 `"29"', add
label define age_lbl 030 `"30"', add
label define age_lbl 031 `"31"', add
label define age_lbl 032 `"32"', add
label define age_lbl 033 `"33"', add
label define age_lbl 034 `"34"', add
label define age_lbl 035 `"35"', add
label define age_lbl 036 `"36"', add
label define age_lbl 037 `"37"', add
label define age_lbl 038 `"38"', add
label define age_lbl 039 `"39"', add
label define age_lbl 040 `"40"', add
label define age_lbl 041 `"41"', add
label define age_lbl 042 `"42"', add
label define age_lbl 043 `"43"', add
label define age_lbl 044 `"44"', add
label define age_lbl 045 `"45"', add
label define age_lbl 046 `"46"', add
label define age_lbl 047 `"47"', add
label define age_lbl 048 `"48"', add
label define age_lbl 049 `"49"', add
label define age_lbl 050 `"50"', add
label define age_lbl 051 `"51"', add
label define age_lbl 052 `"52"', add
label define age_lbl 053 `"53"', add
label define age_lbl 054 `"54"', add
label define age_lbl 055 `"55"', add
label define age_lbl 056 `"56"', add
label define age_lbl 057 `"57"', add
label define age_lbl 058 `"58"', add
label define age_lbl 059 `"59"', add
label define age_lbl 060 `"60"', add
label define age_lbl 061 `"61"', add
label define age_lbl 062 `"62"', add
label define age_lbl 063 `"63"', add
label define age_lbl 064 `"64"', add
label define age_lbl 065 `"65"', add
label define age_lbl 066 `"66"', add
label define age_lbl 067 `"67"', add
label define age_lbl 068 `"68"', add
label define age_lbl 069 `"69"', add
label define age_lbl 070 `"70"', add
label define age_lbl 071 `"71"', add
label define age_lbl 072 `"72"', add
label define age_lbl 073 `"73"', add
label define age_lbl 074 `"74"', add
label define age_lbl 075 `"75"', add
label define age_lbl 076 `"76"', add
label define age_lbl 077 `"77"', add
label define age_lbl 078 `"78"', add
label define age_lbl 079 `"79"', add
label define age_lbl 080 `"80"', add
label define age_lbl 081 `"81"', add
label define age_lbl 082 `"82"', add
label define age_lbl 083 `"83"', add
label define age_lbl 084 `"84"', add
label define age_lbl 085 `"85"', add
label define age_lbl 086 `"86"', add
label define age_lbl 087 `"87"', add
label define age_lbl 088 `"88"', add
label define age_lbl 089 `"89"', add
label define age_lbl 090 `"90"', add
label define age_lbl 091 `"91"', add
label define age_lbl 092 `"92"', add
label define age_lbl 093 `"93"', add
label define age_lbl 094 `"94"', add
label define age_lbl 095 `"95"', add
label define age_lbl 096 `"96"', add
label define age_lbl 097 `"97"', add
label define age_lbl 098 `"98"', add
label define age_lbl 099 `"99"', add
label define age_lbl 100 `"100+"', add
label define age_lbl 999 `"Not reported/missing"', add
label values age age_lbl

label define sex_lbl 1 `"Male"'
label define sex_lbl 2 `"Female"', add
label define sex_lbl 9 `"Unknown"', add
label values sex sex_lbl

label define empstat_lbl 0 `"NIU (not in universe)"'
label define empstat_lbl 1 `"Employed"', add
label define empstat_lbl 2 `"Unemployed"', add
label define empstat_lbl 3 `"Inactive"', add
label define empstat_lbl 9 `"Unknown/missing"', add
label values empstat empstat_lbl

label define empstatd_lbl 000 `"NIU (not in universe)"'
label define empstatd_lbl 100 `"Employed, not specified"', add
label define empstatd_lbl 110 `"At work"', add
label define empstatd_lbl 111 `"At work, and 'student'"', add
label define empstatd_lbl 112 `"At work, and 'housework'"', add
label define empstatd_lbl 113 `"At work, and 'seeking work'"', add
label define empstatd_lbl 114 `"At work, and 'retired'"', add
label define empstatd_lbl 115 `"At work, and 'no work'"', add
label define empstatd_lbl 116 `"At work, and other situation"', add
label define empstatd_lbl 117 `"At work, family holding, not specified"', add
label define empstatd_lbl 118 `"At work, family holding, not agricultural"', add
label define empstatd_lbl 119 `"At work, family holding, agricultural"', add
label define empstatd_lbl 120 `"Have job, not at work in reference period"', add
label define empstatd_lbl 130 `"Armed forces"', add
label define empstatd_lbl 131 `"Armed forces, at work"', add
label define empstatd_lbl 132 `"Armed forces, not at work in reference period"', add
label define empstatd_lbl 133 `"Military trainee"', add
label define empstatd_lbl 140 `"Marginally employed"', add
label define empstatd_lbl 200 `"Unemployed, not specified"', add
label define empstatd_lbl 201 `"Unemployed 6 or more months"', add
label define empstatd_lbl 202 `"Worked fewer than 6 months, permanent job"', add
label define empstatd_lbl 203 `"Worked fewer than 6 months, temporary job"', add
label define empstatd_lbl 210 `"Unemployed, experienced worker"', add
label define empstatd_lbl 220 `"Unemployed, new worker"', add
label define empstatd_lbl 230 `"No work available"', add
label define empstatd_lbl 240 `"Inactive unemployed"', add
label define empstatd_lbl 300 `"Inactive (not in labor force)"', add
label define empstatd_lbl 310 `"Housework"', add
label define empstatd_lbl 320 `"Unable to work, disabled or health reasons"', add
label define empstatd_lbl 321 `"Permanent disability"', add
label define empstatd_lbl 322 `"Temporary illness"', add
label define empstatd_lbl 323 `"Disabled or imprisoned"', add
label define empstatd_lbl 330 `"In school"', add
label define empstatd_lbl 340 `"Retirees and living on rent"', add
label define empstatd_lbl 341 `"Living on rents"', add
label define empstatd_lbl 342 `"Living on rents or pension"', add
label define empstatd_lbl 343 `"Retirees/pensioners"', add
label define empstatd_lbl 344 `"Retired"', add
label define empstatd_lbl 345 `"Pensioner"', add
label define empstatd_lbl 346 `"Non-retirement pension"', add
label define empstatd_lbl 347 `"Disability pension"', add
label define empstatd_lbl 348 `"Retired without benefits"', add
label define empstatd_lbl 350 `"Elderly"', add
label define empstatd_lbl 351 `"Elderly or disabled"', add
label define empstatd_lbl 360 `"Institutionalized"', add
label define empstatd_lbl 361 `"Prisoner"', add
label define empstatd_lbl 370 `"Intermittent worker"', add
label define empstatd_lbl 371 `"Not working, seasonal worker"', add
label define empstatd_lbl 372 `"Not working, occasional worker"', add
label define empstatd_lbl 380 `"Other income recipient"', add
label define empstatd_lbl 390 `"Inactive, other reasons"', add
label define empstatd_lbl 391 `"Too young to work"', add
label define empstatd_lbl 392 `"Dependent"', add
label define empstatd_lbl 999 `"Unknown/missing"', add
label values empstatd empstatd_lbl

label define labforce_lbl 1 `"No, not in the labor force"'
label define labforce_lbl 2 `"Yes, in the labor force"', add
label define labforce_lbl 8 `"Unknown"', add
label define labforce_lbl 9 `"NIU (not in universe)"', add
label values labforce labforce_lbl

label define empsect_lbl 00 `"NIU (not in universe)"'
label define empsect_lbl 10 `"Public"', add
label define empsect_lbl 20 `"Private"', add
label define empsect_lbl 21 `"Private, not elsewhere classified"', add
label define empsect_lbl 22 `"Individual/family enterprise, and self-employed"', add
label define empsect_lbl 23 `"Foreign"', add
label define empsect_lbl 30 `"Mixed: public-private or parastatal"', add
label define empsect_lbl 40 `"Collective or cooperative"', add
label define empsect_lbl 50 `"Foreign government or non-governmental organization"', add
label define empsect_lbl 60 `"Other, unspecified"', add
label define empsect_lbl 61 `"Canal zone"', add
label define empsect_lbl 62 `"Faith-based organization"', add
label define empsect_lbl 99 `"Unknown"', add
label values empsect empsect_lbl

label define migratep_lbl 00 `"NIU (not in universe)"'
label define migratep_lbl 10 `"Same major administrative unit"', add
label define migratep_lbl 11 `"Same major, same minor administrative unit"', add
label define migratep_lbl 12 `"Same major, different minor administrative unit"', add
label define migratep_lbl 20 `"Different major administrative unit"', add
label define migratep_lbl 30 `"Abroad"', add
label define migratep_lbl 98 `"Response suppressed"', add
label define migratep_lbl 99 `"Not reported/missing"', add
label values migratep migratep_lbl

label define geomig1_p_lbl 051901 `"Yerevan [Province: Armenia]"'
label define geomig1_p_lbl 051902 `"Aragatsotn [Province: Armenia]"', add
label define geomig1_p_lbl 051903 `"Ararat [Province: Armenia]"', add
label define geomig1_p_lbl 051904 `"Armavir [Province: Armenia]"', add
label define geomig1_p_lbl 051905 `"Gegharkunik [Province: Armenia]"', add
label define geomig1_p_lbl 051906 `"Lori [Province: Armenia]"', add
label define geomig1_p_lbl 051907 `"Kotayk [Province: Armenia]"', add
label define geomig1_p_lbl 051908 `"Shirak [Province: Armenia]"', add
label define geomig1_p_lbl 051909 `"Syunik [Province: Armenia]"', add
label define geomig1_p_lbl 051910 `"Vayots Dzor [Province: Armenia]"', add
label define geomig1_p_lbl 051911 `"Tavush [Province: Armenia]"', add
label define geomig1_p_lbl 051912 `"Nagorno-Karabagh [Province: Armenia]"', add
label define geomig1_p_lbl 051997 `"Foreign country [Province: Armenia]"', add
label define geomig1_p_lbl 051998 `"Unknown [Province: Armenia]"', add
label define geomig1_p_lbl 051999 `"NIU (not in universe) [Province: Armenia]"', add
label define geomig1_p_lbl 076011 `"Rondônia [State: Brazil]"', add
label define geomig1_p_lbl 076012 `"Acre [State: Brazil]"', add
label define geomig1_p_lbl 076013 `"Amazonas [State: Brazil]"', add
label define geomig1_p_lbl 076014 `"Roraima [State: Brazil]"', add
label define geomig1_p_lbl 076015 `"Pará [State: Brazil]"', add
label define geomig1_p_lbl 076016 `"Amapá [State: Brazil]"', add
label define geomig1_p_lbl 076021 `"Maranhão [State: Brazil]"', add
label define geomig1_p_lbl 076022 `"Piauí [State: Brazil]"', add
label define geomig1_p_lbl 076023 `"Ceará [State: Brazil]"', add
label define geomig1_p_lbl 076024 `"Rio Grande do Norte [State: Brazil]"', add
label define geomig1_p_lbl 076025 `"Paraíba [State: Brazil]"', add
label define geomig1_p_lbl 076026 `"Pernambuco, Arquipelago de Fernando de Noronha [State: Brazil]"', add
label define geomig1_p_lbl 076027 `"Alagoas [State: Brazil]"', add
label define geomig1_p_lbl 076028 `"Sergipe [State: Brazil]"', add
label define geomig1_p_lbl 076029 `"Bahia [State: Brazil]"', add
label define geomig1_p_lbl 076031 `"Minas Gerais [State: Brazil]"', add
label define geomig1_p_lbl 076032 `"Espírito Santo [State: Brazil]"', add
label define geomig1_p_lbl 076033 `"Rio de Janeiro, Guanabara [State: Brazil]"', add
label define geomig1_p_lbl 076035 `"São Paulo [State: Brazil]"', add
label define geomig1_p_lbl 076041 `"Paraná [State: Brazil]"', add
label define geomig1_p_lbl 076042 `"Santa Catarina [State: Brazil]"', add
label define geomig1_p_lbl 076043 `"Rio Grande do Sul [State: Brazil]"', add
label define geomig1_p_lbl 076051 `"Mato Grosso do Sul, Mato Grosso [State: Brazil]"', add
label define geomig1_p_lbl 076052 `"Goiás, Tocantins [State: Brazil]"', add
label define geomig1_p_lbl 076053 `"Distrito Federal [State: Brazil]"', add
label define geomig1_p_lbl 076054 `"Brazil, unspecified [State: Brazil]"', add
label define geomig1_p_lbl 076097 `"Abroad [State: Brazil]"', add
label define geomig1_p_lbl 076098 `"Unknown [State: Brazil]"', add
label define geomig1_p_lbl 076099 `"NIU (not in universe) [State: Brazil]"', add
label define geomig1_p_lbl 112001 `"Brest [Region: Belarus]"', add
label define geomig1_p_lbl 112002 `"Vitebsk [Region: Belarus]"', add
label define geomig1_p_lbl 112003 `"Gomel [Region: Belarus]"', add
label define geomig1_p_lbl 112004 `"Grodno [Region: Belarus]"', add
label define geomig1_p_lbl 112006 `"Minsk, Minsk City [Region: Belarus]"', add
label define geomig1_p_lbl 112007 `"Mogilev [Region: Belarus]"', add
label define geomig1_p_lbl 112097 `"Foreign country [Region: Belarus]"', add
label define geomig1_p_lbl 112098 `"Unknown [Region: Belarus]"', add
label define geomig1_p_lbl 112099 `"NIU (not in universe) [Region: Belarus]"', add
label define geomig1_p_lbl 116001 `"Banteay Meanchey [Province: Cambodia]"', add
label define geomig1_p_lbl 116002 `"Battambang [Province: Cambodia]"', add
label define geomig1_p_lbl 116003 `"Kampong Cham [Province: Cambodia]"', add
label define geomig1_p_lbl 116004 `"Kampong Chhnang [Province: Cambodia]"', add
label define geomig1_p_lbl 116005 `"Kampong Speu [Province: Cambodia]"', add
label define geomig1_p_lbl 116006 `"Kampong Thom [Province: Cambodia]"', add
label define geomig1_p_lbl 116007 `"Kampot [Province: Cambodia]"', add
label define geomig1_p_lbl 116010 `"Kratie [Province: Cambodia]"', add
label define geomig1_p_lbl 116011 `"Mondul Kiri [Province: Cambodia]"', add
label define geomig1_p_lbl 116012 `"Phnom Penh, Kandal [Province: Cambodia]"', add
label define geomig1_p_lbl 116013 `"Preah Vihear [Province: Cambodia]"', add
label define geomig1_p_lbl 116014 `"Prey Veng [Province: Cambodia]"', add
label define geomig1_p_lbl 116015 `"Pursat [Province: Cambodia]"', add
label define geomig1_p_lbl 116016 `"Rotanak Kiri [Province: Cambodia]"', add
label define geomig1_p_lbl 116017 `"Siem Reap, Otdar Meanchey [Province: Cambodia]"', add
label define geomig1_p_lbl 116018 `"Preah Sihanouk, Koh Kong [Province: Cambodia]"', add
label define geomig1_p_lbl 116019 `"Stung Treng [Province: Cambodia]"', add
label define geomig1_p_lbl 116020 `"Svay Rieng [Province: Cambodia]"', add
label define geomig1_p_lbl 116021 `"Takeo [Province: Cambodia]"', add
label define geomig1_p_lbl 116023 `"Kep [Province: Cambodia]"', add
label define geomig1_p_lbl 116024 `"Pailin [Province: Cambodia]"', add
label define geomig1_p_lbl 116097 `"Foreign country [Province: Cambodia]"', add
label define geomig1_p_lbl 116098 `"Unknown [Province: Cambodia]"', add
label define geomig1_p_lbl 116099 `"NIU (not in universe) [Province: Cambodia]"', add
label define geomig1_p_lbl 120002 `"Centre, Sud [Province: Cameroon]"', add
label define geomig1_p_lbl 120003 `"Est [Province: Cameroon]"', add
label define geomig1_p_lbl 120004 `"Nord,  Adamoua , Extrème Nord [Province: Cameroon]"', add
label define geomig1_p_lbl 120005 `"Littoral [Province: Cameroon]"', add
label define geomig1_p_lbl 120007 `"Nord Ouest [Province: Cameroon]"', add
label define geomig1_p_lbl 120008 `"Ouest [Province: Cameroon]"', add
label define geomig1_p_lbl 120010 `"Sud Ouest [Province: Cameroon]"', add
label define geomig1_p_lbl 120096 `"Cameroon - unknown arrondissement [Province: Cameroon]"', add
label define geomig1_p_lbl 120097 `"Foreign country [Province: Cameroon]"', add
label define geomig1_p_lbl 120098 `"Unknown [Province: Cameroon]"', add
label define geomig1_p_lbl 120099 `"NIU (not in universe) [Province: Cameroon]"', add
label define geomig1_p_lbl 152001 `"Tarapaca [Province: Chile]"', add
label define geomig1_p_lbl 152002 `"Antofagasta [Province: Chile]"', add
label define geomig1_p_lbl 152003 `"Atacama [Province: Chile]"', add
label define geomig1_p_lbl 152004 `"Coquimbo [Province: Chile]"', add
label define geomig1_p_lbl 152005 `"Aconcagua [Province: Chile]"', add
label define geomig1_p_lbl 152006 `"Valparaíso [Province: Chile]"', add
label define geomig1_p_lbl 152007 `"Santiago [Province: Chile]"', add
label define geomig1_p_lbl 152008 `"O'Higgins [Province: Chile]"', add
label define geomig1_p_lbl 152009 `"Colchagua [Province: Chile]"', add
label define geomig1_p_lbl 152010 `"Curicó [Province: Chile]"', add
label define geomig1_p_lbl 152011 `"Talca [Province: Chile]"', add
label define geomig1_p_lbl 152012 `"Maule [Province: Chile]"', add
label define geomig1_p_lbl 152013 `"Linares [Province: Chile]"', add
label define geomig1_p_lbl 152014 `"Ñuble [Province: Chile]"', add
label define geomig1_p_lbl 152015 `"Concepción [Province: Chile]"', add
label define geomig1_p_lbl 152016 `"Arauco [Province: Chile]"', add
label define geomig1_p_lbl 152017 `"Bío Bío [Province: Chile]"', add
label define geomig1_p_lbl 152018 `"Malleco [Province: Chile]"', add
label define geomig1_p_lbl 152019 `"Cautín [Province: Chile]"', add
label define geomig1_p_lbl 152020 `"Valdivia [Province: Chile]"', add
label define geomig1_p_lbl 152021 `"Osorno [Province: Chile]"', add
label define geomig1_p_lbl 152022 `"Llanquihue [Province: Chile]"', add
label define geomig1_p_lbl 152023 `"Chiloé [Province: Chile]"', add
label define geomig1_p_lbl 152024 `"Aysén [Province: Chile]"', add
label define geomig1_p_lbl 152025 `"Magallanes [Province: Chile]"', add
label define geomig1_p_lbl 152097 `"Foreign country [Province: Chile]"', add
label define geomig1_p_lbl 152098 `"Unknown [Province: Chile]"', add
label define geomig1_p_lbl 152099 `"NIU (not in universe) [Province: Chile]"', add
label define geomig1_p_lbl 170005 `"Antioquia [Department: Colombia]"', add
label define geomig1_p_lbl 170008 `"Atlántico [Department: Colombia]"', add
label define geomig1_p_lbl 170011 `"Bogotá, Cundinamarca [Department: Colombia]"', add
label define geomig1_p_lbl 170013 `"Bolívar, Sucre [Department: Colombia]"', add
label define geomig1_p_lbl 170015 `"Boyacá, Casanare [Department: Colombia]"', add
label define geomig1_p_lbl 170018 `"Caquetá [Department: Colombia]"', add
label define geomig1_p_lbl 170019 `"Cauca [Department: Colombia]"', add
label define geomig1_p_lbl 170023 `"Córdoba [Department: Colombia]"', add
label define geomig1_p_lbl 170027 `"Chocó [Department: Colombia]"', add
label define geomig1_p_lbl 170041 `"Huila [Department: Colombia]"', add
label define geomig1_p_lbl 170044 `"La Guajira [Department: Colombia]"', add
label define geomig1_p_lbl 170050 `"Meta [Department: Colombia]"', add
label define geomig1_p_lbl 170052 `"Nariño [Department: Colombia]"', add
label define geomig1_p_lbl 170054 `"Cesar, Norte De Santander, Magdalena [Department: Colombia]"', add
label define geomig1_p_lbl 170066 `"Caldas, Quindío, Risaralda [Department: Colombia]"', add
label define geomig1_p_lbl 170068 `"Santander [Department: Colombia]"', add
label define geomig1_p_lbl 170073 `"Tolima [Department: Colombia]"', add
label define geomig1_p_lbl 170076 `"Valle Del Cauca [Department: Colombia]"', add
label define geomig1_p_lbl 170081 `"Arauca [Department: Colombia]"', add
label define geomig1_p_lbl 170086 `"Putumayo [Department: Colombia]"', add
label define geomig1_p_lbl 170088 `"San Andrés [Department: Colombia]"', add
label define geomig1_p_lbl 170095 `"Amazonas, Guaviare, Vaupés, Vichada, Guainía [Department: Colombia]"', add
label define geomig1_p_lbl 170097 `"Abroad [Department: Colombia]"', add
label define geomig1_p_lbl 170098 `"Unknown [Department: Colombia]"', add
label define geomig1_p_lbl 188001 `"San José [Province: Costa Rica]"', add
label define geomig1_p_lbl 188002 `"Alajuela [Province: Costa Rica]"', add
label define geomig1_p_lbl 188003 `"Cartago [Province: Costa Rica]"', add
label define geomig1_p_lbl 188004 `"Heredia [Province: Costa Rica]"', add
label define geomig1_p_lbl 188005 `"Guanacaste [Province: Costa Rica]"', add
label define geomig1_p_lbl 188006 `"Puntarenas [Province: Costa Rica]"', add
label define geomig1_p_lbl 188007 `"Limón [Province: Costa Rica]"', add
label define geomig1_p_lbl 188097 `"Foreign country [Province: Costa Rica]"', add
label define geomig1_p_lbl 188098 `"Unknown [Province: Costa Rica]"', add
label define geomig1_p_lbl 192001 `"Pinar del Rio [Province: Cuba]"', add
label define geomig1_p_lbl 192002 `"La Habana [Province: Cuba]"', add
label define geomig1_p_lbl 192003 `"Ciudad Habana [Province: Cuba]"', add
label define geomig1_p_lbl 192004 `"Matanzas [Province: Cuba]"', add
label define geomig1_p_lbl 192005 `"Villa Clara [Province: Cuba]"', add
label define geomig1_p_lbl 192006 `"Cienfuegos [Province: Cuba]"', add
label define geomig1_p_lbl 192007 `"Sancti Spiritus [Province: Cuba]"', add
label define geomig1_p_lbl 192008 `"Ciego Avila [Province: Cuba]"', add
label define geomig1_p_lbl 192009 `"Camaguey [Province: Cuba]"', add
label define geomig1_p_lbl 192010 `"Las Tunas [Province: Cuba]"', add
label define geomig1_p_lbl 192011 `"Holguin [Province: Cuba]"', add
label define geomig1_p_lbl 192012 `"Granma [Province: Cuba]"', add
label define geomig1_p_lbl 192013 `"Santiago de Cuba [Province: Cuba]"', add
label define geomig1_p_lbl 192014 `"Guantanamo [Province: Cuba]"', add
label define geomig1_p_lbl 192099 `"Isla de la Juventud [Province: Cuba]"', add
label define geomig1_p_lbl 192997 `"Abroad [Province: Cuba]"', add
label define geomig1_p_lbl 192998 `"Unknown [Province: Cuba]"', add
label define geomig1_p_lbl 192999 `"NIU (not in universe) [Province: Cuba]"', add
label define geomig1_p_lbl 204001 `"Alibori [Department: Benin]"', add
label define geomig1_p_lbl 204002 `"Atacora [Department: Benin]"', add
label define geomig1_p_lbl 204003 `"Atlantique [Department: Benin]"', add
label define geomig1_p_lbl 204004 `"Borgou [Department: Benin]"', add
label define geomig1_p_lbl 204005 `"Collines [Department: Benin]"', add
label define geomig1_p_lbl 204006 `"Couffo [Department: Benin]"', add
label define geomig1_p_lbl 204007 `"Donga [Department: Benin]"', add
label define geomig1_p_lbl 204008 `"Littoral [Department: Benin]"', add
label define geomig1_p_lbl 204009 `"Mono [Department: Benin]"', add
label define geomig1_p_lbl 204010 `"Oueme [Department: Benin]"', add
label define geomig1_p_lbl 204011 `"Plateau [Department: Benin]"', add
label define geomig1_p_lbl 204012 `"Zou [Department: Benin]"', add
label define geomig1_p_lbl 204097 `"Abroad [Department: Benin]"', add
label define geomig1_p_lbl 204098 `"Unknown [Department: Benin]"', add
label define geomig1_p_lbl 204099 `"NIU (not in universe) [Department: Benin]"', add
label define geomig1_p_lbl 218001 `"Azuay [Province: Ecuador]"', add
label define geomig1_p_lbl 218002 `"Bolívar [Province: Ecuador]"', add
label define geomig1_p_lbl 218004 `"Carchi [Province: Ecuador]"', add
label define geomig1_p_lbl 218005 `"Cotopaxi [Province: Ecuador]"', add
label define geomig1_p_lbl 218006 `"Chimborazo [Province: Ecuador]"', add
label define geomig1_p_lbl 218007 `"El Oro [Province: Ecuador]"', add
label define geomig1_p_lbl 218009 `"Cañar, Esmeraldas, Guayas, Manabí, Manga del Cura [Disputed canton], Pichincha, El Piedrero [Disputed canton], Los Ríos, Santa Elena, Santo Domingo de las Tsáchilas, Galápagos [Province: Ecuador]"', add
label define geomig1_p_lbl 218010 `"Imbabura, Las Golondrinas [Disputed canton] [Province: Ecuador]"', add
label define geomig1_p_lbl 218011 `"Loja [Province: Ecuador]"', add
label define geomig1_p_lbl 218014 `"Morona Santiago [Province: Ecuador]"', add
label define geomig1_p_lbl 218016 `"Pastaza [Province: Ecuador]"', add
label define geomig1_p_lbl 218018 `"Tungurahua [Province: Ecuador]"', add
label define geomig1_p_lbl 218019 `"Zamora Chinchipe [Province: Ecuador]"', add
label define geomig1_p_lbl 218021 `"Napo, Orellana, Sucumbíos [Province: Ecuador]"', add
label define geomig1_p_lbl 218097 `"Foreign country [Province: Ecuador]"', add
label define geomig1_p_lbl 218098 `"Unknown and Disputed Zones [Province: Ecuador]"', add
label define geomig1_p_lbl 218099 `"NIU (not in universe) [Province: Ecuador]"', add
label define geomig1_p_lbl 222001 `"Ahuachapán [Department: El Salvador]"', add
label define geomig1_p_lbl 222002 `"Santa Ana [Department: El Salvador]"', add
label define geomig1_p_lbl 222003 `"Sonsonate [Department: El Salvador]"', add
label define geomig1_p_lbl 222004 `"Chalatenango [Department: El Salvador]"', add
label define geomig1_p_lbl 222005 `"La Libertad [Department: El Salvador]"', add
label define geomig1_p_lbl 222006 `"San Salvador [Department: El Salvador]"', add
label define geomig1_p_lbl 222007 `"Cuscatlán [Department: El Salvador]"', add
label define geomig1_p_lbl 222008 `"La Paz [Department: El Salvador]"', add
label define geomig1_p_lbl 222009 `"Cabañas [Department: El Salvador]"', add
label define geomig1_p_lbl 222010 `"San Vicente [Department: El Salvador]"', add
label define geomig1_p_lbl 222011 `"Usulután [Department: El Salvador]"', add
label define geomig1_p_lbl 222012 `"San Miguel [Department: El Salvador]"', add
label define geomig1_p_lbl 222013 `"Morazán [Department: El Salvador]"', add
label define geomig1_p_lbl 222014 `"La Unión [Department: El Salvador]"', add
label define geomig1_p_lbl 222098 `"Abroad [Department: El Salvador]"', add
label define geomig1_p_lbl 222099 `"NIU (not in universe) [Department: El Salvador]"', add
label define geomig1_p_lbl 250001 `"Guadeloupe [Region: France]"', add
label define geomig1_p_lbl 250002 `"Martinique [Region: France]"', add
label define geomig1_p_lbl 250003 `"French Guyana [Region: France]"', add
label define geomig1_p_lbl 250004 `"Réunion Island [Region: France]"', add
label define geomig1_p_lbl 250011 `"Île-de-France [Region: France]"', add
label define geomig1_p_lbl 250021 `"Champagne-Ardenne [Region: France]"', add
label define geomig1_p_lbl 250022 `"Picardy [Region: France]"', add
label define geomig1_p_lbl 250023 `"Upper Normandy [Region: France]"', add
label define geomig1_p_lbl 250024 `"Centre [Region: France]"', add
label define geomig1_p_lbl 250025 `"Lower Normandy [Region: France]"', add
label define geomig1_p_lbl 250026 `"Burgundy [Region: France]"', add
label define geomig1_p_lbl 250031 `"North Pas-de-Calais [Region: France]"', add
label define geomig1_p_lbl 250041 `"Lorraine [Region: France]"', add
label define geomig1_p_lbl 250042 `"Alsace [Region: France]"', add
label define geomig1_p_lbl 250043 `"Franche-Comté [Region: France]"', add
label define geomig1_p_lbl 250052 `"Loire Valley [Region: France]"', add
label define geomig1_p_lbl 250053 `"Brittany [Region: France]"', add
label define geomig1_p_lbl 250054 `"Poitou-Charentes [Region: France]"', add
label define geomig1_p_lbl 250072 `"Aquitaine [Region: France]"', add
label define geomig1_p_lbl 250073 `"Midi-Pyrénées [Region: France]"', add
label define geomig1_p_lbl 250074 `"Limousin [Region: France]"', add
label define geomig1_p_lbl 250082 `"Rhône-Alpes [Region: France]"', add
label define geomig1_p_lbl 250083 `"Auvergne [Region: France]"', add
label define geomig1_p_lbl 250091 `"Languedoc-Roussillon [Region: France]"', add
label define geomig1_p_lbl 250093 `"Provence-Alpes-Riviera [Region: France]"', add
label define geomig1_p_lbl 250094 `"Corsica [Region: France]"', add
label define geomig1_p_lbl 250097 `"Abroad [Region: France]"', add
label define geomig1_p_lbl 320001 `"Guatemala [Department: Guatemala]"', add
label define geomig1_p_lbl 320002 `"El Progreso [Department: Guatemala]"', add
label define geomig1_p_lbl 320003 `"Sacatepéquez [Department: Guatemala]"', add
label define geomig1_p_lbl 320004 `"Chimaltenango [Department: Guatemala]"', add
label define geomig1_p_lbl 320005 `"Escuintla [Department: Guatemala]"', add
label define geomig1_p_lbl 320006 `"Santa Rosa [Department: Guatemala]"', add
label define geomig1_p_lbl 320007 `"Sololá [Department: Guatemala]"', add
label define geomig1_p_lbl 320008 `"Totonicapán [Department: Guatemala]"', add
label define geomig1_p_lbl 320009 `"Quetzaltenango [Department: Guatemala]"', add
label define geomig1_p_lbl 320010 `"Suchitepéquez [Department: Guatemala]"', add
label define geomig1_p_lbl 320011 `"Retalhuleu [Department: Guatemala]"', add
label define geomig1_p_lbl 320012 `"San Marcos [Department: Guatemala]"', add
label define geomig1_p_lbl 320013 `"Huehuetenango [Department: Guatemala]"', add
label define geomig1_p_lbl 320014 `"Quiché [Department: Guatemala]"', add
label define geomig1_p_lbl 320015 `"Baja Verapaz [Department: Guatemala]"', add
label define geomig1_p_lbl 320016 `"Alta Verapaz [Department: Guatemala]"', add
label define geomig1_p_lbl 320017 `"Petén [Department: Guatemala]"', add
label define geomig1_p_lbl 320018 `"Izabal [Department: Guatemala]"', add
label define geomig1_p_lbl 320019 `"Zacapa [Department: Guatemala]"', add
label define geomig1_p_lbl 320020 `"Chiquimula [Department: Guatemala]"', add
label define geomig1_p_lbl 320021 `"Jalapa [Department: Guatemala]"', add
label define geomig1_p_lbl 320022 `"Jutiapa [Department: Guatemala]"', add
label define geomig1_p_lbl 320097 `"Foreign Country [Department: Guatemala]"', add
label define geomig1_p_lbl 320098 `"Unknown [Department: Guatemala]"', add
label define geomig1_p_lbl 320099 `"NIU [Department: Guatemala]"', add
label define geomig1_p_lbl 324010 `"Boffa [Region: Guinea]"', add
label define geomig1_p_lbl 324011 `"Boké [Region: Guinea]"', add
label define geomig1_p_lbl 324012 `"Conakry [Region: Guinea]"', add
label define geomig1_p_lbl 324014 `"Coyah, Dubréka [Region: Guinea]"', add
label define geomig1_p_lbl 324015 `"Forécariah [Region: Guinea]"', add
label define geomig1_p_lbl 324016 `"Fria [Region: Guinea]"', add
label define geomig1_p_lbl 324017 `"Kindia [Region: Guinea]"', add
label define geomig1_p_lbl 324018 `"Télimélé [Region: Guinea]"', add
label define geomig1_p_lbl 324020 `"Dalaba [Region: Guinea]"', add
label define geomig1_p_lbl 324021 `"Gaoual [Region: Guinea]"', add
label define geomig1_p_lbl 324022 `"Koubia [Region: Guinea]"', add
label define geomig1_p_lbl 324023 `"Koundara [Region: Guinea]"', add
label define geomig1_p_lbl 324024 `"Labé [Region: Guinea]"', add
label define geomig1_p_lbl 324025 `"Lélouma [Region: Guinea]"', add
label define geomig1_p_lbl 324026 `"Mali [Region: Guinea]"', add
label define geomig1_p_lbl 324027 `"Mamou [Region: Guinea]"', add
label define geomig1_p_lbl 324028 `"Mamou [Region: Guinea]"', add
label define geomig1_p_lbl 324029 `"Tougué [Region: Guinea]"', add
label define geomig1_p_lbl 324030 `"Dabola [Region: Guinea]"', add
label define geomig1_p_lbl 324031 `"Dinguiraye [Region: Guinea]"', add
label define geomig1_p_lbl 324032 `"Faranah [Region: Guinea]"', add
label define geomig1_p_lbl 324033 `"Kankan [Region: Guinea]"', add
label define geomig1_p_lbl 324034 `"Kérouané [Region: Guinea]"', add
label define geomig1_p_lbl 324035 `"Kouroussa [Region: Guinea]"', add
label define geomig1_p_lbl 324036 `"Mandiana [Region: Guinea]"', add
label define geomig1_p_lbl 324037 `"Siguiri [Region: Guinea]"', add
label define geomig1_p_lbl 324040 `"Beyla [Region: Guinea]"', add
label define geomig1_p_lbl 324041 `"Guéckédou [Region: Guinea]"', add
label define geomig1_p_lbl 324042 `"Kissidougou [Region: Guinea]"', add
label define geomig1_p_lbl 324043 `"Lola [Region: Guinea]"', add
label define geomig1_p_lbl 324044 `"Macenta [Region: Guinea]"', add
label define geomig1_p_lbl 324045 `"N'Zérékoré [Region: Guinea]"', add
label define geomig1_p_lbl 324046 `"Yomou [Region: Guinea]"', add
label define geomig1_p_lbl 324096 `"Guinea, place unknown [Region: Guinea]"', add
label define geomig1_p_lbl 324097 `"Foreign country [Region: Guinea]"', add
label define geomig1_p_lbl 324098 `"Unknown [Region: Guinea]"', add
label define geomig1_p_lbl 324099 `"NIU (not in universe) [Region: Guinea]"', add
label define geomig1_p_lbl 332003 `"Nord (North) and Nord'est (North East) [Department: Haiti]"', add
label define geomig1_p_lbl 332006 `"Centre (Central), L'Artibonite, Ouest (West), Sud'Est (South East) [Department: Haiti]"', add
label define geomig1_p_lbl 332007 `"Grand'Anse, Nippes, Sud (South) [Department: Haiti]"', add
label define geomig1_p_lbl 332009 `"Nord'Ouest (North West) [Department: Haiti]"', add
label define geomig1_p_lbl 332097 `"Foreign Country [Department: Haiti]"', add
label define geomig1_p_lbl 332098 `"Unknown [Department: Haiti]"', add
label define geomig1_p_lbl 356001 `"Jammu and Kashmir [State: India]"', add
label define geomig1_p_lbl 356002 `"Himachal Pradesh [State: India]"', add
label define geomig1_p_lbl 356003 `"Punjab [State: India]"', add
label define geomig1_p_lbl 356004 `"Chandigarh [State: India]"', add
label define geomig1_p_lbl 356006 `"Haryana [State: India]"', add
label define geomig1_p_lbl 356007 `"Delhi [State: India]"', add
label define geomig1_p_lbl 356008 `"Rajasthan [State: India]"', add
label define geomig1_p_lbl 356009 `"Uttar Pradesh, Uttaranchal [State: India]"', add
label define geomig1_p_lbl 356010 `"Bihar, Jharkhand [State: India]"', add
label define geomig1_p_lbl 356011 `"Sikkim [State: India]"', add
label define geomig1_p_lbl 356012 `"Arunachal Pradesh [State: India]"', add
label define geomig1_p_lbl 356013 `"Nagaland [State: India]"', add
label define geomig1_p_lbl 356014 `"Manipur [State: India]"', add
label define geomig1_p_lbl 356015 `"Mizoram [State: India]"', add
label define geomig1_p_lbl 356016 `"Tripura [State: India]"', add
label define geomig1_p_lbl 356017 `"Meghalaya [State: India]"', add
label define geomig1_p_lbl 356018 `"Assam [State: India]"', add
label define geomig1_p_lbl 356019 `"West Bengal [State: India]"', add
label define geomig1_p_lbl 356021 `"Orissa [State: India]"', add
label define geomig1_p_lbl 356023 `"Madhya Pradesh, Chhattisgarh [State: India]"', add
label define geomig1_p_lbl 356024 `"Gujarat [State: India]"', add
label define geomig1_p_lbl 356026 `"Dadra and Nagar Haveli [State: India]"', add
label define geomig1_p_lbl 356027 `"Maharashtra [State: India]"', add
label define geomig1_p_lbl 356028 `"Andhra Pradesh [State: India]"', add
label define geomig1_p_lbl 356029 `"Karnataka [State: India]"', add
label define geomig1_p_lbl 356030 `"Goa, Daman and Diu [State: India]"', add
label define geomig1_p_lbl 356031 `"Lakshadweep [State: India]"', add
label define geomig1_p_lbl 356032 `"Kerala [State: India]"', add
label define geomig1_p_lbl 356033 `"Tamil Nadu [State: India]"', add
label define geomig1_p_lbl 356034 `"Pondicherry [State: India]"', add
label define geomig1_p_lbl 356035 `"Andaman and Nicobar Islands [State: India]"', add
label define geomig1_p_lbl 356097 `"Abroad [State: India]"', add
label define geomig1_p_lbl 356098 `"Unknown [State: India]"', add
label define geomig1_p_lbl 356099 `"NIU (not in universe) [State: India]"', add
label define geomig1_p_lbl 360011 `"Nanggroe Aceh Darussalam [Province: Indonesia]"', add
label define geomig1_p_lbl 360012 `"Sumatera Utara [Province: Indonesia]"', add
label define geomig1_p_lbl 360013 `"Sumatera Barat [Province: Indonesia]"', add
label define geomig1_p_lbl 360014 `"Kepulauan Riau, Riau [Province: Indonesia]"', add
label define geomig1_p_lbl 360015 `"Jambi [Province: Indonesia]"', add
label define geomig1_p_lbl 360016 `"Bangka Belitung, Sumatera Selatan [Province: Indonesia]"', add
label define geomig1_p_lbl 360017 `"Bengkulu [Province: Indonesia]"', add
label define geomig1_p_lbl 360018 `"Lampung [Province: Indonesia]"', add
label define geomig1_p_lbl 360031 `"DKI Jakarta [Province: Indonesia]"', add
label define geomig1_p_lbl 360032 `"Banten, Jawa Barat [Province: Indonesia]"', add
label define geomig1_p_lbl 360033 `"Jawa Tengah [Province: Indonesia]"', add
label define geomig1_p_lbl 360034 `"DKI Yogyakarta [Province: Indonesia]"', add
label define geomig1_p_lbl 360035 `"Jawa Timur [Province: Indonesia]"', add
label define geomig1_p_lbl 360051 `"Bali [Province: Indonesia]"', add
label define geomig1_p_lbl 360052 `"Nusa Tenggara Barat [Province: Indonesia]"', add
label define geomig1_p_lbl 360053 `"Nusa Tenggara Timur [Province: Indonesia]"', add
label define geomig1_p_lbl 360061 `"Kalimantan Barat [Province: Indonesia]"', add
label define geomig1_p_lbl 360062 `"Kalimantan Tengah [Province: Indonesia]"', add
label define geomig1_p_lbl 360063 `"Kalimantan Selatan [Province: Indonesia]"', add
label define geomig1_p_lbl 360064 `"Kalimantan Timur [Province: Indonesia]"', add
label define geomig1_p_lbl 360071 `"Gorontalo, Sulawesi Utara [Province: Indonesia]"', add
label define geomig1_p_lbl 360072 `"Sulawesi Tengah [Province: Indonesia]"', add
label define geomig1_p_lbl 360073 `"Sulawesi Barat, Sulawesi Selatan [Province: Indonesia]"', add
label define geomig1_p_lbl 360074 `"Sulawesi Tenggara [Province: Indonesia]"', add
label define geomig1_p_lbl 360081 `"Maluku, Maluku Utara [Province: Indonesia]"', add
label define geomig1_p_lbl 360094 `"Papua, Papua Barat [Province: Indonesia]"', add
label define geomig1_p_lbl 360097 `"Abroad [Province: Indonesia]"', add
label define geomig1_p_lbl 360098 `"Unknown [Province: Indonesia]"', add
label define geomig1_p_lbl 360099 `"NIU (not in universe) [Province: Indonesia]"', add
label define geomig1_p_lbl 360626 `"East Timor [Province: Indonesia]"', add
label define geomig1_p_lbl 364000 `"Markazi [Province: Iran]"', add
label define geomig1_p_lbl 364001 `"Gilan [Province: Iran]"', add
label define geomig1_p_lbl 364002 `"Mazandaran [Province: Iran]"', add
label define geomig1_p_lbl 364003 `"East Azarbayejan [Province: Iran]"', add
label define geomig1_p_lbl 364004 `"West Azarbayejan [Province: Iran]"', add
label define geomig1_p_lbl 364005 `"Kermanshah [Province: Iran]"', add
label define geomig1_p_lbl 364006 `"Khuzestan [Province: Iran]"', add
label define geomig1_p_lbl 364007 `"Fars [Province: Iran]"', add
label define geomig1_p_lbl 364008 `"Kerman [Province: Iran]"', add
label define geomig1_p_lbl 364009 `"Razavi Khorasan [Province: Iran]"', add
label define geomig1_p_lbl 364010 `"Esfahan [Province: Iran]"', add
label define geomig1_p_lbl 364011 `"Sistan, Baluchestan [Province: Iran]"', add
label define geomig1_p_lbl 364012 `"Kordestan [Province: Iran]"', add
label define geomig1_p_lbl 364013 `"Hamedan [Province: Iran]"', add
label define geomig1_p_lbl 364014 `"Chaharmahal, Bakhtiyari [Province: Iran]"', add
label define geomig1_p_lbl 364015 `"Lorestan [Province: Iran]"', add
label define geomig1_p_lbl 364016 `"Ilam [Province: Iran]"', add
label define geomig1_p_lbl 364017 `"Kohgiluyeh, Boyerahmad [Province: Iran]"', add
label define geomig1_p_lbl 364018 `"Bushehr [Province: Iran]"', add
label define geomig1_p_lbl 364019 `"Zanjan [Province: Iran]"', add
label define geomig1_p_lbl 364020 `"Semnan [Province: Iran]"', add
label define geomig1_p_lbl 364021 `"Yazd [Province: Iran]"', add
label define geomig1_p_lbl 364022 `"Hormozgan [Province: Iran]"', add
label define geomig1_p_lbl 364023 `"Tehran, Alborz [Province: Iran]"', add
label define geomig1_p_lbl 364024 `"Ardebil [Province: Iran]"', add
label define geomig1_p_lbl 364025 `"Qom [Province: Iran]"', add
label define geomig1_p_lbl 364026 `"Qazvin [Province: Iran]"', add
label define geomig1_p_lbl 364027 `"Golestan [Province: Iran]"', add
label define geomig1_p_lbl 364028 `"North Khorasan [Province: Iran]"', add
label define geomig1_p_lbl 364029 `"South Khorasan [Province: Iran]"', add
label define geomig1_p_lbl 364098 `"Unknown [Province: Iran]"', add
label define geomig1_p_lbl 364099 `"NIU (not in universe) [Province: Iran]"', add
label define geomig1_p_lbl 368000 `"Always lived in residential place of birth [Governorate: Iraq]"', add
label define geomig1_p_lbl 368001 `"In this governorate [Governorate: Iraq]"', add
label define geomig1_p_lbl 368011 `"Dhok [Governorate: Iraq]"', add
label define geomig1_p_lbl 368012 `"Nineveh [Governorate: Iraq]"', add
label define geomig1_p_lbl 368013 `"Al-Sulaimaniya [Governorate: Iraq]"', add
label define geomig1_p_lbl 368014 `"Al-Tameem [Governorate: Iraq]"', add
label define geomig1_p_lbl 368015 `"Arbil [Governorate: Iraq]"', add
label define geomig1_p_lbl 368021 `"Diala [Governorate: Iraq]"', add
label define geomig1_p_lbl 368022 `"Al-Anbar [Governorate: Iraq]"', add
label define geomig1_p_lbl 368023 `"Baghdad [Governorate: Iraq]"', add
label define geomig1_p_lbl 368024 `"Babylon [Governorate: Iraq]"', add
label define geomig1_p_lbl 368025 `"Kerbela [Governorate: Iraq]"', add
label define geomig1_p_lbl 368026 `"Wasit [Governorate: Iraq]"', add
label define geomig1_p_lbl 368027 `"Salah Al-Deen [Governorate: Iraq]"', add
label define geomig1_p_lbl 368028 `"Al-Najaf [Governorate: Iraq]"', add
label define geomig1_p_lbl 368031 `"Al-Qadisiya [Governorate: Iraq]"', add
label define geomig1_p_lbl 368032 `"Al-Muthanna [Governorate: Iraq]"', add
label define geomig1_p_lbl 368033 `"Thi-Qar [Governorate: Iraq]"', add
label define geomig1_p_lbl 368034 `"Maysan [Governorate: Iraq]"', add
label define geomig1_p_lbl 368035 `"Al-Basrah [Governorate: Iraq]"', add
label define geomig1_p_lbl 368097 `"Other countries [Governorate: Iraq]"', add
label define geomig1_p_lbl 368098 `"Unknown [Governorate: Iraq]"', add
label define geomig1_p_lbl 388001 `"Kingston [Parish: Jamaica]"', add
label define geomig1_p_lbl 388002 `"Saint Andrew [Parish: Jamaica]"', add
label define geomig1_p_lbl 388003 `"Saint Thomas [Parish: Jamaica]"', add
label define geomig1_p_lbl 388004 `"Portland [Parish: Jamaica]"', add
label define geomig1_p_lbl 388005 `"Saint Mary [Parish: Jamaica]"', add
label define geomig1_p_lbl 388006 `"Saint Ann [Parish: Jamaica]"', add
label define geomig1_p_lbl 388007 `"Trelawny [Parish: Jamaica]"', add
label define geomig1_p_lbl 388008 `"Saint James [Parish: Jamaica]"', add
label define geomig1_p_lbl 388009 `"Hanover [Parish: Jamaica]"', add
label define geomig1_p_lbl 388010 `"Westmoreland [Parish: Jamaica]"', add
label define geomig1_p_lbl 388011 `"Saint Elizabeth [Parish: Jamaica]"', add
label define geomig1_p_lbl 388012 `"Manchester [Parish: Jamaica]"', add
label define geomig1_p_lbl 388013 `"Clarendon [Parish: Jamaica]"', add
label define geomig1_p_lbl 388014 `"Saint Catherine [Parish: Jamaica]"', add
label define geomig1_p_lbl 388098 `"Unknown [Parish: Jamaica]"', add
label define geomig1_p_lbl 388099 `"NIU (Not in universe) [Parish: Jamaica]"', add
label define geomig1_p_lbl 417001 `"Bishkek [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417002 `"Issyk-Kul region [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417003 `"Dzhalal-Abad region [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417004 `"Naryn region [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417005 `"Batken region [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417006 `"Oshskaya region, City of Osh [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417007 `"Talasskaya region [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417008 `"Chuya region [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417096 `"Other Kyrgyz Republic, not specified [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417097 `"Foreign country [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417098 `"Unknown [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 417099 `"NIU (not in universe) [Region: Kyrgyz Republic]"', add
label define geomig1_p_lbl 454101 `"Chitipa [District: Malawi]"', add
label define geomig1_p_lbl 454102 `"Karonga [District: Malawi]"', add
label define geomig1_p_lbl 454103 `"Nkhata Bay, Likoma [District: Malawi]"', add
label define geomig1_p_lbl 454104 `"Rumphi [District: Malawi]"', add
label define geomig1_p_lbl 454105 `"Mzimba, Mzuzu city [District: Malawi]"', add
label define geomig1_p_lbl 454201 `"Kasungu [District: Malawi]"', add
label define geomig1_p_lbl 454202 `"Nkhota Kota [District: Malawi]"', add
label define geomig1_p_lbl 454203 `"Ntchisi [District: Malawi]"', add
label define geomig1_p_lbl 454204 `"Dowa [District: Malawi]"', add
label define geomig1_p_lbl 454205 `"Salima [District: Malawi]"', add
label define geomig1_p_lbl 454206 `"Lilongwe, Lilongwe city [District: Malawi]"', add
label define geomig1_p_lbl 454207 `"Mchinji [District: Malawi]"', add
label define geomig1_p_lbl 454208 `"Dedza [District: Malawi]"', add
label define geomig1_p_lbl 454209 `"Ntcheu [District: Malawi]"', add
label define geomig1_p_lbl 454301 `"Mangochi [District: Malawi]"', add
label define geomig1_p_lbl 454302 `"Machinga [District: Malawi]"', add
label define geomig1_p_lbl 454303 `"Zomba, Zomba city [District: Malawi]"', add
label define geomig1_p_lbl 454304 `"Chiradzulu [District: Malawi]"', add
label define geomig1_p_lbl 454305 `"Blantyre, Blantyre city [District: Malawi]"', add
label define geomig1_p_lbl 454307 `"Thyolo [District: Malawi]"', add
label define geomig1_p_lbl 454308 `"Mulanje [District: Malawi]"', add
label define geomig1_p_lbl 454309 `"Phalombe [District: Malawi]"', add
label define geomig1_p_lbl 454310 `"Chikwawa [District: Malawi]"', add
label define geomig1_p_lbl 454311 `"Nsanje [District: Malawi]"', add
label define geomig1_p_lbl 454312 `"Balaka [District: Malawi]"', add
label define geomig1_p_lbl 454313 `"Mwanza, Neno [District: Malawi]"', add
label define geomig1_p_lbl 454997 `"Abroad [District: Malawi]"', add
label define geomig1_p_lbl 454999 `"NIU (not in universe) [District: Malawi]"', add
label define geomig1_p_lbl 466001 `"Kayes [Region: Mali]"', add
label define geomig1_p_lbl 466002 `"Koulikoro [Region: Mali]"', add
label define geomig1_p_lbl 466003 `"Sikasso [Region: Mali]"', add
label define geomig1_p_lbl 466004 `"Ségou [Region: Mali]"', add
label define geomig1_p_lbl 466005 `"Mopti [Region: Mali]"', add
label define geomig1_p_lbl 466006 `"Tombouctou [Region: Mali]"', add
label define geomig1_p_lbl 466007 `"Gao and Kidal [Region: Mali]"', add
label define geomig1_p_lbl 466009 `"Bamako [Region: Mali]"', add
label define geomig1_p_lbl 466096 `"Mali, province unspecified [Region: Mali]"', add
label define geomig1_p_lbl 466097 `"Foreign country [Region: Mali]"', add
label define geomig1_p_lbl 466098 `"Unknown [Region: Mali]"', add
label define geomig1_p_lbl 466099 `"NIU (not in universe) [Region: Mali]"', add
label define geomig1_p_lbl 484001 `"Aguascalientes [State: Mexico]"', add
label define geomig1_p_lbl 484002 `"Baja California [State: Mexico]"', add
label define geomig1_p_lbl 484003 `"Baja California Sur [State: Mexico]"', add
label define geomig1_p_lbl 484004 `"Campeche [State: Mexico]"', add
label define geomig1_p_lbl 484005 `"Coahuila de Zaragoza [State: Mexico]"', add
label define geomig1_p_lbl 484006 `"Colima [State: Mexico]"', add
label define geomig1_p_lbl 484007 `"Chiapas [State: Mexico]"', add
label define geomig1_p_lbl 484008 `"Chihuahua [State: Mexico]"', add
label define geomig1_p_lbl 484009 `"Distrito Federal [State: Mexico]"', add
label define geomig1_p_lbl 484010 `"Durango [State: Mexico]"', add
label define geomig1_p_lbl 484011 `"Guanajuato [State: Mexico]"', add
label define geomig1_p_lbl 484012 `"Guerrero [State: Mexico]"', add
label define geomig1_p_lbl 484013 `"Hidalgo [State: Mexico]"', add
label define geomig1_p_lbl 484014 `"Jalisco [State: Mexico]"', add
label define geomig1_p_lbl 484015 `"México [State: Mexico]"', add
label define geomig1_p_lbl 484016 `"Michoacán de Ocampo [State: Mexico]"', add
label define geomig1_p_lbl 484017 `"Morelos [State: Mexico]"', add
label define geomig1_p_lbl 484018 `"Nayarit [State: Mexico]"', add
label define geomig1_p_lbl 484019 `"Nuevo León [State: Mexico]"', add
label define geomig1_p_lbl 484020 `"Oaxaca [State: Mexico]"', add
label define geomig1_p_lbl 484021 `"Puebla [State: Mexico]"', add
label define geomig1_p_lbl 484022 `"Querétaro [State: Mexico]"', add
label define geomig1_p_lbl 484023 `"Quintana Roo [State: Mexico]"', add
label define geomig1_p_lbl 484024 `"San Luis Potosí [State: Mexico]"', add
label define geomig1_p_lbl 484025 `"Sinaloa [State: Mexico]"', add
label define geomig1_p_lbl 484026 `"Sonora [State: Mexico]"', add
label define geomig1_p_lbl 484027 `"Tabasco [State: Mexico]"', add
label define geomig1_p_lbl 484028 `"Tamaulipas [State: Mexico]"', add
label define geomig1_p_lbl 484029 `"Tlaxcala [State: Mexico]"', add
label define geomig1_p_lbl 484030 `"Veracruz de Ignacio de la Llave [State: Mexico]"', add
label define geomig1_p_lbl 484031 `"Yucatán [State: Mexico]"', add
label define geomig1_p_lbl 484032 `"Zacatecas [State: Mexico]"', add
label define geomig1_p_lbl 484097 `"Abroad [State: Mexico]"', add
label define geomig1_p_lbl 484098 `"Unknown [State: Mexico]"', add
label define geomig1_p_lbl 484099 `"NIU (not in universe) [State: Mexico]"', add
label define geomig1_p_lbl 496001 `"Arkhangai [Province: Mongolia]"', add
label define geomig1_p_lbl 496002 `"Bayan-Olgii [Province: Mongolia]"', add
label define geomig1_p_lbl 496003 `"Bayankhongor [Province: Mongolia]"', add
label define geomig1_p_lbl 496004 `"Bulgan [Province: Mongolia]"', add
label define geomig1_p_lbl 496005 `"Govi-Altai [Province: Mongolia]"', add
label define geomig1_p_lbl 496006 `"Dornogovi, Govisumber [Province: Mongolia]"', add
label define geomig1_p_lbl 496007 `"Dornod [Province: Mongolia]"', add
label define geomig1_p_lbl 496008 `"Dundgovi [Province: Mongolia]"', add
label define geomig1_p_lbl 496009 `"Zavkhan [Province: Mongolia]"', add
label define geomig1_p_lbl 496010 `"Ovorkhangai [Province: Mongolia]"', add
label define geomig1_p_lbl 496011 `"Omnogovi [Province: Mongolia]"', add
label define geomig1_p_lbl 496012 `"Sukhbaatar [Province: Mongolia]"', add
label define geomig1_p_lbl 496013 `"Selenge [Province: Mongolia]"', add
label define geomig1_p_lbl 496014 `"Tov [Province: Mongolia]"', add
label define geomig1_p_lbl 496015 `"Uvs [Province: Mongolia]"', add
label define geomig1_p_lbl 496016 `"Khovd [Province: Mongolia]"', add
label define geomig1_p_lbl 496017 `"Khovsgol [Province: Mongolia]"', add
label define geomig1_p_lbl 496018 `"Khentii [Province: Mongolia]"', add
label define geomig1_p_lbl 496019 `"Darkhan-Uul [Province: Mongolia]"', add
label define geomig1_p_lbl 496020 `"Ulaanbaatar [Province: Mongolia]"', add
label define geomig1_p_lbl 496021 `"Orkhon [Province: Mongolia]"', add
label define geomig1_p_lbl 496097 `"Abroad [Province: Mongolia]"', add
label define geomig1_p_lbl 496099 `"NIU (not in universe) [Province: Mongolia]"', add
label define geomig1_p_lbl 504001 `"Oued-Ed-Dahab-Lagouira [Region: Morocco]"', add
label define geomig1_p_lbl 504002 `"Laâyoune-Boujdour-Sakia El Hamra [Region: Morocco]"', add
label define geomig1_p_lbl 504003 `"Guelmin-Es-Samara [Region: Morocco]"', add
label define geomig1_p_lbl 504004 `"Souss-Massa-Draâ [Region: Morocco]"', add
label define geomig1_p_lbl 504005 `"Charb-Chrarda-Béni Hssen [Region: Morocco]"', add
label define geomig1_p_lbl 504006 `"Chaouia-Ouardigha [Region: Morocco]"', add
label define geomig1_p_lbl 504007 `"Marrakech-Tensift-Al Haouz [Region: Morocco]"', add
label define geomig1_p_lbl 504008 `"Oriental [Region: Morocco]"', add
label define geomig1_p_lbl 504009 `"Grand-Casablanca [Region: Morocco]"', add
label define geomig1_p_lbl 504010 `"Rabat-Salé-Zemmour-Zaer [Region: Morocco]"', add
label define geomig1_p_lbl 504011 `"Doukala Abda [Region: Morocco]"', add
label define geomig1_p_lbl 504012 `"Tadla Azilal [Region: Morocco]"', add
label define geomig1_p_lbl 504013 `"Meknès-Tafilalet [Region: Morocco]"', add
label define geomig1_p_lbl 504014 `"Fès-Boulemane [Region: Morocco]"', add
label define geomig1_p_lbl 504015 `"Taza-Al Heiceima-Taounate [Region: Morocco]"', add
label define geomig1_p_lbl 504016 `"Tanger-Tétouan [Region: Morocco]"', add
label define geomig1_p_lbl 504097 `"Abroad [Region: Morocco]"', add
label define geomig1_p_lbl 504098 `"Unknown [Region: Morocco]"', add
label define geomig1_p_lbl 504099 `"NIU (not in universe) [Region: Morocco]"', add
label define geomig1_p_lbl 591002 `"Coclé [Province: Panama]"', add
label define geomig1_p_lbl 591003 `"Colón, Comarca Kuna Yala (San Blas) [Province: Panama]"', add
label define geomig1_p_lbl 591004 `"Bocas de Toro, Chiriquí, Comarca Ngäbe Buglé, Veraguas [Province: Panama]"', add
label define geomig1_p_lbl 591005 `"Comarca Emberá, Darién [Province: Panama]"', add
label define geomig1_p_lbl 591006 `"Herrera [Province: Panama]"', add
label define geomig1_p_lbl 591007 `"Los Santos [Province: Panama]"', add
label define geomig1_p_lbl 591008 `"Panamá [Province: Panama]"', add
label define geomig1_p_lbl 591009 `"Unknown district in Panamá province [Province: Panama]"', add
label define geomig1_p_lbl 591097 `"Foreign country [Province: Panama]"', add
label define geomig1_p_lbl 591098 `"Unknown [Province: Panama]"', add
label define geomig1_p_lbl 591099 `"NIU (not in universe) [Province: Panama]"', add
label define geomig1_p_lbl 608001 `"Abra [Province: Philippines]"', add
label define geomig1_p_lbl 608002 `"Agusan del norte [Province: Philippines]"', add
label define geomig1_p_lbl 608003 `"Agusan del sur [Province: Philippines]"', add
label define geomig1_p_lbl 608004 `"Aklan [Province: Philippines]"', add
label define geomig1_p_lbl 608005 `"Albay [Province: Philippines]"', add
label define geomig1_p_lbl 608006 `"Antique [Province: Philippines]"', add
label define geomig1_p_lbl 608007 `"Basilan, City Of Isabela [Province: Philippines]"', add
label define geomig1_p_lbl 608008 `"Bataan [Province: Philippines]"', add
label define geomig1_p_lbl 608010 `"Batangas [Province: Philippines]"', add
label define geomig1_p_lbl 608011 `"Benguet [Province: Philippines]"', add
label define geomig1_p_lbl 608012 `"Bohol [Province: Philippines]"', add
label define geomig1_p_lbl 608013 `"Bukidnon [Province: Philippines]"', add
label define geomig1_p_lbl 608014 `"Bulacan [Province: Philippines]"', add
label define geomig1_p_lbl 608015 `"Cagayan, Batanes [Province: Philippines]"', add
label define geomig1_p_lbl 608016 `"Camarines norte [Province: Philippines]"', add
label define geomig1_p_lbl 608017 `"Camarines Sur [Province: Philippines]"', add
label define geomig1_p_lbl 608018 `"Camiguin [Province: Philippines]"', add
label define geomig1_p_lbl 608019 `"Capiz [Province: Philippines]"', add
label define geomig1_p_lbl 608020 `"Catanduanes [Province: Philippines]"', add
label define geomig1_p_lbl 608021 `"Cavite [Province: Philippines]"', add
label define geomig1_p_lbl 608022 `"Cebu [Province: Philippines]"', add
label define geomig1_p_lbl 608023 `"Davao (Davao del Norte) [Province: Philippines]"', add
label define geomig1_p_lbl 608024 `"Davao del Sur [Province: Philippines]"', add
label define geomig1_p_lbl 608025 `"Davao Oriental [Province: Philippines]"', add
label define geomig1_p_lbl 608026 `"Eastern Samar [Province: Philippines]"', add
label define geomig1_p_lbl 608027 `"Ifugao [Province: Philippines]"', add
label define geomig1_p_lbl 608028 `"Ilocos Norte [Province: Philippines]"', add
label define geomig1_p_lbl 608029 `"Ilocos Sur [Province: Philippines]"', add
label define geomig1_p_lbl 608030 `"Iloilo, Guimaras [Province: Philippines]"', add
label define geomig1_p_lbl 608031 `"Isabela [Province: Philippines]"', add
label define geomig1_p_lbl 608032 `"Kalinga-Apayao, Apayo, Kalinga [Province: Philippines]"', add
label define geomig1_p_lbl 608033 `"La Union [Province: Philippines]"', add
label define geomig1_p_lbl 608034 `"Laguna [Province: Philippines]"', add
label define geomig1_p_lbl 608035 `"Lanao del Norte [Province: Philippines]"', add
label define geomig1_p_lbl 608036 `"Lanao del Sur [Province: Philippines]"', add
label define geomig1_p_lbl 608037 `"Leyte, Biliran [Province: Philippines]"', add
label define geomig1_p_lbl 608038 `"Maguindanao, Cotabato city [Province: Philippines]"', add
label define geomig1_p_lbl 608039 `"Manila [Province: Philippines]"', add
label define geomig1_p_lbl 608040 `"Marinduque [Province: Philippines]"', add
label define geomig1_p_lbl 608041 `"Masbate [Province: Philippines]"', add
label define geomig1_p_lbl 608042 `"Misamis Occidental [Province: Philippines]"', add
label define geomig1_p_lbl 608043 `"Misamis Oriental [Province: Philippines]"', add
label define geomig1_p_lbl 608044 `"Mountain Province [Province: Philippines]"', add
label define geomig1_p_lbl 608045 `"Negros Occidental [Province: Philippines]"', add
label define geomig1_p_lbl 608046 `"Negros Oriental [Province: Philippines]"', add
label define geomig1_p_lbl 608047 `"Cotabato (North Cotabato) [Province: Philippines]"', add
label define geomig1_p_lbl 608048 `"Northern Samar [Province: Philippines]"', add
label define geomig1_p_lbl 608049 `"Nueva Ecija [Province: Philippines]"', add
label define geomig1_p_lbl 608050 `"Nueva Vizcaya [Province: Philippines]"', add
label define geomig1_p_lbl 608051 `"Occidental Mindoro [Province: Philippines]"', add
label define geomig1_p_lbl 608052 `"Oriental Mindoro [Province: Philippines]"', add
label define geomig1_p_lbl 608053 `"Palawan [Province: Philippines]"', add
label define geomig1_p_lbl 608054 `"Pampanga [Province: Philippines]"', add
label define geomig1_p_lbl 608055 `"Pangasinan [Province: Philippines]"', add
label define geomig1_p_lbl 608056 `"Quezon [Province: Philippines]"', add
label define geomig1_p_lbl 608057 `"Quirino [Province: Philippines]"', add
label define geomig1_p_lbl 608058 `"Rizal [Province: Philippines]"', add
label define geomig1_p_lbl 608059 `"Romblon [Province: Philippines]"', add
label define geomig1_p_lbl 608060 `"Samar (Western Samar) [Province: Philippines]"', add
label define geomig1_p_lbl 608061 `"Siquijor [Province: Philippines]"', add
label define geomig1_p_lbl 608062 `"Sorsogon [Province: Philippines]"', add
label define geomig1_p_lbl 608063 `"South Cotabato, Sarangani [Province: Philippines]"', add
label define geomig1_p_lbl 608064 `"Southern Leyte [Province: Philippines]"', add
label define geomig1_p_lbl 608065 `"Sultan Kudarat [Province: Philippines]"', add
label define geomig1_p_lbl 608066 `"Sulu [Province: Philippines]"', add
label define geomig1_p_lbl 608067 `"Surigao Del Norte, Dinagat islands [Province: Philippines]"', add
label define geomig1_p_lbl 608068 `"Surigao del Sur [Province: Philippines]"', add
label define geomig1_p_lbl 608069 `"Tarlac [Province: Philippines]"', add
label define geomig1_p_lbl 608070 `"Tawi-Tawi [Province: Philippines]"', add
label define geomig1_p_lbl 608071 `"Zambales [Province: Philippines]"', add
label define geomig1_p_lbl 608072 `"Zamboanga Norte [Province: Philippines]"', add
label define geomig1_p_lbl 608073 `"Zamboanga del Sur, Zamboanga Sibugay [Province: Philippines]"', add
label define geomig1_p_lbl 608074 `"Manila Metro, 2nd District [Province: Philippines]"', add
label define geomig1_p_lbl 608075 `"Manila Metro, 3rd District [Province: Philippines]"', add
label define geomig1_p_lbl 608076 `"Manila Metro, 4th District [Province: Philippines]"', add
label define geomig1_p_lbl 608077 `"Aurora [Province: Philippines]"', add
label define geomig1_p_lbl 608097 `"Foreign country [Province: Panama]"', add
label define geomig1_p_lbl 608098 `"Unknown [Province: Panama]"', add
label define geomig1_p_lbl 642001 `"Alba [County: Romania]"', add
label define geomig1_p_lbl 642002 `"Arad [County: Romania]"', add
label define geomig1_p_lbl 642003 `"Arges [County: Romania]"', add
label define geomig1_p_lbl 642004 `"Bacau [County: Romania]"', add
label define geomig1_p_lbl 642005 `"Bihor [County: Romania]"', add
label define geomig1_p_lbl 642006 `"Bistrita Nasaud [County: Romania]"', add
label define geomig1_p_lbl 642007 `"Botosani [County: Romania]"', add
label define geomig1_p_lbl 642008 `"Brasov [County: Romania]"', add
label define geomig1_p_lbl 642009 `"Braila [County: Romania]"', add
label define geomig1_p_lbl 642010 `"Buzau [County: Romania]"', add
label define geomig1_p_lbl 642011 `"Caras Severin [County: Romania]"', add
label define geomig1_p_lbl 642012 `"Cluj [County: Romania]"', add
label define geomig1_p_lbl 642013 `"Constanta [County: Romania]"', add
label define geomig1_p_lbl 642014 `"Covasna [County: Romania]"', add
label define geomig1_p_lbl 642015 `"Dambovita [County: Romania]"', add
label define geomig1_p_lbl 642016 `"Dolj [County: Romania]"', add
label define geomig1_p_lbl 642017 `"Galati [County: Romania]"', add
label define geomig1_p_lbl 642018 `"Gorj [County: Romania]"', add
label define geomig1_p_lbl 642019 `"Harghita [County: Romania]"', add
label define geomig1_p_lbl 642020 `"Hunedoara [County: Romania]"', add
label define geomig1_p_lbl 642022 `"Iasi [County: Romania]"', add
label define geomig1_p_lbl 642024 `"Maramures [County: Romania]"', add
label define geomig1_p_lbl 642025 `"Mehedinti [County: Romania]"', add
label define geomig1_p_lbl 642026 `"Mures [County: Romania]"', add
label define geomig1_p_lbl 642027 `"Neamt [County: Romania]"', add
label define geomig1_p_lbl 642028 `"Olt [County: Romania]"', add
label define geomig1_p_lbl 642029 `"Prahova [County: Romania]"', add
label define geomig1_p_lbl 642030 `"Satu Mare [County: Romania]"', add
label define geomig1_p_lbl 642031 `"Salaj [County: Romania]"', add
label define geomig1_p_lbl 642032 `"Sibiu [County: Romania]"', add
label define geomig1_p_lbl 642033 `"Suceava [County: Romania]"', add
label define geomig1_p_lbl 642034 `"Teleorman [County: Romania]"', add
label define geomig1_p_lbl 642035 `"Timis [County: Romania]"', add
label define geomig1_p_lbl 642036 `"Tulcea [County: Romania]"', add
label define geomig1_p_lbl 642037 `"Vaslui [County: Romania]"', add
label define geomig1_p_lbl 642038 `"Valcea [County: Romania]"', add
label define geomig1_p_lbl 642039 `"Vrancea [County: Romania]"', add
label define geomig1_p_lbl 642043 `"Bucharest Sector 1 to 6 [County: Romania]"', add
label define geomig1_p_lbl 642051 `"Calarasi, Giurgiu, Ialomita, Ilfov [County: Romania]"', add
label define geomig1_p_lbl 642097 `"Foreign country [County: Romania]"', add
label define geomig1_p_lbl 642098 `"Unknown [County: Romania]"', add
label define geomig1_p_lbl 642099 `"NIU (not in universe) [County: Romania]"', add
label define geomig1_p_lbl 646002 `"Byumba, Kigali Ngali, Kigali Ville, Kibungo, Umutara [Province: Rwanda]"', add
label define geomig1_p_lbl 646003 `"Gitarama [Province: Rwanda]"', add
label define geomig1_p_lbl 646004 `"Butare [Province: Rwanda]"', add
label define geomig1_p_lbl 646005 `"Gikongoro [Province: Rwanda]"', add
label define geomig1_p_lbl 646006 `"Cyangugu [Province: Rwanda]"', add
label define geomig1_p_lbl 646007 `"Kibuye [Province: Rwanda]"', add
label define geomig1_p_lbl 646008 `"Gisenyi [Province: Rwanda]"', add
label define geomig1_p_lbl 646009 `"Ruhengeri [Province: Rwanda]"', add
label define geomig1_p_lbl 646097 `"Foreign Countries [Province: Rwanda]"', add
label define geomig1_p_lbl 646098 `"Unknown [Province: Rwanda]"', add
label define geomig1_p_lbl 646099 `"NIU [Province: Rwanda]"', add
label define geomig1_p_lbl 694011 `"Kailahun [District: Sierra Leone]"', add
label define geomig1_p_lbl 694012 `"Kenema [District: Sierra Leone]"', add
label define geomig1_p_lbl 694013 `"Kono [District: Sierra Leone]"', add
label define geomig1_p_lbl 694021 `"Bombali [District: Sierra Leone]"', add
label define geomig1_p_lbl 694022 `"Kambia [District: Sierra Leone]"', add
label define geomig1_p_lbl 694023 `"Koinadugu [District: Sierra Leone]"', add
label define geomig1_p_lbl 694024 `"Port Loko [District: Sierra Leone]"', add
label define geomig1_p_lbl 694025 `"Tonkolili [District: Sierra Leone]"', add
label define geomig1_p_lbl 694031 `"Bo [District: Sierra Leone]"', add
label define geomig1_p_lbl 694032 `"Bonthe [District: Sierra Leone]"', add
label define geomig1_p_lbl 694033 `"Moyamba [District: Sierra Leone]"', add
label define geomig1_p_lbl 694034 `"Pujehun [District: Sierra Leone]"', add
label define geomig1_p_lbl 694041 `"Western - rural [District: Sierra Leone]"', add
label define geomig1_p_lbl 694042 `"Western - urban [District: Sierra Leone]"', add
label define geomig1_p_lbl 694097 `"Foreign country [District: Sierra Leone]"', add
label define geomig1_p_lbl 694099 `"NIU (not in universe) [District: Sierra Leone]"', add
label define geomig1_p_lbl 705001 `"Pomurska [Region: Slovenia]"', add
label define geomig1_p_lbl 705002 `"Podravska [Region: Slovenia]"', add
label define geomig1_p_lbl 705003 `"Koroška [Region: Slovenia]"', add
label define geomig1_p_lbl 705004 `"Savinjska [Region: Slovenia]"', add
label define geomig1_p_lbl 705005 `"Zasavska [Region: Slovenia]"', add
label define geomig1_p_lbl 705006 `"Spodnjeposavska [Region: Slovenia]"', add
label define geomig1_p_lbl 705007 `"Jugovzhodna Slovenija [Region: Slovenia]"', add
label define geomig1_p_lbl 705008 `"Osrednjeslovenska [Region: Slovenia]"', add
label define geomig1_p_lbl 705009 `"Gorenjska [Region: Slovenia]"', add
label define geomig1_p_lbl 705010 `"Notranjsko-kraška [Region: Slovenia]"', add
label define geomig1_p_lbl 705011 `"Goriška [Region: Slovenia]"', add
label define geomig1_p_lbl 705012 `"Obalno-kraška [Region: Slovenia]"', add
label define geomig1_p_lbl 705097 `"Abroad [Region: Slovenia]"', add
label define geomig1_p_lbl 705099 `"NIU (not in universe) [Region: Slovenia]"', add
label define geomig1_p_lbl 710001 `"Western Cape [Province: South Africa]"', add
label define geomig1_p_lbl 710004 `"Free State [Province: South Africa]"', add
label define geomig1_p_lbl 710005 `"Eastern Cape, KwaZulu-Natal [Province: South Africa]"', add
label define geomig1_p_lbl 710007 `"Gauteng, Limpopo, Mpumalanga, North West, Northern Cape [Province: South Africa]"', add
label define geomig1_p_lbl 710097 `"Foreign country [Province: South Africa]"', add
label define geomig1_p_lbl 710098 `"Unknown [Province: South Africa]"', add
label define geomig1_p_lbl 710099 `"NIU (not in universe) [Province: South Africa]"', add
label define geomig1_p_lbl 724011 `"Galicia [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724012 `"Principado de Asturias [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724013 `"Cantabria [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724021 `"País Vasco [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724022 `"Comunidad Foral de Navarra [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724023 `"La Rioja [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724024 `"Aragón [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724030 `"Comunidad de Madrid [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724041 `"Castilla y León [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724042 `"Castilla-La Mancha [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724043 `"Extremadura [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724051 `"Cataluña [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724052 `"Comunidad Valenciana [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724053 `"Illes Balears [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724061 `"Andalucía [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724062 `"Región de Murcia [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724063 `"Ciudad Autónoma de Ceuta [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724064 `"Ciudad Autónoma de Melilla [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724070 `"Canarias [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724097 `"Abroad [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 724099 `"NIU (not in universe) [Communities & autonomous city: Spain]"', add
label define geomig1_p_lbl 764010 `"Bangkok [Province: Thailand]"', add
label define geomig1_p_lbl 764011 `"Samut Prakan [Province: Thailand]"', add
label define geomig1_p_lbl 764012 `"Nonthaburi [Province: Thailand]"', add
label define geomig1_p_lbl 764013 `"Pathum Thani [Province: Thailand]"', add
label define geomig1_p_lbl 764014 `"Phra Nakhon Si Ayutthaya [Province: Thailand]"', add
label define geomig1_p_lbl 764015 `"Ang Thong [Province: Thailand]"', add
label define geomig1_p_lbl 764016 `"Lop Buri [Province: Thailand]"', add
label define geomig1_p_lbl 764017 `"Sing Buri [Province: Thailand]"', add
label define geomig1_p_lbl 764018 `"Chai Nat [Province: Thailand]"', add
label define geomig1_p_lbl 764019 `"Sa Kaeo, Prachin Buri [Province: Thailand]"', add
label define geomig1_p_lbl 764020 `"Chon Buri [Province: Thailand]"', add
label define geomig1_p_lbl 764021 `"Rayong [Province: Thailand]"', add
label define geomig1_p_lbl 764022 `"Chanthaburi [Province: Thailand]"', add
label define geomig1_p_lbl 764023 `"Trat [Province: Thailand]"', add
label define geomig1_p_lbl 764024 `"Chachoengsao [Province: Thailand]"', add
label define geomig1_p_lbl 764026 `"Nakhon Nayok [Province: Thailand]"', add
label define geomig1_p_lbl 764027 `"Saraburi [Province: Thailand]"', add
label define geomig1_p_lbl 764030 `"Nakhon Ratchasima [Province: Thailand]"', add
label define geomig1_p_lbl 764031 `"Buri Ram [Province: Thailand]"', add
label define geomig1_p_lbl 764032 `"Surin [Province: Thailand]"', add
label define geomig1_p_lbl 764033 `"Si Sa Ket [Province: Thailand]"', add
label define geomig1_p_lbl 764034 `"Ubon Ratchathani, Yasothon, Amnat Charoen [Province: Thailand]"', add
label define geomig1_p_lbl 764036 `"Chaiyaphum [Province: Thailand]"', add
label define geomig1_p_lbl 764039 `"Nong Bua Lam Phu, Udon Thani [Province: Thailand]"', add
label define geomig1_p_lbl 764040 `"Khon Kaen [Province: Thailand]"', add
label define geomig1_p_lbl 764042 `"Loei [Province: Thailand]"', add
label define geomig1_p_lbl 764043 `"Nong Khai [Province: Thailand]"', add
label define geomig1_p_lbl 764044 `"Maha Sarakham [Province: Thailand]"', add
label define geomig1_p_lbl 764045 `"Roi Et [Province: Thailand]"', add
label define geomig1_p_lbl 764046 `"Kalasin [Province: Thailand]"', add
label define geomig1_p_lbl 764047 `"Sakon Nakhon [Province: Thailand]"', add
label define geomig1_p_lbl 764048 `"Nakhon Phanom, Mukdahan [Province: Thailand]"', add
label define geomig1_p_lbl 764050 `"Chiang Mai [Province: Thailand]"', add
label define geomig1_p_lbl 764051 `"Lamphun [Province: Thailand]"', add
label define geomig1_p_lbl 764052 `"Lampang [Province: Thailand]"', add
label define geomig1_p_lbl 764053 `"Uttaradit [Province: Thailand]"', add
label define geomig1_p_lbl 764054 `"Phrae [Province: Thailand]"', add
label define geomig1_p_lbl 764055 `"Nan [Province: Thailand]"', add
label define geomig1_p_lbl 764057 `"Phayao, Chiang Rai [Province: Thailand]"', add
label define geomig1_p_lbl 764058 `"Mae Hong Son [Province: Thailand]"', add
label define geomig1_p_lbl 764060 `"Nakhon Sawan [Province: Thailand]"', add
label define geomig1_p_lbl 764061 `"Uthai Thani [Province: Thailand]"', add
label define geomig1_p_lbl 764062 `"Kamphaeng Phet [Province: Thailand]"', add
label define geomig1_p_lbl 764063 `"Tak [Province: Thailand]"', add
label define geomig1_p_lbl 764064 `"Sukhothai [Province: Thailand]"', add
label define geomig1_p_lbl 764065 `"Phitsanulok [Province: Thailand]"', add
label define geomig1_p_lbl 764066 `"Phichit [Province: Thailand]"', add
label define geomig1_p_lbl 764067 `"Phetchabun [Province: Thailand]"', add
label define geomig1_p_lbl 764070 `"Ratchaburi [Province: Thailand]"', add
label define geomig1_p_lbl 764071 `"Kanchanaburi [Province: Thailand]"', add
label define geomig1_p_lbl 764072 `"Suphanburi [Province: Thailand]"', add
label define geomig1_p_lbl 764073 `"Nakhon Pathom [Province: Thailand]"', add
label define geomig1_p_lbl 764074 `"Samut Sakhon [Province: Thailand]"', add
label define geomig1_p_lbl 764075 `"Samut Songkhram [Province: Thailand]"', add
label define geomig1_p_lbl 764076 `"Phetchaburi [Province: Thailand]"', add
label define geomig1_p_lbl 764077 `"Prachuap Khiri Khan [Province: Thailand]"', add
label define geomig1_p_lbl 764080 `"Nakhon Si Thammarat [Province: Thailand]"', add
label define geomig1_p_lbl 764082 `"Phangnga [Province: Thailand]"', add
label define geomig1_p_lbl 764083 `"Phuket [Province: Thailand]"', add
label define geomig1_p_lbl 764084 `"Krabi, Surat Thani [Province: Thailand]"', add
label define geomig1_p_lbl 764086 `"Ranong, Chumphon [Province: Thailand]"', add
label define geomig1_p_lbl 764090 `"Songkhla [Province: Thailand]"', add
label define geomig1_p_lbl 764091 `"Satun [Province: Thailand]"', add
label define geomig1_p_lbl 764092 `"Trang [Province: Thailand]"', add
label define geomig1_p_lbl 764093 `"Phatthalung [Province: Thailand]"', add
label define geomig1_p_lbl 764094 `"Pattani [Province: Thailand]"', add
label define geomig1_p_lbl 764095 `"Yala [Province: Thailand]"', add
label define geomig1_p_lbl 764096 `"Narathiwat [Province: Thailand]"', add
label define geomig1_p_lbl 764097 `"Same province [Province: Thailand]"', add
label define geomig1_p_lbl 764098 `"Unknown province, but within Thaliand [Province: Thailand]"', add
label define geomig1_p_lbl 764997 `"Abroad [Province: Thailand]"', add
label define geomig1_p_lbl 764998 `"Unknown [Province: Thailand]"', add
label define geomig1_p_lbl 764999 `"NIU (not in universe) [Province: Thailand]"', add
label define geomig1_p_lbl 768001 `"Maritime, Lomé [Region: Togo]"', add
label define geomig1_p_lbl 768002 `"Plateaux, Centrale, Kara [Region: Togo]"', add
label define geomig1_p_lbl 768003 `"Savanes [Region: Togo]"', add
label define geomig1_p_lbl 768097 `"Foreign Country [Region: Togo]"', add
label define geomig1_p_lbl 768098 `"Unknown [Region: Togo]"', add
label define geomig1_p_lbl 768099 `"NIU [Region: Togo]"', add
label define geomig1_p_lbl 780010 `"City of Port of Spain [Region: Trinidad and Tobago]"', add
label define geomig1_p_lbl 780020 `"San Fernando [Region: Trinidad and Tobago]"', add
label define geomig1_p_lbl 780080 `"Diego Martin, San Juan/ Laventille,  Tunapuna/ Piarco, Chaguanas, Sangre Grande, Couva/ Tabaquite /Talparo,  Rio Claro/Mayaro, Siparia, Penal/Debe, Princess Town,  Port Fontin,  Caroni,  St. Andrew/St. David, Victoria, St. Patrick, Arima [Regio"', add
label define geomig1_p_lbl 780094 `"Tobago [Region: Trinidad and Tobago]"', add
label define geomig1_p_lbl 780098 `"Unknown [Region: Trinidad and Tobago]"', add
label define geomig1_p_lbl 800096 `"Visitor [District: Uganda]"', add
label define geomig1_p_lbl 800097 `"Foreign country [District: Uganda]"', add
label define geomig1_p_lbl 800098 `"Unknown [District: Uganda]"', add
label define geomig1_p_lbl 800101 `"Kalangala [District: Uganda]"', add
label define geomig1_p_lbl 800102 `"Kampala [District: Uganda]"', add
label define geomig1_p_lbl 800103 `"Kiboga [District: Uganda]"', add
label define geomig1_p_lbl 800104 `"Luwero, Nakasongola [District: Uganda]"', add
label define geomig1_p_lbl 800105 `"Masaka, Sembabule [District: Uganda]"', add
label define geomig1_p_lbl 800107 `"Mubende [District: Uganda]"', add
label define geomig1_p_lbl 800108 `"Kayunga, Mukono [District: Uganda]"', add
label define geomig1_p_lbl 800110 `"Rakai [District: Uganda]"', add
label define geomig1_p_lbl 800113 `"Mpigi, Wakiso [District: Uganda]"', add
label define geomig1_p_lbl 800203 `"Bugiri, Iganga, Mayuge [District: Uganda]"', add
label define geomig1_p_lbl 800204 `"Jinja [District: Uganda]"', add
label define geomig1_p_lbl 800205 `"Kamuli [District: Uganda]"', add
label define geomig1_p_lbl 800206 `"Kapchorwa [District: Uganda]"', add
label define geomig1_p_lbl 800208 `"Kumi [District: Uganda]"', add
label define geomig1_p_lbl 800209 `"Mbale, Sironko [District: Uganda]"', add
label define geomig1_p_lbl 800210 `"Pallisa [District: Uganda]"', add
label define geomig1_p_lbl 800211 `"Kaberamaido, Katakwi, Soroti [District: Uganda]"', add
label define geomig1_p_lbl 800212 `"Busia, Tororo [District: Uganda]"', add
label define geomig1_p_lbl 800301 `"Adjumani, Moyo [District: Uganda]"', add
label define geomig1_p_lbl 800302 `"Apac [District: Uganda]"', add
label define geomig1_p_lbl 800303 `"Arua, Yumbe [District: Uganda]"', add
label define geomig1_p_lbl 800304 `"Gulu [District: Uganda]"', add
label define geomig1_p_lbl 800306 `"Kotido [District: Uganda]"', add
label define geomig1_p_lbl 800307 `"Lira [District: Uganda]"', add
label define geomig1_p_lbl 800308 `"Moroto, Nakapiripirit [District: Uganda]"', add
label define geomig1_p_lbl 800310 `"Nebbi [District: Uganda]"', add
label define geomig1_p_lbl 800312 `"Kitgum, Pader [District: Uganda]"', add
label define geomig1_p_lbl 800401 `"Bundibugyo [District: Uganda]"', add
label define geomig1_p_lbl 800404 `"Kabale [District: Uganda]"', add
label define geomig1_p_lbl 800406 `"Kasese [District: Uganda]"', add
label define geomig1_p_lbl 800407 `"Kibaale [District: Uganda]"', add
label define geomig1_p_lbl 800408 `"Kisoro [District: Uganda]"', add
label define geomig1_p_lbl 800409 `"Hoima, Masindi [District: Uganda]"', add
label define geomig1_p_lbl 800410 `"Bushenyi, Mbarara, Ntungamo [District: Uganda]"', add
label define geomig1_p_lbl 800412 `"Kanungu, Rukungiri [District: Uganda]"', add
label define geomig1_p_lbl 800415 `"Kabarole, Kamwenge, Kyenjojo [District: Uganda]"', add
label define geomig1_p_lbl 804001 `"The Autonomous Republic of Crimea [Region: Ukraine]"', add
label define geomig1_p_lbl 804005 `"Vinnytska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804007 `"Volynska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804012 `"Dnipropetrovska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804014 `"Donetska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804018 `"Zhytomyrska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804021 `"Zakarpatska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804023 `"Zaporizka oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804026 `"Ivano-Frankivska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804032 `"Kyivska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804035 `"Kirovohradska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804044 `"Luhanska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804046 `"Lvivska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804048 `"Mykolaivska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804051 `"Odeska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804053 `"Poltavska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804056 `"Rivnenska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804059 `"Sumska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804061 `"Ternopilska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804063 `"Kharkivska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804065 `"Khersonska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804068 `"Khmelnytska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804071 `"Cherkaska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804073 `"Chernivetska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804074 `"Chernihivska oblast [Region: Ukraine]"', add
label define geomig1_p_lbl 804080 `"Kyiv (independent city) [Region: Ukraine]"', add
label define geomig1_p_lbl 804085 `"Sevastopol (independent city) [Region: Ukraine]"', add
label define geomig1_p_lbl 804097 `"Foreign country [Region: Ukraine]"', add
label define geomig1_p_lbl 804098 `"Unknown [Region: Ukraine]"', add
label define geomig1_p_lbl 804099 `"NIU (not in universe) [Region: Ukraine]"', add
label define geomig1_p_lbl 818000 `"Reported same governorate as household location [Governorate: Egypt]"', add
label define geomig1_p_lbl 818001 `"Giza, 6th October City, Cairo, Helwan [Governorate: Egypt]"', add
label define geomig1_p_lbl 818002 `"Alexandria [Governorate: Egypt]"', add
label define geomig1_p_lbl 818003 `"Port Said [Governorate: Egypt]"', add
label define geomig1_p_lbl 818004 `"Suez [Governorate: Egypt]"', add
label define geomig1_p_lbl 818011 `"Demietta [Governorate: Egypt]"', add
label define geomig1_p_lbl 818012 `"Dakahlia [Governorate: Egypt]"', add
label define geomig1_p_lbl 818013 `"Sharkia [Governorate: Egypt]"', add
label define geomig1_p_lbl 818014 `"Kaliobia [Governorate: Egypt]"', add
label define geomig1_p_lbl 818015 `"Kafr Sheikh [Governorate: Egypt]"', add
label define geomig1_p_lbl 818016 `"Gharbia [Governorate: Egypt]"', add
label define geomig1_p_lbl 818018 `"Menoufia, Behera [Governorate: Egypt]"', add
label define geomig1_p_lbl 818019 `"Ismailia [Governorate: Egypt]"', add
label define geomig1_p_lbl 818022 `"Bani Swif [Governorate: Egypt]"', add
label define geomig1_p_lbl 818023 `"Fayoum [Governorate: Egypt]"', add
label define geomig1_p_lbl 818024 `"Menia [Governorate: Egypt]"', add
label define geomig1_p_lbl 818025 `"Asiut [Governorate: Egypt]"', add
label define geomig1_p_lbl 818026 `"Sohag [Governorate: Egypt]"', add
label define geomig1_p_lbl 818027 `"Qena, Luxor [Governorate: Egypt]"', add
label define geomig1_p_lbl 818028 `"Aswan [Governorate: Egypt]"', add
label define geomig1_p_lbl 818031 `"Red Sea [Governorate: Egypt]"', add
label define geomig1_p_lbl 818032 `"New Valley [Governorate: Egypt]"', add
label define geomig1_p_lbl 818033 `"Marsa Matroh [Governorate: Egypt]"', add
label define geomig1_p_lbl 818034 `"North Sinai [Governorate: Egypt]"', add
label define geomig1_p_lbl 818035 `"South Sinai [Governorate: Egypt]"', add
label define geomig1_p_lbl 818097 `"Abroad [Governorate: Egypt]"', add
label define geomig1_p_lbl 818098 `"Unknown [Governorate: Egypt]"', add
label define geomig1_p_lbl 818099 `"NIU (not in universe) [Governorate: Egypt]"', add
label define geomig1_p_lbl 858001 `"Montevideo [Department: Uruguay]"', add
label define geomig1_p_lbl 858002 `"Artigas [Department: Uruguay]"', add
label define geomig1_p_lbl 858003 `"Canelones [Department: Uruguay]"', add
label define geomig1_p_lbl 858004 `"Cerro Largo [Department: Uruguay]"', add
label define geomig1_p_lbl 858005 `"Colonia [Department: Uruguay]"', add
label define geomig1_p_lbl 858006 `"Durazno [Department: Uruguay]"', add
label define geomig1_p_lbl 858007 `"Flores [Department: Uruguay]"', add
label define geomig1_p_lbl 858008 `"Florida [Department: Uruguay]"', add
label define geomig1_p_lbl 858009 `"Lavalleja [Department: Uruguay]"', add
label define geomig1_p_lbl 858010 `"Maldonado [Department: Uruguay]"', add
label define geomig1_p_lbl 858011 `"Paysandú [Department: Uruguay]"', add
label define geomig1_p_lbl 858012 `"Río Negro [Department: Uruguay]"', add
label define geomig1_p_lbl 858013 `"Rivera [Department: Uruguay]"', add
label define geomig1_p_lbl 858014 `"Rocha [Department: Uruguay]"', add
label define geomig1_p_lbl 858015 `"Salto [Department: Uruguay]"', add
label define geomig1_p_lbl 858016 `"San Jose [Department: Uruguay]"', add
label define geomig1_p_lbl 858017 `"Soriano [Department: Uruguay]"', add
label define geomig1_p_lbl 858018 `"Tacuarembó [Department: Uruguay]"', add
label define geomig1_p_lbl 858019 `"Treinta Y Tres [Department: Uruguay]"', add
label define geomig1_p_lbl 858097 `"Abroad [Department: Uruguay]"', add
label define geomig1_p_lbl 858098 `"Unknown [Department: Uruguay]"', add
label define geomig1_p_lbl 858099 `"NIU (not in universe) [Department: Uruguay]"', add
label define geomig1_p_lbl 862001 `"Federal District, Vargas [State: Venezuela]"', add
label define geomig1_p_lbl 862002 `"Amazonas Federal Territory [State: Venezuela]"', add
label define geomig1_p_lbl 862003 `"Anzoátegui [State: Venezuela]"', add
label define geomig1_p_lbl 862004 `"Apure [State: Venezuela]"', add
label define geomig1_p_lbl 862005 `"Aragua [State: Venezuela]"', add
label define geomig1_p_lbl 862007 `"Bolívar [State: Venezuela]"', add
label define geomig1_p_lbl 862008 `"Carabobo [State: Venezuela]"', add
label define geomig1_p_lbl 862009 `"Cojedes [State: Venezuela]"', add
label define geomig1_p_lbl 862010 `"Amacuros Delta Federal Territory [State: Venezuela]"', add
label define geomig1_p_lbl 862011 `"Falcón [State: Venezuela]"', add
label define geomig1_p_lbl 862012 `"Guárico [State: Venezuela]"', add
label define geomig1_p_lbl 862013 `"Lara [State: Venezuela]"', add
label define geomig1_p_lbl 862014 `"Barinas, Mérida [State: Venezuela]"', add
label define geomig1_p_lbl 862015 `"Miranda [State: Venezuela]"', add
label define geomig1_p_lbl 862016 `"Monagas [State: Venezuela]"', add
label define geomig1_p_lbl 862017 `"Nueva Esparta, Federal Dependencies [State: Venezuela]"', add
label define geomig1_p_lbl 862018 `"Portuguesa [State: Venezuela]"', add
label define geomig1_p_lbl 862019 `"Sucre [State: Venezuela]"', add
label define geomig1_p_lbl 862020 `"Táchira [State: Venezuela]"', add
label define geomig1_p_lbl 862021 `"Trujillo [State: Venezuela]"', add
label define geomig1_p_lbl 862022 `"Yaracuy [State: Venezuela]"', add
label define geomig1_p_lbl 862023 `"Zulia [State: Venezuela]"', add
label define geomig1_p_lbl 862097 `"Foreign country [State: Venezuela]"', add
label define geomig1_p_lbl 862098 `"Unknown [State: Venezuela]"', add
label define geomig1_p_lbl 862099 `"NIU (not in universe) [State: Venezuela]"', add
label values geomig1_p geomig1_p_lbl

label define mig1_p_in_lbl 356028 `"Andhra Pradesh"'
label define mig1_p_in_lbl 356012 `"Arunachal Pradesh"', add
label define mig1_p_in_lbl 356018 `"Assam"', add
label define mig1_p_in_lbl 356010 `"Bihar"', add
label define mig1_p_in_lbl 356024 `"Gujarat"', add
label define mig1_p_in_lbl 356006 `"Haryana"', add
label define mig1_p_in_lbl 356002 `"Himachal Pradesh"', add
label define mig1_p_in_lbl 356001 `"Jammu and Kashmir"', add
label define mig1_p_in_lbl 356029 `"Karnataka"', add
label define mig1_p_in_lbl 356032 `"Kerala"', add
label define mig1_p_in_lbl 356023 `"Madhya Pradesh"', add
label define mig1_p_in_lbl 356027 `"Maharashtra"', add
label define mig1_p_in_lbl 356014 `"Manipur"', add
label define mig1_p_in_lbl 356017 `"Meghalaya"', add
label define mig1_p_in_lbl 356015 `"Mizoram"', add
label define mig1_p_in_lbl 356013 `"Nagaland"', add
label define mig1_p_in_lbl 356021 `"Orissa"', add
label define mig1_p_in_lbl 356003 `"Punjab"', add
label define mig1_p_in_lbl 356008 `"Rajasthan"', add
label define mig1_p_in_lbl 356011 `"Sikkim"', add
label define mig1_p_in_lbl 356033 `"Tamil Nadu"', add
label define mig1_p_in_lbl 356016 `"Tripura"', add
label define mig1_p_in_lbl 356009 `"Uttar Pradesh"', add
label define mig1_p_in_lbl 356019 `"West Bengal"', add
label define mig1_p_in_lbl 356035 `"Andaman and Nicobar Islands"', add
label define mig1_p_in_lbl 356004 `"Chandigarh"', add
label define mig1_p_in_lbl 356026 `"Dadra and Nagar Haveli"', add
label define mig1_p_in_lbl 356030 `"Goa, Daman and Diu"', add
label define mig1_p_in_lbl 356007 `"Delhi"', add
label define mig1_p_in_lbl 356031 `"Lakshadweep"', add
label define mig1_p_in_lbl 356034 `"Pondicherry"', add
label define mig1_p_in_lbl 356097 `"Abroad"', add
label define mig1_p_in_lbl 356098 `"Unknown"', add
label define mig1_p_in_lbl 356099 `"NIU (not in universe)"', add
label values mig1_p_in mig1_p_in_lbl

* save
save ".././output/India", replace

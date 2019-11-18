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
*** Thailand, 1970
********************************************************************************

* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                   ///
  int     country      1-3      ///
  int     year         4-7      ///
  double  sample       8-16     ///
  double  serial       17-28    ///
  double  hhwt         29-36    ///
  long    geolev1      37-42    ///
  long    geo1_th      43-48    ///
  int     geo1_th1970  49-51    ///
  int     geo1_th1980  52-54    ///
  long    geo2_th1970  55-60    ///
  byte    regnth       61-61    ///
  int     pernum       62-65    ///
  double  perwt        66-73    ///
  byte    relate       74-74    ///
  int     related      75-78    ///
  int     age          79-81    ///
  byte    sex          82-82    ///
  byte    nativity     83-83    ///
  long    bplcountry   84-88    ///
  byte    bplth        89-90    ///
  int     occ          91-94    ///
  long    ind          95-99    ///
  byte    classwk      100-100  ///
  int     classwkd     101-103  ///
  byte    migratep     104-105  ///
  long    migctryp     106-110  ///
  long    geomig1_p    111-116  ///
  byte    migyrs1      117-118  ///
  long    mig1_p_th    119-124  ///
  using `".././input/Thailand/ipumsi_00006.dat"'

replace hhwt        = hhwt        / 100
replace perwt       = perwt       / 100

format sample      %9.0g
format serial      %12.0g
format hhwt        %8.2f
format perwt       %8.2f

label var country     `"Country"'
label var year        `"Year"'
label var sample      `"IPUMS sample identifier"'
label var serial      `"Household serial number"'
label var hhwt        `"Household weight"'
label var geolev1     `"1st subnational geographic level, world [consistent boundaries over time]"'
label var geo1_th     `"Thailand, Province 1970 - 2000 [Level 1; consistent boundaries, GIS]"'
label var geo1_th1970 `"Thailand, Province 1970 [Level 1, GIS]"'
label var geo1_th1980 `"Thailand, Province 1980 [Level 1, GIS]"'
label var geo2_th1970 `"Thailand, District 1970 [Level 2, GIS]"'
label var regnth      `"Thailand, Region"'
label var pernum      `"Person number"'
label var perwt       `"Person weight"'
label var relate      `"Relationship to household head [general version]"'
label var related     `"Relationship to household head [detailed version]"'
label var age         `"Age"'
label var sex         `"Sex"'
label var nativity    `"Nativity status"'
label var bplcountry  `"Country of birth"'
label var bplth       `"Province of birth, Thailand"'
label var occ         `"Occupation, unrecoded"'
label var ind         `"Industry, unrecoded"'
label var classwk     `"Status in employment (class of worker) [general version]"'
label var classwkd    `"Status in employment (class of worker) [detailed version]"'
label var migratep    `"Migration status, previous residence"'
label var migctryp    `"Country of previous residence"'
label var geomig1_p   `"1st subnational geographic level of previous residence, world [consistent bounda"'
label var migyrs1     `"Years residing in current locality"'
label var mig1_p_th   `"Province of previous residence, Thailand; consistent boundaries, GIS"'

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

label define geo1_th_lbl 764010 `"Bangkok"'
label define geo1_th_lbl 764011 `"Samut Prakan"', add
label define geo1_th_lbl 764012 `"Nonthaburi"', add
label define geo1_th_lbl 764013 `"Pathum Thani"', add
label define geo1_th_lbl 764014 `"Phra Nakhon Si Ayutthaya"', add
label define geo1_th_lbl 764015 `"Ang Thong"', add
label define geo1_th_lbl 764016 `"Lop Buri"', add
label define geo1_th_lbl 764017 `"Sing Buri"', add
label define geo1_th_lbl 764018 `"Chai Nat"', add
label define geo1_th_lbl 764019 `"Sa Kaeo, Prachin Buri"', add
label define geo1_th_lbl 764020 `"Chon Buri"', add
label define geo1_th_lbl 764021 `"Rayong"', add
label define geo1_th_lbl 764022 `"Chanthaburi"', add
label define geo1_th_lbl 764023 `"Trat"', add
label define geo1_th_lbl 764024 `"Chachoengsao"', add
label define geo1_th_lbl 764026 `"Nakhon Nayok"', add
label define geo1_th_lbl 764027 `"Saraburi"', add
label define geo1_th_lbl 764030 `"Nakhon Ratchasima"', add
label define geo1_th_lbl 764031 `"Buri Ram"', add
label define geo1_th_lbl 764032 `"Surin"', add
label define geo1_th_lbl 764033 `"Si Sa Ket"', add
label define geo1_th_lbl 764034 `"Ubon Ratchathani, Yasothon, Amnat Charoen"', add
label define geo1_th_lbl 764036 `"Chaiyaphum"', add
label define geo1_th_lbl 764039 `"Nong Bua Lam Phu, Udon Thani"', add
label define geo1_th_lbl 764040 `"Khon Kaen"', add
label define geo1_th_lbl 764042 `"Loei"', add
label define geo1_th_lbl 764043 `"Nong Khai"', add
label define geo1_th_lbl 764044 `"Maha Sarakham"', add
label define geo1_th_lbl 764045 `"Roi Et"', add
label define geo1_th_lbl 764046 `"Kalasin"', add
label define geo1_th_lbl 764047 `"Sakon Nakhon"', add
label define geo1_th_lbl 764048 `"Nakhon Phanom, Mukdahan"', add
label define geo1_th_lbl 764050 `"Chiang Mai"', add
label define geo1_th_lbl 764051 `"Lamphun"', add
label define geo1_th_lbl 764052 `"Lampang"', add
label define geo1_th_lbl 764053 `"Uttaradit"', add
label define geo1_th_lbl 764054 `"Phrae"', add
label define geo1_th_lbl 764055 `"Nan"', add
label define geo1_th_lbl 764057 `"Phayao, Chiang Rai"', add
label define geo1_th_lbl 764058 `"Mae Hong Son"', add
label define geo1_th_lbl 764060 `"Nakhon Sawan"', add
label define geo1_th_lbl 764061 `"Uthai Thani"', add
label define geo1_th_lbl 764062 `"Kamphaeng Phet"', add
label define geo1_th_lbl 764063 `"Tak"', add
label define geo1_th_lbl 764064 `"Sukhothai"', add
label define geo1_th_lbl 764065 `"Phitsanulok"', add
label define geo1_th_lbl 764066 `"Phichit"', add
label define geo1_th_lbl 764067 `"Phetchabun"', add
label define geo1_th_lbl 764070 `"Ratchaburi"', add
label define geo1_th_lbl 764071 `"Kanchanaburi"', add
label define geo1_th_lbl 764072 `"Suphanburi"', add
label define geo1_th_lbl 764073 `"Nakhon Pathom"', add
label define geo1_th_lbl 764074 `"Samut Sakhon"', add
label define geo1_th_lbl 764075 `"Samut Songkhram"', add
label define geo1_th_lbl 764076 `"Phetchaburi"', add
label define geo1_th_lbl 764077 `"Prachuap Khiri Khan"', add
label define geo1_th_lbl 764080 `"Nakhon Si Thammarat"', add
label define geo1_th_lbl 764082 `"Phangnga"', add
label define geo1_th_lbl 764083 `"Phuket"', add
label define geo1_th_lbl 764084 `"Krabi, Surat Thani"', add
label define geo1_th_lbl 764086 `"Ranong, Chumphon"', add
label define geo1_th_lbl 764090 `"Songkhla"', add
label define geo1_th_lbl 764091 `"Satun"', add
label define geo1_th_lbl 764092 `"Trang"', add
label define geo1_th_lbl 764093 `"Phatthalung"', add
label define geo1_th_lbl 764094 `"Pattani"', add
label define geo1_th_lbl 764095 `"Yala"', add
label define geo1_th_lbl 764096 `"Narathiwat"', add
label define geo1_th_lbl 764888 `"Waterbody"', add
label values geo1_th geo1_th_lbl

label define geo1_th1970_lbl 001 `"Krabi"'
label define geo1_th1970_lbl 002 `"Kanchanaburi"', add
label define geo1_th1970_lbl 003 `"Kalasin"', add
label define geo1_th1970_lbl 004 `"Kamphaeng Phet"', add
label define geo1_th1970_lbl 005 `"Khon Kaen"', add
label define geo1_th1970_lbl 006 `"Chanthaburi"', add
label define geo1_th1970_lbl 007 `"Chachoengsao"', add
label define geo1_th1970_lbl 008 `"Chon Buri"', add
label define geo1_th1970_lbl 009 `"Chainat"', add
label define geo1_th1970_lbl 010 `"Chaiyaphum"', add
label define geo1_th1970_lbl 011 `"Chumphon"', add
label define geo1_th1970_lbl 012 `"Chiang Rai"', add
label define geo1_th1970_lbl 013 `"Chiang Mai"', add
label define geo1_th1970_lbl 014 `"Trang"', add
label define geo1_th1970_lbl 015 `"Trat"', add
label define geo1_th1970_lbl 016 `"Tak"', add
label define geo1_th1970_lbl 017 `"Thon Buri"', add
label define geo1_th1970_lbl 018 `"Nakhon Nayok"', add
label define geo1_th1970_lbl 019 `"Nakhon Pathom"', add
label define geo1_th1970_lbl 020 `"Nakhon Phanom"', add
label define geo1_th1970_lbl 021 `"Nakhon Ratchasima"', add
label define geo1_th1970_lbl 022 `"Nakhon Si Thammarat"', add
label define geo1_th1970_lbl 023 `"Nakhon Sawan"', add
label define geo1_th1970_lbl 024 `"Nonthaburi"', add
label define geo1_th1970_lbl 025 `"Narathiwat"', add
label define geo1_th1970_lbl 026 `"Nan"', add
label define geo1_th1970_lbl 027 `"Buri Ram"', add
label define geo1_th1970_lbl 028 `"Pathum Thani"', add
label define geo1_th1970_lbl 029 `"Prachuap Khiri Khan"', add
label define geo1_th1970_lbl 030 `"Prachin Buri"', add
label define geo1_th1970_lbl 031 `"Pattani"', add
label define geo1_th1970_lbl 032 `"Phra Nakorn (Bangkok)"', add
label define geo1_th1970_lbl 033 `"Ayutthaya"', add
label define geo1_th1970_lbl 034 `"Phang Nga"', add
label define geo1_th1970_lbl 035 `"Phatthalung"', add
label define geo1_th1970_lbl 036 `"Phichit"', add
label define geo1_th1970_lbl 037 `"Phitsanulok"', add
label define geo1_th1970_lbl 038 `"Petchaburi"', add
label define geo1_th1970_lbl 039 `"Petchabun"', add
label define geo1_th1970_lbl 040 `"Phrae"', add
label define geo1_th1970_lbl 041 `"Phuket"', add
label define geo1_th1970_lbl 042 `"Maha Sarakam"', add
label define geo1_th1970_lbl 043 `"Mae Hong Son"', add
label define geo1_th1970_lbl 044 `"Yala"', add
label define geo1_th1970_lbl 045 `"Roi Et"', add
label define geo1_th1970_lbl 046 `"Ranong"', add
label define geo1_th1970_lbl 047 `"Rayong"', add
label define geo1_th1970_lbl 048 `"Ratchaburi"', add
label define geo1_th1970_lbl 049 `"Lop Buri"', add
label define geo1_th1970_lbl 050 `"Lampang"', add
label define geo1_th1970_lbl 051 `"Lamphun"', add
label define geo1_th1970_lbl 052 `"Loei"', add
label define geo1_th1970_lbl 053 `"Si Sa Ket"', add
label define geo1_th1970_lbl 054 `"Sakon Nakhon"', add
label define geo1_th1970_lbl 055 `"Songkhla"', add
label define geo1_th1970_lbl 056 `"Satun"', add
label define geo1_th1970_lbl 057 `"Samut Prakan"', add
label define geo1_th1970_lbl 058 `"Samut Songkhram"', add
label define geo1_th1970_lbl 059 `"Samut Sakhon"', add
label define geo1_th1970_lbl 060 `"Saraburi"', add
label define geo1_th1970_lbl 061 `"Sing Buri"', add
label define geo1_th1970_lbl 062 `"Sukhothai"', add
label define geo1_th1970_lbl 063 `"Suphan Buri"', add
label define geo1_th1970_lbl 064 `"Surat Thani"', add
label define geo1_th1970_lbl 065 `"Surin"', add
label define geo1_th1970_lbl 066 `"Nong Khai"', add
label define geo1_th1970_lbl 067 `"Ang Thong"', add
label define geo1_th1970_lbl 068 `"Udon Thani"', add
label define geo1_th1970_lbl 069 `"Uttaradit"', add
label define geo1_th1970_lbl 070 `"Uthai Thani"', add
label define geo1_th1970_lbl 071 `"Ubon Ratchathani"', add
label define geo1_th1970_lbl 088 `"Waterbody"', add
label values geo1_th1970 geo1_th1970_lbl

label define geo1_th1980_lbl 001 `"Krabi"'
label define geo1_th1980_lbl 002 `"Kanchanaburi"', add
label define geo1_th1980_lbl 003 `"Kalasin"', add
label define geo1_th1980_lbl 004 `"Kamphaeng Phet"', add
label define geo1_th1980_lbl 005 `"Khon Kaen"', add
label define geo1_th1980_lbl 006 `"Chantha Buri"', add
label define geo1_th1980_lbl 007 `"Chchoengsao"', add
label define geo1_th1980_lbl 008 `"Chon Buri"', add
label define geo1_th1980_lbl 009 `"Chainat"', add
label define geo1_th1980_lbl 010 `"Chaiyaphum"', add
label define geo1_th1980_lbl 011 `"Chumphon"', add
label define geo1_th1980_lbl 012 `"Chiang Rai"', add
label define geo1_th1980_lbl 013 `"Chiang Mai"', add
label define geo1_th1980_lbl 014 `"Trang"', add
label define geo1_th1980_lbl 015 `"Trat"', add
label define geo1_th1980_lbl 016 `"Tak"', add
label define geo1_th1980_lbl 017 `"Nakhon Nayok"', add
label define geo1_th1980_lbl 018 `"Nakhon Pathom"', add
label define geo1_th1980_lbl 019 `"Nakhon Phanom"', add
label define geo1_th1980_lbl 020 `"Nakhon Ratchasim"', add
label define geo1_th1980_lbl 021 `"Nakhon Thammarat"', add
label define geo1_th1980_lbl 022 `"Nakhon Sawan"', add
label define geo1_th1980_lbl 023 `"Nonthaburi"', add
label define geo1_th1980_lbl 024 `"Narathiwat"', add
label define geo1_th1980_lbl 025 `"Nan"', add
label define geo1_th1980_lbl 026 `"Buri Ram"', add
label define geo1_th1980_lbl 027 `"Pathum Thani"', add
label define geo1_th1980_lbl 028 `"Khan"', add
label define geo1_th1980_lbl 029 `"Prachin Buri"', add
label define geo1_th1980_lbl 030 `"Pattani"', add
label define geo1_th1980_lbl 031 `"Ayutthaya"', add
label define geo1_th1980_lbl 032 `"Phayao"', add
label define geo1_th1980_lbl 033 `"Phangnga"', add
label define geo1_th1980_lbl 034 `"Phatthalung"', add
label define geo1_th1980_lbl 035 `"Phichit"', add
label define geo1_th1980_lbl 036 `"Phitsanulok"', add
label define geo1_th1980_lbl 037 `"Petchaburi"', add
label define geo1_th1980_lbl 038 `"Petchabun"', add
label define geo1_th1980_lbl 039 `"Phrae"', add
label define geo1_th1980_lbl 040 `"Phuket"', add
label define geo1_th1980_lbl 041 `"Maha Sarakam"', add
label define geo1_th1980_lbl 042 `"Mae Hong Son"', add
label define geo1_th1980_lbl 043 `"Yasothon"', add
label define geo1_th1980_lbl 044 `"Yala"', add
label define geo1_th1980_lbl 045 `"Roi Et"', add
label define geo1_th1980_lbl 046 `"Ranong"', add
label define geo1_th1980_lbl 047 `"Rayong"', add
label define geo1_th1980_lbl 048 `"Ratchaburi"', add
label define geo1_th1980_lbl 049 `"Lop Buri"', add
label define geo1_th1980_lbl 050 `"Lampang"', add
label define geo1_th1980_lbl 051 `"Lam Phun"', add
label define geo1_th1980_lbl 052 `"Loei"', add
label define geo1_th1980_lbl 053 `"Si Sa Ket"', add
label define geo1_th1980_lbl 054 `"Sakon Nakhon"', add
label define geo1_th1980_lbl 055 `"Songkhla"', add
label define geo1_th1980_lbl 056 `"Satun"', add
label define geo1_th1980_lbl 057 `"Samut Prakan"', add
label define geo1_th1980_lbl 058 `"Samut Songkhram"', add
label define geo1_th1980_lbl 059 `"Samut Sakhon"', add
label define geo1_th1980_lbl 060 `"Saraburi"', add
label define geo1_th1980_lbl 061 `"Sing Buri"', add
label define geo1_th1980_lbl 062 `"Sukhothai"', add
label define geo1_th1980_lbl 063 `"Suphan Buri"', add
label define geo1_th1980_lbl 064 `"Surat Thani"', add
label define geo1_th1980_lbl 065 `"Surin"', add
label define geo1_th1980_lbl 066 `"Nong Kai"', add
label define geo1_th1980_lbl 067 `"Ang Thong"', add
label define geo1_th1980_lbl 068 `"Udon Thani"', add
label define geo1_th1980_lbl 069 `"Uttaradit"', add
label define geo1_th1980_lbl 070 `"Uthai Thani"', add
label define geo1_th1980_lbl 071 `"Ubon Ratchathani"', add
label define geo1_th1980_lbl 072 `"Phra Nakorn"', add
label define geo1_th1980_lbl 088 `"Waterbody"', add
label values geo1_th1980 geo1_th1980_lbl

label define geo2_th1970_lbl 001001 `"Krabi"'
label define geo2_th1970_lbl 001003 `"Khao Phanom"', add
label define geo2_th1970_lbl 001099 `"Krabi province, district unknown"', add
label define geo2_th1970_lbl 002001 `"Kanchanaburi"', add
label define geo2_th1970_lbl 002003 `"Tha Maka"', add
label define geo2_th1970_lbl 002006 `"Bo Phloi"', add
label define geo2_th1970_lbl 002009 `"Sangkhla Buri"', add
label define geo2_th1970_lbl 002099 `"Kanchanaburi province, district unknown"', add
label define geo2_th1970_lbl 003001 `"Kalasin"', add
label define geo2_th1970_lbl 003002 `"Kamalasai"', add
label define geo2_th1970_lbl 003004 `"Tha Khanto"', add
label define geo2_th1970_lbl 003005 `"Yang Talat"', add
label define geo2_th1970_lbl 003006 `"Somdet"', add
label define geo2_th1970_lbl 003007 `"Sahatsakhan"', add
label define geo2_th1970_lbl 003008 `"Khao Wong"', add
label define geo2_th1970_lbl 003099 `"Kalasin province, district unknown"', add
label define geo2_th1970_lbl 004001 `"Kamphaengphet"', add
label define geo2_th1970_lbl 004002 `"Khanu Woralaksaburi"', add
label define geo2_th1970_lbl 004003 `"Khlong Khlung"', add
label define geo2_th1970_lbl 004004 `"Phran Kuatai"', add
label define geo2_th1970_lbl 005001 `"Khon Kaen"', add
label define geo2_th1970_lbl 005002 `"Kranuan"', add
label define geo2_th1970_lbl 005003 `"Chonnabot"', add
label define geo2_th1970_lbl 005004 `"Chum Phae"', add
label define geo2_th1970_lbl 005005 `"Nam Phong"', add
label define geo2_th1970_lbl 005006 `"Ban Phai"', add
label define geo2_th1970_lbl 005007 `"Phon"', add
label define geo2_th1970_lbl 005008 `"Phu Wiang"', add
label define geo2_th1970_lbl 005009 `"Mancha Khiri"', add
label define geo2_th1970_lbl 005011 `"Nong Rua"', add
label define geo2_th1970_lbl 005012 `"Nong Song Hong"', add
label define geo2_th1970_lbl 005099 `"Khon Kaen province, district unknown"', add
label define geo2_th1970_lbl 006001 `"Mueang Chanthaburi"', add
label define geo2_th1970_lbl 006002 `"Khlung"', add
label define geo2_th1970_lbl 006003 `"Tha mai"', add
label define geo2_th1970_lbl 006004 `"Pong Nam Ron"', add
label define geo2_th1970_lbl 006006 `"Laem Sing"', add
label define geo2_th1970_lbl 006099 `"Chanthaburi province, district unknown"', add
label define geo2_th1970_lbl 007001 `"Chachoengsao"', add
label define geo2_th1970_lbl 007002 `"Bang Khla"', add
label define geo2_th1970_lbl 007003 `"Bang Nam Prieo"', add
label define geo2_th1970_lbl 007004 `"Bang Pakong"', add
label define geo2_th1970_lbl 007005 `"Ban Pho"', add
label define geo2_th1970_lbl 007007 `"Sanam Chai Khet"', add
label define geo2_th1970_lbl 007099 `"Chachoengsao province, district unknown"', add
label define geo2_th1970_lbl 008001 `"Mueang Chon Buri"', add
label define geo2_th1970_lbl 008003 `"Bang Lamung"', add
label define geo2_th1970_lbl 008005 `"Phanat Nikhom"', add
label define geo2_th1970_lbl 008007 `"Si racha"', add
label define geo2_th1970_lbl 008099 `"Chon Buri province, district unknown"', add
label define geo2_th1970_lbl 009001 `"Mueang Chai Nat"', add
label define geo2_th1970_lbl 009002 `"Manorom"', add
label define geo2_th1970_lbl 009004 `"Sankhaburi"', add
label define geo2_th1970_lbl 009005 `"Sapphaya"', add
label define geo2_th1970_lbl 009006 `"Hankha, Wat Sing"', add
label define geo2_th1970_lbl 010001 `"Mueang Chaiyaphum"', add
label define geo2_th1970_lbl 010002 `"Kaset Sombun"', add
label define geo2_th1970_lbl 010003 `"Kaeng Khro"', add
label define geo2_th1970_lbl 010005 `"Khon San"', add
label define geo2_th1970_lbl 010006 `"Chatturat"', add
label define geo2_th1970_lbl 010008 `"Ban Thaen"', add
label define geo2_th1970_lbl 010010 `"Phu Khieo"', add
label define geo2_th1970_lbl 010099 `"Chaiyaphum province, district unknown"', add
label define geo2_th1970_lbl 011001 `"Mueang Chumphon"', add
label define geo2_th1970_lbl 011002 `"Tha Sae"', add
label define geo2_th1970_lbl 011005 `"La-Un, Sawi"', add
label define geo2_th1970_lbl 011006 `"Lang Suan"', add
label define geo2_th1970_lbl 011099 `"Chumphon province, district unknown"', add
label define geo2_th1970_lbl 012001 `"Chiang Rai"', add
label define geo2_th1970_lbl 012003 `"Chiang Khong"', add
label define geo2_th1970_lbl 012004 `"Chiang Kham"', add
label define geo2_th1970_lbl 012006 `"Dok Kham Tai"', add
label define geo2_th1970_lbl 012007 `"Chiang Saen"', add
label define geo2_th1970_lbl 012009 `"Phayao"', add
label define geo2_th1970_lbl 012010 `"Phan"', add
label define geo2_th1970_lbl 012011 `"Mae Chai"', add
label define geo2_th1970_lbl 012012 `"Mae Chan"', add
label define geo2_th1970_lbl 012014 `"Mae Suai"', add
label define geo2_th1970_lbl 012015 `"Wieng Pa Pao"', add
label define geo2_th1970_lbl 012099 `"Chiang Rai province, district unknown"', add
label define geo2_th1970_lbl 013001 `"Chiang Mai"', add
label define geo2_th1970_lbl 013002 `"Chom Thong"', add
label define geo2_th1970_lbl 013003 `"Chiang Dao"', add
label define geo2_th1970_lbl 013005 `"Fang"', add
label define geo2_th1970_lbl 013006 `"Phrao"', add
label define geo2_th1970_lbl 013007 `"Mae Cham"', add
label define geo2_th1970_lbl 013009 `"Mae Rim"', add
label define geo2_th1970_lbl 013011 `"Samoeng"', add
label define geo2_th1970_lbl 013012 `"Saraphi"', add
label define geo2_th1970_lbl 013013 `"San Kamphaeng"', add
label define geo2_th1970_lbl 013015 `"San Pa Tong"', add
label define geo2_th1970_lbl 013016 `"Hang dong"', add
label define geo2_th1970_lbl 013017 `"Omkoi"', add
label define geo2_th1970_lbl 013018 `"Hot"', add
label define geo2_th1970_lbl 013099 `"Chiang Mai province, district unknown"', add
label define geo2_th1970_lbl 014001 `"Trang"', add
label define geo2_th1970_lbl 014002 `"Kantang"', add
label define geo2_th1970_lbl 014003 `"Palian"', add
label define geo2_th1970_lbl 014005 `"Sikao"', add
label define geo2_th1970_lbl 014006 `"Wang Wiset"', add
label define geo2_th1970_lbl 014099 `"Trang province, district unknown"', add
label define geo2_th1970_lbl 015099 `"Trat province, district unknown"', add
label define geo2_th1970_lbl 016001 `"Mueang Tak"', add
label define geo2_th1970_lbl 016003 `"Ban Tak"', add
label define geo2_th1970_lbl 016005 `"Mae Sot"', add
label define geo2_th1970_lbl 016099 `"Tak province, district unknown"', add
label define geo2_th1970_lbl 017001 `"Mueang Thon Buri"', add
label define geo2_th1970_lbl 017002 `"Khlong San"', add
label define geo2_th1970_lbl 017003 `"Bangkok Yai"', add
label define geo2_th1970_lbl 017004 `"Bangkok Noi"', add
label define geo2_th1970_lbl 017005 `"Taling Chan"', add
label define geo2_th1970_lbl 017006 `"Bang Khun Thian"', add
label define geo2_th1970_lbl 017007 `"Phasi Charoen"', add
label define geo2_th1970_lbl 017099 `"Thon Buri province, district unknown"', add
label define geo2_th1970_lbl 018001 `"Nakhon Nayok"', add
label define geo2_th1970_lbl 018002 `"Ban Na"', add
label define geo2_th1970_lbl 018004 `"Ongkharak"', add
label define geo2_th1970_lbl 018099 `"Nakhon Nayok province, district unknown"', add
label define geo2_th1970_lbl 019001 `"Nakhon Pathom"', add
label define geo2_th1970_lbl 019002 `"Kamphaeng Saen"', add
label define geo2_th1970_lbl 019003 `"Don Tum"', add
label define geo2_th1970_lbl 019004 `"Nakhon Chaisi"', add
label define geo2_th1970_lbl 019005 `"Bang Len"', add
label define geo2_th1970_lbl 019006 `"Sam Phran"', add
label define geo2_th1970_lbl 020001 `"Nakhon Phanom"', add
label define geo2_th1970_lbl 020002 `"Khameha-i"', add
label define geo2_th1970_lbl 020003 `"Don Tan"', add
label define geo2_th1970_lbl 020004 `"Tha Uthen"', add
label define geo2_th1970_lbl 020005 `"That Phanom"', add
label define geo2_th1970_lbl 020006 `"Na Kae"', add
label define geo2_th1970_lbl 020007 `"Ban Phaeng"', add
label define geo2_th1970_lbl 020009 `"Si Songkhram"', add
label define geo2_th1970_lbl 020010 `"Mukdahan"', add
label define geo2_th1970_lbl 021006 `"Chakkarat"', add
label define geo2_th1970_lbl 021007 `"Chok chai"', add
label define geo2_th1970_lbl 021008 `"Chum Phuang"', add
label define geo2_th1970_lbl 021009 `"Dan Khun Thot"', add
label define geo2_th1970_lbl 021010 `"Non Thai"', add
label define geo2_th1970_lbl 021011 `"Non Sung"', add
label define geo2_th1970_lbl 021012 `"Bua Yai"', add
label define geo2_th1970_lbl 021013 `"Pak Thong Chai"', add
label define geo2_th1970_lbl 021014 `"Prathai"', add
label define geo2_th1970_lbl 021015 `"Pak Chong"', add
label define geo2_th1970_lbl 021016 `"Phimai"', add
label define geo2_th1970_lbl 021017 `"Sikhiu"', add
label define geo2_th1970_lbl 021018 `"Sung Noen"', add
label define geo2_th1970_lbl 021099 `"Nakhon Ratchasima province, district unknown"', add
label define geo2_th1970_lbl 022001 `"Nakhon Si Thammarat"', add
label define geo2_th1970_lbl 022003 `"Chawang"', add
label define geo2_th1970_lbl 022005 `"Chian Yai"', add
label define geo2_th1970_lbl 022006 `"Tha Sala"', add
label define geo2_th1970_lbl 022007 `"Thung Song"', add
label define geo2_th1970_lbl 022009 `"Pak Phanang"', add
label define geo2_th1970_lbl 022012 `"Sichon"', add
label define geo2_th1970_lbl 022099 `"Nakhon Si Thammarat province, district unknown"', add
label define geo2_th1970_lbl 023001 `"Nakhon Sawan"', add
label define geo2_th1970_lbl 023003 `"Chumsaeng"', add
label define geo2_th1970_lbl 023004 `"Takhli"', add
label define geo2_th1970_lbl 023005 `"Tha Tako"', add
label define geo2_th1970_lbl 023006 `"Banphot Phisai"', add
label define geo2_th1970_lbl 023007 `"Phayuha Khiri"', add
label define geo2_th1970_lbl 023009 `"Lat Yao"', add
label define geo2_th1970_lbl 023010 `"Nong Bua"', add
label define geo2_th1970_lbl 023099 `"Nakhon Sawan province, district unknown"', add
label define geo2_th1970_lbl 024001 `"Nonthaburi"', add
label define geo2_th1970_lbl 024002 `"Sai Noi"', add
label define geo2_th1970_lbl 024004 `"Bang Bua Thong"', add
label define geo2_th1970_lbl 024005 `"Bang Yai"', add
label define geo2_th1970_lbl 024099 `"Nonthaburi province, district unknown"', add
label define geo2_th1970_lbl 025001 `"Narathiwat"', add
label define geo2_th1970_lbl 025002 `"Tak Bai"', add
label define geo2_th1970_lbl 025005 `"Rangae"', add
label define geo2_th1970_lbl 025007 `"Waeng"', add
label define geo2_th1970_lbl 025008 `"Su-ngai Kolok"', add
label define geo2_th1970_lbl 025099 `"Narathiwat province, district unknown"', add
label define geo2_th1970_lbl 026001 `"Nan"', add
label define geo2_th1970_lbl 026002 `"Chiang Klang"', add
label define geo2_th1970_lbl 026004 `"Thung Chang"', add
label define geo2_th1970_lbl 026006 `"Pua"', add
label define geo2_th1970_lbl 026007 `"Wiang Sa"', add
label define geo2_th1970_lbl 026099 `"Nan province, district unknown"', add
label define geo2_th1970_lbl 027001 `"Buri Ram"', add
label define geo2_th1970_lbl 027002 `"Krasang"', add
label define geo2_th1970_lbl 027003 `"Nang Rong"', add
label define geo2_th1970_lbl 027005 `"Prakhon Chai"', add
label define geo2_th1970_lbl 027006 `"Phutthaisong"', add
label define geo2_th1970_lbl 027008 `"Lam Plai Mat"', add
label define geo2_th1970_lbl 027009 `"Satuk"', add
label define geo2_th1970_lbl 027010 `"Ku Muang"', add
label define geo2_th1970_lbl 027099 `"Buri Ram province, district unknown"', add
label define geo2_th1970_lbl 028001 `"Pathum Thani"', add
label define geo2_th1970_lbl 028002 `"Klong Luang"', add
label define geo2_th1970_lbl 028004 `"Lat Lum kaeo"', add
label define geo2_th1970_lbl 028005 `"Lam Luk Ka"', add
label define geo2_th1970_lbl 028006 `"Sam Khok"', add
label define geo2_th1970_lbl 028099 `"Pathum Thani province, district unknown"', add
label define geo2_th1970_lbl 029001 `"Prachuap Khiri Khan"', add
label define geo2_th1970_lbl 029004 `"Bang Saphan"', add
label define geo2_th1970_lbl 029006 `"Hua Hin"', add
label define geo2_th1970_lbl 029099 `"Prachuap Khiri Khan province, district unknown"', add
label define geo2_th1970_lbl 030001 `"Prachin Buri"', add
label define geo2_th1970_lbl 030002 `"Kabin Buri"', add
label define geo2_th1970_lbl 030004 `"Ban Sang"', add
label define geo2_th1970_lbl 030005 `"Prachantakham"', add
label define geo2_th1970_lbl 030006 `"Watana Nakhon"', add
label define geo2_th1970_lbl 030008 `"Sa Kaeo"', add
label define geo2_th1970_lbl 030009 `"Aranyaprathet"', add
label define geo2_th1970_lbl 030099 `"Prachin Buri province, district unknown"', add
label define geo2_th1970_lbl 031001 `"Pattani"', add
label define geo2_th1970_lbl 031002 `"Khok Pho"', add
label define geo2_th1970_lbl 031004 `"Mayo"', add
label define geo2_th1970_lbl 031006 `"Yaring"', add
label define geo2_th1970_lbl 031007 `"Sai Buri"', add
label define geo2_th1970_lbl 031099 `"Pattani province, district unknown"', add
label define geo2_th1970_lbl 032001 `"Phra Nakorn"', add
label define geo2_th1970_lbl 032002 `"Dusit"', add
label define geo2_th1970_lbl 032003 `"Bang Rak"', add
label define geo2_th1970_lbl 032004 `"Pathum Wan"', add
label define geo2_th1970_lbl 032005 `"Pom Prab Sattru Phai"', add
label define geo2_th1970_lbl 032006 `"Phaya Thai"', add
label define geo2_th1970_lbl 032007 `"Yan Nawa"', add
label define geo2_th1970_lbl 032008 `"Sam Phan Thawong"', add
label define geo2_th1970_lbl 032009 `"Bang Kapi"', add
label define geo2_th1970_lbl 032010 `"Bang Khen"', add
label define geo2_th1970_lbl 032011 `"Phra Khanong"', add
label define geo2_th1970_lbl 032012 `"Min Buri"', add
label define geo2_th1970_lbl 032014 `"Nong Chok"', add
label define geo2_th1970_lbl 032099 `"Phra Nakorn (Bangkok) province, district unknown"', add
label define geo2_th1970_lbl 033001 `"Phra Nakhon Si Ayuttaya"', add
label define geo2_th1970_lbl 033002 `"Tha Rua"', add
label define geo2_th1970_lbl 033004 `"Bang Sai"', add
label define geo2_th1970_lbl 033005 `"Bang Srai"', add
label define geo2_th1970_lbl 033015 `"Sena"', add
label define geo2_th1970_lbl 033016 `"Uthai"', add
label define geo2_th1970_lbl 033099 `"Ayutthaya province, district unknown, district unknown"', add
label define geo2_th1970_lbl 034001 `"Phangnga"', add
label define geo2_th1970_lbl 034005 `"Takua Thung"', add
label define geo2_th1970_lbl 034006 `"Takua Pa"', add
label define geo2_th1970_lbl 034099 `"Phang Nga province, district unknown"', add
label define geo2_th1970_lbl 035099 `"Phatthalung province, district unknown, district unknown"', add
label define geo2_th1970_lbl 036001 `"Phichit"', add
label define geo2_th1970_lbl 036002 `"Taphan Hin"', add
label define geo2_th1970_lbl 036003 `"Bang Mun Nak"', add
label define geo2_th1970_lbl 036005 `"Pho Prathap Chang"', add
label define geo2_th1970_lbl 036006 `"Sam Ngam"', add
label define geo2_th1970_lbl 036099 `"Phichit province, district unknown"', add
label define geo2_th1970_lbl 037001 `"Phitsanulok"', add
label define geo2_th1970_lbl 037003 `"Nakhon Thai"', add
label define geo2_th1970_lbl 037005 `"Bang Rakam"', add
label define geo2_th1970_lbl 037006 `"Phrom Phiram"', add
label define geo2_th1970_lbl 037007 `"Wang Thong"', add
label define geo2_th1970_lbl 037099 `"Phitsanulok province, district unknown"', add
label define geo2_th1970_lbl 038001 `"Phetchaburi"', add
label define geo2_th1970_lbl 038003 `"Cha-am"', add
label define geo2_th1970_lbl 038004 `"Tha Yang"', add
label define geo2_th1970_lbl 038005 `"Ban Lat"', add
label define geo2_th1970_lbl 038099 `"Petchaburi province, district unknown"', add
label define geo2_th1970_lbl 039001 `"Phetchabun"', add
label define geo2_th1970_lbl 039003 `"Wichian Buri"', add
label define geo2_th1970_lbl 039005 `"Lom Kao"', add
label define geo2_th1970_lbl 039006 `"Lom Sak"', add
label define geo2_th1970_lbl 039099 `"Petchabun province, district unknown"', add
label define geo2_th1970_lbl 040001 `"Phrae"', add
label define geo2_th1970_lbl 040002 `"Den Chai"', add
label define geo2_th1970_lbl 040004 `"Long"', add
label define geo2_th1970_lbl 040006 `"Song"', add
label define geo2_th1970_lbl 040099 `"Phrae province, district unknown"', add
label define geo2_th1970_lbl 041001 `"Phuket"', add
label define geo2_th1970_lbl 041003 `"Thalang"', add
label define geo2_th1970_lbl 041099 `"Phuket province, district unknown"', add
label define geo2_th1970_lbl 042001 `"Maha Sarakam"', add
label define geo2_th1970_lbl 042002 `"Kantharawichai"', add
label define geo2_th1970_lbl 042003 `"Kosum phisai"', add
label define geo2_th1970_lbl 042004 `"Chiang Yun"', add
label define geo2_th1970_lbl 042005 `"Na Chuak"', add
label define geo2_th1970_lbl 042006 `"Borabu"', add
label define geo2_th1970_lbl 042007 `"Phayakkhaphum Phisai"', add
label define geo2_th1970_lbl 042008 `"Wapi Pathum"', add
label define geo2_th1970_lbl 042009 `"Na Dun"', add
label define geo2_th1970_lbl 043002 `"Khun Yuam, Mae Hong Son"', add
label define geo2_th1970_lbl 043005 `"Mae Sariang"', add
label define geo2_th1970_lbl 043099 `"Mae Hong Son province, district unknown"', add
label define geo2_th1970_lbl 044001 `"Yala"', add
label define geo2_th1970_lbl 044002 `"Betong"', add
label define geo2_th1970_lbl 044005 `"Raman"', add
label define geo2_th1970_lbl 044099 `"Yala province, district unknown"', add
label define geo2_th1970_lbl 045001 `"Roi Et"', add
label define geo2_th1970_lbl 045002 `"Kaset Wisai"', add
label define geo2_th1970_lbl 045003 `"Chaturaphak Phiman"', add
label define geo2_th1970_lbl 045004 `"Thawatchaburi"', add
label define geo2_th1970_lbl 045005 `"Pathum Rat"', add
label define geo2_th1970_lbl 045006 `"Phanom Phrai"', add
label define geo2_th1970_lbl 045007 `"Phon Thong"', add
label define geo2_th1970_lbl 045008 `"Suwannaphum"', add
label define geo2_th1970_lbl 045009 `"Selaphum"', add
label define geo2_th1970_lbl 045010 `"Nong Phok"', add
label define geo2_th1970_lbl 045011 `"At Samat"', add
label define geo2_th1970_lbl 046001 `"Ranong, Kapoe"', add
label define geo2_th1970_lbl 046099 `"Ranong province, district unknown"', add
label define geo2_th1970_lbl 047001 `"Rayong"', add
label define geo2_th1970_lbl 047003 `"Ban Khai"', add
label define geo2_th1970_lbl 047099 `"Rayong province, district unknown"', add
label define geo2_th1970_lbl 048001 `"Ratchaburi"', add
label define geo2_th1970_lbl 048003 `"Damnoen Saduak"', add
label define geo2_th1970_lbl 048004 `"Ban Pong"', add
label define geo2_th1970_lbl 048005 `"Bang Phae"', add
label define geo2_th1970_lbl 048007 `"Photharam"', add
label define geo2_th1970_lbl 048099 `"Ratchaburi province, district unknown"', add
label define geo2_th1970_lbl 049001 `"Lop Buri"', add
label define geo2_th1970_lbl 049002 `"Khok Samrong"', add
label define geo2_th1970_lbl 049003 `"Chai Badan"', add
label define geo2_th1970_lbl 049004 `"Tha Wung"', add
label define geo2_th1970_lbl 049005 `"Ban Mi"', add
label define geo2_th1970_lbl 049099 `"Lop Buri province, district unknown"', add
label define geo2_th1970_lbl 050001 `"Lampang"', add
label define geo2_th1970_lbl 050002 `"Ko Kha"', add
label define geo2_th1970_lbl 050004 `"Chae Hom"', add
label define geo2_th1970_lbl 050005 `"Thoen"', add
label define geo2_th1970_lbl 050008 `"Wang Nua"', add
label define geo2_th1970_lbl 050010 `"Hang Chat"', add
label define geo2_th1970_lbl 050099 `"Lampang province, district unknown"', add
label define geo2_th1970_lbl 051001 `"Lam Phun"', add
label define geo2_th1970_lbl 051002 `"Ban Hong"', add
label define geo2_th1970_lbl 051004 `"Mae Tha"', add
label define geo2_th1970_lbl 051099 `"Lamphun province, district unknown"', add
label define geo2_th1970_lbl 052001 `"Loei"', add
label define geo2_th1970_lbl 052002 `"Chiang Khan"', add
label define geo2_th1970_lbl 052003 `"Dan Sai"', add
label define geo2_th1970_lbl 052006 `"Phu Kradung"', add
label define geo2_th1970_lbl 052008 `"Wang Saphung"', add
label define geo2_th1970_lbl 052099 `"Loei province, district unknown"', add
label define geo2_th1970_lbl 053001 `"Si Sa Ket"', add
label define geo2_th1970_lbl 053002 `"Kanthararom"', add
label define geo2_th1970_lbl 053003 `"Kantharalak"', add
label define geo2_th1970_lbl 053004 `"Khukhan"', add
label define geo2_th1970_lbl 053005 `"Khun Han"', add
label define geo2_th1970_lbl 053007 `"Rasi Salai"', add
label define geo2_th1970_lbl 053008 `"Uthumphon Phisai"', add
label define geo2_th1970_lbl 053009 `"Phrai Bung"', add
label define geo2_th1970_lbl 053099 `"Si Sa Ket province, district unknown"', add
label define geo2_th1970_lbl 054001 `"Sakon Nakhon"', add
label define geo2_th1970_lbl 054004 `"Ban Muang"', add
label define geo2_th1970_lbl 054006 `"Phanna Nikom"', add
label define geo2_th1970_lbl 054007 `"Wanon niwat"', add
label define geo2_th1970_lbl 054008 `"Waritchaphum"', add
label define geo2_th1970_lbl 054009 `"Sawang Daen Din"', add
label define geo2_th1970_lbl 054010 `"Akat Amnuai"', add
label define geo2_th1970_lbl 054099 `"Sakon Nakhon province, district unknown"', add
label define geo2_th1970_lbl 055001 `"Songkhla"', add
label define geo2_th1970_lbl 055002 `"Chana"', add
label define geo2_th1970_lbl 055003 `"Thepha"', add
label define geo2_th1970_lbl 055004 `"Na Thawi"', add
label define geo2_th1970_lbl 055005 `"Ranot"', add
label define geo2_th1970_lbl 055007 `"Sadao"', add
label define geo2_th1970_lbl 055009 `"Sathing Phra"', add
label define geo2_th1970_lbl 055010 `"Hat Yai"', add
label define geo2_th1970_lbl 055099 `"Songkhla province, district unknown"', add
label define geo2_th1970_lbl 056001 `"Satun"', add
label define geo2_th1970_lbl 056003 `"Khuan Kalong"', add
label define geo2_th1970_lbl 056099 `"Satun province, district unknown"', add
label define geo2_th1970_lbl 057001 `"Samut Prakan"', add
label define geo2_th1970_lbl 057003 `"Bang Phli"', add
label define geo2_th1970_lbl 057004 `"Phra Pradaeng"', add
label define geo2_th1970_lbl 057099 `"Samut Prakan province, district unknown"', add
label define geo2_th1970_lbl 058001 `"Samut Songkhram"', add
label define geo2_th1970_lbl 058002 `"Bang Khonthi"', add
label define geo2_th1970_lbl 058003 `"Amphawa"', add
label define geo2_th1970_lbl 059001 `"Samut Sakhon"', add
label define geo2_th1970_lbl 059002 `"Krathum Baen"', add
label define geo2_th1970_lbl 059003 `"Ban Phaeo"', add
label define geo2_th1970_lbl 060001 `"Saraburi"', add
label define geo2_th1970_lbl 060003 `"Ban Mo"', add
label define geo2_th1970_lbl 060004 `"Phra Phutthabat"', add
label define geo2_th1970_lbl 060006 `"Wihan Daeng"', add
label define geo2_th1970_lbl 060007 `"Sao Hai"', add
label define geo2_th1970_lbl 060008 `"Nong Khae"', add
label define geo2_th1970_lbl 060009 `"Nong Saeng"', add
label define geo2_th1970_lbl 060099 `"Saraburi province, district unknown"', add
label define geo2_th1970_lbl 061001 `"Sing Buri"', add
label define geo2_th1970_lbl 061002 `"Tha Chang"', add
label define geo2_th1970_lbl 061003 `"Bang Rachan"', add
label define geo2_th1970_lbl 061005 `"In Buri"', add
label define geo2_th1970_lbl 061099 `"Sing Buri province, district unknown"', add
label define geo2_th1970_lbl 062001 `"Sukhothai"', add
label define geo2_th1970_lbl 062002 `"Kong krailat"', add
label define geo2_th1970_lbl 062004 `"Thung Saliam"', add
label define geo2_th1970_lbl 062007 `"Si Samrong"', add
label define geo2_th1970_lbl 062008 `"Sawankhalok"', add
label define geo2_th1970_lbl 062099 `"Sukhothai province, district unknown"', add
label define geo2_th1970_lbl 063001 `"Suphan Buri"', add
label define geo2_th1970_lbl 063003 `"Doembang Nangbuat"', add
label define geo2_th1970_lbl 063004 `"Bang Pla Ma"', add
label define geo2_th1970_lbl 063005 `"Si Prachan"', add
label define geo2_th1970_lbl 063007 `"Song Phi Nong"', add
label define geo2_th1970_lbl 063008 `"U Thong"', add
label define geo2_th1970_lbl 063099 `"Suphan Buri province, district unknown"', add
label define geo2_th1970_lbl 064001 `"Phrasaeng"', add
label define geo2_th1970_lbl 064002 `"Surat Thani"', add
label define geo2_th1970_lbl 064004 `"Ko Samui"', add
label define geo2_th1970_lbl 064005 `"Khiri Ratthanikhom"', add
label define geo2_th1970_lbl 064008 `"Tha Chang"', add
label define geo2_th1970_lbl 064009 `"Ban Na San"', add
label define geo2_th1970_lbl 064011 `"Phunphin"', add
label define geo2_th1970_lbl 064013 `"Wiang Sa"', add
label define geo2_th1970_lbl 064099 `"Surat Thani province, district unknown"', add
label define geo2_th1970_lbl 065001 `"Surin"', add
label define geo2_th1970_lbl 065002 `"Chom Phra"', add
label define geo2_th1970_lbl 065003 `"Chumphon Buri"', add
label define geo2_th1970_lbl 065004 `"Tha Tum"', add
label define geo2_th1970_lbl 065005 `"Prasat"', add
label define geo2_th1970_lbl 065006 `"Rattanaburi"', add
label define geo2_th1970_lbl 065007 `"Sikhoraphum"', add
label define geo2_th1970_lbl 065008 `"Sangkha"', add
label define geo2_th1970_lbl 065009 `"Samrong Thap"', add
label define geo2_th1970_lbl 066001 `"Nong Khai"', add
label define geo2_th1970_lbl 066003 `"Tha Bo"', add
label define geo2_th1970_lbl 066004 `"Bung Kan"', add
label define geo2_th1970_lbl 066005 `"Phon Phisai"', add
label define geo2_th1970_lbl 066006 `"Si Chiang Mai"', add
label define geo2_th1970_lbl 066099 `"Nong Khai province, district unknown"', add
label define geo2_th1970_lbl 067001 `"Ang Thong"', add
label define geo2_th1970_lbl 067002 `"Chai Yo"', add
label define geo2_th1970_lbl 067003 `"Pa Mok"', add
label define geo2_th1970_lbl 067004 `"Pho Thong"', add
label define geo2_th1970_lbl 067005 `"Wiset Chai Chan"', add
label define geo2_th1970_lbl 067007 `"Sawaengha"', add
label define geo2_th1970_lbl 067099 `"Ang Thong province, district unknown"', add
label define geo2_th1970_lbl 068001 `"Udon Thani"', add
label define geo2_th1970_lbl 068002 `"Kumphawapi"', add
label define geo2_th1970_lbl 068004 `"Non Sang"', add
label define geo2_th1970_lbl 068005 `"Ban Dung"', add
label define geo2_th1970_lbl 068006 `"Ban Phu"', add
label define geo2_th1970_lbl 068007 `"Phen"', add
label define geo2_th1970_lbl 068008 `"Si That"', add
label define geo2_th1970_lbl 068010 `"Nong Bua Lam Phu"', add
label define geo2_th1970_lbl 068011 `"Nong Han"', add
label define geo2_th1970_lbl 068099 `"Udon Thani province, district unknown"', add
label define geo2_th1970_lbl 069001 `"Uttaradit"', add
label define geo2_th1970_lbl 069003 `"Tha Pla"', add
label define geo2_th1970_lbl 069005 `"Phi Chai"', add
label define geo2_th1970_lbl 069099 `"Uttaradit province, district unknown"', add
label define geo2_th1970_lbl 070001 `"Uthai thani"', add
label define geo2_th1970_lbl 070002 `"Thap Than"', add
label define geo2_th1970_lbl 070005 `"Nong Khayang"', add
label define geo2_th1970_lbl 070006 `"Nong Chang"', add
label define geo2_th1970_lbl 070099 `"Uthai Thani province, district unknown"', add
label define geo2_th1970_lbl 071001 `"Ubon Ratchathani"', add
label define geo2_th1970_lbl 071003 `"Khemarat"', add
label define geo2_th1970_lbl 071004 `"Khuang Nai"', add
label define geo2_th1970_lbl 071005 `"Si Muang Mai"', add
label define geo2_th1970_lbl 071006 `"Kham Khuan Kaeo"', add
label define geo2_th1970_lbl 071008 `"Det Udom"', add
label define geo2_th1970_lbl 071009 `"Trakan Phutphon"', add
label define geo2_th1970_lbl 071011 `"Ban Dan"', add
label define geo2_th1970_lbl 071014 `"Phana"', add
label define geo2_th1970_lbl 071015 `"Phibun Mangsahan"', add
label define geo2_th1970_lbl 071016 `"Maha Chana Chai"', add
label define geo2_th1970_lbl 071017 `"Muang Samsip"', add
label define geo2_th1970_lbl 071018 `"Yasothon"', add
label define geo2_th1970_lbl 071019 `"Loeng Nok Tha"', add
label define geo2_th1970_lbl 071020 `"Warin Chamrap"', add
label define geo2_th1970_lbl 071021 `"Hua Taphan"', add
label define geo2_th1970_lbl 071022 `"Amnat Charoen"', add
label define geo2_th1970_lbl 071099 `"Ubon Ratchathani province, district unknown"', add
label define geo2_th1970_lbl 088088 `"Waterbody"', add
label values geo2_th1970 geo2_th1970_lbl

label define regnth_lbl 1 `"Bangkok"'
label define regnth_lbl 2 `"Central region (exclude Bangkok )"', add
label define regnth_lbl 3 `"Northern region"', add
label define regnth_lbl 4 `"Northeastern region"', add
label define regnth_lbl 5 `"Southern region"', add
label values regnth regnth_lbl

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

label define nativity_lbl 0 `"NIU (not universe)"'
label define nativity_lbl 1 `"Native-born"', add
label define nativity_lbl 2 `"Foreign-born"', add
label define nativity_lbl 9 `"Unknown/missing"', add
label values nativity nativity_lbl

label define bplcountry_lbl 00000 `"NIU (not in universe)"'
label define bplcountry_lbl 10000 `"Africa"', add
label define bplcountry_lbl 11000 `"Eastern Africa"', add
label define bplcountry_lbl 11010 `"Burundi"', add
label define bplcountry_lbl 11020 `"Comoros"', add
label define bplcountry_lbl 11030 `"Djibouti"', add
label define bplcountry_lbl 11040 `"Eritrea"', add
label define bplcountry_lbl 11050 `"Ethiopia"', add
label define bplcountry_lbl 11051 `"Ethiopia (including Eritrea)"', add
label define bplcountry_lbl 11060 `"Kenya"', add
label define bplcountry_lbl 11070 `"Madagascar"', add
label define bplcountry_lbl 11080 `"Malawi"', add
label define bplcountry_lbl 11090 `"Mauritius"', add
label define bplcountry_lbl 11100 `"Mozambique"', add
label define bplcountry_lbl 11110 `"Reunion"', add
label define bplcountry_lbl 11120 `"Rwanda"', add
label define bplcountry_lbl 11130 `"Seychelles"', add
label define bplcountry_lbl 11140 `"Somalia"', add
label define bplcountry_lbl 11150 `"South Sudan"', add
label define bplcountry_lbl 11160 `"Uganda"', add
label define bplcountry_lbl 11170 `"Tanzania"', add
label define bplcountry_lbl 11180 `"Zambia"', add
label define bplcountry_lbl 11190 `"Zimbabwe"', add
label define bplcountry_lbl 11990 `"Eastern Africa, n.s."', add
label define bplcountry_lbl 12000 `"Middle Africa"', add
label define bplcountry_lbl 12010 `"Angola"', add
label define bplcountry_lbl 12020 `"Cameroon"', add
label define bplcountry_lbl 12030 `"Central African Republic"', add
label define bplcountry_lbl 12040 `"Chad"', add
label define bplcountry_lbl 12050 `"Congo"', add
label define bplcountry_lbl 12060 `"Democratic Republic of Congo"', add
label define bplcountry_lbl 12070 `"Equatorial Guinea"', add
label define bplcountry_lbl 12080 `"Gabon"', add
label define bplcountry_lbl 12090 `"Sao Tome and Principe"', add
label define bplcountry_lbl 12990 `"Middle Africa, n.s."', add
label define bplcountry_lbl 13000 `"Northern Africa"', add
label define bplcountry_lbl 13010 `"Algeria"', add
label define bplcountry_lbl 13011 `"Algeria/Tunisia"', add
label define bplcountry_lbl 13020 `"Egypt"', add
label define bplcountry_lbl 13021 `"Egypt/Sudan"', add
label define bplcountry_lbl 13030 `"Libya"', add
label define bplcountry_lbl 13040 `"Morocco"', add
label define bplcountry_lbl 13050 `"Sudan"', add
label define bplcountry_lbl 13060 `"Tunisia"', add
label define bplcountry_lbl 13070 `"Western Sahara"', add
label define bplcountry_lbl 13990 `"Northern Africa, n.s."', add
label define bplcountry_lbl 14000 `"Southern Africa"', add
label define bplcountry_lbl 14010 `"Botswana"', add
label define bplcountry_lbl 14020 `"Lesotho"', add
label define bplcountry_lbl 14030 `"Namibia"', add
label define bplcountry_lbl 14040 `"South Africa"', add
label define bplcountry_lbl 14050 `"Swaziland"', add
label define bplcountry_lbl 14990 `"Southern Africa, n.s."', add
label define bplcountry_lbl 15000 `"Western Africa"', add
label define bplcountry_lbl 15010 `"Benin"', add
label define bplcountry_lbl 15020 `"Burkina Faso"', add
label define bplcountry_lbl 15021 `"Upper Volta"', add
label define bplcountry_lbl 15030 `"Cape Verde"', add
label define bplcountry_lbl 15040 `"Ivory Coast"', add
label define bplcountry_lbl 15050 `"Gambia"', add
label define bplcountry_lbl 15060 `"Ghana"', add
label define bplcountry_lbl 15070 `"Guinea"', add
label define bplcountry_lbl 15080 `"Guinea-Bissau"', add
label define bplcountry_lbl 15081 `"Guinea-Bissau and Cape Verde"', add
label define bplcountry_lbl 15090 `"Liberia"', add
label define bplcountry_lbl 15100 `"Mali"', add
label define bplcountry_lbl 15110 `"Mauritania"', add
label define bplcountry_lbl 15120 `"Niger"', add
label define bplcountry_lbl 15130 `"Nigeria"', add
label define bplcountry_lbl 15140 `"St. Helena and Ascension"', add
label define bplcountry_lbl 15150 `"Senegal"', add
label define bplcountry_lbl 15160 `"Sierra Leone"', add
label define bplcountry_lbl 15170 `"Togo"', add
label define bplcountry_lbl 15180 `"Canary Islands"', add
label define bplcountry_lbl 15990 `"West Africa, n.s."', add
label define bplcountry_lbl 19990 `"Africa, other and n.s."', add
label define bplcountry_lbl 19991 `"Central and South Africa"', add
label define bplcountry_lbl 19992 `"East and Central Africa"', add
label define bplcountry_lbl 19993 `"Southeastern Africa"', add
label define bplcountry_lbl 19994 `"Saharan Africa"', add
label define bplcountry_lbl 19999 `"Africa, n.s."', add
label define bplcountry_lbl 20000 `"Americas"', add
label define bplcountry_lbl 21000 `"Caribbean"', add
label define bplcountry_lbl 21010 `"Anguilla"', add
label define bplcountry_lbl 21020 `"Antigua-Barbuda"', add
label define bplcountry_lbl 21030 `"Aruba"', add
label define bplcountry_lbl 21040 `"Bahamas"', add
label define bplcountry_lbl 21050 `"Barbados"', add
label define bplcountry_lbl 21060 `"British Virgin Islands"', add
label define bplcountry_lbl 21070 `"Cayman Isles"', add
label define bplcountry_lbl 21080 `"Cuba"', add
label define bplcountry_lbl 21090 `"Dominica"', add
label define bplcountry_lbl 21100 `"Dominican Republic"', add
label define bplcountry_lbl 21110 `"Grenada"', add
label define bplcountry_lbl 21120 `"Guadeloupe"', add
label define bplcountry_lbl 21130 `"Haiti"', add
label define bplcountry_lbl 21140 `"Jamaica"', add
label define bplcountry_lbl 21150 `"Martinique"', add
label define bplcountry_lbl 21160 `"Montserrat"', add
label define bplcountry_lbl 21170 `"Netherlands Antilles"', add
label define bplcountry_lbl 21180 `"Puerto Rico"', add
label define bplcountry_lbl 21190 `"St. Kitts-Nevis"', add
label define bplcountry_lbl 21200 `"St. Croix"', add
label define bplcountry_lbl 21210 `"St. John"', add
label define bplcountry_lbl 21220 `"St. Lucia"', add
label define bplcountry_lbl 21230 `"St Thomas"', add
label define bplcountry_lbl 21240 `"St. Vincent"', add
label define bplcountry_lbl 21250 `"Trinidad and Tobago"', add
label define bplcountry_lbl 21260 `"Turks and Caicos"', add
label define bplcountry_lbl 21270 `"U.S. Virgin Islands"', add
label define bplcountry_lbl 21990 `"Other Caribbean and n.s."', add
label define bplcountry_lbl 21991 `"Caribbean commonwealth, n.s."', add
label define bplcountry_lbl 22000 `"Central America"', add
label define bplcountry_lbl 22010 `"Belize/British Honduras"', add
label define bplcountry_lbl 22020 `"Costa Rica"', add
label define bplcountry_lbl 22030 `"El Salvador"', add
label define bplcountry_lbl 22040 `"Guatemala"', add
label define bplcountry_lbl 22050 `"Honduras"', add
label define bplcountry_lbl 22060 `"Mexico"', add
label define bplcountry_lbl 22070 `"Nicaragua"', add
label define bplcountry_lbl 22080 `"Panama"', add
label define bplcountry_lbl 22081 `"Panama Canal Zone"', add
label define bplcountry_lbl 22990 `"Central America, n.s."', add
label define bplcountry_lbl 22991 `"Central America and Caribbean"', add
label define bplcountry_lbl 23000 `"South America"', add
label define bplcountry_lbl 23010 `"Argentina"', add
label define bplcountry_lbl 23020 `"Bolivia"', add
label define bplcountry_lbl 23030 `"Brazil"', add
label define bplcountry_lbl 23040 `"Chile"', add
label define bplcountry_lbl 23050 `"Colombia"', add
label define bplcountry_lbl 23060 `"Ecuador"', add
label define bplcountry_lbl 23070 `"Falkland Islands"', add
label define bplcountry_lbl 23080 `"French Guiana"', add
label define bplcountry_lbl 23090 `"Guyana/British Guiana"', add
label define bplcountry_lbl 23100 `"Paraguay"', add
label define bplcountry_lbl 23110 `"Peru"', add
label define bplcountry_lbl 23120 `"Suriname"', add
label define bplcountry_lbl 23130 `"Uruguay"', add
label define bplcountry_lbl 23140 `"Venezuela"', add
label define bplcountry_lbl 23990 `"South America, other and n.s."', add
label define bplcountry_lbl 23991 `"South America or Central America, n.s."', add
label define bplcountry_lbl 23992 `"Central/South America and Caribbean"', add
label define bplcountry_lbl 24000 `"North America"', add
label define bplcountry_lbl 24010 `"Bermuda"', add
label define bplcountry_lbl 24020 `"Canada"', add
label define bplcountry_lbl 24030 `"Greenland"', add
label define bplcountry_lbl 24040 `"United States"', add
label define bplcountry_lbl 24990 `"North America, other and n.s."', add
label define bplcountry_lbl 24991 `"North America/Oceania"', add
label define bplcountry_lbl 29990 `"Americas, other and n.s."', add
label define bplcountry_lbl 30000 `"Asia"', add
label define bplcountry_lbl 31000 `"Eastern Asia"', add
label define bplcountry_lbl 31010 `"China"', add
label define bplcountry_lbl 31011 `"Hong Kong"', add
label define bplcountry_lbl 31012 `"Macau"', add
label define bplcountry_lbl 31013 `"Taiwan"', add
label define bplcountry_lbl 31020 `"Japan"', add
label define bplcountry_lbl 31030 `"Korea"', add
label define bplcountry_lbl 31031 `"Korea, DPR (North)"', add
label define bplcountry_lbl 31032 `"Korea, RO (South)"', add
label define bplcountry_lbl 31040 `"Mongolia"', add
label define bplcountry_lbl 31990 `"Eastern Asia, n.s."', add
label define bplcountry_lbl 32000 `"South-Central Asia"', add
label define bplcountry_lbl 32010 `"Afghanistan"', add
label define bplcountry_lbl 32020 `"Bangladesh"', add
label define bplcountry_lbl 32030 `"Bhutan"', add
label define bplcountry_lbl 32040 `"India"', add
label define bplcountry_lbl 32041 `"India/Pakistan"', add
label define bplcountry_lbl 32042 `"India/Pakistan/Bangladesh/Sri Lanka"', add
label define bplcountry_lbl 32050 `"Iran"', add
label define bplcountry_lbl 32060 `"Kazakhstan"', add
label define bplcountry_lbl 32070 `"Kyrgyzstan"', add
label define bplcountry_lbl 32080 `"Maldives"', add
label define bplcountry_lbl 32090 `"Nepal"', add
label define bplcountry_lbl 32100 `"Pakistan"', add
label define bplcountry_lbl 32101 `"Pakistan/Bangladesh"', add
label define bplcountry_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define bplcountry_lbl 32120 `"Tajikistan"', add
label define bplcountry_lbl 32130 `"Turkmenistan"', add
label define bplcountry_lbl 32140 `"Uzbekistan"', add
label define bplcountry_lbl 32999 `"South-Central Asia, n.s."', add
label define bplcountry_lbl 33000 `"South-Eastern Asia"', add
label define bplcountry_lbl 33010 `"Brunei"', add
label define bplcountry_lbl 33020 `"Cambodia (Kampuchea)"', add
label define bplcountry_lbl 33030 `"East Timor"', add
label define bplcountry_lbl 33040 `"Indonesia"', add
label define bplcountry_lbl 33050 `"Laos"', add
label define bplcountry_lbl 33060 `"Malaysia"', add
label define bplcountry_lbl 33070 `"Myanmar (Burma)"', add
label define bplcountry_lbl 33080 `"Philippines"', add
label define bplcountry_lbl 33090 `"Singapore"', add
label define bplcountry_lbl 33100 `"Thailand"', add
label define bplcountry_lbl 33110 `"Vietnam"', add
label define bplcountry_lbl 33990 `"South-Eastern Asia, n.s."', add
label define bplcountry_lbl 34000 `"Western Asia"', add
label define bplcountry_lbl 34010 `"Armenia"', add
label define bplcountry_lbl 34020 `"Azerbaijan"', add
label define bplcountry_lbl 34030 `"Bahrain"', add
label define bplcountry_lbl 34040 `"Cyprus"', add
label define bplcountry_lbl 34050 `"Georgia"', add
label define bplcountry_lbl 34051 `"Abkhazia"', add
label define bplcountry_lbl 34052 `"South Ossetia"', add
label define bplcountry_lbl 34060 `"Iraq"', add
label define bplcountry_lbl 34070 `"Israel"', add
label define bplcountry_lbl 34071 `"Israel/Palestine"', add
label define bplcountry_lbl 34080 `"Jordan"', add
label define bplcountry_lbl 34090 `"Kuwait"', add
label define bplcountry_lbl 34100 `"Lebanon"', add
label define bplcountry_lbl 34110 `"Palestinian Territories"', add
label define bplcountry_lbl 34111 `"West Bank"', add
label define bplcountry_lbl 34112 `"Gaza Strip"', add
label define bplcountry_lbl 34120 `"Oman"', add
label define bplcountry_lbl 34130 `"Qatar"', add
label define bplcountry_lbl 34140 `"Saudi Arabia"', add
label define bplcountry_lbl 34150 `"Syria"', add
label define bplcountry_lbl 34151 `"Syria/Lebanon"', add
label define bplcountry_lbl 34160 `"Turkey"', add
label define bplcountry_lbl 34170 `"United Arab Emirates"', add
label define bplcountry_lbl 34180 `"Yemen"', add
label define bplcountry_lbl 34990 `"Western Asia, n.s."', add
label define bplcountry_lbl 34991 `"Middle East"', add
label define bplcountry_lbl 39990 `"Asia, other and n.s."', add
label define bplcountry_lbl 39991 `"Central Asia and Middle East, n.s."', add
label define bplcountry_lbl 39992 `"Far East, n.s."', add
label define bplcountry_lbl 39993 `"Eastern/Southeast Asia, n.s."', add
label define bplcountry_lbl 39994 `"Asia/Middle East, other and n.s."', add
label define bplcountry_lbl 39995 `"South/Southeast Asia, n.s."', add
label define bplcountry_lbl 40000 `"Europe"', add
label define bplcountry_lbl 41000 `"Eastern Europe"', add
label define bplcountry_lbl 41010 `"Belarus"', add
label define bplcountry_lbl 41020 `"Bulgaria"', add
label define bplcountry_lbl 41021 `"Bulgaria/Greece"', add
label define bplcountry_lbl 41030 `"Czech Republic/Czechoslovakia"', add
label define bplcountry_lbl 41040 `"Hungary"', add
label define bplcountry_lbl 41050 `"Poland"', add
label define bplcountry_lbl 41060 `"Moldova"', add
label define bplcountry_lbl 41070 `"Romania"', add
label define bplcountry_lbl 41080 `"Russia/USSR"', add
label define bplcountry_lbl 41090 `"Slovakia"', add
label define bplcountry_lbl 41100 `"Ukraine"', add
label define bplcountry_lbl 41990 `"Eastern Europe, other and n.s."', add
label define bplcountry_lbl 41991 `"Albania, Bulgaria, Czech, Hungary, Romania, Yugoslavia"', add
label define bplcountry_lbl 41992 `"Central-Eastern Europe"', add
label define bplcountry_lbl 42000 `"Northern Europe"', add
label define bplcountry_lbl 42010 `"Denmark"', add
label define bplcountry_lbl 42020 `"Estonia"', add
label define bplcountry_lbl 42030 `"Faroe Islands"', add
label define bplcountry_lbl 42040 `"Finland"', add
label define bplcountry_lbl 42050 `"Iceland"', add
label define bplcountry_lbl 42060 `"Ireland"', add
label define bplcountry_lbl 42070 `"Latvia"', add
label define bplcountry_lbl 42080 `"Lithuania"', add
label define bplcountry_lbl 42090 `"Norway"', add
label define bplcountry_lbl 42100 `"Svalbard and Jan Mayen Islands"', add
label define bplcountry_lbl 42110 `"Sweden"', add
label define bplcountry_lbl 42120 `"United Kingdom"', add
label define bplcountry_lbl 42990 `"Northern Europe, n.s."', add
label define bplcountry_lbl 43000 `"Southern Europe"', add
label define bplcountry_lbl 43010 `"Albania"', add
label define bplcountry_lbl 43020 `"Andorra"', add
label define bplcountry_lbl 43030 `"Bosnia and Herzegovina"', add
label define bplcountry_lbl 43040 `"Croatia"', add
label define bplcountry_lbl 43050 `"Gibraltar"', add
label define bplcountry_lbl 43060 `"Greece"', add
label define bplcountry_lbl 43070 `"Italy"', add
label define bplcountry_lbl 43071 `"Vatican City"', add
label define bplcountry_lbl 43080 `"Malta"', add
label define bplcountry_lbl 43090 `"Portugal"', add
label define bplcountry_lbl 43100 `"San Marino"', add
label define bplcountry_lbl 43110 `"Slovenia"', add
label define bplcountry_lbl 43120 `"Spain"', add
label define bplcountry_lbl 43121 `"Spain/Portugal"', add
label define bplcountry_lbl 43130 `"Macedonia"', add
label define bplcountry_lbl 43140 `"Yugoslavia"', add
label define bplcountry_lbl 43141 `"Montenegro"', add
label define bplcountry_lbl 43142 `"Serbia"', add
label define bplcountry_lbl 43143 `"Serbia and Montenegro"', add
label define bplcountry_lbl 43144 `"Kosovo"', add
label define bplcountry_lbl 43990 `"Southern Europe, n.s."', add
label define bplcountry_lbl 43991 `"Gibraltar/Malta"', add
label define bplcountry_lbl 43992 `"Portugal/Greece"', add
label define bplcountry_lbl 43993 `"Italy, Holy See, San Marino"', add
label define bplcountry_lbl 44000 `"Western Europe"', add
label define bplcountry_lbl 44010 `"Austria"', add
label define bplcountry_lbl 44020 `"Belgium"', add
label define bplcountry_lbl 44021 `"Belgium/Luxemburg"', add
label define bplcountry_lbl 44022 `"Belgium/Netherlands/Luxemburg"', add
label define bplcountry_lbl 44030 `"France"', add
label define bplcountry_lbl 44040 `"Germany"', add
label define bplcountry_lbl 44041 `"Germany/Austria"', add
label define bplcountry_lbl 44042 `"West Germany"', add
label define bplcountry_lbl 44043 `"Mecklenburg-Schwerin"', add
label define bplcountry_lbl 44050 `"Liechtenstein"', add
label define bplcountry_lbl 44060 `"Luxembourg"', add
label define bplcountry_lbl 44070 `"Monaco"', add
label define bplcountry_lbl 44080 `"Netherlands"', add
label define bplcountry_lbl 44090 `"Switzerland"', add
label define bplcountry_lbl 44990 `"Western Europe, n.s."', add
label define bplcountry_lbl 44991 `"Belgium, Denmark, Luxembourg, Netherlands"', add
label define bplcountry_lbl 49991 `"Turkey and U.S.S.R."', add
label define bplcountry_lbl 49992 `"European Union"', add
label define bplcountry_lbl 49993 `"European Union (original 15)"', add
label define bplcountry_lbl 49994 `"Other European Union (not original 15)"', add
label define bplcountry_lbl 49995 `"EEA, Switzerland, associated microstates"', add
label define bplcountry_lbl 49999 `"Europe, other and n.s."', add
label define bplcountry_lbl 50000 `"Oceania"', add
label define bplcountry_lbl 51000 `"Australia and New Zealand"', add
label define bplcountry_lbl 51010 `"Australia"', add
label define bplcountry_lbl 51020 `"New Zealand"', add
label define bplcountry_lbl 51030 `"Norfolk Islands"', add
label define bplcountry_lbl 51999 `"Australia and New Zealand, n.s."', add
label define bplcountry_lbl 52000 `"Melanesia"', add
label define bplcountry_lbl 52010 `"Fiji"', add
label define bplcountry_lbl 52020 `"New Caledonia"', add
label define bplcountry_lbl 52030 `"Papua New Guinea"', add
label define bplcountry_lbl 52040 `"Solomon Islands"', add
label define bplcountry_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define bplcountry_lbl 52999 `"Melanesia, n.s."', add
label define bplcountry_lbl 53000 `"Micronesia"', add
label define bplcountry_lbl 53010 `"Kiribati"', add
label define bplcountry_lbl 53020 `"Marshall Islands"', add
label define bplcountry_lbl 53030 `"Nauru"', add
label define bplcountry_lbl 53040 `"Northern Mariana Isls."', add
label define bplcountry_lbl 53050 `"Palau"', add
label define bplcountry_lbl 53990 `"Micronesia, n.e.c."', add
label define bplcountry_lbl 54000 `"Polynesia"', add
label define bplcountry_lbl 54010 `"Cook Islands"', add
label define bplcountry_lbl 54020 `"French Polynesia"', add
label define bplcountry_lbl 54030 `"Niue"', add
label define bplcountry_lbl 54040 `"Pitcairn Island"', add
label define bplcountry_lbl 54050 `"Samoa"', add
label define bplcountry_lbl 54060 `"Eastern Samoa"', add
label define bplcountry_lbl 54070 `"Tokelau"', add
label define bplcountry_lbl 54080 `"Tonga"', add
label define bplcountry_lbl 54090 `"Tuvalu"', add
label define bplcountry_lbl 54100 `"Wallis and Futuna Isls."', add
label define bplcountry_lbl 54990 `"Polynesia, n.s."', add
label define bplcountry_lbl 55000 `"U.S. Pacific Possessions"', add
label define bplcountry_lbl 55010 `"American Samoa"', add
label define bplcountry_lbl 55020 `"Baker Island"', add
label define bplcountry_lbl 55030 `"Guam"', add
label define bplcountry_lbl 55040 `"Howland Island"', add
label define bplcountry_lbl 55050 `"Johnston Atoll"', add
label define bplcountry_lbl 55060 `"Kingman Reef"', add
label define bplcountry_lbl 55070 `"Midway Islands"', add
label define bplcountry_lbl 55080 `"Wake Island"', add
label define bplcountry_lbl 55990 `"Other US Pacific"', add
label define bplcountry_lbl 59990 `"Oceania, n.s."', add
label define bplcountry_lbl 60000 `"OTHER ABROAD"', add
label define bplcountry_lbl 60100 `"U.S. Outlying Areas and Territories"', add
label define bplcountry_lbl 60200 `"Africa/Other"', add
label define bplcountry_lbl 60300 `"Central/South America or Africa"', add
label define bplcountry_lbl 60400 `"Asia/Africa"', add
label define bplcountry_lbl 60500 `"Europe, Australia, New Zealand"', add
label define bplcountry_lbl 60600 `"Other commonwealth"', add
label define bplcountry_lbl 60700 `"Asia, Australia, Oceania, n.s."', add
label define bplcountry_lbl 69900 `"Other countries, not specified"', add
label define bplcountry_lbl 80000 `"AT SEA"', add
label define bplcountry_lbl 99999 `"Unknown"', add
label values bplcountry bplcountry_lbl

label define bplth_lbl 10 `"Bangkok"'
label define bplth_lbl 11 `"Samut Prakan"', add
label define bplth_lbl 12 `"Nonthaburi"', add
label define bplth_lbl 13 `"Pathum Thani"', add
label define bplth_lbl 14 `"Phra Nakhon si Ayutthaya"', add
label define bplth_lbl 15 `"Ang Thong"', add
label define bplth_lbl 16 `"Lop Buri"', add
label define bplth_lbl 17 `"Sing Buri"', add
label define bplth_lbl 18 `"Chai Nat"', add
label define bplth_lbl 19 `"Sa Kaeo"', add
label define bplth_lbl 20 `"Chon buri"', add
label define bplth_lbl 21 `"Rayong"', add
label define bplth_lbl 22 `"Chanthaburi"', add
label define bplth_lbl 23 `"Trat"', add
label define bplth_lbl 24 `"Chachoengsao"', add
label define bplth_lbl 25 `"Prachin Buri"', add
label define bplth_lbl 26 `"Nakhon Nayok"', add
label define bplth_lbl 27 `"Saraburi"', add
label define bplth_lbl 70 `"Ratchaburi"', add
label define bplth_lbl 71 `"Kanchanaburi"', add
label define bplth_lbl 72 `"Suphanburi"', add
label define bplth_lbl 73 `"Nakhon Pathom"', add
label define bplth_lbl 74 `"Samut Sakhon"', add
label define bplth_lbl 75 `"Samut Songkhram"', add
label define bplth_lbl 76 `"Phetchaburi"', add
label define bplth_lbl 77 `"Prachuap Khiri Khan"', add
label define bplth_lbl 30 `"Nakhon Ratchasima"', add
label define bplth_lbl 31 `"Buri Ram"', add
label define bplth_lbl 32 `"Surin"', add
label define bplth_lbl 33 `"Si Sa Ket"', add
label define bplth_lbl 34 `"Ubon Ratchathani"', add
label define bplth_lbl 35 `"Yasothon"', add
label define bplth_lbl 36 `"Chaiyaphum"', add
label define bplth_lbl 37 `"Amnat Charoen"', add
label define bplth_lbl 39 `"Nong Bua Lam Phu"', add
label define bplth_lbl 40 `"Khon Kaen"', add
label define bplth_lbl 41 `"Udon Thani"', add
label define bplth_lbl 42 `"Loei"', add
label define bplth_lbl 43 `"Nong Khai"', add
label define bplth_lbl 44 `"Maha Sarakham"', add
label define bplth_lbl 45 `"Roi Et"', add
label define bplth_lbl 46 `"Kalasin"', add
label define bplth_lbl 47 `"Sakon Nakhon"', add
label define bplth_lbl 48 `"Nakhon Phanom"', add
label define bplth_lbl 49 `"Mukdahan"', add
label define bplth_lbl 50 `"Chiang Mai"', add
label define bplth_lbl 51 `"Lamphun"', add
label define bplth_lbl 52 `"Lampang"', add
label define bplth_lbl 53 `"Uttaradit"', add
label define bplth_lbl 54 `"Phrae"', add
label define bplth_lbl 55 `"Nan"', add
label define bplth_lbl 56 `"Phayao"', add
label define bplth_lbl 57 `"Chiang Rai"', add
label define bplth_lbl 58 `"Mae Hong Son"', add
label define bplth_lbl 60 `"Nakhon Sawan"', add
label define bplth_lbl 61 `"Uthai Thani"', add
label define bplth_lbl 62 `"Kamphaeng Phet"', add
label define bplth_lbl 63 `"Tak"', add
label define bplth_lbl 64 `"Sukhothai"', add
label define bplth_lbl 65 `"Phitsanulok"', add
label define bplth_lbl 66 `"Phichit"', add
label define bplth_lbl 67 `"Phetchabun"', add
label define bplth_lbl 80 `"Nakhon Si Thammarat"', add
label define bplth_lbl 81 `"Krabi"', add
label define bplth_lbl 82 `"Phangnga"', add
label define bplth_lbl 83 `"Phuket"', add
label define bplth_lbl 84 `"Surat Thani"', add
label define bplth_lbl 85 `"Ranong"', add
label define bplth_lbl 86 `"Chumphon"', add
label define bplth_lbl 90 `"Songkhla"', add
label define bplth_lbl 91 `"Satun"', add
label define bplth_lbl 92 `"Trang"', add
label define bplth_lbl 93 `"Phatthalung"', add
label define bplth_lbl 94 `"Pattani"', add
label define bplth_lbl 95 `"Yala"', add
label define bplth_lbl 96 `"Narathiwat"', add
label define bplth_lbl 97 `"Unknown province within Thailand"', add
label define bplth_lbl 98 `"Foreign country"', add
label define bplth_lbl 99 `"Unknown"', add
label values bplth bplth_lbl

label define classwk_lbl 0 `"NIU (not in universe)"'
label define classwk_lbl 1 `"Self-employed"', add
label define classwk_lbl 2 `"Wage/salary worker"', add
label define classwk_lbl 3 `"Unpaid worker"', add
label define classwk_lbl 4 `"Other"', add
label define classwk_lbl 9 `"Unknown/missing"', add
label values classwk classwk_lbl

label define classwkd_lbl 000 `"NIU (not in universe)"'
label define classwkd_lbl 100 `"Self-employed"', add
label define classwkd_lbl 101 `"Self-employed, unincorporated"', add
label define classwkd_lbl 102 `"Self-employed, incorporated"', add
label define classwkd_lbl 110 `"Employer"', add
label define classwkd_lbl 111 `"Sharecropper, employer"', add
label define classwkd_lbl 120 `"Working on own account"', add
label define classwkd_lbl 121 `"Own account, agriculture"', add
label define classwkd_lbl 122 `"Domestic worker, self-employed"', add
label define classwkd_lbl 123 `"Subsistence worker, own consumption"', add
label define classwkd_lbl 124 `"Own account, other"', add
label define classwkd_lbl 125 `"Own account, without temporary/unpaid help"', add
label define classwkd_lbl 126 `"Own account, with temporary/unpaid help"', add
label define classwkd_lbl 130 `"Member of cooperative"', add
label define classwkd_lbl 140 `"Sharecropper"', add
label define classwkd_lbl 141 `"Sharecropper, self-employed"', add
label define classwkd_lbl 142 `"Sharecropper, employee"', add
label define classwkd_lbl 150 `"Kibbutz member"', add
label define classwkd_lbl 199 `"Self-employed, not specified"', add
label define classwkd_lbl 200 `"Wage/salary worker"', add
label define classwkd_lbl 201 `"Management"', add
label define classwkd_lbl 202 `"Non-management"', add
label define classwkd_lbl 203 `"White collar (non-manual)"', add
label define classwkd_lbl 204 `"Blue collar (manual)"', add
label define classwkd_lbl 205 `"White or blue collar"', add
label define classwkd_lbl 206 `"Day laborer"', add
label define classwkd_lbl 207 `"Employee, with a permanent job"', add
label define classwkd_lbl 208 `"Employee, occasional, temporary, contract"', add
label define classwkd_lbl 209 `"Employee without legal contract"', add
label define classwkd_lbl 210 `"Wage/salary worker, private employer"', add
label define classwkd_lbl 211 `"Apprentice"', add
label define classwkd_lbl 212 `"Religious worker"', add
label define classwkd_lbl 213 `"Wage/salary worker, non-profit, NGO"', add
label define classwkd_lbl 214 `"White collar, private"', add
label define classwkd_lbl 215 `"Blue collar, private"', add
label define classwkd_lbl 216 `"Paid family worker"', add
label define classwkd_lbl 217 `"Cooperative employee"', add
label define classwkd_lbl 220 `"Wage/salary worker, government"', add
label define classwkd_lbl 221 `"Federal, government employee"', add
label define classwkd_lbl 222 `"State government employee"', add
label define classwkd_lbl 223 `"Local government employee"', add
label define classwkd_lbl 224 `"White collar, public"', add
label define classwkd_lbl 225 `"Blue collar, public"', add
label define classwkd_lbl 226 `"Public companies"', add
label define classwkd_lbl 227 `"Civil servants, local collectives"', add
label define classwkd_lbl 230 `"Domestic worker (work for private household)"', add
label define classwkd_lbl 240 `"Seasonal migrant"', add
label define classwkd_lbl 241 `"Seasonal migrant, no broker"', add
label define classwkd_lbl 242 `"Seasonal migrant, uses broker"', add
label define classwkd_lbl 250 `"Other wage and salary"', add
label define classwkd_lbl 251 `"Canal zone/commission employee"', add
label define classwkd_lbl 252 `"Government employment/training program"', add
label define classwkd_lbl 253 `"Mixed state/private enterprise/parastatal"', add
label define classwkd_lbl 254 `"Government public work program"', add
label define classwkd_lbl 255 `"State enterprise employee"', add
label define classwkd_lbl 256 `"Coordinated and continuous collaboration job"', add
label define classwkd_lbl 300 `"Unpaid worker"', add
label define classwkd_lbl 310 `"Unpaid family worker"', add
label define classwkd_lbl 320 `"Apprentice, unpaid or unspecified"', add
label define classwkd_lbl 330 `"Trainee"', add
label define classwkd_lbl 340 `"Apprentice or trainee"', add
label define classwkd_lbl 350 `"Works for others without wage"', add
label define classwkd_lbl 400 `"Other"', add
label define classwkd_lbl 999 `"Unknown/missing"', add
label values classwkd classwkd_lbl

label define migratep_lbl 00 `"NIU (not in universe)"'
label define migratep_lbl 10 `"Same major administrative unit"', add
label define migratep_lbl 11 `"Same major, same minor administrative unit"', add
label define migratep_lbl 12 `"Same major, different minor administrative unit"', add
label define migratep_lbl 20 `"Different major administrative unit"', add
label define migratep_lbl 30 `"Abroad"', add
label define migratep_lbl 98 `"Response suppressed"', add
label define migratep_lbl 99 `"Not reported/missing"', add
label values migratep migratep_lbl

label define migctryp_lbl 00000 `"NIU (not in universe)"'
label define migctryp_lbl 10000 `"Africa"', add
label define migctryp_lbl 11000 `"Eastern Africa"', add
label define migctryp_lbl 11010 `"Burundi"', add
label define migctryp_lbl 11020 `"Comoros"', add
label define migctryp_lbl 11030 `"Djibouti"', add
label define migctryp_lbl 11040 `"Eritrea"', add
label define migctryp_lbl 11050 `"Ethiopia"', add
label define migctryp_lbl 11060 `"Kenya"', add
label define migctryp_lbl 11070 `"Madagascar"', add
label define migctryp_lbl 11080 `"Malawi"', add
label define migctryp_lbl 11090 `"Mauritius"', add
label define migctryp_lbl 11100 `"Mozambique"', add
label define migctryp_lbl 11110 `"Reunion"', add
label define migctryp_lbl 11120 `"Rwanda"', add
label define migctryp_lbl 11130 `"Seychelles"', add
label define migctryp_lbl 11140 `"Somalia"', add
label define migctryp_lbl 11150 `"South Sudan"', add
label define migctryp_lbl 11160 `"Uganda"', add
label define migctryp_lbl 11170 `"Tanzania"', add
label define migctryp_lbl 11180 `"Zambia"', add
label define migctryp_lbl 11190 `"Zimbabwe"', add
label define migctryp_lbl 11999 `"Eastern Africa, n.s."', add
label define migctryp_lbl 12000 `"Middle Africa"', add
label define migctryp_lbl 12010 `"Angola"', add
label define migctryp_lbl 12020 `"Cameroon"', add
label define migctryp_lbl 12030 `"Central African Republic"', add
label define migctryp_lbl 12040 `"Chad"', add
label define migctryp_lbl 12050 `"Congo"', add
label define migctryp_lbl 12060 `"Democratic Republic of Congo"', add
label define migctryp_lbl 12070 `"Equatorial Guinea"', add
label define migctryp_lbl 12080 `"Gabon"', add
label define migctryp_lbl 12100 `"Sao Tome and Principe"', add
label define migctryp_lbl 12999 `"Middle Africa, n.s."', add
label define migctryp_lbl 13000 `"Northern Africa"', add
label define migctryp_lbl 13010 `"Algeria"', add
label define migctryp_lbl 13020 `"Egypt/United Arab Rep."', add
label define migctryp_lbl 13030 `"Libya"', add
label define migctryp_lbl 13040 `"Morocco"', add
label define migctryp_lbl 13050 `"Sudan"', add
label define migctryp_lbl 13060 `"Tunisia"', add
label define migctryp_lbl 13070 `"Western Sahara"', add
label define migctryp_lbl 13990 `"Northern Africa, n.s."', add
label define migctryp_lbl 14000 `"Southern Africa"', add
label define migctryp_lbl 14010 `"Botswana"', add
label define migctryp_lbl 14020 `"Lesotho"', add
label define migctryp_lbl 14030 `"Namibia"', add
label define migctryp_lbl 14040 `"South Africa"', add
label define migctryp_lbl 14050 `"Swaziland"', add
label define migctryp_lbl 14999 `"Southern Africa, n.s."', add
label define migctryp_lbl 15000 `"Western Africa"', add
label define migctryp_lbl 15010 `"Benin"', add
label define migctryp_lbl 15020 `"Burkina Faso"', add
label define migctryp_lbl 15150 `"Cape Verde"', add
label define migctryp_lbl 15040 `"Ivory Coast"', add
label define migctryp_lbl 15050 `"Gambia"', add
label define migctryp_lbl 15060 `"Ghana"', add
label define migctryp_lbl 15070 `"Guinea"', add
label define migctryp_lbl 15080 `"Guinea-Bissau"', add
label define migctryp_lbl 15090 `"Liberia"', add
label define migctryp_lbl 15100 `"Mali"', add
label define migctryp_lbl 15110 `"Mauritania"', add
label define migctryp_lbl 15120 `"Niger"', add
label define migctryp_lbl 15130 `"Nigeria"', add
label define migctryp_lbl 15140 `"St. Helena and Ascension"', add
label define migctryp_lbl 15160 `"Sierra Leone"', add
label define migctryp_lbl 15170 `"Togo"', add
label define migctryp_lbl 19999 `"Africa, n.s."', add
label define migctryp_lbl 20000 `"Americas"', add
label define migctryp_lbl 21000 `"Caribbean"', add
label define migctryp_lbl 21010 `"Anguilla"', add
label define migctryp_lbl 21020 `"Antigua-Barbuda"', add
label define migctryp_lbl 21030 `"Aruba"', add
label define migctryp_lbl 21040 `"Bahamas"', add
label define migctryp_lbl 21050 `"Barbados"', add
label define migctryp_lbl 21060 `"British Virgin Islands"', add
label define migctryp_lbl 21070 `"Cayman Isles"', add
label define migctryp_lbl 21080 `"Cuba"', add
label define migctryp_lbl 21090 `"Dominica"', add
label define migctryp_lbl 21100 `"Dominican Republic"', add
label define migctryp_lbl 21110 `"Grenada"', add
label define migctryp_lbl 21120 `"Guadeloupe"', add
label define migctryp_lbl 21130 `"Haiti"', add
label define migctryp_lbl 21140 `"Jamaica"', add
label define migctryp_lbl 21150 `"Martinique"', add
label define migctryp_lbl 21160 `"Montserrat"', add
label define migctryp_lbl 21170 `"Netherlands Antilles"', add
label define migctryp_lbl 21180 `"Puerto Rico"', add
label define migctryp_lbl 21190 `"St. Kitts-Nevis"', add
label define migctryp_lbl 21200 `"St. Croix"', add
label define migctryp_lbl 21210 `"St. John"', add
label define migctryp_lbl 21220 `"St. Lucia"', add
label define migctryp_lbl 21230 `"St. Thomas"', add
label define migctryp_lbl 21240 `"St. Vincent and the Grenadines"', add
label define migctryp_lbl 21250 `"Trinidad and Tobago"', add
label define migctryp_lbl 21260 `"Turks and Caicos"', add
label define migctryp_lbl 21270 `"U.S. Virgin Islands"', add
label define migctryp_lbl 21999 `"Caribbean, n.s."', add
label define migctryp_lbl 22000 `"Central America"', add
label define migctryp_lbl 22010 `"Belize/British Honduras"', add
label define migctryp_lbl 22020 `"Costa Rica"', add
label define migctryp_lbl 22030 `"El Salvador"', add
label define migctryp_lbl 22040 `"Guatemala"', add
label define migctryp_lbl 22050 `"Honduras"', add
label define migctryp_lbl 22060 `"Mexico"', add
label define migctryp_lbl 22070 `"Nicaragua"', add
label define migctryp_lbl 22080 `"Panama"', add
label define migctryp_lbl 22081 `"Panama Canal Zone"', add
label define migctryp_lbl 22999 `"Central America, n.s."', add
label define migctryp_lbl 23000 `"South America"', add
label define migctryp_lbl 23010 `"Argentina"', add
label define migctryp_lbl 23020 `"Bolivia"', add
label define migctryp_lbl 23030 `"Brazil"', add
label define migctryp_lbl 23040 `"Chile"', add
label define migctryp_lbl 23050 `"Colombia"', add
label define migctryp_lbl 23060 `"Ecuador"', add
label define migctryp_lbl 23070 `"Falkland Islands"', add
label define migctryp_lbl 23080 `"French Guiana"', add
label define migctryp_lbl 23090 `"Guyana/British Guiana"', add
label define migctryp_lbl 23100 `"Paraguay"', add
label define migctryp_lbl 23110 `"Peru"', add
label define migctryp_lbl 23120 `"Suriname"', add
label define migctryp_lbl 23130 `"Uruguay"', add
label define migctryp_lbl 23140 `"Venezuela"', add
label define migctryp_lbl 23990 `"South America, n.s."', add
label define migctryp_lbl 23991 `"Central and Latin America"', add
label define migctryp_lbl 24000 `"North America"', add
label define migctryp_lbl 24010 `"Bermuda"', add
label define migctryp_lbl 24020 `"Canada"', add
label define migctryp_lbl 24030 `"Greenland"', add
label define migctryp_lbl 24040 `"Saint Pierre and Miquelon"', add
label define migctryp_lbl 24050 `"United States"', add
label define migctryp_lbl 24051 `"U.S. Outlying Areas and Territories"', add
label define migctryp_lbl 24999 `"U.S.A, Canada, Mexico"', add
label define migctryp_lbl 29999 `"Americas, n.s."', add
label define migctryp_lbl 30000 `"Asia"', add
label define migctryp_lbl 31000 `"Eastern Asia"', add
label define migctryp_lbl 31010 `"China"', add
label define migctryp_lbl 31011 `"Hong Kong"', add
label define migctryp_lbl 31012 `"Macau"', add
label define migctryp_lbl 31013 `"Taiwan"', add
label define migctryp_lbl 31020 `"Japan"', add
label define migctryp_lbl 31030 `"Korea"', add
label define migctryp_lbl 31031 `"Korea, DPR (North)"', add
label define migctryp_lbl 31032 `"Korea, RO (South)"', add
label define migctryp_lbl 31040 `"Mongolia"', add
label define migctryp_lbl 32000 `"South-Central Asia"', add
label define migctryp_lbl 32010 `"Afghanistan"', add
label define migctryp_lbl 32020 `"Bangladesh"', add
label define migctryp_lbl 32030 `"Bhutan"', add
label define migctryp_lbl 32040 `"India"', add
label define migctryp_lbl 32041 `"India/Pakistan"', add
label define migctryp_lbl 32050 `"Iran"', add
label define migctryp_lbl 32060 `"Kazakhstan"', add
label define migctryp_lbl 32070 `"Kyrgyzstan"', add
label define migctryp_lbl 32080 `"Maldives"', add
label define migctryp_lbl 32090 `"Nepal"', add
label define migctryp_lbl 32100 `"Pakistan"', add
label define migctryp_lbl 32110 `"Sri Lanka (Ceylon)"', add
label define migctryp_lbl 32120 `"Tajikistan"', add
label define migctryp_lbl 32130 `"Turkmenistan"', add
label define migctryp_lbl 32140 `"Uzbekistan"', add
label define migctryp_lbl 33000 `"South-Eastern Asia"', add
label define migctryp_lbl 33010 `"Brunei"', add
label define migctryp_lbl 33020 `"Cambodia (Kampuchea)"', add
label define migctryp_lbl 33030 `"East Timor"', add
label define migctryp_lbl 33040 `"Indonesia"', add
label define migctryp_lbl 33050 `"Laos"', add
label define migctryp_lbl 33060 `"Malaysia"', add
label define migctryp_lbl 33061 `"Malaysia and Singapore"', add
label define migctryp_lbl 33070 `"Myanmar (Burma)"', add
label define migctryp_lbl 33080 `"Philippines"', add
label define migctryp_lbl 33090 `"Singapore"', add
label define migctryp_lbl 33100 `"Thailand"', add
label define migctryp_lbl 33110 `"Vietnam"', add
label define migctryp_lbl 34000 `"Western Asia"', add
label define migctryp_lbl 34010 `"Armenia"', add
label define migctryp_lbl 34020 `"Azerbaijan"', add
label define migctryp_lbl 34030 `"Bahrain"', add
label define migctryp_lbl 34040 `"Cyprus"', add
label define migctryp_lbl 34050 `"Georgia"', add
label define migctryp_lbl 34060 `"Iraq"', add
label define migctryp_lbl 34070 `"Israel"', add
label define migctryp_lbl 34080 `"Jordan"', add
label define migctryp_lbl 34090 `"Kuwait"', add
label define migctryp_lbl 34100 `"Lebanon"', add
label define migctryp_lbl 34110 `"Palestine"', add
label define migctryp_lbl 34120 `"Oman"', add
label define migctryp_lbl 34130 `"Qatar"', add
label define migctryp_lbl 34140 `"Saudi Arabia"', add
label define migctryp_lbl 34150 `"Syria"', add
label define migctryp_lbl 34151 `"Syria/Lebanon"', add
label define migctryp_lbl 34160 `"Turkey"', add
label define migctryp_lbl 34170 `"United Arab Emirates"', add
label define migctryp_lbl 34180 `"Yemen"', add
label define migctryp_lbl 34190 `"Middle East, not specified"', add
label define migctryp_lbl 34191 `"Arabia"', add
label define migctryp_lbl 34199 `"Gulf countries"', add
label define migctryp_lbl 39999 `"Asia, n.s."', add
label define migctryp_lbl 40000 `"Europe"', add
label define migctryp_lbl 41000 `"Eastern Europe"', add
label define migctryp_lbl 41010 `"Belarus"', add
label define migctryp_lbl 41020 `"Bulgaria"', add
label define migctryp_lbl 41021 `"Albania/Bulgaria/Romania"', add
label define migctryp_lbl 41030 `"Czech Republic"', add
label define migctryp_lbl 41031 `"Czechoslovakia/Yugoslavia"', add
label define migctryp_lbl 41040 `"Hungary"', add
label define migctryp_lbl 41050 `"Poland"', add
label define migctryp_lbl 41060 `"Moldova"', add
label define migctryp_lbl 41070 `"Romania"', add
label define migctryp_lbl 41080 `"Russia/USSR"', add
label define migctryp_lbl 41090 `"Slovakia"', add
label define migctryp_lbl 41100 `"Ukraine"', add
label define migctryp_lbl 41999 `"41999"', add
label define migctryp_lbl 42000 `"Northern Europe"', add
label define migctryp_lbl 42010 `"Denmark"', add
label define migctryp_lbl 42020 `"Estonia"', add
label define migctryp_lbl 42030 `"Faroe Islands"', add
label define migctryp_lbl 42040 `"Finland"', add
label define migctryp_lbl 42050 `"Iceland"', add
label define migctryp_lbl 42060 `"Ireland"', add
label define migctryp_lbl 42070 `"Latvia"', add
label define migctryp_lbl 42080 `"Lithuania"', add
label define migctryp_lbl 42090 `"Norway"', add
label define migctryp_lbl 42110 `"Sweden"', add
label define migctryp_lbl 42120 `"United Kingdom"', add
label define migctryp_lbl 42199 `"Scandinavia"', add
label define migctryp_lbl 43000 `"Southern Europe"', add
label define migctryp_lbl 43010 `"Albania"', add
label define migctryp_lbl 43020 `"Andorra"', add
label define migctryp_lbl 43030 `"Bosnia"', add
label define migctryp_lbl 43040 `"Croatia"', add
label define migctryp_lbl 43050 `"Gibraltar"', add
label define migctryp_lbl 43060 `"Greece"', add
label define migctryp_lbl 43070 `"Italy"', add
label define migctryp_lbl 43071 `"Vatican City"', add
label define migctryp_lbl 43080 `"Malta"', add
label define migctryp_lbl 43090 `"Portugal"', add
label define migctryp_lbl 43100 `"San Marino"', add
label define migctryp_lbl 43110 `"Slovenia"', add
label define migctryp_lbl 43120 `"Spain"', add
label define migctryp_lbl 43130 `"Macedonia"', add
label define migctryp_lbl 43140 `"Yugoslavia"', add
label define migctryp_lbl 43141 `"Montenegro"', add
label define migctryp_lbl 43142 `"Serbia"', add
label define migctryp_lbl 43143 `"Serbia and Montenegro"', add
label define migctryp_lbl 43999 `"Southern Europe, n.s."', add
label define migctryp_lbl 44000 `"Western Europe"', add
label define migctryp_lbl 44010 `"Austria"', add
label define migctryp_lbl 44020 `"Belgium"', add
label define migctryp_lbl 44021 `"Belgium/Luxemburg"', add
label define migctryp_lbl 44022 `"Benelux (Belgium/Netherlands/Luxemburg)"', add
label define migctryp_lbl 44030 `"France"', add
label define migctryp_lbl 44040 `"Germany"', add
label define migctryp_lbl 44050 `"Liechtenstein"', add
label define migctryp_lbl 44060 `"Luxembourg"', add
label define migctryp_lbl 44070 `"Monaco"', add
label define migctryp_lbl 44080 `"Netherlands"', add
label define migctryp_lbl 44090 `"Switzerland"', add
label define migctryp_lbl 49990 `"Europe, n.s."', add
label define migctryp_lbl 49991 `"Central and Eastern Europe"', add
label define migctryp_lbl 49992 `"European Union"', add
label define migctryp_lbl 50000 `"Oceania"', add
label define migctryp_lbl 51000 `"Australia and New Zealand"', add
label define migctryp_lbl 51010 `"Australia"', add
label define migctryp_lbl 51020 `"New Zealand"', add
label define migctryp_lbl 51021 `"New Zealand/New Guinea"', add
label define migctryp_lbl 51030 `"Norfolk Islands"', add
label define migctryp_lbl 51999 `"Australia and New Zealand, n.s."', add
label define migctryp_lbl 52000 `"Melanesia"', add
label define migctryp_lbl 52010 `"Fiji"', add
label define migctryp_lbl 52020 `"New Caledonia"', add
label define migctryp_lbl 52030 `"Papua New Guinea"', add
label define migctryp_lbl 52040 `"Solomon Islands"', add
label define migctryp_lbl 52050 `"Vanuatu (New Hebrides)"', add
label define migctryp_lbl 53000 `"Micronesia"', add
label define migctryp_lbl 53010 `"Kiribati"', add
label define migctryp_lbl 53020 `"Marshall Islands"', add
label define migctryp_lbl 53030 `"Nauru"', add
label define migctryp_lbl 53040 `"Northern Mariana Isls."', add
label define migctryp_lbl 53050 `"Palau"', add
label define migctryp_lbl 53999 `"Micronesia, n.e.c."', add
label define migctryp_lbl 54000 `"Polynesia"', add
label define migctryp_lbl 54010 `"Cook Islands"', add
label define migctryp_lbl 54020 `"French Polynesia"', add
label define migctryp_lbl 54030 `"Niue"', add
label define migctryp_lbl 54040 `"Pitcairn Island"', add
label define migctryp_lbl 54050 `"Samoa"', add
label define migctryp_lbl 54060 `"Tokelau"', add
label define migctryp_lbl 54070 `"Tonga"', add
label define migctryp_lbl 54080 `"Tuvalu"', add
label define migctryp_lbl 54090 `"Wallis and Futuna Isls."', add
label define migctryp_lbl 59999 `"Oceania, n.s."', add
label define migctryp_lbl 60000 `"Other"', add
label define migctryp_lbl 60010 `"Europe, Australia, New Zealand"', add
label define migctryp_lbl 60020 `"Asia and Oceania, n.s."', add
label define migctryp_lbl 90000 `"Non-migrants (International)"', add
label define migctryp_lbl 99998 `"Response suppressed"', add
label define migctryp_lbl 99999 `"Unknown"', add
label values migctryp migctryp_lbl

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

label define migyrs1_lbl 00 `"Less than 1 year"'
label define migyrs1_lbl 01 `"1 year (or 1 year or less)"', add
label define migyrs1_lbl 02 `"2 years"', add
label define migyrs1_lbl 03 `"3 years"', add
label define migyrs1_lbl 04 `"4 years"', add
label define migyrs1_lbl 05 `"5 years"', add
label define migyrs1_lbl 06 `"6 years"', add
label define migyrs1_lbl 07 `"7 years"', add
label define migyrs1_lbl 08 `"8 years"', add
label define migyrs1_lbl 09 `"9 years"', add
label define migyrs1_lbl 10 `"10 years"', add
label define migyrs1_lbl 11 `"11 years"', add
label define migyrs1_lbl 12 `"12 years"', add
label define migyrs1_lbl 13 `"13 years"', add
label define migyrs1_lbl 14 `"14 years"', add
label define migyrs1_lbl 15 `"15 years"', add
label define migyrs1_lbl 16 `"16 years"', add
label define migyrs1_lbl 17 `"17 years"', add
label define migyrs1_lbl 18 `"18 years"', add
label define migyrs1_lbl 19 `"19 years"', add
label define migyrs1_lbl 20 `"20 years"', add
label define migyrs1_lbl 21 `"21 years"', add
label define migyrs1_lbl 22 `"22 years"', add
label define migyrs1_lbl 23 `"23 years"', add
label define migyrs1_lbl 24 `"24 years"', add
label define migyrs1_lbl 25 `"25 years"', add
label define migyrs1_lbl 26 `"26 years"', add
label define migyrs1_lbl 27 `"27 years"', add
label define migyrs1_lbl 28 `"28 years"', add
label define migyrs1_lbl 29 `"29 years"', add
label define migyrs1_lbl 30 `"30 years"', add
label define migyrs1_lbl 31 `"31 years"', add
label define migyrs1_lbl 32 `"32 years"', add
label define migyrs1_lbl 33 `"33 years"', add
label define migyrs1_lbl 34 `"34 years"', add
label define migyrs1_lbl 35 `"35 years"', add
label define migyrs1_lbl 36 `"36 years"', add
label define migyrs1_lbl 37 `"37 years"', add
label define migyrs1_lbl 38 `"38 years"', add
label define migyrs1_lbl 39 `"39 years"', add
label define migyrs1_lbl 40 `"40 years"', add
label define migyrs1_lbl 41 `"41 years"', add
label define migyrs1_lbl 42 `"42 years"', add
label define migyrs1_lbl 43 `"43 years"', add
label define migyrs1_lbl 44 `"44 years"', add
label define migyrs1_lbl 45 `"45 years"', add
label define migyrs1_lbl 46 `"46 years"', add
label define migyrs1_lbl 47 `"47 years"', add
label define migyrs1_lbl 48 `"48 years"', add
label define migyrs1_lbl 49 `"49 years"', add
label define migyrs1_lbl 50 `"50 years"', add
label define migyrs1_lbl 51 `"51 years"', add
label define migyrs1_lbl 52 `"52 years"', add
label define migyrs1_lbl 53 `"53 years"', add
label define migyrs1_lbl 54 `"54 years"', add
label define migyrs1_lbl 55 `"55 years"', add
label define migyrs1_lbl 56 `"56 years"', add
label define migyrs1_lbl 57 `"57 years"', add
label define migyrs1_lbl 58 `"58 years"', add
label define migyrs1_lbl 59 `"59 years"', add
label define migyrs1_lbl 60 `"60 years"', add
label define migyrs1_lbl 61 `"61 years"', add
label define migyrs1_lbl 62 `"62 years"', add
label define migyrs1_lbl 63 `"63 years"', add
label define migyrs1_lbl 64 `"64 years"', add
label define migyrs1_lbl 65 `"65 years"', add
label define migyrs1_lbl 66 `"66 years"', add
label define migyrs1_lbl 67 `"67 years"', add
label define migyrs1_lbl 68 `"68 years"', add
label define migyrs1_lbl 69 `"69 years"', add
label define migyrs1_lbl 70 `"70 years"', add
label define migyrs1_lbl 71 `"71 years"', add
label define migyrs1_lbl 72 `"72 years"', add
label define migyrs1_lbl 73 `"73 years"', add
label define migyrs1_lbl 74 `"74 years"', add
label define migyrs1_lbl 75 `"75 years"', add
label define migyrs1_lbl 76 `"76 years"', add
label define migyrs1_lbl 77 `"77 years"', add
label define migyrs1_lbl 78 `"78 years"', add
label define migyrs1_lbl 79 `"79 years"', add
label define migyrs1_lbl 80 `"80 years"', add
label define migyrs1_lbl 81 `"81 years"', add
label define migyrs1_lbl 82 `"82 years"', add
label define migyrs1_lbl 83 `"83 years"', add
label define migyrs1_lbl 84 `"84 years"', add
label define migyrs1_lbl 85 `"85 years"', add
label define migyrs1_lbl 86 `"86 years"', add
label define migyrs1_lbl 87 `"87 years"', add
label define migyrs1_lbl 88 `"88 years"', add
label define migyrs1_lbl 89 `"89 years"', add
label define migyrs1_lbl 90 `"90 years"', add
label define migyrs1_lbl 91 `"91 years"', add
label define migyrs1_lbl 92 `"92 years"', add
label define migyrs1_lbl 93 `"93 years"', add
label define migyrs1_lbl 94 `"94 years"', add
label define migyrs1_lbl 95 `"95+"', add
label define migyrs1_lbl 96 `"Less than 5 years"', add
label define migyrs1_lbl 97 `"More than 5 years"', add
label define migyrs1_lbl 98 `"Unknown"', add
label define migyrs1_lbl 99 `"NIU (not in universe)"', add
label values migyrs1 migyrs1_lbl

label define mig1_p_th_lbl 764010 `"Bangkok"'
label define mig1_p_th_lbl 764011 `"Samut Prakan"', add
label define mig1_p_th_lbl 764012 `"Nonthaburi"', add
label define mig1_p_th_lbl 764013 `"Pathum Thani"', add
label define mig1_p_th_lbl 764014 `"Phra Nakhon si Ayutthaya"', add
label define mig1_p_th_lbl 764015 `"Ang Thong"', add
label define mig1_p_th_lbl 764016 `"Lop Buri"', add
label define mig1_p_th_lbl 764017 `"Sing Buri"', add
label define mig1_p_th_lbl 764018 `"Chai Nat"', add
label define mig1_p_th_lbl 764019 `"Sa Kaeo, Prachin Buri"', add
label define mig1_p_th_lbl 764020 `"Chon buri"', add
label define mig1_p_th_lbl 764021 `"Rayong"', add
label define mig1_p_th_lbl 764022 `"Chanthaburi"', add
label define mig1_p_th_lbl 764023 `"Trat"', add
label define mig1_p_th_lbl 764024 `"Chachoengsao"', add
label define mig1_p_th_lbl 764026 `"Nakhon Nayok"', add
label define mig1_p_th_lbl 764027 `"Saraburi"', add
label define mig1_p_th_lbl 764070 `"Ratchaburi"', add
label define mig1_p_th_lbl 764071 `"Kanchanaburi"', add
label define mig1_p_th_lbl 764072 `"Suphanburi"', add
label define mig1_p_th_lbl 764073 `"Nakhon Pathom"', add
label define mig1_p_th_lbl 764074 `"Samut Sakhon"', add
label define mig1_p_th_lbl 764075 `"Samut Songkhram"', add
label define mig1_p_th_lbl 764076 `"Phetchaburi"', add
label define mig1_p_th_lbl 764077 `"Prachuap Khiri Khan"', add
label define mig1_p_th_lbl 764030 `"Nakhon Ratchasima"', add
label define mig1_p_th_lbl 764031 `"Buri Ram"', add
label define mig1_p_th_lbl 764032 `"Surin"', add
label define mig1_p_th_lbl 764033 `"Si Sa Ket"', add
label define mig1_p_th_lbl 764034 `"Ubon Ratchathani, Yasothon, Amnat Charoen"', add
label define mig1_p_th_lbl 764036 `"Chaiyaphum"', add
label define mig1_p_th_lbl 764039 `"Nong Bua Lam Phu, Udon Thani"', add
label define mig1_p_th_lbl 764040 `"Khon Kaen"', add
label define mig1_p_th_lbl 764042 `"Loei"', add
label define mig1_p_th_lbl 764043 `"Nong Khai"', add
label define mig1_p_th_lbl 764044 `"Maha Sarakham"', add
label define mig1_p_th_lbl 764045 `"Roi Et"', add
label define mig1_p_th_lbl 764046 `"Kalasin"', add
label define mig1_p_th_lbl 764047 `"Sakon Nakhon"', add
label define mig1_p_th_lbl 764048 `"Nakhon Phanom, Mukdahan"', add
label define mig1_p_th_lbl 764050 `"Chiang Mai"', add
label define mig1_p_th_lbl 764051 `"Lamphun"', add
label define mig1_p_th_lbl 764052 `"Lampang"', add
label define mig1_p_th_lbl 764053 `"Uttaradit"', add
label define mig1_p_th_lbl 764054 `"Phrae"', add
label define mig1_p_th_lbl 764055 `"Nan"', add
label define mig1_p_th_lbl 764057 `"Phayao, Chiang Rai"', add
label define mig1_p_th_lbl 764058 `"Mae Hong Son"', add
label define mig1_p_th_lbl 764060 `"Nakhon Sawan"', add
label define mig1_p_th_lbl 764061 `"Uthai Thani"', add
label define mig1_p_th_lbl 764062 `"Kamphaeng Phet"', add
label define mig1_p_th_lbl 764063 `"Tak"', add
label define mig1_p_th_lbl 764064 `"Sukhothai"', add
label define mig1_p_th_lbl 764065 `"Phitsanulok"', add
label define mig1_p_th_lbl 764066 `"Phichit"', add
label define mig1_p_th_lbl 764067 `"Phetchabun"', add
label define mig1_p_th_lbl 764080 `"Nakhon Si Thammarat"', add
label define mig1_p_th_lbl 764082 `"Phangnga"', add
label define mig1_p_th_lbl 764083 `"Phuket"', add
label define mig1_p_th_lbl 764084 `"Krabi, Surat Thani"', add
label define mig1_p_th_lbl 764086 `"Ranong, Chumphon"', add
label define mig1_p_th_lbl 764090 `"Songkhla"', add
label define mig1_p_th_lbl 764091 `"Satun"', add
label define mig1_p_th_lbl 764092 `"Trang"', add
label define mig1_p_th_lbl 764093 `"Phatthalung"', add
label define mig1_p_th_lbl 764094 `"Pattani"', add
label define mig1_p_th_lbl 764095 `"Yala"', add
label define mig1_p_th_lbl 764096 `"Narathiwat"', add
label define mig1_p_th_lbl 764097 `"Same province"', add
label define mig1_p_th_lbl 764098 `"Unknown province, but within Thaliand"', add
label define mig1_p_th_lbl 764997 `"Abroad"', add
label define mig1_p_th_lbl 764998 `"Unknown"', add
label define mig1_p_th_lbl 764999 `"NIU (not in universe)"', add
label values mig1_p_th mig1_p_th_lbl

* save
save ".././output/Thailand", replace

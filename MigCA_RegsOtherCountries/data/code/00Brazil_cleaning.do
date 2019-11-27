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
*** Brazil
********************************************************************************

* NOTE: You need to set the Stata working directory to the path
* where the data file is located.

set more off

clear
quietly infix                  ///
  int     country     1-3      ///
  int     year        4-7      ///
  double  sample      8-16     ///
  double  serial      17-28    ///
  double  hhwt        29-36    ///
  byte    urban       37-37    ///
  byte    regionw     38-39    ///
  long    geolev1     40-45    ///
  double  geolev2     46-54    ///
  long    geo1_br     55-60    ///
  double  geo2_br     61-69    ///
  byte    regnbr      70-70    ///
  int     mesobr      71-74    ///
  int     metrobr     75-77    ///
  byte    ownership   78-78    ///
  int     ownershipd  79-81    ///
  int     pernum      82-85    ///
  double  perwt       86-93    ///
  byte    resident    94-94    ///
  byte    relate      95-95    ///
  int     related     96-99    ///
  int     age         100-102  ///
  byte    sex         103-103  ///
  byte    nativity    104-104  ///
  long    bplcountry  105-109  ///
  byte    bplbr       110-111  ///
  byte    empstat     112-112  ///
  int     empstatd    113-115  ///
  int     occ         116-119  ///
  long    ind         120-124  ///
  byte    classwk     125-125  ///
  int     classwkd    126-128  ///
  long    inctot      129-135  ///
  byte    inctbr      136-136  ///
  double  incearn     137-144  ///
  byte    migratep    145-146  ///
  long    geomig1_p   147-152  ///
  long    mig1_p_br   153-158  ///
  using `".././input/Brazil/ipumsi_00011.dat"'

replace hhwt       = hhwt       / 100
replace perwt      = perwt      / 100

format sample     %9.0g
format serial     %12.0g
format hhwt       %8.2f
format geolev2    %9.0g
format geo2_br    %9.0g
format perwt      %8.2f
format incearn    %8.0g

label var country    `"Country"'
label var year       `"Year"'
label var sample     `"IPUMS sample identifier"'
label var serial     `"Household serial number"'
label var hhwt       `"Household weight"'
label var urban      `"Urban-rural status"'
label var regionw    `"Continent and region of country"'
label var geolev1    `"1st subnational geographic level, world [consistent boundaries over time]"'
label var geolev2    `"2nd subnational geographic level, world [consistent boundaries over time]"'
label var geo1_br    `"Brazil, State 1960 - 2010 [Level 1; consistent boundaries, GIS]"'
label var geo2_br    `"Brazil, Municipality 1980 - 2010 [Level 2; consistent boundaries, GIS]"'
label var regnbr     `"Brazil, Region"'
label var mesobr     `"Brazil, Mesoregion"'
label var metrobr    `"Brazil, Metropolitan region"'
label var ownership  `"Ownership of dwelling [general version]"'
label var ownershipd `"Ownership of dwelling [detailed version]"'
label var pernum     `"Person number"'
label var perwt      `"Person weight"'
label var resident   `"Residence status: de facto, de jure"'
label var relate     `"Relationship to household head [general version]"'
label var related    `"Relationship to household head [detailed version]"'
label var age        `"Age"'
label var sex        `"Sex"'
label var nativity   `"Nativity status"'
label var bplcountry `"Country of birth"'
label var bplbr      `"State of birth, Brazil"'
label var empstat    `"Activity status (employment status) [general version]"'
label var empstatd   `"Activity status (employment status) [detailed version]"'
label var occ        `"Occupation, unrecoded"'
label var ind        `"Industry, unrecoded"'
label var classwk    `"Status in employment (class of worker) [general version]"'
label var classwkd   `"Status in employment (class of worker) [detailed version]"'
label var inctot     `"Total income"'
label var inctbr     `"Total income, Brazil 1960"'
label var incearn    `"Earned income"'
label var migratep   `"Migration status, previous residence"'
label var geomig1_p  `"1st subnational geographic level of previous residence, world [consistent bounda"'
label var mig1_p_br  `"State of previous residence, Brazil; consistent boundaries, GIS"'

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

label define geo1_br_lbl 076011 `"Rondônia"'
label define geo1_br_lbl 076012 `"Acre"', add
label define geo1_br_lbl 076013 `"Amazonas"', add
label define geo1_br_lbl 076014 `"Roraima"', add
label define geo1_br_lbl 076015 `"Pará"', add
label define geo1_br_lbl 076016 `"Amapá"', add
label define geo1_br_lbl 076021 `"Maranhão"', add
label define geo1_br_lbl 076022 `"Piauí"', add
label define geo1_br_lbl 076023 `"Ceará"', add
label define geo1_br_lbl 076024 `"Rio Grande do Norte"', add
label define geo1_br_lbl 076025 `"Paraíba"', add
label define geo1_br_lbl 076026 `"Pernambuco, Arquipelago de Fernando de Noronha"', add
label define geo1_br_lbl 076027 `"Alagoas"', add
label define geo1_br_lbl 076028 `"Sergipe"', add
label define geo1_br_lbl 076029 `"Bahia"', add
label define geo1_br_lbl 076031 `"Minas Gerais"', add
label define geo1_br_lbl 076032 `"Espírito Santo"', add
label define geo1_br_lbl 076033 `"Rio de Janeiro, Guanabara"', add
label define geo1_br_lbl 076035 `"São Paulo"', add
label define geo1_br_lbl 076041 `"Paraná"', add
label define geo1_br_lbl 076042 `"Santa Catarina"', add
label define geo1_br_lbl 076043 `"Rio Grande do Sul"', add
label define geo1_br_lbl 076051 `"Mato Grosso do Sul, Mato Grosso"', add
label define geo1_br_lbl 076052 `"Goiás, Tocantins"', add
label define geo1_br_lbl 076053 `"Distrito Federal"', add
label values geo1_br geo1_br_lbl

label define geo2_br_lbl 076011001 `"Porto Velho, Buritis, Campo Novo de Rondônia, Candeias do Jamari, Alto Paraíso, Governador Jorge Teixeira, Ariquemes, Monte Negro, Itapuã do Oeste, Cacaulândia, Jaru, Rio Crespo, Cujubim, Theobroma, Machadinho D'Oeste, Vale do Anari"'
label define geo2_br_lbl 076011002 `"Guajará-Mirim, Nova Mamoré, São Francisco do Guaporé, São Miguel do Guaporé, Seringueiras, Alvorada D'Oeste, Mirante da Serra, Alta Floresta D'Oeste, Nova União, Urupá, Ouro Preto do Oeste, Teixeirópolis, Nova Brasilândia D'Oeste, Alto Alegre d"', add
label define geo2_br_lbl 076011003 `"Novo Horizonte do Oeste, Castanheiras, Rolim de Moura, Santa Luzia D'Oeste, Cacoal, Ministro Andreazza, Parecis, São Felipe D'Oeste, Pimenta Bueno, Primavera de Rondônia, Espigão D'Oeste"', add
label define geo2_br_lbl 076012001 `"Rio Branco, Bujari, Porto Acre"', add
label define geo2_br_lbl 076012002 `"Cruzeiro do Sul, Porto Walter, Marechal Thaumaturgo"', add
label define geo2_br_lbl 076012003 `"Brasiléia, Xapuri, Capixaba, Epitaciolândia"', add
label define geo2_br_lbl 076012004 `"Senador Guiomard, Plácido de Castro, Acrelândia"', add
label define geo2_br_lbl 076012005 `"Sena Madureira, Assis Brasil"', add
label define geo2_br_lbl 076012006 `"Feijó, Santa Rosa do Purus, Manoel Urbano"', add
label define geo2_br_lbl 076012007 `"Jordão, Tarauacá"', add
label define geo2_br_lbl 076012008 `"Mâncio Lima, Rodrigues Alves"', add
label define geo2_br_lbl 076013001 `"Iranduba, Manaus"', add
label define geo2_br_lbl 076013002 `"Beruri, Caapiranga, Manacapuru, Manaquiri"', add
label define geo2_br_lbl 076013003 `"Rio Preto da Eva, Itacoatiara, Urucurituba"', add
label define geo2_br_lbl 076013004 `"Parintins"', add
label define geo2_br_lbl 076013005 `"Maraã, Coari"', add
label define geo2_br_lbl 076013006 `"São Paulo de Olivença, Tabatinga, Amaturá"', add
label define geo2_br_lbl 076013007 `"Tefé, Uarini, Alvarães"', add
label define geo2_br_lbl 076013008 `"Novo Aripuanã, Borba, Apuí"', add
label define geo2_br_lbl 076013009 `"Maués, Boa Vista do Ramos"', add
label define geo2_br_lbl 076013010 `"Careiro, Careiro da Várzea"', add
label define geo2_br_lbl 076013011 `"Pauini, Lábrea"', add
label define geo2_br_lbl 076013012 `"Atalaia do Norte, Guajará, Ipixuna"', add
label define geo2_br_lbl 076013013 `"Manicoré"', add
label define geo2_br_lbl 076013014 `"Eirunepé, Envira"', add
label define geo2_br_lbl 076013015 `"Urucará, São Sebastião do Uatumã, Nhamundá"', add
label define geo2_br_lbl 076013016 `"Presidente Figueiredo, Itapiranga, Silves"', add
label define geo2_br_lbl 076013017 `"Humaitá"', add
label define geo2_br_lbl 076013018 `"Santo Antônio do Içá, Tonantins"', add
label define geo2_br_lbl 076013019 `"Barcelos, Novo Airão"', add
label define geo2_br_lbl 076013020 `"São Gabriel da Cachoeira"', add
label define geo2_br_lbl 076013021 `"Itamarati, Carauari"', add
label define geo2_br_lbl 076013022 `"Benjamin Constant"', add
label define geo2_br_lbl 076013023 `"Autazes"', add
label define geo2_br_lbl 076013024 `"Boca do Acre"', add
label define geo2_br_lbl 076013025 `"Tapauá, Canutama"', add
label define geo2_br_lbl 076013026 `"Nova Olinda do Norte"', add
label define geo2_br_lbl 076013027 `"Jutaí, Juruá"', add
label define geo2_br_lbl 076013028 `"Anori, Anamã"', add
label define geo2_br_lbl 076013029 `"Japurá, Santa Isabel do Rio Negro"', add
label define geo2_br_lbl 076013030 `"Barreirinha"', add
label define geo2_br_lbl 076013031 `"Codajás"', add
label define geo2_br_lbl 076013032 `"Fonte Boa"', add
label define geo2_br_lbl 076014001 `"Amajari, Alto Alegre, Iracema, Mucajaí, Caracaraí, Rorainópolis, Pacaraima, Cantá, Boa Vista, Uiramutã, Bonfim, Normandia, São Luiz, São João da Baliza, Caroebe"', add
label define geo2_br_lbl 076015001 `"Belém"', add
label define geo2_br_lbl 076015002 `"Marabá, Parauapebas, Água Azul do Norte, Canaã dos Carajás, Curionópolis, Eldorado dos Carajás"', add
label define geo2_br_lbl 076015003 `"Ananindeua"', add
label define geo2_br_lbl 076015004 `"Vitória do Xingu, Senador José Porfírio, Portel, Anapu, Pacajá, Novo Repartimento, Tucuruí, Jacundá"', add
label define geo2_br_lbl 076015005 `"Santarém, Belterra, Placas"', add
label define geo2_br_lbl 076015006 `"Breu Branco, Moju, Goianésia do Pará, Ipixuna do Pará, Rondon do Pará, Aurora do Pará, São Domingos do Capim"', add
label define geo2_br_lbl 076015007 `"Redenção, Pau D'Arco, Rio Maria, Xinguara, Conceição do Araguaia, Floresta do Araguaia, Sapucaia, Piçarra, São Geraldo do Araguaia"', add
label define geo2_br_lbl 076015008 `"Altamira, Uruará, Prainha, Medicilândia, Brasil Novo"', add
label define geo2_br_lbl 076015009 `"Paragominas, Dom Eliseu, Ulianópolis"', add
label define geo2_br_lbl 076015010 `"Marituba, Santa Bárbara do Pará, Benevides"', add
label define geo2_br_lbl 076015011 `"Castanhal"', add
label define geo2_br_lbl 076015012 `"São Félix do Xingu, Ourilândia do Norte, Cumaru do Norte, Tucumã, Bannach"', add
label define geo2_br_lbl 076015013 `"Jacareacanga, Itaituba, Trairão, Novo Progresso"', add
label define geo2_br_lbl 076015014 `"Abaetetuba"', add
label define geo2_br_lbl 076015015 `"Tracuateua, Bragança"', add
label define geo2_br_lbl 076015016 `"Tailândia, Acará"', add
label define geo2_br_lbl 076015017 `"Cametá"', add
label define geo2_br_lbl 076015018 `"Barcarena"', add
label define geo2_br_lbl 076015019 `"Nova Esperança do Piriá, Viseu, Cachoeira do Piriá"', add
label define geo2_br_lbl 076015020 `"Breves"', add
label define geo2_br_lbl 076015021 `"São João do Araguaia, Bom Jesus do Tocantins, São Domingos do Araguaia, Brejo Grande do Araguaia, Abel Figueiredo, Palestina do Pará"', add
label define geo2_br_lbl 076015022 `"Santana do Araguaia, Santa Maria das Barreiras"', add
label define geo2_br_lbl 076015023 `"Alenquer, Curuá"', add
label define geo2_br_lbl 076015024 `"Itupiranga, Nova Ipixuna"', add
label define geo2_br_lbl 076015025 `"Bujaru, Inhangapi, Concórdia do Pará"', add
label define geo2_br_lbl 076015026 `"Capanema"', add
label define geo2_br_lbl 076015027 `"Oriximiná"', add
label define geo2_br_lbl 076015028 `"Ourém, Garrafão do Norte, Santa Luzia do Pará"', add
label define geo2_br_lbl 076015029 `"Santa Isabel do Pará"', add
label define geo2_br_lbl 076015030 `"Irituia, Mãe do Rio"', add
label define geo2_br_lbl 076015031 `"Salinópolis, São João de Pirabas"', add
label define geo2_br_lbl 076015032 `"Igarapé-Miri"', add
label define geo2_br_lbl 076015033 `"Monte Alegre"', add
label define geo2_br_lbl 076015034 `"Tomé-Açu"', add
label define geo2_br_lbl 076015035 `"Afuá, Chaves"', add
label define geo2_br_lbl 076015036 `"Aveiro, Rurópolis"', add
label define geo2_br_lbl 076015037 `"São Miguel do Guamá"', add
label define geo2_br_lbl 076015038 `"Capitão Poço"', add
label define geo2_br_lbl 076015039 `"São Francisco do Pará, Marapanim, Magalhães Barata"', add
label define geo2_br_lbl 076015040 `"Óbidos"', add
label define geo2_br_lbl 076015041 `"Vigia"', add
label define geo2_br_lbl 076015042 `"Juruti"', add
label define geo2_br_lbl 076015043 `"Curuçá, Terra Alta"', add
label define geo2_br_lbl 076015044 `"Augusto Corrêa"', add
label define geo2_br_lbl 076015045 `"Santo Antônio do Tauá, Colares"', add
label define geo2_br_lbl 076015046 `"Baião"', add
label define geo2_br_lbl 076015047 `"Igarapé-Açu"', add
label define geo2_br_lbl 076015048 `"Almeirim"', add
label define geo2_br_lbl 076015049 `"Muaná"', add
label define geo2_br_lbl 076015050 `"Porto de Moz"', add
label define geo2_br_lbl 076015051 `"Gurupá"', add
label define geo2_br_lbl 076015052 `"Santa Cruz do Arari, Cachoeira do Arari"', add
label define geo2_br_lbl 076015053 `"Maracanã"', add
label define geo2_br_lbl 076015054 `"Curralinho"', add
label define geo2_br_lbl 076015055 `"Mocajuba"', add
label define geo2_br_lbl 076015056 `"Ponta de Pedras"', add
label define geo2_br_lbl 076015057 `"Oeiras do Pará"', add
label define geo2_br_lbl 076015058 `"Anajás"', add
label define geo2_br_lbl 076015059 `"Melgaço"', add
label define geo2_br_lbl 076015060 `"Bagre"', add
label define geo2_br_lbl 076015061 `"Faro, Terra Santa"', add
label define geo2_br_lbl 076015062 `"Limoeiro do Ajuru"', add
label define geo2_br_lbl 076015063 `"São Sebastião da Boa Vista"', add
label define geo2_br_lbl 076015064 `"Santa Maria do Pará"', add
label define geo2_br_lbl 076015065 `"Primavera, Quatipuru"', add
label define geo2_br_lbl 076015066 `"Soure"', add
label define geo2_br_lbl 076015067 `"São Caetano de Odivelas, São João da Ponta"', add
label define geo2_br_lbl 076015068 `"Bonito, Peixe-Boi"', add
label define geo2_br_lbl 076015069 `"Salvaterra"', add
label define geo2_br_lbl 076015070 `"Nova Timboteua, Santarém Novo"', add
label define geo2_br_lbl 076016001 `"Pedra Branca do Amapari, Serra do Navio, Porto Grande, Santana, Macapá, Cutias, Itaubal"', add
label define geo2_br_lbl 076016002 `"Laranjal do Jari, Mazagão, Vitória do Jari"', add
label define geo2_br_lbl 076016003 `"Pracuúba, Ferreira Gomes, Amapá, Tartarugalzinho"', add
label define geo2_br_lbl 076016004 `"Oiapoque, Calçoene"', add
label define geo2_br_lbl 076021001 `"Bom Jesus das Selvas, Buriticupu, Grajaú, Formosa da Serra Negra, Arame, Alto Alegre do Pindaré, Santa Luzia, Itaipava do Grajaú, Barra do Corda, Mirador, Fernando Falcão, Jenipapo dos Vieiras, Marajá do Sena, Tufilândia, Paulo Ramos, Brejo de "', add
label define geo2_br_lbl 076021002 `"São Luís"', add
label define geo2_br_lbl 076021003 `"São Pedro da Água Branca, Vila Nova dos Martírios, Cidelândia, Açailândia, Imperatriz, Itinga do Maranhão, São Francisco do Brejão, Governador Edison Lobão, Davinópolis, Centro Novo do Maranhão, Boa Vista do Gurupi, Junco do Maranhão, Carutaper"', add
label define geo2_br_lbl 076021004 `"São João do Soter, Caxias"', add
label define geo2_br_lbl 076021005 `"São José de Ribamar"', add
label define geo2_br_lbl 076021006 `"Barreirinhas, Santana do Maranhão, Paulino Neves, Tutóia, São Bernardo"', add
label define geo2_br_lbl 076021007 `"Timon"', add
label define geo2_br_lbl 076021008 `"Paço do Lumiar, Raposa"', add
label define geo2_br_lbl 076021009 `"Pedro do Rosário, Presidente Sarney, Pinheiro"', add
label define geo2_br_lbl 076021010 `"Governador Newton Bello, Zé Doca, Araguanã, Monção"', add
label define geo2_br_lbl 076021011 `"Nova Olinda do Maranhão, Santa Luzia do Paruá, Presidente Médici, Turiaçu, Turilândia"', add
label define geo2_br_lbl 076021012 `"Carolina, Estreito, São Pedro dos Crentes, Sítio Novo, Nova Colinas, Fortaleza dos Nogueiras"', add
label define geo2_br_lbl 076021013 `"Balsas, São Raimundo das Mangabeiras"', add
label define geo2_br_lbl 076021014 `"Bacuri, Serrano do Maranhão, Apicum-Açu, Cururupu, Porto Rico do Maranhão, Cedral"', add
label define geo2_br_lbl 076021015 `"Miranda do Norte, Itapecuru Mirim"', add
label define geo2_br_lbl 076021016 `"Colinas, Jatobá, Fortuna, Paraibano"', add
label define geo2_br_lbl 076021017 `"Chapadinha"', add
label define geo2_br_lbl 076021018 `"Araioses, Água Doce do Maranhão, Magalhães de Almeida"', add
label define geo2_br_lbl 076021019 `"Bacabeira, Rosário, Axixá"', add
label define geo2_br_lbl 076021020 `"Maranhãozinho, Governador Nunes Freire, Cândido Mendes"', add
label define geo2_br_lbl 076021021 `"Coelho Neto, Duque Bacelar"', add
label define geo2_br_lbl 076021022 `"Centro do Guilherme, Maracaçumé, Amapá do Maranhão, Luís Domingues, Godofredo Viana"', add
label define geo2_br_lbl 076021023 `"São Vicente Ferrer, Olinda Nova do Maranhão, São João Batista"', add
label define geo2_br_lbl 076021024 `"João Lisboa, Senador La Rocque, Buritirana"', add
label define geo2_br_lbl 076021025 `"Bom Jardim, São João do Carú"', add
label define geo2_br_lbl 076021026 `"Vargem Grande"', add
label define geo2_br_lbl 076021027 `"Viana"', add
label define geo2_br_lbl 076021028 `"São Benedito do Rio Preto, Urbano Santos, Belágua"', add
label define geo2_br_lbl 076021029 `"Tuntum, Santa Filomena do Maranhão"', add
label define geo2_br_lbl 076021030 `"Campestre do Maranhão, Porto Franco, São João do Paraíso"', add
label define geo2_br_lbl 076021031 `"Brejo, Milagres do Maranhão"', add
label define geo2_br_lbl 076021032 `"São Domingos do Maranhão, Governador Luiz Rocha"', add
label define geo2_br_lbl 076021033 `"São Bento"', add
label define geo2_br_lbl 076021034 `"Santa Helena"', add
label define geo2_br_lbl 076021035 `"Presidente Juscelino, Cachoeira Grande, Morros"', add
label define geo2_br_lbl 076021036 `"São Mateus do Maranhão"', add
label define geo2_br_lbl 076021037 `"Amarante do Maranhão"', add
label define geo2_br_lbl 076021038 `"Cajapió, Bacurituba, Alcântara"', add
label define geo2_br_lbl 076021039 `"Parnarama"', add
label define geo2_br_lbl 076021040 `"Matões do Norte, Cantanhede"', add
label define geo2_br_lbl 076021041 `"Mirinzal, Central do Maranhão, Guimarães"', add
label define geo2_br_lbl 076021042 `"Penalva"', add
label define geo2_br_lbl 076021043 `"Loreto, São Félix de Balsas, Benedito Leite, São Domingos do Azeitão, Nova Iorque"', add
label define geo2_br_lbl 076021044 `"Palmeirândia, Peri Mirim"', add
label define geo2_br_lbl 076021045 `"Santa Rita"', add
label define geo2_br_lbl 076021046 `"Barão de Grajaú, São Francisco do Maranhão"', add
label define geo2_br_lbl 076021047 `"Matões"', add
label define geo2_br_lbl 076021048 `"São João dos Patos, Sucupira do Riachão"', add
label define geo2_br_lbl 076021049 `"Aldeias Altas, Afonso Cunha"', add
label define geo2_br_lbl 076021050 `"Primeira Cruz, Santo Amaro do Maranhão"', add
label define geo2_br_lbl 076021051 `"Santa Quitéria do Maranhão"', add
label define geo2_br_lbl 076021052 `"Sucupira do Norte, Pastos Bons"', add
label define geo2_br_lbl 076021053 `"Mata Roma, Anapurus"', add
label define geo2_br_lbl 076021054 `"Arari"', add
label define geo2_br_lbl 076021055 `"Riachão, Feira Nova do Maranhão"', add
label define geo2_br_lbl 076021056 `"Passagem Franca, Lagoa do Mato"', add
label define geo2_br_lbl 076021057 `"Humberto de Campos"', add
label define geo2_br_lbl 076021058 `"Buriti"', add
label define geo2_br_lbl 076021059 `"Anajatuba"', add
label define geo2_br_lbl 076021060 `"Icatu"', add
label define geo2_br_lbl 076021061 `"Buriti Bravo"', add
label define geo2_br_lbl 076021062 `"Alto Parnaíba, Tasso Fragoso, Sambaíba"', add
label define geo2_br_lbl 076021063 `"Ribamar Fiquene, Montes Altos, Lajeado Novo"', add
label define geo2_br_lbl 076021064 `"Presidente Vargas, Nina Rodrigues"', add
label define geo2_br_lbl 076021065 `"Matinha"', add
label define geo2_br_lbl 076021066 `"Bequimão"', add
label define geo2_br_lbl 076022001 `"Teresina, Nazária"', add
label define geo2_br_lbl 076022002 `"Arraial, Oeiras, Cajazeiras do Piauí, Tanque do Piauí, Santa Rosa do Piauí, Colônia do Piauí, Francinópolis, Santo Inácio do Piauí, Campinas do Piauí, São João da Varjota, Wall Ferraz, Santa Cruz do Piauí, Floresta do Piauí, Paquetá, Isaías Coe"', add
label define geo2_br_lbl 076022003 `"Batalha, Capitão de Campos, Piripiri, São José do Divino, Brasileira, Piracuruca, Milton Brandão, Pedro II, Lagoa de São Francisco, Domingos Mourão, São João da Fronteira"', add
label define geo2_br_lbl 076022004 `"Parnaíba, Ilha Grande, Bom Princípio do Piauí, Luís Correia, Cajueiro da Praia"', add
label define geo2_br_lbl 076022005 `"Queimada Nova, Patos do Piauí, Jacobina do Piauí, Paulistana, Jaicós, Massapê do Piauí, Campo Grande do Piauí, Acauã, Caridade do Piauí, Betânia do Piauí, Simões, Curral Novo do Piauí"', add
label define geo2_br_lbl 076022006 `"Jurema, Anísio de Abreu, São Braz do Piauí, Várzea Branca, Bonfim do Piauí, São Raimundo Nonato, Fartura do Piauí, Dirceu Arcoverde, São Lourenço do Piauí, Coronel José Dias, Dom Inocêncio"', add
label define geo2_br_lbl 076022007 `"Campo Maior, Nossa Senhora de Nazaré, Boqueirão do Piauí, Jatobá do Piauí, Cocal de Telha, Sigefredo Pacheco"', add
label define geo2_br_lbl 076022008 `"Barras, Cabeceiras do Piauí, Boa Hora"', add
label define geo2_br_lbl 076022009 `"Nazaré do Piauí, São José do Peixe, Francisco Ayres, São Francisco do Piauí, Socorro do Piauí, São Miguel do Fidalgo, Paes Landim, Simplício Mendes, Bela Vista do Piauí, Conceição do Canindé, São Francisco de Assis do Piauí"', add
label define geo2_br_lbl 076022010 `"Floriano"', add
label define geo2_br_lbl 076022011 `"Gilbués, Monte Alegre do Piauí, Bom Jesus, Currais, Redenção do Gurguéia"', add
label define geo2_br_lbl 076022012 `"Matias Olímpio, Madeiro, Luzilândia, São João do Arraial, Joca Marques"', add
label define geo2_br_lbl 076022013 `"Demerval Lobão, Lagoa do Piauí, Beneditinos, Passagem Franca do Piauí, Elesbão Veloso, São Miguel da Baixa Grande, São Félix do Piauí, Prata do Piauí"', add
label define geo2_br_lbl 076022014 `"Joaquim Pires, Murici dos Portelas, Caxingó, Buriti dos Lopes, Caraúbas do Piauí"', add
label define geo2_br_lbl 076022015 `"União, Lagoa Alegre"', add
label define geo2_br_lbl 076022016 `"Uruçuí, Palmeira do Piauí, Sebastião Leal, Antônio Almeida, Porto Alegre do Piauí, Bertolínia, Canavieira, Jerumenha"', add
label define geo2_br_lbl 076022017 `"Angical do Piauí, Agricolândia, Santo Antônio dos Milagres, São Gonçalo do Piauí, Água Branca, Lagoinha do Piauí, Olho D'Água do Piauí, Barro Duro"', add
label define geo2_br_lbl 076022018 `"Altos, Coivaras, Pau D'Arco do Piauí"', add
label define geo2_br_lbl 076022019 `"Ribeira do Piauí, João Costa, São João do Piauí, Pedro Laurentino, Nova Santa Rita, Capitão Gervásio Oliveira, Campo Alegre do Fidalgo, Lagoa do Barro do Piauí"', add
label define geo2_br_lbl 076022020 `"São Miguel do Tapuio, Santa Cruz dos Milagres, Aroazes, Pimenteiras, Assunção do Piauí"', add
label define geo2_br_lbl 076022021 `"Guaribas, Canto do Buriti, Caracol, Tamboril do Piauí, Brejo do Piauí, Pajeú do Piauí"', add
label define geo2_br_lbl 076022022 `"Esperantina, Morro do Chapéu do Piauí"', add
label define geo2_br_lbl 076022023 `"Valença do Piauí, Lagoa do Sítio, São João da Canabrava, Bocaina, São Luis do Piauí"', add
label define geo2_br_lbl 076022024 `"José de Freitas"', add
label define geo2_br_lbl 076022025 `"Colônia do Gurguéia, Eliseu Martins, Pavussu, Itaueira, Rio Grande do Piauí, Flores do Piauí"', add
label define geo2_br_lbl 076022026 `"Corrente, Cristalândia do Piauí, Sebastião Barros"', add
label define geo2_br_lbl 076022027 `"Miguel Alves"', add
label define geo2_br_lbl 076022028 `"Cocal, Cocal dos Alves"', add
label define geo2_br_lbl 076022029 `"Curimatá, Júlio Borges, Morro Cabeça no Tempo, Avelino Lopes"', add
label define geo2_br_lbl 076022030 `"Castelo do Piauí, Juazeiro do Piauí, Buriti dos Montes"', add
label define geo2_br_lbl 076022031 `"Palmeirais, Amarante"', add
label define geo2_br_lbl 076022032 `"Curralinhos, São Pedro do Piauí, Miguel Leão, Monsenhor Gil"', add
label define geo2_br_lbl 076022033 `"Várzea Grande, Barra D'Alcântara, Novo Oriente do Piauí, Inhuma"', add
label define geo2_br_lbl 076022034 `"São Julião, Alegrete do Piauí, Caldeirão Grande do Piauí, Fronteiras"', add
label define geo2_br_lbl 076022035 `"Porto, Nossa Senhora dos Remédios, Campo Largo do Piauí"', add
label define geo2_br_lbl 076022036 `"Alvorada do Gurguéia, Manoel Emídio, Santa Luz, Cristino Castro"', add
label define geo2_br_lbl 076022037 `"Regeneração, Jardim do Mulato, Hugo Napoleão"', add
label define geo2_br_lbl 076022038 `"Pio IX, Alagoinha do Piauí"', add
label define geo2_br_lbl 076022039 `"Santa Filomena, Ribeiro Gonçalves, Baixa Grande do Ribeiro"', add
label define geo2_br_lbl 076022040 `"Belém do Piauí, Padre Marcos, Vila Nova do Piauí, Francisco Macedo, Marcolândia"', add
label define geo2_br_lbl 076022041 `"Alto Longá, São João da Serra, Novo Santo Antônio"', add
label define geo2_br_lbl 076022042 `"Ipiranga do Piauí, Dom Expedito Lopes, São José do Piauí"', add
label define geo2_br_lbl 076022043 `"Santo Antônio de Lisboa, Francisco Santos, Monsenhor Hipólito"', add
label define geo2_br_lbl 076022044 `"Barreiras do Piauí, São Gonçalo do Gurguéia, Riacho Frio, Parnaguá"', add
label define geo2_br_lbl 076022045 `"Landri Sales, Marcos Parente, Guadalupe"', add
label define geo2_br_lbl 076023001 `"Fortaleza"', add
label define geo2_br_lbl 076023002 `"Caucaia"', add
label define geo2_br_lbl 076023003 `"Maranguape, Maracanaú"', add
label define geo2_br_lbl 076023004 `"Juazeiro do Norte"', add
label define geo2_br_lbl 076023005 `"Sobral, Groaíras, Forquilha"', add
label define geo2_br_lbl 076023006 `"Miraíma, Amontada, Itapipoca"', add
label define geo2_br_lbl 076023007 `"Choró, Quixadá, Itapiúna, Banabuiú, Ibaretama"', add
label define geo2_br_lbl 076023008 `"Pacajus, Horizonte, Chorozinho"', add
label define geo2_br_lbl 076023009 `"Jijoca de Jericoacoara, Cruz, Acaraú, Itarema"', add
label define geo2_br_lbl 076023010 `"Guaiúba, Pacatuba, Itaitinga"', add
label define geo2_br_lbl 076023011 `"Crato"', add
label define geo2_br_lbl 076023012 `"Aquiraz, Eusébio"', add
label define geo2_br_lbl 076023013 `"Iguatu, Quixelô"', add
label define geo2_br_lbl 076023014 `"Itatira, Madalena, Quixeramobim"', add
label define geo2_br_lbl 076023015 `"Aracati, Fortim, Icapuí"', add
label define geo2_br_lbl 076023016 `"Canindé, Paramoti"', add
label define geo2_br_lbl 076023017 `"Poranga, Crateús"', add
label define geo2_br_lbl 076023018 `"Cascavel, Pindoretama"', add
label define geo2_br_lbl 076023019 `"Catarina, Acopiara, Piquet Carneiro"', add
label define geo2_br_lbl 076023020 `"Morada Nova, Ibicuitinga, São João do Jaguaribe"', add
label define geo2_br_lbl 076023021 `"Barroquinha, Camocim"', add
label define geo2_br_lbl 076023022 `"Tianguá"', add
label define geo2_br_lbl 076023023 `"Croatá, Guaraciaba do Norte, Carnaubal"', add
label define geo2_br_lbl 076023024 `"Cariré, Santa Quitéria, Catunda"', add
label define geo2_br_lbl 076023025 `"Monsenhor Tabosa, Boa Viagem"', add
label define geo2_br_lbl 076023026 `"Russas"', add
label define geo2_br_lbl 076023027 `"Icó"', add
label define geo2_br_lbl 076023028 `"Uruburetama, Umirim, Tururu, São Luís do Curu"', add
label define geo2_br_lbl 076023029 `"Tejuçuoca, Itapagé"', add
label define geo2_br_lbl 076023030 `"Granja, Chaval"', add
label define geo2_br_lbl 076023031 `"Paraipaba, Paracuru"', add
label define geo2_br_lbl 076023032 `"Redenção, Acarape, Barreira"', add
label define geo2_br_lbl 076023033 `"Porteiras, Brejo Santo"', add
label define geo2_br_lbl 076023034 `"São Benedito, Graça"', add
label define geo2_br_lbl 076023035 `"Quixeré, Itaiçaba, Jaguaruana"', add
label define geo2_br_lbl 076023036 `"Beberibe, Palhano"', add
label define geo2_br_lbl 076023037 `"Deputado Irapuan Pinheiro, Milhã, Solonópole, Jaguaretama"', add
label define geo2_br_lbl 076023038 `"Ipueiras, Hidrolândia"', add
label define geo2_br_lbl 076023039 `"Limoeiro do Norte"', add
label define geo2_br_lbl 076023040 `"Lavras da Mangabeira, Umari, Baixio, Ipaumirim"', add
label define geo2_br_lbl 076023041 `"Tauá"', add
label define geo2_br_lbl 076023042 `"Viçosa do Ceará"', add
label define geo2_br_lbl 076023043 `"Barbalha"', add
label define geo2_br_lbl 076023044 `"Trairi"', add
label define geo2_br_lbl 076023045 `"Ipaporanga, Ararendá, Nova Russas"', add
label define geo2_br_lbl 076023046 `"Ipu, Pires Ferreira"', add
label define geo2_br_lbl 076023047 `"Salitre, Campos Sales, Antonina do Norte"', add
label define geo2_br_lbl 076023048 `"Aracoiaba, Ocara"', add
label define geo2_br_lbl 076023049 `"Assaré, Tarrafas, Cariús"', add
label define geo2_br_lbl 076023050 `"Jaguaribara, Iracema, Alto Santo, Potiretama"', add
label define geo2_br_lbl 076023051 `"Missão Velha, Abaiara"', add
label define geo2_br_lbl 076023052 `"Quiterianópolis, Independência"', add
label define geo2_br_lbl 076023053 `"Ubajara, Frecheirinha"', add
label define geo2_br_lbl 076023054 `"Mauriti"', add
label define geo2_br_lbl 076023055 `"Aratuba, Mulungu, Guaramiranga, Capistrano"', add
label define geo2_br_lbl 076023056 `"Farias Brito, Caririaçu"', add
label define geo2_br_lbl 076023057 `"São Gonçalo do Amarante"', add
label define geo2_br_lbl 076023058 `"Várzea Alegre, Granjeiro"', add
label define geo2_br_lbl 076023059 `"Jardim, Penaforte, Jati"', add
label define geo2_br_lbl 076023060 `"Mombaça"', add
label define geo2_br_lbl 076023061 `"Pedra Branca"', add
label define geo2_br_lbl 076023062 `"Aiuaba, Arneiroz, Saboeiro"', add
label define geo2_br_lbl 076023063 `"Moraújo, Uruoca, Martinópole, Senador Sá"', add
label define geo2_br_lbl 076023064 `"Reriutaba, Varjota"', add
label define geo2_br_lbl 076023065 `"Pentecoste"', add
label define geo2_br_lbl 076023066 `"Massapê"', add
label define geo2_br_lbl 076023067 `"Jaguaribe"', add
label define geo2_br_lbl 076023068 `"Baturité"', add
label define geo2_br_lbl 076023069 `"Bela Cruz"', add
label define geo2_br_lbl 076023070 `"Parambu"', add
label define geo2_br_lbl 076023071 `"Tabuleiro do Norte"', add
label define geo2_br_lbl 076023072 `"Santana do Acaraú"', add
label define geo2_br_lbl 076023073 `"Milagres"', add
label define geo2_br_lbl 076023074 `"Novo Oriente"', add
label define geo2_br_lbl 076023075 `"Senador Pompeu"', add
label define geo2_br_lbl 076023076 `"Potengi, Santana do Cariri"', add
label define geo2_br_lbl 076023077 `"Marco"', add
label define geo2_br_lbl 076023078 `"Cedro"', add
label define geo2_br_lbl 076023079 `"Tamboril"', add
label define geo2_br_lbl 076023080 `"Alcântaras, Meruoca"', add
label define geo2_br_lbl 076023081 `"Ibiapina"', add
label define geo2_br_lbl 076023082 `"Aurora"', add
label define geo2_br_lbl 076023083 `"Jucás"', add
label define geo2_br_lbl 076023084 `"Pacoti, Palmácia"', add
label define geo2_br_lbl 076023085 `"Pereiro, Ererê"', add
label define geo2_br_lbl 076023086 `"Coreaú"', add
label define geo2_br_lbl 076023087 `"Barro"', add
label define geo2_br_lbl 076023088 `"Irauçuba"', add
label define geo2_br_lbl 076023089 `"Orós"', add
label define geo2_br_lbl 076023090 `"Araripe"', add
label define geo2_br_lbl 076023091 `"Altaneira, Nova Olinda"', add
label define geo2_br_lbl 076023092 `"Morrinhos"', add
label define geo2_br_lbl 076023093 `"General Sampaio, Apuiarés"', add
label define geo2_br_lbl 076023094 `"Caridade"', add
label define geo2_br_lbl 076023095 `"Mucambo, Pacujá"', add
label define geo2_br_lbl 076024001 `"Natal"', add
label define geo2_br_lbl 076024002 `"Baraúna, Mossoró, Grossos, Açu, Areia Branca, Serra do Mel, Carnaubais, Porto do Mangue, Alto do Rodrigues, Tibau"', add
label define geo2_br_lbl 076024003 `"Parnamirim"', add
label define geo2_br_lbl 076024004 `"São Gonçalo do Amarante"', add
label define geo2_br_lbl 076024005 `"São Francisco do Oeste, Francisco Dantas, Rodolfo Fernandes, Taboleiro Grande, Apodi, Severiano Melo, Riacho da Cruz, Itaú, Rafael Godeiro, Olho-d'Água do Borges"', add
label define geo2_br_lbl 076024006 `"Ceará-Mirim"', add
label define geo2_br_lbl 076024007 `"Macaíba"', add
label define geo2_br_lbl 076024008 `"Caicó"', add
label define geo2_br_lbl 076024009 `"Passa e Fica, Nova Cruz, Montanhas"', add
label define geo2_br_lbl 076024010 `"Lagoa Nova, Currais Novos"', add
label define geo2_br_lbl 076024011 `"Canguaretama, Tibau do Sul, Baía Formosa, Vila Flor"', add
label define geo2_br_lbl 076024012 `"Lagoa Salgada, Vera Cruz, Monte Alegre, Brejinho"', add
label define geo2_br_lbl 076024013 `"Campo Redondo, Lajes Pintadas, Santa Cruz"', add
label define geo2_br_lbl 076024014 `"Touros, São Miguel do Gostoso, Pureza"', add
label define geo2_br_lbl 076024015 `"João Câmara, Poço Branco"', add
label define geo2_br_lbl 076024016 `"Serra de São Bento, Lagoa d'Anta, Santo Antônio, Lagoa de Pedras, Passagem"', add
label define geo2_br_lbl 076024017 `"Florânia, São José do Seridó, Cruzeta, Tenente Laurentino Cruz, Acari, São Vicente"', add
label define geo2_br_lbl 076024018 `"Governador Dix-Sept Rosado, Augusto Severo, Upanema, Triunfo Potiguar, Paraú"', add
label define geo2_br_lbl 076024019 `"Arês, Nísia Floresta, Senador Georgino Avelino"', add
label define geo2_br_lbl 076024020 `"Jardim de Piranhas, Jucurutu, São Rafael"', add
label define geo2_br_lbl 076024021 `"Riacho de Santana, Marcelino Vieira, Alexandria, Pilões, Antônio Martins, João Dias"', add
label define geo2_br_lbl 076024022 `"São José de Mipibu"', add
label define geo2_br_lbl 076024023 `"Guamaré, Galinhos, Jandaíra, Caiçara do Norte, Parazinho, São Bento do Norte, Pedra Grande"', add
label define geo2_br_lbl 076024024 `"Santana do Matos, Angicos, Fernando Pedroza, Bodó, Pedro Avelino"', add
label define geo2_br_lbl 076024025 `"São Tomé, Pedra Preta, Caiçara do Rio do Vento, Jardim de Angicos, Ruy Barbosa, Riachuelo, Bento Fernandes"', add
label define geo2_br_lbl 076024026 `"Tangará, São José do Campestre, Monte das Gameleiras, Serrinha"', add
label define geo2_br_lbl 076024027 `"Várzea, Espírito Santo, Pedro Velho, Jundiá"', add
label define geo2_br_lbl 076024028 `"Luís Gomes, Paraná, Major Sales, José da Penha, Tenente Ananias"', add
label define geo2_br_lbl 076024029 `"Umarizal, Almino Afonso, Patu, Messias Targino"', add
label define geo2_br_lbl 076024030 `"Felipe Guerra, Caraúbas, Janduís"', add
label define geo2_br_lbl 076024031 `"Portalegre, Serrinha dos Pintos, Viçosa, Martins, Frutuoso Gomes, Lucrécia"', add
label define geo2_br_lbl 076024032 `"Macau"', add
label define geo2_br_lbl 076024033 `"Pau dos Ferros"', add
label define geo2_br_lbl 076024034 `"Parelhas, Carnaúba dos Dantas"', add
label define geo2_br_lbl 076024035 `"Presidente Juscelino, Januário Cicco, Bom Jesus"', add
label define geo2_br_lbl 076024036 `"Extremoz"', add
label define geo2_br_lbl 076024037 `"São Miguel, Venha-Ver"', add
label define geo2_br_lbl 076024038 `"Ouro Branco, Jardim do Seridó, Santana do Seridó, Equador"', add
label define geo2_br_lbl 076024039 `"Coronel João Pessoa, Doutor Severiano, Encanto, Água Nova, Rafael Fernandes"', add
label define geo2_br_lbl 076024040 `"Afonso Bezerra, Pendências"', add
label define geo2_br_lbl 076024041 `"Sítio Novo, Barcelona, Lagoa de Velhos, Senador Elói de Souza, São Pedro"', add
label define geo2_br_lbl 076024042 `"Taipu, Ielmo Marinho"', add
label define geo2_br_lbl 076024043 `"Coronel Ezequiel, Jaçanã, São Bento do Trairí, Japi"', add
label define geo2_br_lbl 076024044 `"Goianinha"', add
label define geo2_br_lbl 076024045 `"Serra Negra do Norte, Timbaúba dos Batistas, São João do Sabugi, Ipueira, São Fernando"', add
label define geo2_br_lbl 076024046 `"Cerro Corá, Lajes"', add
label define geo2_br_lbl 076024047 `"Ipanguaçu, Itajá"', add
label define geo2_br_lbl 076024048 `"São Paulo do Potengi, Santa Maria"', add
label define geo2_br_lbl 076024049 `"Maxaranguape, Rio do Fogo"', add
label define geo2_br_lbl 076025001 `"João Pessoa"', add
label define geo2_br_lbl 076025002 `"Boa Vista, Campina Grande"', add
label define geo2_br_lbl 076025003 `"Santa Rita, Lucena"', add
label define geo2_br_lbl 076025004 `"Seridó, Cubati, Barra de Santa Rosa, Sossêgo, Cuité, Damião, Cacimba de Dentro, Araruna, Riachão, Tacima"', add
label define geo2_br_lbl 076025005 `"Patos"', add
label define geo2_br_lbl 076025006 `"Bayeux"', add
label define geo2_br_lbl 076025007 `"Sousa, Marizópolis, Vieirópolis, Aparecida, São Francisco"', add
label define geo2_br_lbl 076025008 `"Lagoa de Dentro, Curral de Cima, Itapororoca, Cuité de Mamanguape, Mamanguape, Capim"', add
label define geo2_br_lbl 076025009 `"São Miguel de Taipu, Pedras de Fogo, Cruz do Espírito Santo, Alhandra"', add
label define geo2_br_lbl 076025010 `"Sobrado, Riachão do Poço, Sapé"', add
label define geo2_br_lbl 076025011 `"Cabedelo"', add
label define geo2_br_lbl 076025012 `"Olho d'Água, Emas, Imaculada, Catingueira, São José de Espinharas, Santa Teresinha, Mãe d'Água, São José do Bonfim, Cacimba de Areia, São Mamede, Quixabá, Várzea"', add
label define geo2_br_lbl 076025013 `"Cajazeiras"', add
label define geo2_br_lbl 076025014 `"Guarabira"', add
label define geo2_br_lbl 076025015 `"Santa Cecília, Gado Bravo, Umbuzeiro, Aroeiras, Itatuba"', add
label define geo2_br_lbl 076025016 `"Passagem, Livramento, Taperoá, Areia de Baraúnas, Salgadinho, Assunção, Tenório, Juazeirinho"', add
label define geo2_br_lbl 076025017 `"Algodão de Jandaíra, Esperança, Remígio"', add
label define geo2_br_lbl 076025018 `"Aguiar, São José da Lagoa Tapada, Igaracy, Piancó, Coremas"', add
label define geo2_br_lbl 076025019 `"Pedra Lavrada, Nova Palmeira, Frei Martinho, Picuí, Baraúna, Nova Floresta"', add
label define geo2_br_lbl 076025020 `"Cachoeira dos Índios, Bom Jesus, Santa Helena, São João do Rio do Peixe, Poço de José de Moura, Nazarezinho"', add
label define geo2_br_lbl 076025021 `"Pombal, São Domingos, Lagoa, Cajazeirinhas, São Bentinho"', add
label define geo2_br_lbl 076025022 `"Rio Tinto, Mataraca, Marcação, Baía da Traição"', add
label define geo2_br_lbl 076025023 `"Fagundes, Ingá, Riachão do Bacamarte, Mogeiro"', add
label define geo2_br_lbl 076025024 `"Alagoa Nova, Massaranduba, Matinhas, Serra Redonda"', add
label define geo2_br_lbl 076025025 `"Queimadas"', add
label define geo2_br_lbl 076025026 `"Mulungu, Gurinhém, Araçagi"', add
label define geo2_br_lbl 076025027 `"Conde, Pitimbu"', add
label define geo2_br_lbl 076025028 `"Lagoa Seca, São Sebastião de Lagoa de Roça"', add
label define geo2_br_lbl 076025029 `"Boqueirão, Riacho de Santo Antônio, Alcantil, Caturité, Barra de Santana"', add
label define geo2_br_lbl 076025030 `"Manaíra, São José de Princesa, Princesa Isabel"', add
label define geo2_br_lbl 076025031 `"Boa Ventura, Pedra Branca, Santana dos Garrotes, Juru, Água Branca"', add
label define geo2_br_lbl 076025032 `"Alagoa Grande, Juarez Távora"', add
label define geo2_br_lbl 076025033 `"Brejo dos Santos, Catolé do Rocha"', add
label define geo2_br_lbl 076025034 `"Maturéia, Teixeira, Cacimbas, Desterro"', add
label define geo2_br_lbl 076025035 `"Zabelê, São Sebastião do Umbuzeiro, Camalaú, São João do Tigre, Serra Branca, Congo, Coxixola"', add
label define geo2_br_lbl 076025036 `"Soledade, Olivedos, Pocinhos"', add
label define geo2_br_lbl 076025037 `"Itabaiana, Juripiranga"', add
label define geo2_br_lbl 076025038 `"Casserengue, Solânea"', add
label define geo2_br_lbl 076025039 `"Triunfo, Bernardino Batista, Santarém, Uiraúna, Poço Dantas"', add
label define geo2_br_lbl 076025040 `"Lastro, Santa Cruz, Bom Sucesso, Jericó, Mato Grosso, Riacho dos Cavalos"', add
label define geo2_br_lbl 076025041 `"Dona Inês, Bananeiras"', add
label define geo2_br_lbl 076025042 `"São José dos Cordeiros, Parari, Santo André, São João do Cariri, Caraúbas, Gurjão, São Domingos do Cariri, Barra de São Miguel, Cabaceiras"', add
label define geo2_br_lbl 076025043 `"São Bento"', add
label define geo2_br_lbl 076025044 `"Monteiro"', add
label define geo2_br_lbl 076025045 `"Caiçara, Logradouro, Jacaraú, Pedro Régis"', add
label define geo2_br_lbl 076025046 `"Belém, Serra da Raiz, Sertãozinho, Duas Estradas"', add
label define geo2_br_lbl 076025047 `"Paulista, Condado, Vista Serrana, Malta"', add
label define geo2_br_lbl 076025048 `"Arara, Serraria, Pilões"', add
label define geo2_br_lbl 076025049 `"Santa Luzia, São José do Sabugi, Junco do Seridó"', add
label define geo2_br_lbl 076025050 `"Ouro Velho, Prata, Amparo, Sumé"', add
label define geo2_br_lbl 076025051 `"Puxinanã, Montadas, Areial"', add
label define geo2_br_lbl 076025052 `"Itaporanga"', add
label define geo2_br_lbl 076025053 `"Monte Horebe, Bonito de Santa Fé, Serra Grande, São José de Caiana"', add
label define geo2_br_lbl 076025054 `"Areia"', add
label define geo2_br_lbl 076025055 `"Natuba, Salgado de São Félix"', add
label define geo2_br_lbl 076025056 `"São José dos Ramos, Caldas Brandão, Pilar"', add
label define geo2_br_lbl 076025057 `"Belém do Brejo do Cruz, Brejo do Cruz, São José do Brejo do Cruz"', add
label define geo2_br_lbl 076025058 `"Conceição, Santa Inês"', add
label define geo2_br_lbl 076025059 `"São José de Piranhas, Carrapateira"', add
label define geo2_br_lbl 076025060 `"Alagoinha, Cuitegi"', add
label define geo2_br_lbl 076025061 `"Nova Olinda, Tavares"', add
label define geo2_br_lbl 076025062 `"Ibiara, Santana de Mangueira, Diamante, Curral Velho"', add
label define geo2_br_lbl 076025063 `"Mari"', add
label define geo2_br_lbl 076025064 `"Borborema, Pilõezinhos, Pirpirituba"', add
label define geo2_br_lbl 076025065 `"Caaporã"', add
label define geo2_br_lbl 076026001 `"Recife"', add
label define geo2_br_lbl 076026002 `"Jaboatão dos Guararapes"', add
label define geo2_br_lbl 076026003 `"Abreu e Lima, Paulista"', add
label define geo2_br_lbl 076026004 `"Olinda"', add
label define geo2_br_lbl 076026005 `"Afrânio, Petrolina, Dormentes"', add
label define geo2_br_lbl 076026006 `"Caruaru"', add
label define geo2_br_lbl 076026007 `"São Lourenço da Mata, Camaragibe"', add
label define geo2_br_lbl 076026008 `"Cabo de Santo Agostinho"', add
label define geo2_br_lbl 076026009 `"Araçoiaba, Igarassu, Itapissuma"', add
label define geo2_br_lbl 076026010 `"Vitória de Santo Antão"', add
label define geo2_br_lbl 076026011 `"Garanhuns"', add
label define geo2_br_lbl 076026012 `"Pesqueira, Alagoinha, Poção, Capoeiras"', add
label define geo2_br_lbl 076026013 `"Gravatá, Chã Grande"', add
label define geo2_br_lbl 076026014 `"Carpina, Lagoa do Carro"', add
label define geo2_br_lbl 076026015 `"Santa Filomena, Ouricuri, Santa Cruz"', add
label define geo2_br_lbl 076026016 `"Santa Cruz do Capibaribe"', add
label define geo2_br_lbl 076026017 `"São Joaquim do Monte, Bonito, Sairé, Barra de Guabiraba"', add
label define geo2_br_lbl 076026018 `"Vertente do Lério, Surubim, Casinhas"', add
label define geo2_br_lbl 076026019 `"Ipojuca"', add
label define geo2_br_lbl 076026020 `"Serra Talhada"', add
label define geo2_br_lbl 076026021 `"Araripina"', add
label define geo2_br_lbl 076026022 `"Terra Nova, Salgueiro, Cedro"', add
label define geo2_br_lbl 076026023 `"Bezerros, Camocim de São Félix"', add
label define geo2_br_lbl 076026024 `"Jataúba, Brejo da Madre de Deus, Tacaimbó"', add
label define geo2_br_lbl 076026025 `"Goiana"', add
label define geo2_br_lbl 076026026 `"Belo Jardim"', add
label define geo2_br_lbl 076026027 `"Arcoverde"', add
label define geo2_br_lbl 076026028 `"Chã de Alegria, Paudalho"', add
label define geo2_br_lbl 076026029 `"Escada"', add
label define geo2_br_lbl 076026030 `"Timbaúba, Camutanga"', add
label define geo2_br_lbl 076026031 `"Lagoa Grande, Santa Maria da Boa Vista"', add
label define geo2_br_lbl 076026032 `"Palmares"', add
label define geo2_br_lbl 076026033 `"Águas Belas, Iati"', add
label define geo2_br_lbl 076026034 `"Barreiros, São José da Coroa Grande"', add
label define geo2_br_lbl 076026035 `"Moreno"', add
label define geo2_br_lbl 076026036 `"Limoeiro"', add
label define geo2_br_lbl 076026037 `"São José do Egito, Tuparetama, Itapetim"', add
label define geo2_br_lbl 076026038 `"Buíque"', add
label define geo2_br_lbl 076026039 `"Cachoeirinha, São Caitano"', add
label define geo2_br_lbl 076026040 `"Carnaubeira da Penha, Floresta, Betânia"', add
label define geo2_br_lbl 076026041 `"São Bento do Una"', add
label define geo2_br_lbl 076026042 `"Bom Jardim, Machados"', add
label define geo2_br_lbl 076026043 `"Sertânia, Iguaraci, Ingazeira"', add
label define geo2_br_lbl 076026044 `"Riacho das Almas, Frei Miguelinho, Cumaru"', add
label define geo2_br_lbl 076026045 `"Itambé, Ferreiros, Fernando de Noronha"', add
label define geo2_br_lbl 076026046 `"Belém de Maria, Catende"', add
label define geo2_br_lbl 076026047 `"Xexéu, Água Preta"', add
label define geo2_br_lbl 076026048 `"Petrolândia, Jatobá"', add
label define geo2_br_lbl 076026049 `"Tabira, Santa Terezinha, Brejinho"', add
label define geo2_br_lbl 076026050 `"Ribeirão"', add
label define geo2_br_lbl 076026051 `"Bom Conselho"', add
label define geo2_br_lbl 076026052 `"Vicência, Buenos Aires"', add
label define geo2_br_lbl 076026053 `"Orocó, Cabrobó"', add
label define geo2_br_lbl 076026054 `"Rio Formoso, Tamandaré"', add
label define geo2_br_lbl 076026055 `"Exu, Moreilândia"', add
label define geo2_br_lbl 076026056 `"Sirinhaém"', add
label define geo2_br_lbl 076026057 `"Panelas, Lagoa dos Gatos"', add
label define geo2_br_lbl 076026058 `"Orobó, São Vicente Ferrer"', add
label define geo2_br_lbl 076026059 `"Jurema, Quipapá"', add
label define geo2_br_lbl 076026060 `"Salgadinho, Passira"', add
label define geo2_br_lbl 076026061 `"Pombos, Primavera"', add
label define geo2_br_lbl 076026062 `"São Benedito do Sul, Jaqueira, Maraial"', add
label define geo2_br_lbl 076026063 `"Inajá, Manari"', add
label define geo2_br_lbl 076026064 `"Aliança"', add
label define geo2_br_lbl 076026065 `"Lajedo"', add
label define geo2_br_lbl 076026066 `"Afogados da Ingazeira"', add
label define geo2_br_lbl 076026067 `"Pedra, Venturosa"', add
label define geo2_br_lbl 076026068 `"Toritama"', add
label define geo2_br_lbl 076026069 `"Custódia"', add
label define geo2_br_lbl 076026070 `"Bodocó"', add
label define geo2_br_lbl 076026071 `"São José do Belmonte"', add
label define geo2_br_lbl 076026072 `"Vertentes, Santa Maria do Cambucá"', add
label define geo2_br_lbl 076026073 `"Quixaba, Carnaíba, Solidão"', add
label define geo2_br_lbl 076026074 `"Nazaré da Mata"', add
label define geo2_br_lbl 076026075 `"João Alfredo"', add
label define geo2_br_lbl 076026076 `"Ibirajuba, Altinho"', add
label define geo2_br_lbl 076026077 `"Tracunhaém, Itaquitinga"', add
label define geo2_br_lbl 076026078 `"Glória do Goitá"', add
label define geo2_br_lbl 076026079 `"Terezinha, Brejão, Lagoa do Ouro"', add
label define geo2_br_lbl 076026080 `"Calumbi, Flores"', add
label define geo2_br_lbl 076026081 `"Cortês, Joaquim Nabuco"', add
label define geo2_br_lbl 076026082 `"Ipubi"', add
label define geo2_br_lbl 076026083 `"Gameleira"', add
label define geo2_br_lbl 076026084 `"Itaíba"', add
label define geo2_br_lbl 076026085 `"Caetés"', add
label define geo2_br_lbl 076026086 `"Saloá, Paranatama"', add
label define geo2_br_lbl 076026087 `"Santa Cruz da Baixa Verde, Triunfo"', add
label define geo2_br_lbl 076026088 `"Ibimirim"', add
label define geo2_br_lbl 076026089 `"Trindade"', add
label define geo2_br_lbl 076026090 `"Taquaritinga do Norte"', add
label define geo2_br_lbl 076026091 `"Correntes, Palmeirina"', add
label define geo2_br_lbl 076026092 `"Granito, Serrita"', add
label define geo2_br_lbl 076026093 `"Canhotinho"', add
label define geo2_br_lbl 076026094 `"Tupanatinga"', add
label define geo2_br_lbl 076026095 `"Belém do São Francisco, Itacuruba"', add
label define geo2_br_lbl 076026096 `"Jucati, Jupi"', add
label define geo2_br_lbl 076026097 `"Condado"', add
label define geo2_br_lbl 076026098 `"Verdejante, Mirandiba"', add
label define geo2_br_lbl 076026099 `"Cupira"', add
label define geo2_br_lbl 076026100 `"Tacaratu"', add
label define geo2_br_lbl 076026101 `"Agrestina"', add
label define geo2_br_lbl 076026102 `"São João"', add
label define geo2_br_lbl 076026103 `"Sanharó"', add
label define geo2_br_lbl 076026104 `"Macaparana"', add
label define geo2_br_lbl 076026105 `"Ilha de Itamaracá"', add
label define geo2_br_lbl 076026106 `"Lagoa de Itaenga"', add
label define geo2_br_lbl 076026107 `"Calçado, Angelim"', add
label define geo2_br_lbl 076026108 `"Amaraji"', add
label define geo2_br_lbl 076026109 `"Parnamirim"', add
label define geo2_br_lbl 076026110 `"Feira Nova"', add
label define geo2_br_lbl 076027001 `"Maceió"', add
label define geo2_br_lbl 076027002 `"Teotônio Vilela, Coruripe, Anadia, Campo Alegre, São Miguel dos Campos, Roteiro, Barra de São Miguel, Jequiá da Praia"', add
label define geo2_br_lbl 076027003 `"Craíbas, Arapiraca"', add
label define geo2_br_lbl 076027004 `"Senador Rui Palmeira, Carneiros, Santana do Ipanema, Olivença, Dois Riachos"', add
label define geo2_br_lbl 076027005 `"Estrela de Alagoas, Palmeira dos Índios"', add
label define geo2_br_lbl 076027006 `"Rio Largo, Messias"', add
label define geo2_br_lbl 076027007 `"União dos Palmares"', add
label define geo2_br_lbl 076027008 `"Penedo"', add
label define geo2_br_lbl 076027009 `"Maribondo, Atalaia"', add
label define geo2_br_lbl 076027010 `"Marechal Deodoro, Coqueiro Seco"', add
label define geo2_br_lbl 076027011 `"Branquinha, Murici, Flexeiras"', add
label define geo2_br_lbl 076027012 `"Porto Real do Colégio, São Sebastião"', add
label define geo2_br_lbl 076027013 `"Delmiro Gouveia"', add
label define geo2_br_lbl 076027014 `"Mata Grande, Canapi"', add
label define geo2_br_lbl 076027015 `"Viçosa, Capela"', add
label define geo2_br_lbl 076027016 `"Inhapi, Piranhas"', add
label define geo2_br_lbl 076027017 `"Lagoa da Canoa, Feira Grande"', add
label define geo2_br_lbl 076027018 `"Pariconha, Água Branca, Olho d'Água do Casado"', add
label define geo2_br_lbl 076027019 `"Maragogi, Japaratinga"', add
label define geo2_br_lbl 076027020 `"Girau do Ponciano"', add
label define geo2_br_lbl 076027021 `"Ibateguara, Colônia Leopoldina"', add
label define geo2_br_lbl 076027022 `"Coité do Nóia, Taquarana, Belém"', add
label define geo2_br_lbl 076027023 `"Major Isidoro, Cacimbinhas, Minador do Negrão"', add
label define geo2_br_lbl 076027024 `"Maravilha, Poço das Trincheiras, Ouro Branco"', add
label define geo2_br_lbl 076027025 `"Pilar"', add
label define geo2_br_lbl 076027026 `"Palestina, Jacaré dos Homens, Batalha, Jaramataia"', add
label define geo2_br_lbl 076027027 `"São Luís do Quitunde"', add
label define geo2_br_lbl 076027028 `"Matriz de Camaragibe, Porto de Pedras"', add
label define geo2_br_lbl 076027029 `"Quebrangulo, Chã Preta, Santana do Mundaú"', add
label define geo2_br_lbl 076027030 `"Novo Lino, Jundiá, Campestre, Jacuípe"', add
label define geo2_br_lbl 076027031 `"Pão de Açúcar, Belo Monte"', add
label define geo2_br_lbl 076027032 `"São José da Tapera"', add
label define geo2_br_lbl 076027033 `"Limoeiro de Anadia"', add
label define geo2_br_lbl 076027034 `"Olho d'Água das Flores, Monteirópolis"', add
label define geo2_br_lbl 076027035 `"Igaci"', add
label define geo2_br_lbl 076027036 `"Barra de Santo Antônio, Paripueira"', add
label define geo2_br_lbl 076027037 `"Boca da Mata"', add
label define geo2_br_lbl 076027038 `"Traipu"', add
label define geo2_br_lbl 076027039 `"Porto Calvo"', add
label define geo2_br_lbl 076027040 `"Junqueiro"', add
label define geo2_br_lbl 076027041 `"Igreja Nova"', add
label define geo2_br_lbl 076027042 `"Joaquim Gomes"', add
label define geo2_br_lbl 076027043 `"São José da Laje"', add
label define geo2_br_lbl 076027044 `"Passo de Camaragibe, São Miguel dos Milagres"', add
label define geo2_br_lbl 076027045 `"Satuba, Santa Luzia do Norte"', add
label define geo2_br_lbl 076027046 `"Piaçabuçu, Feliz Deserto"', add
label define geo2_br_lbl 076027047 `"Cajueiro"', add
label define geo2_br_lbl 076027048 `"São Brás, Olho d'Água Grande, Campo Grande"', add
label define geo2_br_lbl 076027049 `"Tanque d'Arca, Paulo Jacinto, Mar Vermelho, Pindoba"', add
label define geo2_br_lbl 076028001 `"Aracaju"', add
label define geo2_br_lbl 076028002 `"Nossa Senhora do Socorro"', add
label define geo2_br_lbl 076028003 `"Lagarto, São Domingos, Campo do Brito, Salgado"', add
label define geo2_br_lbl 076028004 `"Itabaiana"', add
label define geo2_br_lbl 076028005 `"Tobias Barreto, Tomar do Geru, Riachão do Dantas"', add
label define geo2_br_lbl 076028006 `"São Cristóvão"', add
label define geo2_br_lbl 076028007 `"Estância"', add
label define geo2_br_lbl 076028008 `"Ribeirópolis, Nossa Senhora das Dores, Santa Rosa de Lima, Siriri, Divina Pastora"', add
label define geo2_br_lbl 076028009 `"Porto da Folha, Monte Alegre de Sergipe, Gararu"', add
label define geo2_br_lbl 076028010 `"Laranjeiras, Maruim"', add
label define geo2_br_lbl 076028011 `"Carira, Nossa Senhora Aparecida, São Miguel do Aleixo, Feira Nova, Cumbe"', add
label define geo2_br_lbl 076028012 `"Itabaianinha"', add
label define geo2_br_lbl 076028013 `"Capela, Muribeca"', add
label define geo2_br_lbl 076028014 `"Simão Dias"', add
label define geo2_br_lbl 076028015 `"São Francisco, Japoatã, Pacatuba, Brejo Grande"', add
label define geo2_br_lbl 076028016 `"Santo Amaro das Brotas, Japaratuba, Pirambu"', add
label define geo2_br_lbl 076028017 `"Boquim, Pedrinhas"', add
label define geo2_br_lbl 076028018 `"Neópolis, Santana do São Francisco, Ilha das Flores"', add
label define geo2_br_lbl 076028019 `"Aquidabã, Malhada dos Bois, Telha, Amparo de São Francisco, Cedro de São João"', add
label define geo2_br_lbl 076028020 `"Nossa Senhora da Glória"', add
label define geo2_br_lbl 076028021 `"Cristinápolis, Indiaroba"', add
label define geo2_br_lbl 076028022 `"Poço Redondo"', add
label define geo2_br_lbl 076028023 `"Itaporanga d'Ajuda"', add
label define geo2_br_lbl 076028024 `"Propriá"', add
label define geo2_br_lbl 076028025 `"Pinhão, Frei Paulo, Pedra Mole, Macambira"', add
label define geo2_br_lbl 076028026 `"Areia Branca, Riachuelo"', add
label define geo2_br_lbl 076028027 `"Rosário do Catete, Carmópolis, General Maynard"', add
label define geo2_br_lbl 076028028 `"Barra dos Coqueiros"', add
label define geo2_br_lbl 076028029 `"Canindé de São Francisco"', add
label define geo2_br_lbl 076028030 `"Santa Luzia do Itanhy, Arauá"', add
label define geo2_br_lbl 076028031 `"Moita Bonita, Malhador"', add
label define geo2_br_lbl 076028032 `"Umbaúba"', add
label define geo2_br_lbl 076028033 `"Poço Verde"', add
label define geo2_br_lbl 076028034 `"Gracho Cardoso, Itabi, Canhoba, Nossa Senhora de Lourdes"', add
label define geo2_br_lbl 076029001 `"Salvador"', add
label define geo2_br_lbl 076029002 `"Feira de Santana"', add
label define geo2_br_lbl 076029003 `"Dias d'Ávila, Camaçari"', add
label define geo2_br_lbl 076029004 `"Vitória da Conquista"', add
label define geo2_br_lbl 076029005 `"Sobradinho, Juazeiro"', add
label define geo2_br_lbl 076029006 `"Jussari, Itabuna"', add
label define geo2_br_lbl 076029007 `"Ilhéus, Uruçuca"', add
label define geo2_br_lbl 076029008 `"Barreiras, Luís Eduardo Magalhães"', add
label define geo2_br_lbl 076029009 `"Jequié, Itiruçu, Itagi, Jitaúna"', add
label define geo2_br_lbl 076029010 `"Lauro de Freitas"', add
label define geo2_br_lbl 076029011 `"Presidente Dutra, Lapão, Irecê, São Gabriel, João Dourado, América Dourada"', add
label define geo2_br_lbl 076029012 `"Teixeira de Freitas, Alcobaça"', add
label define geo2_br_lbl 076029013 `"Ourolândia, Várzea Nova, Jacobina, Quixabeira, São José do Jacuípe, Capim Grosso"', add
label define geo2_br_lbl 076029014 `"Alagoinhas, Araças"', add
label define geo2_br_lbl 076029015 `"Itabela, Porto Seguro"', add
label define geo2_br_lbl 076029016 `"Eunápolis, Santa Cruz Cabrália"', add
label define geo2_br_lbl 076029017 `"Simões Filho"', add
label define geo2_br_lbl 076029018 `"Presidente Tancredo Neves, Valença"', add
label define geo2_br_lbl 076029019 `"Paulo Afonso"', add
label define geo2_br_lbl 076029020 `"Serra do Ramalho, Sítio do Mato, Bom Jesus da Lapa"', add
label define geo2_br_lbl 076029021 `"Umburanas, Campo Formoso, Mirangaba"', add
label define geo2_br_lbl 076029022 `"Serrinha, Barrocas"', add
label define geo2_br_lbl 076029023 `"Santo Antônio de Jesus"', add
label define geo2_br_lbl 076029024 `"Morpará, Xique-Xique, Gentio do Ouro, Brotas de Macaúbas, Itaguaçu da Bahia"', add
label define geo2_br_lbl 076029025 `"Brejolândia, Buritirama, Barra, Muquém de São Francisco"', add
label define geo2_br_lbl 076029026 `"Senhor do Bonfim, Andorinha"', add
label define geo2_br_lbl 076029027 `"Candeias"', add
label define geo2_br_lbl 076029028 `"Conceição do Coité, Retirolândia, Ichu"', add
label define geo2_br_lbl 076029029 `"Capela do Alto Alegre, Gavião, Nova Fátima, Pé de Serra, Riachão do Jacuípe, Candeal"', add
label define geo2_br_lbl 076029030 `"Seabra, Souto Soares, Boninal, Palmeiras"', add
label define geo2_br_lbl 076029031 `"Guanambi"', add
label define geo2_br_lbl 076029032 `"Igaporã, Caetité, Lagoa Real"', add
label define geo2_br_lbl 076029033 `"Cabaceiras do Paraguaçu, Sapeaçu, Muritiba, São Félix"', add
label define geo2_br_lbl 076029034 `"Tucano, Nova Soure"', add
label define geo2_br_lbl 076029035 `"Aporá, Entre Rios, Itanagra, Cardeal da Silva"', add
label define geo2_br_lbl 076029036 `"Jucuruçu, Itamaraju"', add
label define geo2_br_lbl 076029037 `"Santo Amaro, Saubara"', add
label define geo2_br_lbl 076029038 `"Euclides da Cunha, Canudos"', add
label define geo2_br_lbl 076029039 `"Ipirá, Pintadas"', add
label define geo2_br_lbl 076029040 `"Caetanos, Bom Jesus da Serra, Poções"', add
label define geo2_br_lbl 076029041 `"Itapetinga"', add
label define geo2_br_lbl 076029042 `"Jaguaquara, Apuarema, Itamari"', add
label define geo2_br_lbl 076029043 `"Jussara, Morro do Chapéu, Bonito"', add
label define geo2_br_lbl 076029044 `"Casa Nova"', add
label define geo2_br_lbl 076029045 `"Brumado"', add
label define geo2_br_lbl 076029046 `"Presidente Jânio Quadros, Maetinga, Caraíbas, Tremedal, Aracatu"', add
label define geo2_br_lbl 076029047 `"Nova Canaã, Ibicuí, Itagibá, Aiquara, Itapitanga"', add
label define geo2_br_lbl 076029048 `"Itaberaba"', add
label define geo2_br_lbl 076029049 `"Mascote, Santa Luzia, Canavieiras"', add
label define geo2_br_lbl 076029050 `"Banzaê, Ribeira do Pombal"', add
label define geo2_br_lbl 076029051 `"Cruz das Almas"', add
label define geo2_br_lbl 076029052 `"Ibirataia, Nova Ibiá, Gandu"', add
label define geo2_br_lbl 076029053 `"Correntina, Jaborandi, Cocos"', add
label define geo2_br_lbl 076029054 `"Rafael Jambeiro, Castro Alves, Varzedo"', add
label define geo2_br_lbl 076029055 `"Maragogipe, Salinas da Margarida"', add
label define geo2_br_lbl 076029056 `"Laje, Jaguaripe, Aratuípe, Muniz Ferreira"', add
label define geo2_br_lbl 076029057 `"Terra Nova, São Sebastião do Passé"', add
label define geo2_br_lbl 076029058 `"Livramento de Nossa Senhora, Dom Basílio"', add
label define geo2_br_lbl 076029059 `"Teodoro Sampaio, Inhambupe, Aramari"', add
label define geo2_br_lbl 076029060 `"Jacaraci, Mortugaba, Condeúba, Guajeru"', add
label define geo2_br_lbl 076029061 `"Acajutiba, Rio Real"', add
label define geo2_br_lbl 076029062 `"Monte Santo"', add
label define geo2_br_lbl 076029063 `"Araci"', add
label define geo2_br_lbl 076029064 `"Madre de Deus, São Francisco do Conde"', add
label define geo2_br_lbl 076029065 `"Catu"', add
label define geo2_br_lbl 076029066 `"Cícero Dantas, Fátima"', add
label define geo2_br_lbl 076029067 `"Santa Maria da Vitória, Canápolis"', add
label define geo2_br_lbl 076029068 `"Jeremoabo, Sítio do Quinto"', add
label define geo2_br_lbl 076029069 `"Santa Brígida, Pedro Alexandre, Coronel João Sá"', add
label define geo2_br_lbl 076029070 `"Teolândia, Jiquiriçá, Taperoá"', add
label define geo2_br_lbl 076029071 `"Central, Uibaí, Ibititá"', add
label define geo2_br_lbl 076029072 `"Santo Estêvão"', add
label define geo2_br_lbl 076029073 `"Antônio Gonçalves, Pindobaçu, Filadélfia"', add
label define geo2_br_lbl 076029074 `"Camamu, Igrapiúna"', add
label define geo2_br_lbl 076029075 `"Curaçá, Abaré"', add
label define geo2_br_lbl 076029076 `"Tanque Novo, Botuporã, Caturama, Érico Cardoso"', add
label define geo2_br_lbl 076029077 `"Macaúbas"', add
label define geo2_br_lbl 076029078 `"Ipiaú"', add
label define geo2_br_lbl 076029079 `"Ibitiara, Novo Horizonte, Piatã"', add
label define geo2_br_lbl 076029080 `"Adustina, Paripiranga"', add
label define geo2_br_lbl 076029081 `"Olindina, Crisópolis"', add
label define geo2_br_lbl 076029082 `"Cândido Sales, Belo Campo"', add
label define geo2_br_lbl 076029083 `"Amargosa, São Miguel das Matas"', add
label define geo2_br_lbl 076029084 `"Cipó, Ribeira do Amparo, Heliópolis"', add
label define geo2_br_lbl 076029085 `"Santana, Serra Dourada"', add
label define geo2_br_lbl 076029086 `"Maraú, Itacaré"', add
label define geo2_br_lbl 076029087 `"Riacho de Santana, Matina"', add
label define geo2_br_lbl 076029088 `"Itaquara, Santa Inês, Cravolândia, Ubaíra"', add
label define geo2_br_lbl 076029089 `"Mucugê, Lençóis, Andaraí, Nova Redenção"', add
label define geo2_br_lbl 076029090 `"Chorrochó, Macururé, Rodelas, Glória"', add
label define geo2_br_lbl 076029091 `"Ipupiara, Ibipeba, Barra do Mendes"', add
label define geo2_br_lbl 076029092 `"Firmino Alves, Santa Cruz da Vitória, Floresta Azul, Almadina, Itapé"', add
label define geo2_br_lbl 076029093 `"Iaçu, Nova Itarana, Irajuba"', add
label define geo2_br_lbl 076029094 `"Nova Viçosa"', add
label define geo2_br_lbl 076029095 `"Mata de São João"', add
label define geo2_br_lbl 076029096 `"Iguaí, Dário Meira"', add
label define geo2_br_lbl 076029097 `"Ibicoara, Barra da Estiva"', add
label define geo2_br_lbl 076029098 `"Tapiramutá, Piritiba"', add
label define geo2_br_lbl 076029099 `"Coração de Maria, Pedrão, Ouriçangas"', add
label define geo2_br_lbl 076029100 `"Vera Cruz"', add
label define geo2_br_lbl 076029101 `"Barro Alto, Canarana"', add
label define geo2_br_lbl 076029102 `"Santa Rita de Cássia, Mansidão"', add
label define geo2_br_lbl 076029103 `"Queimadas, Nordestina"', add
label define geo2_br_lbl 076029104 `"Maracás, Lafaiete Coutinho, Lajedo do Tabocal"', add
label define geo2_br_lbl 076029105 `"Sento Sé"', add
label define geo2_br_lbl 076029106 `"Piraí do Norte, Ituberá"', add
label define geo2_br_lbl 076029107 `"Remanso"', add
label define geo2_br_lbl 076029108 `"Boquira, Ibipitanga"', add
label define geo2_br_lbl 076029109 `"Itiúba"', add
label define geo2_br_lbl 076029110 `"Barra do Choça"', add
label define geo2_br_lbl 076029111 `"Itambé, Caatiba"', add
label define geo2_br_lbl 076029112 `"Mucuri"', add
label define geo2_br_lbl 076029113 `"São Gonçalo dos Campos"', add
label define geo2_br_lbl 076029114 `"Arataca, Una"', add
label define geo2_br_lbl 076029115 `"Feira da Mata, Carinhanha"', add
label define geo2_br_lbl 076029116 `"Itaeté, Marcionílio Souza, Planaltino"', add
label define geo2_br_lbl 076029117 `"Santaluz"', add
label define geo2_br_lbl 076029118 `"Mundo Novo, Macajuba"', add
label define geo2_br_lbl 076029119 `"Vereda, Prado"', add
label define geo2_br_lbl 076029120 `"Caravelas, Ibirapuã, Lajedão"', add
label define geo2_br_lbl 076029121 `"Esplanada"', add
label define geo2_br_lbl 076029122 `"Biritinga, Sátiro Dias"', add
label define geo2_br_lbl 076029123 `"Pojuca"', add
label define geo2_br_lbl 076029124 `"São Domingos, Valente"', add
label define geo2_br_lbl 076029125 `"Lamarão, Santanópolis, Água Fria"', add
label define geo2_br_lbl 076029126 `"Pilão Arcado"', add
label define geo2_br_lbl 076029127 `"Cansanção"', add
label define geo2_br_lbl 076029128 `"Mairi, Várzea da Roça"', add
label define geo2_br_lbl 076029129 `"Jandaíra, Conde"', add
label define geo2_br_lbl 076029130 `"Itapicuru"', add
label define geo2_br_lbl 076029131 `"Rio do Pires, Rio de Contas, Abaíra"', add
label define geo2_br_lbl 076029132 `"Brejões, Milagres, Elísio Medrado"', add
label define geo2_br_lbl 076029133 `"Ribeirão do Largo, Encruzilhada"', add
label define geo2_br_lbl 076029134 `"Camacan"', add
label define geo2_br_lbl 076029135 `"Novo Triunfo, Antas"', add
label define geo2_br_lbl 076029136 `"Caculé, Ibiassucê"', add
label define geo2_br_lbl 076029137 `"Cachoeira"', add
label define geo2_br_lbl 076029138 `"Contendas do Sincorá, Iramaia, Manoel Vitorino"', add
label define geo2_br_lbl 076029139 `"Jaguarari"', add
label define geo2_br_lbl 076029140 `"Palmas de Monte Alto, Sebastião Laranjeiras"', add
label define geo2_br_lbl 076029141 `"Paratinga"', add
label define geo2_br_lbl 076029142 `"Mulungu do Morro, Cafarnaum"', add
label define geo2_br_lbl 076029143 `"Ruy Barbosa"', add
label define geo2_br_lbl 076029144 `"Guaratinga, Itagimirim"', add
label define geo2_br_lbl 076029145 `"Itarantim, Itapebi"', add
label define geo2_br_lbl 076029146 `"Conceição do Jacuípe"', add
label define geo2_br_lbl 076029147 `"Aurelino Leal, Gongogi, Barra do Rocha"', add
label define geo2_br_lbl 076029148 `"Candiba, Pindaí"', add
label define geo2_br_lbl 076029149 `"Caldeirão Grande, Ponto Novo"', add
label define geo2_br_lbl 076029150 `"Nilo Peçanha, Cairu"', add
label define geo2_br_lbl 076029151 `"Urandi, Licínio de Almeida"', add
label define geo2_br_lbl 076029152 `"Potiraguá, Itaju do Colônia, Pau Brasil"', add
label define geo2_br_lbl 076029153 `"Itajuípe, Barro Preto"', add
label define geo2_br_lbl 076029154 `"Campo Alegre de Lourdes"', add
label define geo2_br_lbl 076029155 `"Angical, Cristópolis"', add
label define geo2_br_lbl 076029156 `"Catolândia, Baianópolis, Tabocas do Brejo Velho"', add
label define geo2_br_lbl 076029157 `"Irará"', add
label define geo2_br_lbl 076029158 `"São Desidério"', add
label define geo2_br_lbl 076029159 `"Wagner, Utinga"', add
label define geo2_br_lbl 076029160 `"Ipecaetá, Antônio Cardoso"', add
label define geo2_br_lbl 076029161 `"Coribe, São Félix do Coribe"', add
label define geo2_br_lbl 076029162 `"Lajedinho, Ibiquera, Boa Vista do Tupim"', add
label define geo2_br_lbl 076029163 `"Cotegipe, Wanderley"', add
label define geo2_br_lbl 076029164 `"Nazaré"', add
label define geo2_br_lbl 076029165 `"Quijingue"', add
label define geo2_br_lbl 076029166 `"Malhada, Iuiú"', add
label define geo2_br_lbl 076029167 `"Tanquinho, Santa Bárbara"', add
label define geo2_br_lbl 076029168 `"Anagé"', add
label define geo2_br_lbl 076029169 `"Miguel Calmon"', add
label define geo2_br_lbl 076029170 `"Jussiape, Ituaçu"', add
label define geo2_br_lbl 076029171 `"Serra Preta, Anguera"', add
label define geo2_br_lbl 076029172 `"Macarani, Maiquinique"', add
label define geo2_br_lbl 076029173 `"Mirante, Boa Nova"', add
label define geo2_br_lbl 076029174 `"Ibotirama"', add
label define geo2_br_lbl 076029175 `"Amélia Rodrigues"', add
label define geo2_br_lbl 076029176 `"Uauá"', add
label define geo2_br_lbl 076029177 `"Planalto"', add
label define geo2_br_lbl 076029178 `"Ubatã"', add
label define geo2_br_lbl 076029179 `"Itatim, Santa Teresinha"', add
label define geo2_br_lbl 076029180 `"Formosa do Rio Preto"', add
label define geo2_br_lbl 076029181 `"São José da Vitória, Buerarema"', add
label define geo2_br_lbl 076029182 `"Rio do Antônio, Malhada de Pedras"', add
label define geo2_br_lbl 076029183 `"Ibicaraí"', add
label define geo2_br_lbl 076029184 `"Iraquara"', add
label define geo2_br_lbl 076029185 `"Wenceslau Guimarães"', add
label define geo2_br_lbl 076029186 `"Ibirapitanga"', add
label define geo2_br_lbl 076029187 `"Belmonte"', add
label define geo2_br_lbl 076029188 `"Saúde, Caém"', add
label define geo2_br_lbl 076029189 `"Várzea do Poço, Serrolândia"', add
label define geo2_br_lbl 076029190 `"Conceição do Almeida, Dom Macedo Costa"', add
label define geo2_br_lbl 076029191 `"Mutuípe"', add
label define geo2_br_lbl 076029192 `"Oliveira dos Brejinhos"', add
label define geo2_br_lbl 076029193 `"Riachão das Neves"', add
label define geo2_br_lbl 076029194 `"Teofilândia"', add
label define geo2_br_lbl 076029195 `"Coaraci"', add
label define geo2_br_lbl 076029196 `"Itaparica"', add
label define geo2_br_lbl 076029197 `"Cordeiros, Piripá"', add
label define geo2_br_lbl 076029198 `"Conceição da Feira"', add
label define geo2_br_lbl 076029199 `"Medeiros Neto"', add
label define geo2_br_lbl 076029200 `"São Felipe"', add
label define geo2_br_lbl 076029201 `"Itororó"', add
label define geo2_br_lbl 076029202 `"Governador Mangabeira"', add
label define geo2_br_lbl 076029203 `"Baixa Grande"', add
label define geo2_br_lbl 076029204 `"Paramirim"', add
label define geo2_br_lbl 076029205 `"Ubaitaba"', add
label define geo2_br_lbl 076029206 `"Tanhaçu"', add
label define geo2_br_lbl 076029207 `"Itanhém"', add
label define geo2_br_lbl 076031001 `"Belo Horizonte"', add
label define geo2_br_lbl 076031002 `"Uberlândia"', add
label define geo2_br_lbl 076031003 `"Contagem"', add
label define geo2_br_lbl 076031004 `"Juiz de Fora"', add
label define geo2_br_lbl 076031005 `"Betim"', add
label define geo2_br_lbl 076031006 `"Montes Claros"', add
label define geo2_br_lbl 076031007 `"Uberaba, Delta"', add
label define geo2_br_lbl 076031008 `"Ribeirão das Neves"', add
label define geo2_br_lbl 076031009 `"Governador Valadares"', add
label define geo2_br_lbl 076031010 `"Ipatinga"', add
label define geo2_br_lbl 076031011 `"Sete Lagoas"', add
label define geo2_br_lbl 076031012 `"Divinópolis"', add
label define geo2_br_lbl 076031013 `"Santa Luzia"', add
label define geo2_br_lbl 076031014 `"Mário Campos, Sarzedo, Ibirité"', add
label define geo2_br_lbl 076031015 `"Teófilo Otoni, Ouro Verde de Minas, Novo Oriente de Minas"', add
label define geo2_br_lbl 076031016 `"Poços de Caldas"', add
label define geo2_br_lbl 076031017 `"Caratinga, Ipaba, Vargem Alegre, Entre Folhas, Santa Bárbara do Leste, Santa Rita de Minas, Ubaporanga, Piedade de Caratinga, Imbé de Minas"', add
label define geo2_br_lbl 076031018 `"Patos de Minas, Guimarânia, Cruzeiro da Fortaleza"', add
label define geo2_br_lbl 076031019 `"Barbacena, Barroso"', add
label define geo2_br_lbl 076031020 `"Itabira, Bela Vista de Minas, Nova Era"', add
label define geo2_br_lbl 076031021 `"Pouso Alegre"', add
label define geo2_br_lbl 076031022 `"Sabará"', add
label define geo2_br_lbl 076031023 `"São José da Lapa, Vespasiano"', add
label define geo2_br_lbl 076031024 `"Varginha"', add
label define geo2_br_lbl 076031025 `"Conselheiro Lafaiete"', add
label define geo2_br_lbl 076031026 `"Montalvânia, Miravânia, Manga, Juvenília, Jaíba, Gameleiras, Monte Azul, Matias Cardoso"', add
label define geo2_br_lbl 076031027 `"Araguari"', add
label define geo2_br_lbl 076031028 `"Passos"', add
label define geo2_br_lbl 076031029 `"Rosário da Limeira, Muriaé"', add
label define geo2_br_lbl 076031030 `"Coronel Fabriciano"', add
label define geo2_br_lbl 076031031 `"Manhuaçu, São João do Manhuaçu, Luisburgo, Reduto"', add
label define geo2_br_lbl 076031032 `"Ubá"', add
label define geo2_br_lbl 076031033 `"São João del Rei, Tiradentes, Santa Cruz de Minas"', add
label define geo2_br_lbl 076031034 `"Ibiracatu, Varzelândia, Verdelândia, Janaúba"', add
label define geo2_br_lbl 076031035 `"Ituiutaba"', add
label define geo2_br_lbl 076031036 `"Nova Lima, Raposos"', add
label define geo2_br_lbl 076031037 `"Urucuia, Chapada Gaúcha, Pintópolis, São Francisco, Icaraí de Minas"', add
label define geo2_br_lbl 076031038 `"Araxá"', add
label define geo2_br_lbl 076031039 `"Inhaúma, Florestal, Cachoeira da Prata, Esmeraldas, Capim Branco, Prudente de Morais"', add
label define geo2_br_lbl 076031040 `"Januária, Bonito de Minas, Cônego Marinho, Pedras de Maria da Cruz"', add
label define geo2_br_lbl 076031041 `"Lavras"', add
label define geo2_br_lbl 076031042 `"Itajubá"', add
label define geo2_br_lbl 076031043 `"Itaúna"', add
label define geo2_br_lbl 076031044 `"Unaí, Cabeceira Grande, Uruana de Minas"', add
label define geo2_br_lbl 076031045 `"Paracatu"', add
label define geo2_br_lbl 076031046 `"Engenheiro Navarro, Bocaiúva, Olhos-d'Água, Guaraciama, Glaucilândia, Juramento, Senador Modestino Gonçalves, Carbonita"', add
label define geo2_br_lbl 076031047 `"Pará de Minas"', add
label define geo2_br_lbl 076031048 `"Timóteo"', add
label define geo2_br_lbl 076031049 `"Patrocínio"', add
label define geo2_br_lbl 076031050 `"Campo do Meio, Ilicínea, Boa Esperança, Santana da Vargem, Coqueiral"', add
label define geo2_br_lbl 076031051 `"Três Corações, São Bento Abade"', add
label define geo2_br_lbl 076031052 `"Fronteira, Frutal, Planura"', add
label define geo2_br_lbl 076031053 `"Curvelo"', add
label define geo2_br_lbl 076031054 `"Alfenas"', add
label define geo2_br_lbl 076031055 `"João Monlevade"', add
label define geo2_br_lbl 076031056 `"Nova Serrana"', add
label define geo2_br_lbl 076031057 `"Pai Pedro, Porteirinha, Nova Porteirinha, Catuti, Mato Verde, Serranópolis de Minas"', add
label define geo2_br_lbl 076031058 `"Viçosa"', add
label define geo2_br_lbl 076031059 `"Formiga, Córrego Fundo"', add
label define geo2_br_lbl 076031060 `"Cataguases"', add
label define geo2_br_lbl 076031061 `"Ouro Preto"', add
label define geo2_br_lbl 076031062 `"Bom Despacho, Moema, Araújos, Perdigão"', add
label define geo2_br_lbl 076031063 `"Ingaí, Itutinga, Carrancas, Minduri, São Vicente de Minas, Carvalhos, Seritinga, Andrelândia, Madre de Deus de Minas, Liberdade, Piedade do Rio Grande, Santana do Garambéu, Ibertioga, Santa Rita de Ibitipoca, Bias Fortes"', add
label define geo2_br_lbl 076031064 `"Riacho dos Machados, Rio Pardo de Minas, Santo Antônio do Retiro, Montezuma, Vargem Grande do Rio Pardo, Indaiabira"', add
label define geo2_br_lbl 076031065 `"São Sebastião do Paraíso"', add
label define geo2_br_lbl 076031066 `"Gouveia, Conceição do Mato Dentro, Congonhas do Norte, Alvorada de Minas, São Sebastião do Rio Preto, Dom Joaquim, Santo Antônio do Rio Abaixo, Carmésia, Passabém, Santa Maria de Itabira, Senhora do Porto"', add
label define geo2_br_lbl 076031067 `"Igarapé, São Joaquim de Bicas"', add
label define geo2_br_lbl 076031068 `"Ponte Nova, Oratórios"', add
label define geo2_br_lbl 076031069 `"Antônio Carlos, Santos Dumont, Ewbank da Câmara"', add
label define geo2_br_lbl 076031070 `"Água Boa, Nacip Raydan, São José da Safira, Marilac, Itambacuri, Frei Inocêncio, Mathias Lobato"', add
label define geo2_br_lbl 076031071 `"Soledade de Minas, São Sebastião do Rio Verde, Pouso Alto, Baependi, Cruzília, Itamonte"', add
label define geo2_br_lbl 076031072 `"João Pinheiro, Brasilândia de Minas"', add
label define geo2_br_lbl 076031073 `"Divino, Santa Margarida, Orizânia, Caparaó, Alto Jequitibá, Alto Caparaó"', add
label define geo2_br_lbl 076031074 `"Confins, Lagoa Santa"', add
label define geo2_br_lbl 076031075 `"Ponto Chique, Ubaí, Coração de Jesus, São João do Pacuí, São João da Lagoa, Claro dos Poções"', add
label define geo2_br_lbl 076031076 `"Pedro Leopoldo"', add
label define geo2_br_lbl 076031077 `"Rio Acima, Santa Bárbara, Catas Altas, Rio Piracicaba"', add
label define geo2_br_lbl 076031078 `"Oliveira, Carmópolis de Minas"', add
label define geo2_br_lbl 076031079 `"Carneirinho, Limeira do Oeste, Iturama, União de Minas"', add
label define geo2_br_lbl 076031080 `"Felício dos Santos, Rio Vermelho, Itamarandiba, Aricanduva"', add
label define geo2_br_lbl 076031081 `"Divisópolis, Almenara, Mata Verde"', add
label define geo2_br_lbl 076031082 `"São Gonçalo do Sapucaí, Heliodora, Monsenhor Paulo, Campanha"', add
label define geo2_br_lbl 076031083 `"Diamantina, Couto de Magalhães de Minas, São Gonçalo do Rio Preto"', add
label define geo2_br_lbl 076031084 `"Três Pontas"', add
label define geo2_br_lbl 076031085 `"Central de Minas, Itabirinha, Mantena, São João do Manteninha, Nova Belém"', add
label define geo2_br_lbl 076031086 `"Fruta de Leite, Novorizonte, Salinas, Santa Cruz de Salinas"', add
label define geo2_br_lbl 076031087 `"Mariana"', add
label define geo2_br_lbl 076031088 `"Pirapora"', add
label define geo2_br_lbl 076031089 `"Lontra, Mirabela, Patis, São João da Ponte"', add
label define geo2_br_lbl 076031090 `"Leme do Prado, José Gonçalves de Minas, Minas Novas, Berilo"', add
label define geo2_br_lbl 076031091 `"Nova Resende, Conceição da Aparecida, Alterosa, Areado"', add
label define geo2_br_lbl 076031092 `"Indianópolis, Estrela do Sul, Nova Ponte, Romaria, Pedrinópolis, Santa Juliana, Iraí de Minas"', add
label define geo2_br_lbl 076031093 `"Leopoldina"', add
label define geo2_br_lbl 076031094 `"Caranaíba, Santana dos Montes, Itaverava, Rio Espera, Desterro do Melo, Alto Rio Doce, Brás Pires, Presidente Bernardes, Silveirânia, Dores do Turvo"', add
label define geo2_br_lbl 076031095 `"Ladainha, Poté, Itaipé, Catuji"', add
label define geo2_br_lbl 076031096 `"Campo Belo"', add
label define geo2_br_lbl 076031097 `"Itacambira, Grão Mogol, Botumirim, Cristália, Padre Carvalho, Josenópolis, Rubelita"', add
label define geo2_br_lbl 076031098 `"Nanuque, Serra dos Aimorés"', add
label define geo2_br_lbl 076031099 `"Mateus Leme, Juatuba"', add
label define geo2_br_lbl 076031100 `"São Geraldo, Coimbra, Ervália, Miradouro, Vieiras"', add
label define geo2_br_lbl 076031101 `"Monte Alegre de Minas, Araporã, Tupaciguara"', add
label define geo2_br_lbl 076031102 `"Guanhães, Virginópolis, Gonzaga"', add
label define geo2_br_lbl 076031103 `"Claraval, Ibiraci, São Tomás de Aquino, Capetinga, Cássia"', add
label define geo2_br_lbl 076031104 `"Bugre, Iapu, Inhapim, São Domingos das Dores, São Sebastião do Anta"', add
label define geo2_br_lbl 076031105 `"Congonhas"', add
label define geo2_br_lbl 076031106 `"Campo Azul, Luislândia, Brasília de Minas, Japonvar"', add
label define geo2_br_lbl 076031107 `"Guaxupé"', add
label define geo2_br_lbl 076031108 `"Bandeira, Rubim, Jordânia, Jacinto, Salto da Divisa, Santa Maria do Salto"', add
label define geo2_br_lbl 076031109 `"Fervedouro, Carangola, Caiana"', add
label define geo2_br_lbl 076031110 `"Frei Lagonegro, São José do Jacuri, Peçanha, São Pedro do Suaçuí, Cantagalo, Coroaci"', add
label define geo2_br_lbl 076031111 `"Virgem da Lapa, Araçuaí"', add
label define geo2_br_lbl 076031112 `"Cascalho Rico, Grupiara, Douradoquara, Abadia dos Dourados, Coromandel, Guarda-Mor"', add
label define geo2_br_lbl 076031113 `"Rio Pomba, Goianá, Rio Novo, Guarani, Descoberto, Itamarati de Minas"', add
label define geo2_br_lbl 076031114 `"Monte Carmelo"', add
label define geo2_br_lbl 076031115 `"Lagoa da Prata"', add
label define geo2_br_lbl 076031116 `"Lagoa Formosa, Carmo do Paranaíba"', add
label define geo2_br_lbl 076031117 `"Conselheiro Pena, Resplendor, Goiabeira, Cuparaque"', add
label define geo2_br_lbl 076031118 `"Prados, Dores de Campos, Carandaí, Cristiano Otoni"', add
label define geo2_br_lbl 076031119 `"Itabirito"', add
label define geo2_br_lbl 076031120 `"São João Batista do Glória, Capitólio, Guapé, Pimenta, Pains"', add
label define geo2_br_lbl 076031121 `"Campina Verde, Gurinhatã, São Francisco de Sales, Itapagipe"', add
label define geo2_br_lbl 076031122 `"Volta Grande, Santana de Cataguases, Estrela Dalva, Recreio, Laranjal, Pirapetinga, Palma"', add
label define geo2_br_lbl 076031123 `"São Lourenço"', add
label define geo2_br_lbl 076031124 `"Capelinha, Angelândia"', add
label define geo2_br_lbl 076031125 `"Ibiá, Rio Paranaíba, Arapuá, Matutina"', add
label define geo2_br_lbl 076031126 `"Caeté"', add
label define geo2_br_lbl 076031127 `"Felixlândia, Corinto, Morro da Garça"', add
label define geo2_br_lbl 076031128 `"Caraí, Padre Paraíso"', add
label define geo2_br_lbl 076031129 `"Andradas, Ibitiúra de Minas"', add
label define geo2_br_lbl 076031130 `"Sericita, Pedra Bonita, Matipó, Caputira"', add
label define geo2_br_lbl 076031131 `"Catas Altas da Noruega, Lamim, Cipotânea, Piranga, Senhora de Oliveira, Diogo de Vasconcelos"', add
label define geo2_br_lbl 076031132 `"Varjão de Minas, Tiros, São Gonçalo do Abaeté, Serra da Saudade, Quartel Geral, Cedro do Abaeté, Paineiras, Biquinhas, Morada Nova de Minas"', add
label define geo2_br_lbl 076031133 `"Araçaí, Funilândia, Jequitibá, Baldim, Jaboticatubas, Taquaraçu de Minas"', add
label define geo2_br_lbl 076031134 `"Sobrália, São João do Oriente, Fernandes Tourinho, Dom Cavati, Alpercata, Engenheiro Caldas"', add
label define geo2_br_lbl 076031135 `"Santana do Manhuaçu, Conceição de Ipanema, Mutum"', add
label define geo2_br_lbl 076031136 `"Cordisburgo, Inimutaba, Santo Hipólito, Presidente Juscelino, Santana de Pirapama, Santana do Riacho, Morro do Pilar, Itambé do Mato Dentro"', add
label define geo2_br_lbl 076031137 `"São Gonçalo do Pará, Carmo do Cajuru, Igaratinga"', add
label define geo2_br_lbl 076031138 `"Bicas, São João Nepomuceno"', add
label define geo2_br_lbl 076031139 `"Tumiritinga, Galiléia, Pescador, Divino das Laranjeiras, São Félix de Minas, Mendes Pimentel, São José do Divino, São Geraldo do Baixio"', add
label define geo2_br_lbl 076031140 `"Simonésia, Ipanema, Taparuba"', add
label define geo2_br_lbl 076031141 `"Manhumirim, Martins Soares, Durandé, São José do Mantimento"', add
label define geo2_br_lbl 076031142 `"Espinosa, Mamonas"', add
label define geo2_br_lbl 076031143 `"Capinópolis, Cachoeira Dourada, Canápolis, Centralina"', add
label define geo2_br_lbl 076031144 `"Prata, Comendador Gomes, Campo Florido, Veríssimo"', add
label define geo2_br_lbl 076031145 `"Alagoa, Aiuruoca, Bocaina de Minas, Serranos, Passa-Vinte, Santa Rita de Jacutinga, Olaria, Rio Preto, Santa Bárbara do Monte Verde, Belmiro Braga, Simão Pereira"', add
label define geo2_br_lbl 076031146 `"Machado"', add
label define geo2_br_lbl 076031147 `"Coronel Xavier Chaves, Entre Rios de Minas, Lagoa Dourada, São Brás do Suaçuí, Casa Grande, Queluzito"', add
label define geo2_br_lbl 076031148 `"Piranguinho, São José do Alegre, Pedralva, Maria da Fé"', add
label define geo2_br_lbl 076031149 `"Capitão Enéas, Francisco Sá"', add
label define geo2_br_lbl 076031150 `"Pedra do Indaiá, Itapecerica, São Sebastião do Oeste, São Francisco de Paula"', add
label define geo2_br_lbl 076031151 `"Santa Rita do Sapucaí"', add
label define geo2_br_lbl 076031152 `"Dionísio, São José do Goiabal, Córrego Novo, Bom Jesus do Galho, Pingo-d'Água"', add
label define geo2_br_lbl 076031153 `"Ferros, Dores de Guanhães, Antônio Dias, Braúnas, Jaguaraçu, Marliéria"', add
label define geo2_br_lbl 076031154 `"Carmo da Mata, Cláudio"', add
label define geo2_br_lbl 076031155 `"Várzea da Palma"', add
label define geo2_br_lbl 076031156 `"Visconde do Rio Branco"', add
label define geo2_br_lbl 076031157 `"Arcos"', add
label define geo2_br_lbl 076031158 `"Taiobeiras, Berizal"', add
label define geo2_br_lbl 076031159 `"Setubinha, Malacacheta, Franciscópolis"', add
label define geo2_br_lbl 076031160 `"São Sebastião do Maranhão, José Raydan, Santa Maria do Suaçuí, Virgolândia"', add
label define geo2_br_lbl 076031161 `"Ouro Branco"', add
label define geo2_br_lbl 076031162 `"Lagamar, Presidente Olegário, Lagoa Grande"', add
label define geo2_br_lbl 076031163 `"Curral de Dentro, Águas Vermelhas, Cachoeira de Pajeú, Divisa Alegre"', add
label define geo2_br_lbl 076031164 `"Coronel Murta, Itinga, Ponto dos Volantes"', add
label define geo2_br_lbl 076031165 `"Matozinhos"', add
label define geo2_br_lbl 076031166 `"Além Paraíba"', add
label define geo2_br_lbl 076031167 `"Amparo do Serra, Pedra do Anta, Jequeri, Canaã, Araponga"', add
label define geo2_br_lbl 076031168 `"Bom Sucesso, Itumirim, Ibituruna, Nazareno"', add
label define geo2_br_lbl 076031169 `"Brumadinho"', add
label define geo2_br_lbl 076031170 `"Lassance, Augusto de Lima, Francisco Dumont, Buenópolis, Joaquim Felício, Monjolos"', add
label define geo2_br_lbl 076031171 `"Piumhi"', add
label define geo2_br_lbl 076031172 `"São João do Paraíso, Ninheira"', add
label define geo2_br_lbl 076031173 `"Paraopeba, Caetanópolis"', add
label define geo2_br_lbl 076031174 `"Cristais, Aguanil, Candeias, Camacho"', add
label define geo2_br_lbl 076031175 `"Jampruca, Campanário, Frei Gaspar, Nova Módica, Ataléia"', add
label define geo2_br_lbl 076031176 `"Alvinópolis, São Domingos do Prata"', add
label define geo2_br_lbl 076031177 `"Mesquita, Santana do Paraíso"', add
label define geo2_br_lbl 076031178 `"Chapada do Norte, Francisco Badaró, Jenipapo de Minas"', add
label define geo2_br_lbl 076031179 `"Oliveira Fortes, Santa Bárbara do Tugúrio, Aracitaba, Paiva, Mercês, Piau, Coronel Pacheco, Tabuleiro, Chácara"', add
label define geo2_br_lbl 076031180 `"Pavão, Crisólita, Águas Formosas"', add
label define geo2_br_lbl 076031181 `"Senador Amaral, Cambuí"', add
label define geo2_br_lbl 076031182 `"São Gotardo"', add
label define geo2_br_lbl 076031183 `"Cabo Verde, Monte Belo, Divisa Nova"', add
label define geo2_br_lbl 076031184 `"Pequeri, Mar de Espanha, Rochedo de Minas, Guarará, Maripá de Minas, Senador Cortes, Argirita, Santo Antônio do Aventureiro"', add
label define geo2_br_lbl 076031185 `"Lambari, Cambuquira"', add
label define geo2_br_lbl 076031186 `"Guidoval, Guiricema, Miraí, São Sebastião da Vargem Alegre"', add
label define geo2_br_lbl 076031187 `"Itamogi, Monte Santo de Minas"', add
label define geo2_br_lbl 076031188 `"Ouro Fino"', add
label define geo2_br_lbl 076031189 `"Natalândia, Bonfinópolis de Minas, Dom Bosco, Riachinho, São Romão"', add
label define geo2_br_lbl 076031190 `"Passa Tempo, Piracema, Desterro de Entre Rios, Piedade dos Gerais, Jeceaba"', add
label define geo2_br_lbl 076031191 `"Bueno Brandão, Toledo, Munhoz, Itapeva"', add
label define geo2_br_lbl 076031192 `"Santa Fé de Minas, Buritizeiro"', add
label define geo2_br_lbl 076031193 `"Borda da Mata, Tocos do Moji, Congonhal"', add
label define geo2_br_lbl 076031194 `"Tapira, Delfinópolis, São Roque de Minas, Medeiros, Pratinha, Vargem Bonita, Tapiraí, Córrego Danta"', add
label define geo2_br_lbl 076031195 `"Camanducaia, Sapucaí-Mirim, Gonçalves"', add
label define geo2_br_lbl 076031196 `"Tarumirim, Itanhomi, Capitão Andrade"', add
label define geo2_br_lbl 076031197 `"São Tiago, Conceição da Barra de Minas, Ritápolis, Resende Costa"', add
label define geo2_br_lbl 076031198 `"Doresópolis, Luz, Iguatama, Japaraíba"', add
label define geo2_br_lbl 076031199 `"Conquista, Sacramento"', add
label define geo2_br_lbl 076031200 `"Piranguçu, Wenceslau Braz, Delfim Moreira, Dom Viçoso, Marmelópolis, Virgínia"', add
label define geo2_br_lbl 076031201 `"Passa Quatro, Itanhandu"', add
label define geo2_br_lbl 076031202 `"Perdões, Ribeirão Vermelho, Ijaci"', add
label define geo2_br_lbl 076031203 `"Novo Cruzeiro"', add
label define geo2_br_lbl 076031204 `"Ipuiúna, Senador José Bento, Poço Fundo, Carvalhópolis"', add
label define geo2_br_lbl 076031205 `"Comercinho, Medina"', add
label define geo2_br_lbl 076031206 `"Córrego do Bom Jesus, Consolação, Cachoeira de Minas, Brasópolis"', add
label define geo2_br_lbl 076031207 `"Rio Manso, Crucilândia, Bonfim, Belo Vale, Moeda"', add
label define geo2_br_lbl 076031208 `"Olímpio Noronha, Carmo de Minas, Conceição do Rio Verde"', add
label define geo2_br_lbl 076031209 `"Muzambinho, Juruaia"', add
label define geo2_br_lbl 076031210 `"Paraisópolis, Conceição dos Ouros"', add
label define geo2_br_lbl 076031211 `"Campos Gerais, Fama"', add
label define geo2_br_lbl 076031212 `"Três Marias"', add
label define geo2_br_lbl 076031213 `"Itacarambi, São João das Missões"', add
label define geo2_br_lbl 076031214 `"Joanésia, Açucena, Naque, Periquito"', add
label define geo2_br_lbl 076031215 `"Careaçu, Natércia, Conceição das Pedras, Cristina, Jesuânia"', add
label define geo2_br_lbl 076031216 `"Pompéu"', add
label define geo2_br_lbl 076031217 `"Coluna, Paulistas, São João Evangelista"', add
label define geo2_br_lbl 076031218 `"Pirajuba, Conceição das Alagoas, Água Comprida"', add
label define geo2_br_lbl 076031219 `"Raul Soares, Vermelho Novo"', add
label define geo2_br_lbl 076031220 `"Datas, Presidente Kubitschek, Serro"', add
label define geo2_br_lbl 076031221 `"Barão de Cocais"', add
label define geo2_br_lbl 076031222 `"Extrema"', add
label define geo2_br_lbl 076031223 `"Urucânia, Piedade de Ponte Nova, Rio Casca"', add
label define geo2_br_lbl 076031224 `"Inconfidentes, Bom Repouso, Estiva"', add
label define geo2_br_lbl 076031225 `"Arceburgo, Guaranésia"', add
label define geo2_br_lbl 076031226 `"Santo Antônio do Itambé, Serra Azul de Minas, Sabinópolis, Materlândia"', add
label define geo2_br_lbl 076031227 `"Campestre, Serrania"', add
label define geo2_br_lbl 076031228 `"Cana Verde, Santana do Jacaré, Santo Antônio do Amparo"', add
label define geo2_br_lbl 076031229 `"Arantina, Bom Jardim de Minas, Lima Duarte, Pedro Teixeira"', add
label define geo2_br_lbl 076031230 `"Santo Antônio do Monte"', add
label define geo2_br_lbl 076031231 `"Monte Formoso, Joaíma, Felisburgo"', add
label define geo2_br_lbl 076031232 `"Dores do Indaiá, Martinho Campos"', add
label define geo2_br_lbl 076031233 `"Astolfo Dutra, Rodeiro, Dona Eusébia"', add
label define geo2_br_lbl 076031234 `"Nepomuceno"', add
label define geo2_br_lbl 076031235 `"Ressaquinha, Alfredo Vasconcelos, Senhora dos Remédios, Capela Nova"', add
label define geo2_br_lbl 076031236 `"Espírito Santo do Dourado, São João da Mata, Silvianópolis, São Sebastião da Bela Vista, Turvolândia, Cordislândia"', add
label define geo2_br_lbl 076031237 `"Santo Antônio do Grama, São Pedro dos Ferros, Abre Campo"', add
label define geo2_br_lbl 076031238 `"Tocantins, Piraúba"', add
label define geo2_br_lbl 076031239 `"Formoso, Arinos"', add
label define geo2_br_lbl 076031240 `"Lajinha, Chalé"', add
label define geo2_br_lbl 076031241 `"Aimorés"', add
label define geo2_br_lbl 076031242 `"Jacutinga, Albertina"', add
label define geo2_br_lbl 076031243 `"Alpinópolis, São José da Barra"', add
label define geo2_br_lbl 076031244 `"Pitangui"', add
label define geo2_br_lbl 076031245 `"Elói Mendes"', add
label define geo2_br_lbl 076031246 `"Perdizes, Serra do Salitre"', add
label define geo2_br_lbl 076031247 `"Alvarenga, Pocrane, Santa Rita do Itueto, Itueta"', add
label define geo2_br_lbl 076031248 `"Porto Firme, Guaraciaba, Acaiaca"', add
label define geo2_br_lbl 076031249 `"Pratápolis, Itaú de Minas"', add
label define geo2_br_lbl 076031250 `"Carmo da Cachoeira, Luminárias, São Thomé das Letras"', add
label define geo2_br_lbl 076031251 `"Belo Oriente"', add
label define geo2_br_lbl 076031252 `"Rio do Prado, Santo Antônio do Jacinto, Palmópolis"', add
label define geo2_br_lbl 076031253 `"Espera Feliz"', add
label define geo2_br_lbl 076031254 `"Jequitinhonha"', add
label define geo2_br_lbl 076031255 `"Turmalina, Veredinha"', add
label define geo2_br_lbl 076031256 `"Abaeté"', add
label define geo2_br_lbl 076031257 `"Carlos Chagas, Umburatiba"', add
label define geo2_br_lbl 076031258 `"Leandro Ferreira, Conceição do Pará, Onça de Pitangui, Pequi, São José da Varginha, Fortuna de Minas"', add
label define geo2_br_lbl 076031259 `"Teixeiras, Cajuri, São Miguel do Anta"', add
label define geo2_br_lbl 076031260 `"Bambuí"', add
label define geo2_br_lbl 076031261 `"Buritis"', add
label define geo2_br_lbl 076031262 `"Pedra Azul"', add
label define geo2_br_lbl 076031263 `"Caldas, Santa Rita de Caldas"', add
label define geo2_br_lbl 076031264 `"Santa Vitória, Ipiaçu"', add
label define geo2_br_lbl 076031265 `"Itaguara, Itatiaiuçu"', add
label define geo2_br_lbl 076031266 `"Barra Longa, Dom Silvério, Rio Doce, Santa Cruz do Escalvado, Sem-Peixe"', add
label define geo2_br_lbl 076031267 `"Monte Sião"', add
label define geo2_br_lbl 076031268 `"Fronteira dos Vales, Machacalis, Santa Helena de Minas, Bertópolis"', add
label define geo2_br_lbl 076031269 `"Caxambu"', add
label define geo2_br_lbl 076031270 `"São Francisco do Glória, Antônio Prado de Minas, Pedra Dourada, Tombos, Faria Lemos"', add
label define geo2_br_lbl 076031271 `"Divinolândia de Minas, Sardoá, Santa Efigênia de Minas, São Geraldo da Piedade"', add
label define geo2_br_lbl 076031272 `"Barão de Monte Alto, Patrocínio do Muriaé, Eugenópolis"', add
label define geo2_br_lbl 076031273 `"Papagaios, Maravilhas"', add
label define geo2_br_lbl 076031274 `"Carmo do Rio Claro"', add
label define geo2_br_lbl 076031275 `"Itaobim"', add
label define geo2_br_lbl 076031276 `"Nova União, Bom Jesus do Amparo, São Gonçalo do Rio Abaixo"', add
label define geo2_br_lbl 076031277 `"Campos Altos, Santa Rosa da Serra, Estrela do Indaiá"', add
label define geo2_br_lbl 076031278 `"Paraguaçu"', add
label define geo2_br_lbl 076031279 `"Vazante"', add
label define geo2_br_lbl 076031280 `"Matias Barbosa, Santana do Deserto, Chiador"', add
label define geo2_br_lbl 076031281 `"Botelhos, Bandeira do Sul"', add
label define geo2_br_lbl 076031282 `"Jacuí, Fortaleza de Minas, São Pedro da União, Bom Jesus da Penha"', add
label define geo2_br_lbl 076031283 `"Senador Firmino, Paula Cândido, Divinésia"', add
label define geo2_br_lbl 076031284 `"Ibiaí, Lagoa dos Patos, Jequitaí"', add
label define geo2_br_lbl 076032001 `"Vila Velha"', add
label define geo2_br_lbl 076032002 `"Serra"', add
label define geo2_br_lbl 076032003 `"Cariacica"', add
label define geo2_br_lbl 076032004 `"Vitória"', add
label define geo2_br_lbl 076032005 `"Cachoeiro de Itapemirim, Vargem Alta"', add
label define geo2_br_lbl 076032006 `"Linhares, Vila Valério, Rio Bananal, Sooretama"', add
label define geo2_br_lbl 076032007 `"Colatina, São Domingos do Norte, Marilândia, Governador Lindenberg"', add
label define geo2_br_lbl 076032008 `"São Mateus, Jaguaré"', add
label define geo2_br_lbl 076032009 `"Guarapari"', add
label define geo2_br_lbl 076032010 `"Muniz Freire, Brejetuba, Afonso Cláudio, Laranja da Terra, Itaguaçu"', add
label define geo2_br_lbl 076032011 `"Itapemirim, Marataízes, Piúma"', add
label define geo2_br_lbl 076032012 `"Aracruz"', add
label define geo2_br_lbl 076032013 `"Vila Pavão, Nova Venécia, Boa Esperança"', add
label define geo2_br_lbl 076032014 `"Viana"', add
label define geo2_br_lbl 076032015 `"Iúna, Irupi, Ibatiba"', add
label define geo2_br_lbl 076032016 `"Domingos Martins, Alfredo Chaves, Marechal Floriano"', add
label define geo2_br_lbl 076032017 `"Águia Branca, São Gabriel da Palha, Mantenópolis"', add
label define geo2_br_lbl 076032018 `"Barra de São Francisco, Água Doce do Norte"', add
label define geo2_br_lbl 076032019 `"Pedro Canário, Conceição da Barra"', add
label define geo2_br_lbl 076032020 `"Ibitirama, Divino de São Lourenço, Alegre, Dores do Rio Preto"', add
label define geo2_br_lbl 076032021 `"Santa Maria de Jetibá, Santa Leopoldina"', add
label define geo2_br_lbl 076032022 `"Itarana, Santa Teresa, São Roque do Canaã"', add
label define geo2_br_lbl 076032023 `"João Neiva, Fundão, Ibiraçu"', add
label define geo2_br_lbl 076032024 `"Mimoso do Sul, Presidente Kennedy"', add
label define geo2_br_lbl 076032025 `"Castelo"', add
label define geo2_br_lbl 076032026 `"Muqui, Jerônimo Monteiro, Atilio Vivacqua"', add
label define geo2_br_lbl 076032027 `"Conceição do Castelo, Venda Nova do Imigrante"', add
label define geo2_br_lbl 076032028 `"Mucurici, Ponto Belo, Montanha"', add
label define geo2_br_lbl 076032029 `"Baixo Guandu"', add
label define geo2_br_lbl 076032030 `"Alto Rio Novo, Pancas"', add
label define geo2_br_lbl 076032031 `"São José do Calçado, Bom Jesus do Norte, Apiacá"', add
label define geo2_br_lbl 076032032 `"Guaçuí"', add
label define geo2_br_lbl 076032033 `"Pinheiros"', add
label define geo2_br_lbl 076032034 `"Anchieta"', add
label define geo2_br_lbl 076032035 `"Rio Novo do Sul, Iconha"', add
label define geo2_br_lbl 076032036 `"Ecoporanga"', add
label define geo2_br_lbl 076033001 `"Rio de Janeiro"', add
label define geo2_br_lbl 076033002 `"Nova Iguaçu, Japeri, Queimados, Belford Roxo, Mesquita"', add
label define geo2_br_lbl 076033003 `"São Gonçalo"', add
label define geo2_br_lbl 076033004 `"Duque de Caxias"', add
label define geo2_br_lbl 076033005 `"Campos dos Goytacazes, Italva, Cardoso Moreira"', add
label define geo2_br_lbl 076033006 `"Niterói"', add
label define geo2_br_lbl 076033007 `"São João de Meriti"', add
label define geo2_br_lbl 076033008 `"Petrópolis, São José do Vale do Rio Preto"', add
label define geo2_br_lbl 076033009 `"Magé, Guapimirim"', add
label define geo2_br_lbl 076033010 `"Volta Redonda"', add
label define geo2_br_lbl 076033011 `"Itaboraí, Tanguá"', add
label define geo2_br_lbl 076033012 `"Macaé, Carapebus, Quissamã"', add
label define geo2_br_lbl 076033013 `"Cabo Frio, Armação dos Búzios"', add
label define geo2_br_lbl 076033014 `"Barra Mansa, Quatis"', add
label define geo2_br_lbl 076033015 `"Itaguaí, Seropédica"', add
label define geo2_br_lbl 076033016 `"Nova Friburgo"', add
label define geo2_br_lbl 076033017 `"Angra dos Reis"', add
label define geo2_br_lbl 076033018 `"Teresópolis"', add
label define geo2_br_lbl 076033019 `"Itatiaia, Porto Real, Resende"', add
label define geo2_br_lbl 076033020 `"Nilópolis"', add
label define geo2_br_lbl 076033021 `"Casimiro de Abreu, Rio das Ostras"', add
label define geo2_br_lbl 076033022 `"Arraial do Cabo, Iguaba Grande, São Pedro da Aldeia"', add
label define geo2_br_lbl 076033023 `"Maricá"', add
label define geo2_br_lbl 076033024 `"Araruama"', add
label define geo2_br_lbl 076033025 `"Comendador Levy Gasparian, Três Rios, Areal"', add
label define geo2_br_lbl 076033026 `"Itaperuna"', add
label define geo2_br_lbl 076033027 `"Barra do Piraí"', add
label define geo2_br_lbl 076033028 `"Valença, Rio das Flores"', add
label define geo2_br_lbl 076033029 `"Saquarema"', add
label define geo2_br_lbl 076033030 `"São Francisco de Itabapoana, São João da Barra"', add
label define geo2_br_lbl 076033031 `"Rio Claro, Piraí, Pinheiral"', add
label define geo2_br_lbl 076033032 `"Paracambi, Mendes"', add
label define geo2_br_lbl 076033033 `"Vassouras, Paty do Alferes"', add
label define geo2_br_lbl 076033034 `"Sapucaia, Sumidouro, Carmo, Duas Barras"', add
label define geo2_br_lbl 076033035 `"Rio Bonito"', add
label define geo2_br_lbl 076033036 `"Cachoeiras de Macacu"', add
label define geo2_br_lbl 076033037 `"Santo Antônio de Pádua, Aperibé"', add
label define geo2_br_lbl 076033038 `"Natividade, Varre-Sai, Porciúncula"', add
label define geo2_br_lbl 076033039 `"Paraíba do Sul"', add
label define geo2_br_lbl 076033040 `"Engenheiro Paulo de Frontin, Miguel Pereira"', add
label define geo2_br_lbl 076033041 `"São Fidélis"', add
label define geo2_br_lbl 076033042 `"Paraty"', add
label define geo2_br_lbl 076033043 `"Mangaratiba"', add
label define geo2_br_lbl 076033044 `"Miracema, Laje do Muriaé"', add
label define geo2_br_lbl 076033045 `"Bom Jesus do Itabapoana"', add
label define geo2_br_lbl 076033046 `"Cantagalo, São Sebastião do Alto"', add
label define geo2_br_lbl 076033047 `"Cordeiro, Macuco"', add
label define geo2_br_lbl 076033048 `"Bom Jardim"', add
label define geo2_br_lbl 076033049 `"Itaocara"', add
label define geo2_br_lbl 076033050 `"Cambuci, São José de Ubá"', add
label define geo2_br_lbl 076033051 `"Silva Jardim"', add
label define geo2_br_lbl 076033052 `"Conceição de Macabu"', add
label define geo2_br_lbl 076033053 `"Trajano de Moraes, Santa Maria Madalena"', add
label define geo2_br_lbl 076035001 `"São Paulo"', add
label define geo2_br_lbl 076035002 `"Guarulhos"', add
label define geo2_br_lbl 076035003 `"Campinas"', add
label define geo2_br_lbl 076035004 `"São Bernardo do Campo"', add
label define geo2_br_lbl 076035005 `"Santo André"', add
label define geo2_br_lbl 076035006 `"Osasco"', add
label define geo2_br_lbl 076035007 `"São José dos Campos"', add
label define geo2_br_lbl 076035008 `"Guatapará, Ribeirão Preto"', add
label define geo2_br_lbl 076035009 `"Sorocaba"', add
label define geo2_br_lbl 076035010 `"Santos, Bertioga"', add
label define geo2_br_lbl 076035011 `"Sumaré, Hortolândia"', add
label define geo2_br_lbl 076035012 `"Mauá"', add
label define geo2_br_lbl 076035013 `"Ipiguá, São José do Rio Preto"', add
label define geo2_br_lbl 076035014 `"Mogi das Cruzes"', add
label define geo2_br_lbl 076035015 `"Diadema"', add
label define geo2_br_lbl 076035016 `"Piracicaba, Saltinho"', add
label define geo2_br_lbl 076035017 `"Jundiaí"', add
label define geo2_br_lbl 076035018 `"Carapicuíba"', add
label define geo2_br_lbl 076035019 `"Bauru"', add
label define geo2_br_lbl 076035020 `"São Vicente"', add
label define geo2_br_lbl 076035021 `"Itaquaquecetuba"', add
label define geo2_br_lbl 076035022 `"Franca"', add
label define geo2_br_lbl 076035023 `"Guarujá"', add
label define geo2_br_lbl 076035024 `"Taubaté"', add
label define geo2_br_lbl 076035025 `"Limeira"', add
label define geo2_br_lbl 076035026 `"Suzano"', add
label define geo2_br_lbl 076035027 `"Praia Grande"', add
label define geo2_br_lbl 076035028 `"Cotia, Vargem Grande Paulista"', add
label define geo2_br_lbl 076035029 `"Taboão da Serra"', add
label define geo2_br_lbl 076035030 `"Embu"', add
label define geo2_br_lbl 076035031 `"Barueri"', add
label define geo2_br_lbl 076035032 `"São Carlos"', add
label define geo2_br_lbl 076035033 `"Gavião Peixoto, Araraquara, Motuca"', add
label define geo2_br_lbl 076035034 `"Marília"', add
label define geo2_br_lbl 076035035 `"Jacareí"', add
label define geo2_br_lbl 076035036 `"Americana"', add
label define geo2_br_lbl 076035037 `"Presidente Prudente"', add
label define geo2_br_lbl 076035038 `"Indaiatuba"', add
label define geo2_br_lbl 076035039 `"Itapevi"', add
label define geo2_br_lbl 076035040 `"Araçatuba, Santo Antônio do Aracanguá"', add
label define geo2_br_lbl 076035041 `"Rio Claro"', add
label define geo2_br_lbl 076035042 `"Santa Bárbara d'Oeste"', add
label define geo2_br_lbl 076035043 `"Ferraz de Vasconcelos"', add
label define geo2_br_lbl 076035044 `"São Lourenço da Serra, Itapecerica da Serra"', add
label define geo2_br_lbl 076035045 `"Tuiuti, Bragança Paulista, Vargem"', add
label define geo2_br_lbl 076035046 `"Itu"', add
label define geo2_br_lbl 076035047 `"Francisco Morato"', add
label define geo2_br_lbl 076035048 `"Itapetininga, Alambari"', add
label define geo2_br_lbl 076035049 `"São Caetano do Sul"', add
label define geo2_br_lbl 076035050 `"Pindamonhangaba"', add
label define geo2_br_lbl 076035051 `"Atibaia, Bom Jesus dos Perdões"', add
label define geo2_br_lbl 076035052 `"Mogi Guaçu, Estiva Gerbi"', add
label define geo2_br_lbl 076035053 `"Jaú"', add
label define geo2_br_lbl 076035054 `"Guaratinguetá, Potim"', add
label define geo2_br_lbl 076035055 `"Franco da Rocha"', add
label define geo2_br_lbl 076035056 `"Botucatu"', add
label define geo2_br_lbl 076035057 `"Itapeva, Nova Campina, Taquarivaí, Guapiara"', add
label define geo2_br_lbl 076035058 `"Araras"', add
label define geo2_br_lbl 076035059 `"Cubatão"', add
label define geo2_br_lbl 076035060 `"Elisiário, Catanduva"', add
label define geo2_br_lbl 076035061 `"Ribeirão Pires"', add
label define geo2_br_lbl 076035062 `"Barretos"', add
label define geo2_br_lbl 076035063 `"Sertãozinho"', add
label define geo2_br_lbl 076035064 `"Quadra, Tatuí"', add
label define geo2_br_lbl 076035065 `"Tarumã, Assis"', add
label define geo2_br_lbl 076035066 `"Votorantim"', add
label define geo2_br_lbl 076035067 `"Jandira"', add
label define geo2_br_lbl 076035068 `"Santana de Parnaíba"', add
label define geo2_br_lbl 076035069 `"Birigui"', add
label define geo2_br_lbl 076035070 `"Várzea Paulista"', add
label define geo2_br_lbl 076035071 `"Valinhos"', add
label define geo2_br_lbl 076035072 `"Salto"', add
label define geo2_br_lbl 076035073 `"Ourinhos"', add
label define geo2_br_lbl 076035074 `"Poá"', add
label define geo2_br_lbl 076035075 `"Itatiba"', add
label define geo2_br_lbl 076035076 `"Caraguatatuba"', add
label define geo2_br_lbl 076035077 `"São Roque, Araçariguama"', add
label define geo2_br_lbl 076035078 `"Leme"', add
label define geo2_br_lbl 076035079 `"Moji Mirim"', add
label define geo2_br_lbl 076035080 `"Itanhaém"', add
label define geo2_br_lbl 076035081 `"Lorena, Canas"', add
label define geo2_br_lbl 076035082 `"Caçapava"', add
label define geo2_br_lbl 076035083 `"Votuporanga, Parisi"', add
label define geo2_br_lbl 076035084 `"Caieiras"', add
label define geo2_br_lbl 076035085 `"São João da Boa Vista"', add
label define geo2_br_lbl 076035086 `"Avaré"', add
label define geo2_br_lbl 076035087 `"Mairiporã"', add
label define geo2_br_lbl 076035088 `"Paulínia"', add
label define geo2_br_lbl 076035089 `"Amparo, Morungaba"', add
label define geo2_br_lbl 076035090 `"Itápolis, Santa Adélia, Fernando Prestes, Tabatinga, Cândido Rodrigues"', add
label define geo2_br_lbl 076035091 `"Ubatuba"', add
label define geo2_br_lbl 076035092 `"Arujá"', add
label define geo2_br_lbl 076035093 `"Matão"', add
label define geo2_br_lbl 076035094 `"Cruzeiro"', add
label define geo2_br_lbl 076035095 `"Avanhandava, Barbosa, José Bonifácio, Ubarana, Nipoã, Neves Paulista, Jaci"', add
label define geo2_br_lbl 076035096 `"Bebedouro"', add
label define geo2_br_lbl 076035097 `"São Sebastião"', add
label define geo2_br_lbl 076035098 `"Registro, Pariquera-Açu"', add
label define geo2_br_lbl 076035099 `"Ibiúna"', add
label define geo2_br_lbl 076035100 `"Lins"', add
label define geo2_br_lbl 076035101 `"Campo Limpo Paulista"', add
label define geo2_br_lbl 076035102 `"Pirassununga"', add
label define geo2_br_lbl 076035103 `"Jaboticabal"', add
label define geo2_br_lbl 076035104 `"Mirassol, Bady Bassitt"', add
label define geo2_br_lbl 076035105 `"Itapira"', add
label define geo2_br_lbl 076035106 `"Taquaritinga, Dobrada, Santa Ernestina"', add
label define geo2_br_lbl 076035107 `"Guapiaçu, Olímpia"', add
label define geo2_br_lbl 076035108 `"Fernandópolis"', add
label define geo2_br_lbl 076035109 `"Mococa"', add
label define geo2_br_lbl 076035110 `"Tupã, Arco-Íris"', add
label define geo2_br_lbl 076035111 `"Porto Feliz, Elias Fausto"', add
label define geo2_br_lbl 076035112 `"Cajamar"', add
label define geo2_br_lbl 076035113 `"Vinhedo"', add
label define geo2_br_lbl 076035114 `"Ibitinga, Nova Europa"', add
label define geo2_br_lbl 076035115 `"Embu-Guaçu"', add
label define geo2_br_lbl 076035116 `"Borebi, Lençóis Paulista"', add
label define geo2_br_lbl 076035117 `"Peruíbe"', add
label define geo2_br_lbl 076035118 `"Sud Mennucci, Nova Canaã Paulista, Três Fronteiras, Palmeira d'Oeste, Guzolândia, Santa Salete, Aspásia, São Francisco, Urânia, Auriflama, Dirce Reis"', add
label define geo2_br_lbl 076035119 `"Mairinque, Alumínio"', add
label define geo2_br_lbl 076035120 `"Engenheiro Coelho, Artur Nogueira"', add
label define geo2_br_lbl 076035121 `"Cosmópolis"', add
label define geo2_br_lbl 076035122 `"Tupi Paulista, Dracena, Nova Guataporanga"', add
label define geo2_br_lbl 076035123 `"Ilha Solteira, Pereira Barreto, Suzanápolis, Aparecida d'Oeste, Marinópolis"', add
label define geo2_br_lbl 076035124 `"Itapirapuã Paulista, Barra do Chapéu, Ribeira, Apiaí, Ribeirão Branco, Itaóca"', add
label define geo2_br_lbl 076035125 `"Penápolis"', add
label define geo2_br_lbl 076035126 `"Ituverava, Guará"', add
label define geo2_br_lbl 076035127 `"Colômbia, Guaíra, Ipuã"', add
label define geo2_br_lbl 076035128 `"Cabreúva, Pirapora do Bom Jesus"', add
label define geo2_br_lbl 076035129 `"Batatais"', add
label define geo2_br_lbl 076035130 `"Holambra, Jaguariúna"', add
label define geo2_br_lbl 076035131 `"Taquaral, Pitangueiras, Viradouro"', add
label define geo2_br_lbl 076035132 `"Andradina"', add
label define geo2_br_lbl 076035133 `"Pratânia, São Manuel, Mineiros do Tietê"', add
label define geo2_br_lbl 076035134 `"Capão Bonito, Ribeirão Grande"', add
label define geo2_br_lbl 076035135 `"Guariba, Pradópolis"', add
label define geo2_br_lbl 076035136 `"Paulicéia, Santa Mercedes, Castilho, São João do Pau d'Alho, Monte Castelo, Nova Independência, Itapura, Guaraçaí, Murutinga do Sul"', add
label define geo2_br_lbl 076035137 `"Herculândia, Pompéia, Queiroz, Alto Alegre, Getulina, Oriente"', add
label define geo2_br_lbl 076035138 `"Jales, Pontalinda, Vitória Brasil"', add
label define geo2_br_lbl 076035139 `"Nova Odessa"', add
label define geo2_br_lbl 076035140 `"Tietê, Jumirim, Mombuca, Rafard"', add
label define geo2_br_lbl 076035141 `"São José do Rio Pardo"', add
label define geo2_br_lbl 076035142 `"Itararé, Bom Sucesso de Itararé"', add
label define geo2_br_lbl 076035143 `"Piedade"', add
label define geo2_br_lbl 076035144 `"Porto Ferreira"', add
label define geo2_br_lbl 076035145 `"Rosana, Euclides da Cunha Paulista, Teodoro Sampaio"', add
label define geo2_br_lbl 076035146 `"Monte Mor"', add
label define geo2_br_lbl 076035147 `"Cananéia, Ilha Comprida, Iguape"', add
label define geo2_br_lbl 076035148 `"Óleo, Paulistânia, Agudos, Águas de Santa Bárbara, Iaras"', add
label define geo2_br_lbl 076035149 `"São Pedro, Charqueada, Águas de São Pedro"', add
label define geo2_br_lbl 076035150 `"Santa Isabel"', add
label define geo2_br_lbl 076035151 `"Boituva"', add
label define geo2_br_lbl 076035152 `"Capivari"', add
label define geo2_br_lbl 076035153 `"Espírito Santo do Pinhal, Santo Antônio do Jardim"', add
label define geo2_br_lbl 076035154 `"Santa Cruz do Rio Pardo, Espírito Santo do Turvo"', add
label define geo2_br_lbl 076035155 `"Campos do Jordão"', add
label define geo2_br_lbl 076035156 `"Monte Alto"', add
label define geo2_br_lbl 076035157 `"Promissão, Guaiçara"', add
label define geo2_br_lbl 076035158 `"Rancharia, João Ramalho, Quatá"', add
label define geo2_br_lbl 076035159 `"São Joaquim da Barra"', add
label define geo2_br_lbl 076035160 `"Jaborandi, Morro Agudo, Sales Oliveira"', add
label define geo2_br_lbl 076035161 `"Mongaguá"', add
label define geo2_br_lbl 076035162 `"Cajati, Jacupiranga"', add
label define geo2_br_lbl 076035163 `"Pederneiras, Boracéia"', add
label define geo2_br_lbl 076035164 `"Capela do Alto, Araçoiaba da Serra"', add
label define geo2_br_lbl 076035165 `"Vera Cruz, Júlio Mesquita, Álvaro de Carvalho, Pirajuí, Balbinos"', add
label define geo2_br_lbl 076035166 `"Bariri, Itapuí"', add
label define geo2_br_lbl 076035167 `"Rio Grande da Serra"', add
label define geo2_br_lbl 076035168 `"Piquete, Cachoeira Paulista"', add
label define geo2_br_lbl 076035169 `"Santa Lúcia, Rincão, Luís Antônio, São Simão"', add
label define geo2_br_lbl 076035170 `"Uchoa, Tabapuã, Novais, Cajobi, Embaúba, Paraíso"', add
label define geo2_br_lbl 076035171 `"Itupeva"', add
label define geo2_br_lbl 076035172 `"Garça"', add
label define geo2_br_lbl 076035173 `"Altinópolis, Patrocínio Paulista, Santo Antônio da Alegria, Cássia dos Coqueiros, Itirapuã"', add
label define geo2_br_lbl 076035174 `"Pedreira"', add
label define geo2_br_lbl 076035175 `"Guaimbê, Cafelândia, Adolfo, Guarantã, Sabino, Pongaí, Uru"', add
label define geo2_br_lbl 076035176 `"Paraguaçu Paulista"', add
label define geo2_br_lbl 076035177 `"Potirendaba, Cedral, Ibirá, Catiguá"', add
label define geo2_br_lbl 076035178 `"Tapiratiba, Divinolândia, Caconde"', add
label define geo2_br_lbl 076035179 `"Pindorama, Palmares Paulista, Ariranha, Vista Alegre do Alto"', add
label define geo2_br_lbl 076035180 `"Nazaré Paulista, Piracaia"', add
label define geo2_br_lbl 076035181 `"Salto de Pirapora"', add
label define geo2_br_lbl 076035182 `"Santo Anastácio, Ribeirão dos Índios, Junqueirópolis"', add
label define geo2_br_lbl 076035183 `"Presidente Epitácio"', add
label define geo2_br_lbl 076035184 `"Cesário Lange, Laranjal Paulista"', add
label define geo2_br_lbl 076035185 `"Tremembé"', add
label define geo2_br_lbl 076035186 `"Cerquilho"', add
label define geo2_br_lbl 076035187 `"Juquiá, Miracatu"', add
label define geo2_br_lbl 076035188 `"Vargem Grande do Sul"', add
label define geo2_br_lbl 076035189 `"Piraju, Bernardino de Campos"', add
label define geo2_br_lbl 076035190 `"Timburi, Fartura, Barão de Antonina, Itaporanga, Sarutaiá"', add
label define geo2_br_lbl 076035191 `"Boa Esperança do Sul, Bocaina, Trabiju, Ribeirão Bonito"', add
label define geo2_br_lbl 076035192 `"Pontal"', add
label define geo2_br_lbl 076035193 `"Serrana"', add
label define geo2_br_lbl 076035194 `"Orlândia"', add
label define geo2_br_lbl 076035195 `"Marabá Paulista, Mirante do Paranapanema, Caiuá, Sandovalina, Piquerobi, Estrela do Norte"', add
label define geo2_br_lbl 076035196 `"Presidente Venceslau"', add
label define geo2_br_lbl 076035197 `"Socorro"', add
label define geo2_br_lbl 076035198 `"Jardinópolis"', add
label define geo2_br_lbl 076035199 `"Serra Azul, Santa Cruz da Esperança, Cajuru"', add
label define geo2_br_lbl 076035200 `"Barrinha, Dumont"', add
label define geo2_br_lbl 076035201 `"Palmital, Ibirarema, Salto Grande"', add
label define geo2_br_lbl 076035202 `"Novo Horizonte"', add
label define geo2_br_lbl 076035203 `"Louveira"', add
label define geo2_br_lbl 076035204 `"Paranapanema, Buri"', add
label define geo2_br_lbl 076035205 `"São Pedro do Turvo, Ubirajara, Gália, Lucianópolis, Fernão, Presidente Alves, Cabrália Paulista, Avaí"', add
label define geo2_br_lbl 076035206 `"Indiaporã, Macedônia, Pedranópolis, Mira Estrela, Cardoso, Riolândia"', add
label define geo2_br_lbl 076035207 `"Salmourão, Guararapes"', add
label define geo2_br_lbl 076035208 `"General Salgado, Estrela d'Oeste, Ouroeste, São João de Iracema, São João das Duas Pontes, Nova Castilho, Guarani d'Oeste"', add
label define geo2_br_lbl 076035209 `"Sarapuí, Pilar do Sul"', add
label define geo2_br_lbl 076035210 `"Severínia, Monte Azul Paulista"', add
label define geo2_br_lbl 076035211 `"Barra Bonita"', add
label define geo2_br_lbl 076035212 `"Parapuã, Rinópolis, Piacatu, Iacri, Gabriel Monteiro"', add
label define geo2_br_lbl 076035213 `"Tejupá, Itaí, Arandu"', add
label define geo2_br_lbl 076035214 `"Adamantina"', add
label define geo2_br_lbl 076035215 `"Monte Aprazível, Poloni, Bálsamo"', add
label define geo2_br_lbl 076035216 `"Nhandeara, Macaubal, Sebastianópolis do Sul, Cosmorama, Américo de Campos"', add
label define geo2_br_lbl 076035217 `"Itirapina, Analândia, Ipeúna, Corumbataí, Santa Cruz da Conceição"', add
label define geo2_br_lbl 076035218 `"Buritizal, Jeriquara, Pedregulho, Rifaina, Cristais Paulista"', add
label define geo2_br_lbl 076035219 `"Américo Brasiliense"', add
label define geo2_br_lbl 076035220 `"Caiabu, Martinópolis, Mariápolis, Sagres"', add
label define geo2_br_lbl 076035221 `"Dois Córregos, Dourado"', add
label define geo2_br_lbl 076035222 `"Aparecida"', add
label define geo2_br_lbl 076035223 `"Jambeiro, Paraibuna, Redenção da Serra, Natividade da Serra"', add
label define geo2_br_lbl 076035224 `"Cravinhos"', add
label define geo2_br_lbl 076035225 `"Ibaté"', add
label define geo2_br_lbl 076035226 `"Taguaí, Taquarituba"', add
label define geo2_br_lbl 076035227 `"Aguaí"', add
label define geo2_br_lbl 076035228 `"São Miguel Arcanjo"', add
label define geo2_br_lbl 076035229 `"Brotas, Torrinha"', add
label define geo2_br_lbl 076035230 `"Canitar, Chavantes, Ipaussu"', add
label define geo2_br_lbl 076035231 `"Cândido Mota"', add
label define geo2_br_lbl 076035232 `"Orindiúva, Onda Verde, Icém, Altair, Guaraci"', add
label define geo2_br_lbl 076035233 `"Descalvado"', add
label define geo2_br_lbl 076035234 `"Osvaldo Cruz"', add
label define geo2_br_lbl 076035235 `"Santa Cruz das Palmeiras"', add
label define geo2_br_lbl 076035236 `"Salesópolis, Santa Branca"', add
label define geo2_br_lbl 076035237 `"Urupês, Marapoama, Itajobi"', add
label define geo2_br_lbl 076035238 `"Presidente Bernardes, Tarabai, Emilianópolis, Alfredo Marcondes, Santo Expedito"', add
label define geo2_br_lbl 076035239 `"Ilhabela"', add
label define geo2_br_lbl 076035240 `"Riversul, Coronel Macedo, Itaberá"', add
label define geo2_br_lbl 076035241 `"Juquitiba"', add
label define geo2_br_lbl 076035242 `"Santa Fé do Sul"', add
label define geo2_br_lbl 076035243 `"Iperó"', add
label define geo2_br_lbl 076035244 `"Rubinéia, Santa Clara d'Oeste, Santa Rita d'Oeste, Santana da Ponte Pensa, Santa Albertina, Mesópolis, Paranapuã, Populina, Dolcinópolis, Turmalina"', add
label define geo2_br_lbl 076035245 `"Casa Branca"', add
label define geo2_br_lbl 076035246 `"Rio das Pedras"', add
label define geo2_br_lbl 076035247 `"Angatuba, Campina do Monte Alegre"', add
label define geo2_br_lbl 076035248 `"Coroados, Braúna, Buritama, Brejo Alegre"', add
label define geo2_br_lbl 076035249 `"Biritiba-Mirim"', add
label define geo2_br_lbl 076035250 `"Igarapava"', add
label define geo2_br_lbl 076035251 `"Itobi, São Sebastião da Grama, Águas da Prata"', add
label define geo2_br_lbl 076035252 `"Mirandópolis"', add
label define geo2_br_lbl 076035253 `"Manduri, Cerqueira César"', add
label define geo2_br_lbl 076035254 `"Macatuba, Areiópolis"', add
label define geo2_br_lbl 076035255 `"Valparaíso, Bento de Abreu, Rubiácea"', add
label define geo2_br_lbl 076035256 `"Nova Luzitânia, Lourdes, Glicério, Gastão Vidigal, Turiúba, Monções, Zacarias, Planalto, União Paulista"', add
label define geo2_br_lbl 076035257 `"Serra Negra"', add
label define geo2_br_lbl 076035258 `"Colina, Terra Roxa"', add
label define geo2_br_lbl 076035259 `"Pracinha, Lucélia, Inúbia Paulista"', add
label define geo2_br_lbl 076035260 `"Iporanga, Barra do Turvo, Eldorado"', add
label define geo2_br_lbl 076035261 `"Monte Alegre do Sul, Pinhalzinho, Pedra Bela"', add
label define geo2_br_lbl 076035262 `"Nuporanga, São José da Bela Vista, Ribeirão Corrente, Restinga"', add
label define geo2_br_lbl 076035263 `"Conchal"', add
label define geo2_br_lbl 076035264 `"Guareí, Torre de Pedra, Porangaba"', add
label define geo2_br_lbl 076035265 `"Aramina, Miguelópolis"', add
label define geo2_br_lbl 076035266 `"Pedro de Toledo, Itariri"', add
label define geo2_br_lbl 076035267 `"Santa Rita do Passa Quatro"', add
label define geo2_br_lbl 076035268 `"Guararema"', add
label define geo2_br_lbl 076035269 `"Álvares Florence, Pontes Gestal, Palestina, Paulo de Faria"', add
label define geo2_br_lbl 076035270 `"São Luís do Paraitinga, Roseira, Lagoinha"', add
label define geo2_br_lbl 076035271 `"Pirapozinho"', add
label define geo2_br_lbl 076035272 `"Duartina, Piratininga"', add
label define geo2_br_lbl 076035273 `"Lindóia, Águas de Lindóia"', add
label define geo2_br_lbl 076035274 `"Tanabi"', add
label define geo2_br_lbl 076035275 `"Narandiba, Anhumas, Taciba, Nantes, Iepê"', add
label define geo2_br_lbl 076035276 `"Santa Rosa de Viterbo"', add
label define geo2_br_lbl 076035277 `"Lavrinhas, Silveiras, Queluz"', add
label define geo2_br_lbl 076035278 `"Mendonça, Sales, Nova Aliança, Irapuã"', add
label define geo2_br_lbl 076035279 `"Mirassolândia, Nova Granada"', add
label define geo2_br_lbl 076035280 `"Santópolis do Aguapeí, Clementina, Bilac, Luiziânia"', add
label define geo2_br_lbl 076035281 `"Álvares Machado"', add
label define geo2_br_lbl 076035282 `"Jarinu"', add
label define geo2_br_lbl 076035283 `"Flora Rica, Flórida Paulista, Lavínia"', add
label define geo2_br_lbl 076035284 `"Conchas, Pereiras"', add
label define geo2_br_lbl 076035285 `"Regente Feijó, Indiana"', add
label define geo2_br_lbl 076035286 `"Itatinga, Pardinho"', add
label define geo2_br_lbl 076035287 `"Tambaú"', add
label define geo2_br_lbl 076035288 `"Igaraçu do Tietê"', add
label define geo2_br_lbl 076035289 `"Reginópolis, Borborema"', add
label define geo2_br_lbl 076035290 `"Pirangi, Taiaçu, Taiúva"', add
label define geo2_br_lbl 076035291 `"Panorama, Ouro Verde"', add
label define geo2_br_lbl 076035292 `"Cunha"', add
label define geo2_br_lbl 076035293 `"Santa Gertrudes"', add
label define geo2_br_lbl 076035294 `"Cordeirópolis"', add
label define geo2_br_lbl 076035295 `"Borá, Quintana, Lutécia, Echaporã, Oscar Bressane, Platina"', add
label define geo2_br_lbl 076035296 `"Maracaí, Pedrinhas Paulista, Cruzália, Florínia"', add
label define geo2_br_lbl 076035297 `"Monteiro Lobato, Santo Antônio do Pinhal, São Bento do Sapucaí"', add
label define geo2_br_lbl 076035298 `"Brodowski"', add
label define geo2_br_lbl 076035299 `"Iacanga, Arealva, Itaju"', add
label define geo2_br_lbl 076035300 `"Joanópolis, Igaratá"', add
label define geo2_br_lbl 076035301 `"Meridiano, Magda, Floreal, Valentim Gentil"', add
label define geo2_br_lbl 076035302 `"Irapuru, Pacaembu"', add
label define geo2_br_lbl 076035303 `"Campos Novos Paulista, Ocauçu, Ribeirão do Sul, Lupércio, Alvinlândia"', add
label define geo2_br_lbl 076035304 `"Bofete, Anhembi, Santa Maria da Serra"', add
label define geo2_br_lbl 076035305 `"Sete Barras, Tapiraí"', add
label define geo2_br_lbl 076035306 `"Areias, São José do Barreiro, Arapeí, Bananal"', add
label define geo2_br_lbl 076035307 `"Bastos"', add
label define geo2_br_lbl 076035308 `"Iracemápolis"', add
label define geo2_br_lbl 076035309 `"Santo Antônio de Posse"', add
label define geo2_br_lbl 076041001 `"Curitiba"', add
label define geo2_br_lbl 076041002 `"Londrina, Tamarana"', add
label define geo2_br_lbl 076041003 `"Maringá"', add
label define geo2_br_lbl 076041004 `"Santa Tereza do Oeste, Cascavel, Lindoeste, Cafelândia"', add
label define geo2_br_lbl 076041005 `"Ponta Grossa"', add
label define geo2_br_lbl 076041006 `"Foz do Iguaçu, Santa Terezinha de Itaipu"', add
label define geo2_br_lbl 076041007 `"São José dos Pinhais"', add
label define geo2_br_lbl 076041008 `"Marquinho, Candói, Cantagalo, Foz do Jordão, Goioxim, Guarapuava, Campina do Simão, Turvo"', add
label define geo2_br_lbl 076041009 `"Colombo"', add
label define geo2_br_lbl 076041010 `"Pinhais, Piraquara"', add
label define geo2_br_lbl 076041011 `"Paranaguá, Pontal do Paraná"', add
label define geo2_br_lbl 076041012 `"São Pedro do Iguaçu, Ouro Verde do Oeste, Toledo"', add
label define geo2_br_lbl 076041013 `"Campo Magro, Almirante Tamandaré"', add
label define geo2_br_lbl 076041014 `"Apucarana"', add
label define geo2_br_lbl 076041015 `"Araucária"', add
label define geo2_br_lbl 076041016 `"Alto Paraíso, Umuarama, Ivaté, Perobal"', add
label define geo2_br_lbl 076041017 `"Marialva, Sarandi"', add
label define geo2_br_lbl 076041018 `"Campo Largo"', add
label define geo2_br_lbl 076041019 `"Arapongas"', add
label define geo2_br_lbl 076041020 `"Mandirituba, Fazenda Rio Grande"', add
label define geo2_br_lbl 076041021 `"Farol, Campo Mourão, Luiziana"', add
label define geo2_br_lbl 076041022 `"Cambé"', add
label define geo2_br_lbl 076041023 `"Carambeí, Castro"', add
label define geo2_br_lbl 076041024 `"Imbaú, Telêmaco Borba"', add
label define geo2_br_lbl 076041025 `"Paranavaí"', add
label define geo2_br_lbl 076041026 `"Francisco Beltrão"', add
label define geo2_br_lbl 076041027 `"Campina Grande do Sul, Quatro Barras, Morretes"', add
label define geo2_br_lbl 076041028 `"Mato Rico, Santa Maria do Oeste, Pitanga, Nova Tebas, Manoel Ribas, Boa Ventura de São Roque"', add
label define geo2_br_lbl 076041029 `"Bom Sucesso do Sul, Pato Branco"', add
label define geo2_br_lbl 076041030 `"Cianorte"', add
label define geo2_br_lbl 076041031 `"Entre Rios do Oeste, Marechal Cândido Rondon, Pato Bragado, Mercedes, Quatro Pontes"', add
label define geo2_br_lbl 076041032 `"Nova Laranjeiras, Rio Bonito do Iguaçu, Laranjeiras do Sul, Porto Barreiro, Virmond"', add
label define geo2_br_lbl 076041033 `"Prudentópolis, Ivaí"', add
label define geo2_br_lbl 076041034 `"Pitangueiras, Rolândia"', add
label define geo2_br_lbl 076041035 `"Assis Chateaubriand, Tupãssi, Jesuítas, Formosa do Oeste, Iracema do Oeste"', add
label define geo2_br_lbl 076041036 `"Grandes Rios, Cândido de Abreu, Rio Branco do Ivaí, Rosário do Ivaí, Reserva"', add
label define geo2_br_lbl 076041037 `"Barra do Jacaré, Santo Antônio da Platina, Joaquim Távora"', add
label define geo2_br_lbl 076041038 `"Tuneiras do Oeste, Campina da Lagoa, Juranda, Janiópolis, Boa Esperança, Mamborê"', add
label define geo2_br_lbl 076041039 `"Irati"', add
label define geo2_br_lbl 076041040 `"Rebouças, São Mateus do Sul"', add
label define geo2_br_lbl 076041041 `"Itaperuçu, Rio Branco do Sul"', add
label define geo2_br_lbl 076041042 `"União da Vitória"', add
label define geo2_br_lbl 076041043 `"Lapa, Campo do Tenente"', add
label define geo2_br_lbl 076041044 `"Pérola d'Oeste, Pranchita, Santo Antônio do Sudoeste, Bela Vista da Caroba, Bom Jesus do Sul, Barracão, Pinhal de São Bento"', add
label define geo2_br_lbl 076041045 `"Coronel Domingos Soares, Palmas"', add
label define geo2_br_lbl 076041046 `"Quarto Centenário, Goioerê, Moreira Sales, Rancho Alegre D'Oeste"', add
label define geo2_br_lbl 076041047 `"Ibiporã"', add
label define geo2_br_lbl 076041048 `"Cornélio Procópio"', add
label define geo2_br_lbl 076041049 `"Palmeira, Porto Amazonas, Balsa Nova"', add
label define geo2_br_lbl 076041050 `"Medianeira, Serranópolis do Iguaçu"', add
label define geo2_br_lbl 076041051 `"Doutor Ulysses, Cerro Azul, Bocaiúva do Sul, Adrianópolis, Tunas do Paraná"', add
label define geo2_br_lbl 076041052 `"São Pedro do Ivaí, Godoy Moreira, São João do Ivaí, Jardim Alegre, Lunardelli, Lidianópolis"', add
label define geo2_br_lbl 076041053 `"Diamante D'Oeste, Ramilândia, Vera Cruz do Oeste, Matelândia, Céu Azul"', add
label define geo2_br_lbl 076041054 `"Quatiguá, Wenceslau Braz, Siqueira Campos"', add
label define geo2_br_lbl 076041055 `"Ibaiti, Japira, Jaboti, Pinhalão"', add
label define geo2_br_lbl 076041056 `"Araruna, Peabiru, Corumbataí do Sul, Barbosa Ferraz"', add
label define geo2_br_lbl 076041057 `"Assaí, Santa Cecília do Pavão, Nova Santa Bárbara, São Sebastião da Amoreira, Nova América da Colina, Nova Fátima"', add
label define geo2_br_lbl 076041058 `"Quitandinha, Contenda, Piên"', add
label define geo2_br_lbl 076041059 `"Boa Esperança do Iguaçu, Dois Vizinhos, Cruzeiro do Iguaçu"', add
label define geo2_br_lbl 076041060 `"Nova Santa Rosa, Palotina, Maripá"', add
label define geo2_br_lbl 076041061 `"Porecatu, Florestópolis, Bela Vista do Paraíso"', add
label define geo2_br_lbl 076041062 `"Alto Paraná, Nova Esperança"', add
label define geo2_br_lbl 076041063 `"Nova Aurora, Corbélia, Anahy, Braganey, Iguatu"', add
label define geo2_br_lbl 076041064 `"Nova Esperança do Sudoeste, Enéas Marques, São Jorge d'Oeste, Verê, São João"', add
label define geo2_br_lbl 076041065 `"Mallet, Rio Azul, Paula Freitas, Paulo Frontin"', add
label define geo2_br_lbl 076041066 `"Arapuã, Ivaiporã, Ariranha do Ivaí"', add
label define geo2_br_lbl 076041067 `"Iporã, Xambrê, Cafezal do Sul, Brasilândia do Sul, Alto Piquiri"', add
label define geo2_br_lbl 076041068 `"Jacarezinho"', add
label define geo2_br_lbl 076041069 `"Altônia, São Jorge do Patrocínio, Esperança Nova, Pérola"', add
label define geo2_br_lbl 076041070 `"Santa Helena, Missal, São José das Palmeiras"', add
label define geo2_br_lbl 076041071 `"Reserva do Iguaçu, Pinhão"', add
label define geo2_br_lbl 076041072 `"Munhoz de Melo, Jaguapitã, Lupionópolis, Centenário do Sul, Miraselva, Prado Ferreira"', add
label define geo2_br_lbl 076041073 `"Santa Izabel do Oeste, Nova Prata do Iguaçu, Salto do Lontra"', add
label define geo2_br_lbl 076041074 `"Renascença, Vitorino, Mariópolis, Clevelândia"', add
label define geo2_br_lbl 076041075 `"Nova Olímpia, Tapejara, Cidade Gaúcha, Indianópolis, São Manoel do Paraná"', add
label define geo2_br_lbl 076041076 `"Alvorada do Sul, Primeiro de Maio, Sertanópolis"', add
label define geo2_br_lbl 076041077 `"Tapira, Planaltina do Paraná, Rondon, Amaporã, Guaporema, Guairaçá, Mirador, Nova Aliança do Ivaí"', add
label define geo2_br_lbl 076041078 `"Paiçandu"', add
label define geo2_br_lbl 076041079 `"Ribeirão Claro, Carlópolis, Salto do Itararé, Santana do Itararé"', add
label define geo2_br_lbl 076041080 `"Guamiranga, Imbituva"', add
label define geo2_br_lbl 076041081 `"Quedas do Iguaçu, Espigão Alto do Iguaçu"', add
label define geo2_br_lbl 076041082 `"Itaipulândia, São Miguel do Iguaçu"', add
label define geo2_br_lbl 076041083 `"Bituruna, General Carneiro, Porto Vitória"', add
label define geo2_br_lbl 076041084 `"Realeza, Ampére"', add
label define geo2_br_lbl 076041085 `"Santa Cruz de Monte Castelo, Douradina, Maria Helena, Santa Isabel do Ivaí, Santa Mônica"', add
label define geo2_br_lbl 076041086 `"Sertaneja, Rancho Alegre, Leópolis, Santa Mariana, Itambaracá"', add
label define geo2_br_lbl 076041087 `"Jaguariaíva"', add
label define geo2_br_lbl 076041088 `"Altamira do Paraná, Nova Cantu, Laranjal, Palmital"', add
label define geo2_br_lbl 076041089 `"Santo Antônio do Caiuá, Inajá, Paranapoema, Jardim Olinda, Itaguajé, Santa Inês, Santo Inácio, Nossa Senhora das Graças, Cafeara, Guaraci"', add
label define geo2_br_lbl 076041090 `"Bandeirantes"', add
label define geo2_br_lbl 076041091 `"Capanema, Planalto"', add
label define geo2_br_lbl 076041092 `"Mandaguari"', add
label define geo2_br_lbl 076041093 `"Itapejara d'Oeste, Coronel Vivida"', add
label define geo2_br_lbl 076041094 `"Guaratuba"', add
label define geo2_br_lbl 076041095 `"Guaíra"', add
label define geo2_br_lbl 076041096 `"Rio Negro"', add
label define geo2_br_lbl 076041097 `"Ipiranga, Fernandes Pinheiro, Teixeira Soares"', add
label define geo2_br_lbl 076041098 `"Astorga, Sabáudia"', add
label define geo2_br_lbl 076041099 `"Ortigueira, Sapopema"', add
label define geo2_br_lbl 076041100 `"Mariluz, Cruzeiro do Oeste"', add
label define geo2_br_lbl 076041101 `"Matinhos"', add
label define geo2_br_lbl 076041102 `"Cruz Machado, Inácio Martins"', add
label define geo2_br_lbl 076041103 `"Tibagi, Ventania"', add
label define geo2_br_lbl 076041104 `"Sulina, Chopinzinho, Saudade do Iguaçu"', add
label define geo2_br_lbl 076041105 `"Três Barras do Paraná, Catanduvas, Ibema"', add
label define geo2_br_lbl 076041106 `"Antonina, Guaraqueçaba"', add
label define geo2_br_lbl 076041107 `"Quinta do Sol, Fênix, Itambé, Bom Sucesso, Marumbi"', add
label define geo2_br_lbl 076041108 `"Paraíso do Norte, Japurá, São Carlos do Ivaí"', add
label define geo2_br_lbl 076041109 `"Capitão Leônidas Marques, Santa Lúcia, Boa Vista da Aparecida"', add
label define geo2_br_lbl 076041110 `"Marilândia do Sul, Califórnia, Mauá da Serra"', add
label define geo2_br_lbl 076041111 `"Icaraíma, Querência do Norte, Porto Rico, São Pedro do Paraná"', add
label define geo2_br_lbl 076041112 `"Salgado Filho, Manfrinópolis, Flor da Serra do Sul, Marmeleiro"', add
label define geo2_br_lbl 076041113 `"Arapoti"', add
label define geo2_br_lbl 076041114 `"São José da Boa Vista, Sengés"', add
label define geo2_br_lbl 076041115 `"São João do Caiuá, Cruzeiro do Sul, Paranacity, Lobato"', add
label define geo2_br_lbl 076041116 `"Ribeirão do Pinhal, Santa Amélia, Abatiá"', add
label define geo2_br_lbl 076041117 `"Diamante do Norte, Itaúna do Sul, Terra Rica"', add
label define geo2_br_lbl 076041118 `"Cambará"', add
label define geo2_br_lbl 076041119 `"Engenheiro Beltrão, Ivatuba, Floresta"', add
label define geo2_br_lbl 076041120 `"Honório Serpa, Mangueirinha"', add
label define geo2_br_lbl 076041121 `"Piraí do Sul"', add
label define geo2_br_lbl 076041122 `"Terra Roxa, Francisco Alves"', add
label define geo2_br_lbl 076041123 `"Jataizinho, Uraí"', add
label define geo2_br_lbl 076041124 `"Agudos do Sul, Tijucas do Sul"', add
label define geo2_br_lbl 076041125 `"Cruzmaltina, Rio Bom, Faxinal"', add
label define geo2_br_lbl 076041126 `"Kaloré, Borrazópolis, Cambira, Novo Itacolomi"', add
label define geo2_br_lbl 076041127 `"Campo Bonito, Guaraniaçu, Diamante do Sul"', add
label define geo2_br_lbl 076041128 `"Colorado"', add
label define geo2_br_lbl 076041129 `"Terra Boa, Doutor Camargo"', add
label define geo2_br_lbl 076041130 `"Roncador, Iretama"', add
label define geo2_br_lbl 076041131 `"São Jerônimo da Serra, Santo Antônio do Paraíso, Congonhinhas"', add
label define geo2_br_lbl 076041132 `"Curiúva, Figueira"', add
label define geo2_br_lbl 076041133 `"Ubiratã"', add
label define geo2_br_lbl 076041134 `"Loanda"', add
label define geo2_br_lbl 076041135 `"São João do Triunfo, Antônio Olinto"', add
label define geo2_br_lbl 076041136 `"Tamboara, Floraí, Presidente Castelo Branco, Uniflor, Atalaia"', add
label define geo2_br_lbl 076041137 `"São Tomé, Jussara, São Jorge do Ivaí, Ourizona"', add
label define geo2_br_lbl 076041138 `"Mandaguaçu"', add
label define geo2_br_lbl 076041139 `"Jandaia do Sul"', add
label define geo2_br_lbl 076041140 `"Marilena, Nova Londrina"', add
label define geo2_br_lbl 076041141 `"Andirá"', add
label define geo2_br_lbl 076041142 `"Jundiaí do Sul, Conselheiro Mairinck, Guapirama, Tomazina"', add
label define geo2_br_lbl 076041143 `"Flórida, Ângulo, Iguaraçu, Santa Fé"', add
label define geo2_br_lbl 076042001 `"Joinville"', add
label define geo2_br_lbl 076042002 `"Florianópolis"', add
label define geo2_br_lbl 076042003 `"Blumenau"', add
label define geo2_br_lbl 076042004 `"Forquilhinha, Criciúma"', add
label define geo2_br_lbl 076042005 `"São Pedro de Alcântara, São José"', add
label define geo2_br_lbl 076042006 `"Capão Alto, Lages, Correia Pinto, Palmeira, Painel, Otacílio Costa, Bocaina do Sul, Atalanta, Petrolândia"', add
label define geo2_br_lbl 076042007 `"Nova Itaberaba, Guatambú, Chapecó, Cordilheira Alta"', add
label define geo2_br_lbl 076042008 `"Itajaí"', add
label define geo2_br_lbl 076042009 `"Jaraguá do Sul"', add
label define geo2_br_lbl 076042010 `"Palhoça"', add
label define geo2_br_lbl 076042011 `"Três Barras, Mafra, Rio Negrinho, Corupá"', add
label define geo2_br_lbl 076042012 `"Tubarão, Capivari de Baixo"', add
label define geo2_br_lbl 076042013 `"Balneário Camboriú"', add
label define geo2_br_lbl 076042014 `"Brusque"', add
label define geo2_br_lbl 076042015 `"Capinzal, Zortéa, Erval Velho, Campos Novos, Tangará, Ibiam, Abdon Batista, Vargem, Monte Carlo, Brunópolis"', add
label define geo2_br_lbl 076042016 `"Apiúna, Ascurra, Rodeio, Indaial"', add
label define geo2_br_lbl 076042017 `"Concórdia, Arabutã, Lindóia do Sul"', add
label define geo2_br_lbl 076042018 `"Araranguá, Balneário Arroio do Silva, Maracajá"', add
label define geo2_br_lbl 076042019 `"Morro da Fumaça, Içara"', add
label define geo2_br_lbl 076042020 `"Guabiruba, Gaspar"', add
label define geo2_br_lbl 076042021 `"Ipuaçu, Xanxerê, Abelardo Luz, Bom Jesus, Ouro Verde"', add
label define geo2_br_lbl 076042022 `"São Bento do Sul"', add
label define geo2_br_lbl 076042023 `"Macieira, Caçador"', add
label define geo2_br_lbl 076042024 `"Biguaçu, Governador Celso Ramos"', add
label define geo2_br_lbl 076042025 `"Matos Costa, Calmon, Irineópolis, Timbó Grande, Lebon Régis, Santa Cecília, Major Vieira, Rio do Campo"', add
label define geo2_br_lbl 076042026 `"Camboriú"', add
label define geo2_br_lbl 076042027 `"Navegantes"', add
label define geo2_br_lbl 076042028 `"Rio do Sul"', add
label define geo2_br_lbl 076042029 `"Canoinhas, Bela Vista do Toldo"', add
label define geo2_br_lbl 076042030 `"Imbituba, Garopaba"', add
label define geo2_br_lbl 076042031 `"Irati, União do Oeste, Jardinópolis, Águas Frias, Coronel Freitas, Formosa do Sul, Quilombo, Jupiá, Galvão, Santiago do Sul, Coronel Martins, São Domingos"', add
label define geo2_br_lbl 076042032 `"Laguna"', add
label define geo2_br_lbl 076042033 `"Schroeder, Guaramirim"', add
label define geo2_br_lbl 076042034 `"Iomerê, Videira"', add
label define geo2_br_lbl 076042035 `"Frei Rogério, Curitibanos, Ponte Alta do Norte, São Cristovão do Sul"', add
label define geo2_br_lbl 076042036 `"Itapema"', add
label define geo2_br_lbl 076042037 `"Paraíso, Bandeirante, São Miguel do Oeste, Barra Bonita"', add
label define geo2_br_lbl 076042038 `"Nova Veneza, Siderópolis, Treviso, Lauro Muller"', add
label define geo2_br_lbl 076042039 `"São João do Itaperiú, Balneário Piçarras, Barra Velha"', add
label define geo2_br_lbl 076042040 `"São Francisco do Sul"', add
label define geo2_br_lbl 076042041 `"Santa Rosa do Sul, Sombrio, Balneário Gaivota"', add
label define geo2_br_lbl 076042042 `"Garuva, Itapoá, Campo Alegre"', add
label define geo2_br_lbl 076042043 `"Canelinha, Tijucas"', add
label define geo2_br_lbl 076042044 `"Rio das Antas, Fraiburgo"', add
label define geo2_br_lbl 076042045 `"Braço do Norte, São Ludgero"', add
label define geo2_br_lbl 076042046 `"Jacinto Machado, Timbé do Sul, Turvo, Morro Grande, Ermo, Meleiro"', add
label define geo2_br_lbl 076042047 `"Flor do Sertão, São Miguel da Boa Vista, Maravilha, Tigrinhos, Bom Jesus do Oeste, Modelo, Serra Alta, Sul Brasil"', add
label define geo2_br_lbl 076042048 `"Ponte Alta, Mirim Doce, Taió, Witmarsum, Rio do Oeste, Dona Emma"', add
label define geo2_br_lbl 076042049 `"Massaranduba, Luiz Alves, Ilhota"', add
label define geo2_br_lbl 076042050 `"São José do Cedro, Dionísio Cerqueira, Princesa, Guarujá do Sul"', add
label define geo2_br_lbl 076042051 `"Timbó"', add
label define geo2_br_lbl 076042052 `"Urussanga, Cocal do Sul"', add
label define geo2_br_lbl 076042053 `"Santa Helena, Belmonte, Descanso, Iraceminha, Caibi, Cunha Porã"', add
label define geo2_br_lbl 076042054 `"Salete, Vitor Meireles, José Boiteux, Ibirama"', add
label define geo2_br_lbl 076042055 `"Porto União"', add
label define geo2_br_lbl 076042056 `"Pouso Redondo, Braço do Trombudo, Agrolândia, Trombudo Central"', add
label define geo2_br_lbl 076042057 `"Araquari, Balneário Barra do Sul"', add
label define geo2_br_lbl 076042058 `"Joaçaba, Luzerna"', add
label define geo2_br_lbl 076042059 `"Orleans, Pedras Grandes, Treze de Maio"', add
label define geo2_br_lbl 076042060 `"Celso Ramos, Anita Garibaldi, Cerro Negro, Campo Belo do Sul, São José do Cerrito"', add
label define geo2_br_lbl 076042061 `"Marema, Entre Rios, Xaxim, Lajeado Grande"', add
label define geo2_br_lbl 076042062 `"Porto Belo, Bombinhas"', add
label define geo2_br_lbl 076042063 `"Gravatal, Armazém, Imaruí"', add
label define geo2_br_lbl 076042064 `"Ituporanga, Chapadão do Lageado, Imbuia"', add
label define geo2_br_lbl 076042065 `"Irani, Jaborá, Vargem Bonita, Presidente Castello Branco, Catanduvas"', add
label define geo2_br_lbl 076042066 `"Palmitos, Cunhataí, São Carlos"', add
label define geo2_br_lbl 076042067 `"Santa Terezinha, Itaiópolis"', add
label define geo2_br_lbl 076042068 `"Pomerode"', add
label define geo2_br_lbl 076042069 `"Bom Retiro, Alfredo Wagner, Leoberto Leal, Anitápolis, São Bonifácio"', add
label define geo2_br_lbl 076042070 `"Jaguaruna, Sangão"', add
label define geo2_br_lbl 076042071 `"Paial, Seara, Arvoredo, Itá"', add
label define geo2_br_lbl 076042072 `"São Joaquim, Urupema"', add
label define geo2_br_lbl 076042073 `"Palma Sola, Campo Erê, Santa Terezinha do Progresso, Saltinho, São Bernardino"', add
label define geo2_br_lbl 076042074 `"Monte Castelo, Papanduva"', add
label define geo2_br_lbl 076042075 `"São João Batista"', add
label define geo2_br_lbl 076042076 `"Itapiranga, Tunápolis, São João do Oeste"', add
label define geo2_br_lbl 076042077 `"Xavantina, Faxinal dos Guedes, Ipumirim, Vargeão"', add
label define geo2_br_lbl 076042078 `"Penha"', add
label define geo2_br_lbl 076042079 `"Presidente Nereu, Vidal Ramos, Botuverá, Nova Trento"', add
label define geo2_br_lbl 076042080 `"Angelina, Major Gercino, Rancho Queimado, Águas Mornas, Antônio Carlos"', add
label define geo2_br_lbl 076042081 `"Alto Bela Vista, Peritiba, Ipira, Piratuba, Ouro, Lacerdópolis"', add
label define geo2_br_lbl 076042082 `"São Lourenço do Oeste, Novo Horizonte"', add
label define geo2_br_lbl 076042083 `"Doutor Pedrinho, Rio dos Cedros, Benedito Novo"', add
label define geo2_br_lbl 076042084 `"Iporã do Oeste, Mondaí, Riqueza"', add
label define geo2_br_lbl 076042085 `"Ponte Serrada, Passos Maia, Água Doce"', add
label define geo2_br_lbl 076042086 `"Guaraciaba, Anchieta, Romelândia"', add
label define geo2_br_lbl 076042087 `"Saudades, Águas de Chapecó, Caxambu do Sul, Planalto Alegre"', add
label define geo2_br_lbl 076042088 `"Pinhalzinho, Nova Erechim"', add
label define geo2_br_lbl 076042089 `"Herval d'Oeste"', add
label define geo2_br_lbl 076042090 `"Praia Grande, São João do Sul, Passo de Torres"', add
label define geo2_br_lbl 076042091 `"Treze Tílias, Salto Veloso, Ibicaré, Arroio Trinta, Pinheiro Preto"', add
label define geo2_br_lbl 076042092 `"Agronômica, Aurora, Lontras"', add
label define geo2_br_lbl 076042093 `"Grão Pará, Rio Fortuna, São Martinho, Paulo Lopes"', add
label define geo2_br_lbl 076042094 `"Presidente Getúlio, Laurentino"', add
label define geo2_br_lbl 076042095 `"Santo Amaro da Imperatriz"', add
label define geo2_br_lbl 076042096 `"Rio Rufino, Urubici, Bom Jardim da Serra, Santa Rosa de Lima"', add
label define geo2_br_lbl 076043001 `"Porto Alegre"', add
label define geo2_br_lbl 076043002 `"Caxias do Sul"', add
label define geo2_br_lbl 076043003 `"Carazinho, Constantina, Barra Funda, Sarandi, Nova Boa Vista, Rondinha, Tunas, Três Palmeiras, Engenho Velho, Não-Me-Toque, Lagoão, Ronda Alta, Coqueiros do Sul, Pontão, Soledade, Santo Antônio do Planalto, Victor Graeff, Mormaço, Passo Fundo, "', add
label define geo2_br_lbl 076043004 `"Capão do Leão, Morro Redondo, Turuçu, Pelotas, Arroio do Padre"', add
label define geo2_br_lbl 076043005 `"Nova Santa Rita, Canoas"', add
label define geo2_br_lbl 076043006 `"Dilermando de Aguiar, Santa Maria, São Martinho da Serra, Itaara, Silveira Martins"', add
label define geo2_br_lbl 076043007 `"Gravataí, Glorinha"', add
label define geo2_br_lbl 076043008 `"São Jerônimo, Barão do Triunfo, Cerro Grande do Sul, Arroio dos Ratos, Sertão Santana, Sentinela do Sul, Eldorado do Sul, Charqueadas, Mariana Pimentel, Tapes, Guaíba, Barra do Ribeiro"', add
label define geo2_br_lbl 076043009 `"Viamão"', add
label define geo2_br_lbl 076043010 `"Novo Hamburgo"', add
label define geo2_br_lbl 076043011 `"São Leopoldo"', add
label define geo2_br_lbl 076043012 `"Alvorada"', add
label define geo2_br_lbl 076043013 `"Rio Grande"', add
label define geo2_br_lbl 076043014 `"Unistalda, Santiago, São Miguel das Missões, Guarani das Missões, Vitória das Missões, Sete de Setembro, Santo Ângelo, Entre-Ijuís, Eugênio de Castro, Capão do Cipó"', add
label define geo2_br_lbl 076043015 `"Coronel Barros, Augusto Pestana, Ijuí, Cruz Alta, Fortaleza dos Valos, Boa Vista do Cadeado, Boa Vista do Incra, Bozano"', add
label define geo2_br_lbl 076043016 `"Palmares do Sul, Capivari do Sul, Osório, Maquiné, Itati, Imbé, Xangri-lá, Capão da Canoa, Terra de Areia"', add
label define geo2_br_lbl 076043017 `"Vale do Sol, Herveiras, Sinimbu, Gramado Xavier, Santa Cruz do Sul"', add
label define geo2_br_lbl 076043018 `"Bagé, Hulha Negra, Candiota, Aceguá"', add
label define geo2_br_lbl 076043019 `"Sapucaia do Sul"', add
label define geo2_br_lbl 076043020 `"Barra do Quaraí, Uruguaiana"', add
label define geo2_br_lbl 076043021 `"Cachoeirinha"', add
label define geo2_br_lbl 076043022 `"Jacutinga, Erechim, Ponte Preta, Barão de Cotegipe, Três Arroios, Quatro Irmãos, Paulo Bento"', add
label define geo2_br_lbl 076043023 `"Santa Tereza, Monte Belo do Sul, Bento Gonçalves"', add
label define geo2_br_lbl 076043024 `"Taquara, Parobé"', add
label define geo2_br_lbl 076043025 `"Boqueirão do Leão, Progresso, Sério, Forquetinha, Marques de Souza, Santa Clara do Sul, Canudos do Vale, Lajeado"', add
label define geo2_br_lbl 076043026 `"Cachoeira do Sul, Paraíso do Sul, Novo Cabrais, Cerro Branco"', add
label define geo2_br_lbl 076043027 `"Sapiranga, Araricá, Nova Hartz"', add
label define geo2_br_lbl 076043028 `"Dom Feliciano, Cristal, Camaquã, Chuvisca, Arambaré"', add
label define geo2_br_lbl 076043029 `"Poço das Antas, Brochier, Montenegro, Salvador do Sul, Barão, Maratá, São Pedro da Serra, Pareci Novo, São José do Sul"', add
label define geo2_br_lbl 076043030 `"Sertão, Vila Lângaro, Água Santa, Tapejara, Charrua, Ciríaco, Ibiaçá, Caseiros, Muliterno, Ibiraiaras, Lagoa Vermelha, André da Rocha, Capão Bonito do Sul, Santa Cecília do Sul"', add
label define geo2_br_lbl 076043031 `"Sant'Ana do Livramento"', add
label define geo2_br_lbl 076043032 `"Esteio"', add
label define geo2_br_lbl 076043033 `"Alegrete"', add
label define geo2_br_lbl 076043034 `"Ipê, Muitos Capões, Campestre da Serra, Vacaria, Monte Alegre dos Campos"', add
label define geo2_br_lbl 076043035 `"Coronel Bicaco, Erval Seco, Palmeira das Missões, Dois Irmãos das Missões, Boa Vista das Missões, Jaboticaba, Pinhal, Lajeado do Bugre, Cerro Grande, Novo Barreiro, São José das Missões, Sagrada Família, São Pedro das Missões"', add
label define geo2_br_lbl 076043036 `"Venâncio Aires, Mato Leitão"', add
label define geo2_br_lbl 076043037 `"Santa Rosa"', add
label define geo2_br_lbl 076043038 `"Pedro Osório, Canguçu, Cerrito"', add
label define geo2_br_lbl 076043039 `"São Borja, Garruchos, Itacurubi"', add
label define geo2_br_lbl 076043040 `"Estrela, Colinas, Teutônia, Imigrante, Westfalia"', add
label define geo2_br_lbl 076043041 `"Balneário Pinhal, Cidreira, Tramandaí"', add
label define geo2_br_lbl 076043042 `"Rio Pardo, Pantano Grande, Passo do Sobrado, Vale Verde, General Câmara"', add
label define geo2_br_lbl 076043043 `"Três Forquilhas, Mampituba, Três Cachoeiras, Morrinhos do Sul, Arroio do Sal, Torres, Dom Pedro de Alcântara"', add
label define geo2_br_lbl 076043044 `"São Gabriel, Santa Margarida do Sul"', add
label define geo2_br_lbl 076043045 `"Farroupilha"', add
label define geo2_br_lbl 076043046 `"Nicolau Vergueiro, Marau, Arvorezinha, Itapuca, Camargo, Nova Alvorada, Vila Maria, Gentil"', add
label define geo2_br_lbl 076043047 `"Campo Bom"', add
label define geo2_br_lbl 076043048 `"Pirapó, Roque Gonzales, São Luiz Gonzaga, Dezesseis de Novembro, Caibaté, Mato Queimado, Rolador"', add
label define geo2_br_lbl 076043049 `"Estrela Velha, Ibarama, Arroio do Tigre, Sobradinho, Segredo, Passa Sete, Lagoa Bonita do Sul"', add
label define geo2_br_lbl 076043050 `"Tupandi, Harmonia, Bom Princípio, São Vendelino, São Sebastião do Caí, São José do Hortêncio"', add
label define geo2_br_lbl 076043051 `"Vista Alegre do Prata, São Jorge, Guabiju, Nova Prata, Protásio Alves, Nova Roma do Sul, Antônio Prado"', add
label define geo2_br_lbl 076043052 `"Santo Antônio da Patrulha, Caraá"', add
label define geo2_br_lbl 076043053 `"Dom Pedrito, Lavras do Sul"', add
label define geo2_br_lbl 076043054 `"Ipiranga do Sul, Erebango, Estação, Getúlio Vargas, Floriano Peixoto, Sananduva"', add
label define geo2_br_lbl 076043055 `"Estância Velha"', add
label define geo2_br_lbl 076043056 `"São Valério do Sul, Campo Novo, Bom Progresso, Santo Augusto, Miraguaí, Braga, Redentora"', add
label define geo2_br_lbl 076043057 `"Capela de Santana, Portão"', add
label define geo2_br_lbl 076043058 `"Itaqui, Maçambará"', add
label define geo2_br_lbl 076043059 `"São José do Norte, Tavares, Mostardas"', add
label define geo2_br_lbl 076043060 `"São Lourenço do Sul"', add
label define geo2_br_lbl 076043061 `"Nova Esperança do Sul, Jaguari, Mata, São Pedro do Sul, Toropi"', add
label define geo2_br_lbl 076043062 `"Ibirubá, Quinze de Novembro, Selbach, Tapera, Lagoa dos Três Cantos"', add
label define geo2_br_lbl 076043063 `"Herval, Pinheiro Machado, Arroio Grande, Pedras Altas"', add
label define geo2_br_lbl 076043064 `"Canela"', add
label define geo2_br_lbl 076043065 `"Rosário do Sul"', add
label define geo2_br_lbl 076043066 `"Dois Irmãos, Morro Reuter, Santa Maria do Herval"', add
label define geo2_br_lbl 076043067 `"União da Serra, Guaporé, Dois Lajeados, Nova Bassano, São Valentim do Sul"', add
label define geo2_br_lbl 076043068 `"Três de Maio, Nova Candelária, São José do Inhacorá, Boa Vista do Buricá, Alegria"', add
label define geo2_br_lbl 076043069 `"Taquari, Paverama, Tabaí"', add
label define geo2_br_lbl 076043070 `"Ubiretama, Senador Salgado Filho, Giruá, Independência, Catuípe"', add
label define geo2_br_lbl 076043071 `"Alpestre, Liberato Salzano, Nonoai, Trindade do Sul, Gramado dos Loureiros, Rio dos Índios"', add
label define geo2_br_lbl 076043072 `"Panambi"', add
label define geo2_br_lbl 076043073 `"Santa Vitória do Palmar, Chuí"', add
label define geo2_br_lbl 076043074 `"Porto Xavier, São Paulo das Missões, São Pedro do Butiá, Salvador das Missões, Cerro Largo"', add
label define geo2_br_lbl 076043075 `"Quevedos, Júlio de Castilhos, Ivorá, Nova Palma, Pinhal Grande"', add
label define geo2_br_lbl 076043076 `"Garibaldi, Boa Vista do Sul, Coronel Pilar"', add
label define geo2_br_lbl 076043077 `"Caçapava do Sul"', add
label define geo2_br_lbl 076043078 `"Salto do Jacuí, Campos Borges, Alto Alegre, Espumoso, Jacuizinho"', add
label define geo2_br_lbl 076043079 `"Vista Alegre, Taquaruçu do Sul, Frederico Westphalen"', add
label define geo2_br_lbl 076043080 `"Barros Cassal, Fontoura Xavier, São José do Herval, Pouso Novo, Putinga, Coqueiro Baixo, Nova Bréscia"', add
label define geo2_br_lbl 076043081 `"Porto Lucena, Porto Vera Cruz, Campina das Missões, Santo Cristo, Cândido Godói"', add
label define geo2_br_lbl 076043082 `"Tiradentes do Sul, Esperança do Sul, Três Passos"', add
label define geo2_br_lbl 076043083 `"Jari, Tupanciretã, Jóia"', add
label define geo2_br_lbl 076043084 `"Gramado"', add
label define geo2_br_lbl 076043085 `"Fagundes Varela, Cotiporã, Veranópolis, Vila Flores"', add
label define geo2_br_lbl 076043086 `"Igrejinha"', add
label define geo2_br_lbl 076043087 `"Gaurama, Áurea, Centenário, São João da Urtiga, Maximiliano de Almeida, Paim Filho, Cacique Doble"', add
label define geo2_br_lbl 076043088 `"Encruzilhada do Sul, Amaral Ferrador"', add
label define geo2_br_lbl 076043089 `"Candelária"', add
label define geo2_br_lbl 076043090 `"Faxinal do Soturno, São João do Polêsine, Dona Francisca, Agudo"', add
label define geo2_br_lbl 076043091 `"Entre Rios do Sul, Campinas do Sul, Faxinalzinho, Benjamin Constant do Sul, Erval Grande, São Valentim, Itatiba do Sul, Cruzaltense"', add
label define geo2_br_lbl 076043092 `"Nova Pádua, Flores da Cunha"', add
label define geo2_br_lbl 076043093 `"Pejuçara, Santa Bárbara do Sul, Chapada, Saldanha Marinho, Colorado"', add
label define geo2_br_lbl 076043094 `"Santana da Boa Vista, Piratini"', add
label define geo2_br_lbl 076043095 `"Butiá, Minas do Leão"', add
label define geo2_br_lbl 076043096 `"Vila Nova do Sul, São Sepé"', add
label define geo2_br_lbl 076043097 `"Jaguarão"', add
label define geo2_br_lbl 076043098 `"Machadinho, Santo Expedito do Sul, São José do Ouro, Tupanci do Sul, Barracão, Esmeralda, Pinhal da Serra"', add
label define geo2_br_lbl 076043099 `"Ilópolis, Anta Gorda, Vespasiano Correa, Roca Sales, Muçum"', add
label define geo2_br_lbl 076043100 `"Alecrim, Porto Mauá, Tuparendi, Novo Machado, Tucunduva"', add
label define geo2_br_lbl 076043101 `"Cruzeiro do Sul, Bom Retiro do Sul, Fazenda Vilanova"', add
label define geo2_br_lbl 076043102 `"Crissiumal, Humaitá, São Martinho, Sede Nova"', add
label define geo2_br_lbl 076043103 `"Barra do Rio Azul, Aratiba, Mariano Moro, Severiano de Almeida, Viadutos, Marcelino Ramos, Carlos Gomes"', add
label define geo2_br_lbl 076043104 `"Lindolfo Collor, Presidente Lucena, Ivoti"', add
label define geo2_br_lbl 076043105 `"Manoel Viana, São Francisco de Assis"', add
label define geo2_br_lbl 076043106 `"Montauri, Serafina Corrêa, Paraí, Nova Araçá"', add
label define geo2_br_lbl 076043107 `"Triunfo"', add
label define geo2_br_lbl 076043108 `"Iraí, Ametista do Sul, Planalto"', add
label define geo2_br_lbl 076043109 `"São Francisco de Paula, Jaquirana"', add
label define geo2_br_lbl 076043110 `"Carlos Barbosa"', add
label define geo2_br_lbl 076043111 `"Vera Cruz"', add
label define geo2_br_lbl 076043112 `"Relvado, Doutor Ricardo, Encantado"', add
label define geo2_br_lbl 076043113 `"Rolante, Riozinho"', add
label define geo2_br_lbl 076043114 `"Nova Petrópolis, Picada Café"', add
label define geo2_br_lbl 076043115 `"Três Coroas"', add
label define geo2_br_lbl 076043116 `"Santo Antônio das Missões, São Nicolau, Bossoroca"', add
label define geo2_br_lbl 076043117 `"Doutor Maurício Cardoso, Horizontina"', add
label define geo2_br_lbl 076043118 `"Derrubadas, Tenente Portela, Barra do Guarita, Vista Gaúcha"', add
label define geo2_br_lbl 076043119 `"Travesseiro, Arroio do Meio, Capitão"', add
label define geo2_br_lbl 076043120 `"Inhacorá, Chiapetta, Ajuricaba, Nova Ramada, Condor"', add
label define geo2_br_lbl 076043121 `"Alto Feliz, Feliz, Vale Real, Linha Nova"', add
label define geo2_br_lbl 076043122 `"Cacequi, São Vicente do Sul"', add
label define geo2_br_lbl 076043123 `"Formigueiro, Restinga Seca"', add
label define geo2_br_lbl 076043124 `"Quaraí"', add
label define geo2_br_lbl 076043125 `"Pinheirinho do Vale, Palmitinho, Caiçara, Vicente Dutra"', add
label define geo2_br_lbl 076043126 `"Seberi, Cristal do Sul, Rodeio Bonito, Novo Tiradentes"', add
label define geo2_br_lbl 076043127 `"Bom Jesus, Cambará do Sul, São José dos Ausentes"', add
label define geo2_br_lbl 076043128 `"São Marcos"', add
label define geo2_br_lbl 076043129 `"Casca, Santo Antônio do Palma, São Domingos do Sul, Vanini, David Canabarro"', add
label define geo2_br_lbl 076051024 `"Campo Grande"', add
label define geo2_br_lbl 076051025 `"Dourados, Douradina"', add
label define geo2_br_lbl 076051026 `"Corumbá, Ladário"', add
label define geo2_br_lbl 076051027 `"Terenos, Sidrolândia, Rio Brilhante, Nova Alvorada do Sul, Angélica"', add
label define geo2_br_lbl 076051028 `"Três Lagoas, Selvíria"', add
label define geo2_br_lbl 076051029 `"Antônio João, Ponta Porã, Laguna Carapã"', add
label define geo2_br_lbl 076051030 `"Aral Moreira, Coronel Sapucaia, Paranhos, Amambai, Sete Quedas, Tacuru"', add
label define geo2_br_lbl 076051031 `"Nova Andradina, Bataguassu"', add
label define geo2_br_lbl 076051032 `"Coxim, Sonora, Pedro Gomes, Alcinópolis"', add
label define geo2_br_lbl 076051033 `"São Gabriel do Oeste, Camapuã, Costa Rica, Figueirão"', add
label define geo2_br_lbl 076051034 `"Aquidauana, Dois Irmãos do Buriti"', add
label define geo2_br_lbl 076051035 `"Naviraí"', add
label define geo2_br_lbl 076051036 `"Iguatemi, Eldorado, Itaquiraí"', add
label define geo2_br_lbl 076051037 `"Água Clara, Santa Rita do Pardo, Brasilândia, Inocência"', add
label define geo2_br_lbl 076051038 `"Chapadão do Sul, Cassilândia"', add
label define geo2_br_lbl 076051039 `"Paranaíba"', add
label define geo2_br_lbl 076051040 `"Maracaju"', add
label define geo2_br_lbl 076051041 `"Jardim, Guia Lopes da Laguna"', add
label define geo2_br_lbl 076051042 `"Bonito, Nioaque"', add
label define geo2_br_lbl 076051043 `"Miranda, Bodoquena"', add
label define geo2_br_lbl 076051044 `"Caarapó, Juti"', add
label define geo2_br_lbl 076051045 `"Ivinhema, Novo Horizonte do Sul"', add
label define geo2_br_lbl 076051046 `"Jateí, Taquarussu, Batayporã, Anaurilândia"', add
label define geo2_br_lbl 076051047 `"Fátima do Sul, Vicentina"', add
label define geo2_br_lbl 076051048 `"Japorã, Mundo Novo"', add
label define geo2_br_lbl 076051049 `"Anastácio"', add
label define geo2_br_lbl 076051050 `"Rio Verde de Mato Grosso, Rio Negro"', add
label define geo2_br_lbl 076051051 `"Bela Vista"', add
label define geo2_br_lbl 076051052 `"Corguinho, Rochedo, Jaraguari, Bandeirantes"', add
label define geo2_br_lbl 076051053 `"Glória de Dourados, Deodápolis"', add
label define geo2_br_lbl 076051054 `"Aparecida do Taboado"', add
label define geo2_br_lbl 076051055 `"Ribas do Rio Pardo"', add
label define geo2_br_lbl 076051056 `"Itaporã"', add
label define geo2_br_lbl 076051057 `"Porto Murtinho, Caracol"', add
label define geo2_br_lbl 076051001 `"Cuiabá"', add
label define geo2_br_lbl 076051002 `"Sapezal, Brasnorte, Campo Novo do Parecis, Diamantino, Nossa Senhora do Livramento, Tapurah, Rosário Oeste, Nova Mutum, Lucas do Rio Verde, Nobres, Sorriso, Sinop, Vera, Cláudia, Nova Ubiratã, Santa Carmem, Feliz Natal, Marcelândia, União do Su"', add
label define geo2_br_lbl 076051003 `"Aripuanã, Juína, Cotriguaçu, Castanheira, Juruena, Nova Bandeirantes, Apiacás, Juara, Nova Maringá, Nova Monte Verde, Novo Horizonte do Norte, Porto dos Gaúchos, São José do Rio Claro, Tabaporã, Paranaíta, Alta Floresta, Nova Canaã do Norte, It"', add
label define geo2_br_lbl 076051004 `"Várzea Grande"', add
label define geo2_br_lbl 076051005 `"Porto Esperidião, Figueirópolis D'Oeste, Barra do Bugres, Cáceres, Glória D'Oeste, Reserva do Cabaçal, Salto do Céu, Mirassol d'Oeste, Rio Branco, Lambari D'Oeste, Nova Olímpia, Porto Estrela, Denise, Curvelândia"', add
label define geo2_br_lbl 076051006 `"Rondonópolis, São José do Povo"', add
label define geo2_br_lbl 076051007 `"Novo São Joaquim, General Carneiro, Tesouro, Querência, São Félix do Araguaia, Barra do Garças, Torixoréu, São José do Xingu, Canarana, Pontal do Araguaia, Alto Boa Vista, Canabrava do Norte, Porto Alegre do Norte, Ribeirão Cascalheira, Araguai"', add
label define geo2_br_lbl 076051008 `"Comodoro, Vila Bela da Santíssima Trindade, Nova Lacerda, Pontes e Lacerda, Campos de Júlio, Jauru, Conquista D'Oeste, Vale de São Domingos"', add
label define geo2_br_lbl 076051009 `"Campo Verde, Primavera do Leste, Poxoréo"', add
label define geo2_br_lbl 076051010 `"Tangará da Serra"', add
label define geo2_br_lbl 076051011 `"Vila Rica, Confresa, Santa Terezinha"', add
label define geo2_br_lbl 076051012 `"Pedra Preta, Guiratinga, Alto Garças, Araguainha, Ponte Branca, Ribeirãozinho"', add
label define geo2_br_lbl 076051013 `"Barão de Melgaço, Santo Antônio do Leverger, Itiquira"', add
label define geo2_br_lbl 076051014 `"Araputanga, Indiavaí, São José dos Quatro Marcos"', add
label define geo2_br_lbl 076051015 `"Nova Marilândia, Santo Afonso, Alto Paraguai, Arenápolis, Nortelândia"', add
label define geo2_br_lbl 076051016 `"Nova Brasilândia, Paranatinga, Planalto da Serra, Gaúcha do Norte"', add
label define geo2_br_lbl 076051017 `"Campinápolis, Nova Xavantina"', add
label define geo2_br_lbl 076051018 `"Poconé"', add
label define geo2_br_lbl 076051019 `"Jangada, Acorizal, Chapada dos Guimarães"', add
label define geo2_br_lbl 076051020 `"Jaciara"', add
label define geo2_br_lbl 076051021 `"Água Boa, Nova Nazaré"', add
label define geo2_br_lbl 076051022 `"Juscimeira, Dom Aquino, São Pedro da Cipa"', add
label define geo2_br_lbl 076051023 `"Alto Araguaia, Alto Taquari"', add
label define geo2_br_lbl 076052001 `"Goiânia, Senador Canedo"', add
label define geo2_br_lbl 076052002 `"Santo Antônio do Descoberto, Águas Lindas de Goiás, Luziânia, Novo Gama, Valparaíso de Goiás, Cidade Ocidental"', add
label define geo2_br_lbl 076052003 `"Aparecida de Goiânia"', add
label define geo2_br_lbl 076052004 `"Anápolis, Campo Limpo de Goiás"', add
label define geo2_br_lbl 076052005 `"Porto Nacional, Ipueiras, Palmas, Lajeado, Silvanópolis, Aparecida do Rio Negro"', add
label define geo2_br_lbl 076052006 `"Rio Verde, Montividiu, Santo Antônio da Barra, Castelândia"', add
label define geo2_br_lbl 076052007 `"Araguaína, Santa Fé do Araguaia, Muricilândia, Aragominas, Araguanã, Carmolândia"', add
label define geo2_br_lbl 076052008 `"Esperantina, Araguatins, São Bento do Tocantins, Darcinópolis, Cachoeirinha, Luzinópolis, Palmeiras do Tocantins, Axixá do Tocantins, Praia Norte, Sítio Novo do Tocantins, Maurilândia do Tocantins, Itaguatins, São Miguel do Tocantins, Tocantinó"', add
label define geo2_br_lbl 076052009 `"Formoso do Araguaia, Dueré, Crixás do Tocantins, Cariri do Tocantins, Aliança do Tocantins, Gurupi, Nova Rosalândia, Fátima, Oliveira de Fátima, Brejinho de Nazaré"', add
label define geo2_br_lbl 076052010 `"Formosa, Vila Boa, Cabeceiras"', add
label define geo2_br_lbl 076052011 `"Trindade, Abadia de Goiás"', add
label define geo2_br_lbl 076052012 `"Inaciolândia, Itumbiara, Cachoeira Dourada"', add
label define geo2_br_lbl 076052013 `"Catalão, Três Ranchos, Ouvidor, Davinópolis"', add
label define geo2_br_lbl 076052014 `"Perolândia, Jataí, Aparecida do Rio Doce"', add
label define geo2_br_lbl 076052015 `"Planaltina, Água Fria de Goiás"', add
label define geo2_br_lbl 076052016 `"Itaberaí, Avelinópolis, Araçu, Itauçu, Uruana, Caturaí, Itaguaru, Itaguari, Taquaral de Goiás, Rianápolis"', add
label define geo2_br_lbl 076052017 `"Bela Vista de Goiás, Caldazinha, Abadiânia, Silvânia, São Miguel do Passa Quatro, Cristianópolis, Vianópolis, Gameleira de Goiás"', add
label define geo2_br_lbl 076052018 `"Caldas Novas, Rio Quente"', add
label define geo2_br_lbl 076052019 `"Corumbaíba, Água Limpa, Marzagão, Ipameri, Orizona, Nova Aurora, Urutaí, Cumari, Anhanguera, Goiandira, Campo Alegre de Goiás"', add
label define geo2_br_lbl 076052020 `"Santa Rita do Araguaia, Mineiros, Portelândia"', add
label define geo2_br_lbl 076052021 `"Amaralina, Santa Terezinha de Goiás, Mara Rosa, Campos Verdes, Alto Horizonte, Mutunópolis, Nova Iguaçu de Goiás, Estrela do Norte, Santa Tereza de Goiás, Formoso, Trombas, Montividiu do Norte"', add
label define geo2_br_lbl 076052022 `"Goianésia"', add
label define geo2_br_lbl 076052023 `"Bernardo Sayão, Pequizeiro, Colméia, Miranorte, Fortaleza do Tabocão, Guaraí, Tupirama"', add
label define geo2_br_lbl 076052024 `"Mozarlândia, Araguapaz, Novo Brasil, Faina, Goiás"', add
label define geo2_br_lbl 076052025 `"Divinópolis do Tocantins, Monte Santo do Tocantins, Barrolândia, Miracema do Tocantins, Rio dos Bois, Pedro Afonso, Bom Jesus do Tocantins, Santa Maria do Tocantins"', add
label define geo2_br_lbl 076052026 `"Joviânia, Aloândia, Morrinhos"', add
label define geo2_br_lbl 076052027 `"Uruaçu, Campinorte, Campinaçu"', add
label define geo2_br_lbl 076052028 `"Hidrolândia, Professor Jamil, Piracanjuba, Santa Cruz de Goiás"', add
label define geo2_br_lbl 076052029 `"Jaraguá, Santa Rosa de Goiás, Santa Isabel"', add
label define geo2_br_lbl 076052030 `"Santa Helena de Goiás, Maurilândia"', add
label define geo2_br_lbl 076052031 `"Inhumas"', add
label define geo2_br_lbl 076052032 `"Quirinópolis, Gouvelândia"', add
label define geo2_br_lbl 076052033 `"Porteirão, Goiatuba, Panamá, Buriti Alegre"', add
label define geo2_br_lbl 076052034 `"Bonópolis, Porangatu"', add
label define geo2_br_lbl 076052035 `"Paraíso do Tocantins, Pugmil"', add
label define geo2_br_lbl 076052036 `"Niquelândia, Mimoso de Goiás"', add
label define geo2_br_lbl 076052037 `"Cristalina"', add
label define geo2_br_lbl 076052038 `"Itapuranga, Guaraíta, Heitoraí, São Patrício, Carmo do Rio Verde"', add
label define geo2_br_lbl 076052039 `"Araguaçu, Sandolândia, Figueirópolis, Talismã, Alvorada, Peixe, Sucupira, Jaú do Tocantins"', add
label define geo2_br_lbl 076052040 `"Hidrolina, Pirenópolis, Santa Rita do Novo Destino, Vila Propício, Barro Alto"', add
label define geo2_br_lbl 076052041 `"Nova Crixás, Mundo Novo, Crixás, Uirapuru, Nova América, Guarinos, Pilar de Goiás"', add
label define geo2_br_lbl 076052042 `"Ipiranga de Goiás, Nova Glória, Rialma, Ceres"', add
label define geo2_br_lbl 076052043 `"São Luís de Montes Belos, Firminópolis"', add
label define geo2_br_lbl 076052044 `"Arraias, Novo Alegre, Combinado, Monte Alegre de Goiás, São Domingos, Guarani de Goiás"', add
label define geo2_br_lbl 076052045 `"Acreúna, Turvelândia, Edéia, Edealina"', add
label define geo2_br_lbl 076052046 `"Goianira, Santo Antônio de Goiás"', add
label define geo2_br_lbl 076052047 `"Anicuns, Americano do Brasil, Nazário, Santa Bárbara de Goiás"', add
label define geo2_br_lbl 076052048 `"São Sebastião do Tocantins, Buriti do Tocantins, Carrasco Bonito, Augustinópolis, Sampaio"', add
label define geo2_br_lbl 076052049 `"Posse, Simolândia"', add
label define geo2_br_lbl 076052050 `"Xambioá, Piraquê, Ananás, Riachinho, Angico, Nazaré, Santa Terezinha do Tocantins"', add
label define geo2_br_lbl 076052051 `"Caseara, Marianópolis do Tocantins, Araguacema, Abreulândia, Couto Magalhães, Dois Irmãos do Tocantins, Goianorte, Juarina"', add
label define geo2_br_lbl 076052052 `"São Valério, Santa Rosa do Tocantins, Chapada da Natividade, Natividade, Pindorama do Tocantins, Almas, Porto Alegre do Tocantins"', add
label define geo2_br_lbl 076052053 `"Jussara, Santa Fé de Goiás, Fazenda Nova, Jaupaci, Israelândia"', add
label define geo2_br_lbl 076052054 `"Jesúpolis, Petrolina de Goiás, Brazabrantes, Damolândia, São Francisco de Goiás, Nova Veneza, Ouro Verde de Goiás"', add
label define geo2_br_lbl 076052055 `"Palmeiras de Goiás, Cezarina, Campestre de Goiás"', add
label define geo2_br_lbl 076052056 `"Iaciara, Alvorada do Norte, Buritinópolis, Damianópolis, Mambaí"', add
label define geo2_br_lbl 076052057 `"Tocantínia, Itapiratins, Itacajá, Rio Sono, Centenário, Recursolândia, Lizarda"', add
label define geo2_br_lbl 076052058 `"Vicentinópolis, Pontalina, Varjão, Mairipotaba, Cromínia"', add
label define geo2_br_lbl 076052059 `"Palmeirópolis, São Salvador do Tocantins, Paranã, Conceição do Tocantins, Taipas do Tocantins, Ponte Alta do Bom Jesus, Novo Jardim"', add
label define geo2_br_lbl 076052060 `"Goianápolis, Terezópolis de Goiás, Bonfinópolis, Leopoldo de Bulhões"', add
label define geo2_br_lbl 076052061 `"Doverlândia, Baliza, Caiapônia, Palestina de Goiás"', add
label define geo2_br_lbl 076052062 `"Minaçu"', add
label define geo2_br_lbl 076052063 `"Pires do Rio, Palmelo"', add
label define geo2_br_lbl 076052064 `"Iporá"', add
label define geo2_br_lbl 076052065 `"Chapadão do Céu, Serranópolis, Aporé, Itarumã, Itajá, Lagoa Santa"', add
label define geo2_br_lbl 076052066 `"Colinas do Tocantins"', add
label define geo2_br_lbl 076052067 `"Jandaia, Palminópolis, Turvânia, Indiara"', add
label define geo2_br_lbl 076052068 `"Corumbá de Goiás, Cocalzinho de Goiás"', add
label define geo2_br_lbl 076052069 `"Padre Bernardo"', add
label define geo2_br_lbl 076052070 `"Lagoa da Confusão, Pium, Santa Rita do Tocantins, Cristalândia, Chapada de Areia"', add
label define geo2_br_lbl 076052071 `"Monte do Carmo, Santa Tereza do Tocantins, Novo Acordo, Ponte Alta do Tocantins, Lagoa do Tocantins, São Félix do Tocantins, Mateiros"', add
label define geo2_br_lbl 076052072 `"Aragarças, Bom Jardim de Goiás"', add
label define geo2_br_lbl 076052073 `"Colinas do Sul, Cavalcante, Alto Paraíso de Goiás, Teresina de Goiás, Nova Roma"', add
label define geo2_br_lbl 076052074 `"Paranaiguara, São Simão"', add
label define geo2_br_lbl 076052075 `"São Miguel do Araguaia, Novo Planalto"', add
label define geo2_br_lbl 076052076 `"Arapoema, Pau D'Arco, Itaporã do Tocantins, Bandeirantes do Tocantins, Presidente Kennedy, Brasilândia do Tocantins, Tupiratins"', add
label define geo2_br_lbl 076052077 `"Britânia, Aruanã, Itapirapuã, Matrinchã"', add
label define geo2_br_lbl 076052078 `"São João d'Aliança, Flores de Goiás, Sítio d'Abadia"', add
label define geo2_br_lbl 076052079 `"Piranhas, Montes Claros de Goiás, Arenópolis, Diorama"', add
label define geo2_br_lbl 076052080 `"Nerópolis"', add
label define geo2_br_lbl 076052081 `"Alexânia"', add
label define geo2_br_lbl 076052082 `"Nova Olinda, Palmeirante, Filadélfia"', add
label define geo2_br_lbl 076052083 `"Córrego do Ouro, Aurilândia, Buriti de Goiás, Sanclerlândia, Mossâmedes, Adelândia"', add
label define geo2_br_lbl 076052084 `"Goiatins, Barra do Ouro, Campos Lindos"', add
label define geo2_br_lbl 076052085 `"Caçu, Cachoeira Alta"', add
label define geo2_br_lbl 076052086 `"Campos Belos, Divinópolis de Goiás"', add
label define geo2_br_lbl 076052087 `"Itapaci, São Luíz do Norte"', add
label define geo2_br_lbl 076052088 `"Ivolândia, Amorinópolis, Paraúna, Moiporá, Cachoeira de Goiás, São João da Paraúna"', add
label define geo2_br_lbl 076052089 `"Guapó, Aragoiânia"', add
label define geo2_br_lbl 076052090 `"Wanderlândia, Babaçulândia"', add
label define geo2_br_lbl 076052091 `"Morro Agudo de Goiás, Rubiataba"', add
label define geo2_br_lbl 076052092 `"Dianópolis, Rio da Conceição"', add
label define geo2_br_lbl 076052093 `"Bom Jesus de Goiás"', add
label define geo2_br_lbl 076052094 `"Taguatinga, Aurora do Tocantins, Lavandeira"', add
label define geo2_br_lbl 076053001 `"Brasília"', add
label values geo2_br geo2_br_lbl

label define regnbr_lbl 1 `"North"'
label define regnbr_lbl 2 `"Northeast"', add
label define regnbr_lbl 3 `"Southeast"', add
label define regnbr_lbl 4 `"South"', add
label define regnbr_lbl 5 `"Midwest"', add
label values regnbr regnbr_lbl

label define mesobr_lbl 1101 `"Madeira-Guaporé"'
label define mesobr_lbl 1102 `"Leste Rondoniense"', add
label define mesobr_lbl 1199 `"Rondonia - Mesoregion unknown"', add
label define mesobr_lbl 1201 `"Vale do Juruá"', add
label define mesobr_lbl 1202 `"Vale do Acre"', add
label define mesobr_lbl 1301 `"Norte Amazonense"', add
label define mesobr_lbl 1302 `"Sudoeste Amazonense"', add
label define mesobr_lbl 1303 `"Centro Amazonense"', add
label define mesobr_lbl 1304 `"Sul Amazonense"', add
label define mesobr_lbl 1399 `"Amazonas - Mesoregion unknown"', add
label define mesobr_lbl 1401 `"Norte de Roraima"', add
label define mesobr_lbl 1402 `"Sul de Roraima"', add
label define mesobr_lbl 1501 `"Baixo Amazonas"', add
label define mesobr_lbl 1502 `"Marajó"', add
label define mesobr_lbl 1503 `"Metropolitana de Belém"', add
label define mesobr_lbl 1504 `"Nordeste Paraense"', add
label define mesobr_lbl 1505 `"Sudoeste Paraense"', add
label define mesobr_lbl 1506 `"Sudeste Paraense"', add
label define mesobr_lbl 1599 `"Pará - Mesoregion unknown"', add
label define mesobr_lbl 1601 `"Norte do Amapá"', add
label define mesobr_lbl 1602 `"Sul do Amapá"', add
label define mesobr_lbl 1699 `"Amapa - Mesoregion unknown"', add
label define mesobr_lbl 1701 `"Ocidental do Tocantins"', add
label define mesobr_lbl 1702 `"Oriental do Tocantins"', add
label define mesobr_lbl 1799 `"Tocantins - Mesoregion unknown"', add
label define mesobr_lbl 2101 `"Norte Maranhense"', add
label define mesobr_lbl 2102 `"Oeste Maranhense"', add
label define mesobr_lbl 2103 `"Centro Maranhense"', add
label define mesobr_lbl 2104 `"Leste Maranhense"', add
label define mesobr_lbl 2105 `"Sul Maranhense"', add
label define mesobr_lbl 2199 `"Maranhao - Mesoregion unknown"', add
label define mesobr_lbl 2201 `"Norte Piauiense"', add
label define mesobr_lbl 2202 `"Centro-Norte Piauiense"', add
label define mesobr_lbl 2203 `"Sudoeste Piauiense"', add
label define mesobr_lbl 2204 `"Sudeste Piauiense"', add
label define mesobr_lbl 2299 `"Piaui - Mesoregion unknown"', add
label define mesobr_lbl 2301 `"Noroeste Cearense"', add
label define mesobr_lbl 2302 `"Norte Cearense"', add
label define mesobr_lbl 2303 `"Metropolitana de Fortaleza"', add
label define mesobr_lbl 2304 `"Sertões Cearenses"', add
label define mesobr_lbl 2305 `"Jaguaribe"', add
label define mesobr_lbl 2306 `"Centro-Sul Cearense"', add
label define mesobr_lbl 2307 `"Sul Cearense"', add
label define mesobr_lbl 2401 `"Oeste Potiguar"', add
label define mesobr_lbl 2402 `"Central Potiguar"', add
label define mesobr_lbl 2403 `"Agreste Potiguar"', add
label define mesobr_lbl 2404 `"Leste Potiguar"', add
label define mesobr_lbl 2499 `"Rio Grande do Norte - Mesoregion unknown"', add
label define mesobr_lbl 2501 `"Sertão Paraibano"', add
label define mesobr_lbl 2502 `"Borborema"', add
label define mesobr_lbl 2503 `"Agreste Paraibano"', add
label define mesobr_lbl 2504 `"Mata Paraibana"', add
label define mesobr_lbl 2599 `"Paraíba - Mesoregion unknown"', add
label define mesobr_lbl 2601 `"Sertão Pernambucano"', add
label define mesobr_lbl 2602 `"São Francisco Pernambucano"', add
label define mesobr_lbl 2603 `"Agreste Pernambucano"', add
label define mesobr_lbl 2604 `"Mata Pernambucana"', add
label define mesobr_lbl 2605 `"Metropolitana de Recife"', add
label define mesobr_lbl 2699 `"Pernambuco - Mesoregion unknown"', add
label define mesobr_lbl 2701 `"Sertão Alagoano"', add
label define mesobr_lbl 2702 `"Agreste Alagoano"', add
label define mesobr_lbl 2703 `"Leste Alagoano"', add
label define mesobr_lbl 2799 `"Alagoas - Mesoregion unknown"', add
label define mesobr_lbl 2801 `"Sertão Sergipano"', add
label define mesobr_lbl 2802 `"Agreste Sergipano"', add
label define mesobr_lbl 2803 `"Leste Sergipano"', add
label define mesobr_lbl 2899 `"Sergipe - Mesoregion unknown"', add
label define mesobr_lbl 2901 `"Extremo Oeste Baiano"', add
label define mesobr_lbl 2902 `"Vale São-Franciscano da Bahia"', add
label define mesobr_lbl 2903 `"Centro Norte Baiano"', add
label define mesobr_lbl 2904 `"Nordeste Baiano"', add
label define mesobr_lbl 2905 `"Metropolitana de Salvador"', add
label define mesobr_lbl 2906 `"Centro Sul Baiano"', add
label define mesobr_lbl 2907 `"Sul Baiano"', add
label define mesobr_lbl 2999 `"Bahia - Mesoregion unknown"', add
label define mesobr_lbl 3101 `"Noroeste de Minas"', add
label define mesobr_lbl 3102 `"Norte de Minas"', add
label define mesobr_lbl 3103 `"Jequitinhonha"', add
label define mesobr_lbl 3104 `"Vale do Mucuri"', add
label define mesobr_lbl 3105 `"Triângulo Mineiro/Alto Paranaíba"', add
label define mesobr_lbl 3106 `"Central Mineira"', add
label define mesobr_lbl 3107 `"Metropolitana de Belo Horizonte"', add
label define mesobr_lbl 3108 `"Vale do Rio Doce"', add
label define mesobr_lbl 3109 `"Oeste de Minas"', add
label define mesobr_lbl 3110 `"Sul/Sudoeste de Minas"', add
label define mesobr_lbl 3111 `"Campo das Vertentes"', add
label define mesobr_lbl 3112 `"Zona da Mata"', add
label define mesobr_lbl 3199 `"Minas Gerais - Mesoregion unknown"', add
label define mesobr_lbl 3201 `"Noroeste Espírito-santense"', add
label define mesobr_lbl 3202 `"Litoral Norte Espírito-santense"', add
label define mesobr_lbl 3203 `"Central Espírito-santense"', add
label define mesobr_lbl 3204 `"Sul Espírito-santense"', add
label define mesobr_lbl 3299 `"Espirito Santo - Mesoregion unknown"', add
label define mesobr_lbl 3301 `"Noroeste Fluminense"', add
label define mesobr_lbl 3302 `"Norte Fluminense"', add
label define mesobr_lbl 3303 `"Centro Fluminense"', add
label define mesobr_lbl 3304 `"Baixadas"', add
label define mesobr_lbl 3305 `"Sul Fluminense"', add
label define mesobr_lbl 3306 `"Metropolitana do Rio de Janeiro"', add
label define mesobr_lbl 3399 `"Rio de Janeiro - Mesoregion unknown"', add
label define mesobr_lbl 3501 `"São José do Rio Preto"', add
label define mesobr_lbl 3502 `"Ribeirão Preto"', add
label define mesobr_lbl 3503 `"Araçatuba"', add
label define mesobr_lbl 3504 `"Bauru"', add
label define mesobr_lbl 3505 `"Araraquara"', add
label define mesobr_lbl 3506 `"Piracicaba"', add
label define mesobr_lbl 3507 `"Campinas"', add
label define mesobr_lbl 3508 `"Presidente Prudente"', add
label define mesobr_lbl 3509 `"Marília"', add
label define mesobr_lbl 3510 `"Assis"', add
label define mesobr_lbl 3511 `"Itapetininga"', add
label define mesobr_lbl 3512 `"Macro Metropolitana Paulista"', add
label define mesobr_lbl 3513 `"Vale do Paraíba Paulista"', add
label define mesobr_lbl 3514 `"Litoral Sul Paulista"', add
label define mesobr_lbl 3515 `"Metropolitana de São Paulo"', add
label define mesobr_lbl 4101 `"Noroeste Paranaense"', add
label define mesobr_lbl 4102 `"Centro Ocidental Paranaense"', add
label define mesobr_lbl 4103 `"Norte Central Paranaense"', add
label define mesobr_lbl 4104 `"Norte Pioneiro Paranaense"', add
label define mesobr_lbl 4105 `"Centro Oriental Paranaense"', add
label define mesobr_lbl 4106 `"Oeste Paranaense"', add
label define mesobr_lbl 4107 `"Sudoeste Paranaense"', add
label define mesobr_lbl 4108 `"Centro-Sul Paranaense"', add
label define mesobr_lbl 4109 `"Sudeste Paranaense"', add
label define mesobr_lbl 4110 `"Metropolitana de Curitiba"', add
label define mesobr_lbl 4199 `"Parana - Mesoregion unknown"', add
label define mesobr_lbl 4201 `"Oeste Catarinense"', add
label define mesobr_lbl 4202 `"Norte Catarinense"', add
label define mesobr_lbl 4203 `"Serrana"', add
label define mesobr_lbl 4204 `"Vale do Itajaí"', add
label define mesobr_lbl 4205 `"Grande Florianópolis"', add
label define mesobr_lbl 4206 `"Sul Catarinense"', add
label define mesobr_lbl 4299 `"Santa Catarina - Mesoregion unknown"', add
label define mesobr_lbl 4301 `"Noroeste Rio-grandense"', add
label define mesobr_lbl 4302 `"Nordeste Rio-grandense"', add
label define mesobr_lbl 4303 `"Centro Ocidental Rio-grandense"', add
label define mesobr_lbl 4304 `"Centro Oriental Rio-grandense"', add
label define mesobr_lbl 4305 `"Metropolitana de Porto Alegre"', add
label define mesobr_lbl 4306 `"Sudoeste Rio-grandense"', add
label define mesobr_lbl 4307 `"Sudeste Rio-grandense"', add
label define mesobr_lbl 4399 `"Rio Grande do Sul - Mesoregion unknown"', add
label define mesobr_lbl 5001 `"Pantanais Sul Mato-grossense"', add
label define mesobr_lbl 5002 `"Centro Norte de Mato Grosso do Sul"', add
label define mesobr_lbl 5003 `"Leste de Mato Grosso do Sul"', add
label define mesobr_lbl 5004 `"Sudoeste de Mato Grosso do Sul"', add
label define mesobr_lbl 5099 `"Mato Grosso do Sul - Mesoregion unknown"', add
label define mesobr_lbl 5101 `"Norte Mato-grossense"', add
label define mesobr_lbl 5102 `"Nordeste Mato-grossense"', add
label define mesobr_lbl 5103 `"Sudoeste Mato-grossense"', add
label define mesobr_lbl 5104 `"Centro-Sul Mato-grossense"', add
label define mesobr_lbl 5105 `"Sudeste Mato-grossense"', add
label define mesobr_lbl 5199 `"Mato Grosso - Mesoregion unknown"', add
label define mesobr_lbl 5201 `"Noroeste Goiano"', add
label define mesobr_lbl 5202 `"Norte Goiano"', add
label define mesobr_lbl 5203 `"Centro Goiano"', add
label define mesobr_lbl 5204 `"Leste Goiano"', add
label define mesobr_lbl 5205 `"Sul Goiano"', add
label define mesobr_lbl 5299 `"Goias - Mesoregion unknown"', add
label define mesobr_lbl 5301 `"Distrito Federal"', add
label values mesobr mesobr_lbl

label define metrobr_lbl 000 `"Not in metropolitan region"'
label define metrobr_lbl 010 `"Manaus"', add
label define metrobr_lbl 020 `"Belém"', add
label define metrobr_lbl 030 `"Macapá"', add
label define metrobr_lbl 040 `"Grande São Luís"', add
label define metrobr_lbl 050 `"Suoeste Maranhense"', add
label define metrobr_lbl 060 `"Cariri"', add
label define metrobr_lbl 070 `"Fortaleza"', add
label define metrobr_lbl 080 `"Natal"', add
label define metrobr_lbl 090 `"Campina Grande"', add
label define metrobr_lbl 100 `"João Pessoa"', add
label define metrobr_lbl 110 `"Recife"', add
label define metrobr_lbl 120 `"Agreste"', add
label define metrobr_lbl 130 `"Maceió"', add
label define metrobr_lbl 140 `"Aracaju"', add
label define metrobr_lbl 150 `"Salvador"', add
label define metrobr_lbl 160 `"Belo Horizonte"', add
label define metrobr_lbl 169 `"Belt around the Belo Horizonte MR (Metropolitan Region)"', add
label define metrobr_lbl 170 `"Vale do Aço"', add
label define metrobr_lbl 179 `"Belt around Vale do Aço MR"', add
label define metrobr_lbl 180 `"Vitória"', add
label define metrobr_lbl 190 `"Rio de Janeiro"', add
label define metrobr_lbl 200 `"São Paulo"', add
label define metrobr_lbl 210 `"Santos Coastal Region"', add
label define metrobr_lbl 220 `"Campinas"', add
label define metrobr_lbl 230 `"Curitiba"', add
label define metrobr_lbl 240 `"Maringá"', add
label define metrobr_lbl 250 `"Londrina"', add
label define metrobr_lbl 260 `"Florianópolis"', add
label define metrobr_lbl 269 `"Metropolitan Expansion Area - Florianópolis MR"', add
label define metrobr_lbl 280 `"Vale do Itajaí"', add
label define metrobr_lbl 290 `"Metropolitan expansion area of Vale do Itajaí"', add
label define metrobr_lbl 270 `"North/NE Santa Catarina"', add
label define metrobr_lbl 279 `"Metropolitan Expansion Area - North/NE Santa Catarina"', add
label define metrobr_lbl 300 `"Carbonífera"', add
label define metrobr_lbl 310 `"Tubarão"', add
label define metrobr_lbl 320 `"Lages"', add
label define metrobr_lbl 330 `"Chapecó"', add
label define metrobr_lbl 340 `"Porto Alegre"', add
label define metrobr_lbl 350 `"Vale do Rio Cuiabá"', add
label define metrobr_lbl 360 `"Goiânia"', add
label define metrobr_lbl 370 `"Caxias do Sul"', add
label define metrobr_lbl 380 `"Pelotas"', add
label define metrobr_lbl 400 `"Distrito Federal and surroundings"', add
label define metrobr_lbl 410 `"Grande Terseina"', add
label define metrobr_lbl 420 `"Petrolina e Juazeiro"', add
label define metrobr_lbl 430 `"Undocumented"', add
label values metrobr metrobr_lbl

label define ownership_lbl 0 `"NIU (not in universe)"'
label define ownership_lbl 1 `"Owned"', add
label define ownership_lbl 2 `"Not owned"', add
label define ownership_lbl 9 `"Unknown"', add
label values ownership ownership_lbl

label define ownershipd_lbl 000 `"NIU (not in universe)"'
label define ownershipd_lbl 100 `"Owned"', add
label define ownershipd_lbl 110 `"Owned, already paid"', add
label define ownershipd_lbl 120 `"Owned, still paying"', add
label define ownershipd_lbl 130 `"Owned, constructed"', add
label define ownershipd_lbl 140 `"Owned, inherited"', add
label define ownershipd_lbl 190 `"Owned, other"', add
label define ownershipd_lbl 191 `"Owned, house"', add
label define ownershipd_lbl 192 `"Owned, condominium"', add
label define ownershipd_lbl 193 `"Apartment proprietor"', add
label define ownershipd_lbl 194 `"Shared ownership"', add
label define ownershipd_lbl 200 `"Not owned"', add
label define ownershipd_lbl 210 `"Renting, not specified"', add
label define ownershipd_lbl 211 `"Renting, government"', add
label define ownershipd_lbl 212 `"Renting, local authority"', add
label define ownershipd_lbl 213 `"Renting, parastatal"', add
label define ownershipd_lbl 214 `"Renting, private"', add
label define ownershipd_lbl 215 `"Renting, private company"', add
label define ownershipd_lbl 216 `"Renting, individual"', add
label define ownershipd_lbl 217 `"Renting, collective"', add
label define ownershipd_lbl 218 `"Renting, joint state and individual"', add
label define ownershipd_lbl 219 `"Renting, public subsidized"', add
label define ownershipd_lbl 220 `"Renting, private subsidized"', add
label define ownershipd_lbl 221 `"Renting, co-tenant"', add
label define ownershipd_lbl 222 `"Renting, relative of tenant"', add
label define ownershipd_lbl 223 `"Renting, cooperative"', add
label define ownershipd_lbl 224 `"Renting, with a job or business"', add
label define ownershipd_lbl 225 `"Renting, loan-backed habitation"', add
label define ownershipd_lbl 226 `"Renting, mixed contract"', add
label define ownershipd_lbl 227 `"Furnished dwelling"', add
label define ownershipd_lbl 228 `"Sharecropping"', add
label define ownershipd_lbl 230 `"Subletting"', add
label define ownershipd_lbl 231 `"Rent to own"', add
label define ownershipd_lbl 239 `"Renting, other"', add
label define ownershipd_lbl 240 `"Occupied de facto/squatting"', add
label define ownershipd_lbl 250 `"Free/usufruct (no cash rent)"', add
label define ownershipd_lbl 251 `"Free, provided by employer"', add
label define ownershipd_lbl 252 `"Free, without work or services"', add
label define ownershipd_lbl 253 `"Free, provided by family or friend"', add
label define ownershipd_lbl 254 `"Free, private"', add
label define ownershipd_lbl 255 `"Free, public"', add
label define ownershipd_lbl 256 `"Free, condemned"', add
label define ownershipd_lbl 257 `"Free, other"', add
label define ownershipd_lbl 290 `"Not owned, other"', add
label define ownershipd_lbl 999 `"Unknown"', add
label values ownershipd ownershipd_lbl

label define resident_lbl 1 `"Present resident"'
label define resident_lbl 2 `"Absent resident"', add
label define resident_lbl 3 `"Visitor/non-resident"', add
label define resident_lbl 4 `"De facto population (present persons)"', add
label define resident_lbl 9 `"Unknown/missing"', add
label values resident resident_lbl

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

label define bplbr_lbl 11 `"Rondônia"'
label define bplbr_lbl 12 `"Acre"', add
label define bplbr_lbl 13 `"Amazonas"', add
label define bplbr_lbl 14 `"Roraima"', add
label define bplbr_lbl 15 `"Pará"', add
label define bplbr_lbl 16 `"Amapá"', add
label define bplbr_lbl 17 `"Tocantins"', add
label define bplbr_lbl 21 `"Maranhão"', add
label define bplbr_lbl 22 `"Piauí"', add
label define bplbr_lbl 23 `"Ceará"', add
label define bplbr_lbl 24 `"Rio Grande Do Norte"', add
label define bplbr_lbl 25 `"Paraíba"', add
label define bplbr_lbl 26 `"Pernambuco"', add
label define bplbr_lbl 27 `"Alagoas"', add
label define bplbr_lbl 28 `"Sergipe"', add
label define bplbr_lbl 29 `"Bahia"', add
label define bplbr_lbl 31 `"Minas Gerais"', add
label define bplbr_lbl 32 `"Espirito Santo"', add
label define bplbr_lbl 33 `"Estado Do Rio"', add
label define bplbr_lbl 34 `"Guanabara"', add
label define bplbr_lbl 35 `"São Paulo"', add
label define bplbr_lbl 36 `"Serra Dos Aimorés"', add
label define bplbr_lbl 41 `"Paraná"', add
label define bplbr_lbl 42 `"Santa Catarina"', add
label define bplbr_lbl 43 `"Rio Grande Do Sul"', add
label define bplbr_lbl 50 `"Mato Grosso do Sul"', add
label define bplbr_lbl 51 `"Mato Grosso"', add
label define bplbr_lbl 52 `"Goiás"', add
label define bplbr_lbl 53 `"Brasília  (D.F.)"', add
label define bplbr_lbl 91 `"Fernando De Noronha"', add
label define bplbr_lbl 92 `"Rio Branco"', add
label define bplbr_lbl 97 `"Brazil, not specified"', add
label define bplbr_lbl 98 `"Abroad"', add
label define bplbr_lbl 99 `"Unknown"', add
label values bplbr bplbr_lbl

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

label define inctbr_lbl 0 `"No income"'
label define inctbr_lbl 1 `"1 to 2,100"', add
label define inctbr_lbl 2 `"2,101 to 3,300"', add
label define inctbr_lbl 3 `"3,301 to 4,500"', add
label define inctbr_lbl 4 `"4,501 to 6,000"', add
label define inctbr_lbl 5 `"6,001 to 10,000"', add
label define inctbr_lbl 6 `"10,001 to 20,000"', add
label define inctbr_lbl 7 `"20,001 to 50,000"', add
label define inctbr_lbl 8 `"50,001 or over"', add
label define inctbr_lbl 9 `"NIU (not in universe) and unknown"', add
label values inctbr inctbr_lbl

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

label define mig1_p_br_lbl 076011 `"Rondônia"'
label define mig1_p_br_lbl 076012 `"Acre"', add
label define mig1_p_br_lbl 076013 `"Amazonas"', add
label define mig1_p_br_lbl 076014 `"Roraima"', add
label define mig1_p_br_lbl 076015 `"Pará"', add
label define mig1_p_br_lbl 076016 `"Amapá"', add
label define mig1_p_br_lbl 076021 `"Maranhão"', add
label define mig1_p_br_lbl 076022 `"Piauí"', add
label define mig1_p_br_lbl 076023 `"Ceará"', add
label define mig1_p_br_lbl 076024 `"Rio Grande Do Norte"', add
label define mig1_p_br_lbl 076025 `"Paraíba"', add
label define mig1_p_br_lbl 076026 `"Pernambuco"', add
label define mig1_p_br_lbl 076027 `"Alagoas"', add
label define mig1_p_br_lbl 076028 `"Sergipe"', add
label define mig1_p_br_lbl 076029 `"Bahia"', add
label define mig1_p_br_lbl 076031 `"Minas Gerais"', add
label define mig1_p_br_lbl 076032 `"Espirito Santo"', add
label define mig1_p_br_lbl 076033 `"Rio de Janeiro, Guanabara"', add
label define mig1_p_br_lbl 076035 `"São Paulo"', add
label define mig1_p_br_lbl 076041 `"Paraná"', add
label define mig1_p_br_lbl 076042 `"Santa Catarina"', add
label define mig1_p_br_lbl 076043 `"Rio Grande Do Sul"', add
label define mig1_p_br_lbl 076051 `"Mato Grosso do Sul, Mato Grosso"', add
label define mig1_p_br_lbl 076052 `"Goiás, Tocantins"', add
label define mig1_p_br_lbl 076053 `"Brasília  (D.F.)"', add
label define mig1_p_br_lbl 076054 `"Brazil, unspecified"', add
label define mig1_p_br_lbl 076097 `"Abroad"', add
label define mig1_p_br_lbl 076098 `"Unknown"', add
label define mig1_p_br_lbl 076099 `"NIU (not in universe)"', add
label values mig1_p_br mig1_p_br_lbl

* save
save ".././output/Brazil", replace

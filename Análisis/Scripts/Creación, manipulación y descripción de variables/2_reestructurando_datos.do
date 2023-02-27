************
*PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ
* SCRIPT: 2_reestructuradatos.do
* OBJETIVO: Reestructurando datos
************

* Preambulo 

clear all

global Canadá "C:/Users/Usuario/Desktop/STATA_ECOPUCP/Análisis/Data/_Canadá"

global MEI "C:/Users/Usuario/Desktop/STATA_ECOPUCP/Análisis/Data/_MEI0"

**************************************************

* Comando encode

use "$Canadá", clear

encode place, gen(placenum)


* Comando decode

use "$Canadá", clear

gen tipo = .
replace tipo = 1 if place == "Canada"
replace tipo = 2 if place == "Yukon"         | place == "Northwest Territories"
replace tipo = 3 if place == "Newfoundland"  | place == "Prince Edward Island" | place == "Nova Scotia"  | ///
					place == "New Brunswick" | place == "Quebec" 	 		   | place == "Ontario" 	 | ///
					place == "Manitoba"		 | place == "Saskatchewan"		   | place == "Alberta"		 | ///
					place == "British Columbia"

label define tipo_l 1 "País" 2 "Territorios" 3 "Provincias"
label values tipo tipo_l

decode tipo, gen(tipo_string)


* Comando reshape 

use "$MEI", clear

reshape long mei, i(year) j(month)

reshape wide 

gen dif_mei_1_12 = mei12-mei1


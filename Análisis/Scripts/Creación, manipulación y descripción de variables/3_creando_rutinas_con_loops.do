************
*PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ
* SCRIPT: 3_loops.do
* OBJETIVO: Creando rutinas con loop
************

* Preambulo 

clear all

global MEI "C:/Users/Usuario/Desktop/STATA_ECOPUCP/Análisis/Data/_MEI0"

**************************************************


* Cargamos la base de datos

use "$MEI", clear

reshape long mei, i(year) j(month)

/*		forvalues 		*/

forvalues i = 1950(20)2010{

	summ mei if year == `i' 
	sort year month
	line mei month if year == `i', name(g`i', replace) title("`i'") ytitle("MEI") ///
	xtitle("") xlabel(1(1)12,grid) ylabel(,grid) 	
}
graph combine g1950 g1970 g1990 g2010, ycommon title("Índice del Fenomeno del Niño", size(*0.8))


reshape wide 
 

/*		foreach 		*/

* varlist
foreach x of varlist mei1 mei4 mei7 mei10{
	local mei1 "Enero"
	local mei4 "Abril"
	local mei7 "Julio"
	local mei10 "Octubre"
	line `x' year , name(p`x', replace) title(``x'') xtitle("") ytitle("MEI") ///
	xlabel(1950(5)2010 2011, grid labsize(*0.5) angle(60))
}
graph combine pmei1 pmei4 pmei7 pmei10, ycommon title("Variación de MEI para cada mes")


* numlist
foreach x of numlist 1 4 7 10{
	local 1 "Enero"
	local 4 "Abril"
	local 7 "Julio"
	local 10 "Octubre"
	line mei`x' year, name(p`x', replace) title(``x'') xtitle("") ytitle("MEI") ///
	xlabel(1950(5)2010 2011, grid labsize(*0.5) angle(60))
}
graph combine p1 p4 p7 p10, ycommon title("Variación de MEI para cada mes") 


/*		while 		*/

reshape long mei, i(year) j(month)

local iterar = 1

while `iterar' <= 6 {
	local year_l = `iterar'+1949
	line mei month if year == `year_l', title(`year_l') xlabel(1(1)12, grid) ///
	ytitle("MEI")  xtitle("") name(l`iterar', replace)
	local iterar = `iterar' + 1
}
graph combine l1 l2 l3 l4 l5 l6, ycommon title("Variación de MEI en los primeros 6 años")


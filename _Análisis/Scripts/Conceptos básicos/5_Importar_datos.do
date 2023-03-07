************
*PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ
* SCRIPT: 5_Importar_datos.do
* OBJETIVO: Importar datos
************

*Preambulo 

cd "C:/Users/Usuario/Documents/GitHub/Proyecto_STATA/_Análisis/Data" // coloca la dirección donde se encuentra tu base de datos


************

* Usamos el comando 'use' para cargar una base .dta

use "sumaria-2020.dta", clear	// Cargamos una base almacenada en la computadora

* Cargamos una base almacenada en internet

use "http://fmwww.bc.edu/ec-p/data/wooldridge/openness", clear // 

* Ahora, cargemos una base en ambos formatos de Excel

import excel using "relaciones_extramaritales.xlsx", clear firstrow 
br 
 
import excel using "relaciones_extramaritales.xlsx", clear firstrow  sheet ("Hoja2")
br

/* 
- Si se tiene un archivo excel con muchas hojas y no se especifica la opción sheet, Stata cogerá la primera hoja	
- El comando br nos permite ver la base de datos que se ha cargado
*/
	
******************	
* Otros formatos

import delimited using "IOP_1118.csv", delimiter(",") clear // formatos .csv
import delimited using "IOP_1118.txt", delimiter(",") clear // formatos .txt 
	
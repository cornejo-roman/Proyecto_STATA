************
*PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ
* SCRIPT: 2_mapas.do
* OBJETIVO: Mapas y georreferenciación
************

* Preambulo 

clear all

global mapa "\Users\Usuario\Desktop\STATA_ECOPUCP\Análisis\Data\DEPARTAMENTOS/DEPARTAMENTOS.shp"
global data_dpto "\Users\Usuario\Desktop\STATA_ECOPUCP\Análisis\Data/dpto"
global coordenadas "C:\Users\Usuario\Desktop\STATA_ECOPUCP\Análisis\Data/dpto_coord"
global gastoporalumno "C:\Users\Usuario\Desktop\STATA_ECOPUCP\Análisis\Data/gastoporalumno_region"

**************************************************

* Cargamos la base de datos
set more off 

* Se debe instalar previamente shp2dta
ssc install shp2dta

* Transformamos los datos de shapefiles a dta

shp2dta using "$mapa",  ///
 data("$data_dpto") 	///
 coord("$coordenadas") 	///
 genid(dpto_id)  replace

* Hacemos un mapa de los límites

* Se debe instalar previamente spmap 
ssc install spmap

* Cargammos la base 
use "$data_dpto", clear

spmap using "$coordenadas", 						///
id(dpto_id) ocolor(black) osize(vthin) title("Limites departamentales del Perú")
 
* Cargamos la  base de departamentos y lo juntamos con otra base 
use "$data_dpto", clear
merge 1:1 dpto_id using "$gastoporalumno"

gen delta = (log(y2018) - log(y2008))*100
 
spmap delta using "$coordenadas", ///
 id(dpto_id) ocolor(white ..) osize(thin) fcolor(YlGnBu) 				///
 legend(pos(7) title("Rangos de Gasto", size(*0.5))) 				///
 title("Gasto Público por Alumno" "en Educación Secundaria" "2018") 

 
 
 
 

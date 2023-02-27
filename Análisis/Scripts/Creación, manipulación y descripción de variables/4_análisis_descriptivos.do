************
*PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ
* SCRIPT: 4_descriptivos.do
* OBJETIVO: Análisis descriptivos
************

clear all

* Cargamos el módulo 500 de la ENAHO

use "C:/Users/Usuario/Desktop/STATA_ECOPUCP/Análisis/Data/_enaho01a-2018-500", clear


* Información descriptiva de la base
describe ocu500

codebook ocu500

inspect  ocu500

* Estadísticos descriptivos de los datos

summ ocu500 i524a1

summ ocu500 i524a1, detail

* Se descarga univar
ssc install univar
univar ocu500 i524a1				

* Tablas de frecuencia 

tabulate ocu500

tabulate dominio ocu500, row


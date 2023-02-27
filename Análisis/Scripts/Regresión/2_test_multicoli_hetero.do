************
*PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ
* SCRIPT: 2_test_multicoli_hetero.do
* OBJETIVO: Multicolinealidad y heterocedasticidad
************

* Preambulo 

clear all

global HD_database "C:/Users/Usuario/Desktop/STATA_ECOPUCP/Análisis/Data/HD_database"


**************************************************
use "$HD_database"

* Testeando por Multicolinealidad
reg life school gdp urban i.region
vif 

* Testeando por Heterocedasticidad
reg life school gdp urban i.region
hettest

* Usar errores estándar robustos a la heterocedasticidad
reg life school gdp urban i.region, robust
reg life school gdp urban i.region,vce(robust)

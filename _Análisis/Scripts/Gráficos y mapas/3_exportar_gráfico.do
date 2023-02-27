************
*PONTIFICIA UNIVERSIDAD CATÓLICA DEL PERÚ
* SCRIPT: 3_exportar_gráfico.do
* OBJETIVO: Exportación de gráficos
************

* Preambulo 

clear all
use "$ifogames"

**************************************************
hist mag 
graph export using "C:/Users/Usuario/Desktop/STATA_ECOPUCP/Análisis/Results/grafico_1.png", replace
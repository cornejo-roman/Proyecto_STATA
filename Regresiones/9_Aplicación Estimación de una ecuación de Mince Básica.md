# Regresiones

### APLICACIÓN: ESTIMACIÓN DE UNA ECUACIÓN DE MINCER BÁSICA

Una ecuación de Mincer busca explicar el nivel de ingresos a partir del nivel de educación así como de otras variables. Consideremos el siguiente modelo:

*log (Ingreso)~i~ = β~0~+ β~1~Educacioni+ β~3~ HabilidadesInnatas~i~ + u~i~*



![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332685836_3272502503012243_7409459949317580217_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=X1tp98ULvqkAX8kWpKO&_nc_ht=scontent.flim30-1.fna&oh=00_AfAaIL9fKVSDOib1_Ju3eAGTfam471dtbAVbW_KqufgtKg&oe=64003389)

En este caso apuntamos a replicar la columna para el 2018.
Vamos a usar el módulo de ‘Sumarias’ de la ENAHO 2018. Este módulo hace un resumen de distintas variables recolectadas en otros módulos. Adicionalmente incluye algunas variables ya trabajadas como la condición de pobreza para cada hogar. Antes de hacer los estimados hay que definir el diseño muestral.

```
* Definimos el diseño muestral 
gen factor_hogar =  factor07*mieperho
svyset conglome [pweight =  factor_hogar], strata(estrato) vce(linearized) 
```

En este caso tenemos que hacer un ajuste previo al factor de expansión para que se estime a nivel de hogar. Se debe multiplicar el factor de expansión por el número de miembros por hogar y considerar esto como nuevo factor de expansión.
Creamos las variables de pobreza a partir de la clasificación propia de la ENAHO:

```
* Creamos la categoría para pobreza 
gen poverty = 1 if pobreza == 1 | pobreza == 2
replace poverty = 0 if pobreza == 3
```

Creamos una serie de categorías para Lima Metropolitana, para urbano/rural, para región natural y región natural cruzado con urbano/rural.

```
* Creamos la categoría para pobreza 
gen poverty = 1 if pobreza == 1 | pobreza == 2
replace poverty = 0 if pobreza == 3

* Creamos la categoría para pobreza extrema
gen extr_poverty = 1 if pobreza == 1 
replace extr_poverty = 0 if pobreza == 2 | pobreza == 3

/* Creamos categorías para región y provincia.
   Con esto creamos una variable "lima" que sea Lima Metropolitana y Callao
   Para ver cómo interpretar los códigos de ubigeo puede entrar
   a la página del INEI:
   http://webinei.inei.gob.pe:8080/sisconcode/proyecto/index.htm?proyectoTitulo=UBIGEO&proyectoId=3
*/
gen dpto = substr(ubigeo,1,2)
gen prov = substr(ubigeo,1,4)

gen lima = 1 if prov =="1501" | dpto == "07"
replace lima = 0 if lima ==. 

* Creamos las categorías rural/urbano
gen rural = 1 if estrato == 6 | estrato == 7 | estrato == 8
replace rural = 0 if rural == .

* Creamos las categorías para dominio geográfico
gen dominio_geo = .
replace dominio_geo = 1 if dominio == 1 | dominio == 2 | dominio == 3 | dominio == 8
replace dominio_geo = 2 if dominio == 4 | dominio == 5 | dominio == 6 
replace dominio_geo = 3 if dominio == 7
```

Usamos el comando mean para obtener el estimador del promedio. Adicionalmente, usamos la opción , over() para las categorías sobre las cuales obtener el promedio estimado.

```
* Tasa de pobreza para el Perú
svy: mean poverty

* Tasa de pobreza para el Lima + Callao y resto del Perú
svy: mean poverty, over(lima)

* Tasa de pobreza rural y urbana
svy: mean poverty, over(rural)

* Tasa de pobreza por dominio geográfico
svy: mean poverty, over(dominio_geo)

* Tasa de pobreza por dominio geográfico y rural o urbano
svy: mean poverty, over(dominio_geo rural)
```

Con esto se obtienen los mismos resultados que en las estadísticas oficiales del INEI. Tomemos como ejemplo los estimados sobre dominio y urbano/rural.
La definición para cada valor de _subpoop_ está dado en el mismo resultado. Por ejemplo _subpoop_1 sería Costa Urbana.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332573970_902664497545188_2465580942854736393_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=mWI06QQv4TwAX_fLUJT&_nc_ht=scontent.flim30-1.fna&oh=00_AfCjH31rr8jApH3VzGyGcwlhtyU9_1Z2xdTRQJRl3MLzyQ&oe=63FF1EB8)

En estos casos también podemos comparar los intervalos de confianza de cada estimador presentados tanto en las estadísticas oficiales como en los resultados del código.
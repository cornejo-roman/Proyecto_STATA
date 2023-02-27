# Gráficos y mapas

### 1. CONOCIENDO LOS GRÁFICOS DE STATA

Los gráficos son una herramienta útil para presentar los resultados de algún análisis o transmitir alguna información relevante. En esta sección introduciremos una selección de los principales tipos de gráficos usados en Stata presentando ejemplos prácticos de cada uno de ellos y luego explorando las opciones particulares que tiene.
A pesar de que Stata permite la opción de manejo de gráficos a ‘mano’ preferimos usar escribir los códigos correspondientes en los do-files para poder tener un mejor seguimiento de ellos, para hacerlos reproducibles y para poder tener mayor poder de edición.
Como insumo para explorar los diferentes gráficos usaremos la base de datos ifo GAME, la cual contiene información sobre eventos geológicos y geográficos a nivel de país entre 1979 y 2010. Veamos las variables de la variable usando el comando describe:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332551346_758923462573227_4856340694771795967_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=BVeIDN9bnfIAX-eV_Pq&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfCqeh9R-6ceTiW75svvtvaZLmdhhdgzG0e7J0a5VF4bOA&oe=63FEF44E)

La base contiene datos sobre desastres naturales ocurridos en los países de acuerdo a distintas medidas, como el daño monetario estimado, el número de tormentas y huracanes o la magnitud de erupciones volcánicas.

### 1.1 HISTOGRAM Y KDENSITY


#### 1.1.1 Histogram

Un histograma permite graficar la distribución de una variable de acuerdo a la densidad de cada valor. Esto, a diferencia de un gráfico de barras en donde se mide la frecuencia (lo que veremos luego).

El comando histogram permite manejar datos tanto continuos como discretos. En el primer caso se buscará crear bins o grupos los cuales graficar mientras que en el segundo caso se toma cada categoría como grupo.

Grafiquemos la distribución de la magnitud de todos los terremotos registrados en la base de datos. Para ello, consideremos que el programa nos permite definir el número de agrupamientos a considerar o la distancia entre ellos con respecto a la variable a graficar. Comparemos la opción por default y el resto de opciones:

```
* Histogramas

hist mag 	// Histograma simple

hist mag, width(0.5) // Definimos la distancia entre cada bin

hist mag, bin(20) // Definimos el número total de bins a incluir
```

El programa determina el número de grupos por default.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332299414_1858151737891637_1952466523326837685_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=p-opwBvzw6oAX9cZcrm&_nc_ht=scontent.flim30-1.fna&oh=00_AfCqixx8oPDcxHGq1Sl0B19UAZ95AFX0OKN-g7lyzLbHmA&oe=63FF9FF6)

Podemos definir el número de grupos indicando su separación, en este caso, 0.5.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332685561_725380242519468_1783268954270679160_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=grtrKe1ksEIAX-72f6y&_nc_ht=scontent.flim30-1.fna&oh=00_AfAMJYP8-3CvGOEJ8YNI6Uq1MSTllupZUBQr8HJEpSdlNw&oe=63FEE80A)

Definir el número de grupos en el histograma puede ayudar a delimitar el mensaje que se quiere proyectar a través de la distribución de la variable. En este caso vemos que la magnitud de terremotos parece seguir una distribución normal o de campana, centrada alrededor de 5.

#### 1.1.1.1 Opciones de histogram

Exploremos algunas opciones adicionales:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332484482_6308969385787997_5263453206965146225_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=o-vgalX9rl8AX9El0Tl&_nc_ht=scontent.flim30-1.fna&oh=00_AfBg6S6DFX314X_NmJbl4udABpp4uZy0RsFunV6eKhDELA&oe=640043A7)

El eje Y o de densidad puede no ser fácil de interpretar, algunas opciones más intuitivas pueden ser representar la densidad en términos de la fracción o el porcentaje. De igual manera podemos agregar una distribución normal o un kernel de densidad al gráfico. 
Veamos:

```
* Agregamos algunas opciones adicionales
hist mag, bin(20) percent normal 								  ///
 xtitle("Máxima Escala Richter por Terremoto") 					  ///
 ytitle("Porcentaje, %")								   		  ///
 title("Distribución de Terremotos" "Toda la muestra, 1979-2010") ///
 normopts(lcolor(red)) kdensity kdenopts(lcolor(blue))

```

![]https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332559874_1165278540830857_4034286547374460572_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=M0WbKbjwvLQAX8mJKyU&_nc_ht=scontent.flim30-1.fna&oh=00_AfCxA3neWkMmVlpz25_e_lIhQTQlST450mz0JvduQiZnRA&oe=63FEFC7E)

En este caso hemos agregados no solo opciones particulares al histograma sino también opciones generales a los gráficos. Adicionamos la línea de normal (roja) y una línea de kernel de densidad (azul), definimos sus colores usando las opciones normopts() y kdenopts(), respectivamente, definiendo con el comando lcolor() el color específico, red y blue. Las opciones generales que usamos fueron: los títulos de cada eje con xtitle() y ytitle() y el título general con title(). Estas últimas opciones son generales a la gran mayoría de gráficos, por lo que volveremos a usarlos.

#### 1.2.1. Kdensity

La densidad kernel o kernel de densidad presentan la información de manera similar al histograma, con la diferencia de que no se agrupan los datos observados, sino que se ‘estima’ una distribución que engloba todos los datos. Esta es la línea azul del gráfico previo. Delimita un aproximado a la distribución observada.

Grafiquemos la densidad kernel estimada junto a una normal:

```
* Kernel de densidad 
 
kdensity mag if iso =="PER" | iso == "CHL" , 						  ///
 lcolor(blue) normal normopts(lcolor(red)) 			  				  ///
 legend(order(1 "Densidad Estimada" 2 "Distribución nomral") cols(2)) ///
 xtitle("Máxima Escala Richter por Terremoto") 					      ///
 ytitle("Densidad")								   		  			  ///
 title("Distribución de Terremotos" "Perú y Chile, 1979-2010")
```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332162738_899375201306825_4872378337944436151_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=PkNnp5AqreUAX8H21_f&_nc_ht=scontent.flim30-1.fna&oh=00_AfCYANRgcyxI-hooajWx3s-rcMe0HFIdgxxBdO_FtmoB2g&oe=63FFD170)

En este caso estamos agregando algunas opciones generales adicionales. En primer lugar, estamos definiendo que solo se consideren algunos países del total de la muestra. Al observar nuestra base de datos en el editor de datos podemos observar que la variable iso es un código de 3 dígitos para cada país. Usamos esta variable y la condición if para definir que solo se usen datos para Perú y Chile. Adicionalmente, comenzamos a usar la opción de leyenda. En ella definimos el nombre de las líneas agregadas. Hay distintas maneras de editar el nombre de las series en la leyenda. Una de ellas es usar la opción order() en donde se indica el número de variable introducida (1 para la primera, 2 para la segunda, etc.) y entre comillas el título de cada una de ellas.


### 1.2 SCATTER

Un scatter plot es un gráfico de dispersión. En él se puede observar cómo se pueden relacionar dos tipos de variables a partir de la relación que generan, positiva, negativa o ninguna. El comando que se usa es scatter.

Este comando tiene un gran número de opciones a explorar, disponibles en help scatter. 

### 1.3 GRÁFICO DE DISPERSIÓN

Dado que necesitamos dos variables, usaremos el registro máximo Richter de terremotos y la velocidad del viento en huracanes y tormentas máximo registrado en cada año. Tomemos toda la muestra:

```
scatter mag combi, 														           ///
 xtitle("Velocidad Máxima del viento en nodos para tormentas y huracanes", size(*0.8)) ///
 ytitle("Máxima Escala Richet por Terremoto", size(*0.8))		   		  			   ///
 title("Terremotos y Velocidad de tormentas" "Toda la muestra, 1979-2010", size(*0.8)) ///
 msize(*0.8) mcolor(green)
```
El comando es bastante directo, indicamos el par de variables a considerar y se genera el gráfico de dispersión. En este caso, estamos indicando algunas opciones nuevas como ajustar el tamaño de los títulos de los ejes y el título general. Para esto dentro de cada opción usamos, size() y luego indicamos el tamaño. El tamaño puede ser indicado de distintas maneras, una de ellas es usar * seguido de un valor. El * cambia el tamaño considerando el número seguido como una fracción del tamaño por default. Es decir, si indicamos *0.5 se reduce a 50% del tamaño original mientras que si indicamos *1.5 aumenta en 50% del gráfico inicial. También agregamos dos opciones particulares al comando, msize() y mcolor(). La primera establece el tamaño del marcador (los puntos en el gráfico) y el segundo el color de los mismos, en este caso verde.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332397794_542511141193191_5341613526959681557_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=Pc4sWHMgnOEAX-P_qMt&_nc_ht=scontent.flim30-1.fna&oh=00_AfCII570L7q0NvGF-mupz6JaiUwNAlVYFTF_flQ9ViBBXQ&oe=63FEAB45)

El gráfico nos indica que no hay una relación aparente entre ambas variables.
Tomemos sólo un año de la muestra, 2000, y grafiquemos la dispersión entre ambas variables.

```
* Establecemos una muestra más pequeña
 
scatter mag combi if year ==2000, mcolor(blue) msize(*0.5)							   ///
 mlabel(iso) mlabcolor(blue) 														   ///
 xlabel(0(20)150, grid labsize(*0.5)) 												   ///
 ylabel(2(1)8,    grid labsize(*0.5))												   ///
 xtitle("Velocidad Máxima del viento en nodos para tormentas y huracanes", size(*0.8)) ///
 ytitle("Máxima Escala Richet por Terremoto", size(*0.8))		   		  			   ///
 title("Terremotos y Velocidad de tormentas" "2010", size(*0.8))
```

En este caso estamos definiendo que solo se considere el año 2000, if year == 2000. Sobre esto agregamos una etiqueta a cada punto del gráfico con mlabel, es decir marker label. Dentro de esta opción tenemos que indicar alguna variable que contenga el nombre de cada país. Esta puede ser country o iso, aunque la primera indique todo el nombre puede ser confuso ver muchas palabras en el gráfico. Para ello, podemos usar el código de 3 dígitos, de manera que se haga más ágil la interpretación del gráfico. Adicionalmente agregamos un color a la etiqueta de marcadores con mlabcolor o  marker label color. También hay nuevas opciones generales agregadas, estas son xlabel y ylabel. Ambas editan el etiquetado de cada eje. Esto hace referencia a los valores que están impresos en cada eje. En ellos, podemos indicar el rango de valores a considerar, por ejemplo, ‘0(20)150’ se lee como desde 0 hasta 150 de 20 en 20. Adicionalmente, se indica que se agregue una línea a cada etiqueta con grid y que se modifique su tamaño con labsize().

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332568193_562769242281704_8614868304029900689_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=I4IEV5p0eC8AX8M9zNl&_nc_ht=scontent.flim30-1.fna&oh=00_AfDqFUD-u2ZQ88CtYhomxw1lHbkpHybrud7Ci3Rj-ePk8w&oe=64007B6B)

#### 1.3.1. Comando twoway

El comando twoway permite combinar distintos gráficos que compartan la característica de depender de dos ejes. Si escribimos help twoway aparecerá la lista completa de gráficos que se pueden usar con este comando. 
El comando twoway funciona junta distintos gráficos, por lo que las opciones particulares de cada gráfico irían dentro de los respectivos paréntesis mientras que las opciones generales pueden ser puestas fuera de todos los paréntesis luego de escribir una coma.

```
  /*
 twoway (Gráfico 1) (Gráfico 2) (Gráfico 3)
 
 twoway ///
 (Gráfico 1) ///
 (Gráfico 2) ///
 (Gráfico 3) 
 
 */
```

Veamos un ejemplo al considerar el gráfico previo pero para distintos cortes de año:

```
 * Usando el comando twoway

twoway ///
 (scatter mag combi if year ==1990, mcolor(blue)  msize(*0.4) mlabel(iso) mlabcolor(blue)  mlabsize(*0.8) ) ///
 (scatter mag combi if year ==2000, mcolor(green) msize(*0.4) mlabel(iso) mlabcolor(green) mlabsize(*0.8) ) ///
 (scatter mag combi if year ==2010, mcolor(red)   msize(*0.4) mlabel(iso) mlabcolor(red)   mlabsize(*0.8) ) ///
 ,legend(order(1 "1990" 2 "2000" 3  "2010") cols(3))										     			///
 xlabel(0(20)150, grid labsize(*0.5)) 												   						///
 ylabel(2(1)8,    grid labsize(*0.5))												   						///
 xtitle("Velocidad Máxima del viento en nodos para tormentas y huracanes", size(*0.8))		 				///
 ytitle("Máxima Escala Richet por Terremoto", size(*0.8))		   		  			   		 				///
 title("Terremotos y Velocidad de tormentas" "1990-2000-2010", size(*0.8)) 
```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332578796_701915604948700_4736455089831475527_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=Ei4B7VIF5cAAX_oOmC7&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfCr9xdgP6mfKoUptcX6nhizMmD0vHG-cGFUUwdko6P4Dw&oe=640077E5)

Entre los paréntesis indicamos cada gráfico incluyendo sus opciones particulares como el color y tamaño del marcador, así como el color y tamaño de la etiqueta del marcador. En la cuarta línea se agrega una coma para iniciar la lista de opciones generales como la leyenda (en este caso agregamos la opción de considerar tres columnas, cols(3)), las etiquetas de ejes, los títulos de ejes y el título general.
El resultado presenta un gráfico de dispersión usando un color particular para cada corte de años de manera que se puede diferenciar a cada país y en qué año se encuentra. 
Ahora veamos cómo usar el comando twoway para juntar gráficos de dispersión con otros tipos de gráficos.

```
* Usando scatter y lfit

twoway ///
 (scatter mag combi if year == 2000, mcolor(blue) msize(*0.4) mlabel(iso) mlabcolor(blue)) 	///
 (lfit    mag combi if year == 2000, lcolor(red) lpattern(dash) )							///
 ,legend(off)        																		///
 xlabel(0(20)140, grid labsize(*0.5)) 												   		///
 ylabel(2(1)8,    grid labsize(*0.5))												   		///
 xtitle("Velocidad Máxima del viento en nodos para tormentas y huracanes", size(*0.8))		///
 ytitle("Máxima Escala Richet por Terremoto", size(*0.8))		   		  			   		///
 title("Terremotos y Velocidad de tormentas" "2000", size(*0.8)) 
```

En este caso juntamos un gráfico de dispersión con un gráfico de ajuste lineal, lfit. Este último comando grafica la relación lineal entre las variables. Es decir, grafica los valores estimados de una regresión lineal simple entre ambas variables. De esta manera se tiene una idea de la correlación incondicional posible entre ambas variables.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332482017_3366638396919500_968977532995203030_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=74wnSatBmLQAX81W4Z5&_nc_ht=scontent.flim30-1.fna&oh=00_AfDMTrC49VGCWigg6GG8pd1nCUP8rnZqHdT7qtPr2dXchw&oe=64005B4D)

El comando lfit tiene sus propias opciones particulares como el color de linea (lcolor()) o el patrón de la línea (lpattern()). Las posibles opciones de colores y patrones se pueden ver dentro del buscador de ayuda del programa. La lista de gráficos con los cuáles combinar es extensa por lo que se recomienda revisar el material de ayuda.

### 1.4 LINE

Una forma similar de presentar la relación entre dos variables es usando el comando line. A diferencia del gráfico de dispersión, line conecta los puntos. Este comando se usa mucho cuando se tiene datos que evolucionan en el tiempo.

El gráfico de línea es un gráfico twoway por lo que puede ser combinado con otros gráficos twoway. Veamos el número de terremotos para una muestra de países de países con costa en el pacífico de América.


```
preserve

keep if iso == "PER" | iso == "CHL" | iso == "MEX" | iso == "USA" | ///
		iso == "COL" | iso == "GTM" | iso == "PAN" | iso == "ECU" | ///
		iso == "CRI" | iso == "HND" | iso == "SLV" | iso =="CAN"
 
collapse (sum) quake, by(year)
line quake year, lcolor(blue) lpattern(longdash) ///
xlabel(1980(2)2010, labsize(*0.8) grid) 		///
ylabel(0(1)10, labsize(*0.8) grid) ///
xtitle("") ytitle("Total de terremotos") ///
title("Número de terremotos por año" "Paises con costa al Pacífico, 1979-2010", size(*0.8))

restore
```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332377644_892158265423467_1230765544373161740_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=7gGNKyjyngMAX9czMHD&_nc_ht=scontent.flim30-1.fna&oh=00_AfDPv7AvhimNVE4wBQa1fX--H58H3ZfvDgE7DPa3PIjRCA&oe=6400588C)

El comando es bastante directo, el primer argumento es el eje Y mientras que el segundo, el eje X. Si queremos graficar una serie en el tiempo, indicamos la variable de años (o meses, trimestres o días de acuerdo con el caso) como segundo argumento. En este caso estamos revisando algunos comandos nuevos: preserve y restore. Estos comandos sirven para modificar la base de datos sin necesidad de eliminar datos de manera permanente. Por ejemplo, en este caso nos quedamos con algunos países, con keep, pero lo hacemos dentro de preserve y restore así no se eliminan los datos permanentemente. Luego, usamos el comando collapse (sum) , by(year) para sumar los datos a nivel de año.
Tomemos la misma idea, pero ahora usando la opción by, esta permite repetir una operación para distintos subgrupos. En este caso dividimos la muestra de países en tres grupos: América con costa en el Pacífico, Asia con costa en el Pacífico y Resto del mundo.

```
* Usando by para indicar distintos grupos

preserve

gen sample = 1 if iso == "PER" | iso == "CHL" | iso == "MEX" | iso == "USA" | ///
				  iso == "COL" | iso == "GTM" | iso == "PAN" | iso == "ECU" | ///
			      iso == "CRI" | iso == "HND" | iso == "SLV" | iso == "CAN"

replace sample = 2 if iso == "JPN" | iso == "CHN" | iso == "KOR" | iso == "TWN" | ///
					  iso == "PHL" | iso == "VNM" | iso == "MYS" | iso == "IDN" | /// 
					  iso == "BRN" | iso == "PNG" 
				
replace sample = 3 if sample == .

collapse (sum) quake, by(sample year)

label define sample_label 1 "América" 2 "Asia"  3 "Resto"
label values sample sample_label

line quake year, by(sample, cols(1))     ///
xlabel(1980(2)2010, labsize(*0.8) grid)  ///
xtitle("") ytitle("Total de terremotos") ///
title("Número de terremotos por año")

restore
```

Luego de crear los grupos, colapsamos la base para sumar el número de terremotos por subgrupos. Luego creamos etiquetas para cada uno. Por último, usamos los comandos ya conocidos para crear los gráficos de línea. Para indicar los subgrupos usamos by(sample); adicionalmente, podemos indicar que solo se considere una columna indicando by(sample, cols(1)).

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332379359_3467940793468609_3327980317790934730_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=GyEg8Vzr5hUAX_6UMT-&_nc_ht=scontent.flim30-1.fna&oh=00_AfBfD6UMRKkDRnhvOPK_S0zK79JYOjHVps84BAHuuy4VdA&oe=64005CB5)

### 1.5 BOX

Los gráficos de caja presentan información estadística de la distribución de una variable. Particularmente, presenta el rango de valores entre el percentil 25 y el percentil 75 con una línea en la mediana (o percentil 50). Adicionalmente, las observaciones que son ‘adyacentes’ a estos límites se consideran dentro del grupo. El resto de las observaciones se presentan como puntos fuera de los límites.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332633166_570033525176914_941712881224105115_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=IajTczq6n5oAX9hws6a&_nc_ht=scontent.flim30-1.fna&oh=00_AfCuharsTus-n5UuhRc1S6sB6W18w3qxAaBvLqUBpv33oQ&oe=63FEE4BD)

Lo podemos presentar de manera vertical (box) o de manera horizontal (hbox). En este caso queremos presentar la distribución del logaritmo del daño material en dólares para los tres mismo grupos presentados previamente.

```
* Box plot

preserve

gen sample = 1 if iso == "PER" | iso == "CHL" | iso == "MEX" | iso == "USA" | ///
				  iso == "COL" | iso == "GTM" | iso == "PAN" | iso == "ECU" | ///
			      iso == "CRI" | iso == "HND" | iso == "SLV" | iso == "CAN"

replace sample = 2 if iso == "JPN" | iso == "CHN" | iso == "KOR" | iso == "TWN" | ///
					  iso == "PHL" | iso == "VNM" | iso == "MYS" | iso == "IDN" | /// 
					  iso == "BRN" | iso == "PNG" 
					  
replace sample = 3 if sample == .

label define sample_label 1 "América" 2 "Asia"  3 "Resto"
label values sample sample_label

gen log_d =log(damage_cor*1000000)

graph box log_d  if damage_cor !=0 | damage_cor !=. , by(sample, row(1))  ///
ytitle("Log(Daño Material, dólares)") 
 
restore
```

Estamos usando un código similar al anterior. En este caso creamos una nueva variable que mida el logaritmo del daño material. Antes de tomar el logaritmo lo multiplicamos por un millón debido a que la serie inicial está en millones de dólares. Adicionalmente no estamos considerando los valores que tienen 0 o missings value debido a que estaríamos considerando los años en donde no hay desastres naturales.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332715748_1241492560106615_2058570731890211501_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=-tBDtAHZveQAX9FRH8P&_nc_ht=scontent.flim30-1.fna&oh=00_AfBl5LUcVkidxtH-_A8p3Af8uoZ2kGg27oO4cY7bjaJ76w&oe=63FFCDF2)

El subgrupo con mediana más grande es Asia, seguido por América. A pesar de esto la distribución parece ser similar. A partir de esto podemos decir que los casos con daños más severos se encuentran en los países de América y Asia que tienen costa en el Pacífico, como era de esperar.

### 1.6 PIE

Los gráficos de pie o pie chart son gráficos que representan distintas proporciones dentro de un gráfico circular. Por ejemplo, podemos graficar el porcentaje de observaciones de cada subgrupo o la importancia de alguna variable para los subgrupos.

```
* Pie

preserve
gen sample = 1 if iso == "PER" | iso == "CHL" | iso == "MEX" | iso == "USA" | ///
				  iso == "COL" | iso == "GTM" | iso == "PAN" | iso == "ECU" | ///
			      iso == "CRI" | iso == "HND" | iso == "SLV" | iso == "CAN"

replace sample = 2 if iso == "JPN" | iso == "CHN" | iso == "KOR" | iso == "TWN" | ///
					  iso == "PHL" | iso == "VNM" | iso == "MYS" | iso == "IDN" | /// 
					  iso == "BRN" | iso == "PNG" 
					  
replace sample = 3 if sample == .

label define sample_label 1 "América" 2 "Asia"  3 "Resto"
label values sample sample_label

gen     decadas = 1 if year >= 1979 & year < 1989
replace decadas = 2 if year >= 1989 & year < 1999
replace decadas = 3 if year >= 1999 & year <= 2010

label define decadas_label 1 "[1979-1989[" 2 "[1989-1999[" 3 "[1999-2010[" 
label value decadas decadas_label

graph pie quake, over(decadas) sort plabel(_all percent)						     ///
 pie(1, color(red) explode) pie(2, color(blue) explode) pie(3, color(green) explode) ///
 legen(order( 1 "[1979-1989[" 2 "[1989-1999[" 3 "[1999-2010[") cols(3))  			 ///
 title("Porcentaje de terremotos por décadas")
 
restore
```

En este ejemplo creamos categorías para cada década y usamos esta nueva variable como insumo para ver en qué época hay mayor porcentaje de terremotos. Graficamos un pie chart indicando la variable que usaremos en este caso quake e indicamos con respecto a qué variable se considerarán los subgrupos. En este caso consideramos la variable décadas. Con esto tenemos el gráfico más simple, ahora agregamos algunas cosas adicionales.

Comenzamos indicando que se agreguen los porcentajes en cada corte del pie con plabel(_all percent). Para editar cada pedazo de pie tenemos que usar la opción pie(), dentro de los paréntesis indicamos el color u otra característica. En este caso seleccionamos el color y elegimos que se muestre un poco salido con la opción explode.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332707189_760256079058391_163222886194801387_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=PNv-c1Wroe0AX8SHQqq&_nc_oc=AQkr_Q4iAZFlQ4O7qDOr5BexwfFk2NemdHfvJTEZZa6QjjBaW5_X5vJSpTO6EcD91_TR0qALLnWnl1D1qSZ-F-nS&_nc_ht=scontent.flim30-1.fna&oh=00_AfC5GBHNCFBI_x0pFgJU6dWSWBNsg_TLiX74wVoSh_9GWw&oe=63FEF99E)

### 1.7 BAR

Podemos usar los gráficos de barras como para denotar algún estadístico como el promedio, mediana, mínimo o máximo de alguna variable o para ver su frecuencia.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332705313_865718584732277_795575437322633063_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=34YqDMMR2m4AX-k6WGg&_nc_ht=scontent.flim30-1.fna&oh=00_AfDKWmt64lSYkbnc_fDNp9-zXDYHLeAcxos279DzAo2emw&oe=63FFC24F)

Veamos un ejemplo.

```
 * Bar
 
preserve
gen sample = 1 if iso == "PER" | iso == "CHL" | iso == "MEX" | iso == "USA" | ///
				  iso == "COL" | iso == "GTM" | iso == "PAN" | iso == "ECU" | ///
			      iso == "CRI" | iso == "HND" | iso == "SLV" | iso == "CAN"

replace sample = 2 if iso == "JPN" | iso == "CHN" | iso == "KOR" | iso == "TWN" | ///
					  iso == "PHL" | iso == "VNM" | iso == "MYS" | iso == "IDN" | /// 
					  iso == "BRN" | iso == "PNG" 
					  
replace sample = 3 if sample == .

label define sample_label 1 "América" 2 "Asia"  3 "Resto"
label values sample sample_label

graph hbar (mean) mag maxvei, over(sample)   								      ///
bar(1, color(blue)) bar(2, color(red))  										  ///
legend(title("Promedio de:", size(*0.4)) cols(1) size(*0.45) pos(5) ring(0) .     ///
order( 1 "Magnitud Richter de terremotos" 2 "Índice de Explosividad Volcánica"))

restore
```

El manejo es similar al graph pie, debemos indicar con respecto a qué variable tomar los subgrupos con over() y luego editar cada barra usando bar() como antes se hizo con pie().

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332640244_541650214460627_6478894436128872122_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=6thFinVuMEsAX8hH6RI&_nc_ht=scontent.flim30-1.fna&oh=00_AfAd2ZdxgADqcpUBlse12hktxDixPAnn3M_s3Fb_rLSv-w&oe=63FF1DBC)

En este caso estamos editando la leyenda para escribir todo en una sola columna, cols(1) y agregandole un título con title() dentro de la leyenda. Como se ve, la leyenda se movió de abajo a la esquina inferior derecha usando el comando pos(5) ring(0). El número dentro de pos(5) hace referencia a la posición con respecto a las manijas del reloj (clockwise), por lo que 5 sería la posición 5 en un reloj o la esquina inferior derecha.

### 1.8 OTRAS OPCIONES DE GRÁFICOS

Hay una serie de gráficos adicionales que se pueden desarrollar en el programa. Una opción para conocer algunos gráficos adicionales específicos puede ser revisar el manual de referencia para gráficos aquí. La idea, hasta este punto, es revisar cómo entender los comandos más usados para que cada uno pueda explorar nuevas formas de uso o nuevos comandos que se necesitarán para momentos particulares. Antes de pasar a repasar gráficos de mapas revisemos una opción general para editar los esquemas en general de los gráficos.
Una opción fácil y rápida de cambiar el aspecto de los gráficos es usando la opción set scheme seguido de la opción. Con esta opción se prefija un esquema de gráficos. Para ver la lista de esquemas instalados escribimos help scheme en la línea de comando.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332562495_498509789145410_1442460319610498460_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=nou0eA0FLkgAX_fqpLo&_nc_ht=scontent.flim30-1.fna&oh=00_AfDLb3ZDjbU56InSxpgDxfWIYgW5SdOU_-emvLmmtbvAnQ&oe=63FF0816)

Podemos elegir alguno de los esquemas agregando la línea de código set scheme s1color al inicio de nuestro do-file, por ejemplo. Veamos distintos ejemplos graficados a la misma vez:
Fijamos distintos esquemas predeterminados y graficamos un histograma simple. Una forma de juntar los gráficos es ‘guardarlos’ temporalmente en la memoria del programa para luego combinarlos. Para ello, usamos la opción name(, replace). Debemos definir un nombre, por ejemplo a1, a2, etc. y además escribir ,replace para indicar que se rede reemplazar el gráfico en cada corrida distinta.

```
* Diferentes esquemas de gráficos
set scheme s1color
hist mag, name(a1, replace)

set scheme s2color
hist mag, name(a2, replace)

set scheme s1mono
hist mag, name(a3, replace)

set scheme s2mono
hist mag, name(a4, replace)

set scheme economist
hist mag, name(a5, replace)

set scheme sj
hist mag, name(a6, replace)


graph combine a1 a2 a3 a4 a5 a6, title("Diferentes esquemas de gráfico")
```

Al final podemos ‘recuperar’ cada gráfico para combinarlos usando graph combine seguido de los nombres ‘guardados’ previamente.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332555476_1826834621036120_4695556464710558650_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=7ylpbigfQdgAX_CAzxY&_nc_ht=scontent.flim30-1.fna&oh=00_AfA_iffmEiTtwXh-Q6S3Ioe-7s7aW9h3FoWQ4qDV8xGFww&oe=64001813)





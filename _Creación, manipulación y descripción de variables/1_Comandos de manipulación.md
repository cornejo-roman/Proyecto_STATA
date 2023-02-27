# Creación, manipulación y descripción de variables

###  1 COMANDOS DE MANIPULACIÓN

Para manejar los datos debemos aprender a crearlos y reemplazarlos de acuerdo a las distintas condiciones o situación que enfrentemos. 

### 1.1 MANEJO DE VARIABLES: GEN, REPLACE, KEEP, DROP, LABEL Y RECODE


#### 1.1.1 Generate y replace

Los comandos generate y replace sirven para permitirnos crear nuevas variables o modificar los valores existentes. Tomemos un ejemplo, consideremos que Canadá, como en la mayoría de países desarrollados, las mujeres tienden a vivir más que los hombres. Para analizar estas diferencias por región, puede ser de interés cargar una base de datos y generar una nueva variable que mida la diferencia entre la expectativa de vida de las mujeres menos la expectativa de vida de los hombres.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332330999_1268779994059155_1928541483632921777_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=c9vhjLDwnXIAX9jvvO7&_nc_ht=scontent.flim30-1.fna&oh=00_AfCJceNFPNs85494vAfL-kCuzISMZCRxpGzOpvsEb6uizA&oe=63FB366D)

Veamos el ejemplo:
Cargamos la base de datos, a partir de esto creamos una nueva variable:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332428137_638595241609446_2165022831594132730_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=QOaJXqKmJxsAX-2A_WO&_nc_ht=scontent.flim30-1.fna&oh=00_AfAqouk9JsZfwWS1EP1b9b_TGGO-6bfI2BVGW0_g8CPaLg&oe=63FC5D42)

Como vemos tenemos distintas unidades de observación. Al inicio tenemos al país en general y luego tanto provincias como territorios (siguiendo la propia división del país). Para poder diferenciar esto creamos una nueva variable y reemplazamos de acuerdo a lo que corresponda:
Creamos una variable vacía con el comando gen y luego reemplazamos de acuerdo a los lugares usando el comando replace junto al comando if (este último fue visto ligeramente en la semana previa pero será retomado en puntos adelante).

```
* Cargamos la base de datos haciendo uso del global

use "$Canadá", clear 

generate gap = flife - mlife

gen tipo = "" /*estamos creando una variable vacia*/
replace tipo = "Pais" 		if place == "Canada"
replace tipo = "Territorio" if place == "Yukon"         | place == "Northwest Territories"
replace tipo = "Provincia"  if place == "Newfoundland"  | place == "Prince Edward Island" | place == "Nova Scotia"  | ///
							   place == "New Brunswick" | place == "Quebec" 	 		  | place == "Ontario" 		| ///
							   place == "Manitoba"		| place == "Saskatchewan"		  | place == "Alberta"		| ///
							   place == "British Columbia"

```
La nueva base incluye la brecha inicial junto a las categorías de cada lugar:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332563642_1480427676071399_4990555824764668545_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=qPDxNl4Cn2wAX9Vnw7r&_nc_ht=scontent.flim30-1.fna&oh=00_AfBj7ku9imoIxcyxyJSIMntrJBuUv7rgafonaD7V28COTQ&oe=63FC415B)

#### 1.1.1 Keep y drop

Los comandos keep y drop sirven para mantener y eliminar variables respectivamente. Ambas variables pueden ser utilizadas de distintas maneras al ser combinadas con los comandos if y in.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332694386_562788672482707_4009416073199174630_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=-QF9QbqGXWQAX_qkP1Y&_nc_ht=scontent.flim30-1.fna&oh=00_AfB4rnO2ji3DVusOIl4CaYqQxVhHTqWovYaz67Wp11k3mg&oe=63FD54C9)

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332745790_726192999012374_2861135975898604727_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=dKaNfdAd9l4AX9kEazb&_nc_ht=scontent.flim30-1.fna&oh=00_AfB1XDrmDzIHa9TXsJ8X3DVWd6sBeRGdVXy0fwqfAzMjfg&oe=63FC8922)

De las tres opciones que se permiten usar: i) la primera elimina o mantiene variables (es decir, las columnas en el editor de datos); ii) la segunda, permite agregar condiciones a lo primero usando el comando if (similar a como se usó el comando if en el tópico previo); y, iii) la tercera, elimina o mantiene variable de acuerdo al ‘lugar’ de la observación (es decir, ya no eliminamos/mantenemos columnas sino filas). Veamos:
En el primer caso eliminamos las variables mlife y flife, las medidas de expectativa de vida para hombre y mujer.

```
* Eliminemos algunas observaciones de distintas maneras

use "$Canadá", clear

generate gap = flife - mlife

gen tipo = ""
replace tipo = "Pais" 		if place == "Canada"
replace tipo = "Territorio" if place == "Yukon"         | place == "Northwest Territories"
replace tipo = "Provincia"  if place == "Newfoundland"  | place == "Prince Edward Island" | place == "Nova Scotia"  | ///
							   place == "New Brunswick" | place == "Quebec" 	 		  | place == "Ontario" 		| ///
							   place == "Manitoba"		| place == "Saskatchewan"		  | place == "Alberta"		| ///
							   place == "British Columbia"

drop mlife flife /*eliminamos por columna*/

drop if tipo == "Territorio" /*eliminamos por condición*/

drop in 1 /*eliminamos por ubicación*/
```

En el segundo caso eliminamos las observaciones que son territorios. Si queremos quedarnos solo con las observaciones que son Provincias debemos eliminar el dato para el país. Para ello, veamos el tercer caso. Aquí usamos drop in 1 para eliminar el dato que se encuentra en la posición número 1. De esa manera nos quedamos con la siguiente base de datos:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332223702_1615252132229190_6567468143398596184_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=2EMwUg6-G24AX9sT__M&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfCrYFHMo3yrX0KJOqitwugHYf89xRXjk57EvzSj7O15gA&oe=63FBB16C)

Realicemos el mismo ejemplo usando el comando keep.


```
* Repitamos el ejercicio anterior pero usando el comando keep

use "$Canadá", clear

generate gap = flife - mlife

gen tipo = ""
replace tipo = "Pais" 		if place == "Canada"
replace tipo = "Territorio" if place == "Yukon"         | place == "Northwest Territories"
replace tipo = "Provincia"  if place == "Newfoundland"  | place == "Prince Edward Island" | place == "Nova Scotia"  | ///
							   place == "New Brunswick" | place == "Quebec" 	 		  | place == "Ontario" 		| ///
							   place == "Manitoba"		| place == "Saskatchewan"		  | place == "Alberta"		| ///
							   place == "British Columbia"

keep place pop unemp gap tipo
 
keep if tipo == "Provincia" | tipo == "Pais" 

keep in 2/11

```

Al igual que en el caso anterior, podemos usar keep para mantener el resto de las variables a excepción de las variables de expectativas de vida. Luego podemos mantener las observaciones que son Provincia y País. Y, por último, podemos mantener sólo las observaciones para provincia usando el comando in. Con respecto a este último punto, nos quedamos con las observaciones que se encuentran desde la 2da posición hasta la posición 11. De esta manera, acabamos con la misma base de datos. Es decir, tanto keep y drop pueden ser usadas de la misma manera de acuerdo a lo que convenga.

### 1.2 ESPECIFICANDO CONDICIONES: IF, IN Y BY

Los comandos de condiciones, o qualifiers en inglés sirven para establecer que cierto comando, rutina o código se lleve a cabo para cierto grupo de variables u observaciones de acuerdo a la/s condiciones impuestas. 
En puntos previos ya hemos usado los comandos if e in, ahora indagaremos un poco más y aprenderemos un nuevo comando: by. Este comando repite las tareas que se asignan para un subconjunto de datos.
Veamos un ejemplo:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332484318_527100319547745_3800981975371112296_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=baUC2jtJytQAX-d9UAb&_nc_ht=scontent.flim30-1.fna&oh=00_AfBlZSqKODv_XGtbQusgsyJYdsWrorJDm1wuwCsBZlHNQw&oe=63FCE875)

Luego de crear una nueva variable que categorice a cada tipo de observación queremos obtener algunos estadísticos descriptivos por grupo. En este caso, la forma del código cambia ligeramente, ahora se pone al inicio de la línea seguido por la variable que indique los subgrupos y dos puntos. Posteriormente se indica la operación que se debe repetir.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332185538_1239377806959464_6794833353526498987_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=_ZLYNXvARzkAX8eQvuC&_nc_ht=scontent.flim30-1.fna&oh=00_AfBKc75a7Hgr2XzDZ231fQpjS28stb6UtLJfvi-oJ8b1hA&oe=63FDC905)

En este caso usamos la opción bysort para que automáticamente se ordene (sort) los datos y el programa pueda repetir la tarea en cada subgrupo.

#### 1.2.1 Etiquetas

Stata permite etiquetar la base de datos (data label), etiquetar las variables dentro de la base de datos (variable label) y etiquetar los valores de cada variables (value labels).

- data label:
Etiqueta la base de datos en conjunto, nos permite tener una descripción de todo dentro de la base.
- variable label:
Etiqueta cada variable dentro de la base. Sirve para saber qué es o qué mide cada variable.
- value label: 
Etiqueta los valores de las variables. Se usa, por ejemplo, cuando los valores en sí no son informativos sino las categorías que representan.
Démosle etiquetas tanto a la base de datos como a cada variable:

```
* Usando etiquetas en Stata

use "$Canadá", clear

*Etiquetamos la base de datos
label data "Esta base de datos contiene información acerca del desempleo y las expectativas de vida por género en Canadá."

*Etiquetamos cada variable en la base de dato
label variable place "Lugar, puede ser país, territorio o provincia"

label variable pop   "Población, en miles de personas"

label variable unemp "Tasa de desempleo"

label variable mlife "Expectativa de vida para el hombre"

label variable flife "Expectativa de vida para la mujer"
```

Para ver las etiquetas abrimos la ventana de variables y de propiedades en la interfaz inicial o en el editor/navegador de variables:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332625405_976587480429802_3778404290310323787_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=1Cidcxm95KkAX-S5mFE&_nc_oc=AQm_Za1j2xJY33F_2wm2cM6l56I5QwsR33RN6z4HImbtlw7BvGEuG4gt6AVn3IJijFhSTfAS8dYPeQW44rOzL82c&_nc_ht=scontent.flim30-1.fna&oh=00_AfDUdEOZWkqScGQge4MwDHF9ihWhnNDPEHFLBSLG9TbSwA&oe=63FCB874)

Las etiquetas de valores tienen más sentido cuando se tienen variables categóricas como por ejemplo el género de la persona, el distrito de origen o alguna característica adicional. Tomemos como ejemplo que re creamos la variable tipo del inicio pero considerándola como números en vez de cadenas (string). En primer lugar, se deben definir las etiquetas de cada categoría. Por ejemplo, 1 será ‘País’; 2, ‘Territorio’; y, 3, ‘Provincia’. Para ello usamos el comando label define seguido por el nombre del conjunto de etiquetas y el par de valor y etiqueta respectivo a modificar. Veamos:

```
* Creamos la variable tipo como número 
gen tipo = .
replace tipo = 1 if place == "Canada"
replace tipo = 2 if place == "Yukon"         | place == "Northwest Territories"
replace tipo = 3 if place == "Newfoundland"  | place == "Prince Edward Island" | place == "Nova Scotia"  | ///
					place == "New Brunswick" | place == "Quebec" 	 		   | place == "Ontario" 	 | ///
					place == "Manitoba"		 | place == "Saskatchewan"		   | place == "Alberta"		 | ///
					place == "British Columbia"

label define tipo_l 1 "País" 2 "Territorios" 3 "Provincias"
label values tipo tipo_l
```

Como resultado obtenemos lo siguiente:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332696511_557989992961127_1998191685716256695_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=qdobgphdw-MAX_sEXlI&_nc_ht=scontent.flim30-1.fna&oh=00_AfBQAJLyd3HVu5cd0m-R0InQAFg030HE0Rur3_Fws7zlZA&oe=63FDC741)

Como vemos, ahora los nombres están en azul indicando que son etiquetas y no valores en cadena.

#### 1.2.1 Recode

El comando recode sirve para recodificar los valores de una variable. Esto significa cambiar los valores de manera conjunta.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332584399_1846054009127170_7572986819327280362_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=DLail8eL1xwAX-8KRn9&_nc_ht=scontent.flim30-1.fna&oh=00_AfBljaiTA0CzIAqm3GjSER1XuPNOXj2S_jO9hShV_UdS5Q&oe=63FD99ED)

La tabla presenta la sintaxis de las distintas opciones que permite. Veamos un ejemplo simple. En este caso tenemos una variable que toma el valor de 1 cuando se tiene a la región con la capital y 0 para el resto de lugares. Queremos recodificar estas categorías haciendo que la capital tenga el valor 2 y el resto de lugares el valor 1.
Luego de indicar la variable a recodificar, indicamos el orden de las variables entre paréntesis:

```
* Comando recode

use "$Canadá", clear

gen		capital 	= 1 if place == "Ontario"
replace capital		= 0 if place != "Ontario"

recode capital (0=1) (1=2) 
```

Obtenemos lo siguiente:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332589230_1397682807729236_1289578920260086513_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=ACM-tm_13pAAX_ueSsP&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfB0_0L2FsUBJIjtf3PDIiB8B-ZjyL20MyW6D1ArhA4P7A&oe=63FC9C90)

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332467643_681961783697316_1150437750981141936_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=axIGK79WJzUAX9ChBNE&_nc_ht=scontent.flim30-1.fna&oh=00_AfAJP_8GMxJQqyLSmri-i-fI-06vBspKdyc2nxH7igvZWg&oe=63FDEDC6)

#### 1.2.3 If

El comando if puede ser confundido con otro del mismo nombre usado para ‘programar’ rutinas dentro del propio Stata. En este caso solo exploraremos su uso como un qualifier.

```
* Comando if 

use "$Canadá", clear

generate gap = flife - mlife

gen 	unemp_place = 1 if unemp>=10 & unemp !=.
replace unemp_place = 0 if unemp<10	 & unemp !=.

gen		capital 	= 1 if place == "Ontario"
replace capital		= 0 if place != "Ontario"

replace unemp 		= 0 if unemp == .
```

Luego de cargar la base de ejemplo, usamos el comando if en tres casos. En el primero generamos una nueva variable unemp_place que toma el valor de 1 cuando la tasa de desempleo (unemp) es mayor al 10% y toma el valor de 0 en el resto de casos. en el segundo caso creamos una nueva variable llamada capital que toma el valor de 1 cuando la observación es Ontario (la región de la capital). En el tercer caso, reemplazamos los valores de desempleo a 0 cuando el valor inicial es un missing value.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332484453_927855064917823_4180339795665943213_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=6T6GqidD6lAAX84YBdg&_nc_ht=scontent.flim30-1.fna&oh=00_AfD3VxHDVk9IbK4W9fXUKhAhZnoHU5nix7DHb1bKvds51A&oe=63FC5D16)

#### 1.2.4 In

Como vimos algunos puntos atrás, el comando in permite especificar que los cambios se den en filas específicas al indicar el número de la fila. Repliquemos la base previa usando los comandos in.

```
* Comando in

use "$Canadá", clear

generate gap = flife - mlife

gen 	unemp_place = 1 in 1/6
replace unemp_place = 0 in 7/13

gen		capital 	= 1 in 7
replace capital		= 0 in 1/6 
replace capital 	= 0 in 8/13

replace unemp 		= 0 in 12/13
```

En este caso debemos indicar la posición exacta de cada linea. Cuando indicamos reemplazar los valores de las observaciones que no son capital con 0 partimos el código en dos. Primero de la posición 1 a la 6 y luego de la 8 a la 13. Ojo: como se ve, el comando in es sensible al ordenamiento de las filas. Esto significa que si las filas se ordenan de otra manera, el código resultaría en algo distintos. Veamos un ejemplo.

Consideremos el mismo código, pero ahora usemos el comando sort para ordenar las filas de menor a mayor de acuerdo a la variable que se indique. Ordenemos la base de acuerdo a la tasa de desempleo:

```
*Ahora ordenemos los datos de acuerdo al desempleo y usemos el comando in

use "$Canadá", clear

sort unemp

generate gap = flife - mlife

gen 	unemp_place = 1 in 1/6
replace unemp_place = 0 in 7/13

gen		capital 	= 1 in 7
replace capital		= 0 in 1/6 
replace capital 	= 0 in 8/13

replace unemp 		= 0 in 12/13
```

Al ver la base final, encontramos que es distinta a la anterior:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332707234_871620224128413_3329092125139944305_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=b1jdPQQ9h8cAX-TWNZD&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfBV-3LTwsROyAQUvf4bSJCg3mUC34Fy4TlK8dqqHjO59w&oe=63FCB275)
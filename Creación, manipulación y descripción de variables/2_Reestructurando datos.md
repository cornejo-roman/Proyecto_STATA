# Creación, manipulación y descripción de variables

###  2 REESTRUCTURANDO DATOS

En primer lugar vamos a repasar dos caminos distintos de pasar una variable numérica a una de cadena, y viceversa:

- encode/decode
- tostring/destring

Posteriormente, veremos cómo usar el el comando reshape:

- Pasar de formato ancho a largo, wide to long
- Pasar de formato largo a ancho, long to wide

### 2.1 ENCODE Y DECODE

#### 2.1.1 Encode

El comando encode genera variables numéricas etiquetadas (con los valores de cadena) a partir de una variable de cadena. El número 1 es dado al primer valor de manera alfabética, el 2 al segundo y así. Para ello, debemos indicar el nuevo nombre que queremos que lleve la variable a crear:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332264117_891333271981736_8178581582681297739_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=QeDaPwdNEY0AX82S3sE&_nc_ht=scontent.flim30-1.fna&oh=00_AfBHC5p_TS8c4u1Uy8qrzPdpRjXc0GiB5b8qCxYp_UKoFg&oe=63FCD9FB)

El siguiente ejemplo crea una variable numérica etiquetada llamaba placenum a partir de la variable place:


```
* Comando encode

use "$Canadá", clear

encode place, gen(placenum)
```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332713313_6290675737634793_281751141460826249_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=jerOnpsg63kAX_d-_G6&_nc_oc=AQmgiQCDc2YRnwEgdpzmvI1PfQOHnindzlKH9GF9zm3ihYSSI1Fuhak2W-VUm78q6YYTLBJv9tX2XopXgxEZwJD4&_nc_ht=scontent.flim30-1.fna&oh=00_AfA9tiEAL7cogz-qjdU_aCC-V2L9WEOSW7nbPsMdWwqMLw&oe=63FDEA29)

#### 2.1.1 Decode

En cambio, decode hace la conversión contraria. Este genera una variable cadena usando las etiquetas de una variable numérica.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332729093_1634356233701097_7851992442693667422_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=xaZN2VDCWrQAX9kVSVa&_nc_ht=scontent.flim30-1.fna&oh=00_AfDHBSkNlgh-7_Ju0VxssbnrJ2dgrG46a7JEowGykVAUXg&oe=63FC8407)

Retomemos el ejemplo en donde creamos una variable numérica con etiquetas para los diferentes tipos de lugares que están en la base de datos. A partir de esto, creamos una nueva variables:

```
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
```

Veamos la base final:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/326721034_3289769361335699_2028679591808378233_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=xdytCG5RXnwAX8LraCD&_nc_ht=scontent.flim30-1.fna&oh=00_AfAhRrEQ56BDqYhNqMa-DzCwKYqO9yYBlTBgcU4XLsUJiA&oe=63FC1729)

### 2.2 TOSTRING Y DESTRING

Estos comandos son similares, pero tienen más restricciones. Por ejemplo, solo se puede usar destring sobre una variable que contienen caracteres numéricos en formato de cadena. Mientras que tostring transforma a formato de cadena los caracteres numéricos de las variables numéricas. No las etiquetas, como en el caso anterior.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332695247_930116021344008_8293156187594080714_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=e4aOeJyUdL4AX-kYd77&_nc_ht=scontent.flim30-1.fna&oh=00_AfB0iLU90guD0rc-HzvaxLz_FqEchxxXNE58hGX5_vK07A&oe=63FDAC86)

Los comandos encode y decode deberían ser suficientes para manipular los datos de esta manera.

### 2.2 RESHAPE

Una forma distinta de reestructurar los datos es posible usando el comando reshape. Este comando cambia la base de datos entre dos tipos de configuraciones llamadas anchas (wide) y larga (long)
Para ejemplificar este comando usamos una base de datos con una medida de la temperatura de la superficie del oceano (esta medida sirve como un índice para analizar la ocurrencia del Fenómeno del Niño, ENSO (El Niño Southern Oscillation) entre los años 1950 y 2011.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332324241_737169244567750_1959134844451295315_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=eLxhPSKJozcAX-ncWTZ&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfCKoATnhwC2lgwupfImDR_35zi9aV-Gp6E7epJ8SPmT2Q&oe=63FDB1F0)

En donde cada variable mei indica el índice en distintos meses desde enero (mei1) hasta diciembre (mei12).
La base que acabamos de abrir está en formato wide, los índices de cada mes se repiten a lo ancho de la base creando una variable separada para cada una. También es posible pensar que la base puede reducir su número de columnas si solo se tiene una variable que mida el índice y otra en donde se indique el mes. Esto último, es el formato long. Podemos pasar de una base a otra usando el comando reshape:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332691572_678363687363764_5618805090543851331_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=QtLXRMQ1L9UAX_nEuou&_nc_oc=AQkDQf4RQ-1j8AQsBGgEKmS3kIGqUAJyHgAdJ89-u8ufqRhEFOlSjNq1E7g0kGKVXmlkeTX5etkiCJaRNSObVaYn&_nc_ht=scontent.flim30-1.fna&oh=00_AfBWG4_cGXuqhieXdRfsi9x9_DTUCNA8b8noNdu8f-yTTw&oe=63FDBBB9)

Para usar este comando primero debemos identificar el tipo de base que tenemos. El gráfico previo brinda bastante información. En nuestro ejemplo, identificamos que tenemos una variable para los años sin repetición y una serie de columnas que miden lo mismo, pero en diferentes meses.
Si vemos el gráfico entonces i sería el año y stub1, stub2, ..., stub12 serían mei1, mei2, ..., mei12. Vemos que es importante que estas variables compartan parte del nombre y se diferencian en algún número que permita identificarlas posteriormente.
Siguiendo con la guía, verificamos que para pasarlo a formato long debemos indicar el stub que sería en este caso mei; luego, debemos indicar la i que sería el año o year; por último, debemos indicar el nombre que llevará la variable j, en este caso month o mes.
Si seguimos los pasos correctamente obtendremos una base como la siguiente:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332682612_582993266794599_7988075099004647630_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=83qeenXLviEAX-2xWhX&_nc_ht=scontent.flim30-1.fna&oh=00_AfAvdcBR2O6WTfE1pvVtaYPIJQxuOcg8re1PWRoZnCmqfA&oe=63FCBD64)

Podemos regresar al mismo formato usando el comando reshape wide (si long es nuestro formato original entonces usaríamos reshape long).

```
* Comando reshape 

use "$MEI", clear

reshape long mei, i(year) j(month)

reshape wide 


gen dif_mei_1_12 = mei12-mei1
```
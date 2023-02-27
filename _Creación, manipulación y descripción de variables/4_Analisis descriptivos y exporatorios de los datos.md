# Creación, manipulación y descripción de variables

### 4 ANÁLISIS DESCRIPTIVOS Y EXPLORATORIOS DE LOS DATOS

Hasta este punto hemos explorado una serie de comandos nuevos que nos permiten manejar los datos, reestructurarlos y hacer rutinas sobre ellos.  Ahora conoceremos algunos comandos estadísticos que nos permitirán conocer los estadísticos descriptivos básicos de las variables. De igual manera, crearemos tablas de una variable y tablas cruzadas para ahondar en la relación de las variables.

### 4.1 DESCRIPCIÓN DE LOS DATOS
Antes de conocer los estadísticos descriptivos puede ser útil conocer las descripciones generales de las variables que usamos. Para ello usaremos tres comandos:

- describe: Presenta información acerca del tipo de cada variable en la base así como su etiqueta.

- codebook: A diferencia de describe, este comando presenta información más detallada para cada variables como los valores que contiene o el total de datos faltantes en la base asi como el tipo de variable y la etiqueta.

- inspect: Este comando es más detallado que los previos. De manera adicional a lo ya planteado se presentan datos acerca de la distribución.

Estos comandos pueden ser realizados para todas las variables de la base de datos o para un conjunto de ellas. Usemos los tres códigos para la condición laboral de las personas encuestadas en el módulo de empleo de la ENAHO 2018.

```
* Cargamos el módulo 500 de la ENAHO

use "C:\Users\Usuario\Desktop\STATA_ECOPUCP\Creación, manipulación y descripción de variables/_enaho01a-2018-500", clear


* Información descriptiva de la base
describe ocu500
codebook ocu500
inspect  ocu500
```


![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332643317_1539464493214149_3939995763962610689_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=8rkRJa9IwMAAX_9FTHy&_nc_ht=scontent.flim30-1.fna&oh=00_AfAC24X9utvTRWnW3Pqf5mFYx7Zk8CA82CgLPvKg61J4fA&oe=63FC9564)


### 4.2 ESTADISTICOS DESCRIPTIVOS

Estadísticos descriptivos se refieren a estadísticos básicos como el promedio, la desviación estándar, la mediana, etc. que permiten identificar los principales momentos de las variables. El comando básico para realizar esta tarea es summarize. Encontremos los estadísticos descriptivos de la categoría ocupaciones y del ingreso total mensual deflactado:

```
* Estadísticos descriptivos de los datos

summ ocu500 i524a1
```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332700792_868917934276334_5342451533726479023_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=EVToV5oGzn0AX8SYqz8&_nc_ht=scontent.flim30-1.fna&oh=00_AfAp9kE9KHGPpQE27NHqmV7V-CevW0yJdMVOalY6yZXmxg&oe=63FCD4B4)

De esta manera obtenemos, el número total de observaciones sin datos faltantes (Obs), el promedio, la desviación estándar, el mínimo y el máximo.
Adicionalmente, podemos obtener más estadísticos descriptivos indicando la opción, detail:

```
summ ocu500 i524a1, detail
```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332389537_1835205813504136_7738966787699468758_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=M-8thARGnrAAX_v84o5&_nc_ht=scontent.flim30-1.fna&oh=00_AfD7owG0h1VwDQ8S21v0uW6jawRPVJDMhHPsFXxyH_xXrQ&oe=63FE2726)

Estos nuevos estadísticos son los percentiles, la varianza, el skewness y la curtosis.
También podemos usar el comando univar para obtener un resultado similar pero bajo otro formato:

```
* Se descarga univar
ssc install univar
univar ocu500 i524a1
```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332378458_567646951983612_7718706198941572646_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=EatfYeB-5UsAX8qq3Sl&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfDB1LYglC2DPvfUAwPtheCJDBEhxe36U-eno4x8kDtsNg&oe=63FCA7F6)

Este comando presenta los datos de percentiles de manera horizontal, a diferencia del summarize, detail.

### 4.3  TABLAS DE FRECUENCIA Y TABLAS CRUZADAS

Las tablas pueden representar las frecuencias de cada valor de una variable. De igual manera, se puede hacer tablas cruzadas para ver como cruzan las frecuencias de dos variables. Para ambas tareas se usa el comando tabulate. Para hacer tablas de frecuencia se debe indicar solo una variable mientras que para hacer una tabla cruzada se debe indicar dos:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332656879_8750988238306617_8938041147335306035_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=8rkL8rmBd9sAX9gQvkm&_nc_ht=scontent.flim30-1.fna&oh=00_AfAIL-zb7tV-04CTeaYRlcu3Wg4cYoTqwKYjhkx4LjdADA&oe=63FC634E)
![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332551346_6009536149069179_761584400452321647_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=a7yKErXCdvMAX-x2Q6B&_nc_ht=scontent.flim30-1.fna&oh=00_AfCa4du8eHZplXHiJmvC_6GemNnMwj8glbnPHKOtvZLxUw&oe=63FE1E27)

Veamos un ejemplo:
Hagamos una tabla de frecuencias para la condición laboral de las personas.

```
tabulate ocu5001
```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332595662_2136165963233867_2245716502985040698_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=wN2HNsuff-sAX-Vhwn6&_nc_ht=scontent.flim30-1.fna&oh=00_AfAY8MyEbRaZ4uHQyDLQwMzDmq2tMjqtv6Y6ZalxzyC2uA&oe=63FC96EC)

La tabla de frecuencia nos indica los valores de las variables, el número de veces que se repite (Freq), su porcentaje y su porcentaje acumulado.
Veamos ahora una tabla cruzada entre la condición laboral y el dominio geográfico:

```
tabulate dominio ocu500, row
```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332590194_773135237522281_4945085398179165434_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=Puqzw7ibSw8AX-iLIt3&_nc_ht=scontent.flim30-1.fna&oh=00_AfD2BBiGDlD4xC-PKvWi3FaoTXZu8Pey3S_vWd9HY4W5nA&oe=63FD1B2D)

En este caso usamos la opción row para indicar que se presente los porcentajes de cada celda de la tabla con respecto al total de la fila. Podemos hacer algo similar, pero con respecto a las columnas indicando la opción column.
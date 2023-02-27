# Conceptos Básicos

### 3 FUSIÓN Y ANEXIÓN DE BASES DE DATOS

Luego de cargar los datos y almacenarlos en formato ‘.dta’ podemos manipularlos de manera que se pueden combinar de dos formas distintas:

- Agregando nuevas columnas de datos (merge) o fusionando bases.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332484482_1174908040051558_3708022946485924759_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=X5UZJa1OfPgAX9BO1ye&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfCfrWOK4iMqk-rqOq_H-1zu8-YMOyUuKJ-g6ubN2iqmSw&oe=63FAB50F)

- Agregando nuevas filas de datos (append) o anexando bases.

![]https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332647018_565255762227704_4402999676162713662_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=nvVM_7ztiTQAX_CNjie&_nc_ht=scontent.flim30-1.fna&oh=00_AfCOn8wd-cKxTWpYEWgUniVL_4Ao3-ivjqtCE0Jye-an7g&oe=63FA65A6)

El comando exacto que usemos dependerá de en qué caso nos encontremos.

### 3.1 FUSIÓN DE BASES
Fusionar bases de datos implica combinar dos bases de manera horizontal con el objetivo de que la observación de una fila en la base inicial se ‘empate’ con las observaciones de otras filas de la base adicional. Este comando puede ser difícil de usar al comienzo debido a que presenta distintas opciones de acuerdo a los datos que se enfrente. Veamos las distintas opciones:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332660161_741258614080521_540482725756776377_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=FkweDN5hYfUAX8jMr7o&_nc_ht=scontent.flim30-1.fna&oh=00_AfABvkm1LhBrDnZVJBWSvQRfKxsd01XgoZy3CyGsLCfoAw&oe=63FBBF7D)

Estas opciones se diferencian en la manera en cómo fusionan las bases (1:1, m:1, 1:m). A pesar de esto, la sintaxis es similar.

#### 3.1.1 Identificador de la unidad de observación

Para ver las diferencias entre estas opciones debemos conocer previamente qué variable sirve como identificador de las observaciones en cada base de datos. ¿Qué significa esto? Que al abrir una base de datos debemos identificar o crear una variable (de preferencia numérica) que permita diferenciar una unidad de análisis de otra. Tomemos como ejemplo la siguiente base de datos sobre desigualdad en el mundo.
La unidad de observación es un país en un año específico por lo que es necesario tener o crear una variable que permita identificar a cada país en sus respectivos años.
Esta unidad de observación identificada (puede ser una variable o un conjunto de variables) se usa en la opción varlist. Por último, luego de using se debe indicar la base de datos secundaria que será cargada (indicando tanto el nombre como la dirección en donde se encuentra el archivo). Veamos el siguiente ejemplo:
Consideremos la siguiente base de datos macroeconómicos para una muestra de países africanos. La unidad de observación es un país en un año específico, por ejemplo, Angola en 1970. Para identificar esta observación nos enfocamos en dos variables: date y ifscode. Estamos considerando ifscode en vez del nombre del país porque en muchas operaciones se necesita un identificador que sea numérico.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332699194_756351139027323_3882696839058100820_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=J-oiN4h3gLwAX_rpXj-&_nc_ht=scontent.flim30-1.fna&oh=00_AfDi5UAD0wX61zad8tgI_DF11FvDYwicrzST1Exf5m0C4A&oe=63FC904E)

#### 3.1.2 1:1, m:1, 1:m

Luego de conocer esa variable (o conjunto de variables) que identifican a cada unidad de observación podemos analizar las diferencias entre cada opción del comando merge.

¿En qué se diferencia cada una? Veamos:

- Si la unidad de observación no se repite ni en la base inicial ni en la base secundaria, se usa:
merge 1:1 varlist using filename [, options]
- Si la unidad de observación se repite solo en la base inicial pero no en la base secundaria, se usa:
merge m:1 varlist using filename [, options]
- Si la unidad de observación se repite solo en la base secundaria pero no en la base inicial.
merge 1:m varlist using filename [, options]

Stata también permite la opción m:m, pero nunca debería de ser usada (debido a que no existe situación alguna en donde sea útil) por lo que ni siquiera será presentada. Veamos algunos ejemplos de cada caso a partir de los datos macroeconómicos:

##### 3.1.2.1 merge 1:1

La base de datos macroeconómicos para países africanos contiene datos del PBI real y la población para tres países. Nuestro objetivo es juntar estos datos con nuestra segunda base que contiene datos del índice de capital humano y el número de personas que son empleadas. Dado que la relación entre la unidad de observación entre la base de datos inicial (la de PBI real y población) es la misma que en la base secundaria usamos el comando merge 1:1:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332365641_1452417148623339_6562895280248185782_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=CKUrMWddbXAAX86aqM3&_nc_ht=scontent.flim30-1.fna&oh=00_AfA0N4NXjlGlHDccVr2YPrT4O1ByXZcKr7tkb9-0U7b91A&oe=63FBDC5B)

Luego de correr el código debemos de ver algunos resultados importantes tanto en la ventana de resultado como en el navegador de datos. El primer mensaje de interés es el siguiente: 

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332907492_531310008870952_5352821497948933570_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=ROurkebhL2YAX90ZfX1&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfBKr4F1nhO9A6OB63rqK45BdrrHKkkFzr4vnhDqKjP-sg&oe=63FAF79A)

En este mensaje encontramos el número de datos que logran (o no) empatarse. Como todos los datos se empatan no hay datos que estén en la fila de ‘not matched’. Si hubieran datos no empatados, estos serían de dos tipos: pertenecientes a la base inicial (from master) o pertenecientes a la base secundaria (from using). Adicionalmente, se crea una nueva variable, por default, llamada _merge que toma distintos valores de acuerdo a si empató (=3), no empató y pertenece a la base inicial (=1) o no empató y pertenece a la base secundaria (=2).

##### 3.1.2.1 merge m:1

Luego de juntar ambas bases deseamos agregar una nueva variable que indique la capital de cada país. En este caso la unidad de observación de la nueva base de datos ya no es un país en un año particular sino solamente un país (dado que la capital se mantiene fija en el tiempo):

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332703617_513379617644986_4876634959821850459_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=h7onpSgM3-cAX_hlydG&_nc_ht=scontent.flim30-1.fna&oh=00_AfAMKljxUU5ilcnln-09Hs23jvQKxMRqCmmqbwey9U7lTg&oe=63FAE9A5)

¡Ante esto, no podemos indicar que se junte 1 a 1 porque la unidad de observación es distinta! En cambio, debemos usar la opción m:1 (many to one o varios a uno). Esto significa empatar varios años de un solo país con la única observación del país en la base de capitales. Si corremos el nuevo código inmediatamente luego del código previo obtendremos el siguiente error:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332694117_5984534851611877_7154661999568518069_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=KNn5TbGNomwAX8OLkM-&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfAAF53GGCqGgmElkA98wBmG0CyEOR9lEE6A4Tfk9a5R-w&oe=63FBFCEC)

Debemos eliminar la variable _merge creada previamente con el comando drop _merge.

#### 3.1.3 Algunas opciones al momento de fusionar bases

Algunas opciones de gran utilidad al momento de usar el comando merge:

- keepusing:
Sirve para quedarse con solo un conjunto particular de variables de la base secundaria.
- nogenerate o generate():
Al indicar nogenerate se omite la creación de la variable _merge. Lo contrario sucede al indicar generate(), en este caso se crea la variable con un nombre distinto indicado entre paréntesis.
- noreport:
Con esta opción no se reportan los resultados en la ventana de resultados
- keep( ):
Esta opción sirve para indicar con qué sub grupo de datos quedarse. Por ejemplo, si se indica keepusing(3) solo se mantienen las observaciones que han empatado en ambas bases. Mientras que, de indicar 2 o 1 se mantienen los datos no empatados. Por default, se mantienen todos los datos.

### 3.1 ANEXIÓN DE BASES
La anexión de datos es útil cuando se quieren agregar nuevas filas de datos en una base inicial. La sintaxis es más simple que en el caso de fusión de bases. Veamos el comando a usar:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332436008_586789579717462_70087511852062260_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=4LlXrUNACWwAX8EZ9Rv&_nc_ht=scontent.flim30-1.fna&oh=00_AfBe8U5VEN8KkX4f3q4tR3vpS7CklvX-GIv2E3fKVcAfDw&oe=63FB6995)

Debemos indicar la base de datos secundaria a anexar en el espacio de filename. No es necesario que ambas bases compartan el mismo número de variables pero sí que cada variable que se desee anexar comparta el mismo nombre. Veamos un ejemplo:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332704201_931108714588014_4109013266152244932_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=uB3skWO6cNsAX_mbTiL&_nc_ht=scontent.flim30-1.fna&oh=00_AfAUNNmUiiuYIU2CSC66_3aC3XRNth8o_94_JIMbIew5nw&oe=63FBFA07)
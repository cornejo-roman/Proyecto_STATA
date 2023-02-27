# Conceptos Básicos

### 2 CREACIÓN E IMPORTACIÓN DE DATOS

Hay distintas formas de crear una base de datos. Repasemos tres formas:

- Creando una base de datos a mano en el editor de datos 
CPara acceder al editor de datos, escribimos ‘edit’ en la ventana de comandos. Esto nos permite editar ‘manualmente’ los datos como si fuera una hoja de cálculo. 

- Copiando y pegando los datos
Para copiar datos se debe acceder de la misma manera que en el punto previo. En el navegador de datos en modo de edición se pueden copiar datos usando las opciones conocidas como control+v o mediante click derecho. Hasta este punto se explotan las posibilidades del editor de datos como si fuera una hoja de cálculo (Excel).

- Creando una base de datos en el do-file
Crear una base de datos desde el do-file permite disminuir los posibles errores que se presenten al hacer las cosas ‘a mano’. En primer lugar, se debe establecer la extensión (en términos de filas) de la base de datos con el comando set obs seguido por el número de observaciones. A partir de esta ‘cáscara’ se crean nuevas variables. Veamos un ejemplo en la siguiente lámina

También podemos combinar estas formas.

#### 2.1.1 Usando el editor de datos para crear una base

Para asegurarnos que no tenemos ninguna base abierta usemos el comando clear en la ventana de comandos. Luego, abrimos el editor de datos con el comando edit en la ventana de comandos.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332700096_1252156802064620_8917215085994334101_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=MHQtjBbxsg4AX_vq2_2&_nc_ht=scontent.flim30-1.fna&oh=00_AfBWX7qefeMzthlRJVIxl2So2YKIipkDh5buky5duclAjg&oe=63FAD018)

Creemos una base de datos de los principales equipos de fútbol del Perú junto a su color característico y el número de veces que salieron campeones del Descentralizado imputando cada valor en el editor de datos:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332581516_1268855420334633_2607384605243036320_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=kk7lTrTpSOgAX-Hw5AD&_nc_ht=scontent.flim30-1.fna&oh=00_AfAhsWkFG09suo88Qp_3UrugpJApe7xYjuj-Y1vctYDzUg&oe=63FA626F)

#### 2.1.2 Copiando datos en el editor de datos

Antes de copiar una base, limpiemos el navegador de datos usando el comando clear en la ventana de comando. Abramos el excel de ejemplo, ‘cuadro-19-4, seleccionamos las filas que van desde Amazonas hasta Lima para todos los años de la siguiente manera:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332460037_944879089863965_1810047713913578392_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=yztcG208ofoAX-Cv1CJ&_nc_ht=scontent.flim30-1.fna&oh=00_AfBT8bJTJQl01iMhYQfFxtwixPpP_LoVcj6bOxxhyPUNuQ&oe=63F9C5AD)

Copiamos los datos usando ctrl+c. Ahora, se puede pegar directamente en el editor de datos usando ctrl+v.
Como vemos, luego de pegar aún se puede mejorar la base editando los nombres de las variables antes de guardarla.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332516909_1134043907289062_4803419034087822735_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=UzEUueSam4wAX-qzigP&_nc_ht=scontent.flim30-1.fna&oh=00_AfDEICCtqYEjZ5vo6lMWkFXIdib5WCsJFlHa-nKsOsxT9g&oe=63FAD770)

Editamos los nombres de cada variable para pulir la base antes de guardarla.

#### 2.1.3 Creando una base en el do-file

Abramos el editor de do-files. En este caso vamos a crear un cascarón (o shell) que definirá la extensión de los datos. Supongamos que estamos revisando archivos históricos y debemos de almacenar cada dato con algún comentario para doce meses de un año. Hacerlo a mano puede generar problemas para editar posteriormente. Así que lo hacemos dato a dato en el do-file. Veamos el ejemplo:

```
*--------------------------------------
*Crear la cáscara de una base de datos
*--------------------------------------

* Fijamos el número de observaciones

clear // Limpiamos el navegador de datos previos
set obs 12 // Se consideran solo 100 filas

gen value =.  // Valor a almacenar *estamos generando una variable vacia*

gen note = "" // Nota del valor almacenado se pone comilla porque trabajaremos con letra

gen mes = _n // Mes *se genera con n con el numero de cada espacio*

/* Reemplazamos los datos para cada mes 	*/

* Enero
replace value = 0.2 if mes == 1

replace note = "Los archivos históricos indican que ...." if mes == 1

* Febrero
replace value = 0.4 if mes == 2

replace note = "A diferencia del mes previo, ahora ..." if mes == 2
```

### 2.2 IMPORTANDO DATOS DE DISTINTOS FORMATOS

Para poder cargar datos a Stata es necesario saber el formato del archivo que se desea cargar. En base a esto, habrán dos tipos de soluciones: 

- Si los datos están en formato ‘.dta’ (el formato propio de Stata) entonces se usa el comando use seguido por la dirección en donde se almacena la carpeta.
- Otros formatos comunes son:
‘.xlsx’ o ‘.xls’ para Excel.
‘.csv’ (Comma Separated Values) para archivos almacenados como texto y separados por algún caracter (puede ser comas, punto y comas, espacios, entre otros).
También se puede cargar formatos menos comunes como ODBC, SAS, etc.

#### 2.2.1 Cargando una base de datos en formato de Stata

El comando para cargar bases en formato ‘.dta’ es use. 

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332521266_1235207670405489_5607491871254495075_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=dPCQ0jzZ6D4AX-7zaTc&_nc_ht=scontent.flim30-1.fna&oh=00_AfDRYxpt25WJTi2NOlV61JBzLHb9rE9dDuRQQLUUfHBTpw&oe=63FB3E2A)

Para usarlo es necesario indicar el nombre del archivo junto a la dirección de la carpeta en donde se encuentra guardado. Para que la base sea cargada de manera correcta es necesario no tener alguna base previa. La opción clear luego de la coma permite limpiar el navegador de datos de cualquier base previa. De esta manera se puede cargar la base. De no indicar esto, aparecerá una advertencia en la ventana de resultados indicándonos que no podemos cargar la base. Veamos un ejemplo.

##### 2.2.1.1 use filename, clear

El comando use se usa para cargar no solo bases que estén físicamente en alguna carpeta de la computadora, también sirve para cargar datos que ya se encuentren en internet. Este es el caso del ejemplo inicial sobre uso de do-files. Veamos un caso más común en donde se tiene un archivo en alguna carpeta de la computadora:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332378463_591553792498617_80423536740893636_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=mnB-Xiz3hroAX87LqGP&_nc_ht=scontent.flim30-1.fna&oh=00_AfD_mu-y-5hj1HtnXiPZAh60yOdl5idFzTc_d_ravoqfOw&oe=63FB18CD)

#### 2.2.2 Importar archivos de Excel

Una alternativa a copiar y pegar desde excel es cargar la misma base desde Excel respetando su formato original. Esto permite disminuir los posibles errores humanos que puede haber al manipular los datos. Para ello, usamos el comando import Excel de la siguiente manera: 

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332694896_688252706379763_5954638655148762183_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=PdqbkvMJMccAX-BVM_w&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfAShd_KdZe5kO8Dc8kZCnoMdp0o64IIvcb3JIgtT0HG5Q&oe=63FB5EEB)

Podemos usar el comando de manera similar al use al indicar la carpeta de origen de la base de datos. En este caso es necesario identificar el formato exacto que será cargado, esto es, si es un archivo ‘.xlsx’ o ‘.xls’ (el formato ‘.xlsx’ es más moderno que ‘.xls’). 
Adicionalmente, hay distintas opciones que se pueden indicar luego de la coma (además del ya conocido clear):

- sheet("sheetname"): Si se tienen distintas pestañas en un mismo archivo, podemos cargar una en específico indicando su nombre en sheetname (entre comillas).
- firstrow: Permite tomar la primera fila de los datos como nombre de las variables. Si no hacemos esto, la primera fila será considerada como datos generando problemas en la base.

#### 2.2.3 Importar archivos ‘.csv’

Los archivos ‘.csv’ son archivos de texto (esto significa que pueden abrirse en cualquier editor de texto como Bloc de notas o Word) en donde los valores de las variables están separadas por algún carácter. Por ejemplo, por comas o punto y comas:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332379626_507269281569202_6861443367771183789_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=Fv-Jww5XrokAX9Gcnjl&_nc_ht=scontent.flim30-1.fna&oh=00_AfB6DEDHLwMAxIxzRsdWgOrAh08dMHsbwl5T7il2nlOnsA&oe=63FB34F6)

Por ejemplo, se tiene datos de longitud y altitud separados por comas. Para conocer qué tipo de carácter está siendo utilizado como separador podemos abrir el archivo desde el bloc de notas.

#### 2.2.4 Importar delimited filename, delimiters("chars")

El comando usado para cargar archivos ‘.csv’ es muy similar al usado para cargar bases en excel. Hay una diferencia principal. En este caso es necesario indicar qué carácter está siendo usado como separador con la opción delimiter(" "). Dentro del paréntesis debemos indicar el caractér, por ejemplo: delmiter(",") o delmiter(";")

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332688224_875661640329920_3372800927429218119_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=dIM5EN4zJWEAX9ISNHc&_nc_ht=scontent.flim30-1.fna&oh=00_AfDG6aKfRYzjx5zddMdmVbK1xjAu5zgo3hy81JFKhCtdHA&oe=63FB83F2)

Al igual que en el caso de archivos de Excel, es necesario indicar la extensión del archivo al momento de indicar la dirección y el nombre. Por último, esta sintaxis también permite cargar archivos que tengan la extensión ‘.txt’ o ‘.tex’. Veamos un ejemplo de todo lo presentado:

```
* Usamos el comando 'use' para cargar una base .dta

use "D:\MARIA CLAUDIA\Descargas\Material_Stata\1\data\OSIPTEL_personas", clear	// Cargamos una base almacenada en la computadora

use "https://www.stata-press.com/data/r16/census5", clear // Cargamos una base almacenada en internet

* Ahora, cargemos una base en ambos formatos de Excel
import excel using "D:\MARIA CLAUDIA\Descargas\Material_Stata\1\data\ERM2014_Candidatos_Provincial.xlsx", clear firstrow // formato excel 
	
* Otros formatos
import delimited using "D:\MARIA CLAUDIA\Descargas\Material_Stata\1\data\IOP_1118_01_D.csv", delimiter(",") clear // formatos .csv

import delimited using "D:\MARIA CLAUDIA\Descargas\Material_Stata\1\data\IOP_1118_01_D.txt", delimiter(",") clear // formatos .txt 
```
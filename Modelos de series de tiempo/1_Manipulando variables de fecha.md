# Modelo de series de tiempo

## 1.  MANIPULANDO VARIABLES DE FECHA
---------------------------------

Para que se pueda tomar ventajas del conjunto de funciones que trae Stata se debe declarar previamente que el conjunto de datos son una serie de tiempo. Previamente hemos visto algo parecido al momento de declarar el diseño muestral de una encuesta- En este caso, la identificación es más fácil. Necesitamos saber cuál es la frecuencia de los datos, es decir, si son anuales, trimestrales, mensuales, por hora, por minutos, etc. Darle formato a la variable y usarla para declarar a los datos como de serie de tiempo usando el comando tsset. Veamos un ejemplo con datos simulados:


### 1.1 DATOS DE TIEMPO

Las series de tiempo pueden estar en distintas frecuencias, cada tipo de frecuencia puede ser cargada en Stata bajo un formato específico. Veamos los casos más importantes, datos trimestrales, datos mensuales y datos diarios (en el caso de datos anuales toda la discusión se hace mucho más fácil ya que no es necesario darle un formato especial).

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332649813_635566565243266_1823493868681243854_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=pZRyiWFBsNcAX8n7CAt&_nc_ht=scontent.flim30-1.fna&oh=00_AfBwCrq5V_rTK5DF3CXRK0C-aYghmYhn-PzY0n5FFJ58uA&oe=640593ED)

Como vemos cada variable mide una frecuencia distinta. La primera comienza en el primer trimestre de 1960 (1960q1), mientras que la segunda comienza en enero de 1960 (1960m1) y la última serie comienza el primero de enero de 1960 (01jan1960, en donde jan viene de january o enero en inglés).
Hay distintos formatos que se pueden considerar, desde milisegundos hasta años: 

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332502622_543665674528853_9020840699273143377_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=W-H45PyLam0AX8ioQh_&_nc_ht=scontent.flim30-1.fna&oh=00_AfCckfjOG3H5YjRI8SO2aaKn66P0Qb9QINRqatBi8pAyXg&oe=64057A99)

En el siguiente código vemos algunos ejemplos de cómo crear series. Primero establecemos el tamaño de la base (set obs 100), luego creamos las series considerando los distintos formatos. En este punto usamos tres tipos de funciones: tq(), tm() y td(). Cada una de ellas crea un dato inicial para la fecha que se indica. Luego sumamos la posición de la fila con _n y restamos uno (para que la lista comience en cero). Posteriormente, damos formato a la serie usando los códigos de la lista. Por último, usamos el comando tsset para declarar a la base como de serie de tiempo. Veamos este último código.
Cuando creamos datos desde cero solo se generan unos valores numéricos. Para que se vean como en las imágenes previas tenemos que darle formato. Ahora, para todo tipo de frecuencia el valor 0 se establece para la primera observación de 1960. Es decir 1 en frecuencia mensual significa 2 de enero de 1960 mientras que 1 para frecuencia mensual significa febrero de 1960. Contrariamente -1 bajo frecuencia trimestral significaría el último trimestre de 1959. Bastante ojo con esto. Luego haremos algunos ejemplos de como definir las series temporales cuando los datos ya vienen en otros formatos de cadena desde la fuente original. Por ejemplo, cuando cargamos desde excel una base que dice "2019 Trimestre 4".

```
```

#### 1.1.1 tsset

Luego de crear las series usamos la nueva variable para declararla como la variable temporal. 

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332379626_1260754011539141_4107733684258095563_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=qUq6LW5doMcAX_2rgeM&_nc_ht=scontent.flim30-1.fna&oh=00_AfBcE32e8cp4gJp_NQT9rTReoPH4NVx84gCqg4xwI4Vavg&oe=640624C6)

Declarar la base de esta manera nos permite usar un conjunto de funciones y comandos creados específicamente para series temporales que revisaremos posteriormente en esta semana. Hasta este punto, ya conocemos los tipos de formatos que hay y la necesidad de declarar los datos como series temporales. Ahora, vamos a ver cómo manejar series de tiempo cuando la variable de tiempo está en otro formato tanto en string como en números. Este es un problema bastante recurrente por lo que analizaremos distintos problemas tipos.

### 1.2 ARREGLANDO LOS FORMATOS DE DATOS TEMPORALES

Tomemos la siguiente base de datos como ejemplo. En este caso no tenemos los datos de manera directa. Cada columna presenta las variables de fechas en distintos formatos.

![]()

- fecha1: Fecha string en formato en inglés, primero mes luego día y al final el año.
- fecha2: Es similar al previo pero tiene el mes en iniciales en inglés.
- fecha3: Se tiene la fecha en números pero sin algún tipo de separador.
- fecha4: Similar al previo pero los días y meses menores a 10 no comienzan con cero.
- fecha5: Similar a la segunda columna pero con las iniciales en español.


Veamos cómo manejar estas fechas para que tengan el formato de series diarias. Cargamos la base con las fechas de ejemplos.

```
```

- La solución para los dos primeros casos es bastante directa, podemos usar el comando date() para indicar el orden de los componentes de la fecha. Por ejemplo "MDY" para mes - día - año (como en el formato en inglés). Si quisiéramos pasarlo al formato usual en español comenzaríamos indicando el día, luego el mes y por último el año ("DMY"). 
- En el caso de fecha3 tenemos que hacer un paso previo. Si queremos usar el comando date() tenemos que tener la serie en forma string() por lo que usamos el comando tostring(fecha3), replace para que reemplace la variable fecha3 con sus mismo valores pero en string.

```
```

- En todos los casos, luego de generar los valores tenemos que darle formato usando el comando format seguido por %td para indicar que son diarios.
- La variable fecha4 puede ser confusa. Por ejemplo, 202011 indicaría el primero de enero del 2020 pero 2020111 puede ser el 11 de enero o el 1 de noviembre. En el ejemplo tenemos valores bastante directos, para crear la nueva variable separamos los valores de día, mes y año usando el comando substr(), previamente tenemos que pasarlo a string para que pueda ser segmentada. Con cada elemento listo, lo volvemos a pasar a números usando el comando destring(). Con esto, usamos el comando mdy() parecido a date() pero en donde indicamos cada componente de la fecha diaria. Ojo: Cuando tengan casos más confusos deben ver alguna manera de solucionar esos problemas.
- En el último caso, tenemos las fechas en español por lo que podemos usar el comando subinstr() para reemplazar las iniciales de la fecha.

Hay muchas opciones y funciones adicionales que se pueden usar de acuerdo a la frecuencia de la serie. 

```
```

Algunas de ellas sirven cuando tenemos los datos en formato string otros cuando los datos están en valores numéricos. Una operación adicional que se puede hacer es crear variables nuevas con otros formatos. Por ejemplo, podemos crear una variable que indique en qué trimestre del año se encuentra la fecha diaria. Veamos algunos ejemplos de cómo cambiar la frecuencia de la serie:

- En este ejemplo hacemos algunos cambios. Primero pasamos de día a trimestre, luego de día a mes y, por último, de día a semana. En los dos primeros casos usamos las siguientes funciones: qofd() y mofd() mientras que en en último caso usamos una función presentada previamente, yw(). 
- Podemos indentificar a qofd() y mofd() a partir de la primera y última letra. En el primer caso sería, quarter of day y luego sería month of day. Hay una familia extensa de este tipo de funciones que se puede revisar si necesita hacer algún cambio en este sentido. Por ejemplo, aquí.

```
```
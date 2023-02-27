# Creación, manipulación y descripción de variables

###  3 CREANDO RUTINAS CON LOOP

Los bucles o loops permiten repetir tareas de acuerdo a ciertas indicaciones. Por ejemplo se puede repetir una operación para una serie de valores de una variable o un número determinado de veces. Para hacer estos bucles podemos usar distintos comandos, veamos algunos de ellos:

- forvalues: Se repiten las operaciones por un número pre determinado de veces
- foreach: Se repite la operación para un conjunto de ítems pre determinados, es ligeramente distinto al forvalues.
- while: Se repite la operación hasta que se cumple cierta condición, por ejemplo que una variable no pase cierto umbral. 

Antes de entrar a fondo a las opciones de bucle debemos conocer las ‘macros’ que se pueden crear. Se denomina ‘macros’ a resultados predefinidos por el usuario o por el programa. Estas pueden ser de dos tipos: local o global.

- local: Una macro local solo existe dentro del programa que la refiere y no puede ser referenciada en otro programa.
- global: Una macro global es similar a una macro local pero una vez definida se mantiene en la memoria hasta que se cierre la sesión de Stata. Para referirnos al contenido de una global usamos su nombre junto al signo de dólar. 

Veamos algunos ejemplos de su uso en la práctica.

Carguemos la base de OSIPTEL. Sobre esta base usaremos, en primer lugar, un local llamado var que refiere a tres variables de interés: la condición de pobreza, el nivel socio económico y la ocupación de cada persona encuestada. Para llamar a este local se debe escribir dentro de los caracteres mostrados en el código. También se puede usar ambas macros no sólo para almacenar variables sino también para almacenar conjunto de texto. En el ejemplo vemos cómo se puede guardar las opciones de gráfico de un gráfico de dispersión para luego ser usada dentro de un bucle. A diferencia del local, un global se llama usando el signo de dólar.

```
local var pobreza nse ocupacion

summ `var'

global scatter_opciones `" xtitle("Ingreso Total", size(medlarge))  mcolor(red) msize(*0.5) "'

foreach x of local var{
	scatter `x' ingreso_total, $scatter_opciones name(`x', replace )
}
graph combine  pobreza nse ocupacion
```

El resultado final, es un conjunto de gráficos a partir del local definido inicialmente usando la configuración de gráficos del global.
La forma de uso de ambas macros es bastante diversa. En los siguientes casos de bucle veremos algunas formas adicionales.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332576112_1152018182163367_883477263878788508_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=Dt8DyJg4yxEAX_yWU3H&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfBjUYH1sy8nM1G4GuPsI0OFhOPP__hejhaJa8aJC43gqA&oe=63FCA62F)


### 3.1 FORVALUES

Para hacer un loop se necesita indicar algún indicador que permita identificar en dónde se repetirá la operación. Ese indicador puede ser i, j o cualquier letra que facilite la identificación. Adicionalmente, es necesario indicar el número de veces que se realizará la rutina a través de un rango.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332543668_773480133777686_520689159187209607_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=4pTQtBfzxnoAX_ceqg2&_nc_ht=scontent.flim30-1.fna&oh=00_AfDDlB-Tmw84C7fGWgxn5GA3Ldso_-aFNT5ydl-SaHE7Kw&oe=63FD3183)

Veamos un ejemplo con los datos del índice del Fenómeno de El Niño visto previamente para facilitar la comprensión:

En este ejemplo primero necesitamos hacer un reshape a la base inicial para facilitar el uso. Luego se desea hacer gráfico de los valores del índice para cada los meses de cada año comenzando en 1950 y terminando en el 2010 con intervalos de 20 años.

```
* Cargamos la base de datos

use "$MEI", clear

reshape long mei, i(year) j(month)

/*		forvalues 		*/

forvalues i = 1950(20)2010{

	summ mei if year == `i' 
	sort year month
	line mei month if year == `i', name(g`i', replace) title("`i'") ytitle("MEI") ///
	xtitle("") xlabel(1(1)12,grid) ylabel(,grid) 	
}
graph combine g1950 g1970 g1990 g2010, ycommon title("Índice del Fenomeno del Niño", size(*0.8))
```

Primero indicamos que nuestro indicador será la letra i. Luego, indicamos el rango. En este caso indicamos que se comience en 1950 en intervalos de 20 años hasta el 2010. El número entre paréntesis es el intervalo de años elegido. Una vez establecido esto, debemos escribir la rutina o conjunto de comandos entre corchetes, { }. Nuestra rutina consiste en obtener los estadísticos descriptivos de la serie para cada año elegido y un gráfico del indicador para los meses dentro de cada año2. OJO: Estamos usando el indicador no solo para repetir una rutina sino también para indicar sobre qué sub grupo hacer la rutina, esto es, sobre el grupo de años elegido previamente. La ‘i’ es reemplazada por el número determinado previamente.
Posteriormente, podemos juntar los cuatro gráficos generados dentro del bucle para armar un solo gráfico que nos presente las distintas tendencias del índice a lo largo del tiempo.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332481997_1391716091684159_4872517281577169220_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=igjcuGywT8YAX8STRL_&_nc_ht=scontent.flim30-1.fna&oh=00_AfDMf39gWKjUsA7lybI4JBV9m7nsJUKEWMW1AMSte0vF2g&oe=63FD4054)


### 3.2 FOREACH

El comando foreach permite hacer un bucle sobre distintos ítems:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332502888_1283771052174069_4656144886925164221_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=CQRPTjmFVioAX8O3OT4&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfApTg5PH_zPg_Bld36sYQBMeurWvrdQkgvg4okW2SVHjg&oe=63FD9151)

Estos ítems pueden ser local; global ; varlist o lista de variables; o, numlist o lista de números. Este último es similar a forvalues.
Veamos un ejemplo. En este caso queremos graficar la variación del MEI para cuatro meses: Enero, Abril, Julio y Octubre. Luego de regresar al formato wide de la base de datos podemos hacer un bucle foreach sobre las variables de interés, en este caso mei1 para enero, mei4 para abril y así.

```
reshape wide 


/*		foreach 		*/

* varlist
foreach x of varlist mei1 mei4 mei7 mei10{
	local mei1 "Enero"
	local mei4 "Abril"
	local mei7 "Julio"
	local mei10 "Octubre"
	line `x' year , name(p`x', replace) title(``x'') xtitle("") ytitle("MEI") ///
	xlabel(1950(5)2010 2011, grid labsize(*0.5) angle(60))
}
graph combine pmei1 pmei4 pmei7 pmei10, ycommon title("Variación de MEI para cada mes")
```

A diferencia del caso anterior ya no hacemos un bucle sobre número, ahora lo hacemos sobre una lista de variables. Es por esto que debemos incluir varlist en parte del código. Adicionalmente, decidimos elegir como indicador a la letra x en vez de la i, pero la letra específica no es de interés.
Con los gráficos podemos hacer una combinación como en el punto previo para presentarlo de mejor manera.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332705320_1488270541578067_8908275477080441571_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=oGuxyzSDKL0AX9zG3CV&_nc_ht=scontent.flim30-1.fna&oh=00_AfCjpVDLCbeLMN28WLSL666oMBChIKF5NJN_Tht8iIg-8g&oe=63FCCF6A)

Podemos hacer lo mismo pero usando la opción numlist de la siguiente manera:

```
* numlist
foreach x of numlist 1 4 7 10{
	local 1 "Enero"
	local 4 "Abril"
	local 7 "Julio"
	local 10 "Octubre"
	line mei`x' year, name(p`x', replace) title(``x'') xtitle("") ytitle("MEI") ///
	xlabel(1950(5)2010 2011, grid labsize(*0.5) angle(60))
}
graph combine p1 p4 p7 p10, ycommon title("Variación de MEI para cada mes") 
```

Como se usa una lista de número en vez de una lista de variables sólo elegimos los números que dirigirán el bucle. Para poder hacer esto es necesario tener cierto orden sobre las variables en términos de los números que agregamos en sus nombres. En general, el comando foreach permite una mayor gama de opciones.

### 3.3 WHILE

El comando while repite las indicaciones hasta que se cumpla con la condición matemática que se indica. Veamos un ejemplo: 

```
local iterar = 1

while `iterar' <= 6 {
	local year_l = `iterar'+1949
	line mei month if year == `year_l', title(`year_l') xlabel(1(1)12, grid) ///
	ytitle("MEI")  xtitle("") name(l`iterar', replace)
	local iterar = `iterar' + 1
}
graph combine l1 l2 l3 l4 l5 l6, ycommon title("Variación de MEI en los primeros 6 swaños")
```
En este caso se crea un local igual a 1 y se pide que se repita la iteración hasta que logre ser 6. Para ello se va actualizando el valor del local al final. De esa manera se ‘avanza’ en la iteración.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332698423_457585019828752_835149073548349677_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=0dL5zpBiRecAX9zV_R0&_nc_ht=scontent.flim30-1.fna&oh=00_AfBe6DvOavUPJp7PyOmWztHY_E874HXZjqewDOHOczMVxA&oe=63FD92E3)

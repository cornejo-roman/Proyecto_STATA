# Modelo de series de tiempo

## 1.  OPERADORES DE REZAGOS, ADELANTOS Y DIFERENCIAS
---------------------------------

Un conjunto importante de operadores que se vuelve disponible cuando se usa tsset con los relacionados a los rezagos, los adelantos y las diferencias. Veamos este operador en términos de ecuaciones:

- Rezago: Indica el valor de un periodo previo y se indica con el prefijo l(1).x

*gt=ln(y)t - ln(y)t-1*

- Adelanto: Indica el valor de un periodo posterior y se indica con el prefijo f(1).x

*gt+1=ln(y)t+1-ln(y)t*

- Differencia: El prefijo d(1).x sirve para tomar la resta entre dos periodos distintos

*gt=ln(y)t-ln(y)t-1*

Antes de presentar los ejemplos vamos a limpiar las bases de datos. Usaremos el PBI peruano tanto en frecuencia anual como en frecuencia trimestral.
Carguemos la serie anual del PBI Gasto del Perú desde la página de BCRP. Limpiamos y ordenamos la serie y nos quedamos con los cinco componentes del PBI Gasto: Consumo, Inversión, Gasto Público y Exportaciones Netas. 

```
```

En el caso anual, la variable de tiempo es el año de manera directa. Veamos el caso trimestral.

En el caso trimestral, la variable de fecha no viene en el formato deseado por lo que tenemos que hacer una limpieza previa. 

```
```

Extraemos el valor del año y el número del trimestre. Como solo se tiene dos dígitos del año tenemos que pasarlo al valor completo agregando los números que faltan. Con el año y el número del trimestre podemos usar una función ya conocida yq() para obtener el valor del trimestre. Guardamos casa una de las bases para usarlas cuando lo necesitemos. Ahora, veamos cómo usar rezagos.

### 2.1 REZAGOS

El operador de rezagos permite crear o usar un valor rezago de una variable. A partir de los datos anuales vamos a crear series rezagadas del PBI. Para indicar el número de rezagos podemos agregar un número al operador. Por ejemplo, l2.lnpbi sería el 2do rezago del logaritmo del PBI.

```
```

Si hacemos un gráfico line de las series rezagados podemos ver el número de años que cada serie se retrasa.

![]()

Cuando tenemos datos trimestrales puede ser útil definir a los rezagos de una variable no como los valores inmediatamente previos sino como los valores pasados de cada uno de los trimestres. Por ejemplo, cuando se compara el primer trimestre del 2019 con el primer trimestre del 2018.

![]()

En este caso, para comparar los valores del primer trimestre de cada año usamos l4.lnpbi. Si tuviéramos datos mensuales tendríamos que usar l12.lnpbi, por ejemplo.
Al momento de querer graficar estas nuevas series nos topamos con un problema. Si usamos la opción xlabel() de manera usual terminaríamos con un gráfico errado. Para que el código tenga sentida se puede agregar expresiones entre comillas con los formatos deseados. Por ejemplo, indicamos que son quarters/trimestres ‘q()’ y luego damos formato de trimestre. 

```
```
Esta opción es, definitivamente, más compleja y extenuante. Luego veremos cómo integrar los datos de series de tiempo a gráficos. Por el momento sigamos con esta lógica.

### 2.2 ADELANTOS

Con el operador de adelantos, f.var podemos tomar los valores adelantados de las variables. Tomemos el caso de los datos trimestrales del PBI. Creamos una serie con los valores de los mismos trimestres, pero de años posteriores: 

![]()

Complementemos los operadores de rezagos y adelantos con el operador de diferencias.

### 2.3 DIFERENCIAS

El operador de diferencias toma la resta de una misma variable un número de períodos dados. Tomemos la base anual del PBI y construyamos la tasa de crecimiento usando tanto el operador de diferencias como los operadores de rezago. Recordemos que la tasa de crecimiento puede definirse de la siguiente manera:

*gt=ln(y)t - ln(y)t-1*

![]()

Luego de crear el logaritmo del PBI, podemos crear la tasa de crecimiento tomando de manera manual la diferencia lnpbi - l1.lnpbi o podemos usar el operador de diferencias para obtener lo mismo, d.lnpbi. Ojo: si indicamos un número mayor de diferencias, por ejemplo d2.lnpbi, estamos considerando la 2da diferencia del PBI es decir:

d2.lnpbi=(ln(y)t-ln(y)t-1 - (ln(y)t-1-lN(y)t-2)

Tomemos la base trimestral y comparemos si podemos obtener la tasa de crecimiento Q-Q usando el comando de diferencias.

![]()

La última línea de código no genera la tasa de crecimiento sino la diferencia de la diferencia de la diferencia de la diferencia del ln(y). También podemos combinar los operadores. Si queremos obtener la tasa de crecimiento rezagada en la base anual del PBI podemos usar l.d.lnpbi.

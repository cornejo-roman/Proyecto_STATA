# Modelo de series de tiempo

## 4  FILTROS Y SUAVIZACIÓN DE SERIES
---------------------------------

El concepto de filtro proviene de la literatura de la ingeniería. La idea es tomar como insumo una serie (o una señal) y procesarla considerando los valores rezagados para generar una nueva serie, es decir una serie filtrada. Consideremos la siguiente ecuación:

yt=ψLxt

En donde ψ(L) es una función que considera los rezagos (L) de la serie insumo, xt, para generar una serie output, yt. Esta operación puede ser muy compleja y suponer operaciones matriciales avanzadas o ser mucho más simple como sacar los promedio de los valores rezagados. Vamos a ver dos conjuntos de filtros. Primeros los llamados moving average y luego una colección de filtros más complejos.

### 4.1 FILTROS MOVING - AVERAGE, TSSMOOTH

Los filtros moving average tienen la siguiente forma:

![]()

En donde xt es la serie nueva, wi son pesos para cada observación y xt es la serie input. Los valores f y l indican el número de rezagos a considerar a la derecha y a la izquierda. Si no tenemos ponderadores el filtro solo toma un promedio simple de los datos, por ejemplo: 

![]()

Consideremos que tomamos un moving average de cinco periodo, es decir, dos periodos previos, el periodo actual y dos periodos posteriores:

![]()

Para implementar el moving average usamos el comando tssmooth ma seguido por la variable. Adicionalmente debemos indicar los valor l y f de la ecuación vista previamente. Para eso usamos la opción window(#l,#c,#f) en donde #l indica el número de rezagos hacia atrás, #c se reemplaza por 1 cuando se quiere considerar el valor actual y 0 en caso contrario, #f indica los adelantos a considerar. Usemos esta función para crear la serie moving average de cada componente del consumo considerando una ventana de 5 periodos.

```
```

Comparemos la serie original con la serie nueva

![]()

La serie con línea punteada indica los valores reales en cada trimestre mientras que la serie sólida indica la nueva serie moving average. Como se observa en el gráfico, el filtro ‘suaviza’ los valores de la serie.

### 4.2 OTROS FILTROS, TSFILTER

Ahora veamos otro conjuntos de filtros disponibles en Stata bajo el comando tsfilter:

- tsfilter hp para el filtro Hodrick - Prescott
- tsfilter bk para el filtro Baxter - King
- tsfilter cf para el filtro Christiano - Fitzgerald
- tsfilter bw para el filtro Butterworth

A diferencia del moving average, estos filtros generan por lo menos dos series nuevas, usualmente se identifica a estos componentes como ciclo y tendencia. Veamos cada filtro por separado y luego comparemos los resultados.

#### 4.2.1 tsfilter hp

El filtro Hodrick-Prescott o filtro HP es un filtro bastante usado en la literatura (también bastante criticado, por ejemplo, en Hamilton). Este filtro sigue la siguiente ecuación:

xt=zt+τt

En donde a partir de xt, la serie inicial, se crean dos series nuevas: una tendencia, τt, y una residuo o ciclo, zt. Para obtener estos componentes de minimiza la siguiente función con respecto a τt

![]()

En donde λ indica un parámetro de suavizamiento a seleccionar de acuerdo a la frecuencia de los datos. Usualmente se considera λ = 1600 para datos trimestrales, λ = 129600 para datos mensuales y λ = 6.25 para datos anuales.
Vamos a descomponer o filtrar la serie trimestral del PBI en dos partes: un ciclo (o componente residual) y una tendencia. 

![]()

En este caso debemos indicar el nuevo nombre del componente, en este caso PBI_ciclo, y la serie de la cuál se extraerá, PBI. También debemos indicar el valor que tomará el parámetro λ, en este caso 1600, y si queremos que se cree una nueva variable con el componente tendencial, trend(PBI_tendencia). Esta rutina generará dos nuevas variables:
PBI_ciclo y PBI_tendencia. Grafiquémoslas

![]()

Como vemos, el componente tendencial no tiene los picos y valles presentes en la serie inicial.

![]()

La serie del ciclo o el residuo es igual a la resta de las series previas. Recordemos que 

zt=xt-τt

#### 4.2.2 tsfilter bk

En contraste al filtro HP, el filtro Baxter - King (BK) es un filtro de pase de banda (particualrmente, de highpass). La definición estadística exacta del filtro supero los límites del curso. A pesar de esto, podemos establecer algunos criterios para poder usar la serie dado que hay varios componentes que se deben elegir. El comando tiene la siguiente forma 

![]()

Al igual que el filtro HP debemos de indicar el nombre de la serie ciclo y de la serie tendencia. Adicionalmente, debemos indicar algunos componentes nuevos. En este caso minperiod() y maxperiod(). Ambos son parámetros que hacen referencia a la extensión de los ciclos considerados. Los valores introducidos son los propuestos para datos trimestrales de acuerdo a Baxter y King. Ahora, este filtro requiere hacer una revisión teórica previa para poder entender exactamente su procedimiento por lo que les recomiendo (si están bastante interesados en el tema) revisar un libro de econometría de series de tiempo. El resto de filtros también van a introducir nuevos conceptos estadísticos que requieren de un estudio previo, Ojo con esto.
Veamos las nuevas series generadas. 

![]()

A diferencia del filtrado HP, la tendencia estimada es mucho menos suave. Esto también se refleja en el componente cíclico.

En este caso, el ciclo aparece menos volátil que en el caso HP.

![]()

Otra diferencia se encuentra en que al usar el filtro BK eliminamos observaciones de los extremos.

#### 4.2.2 tsfilter cf

El filtro Christiano-Fitzgerald también es un filtro de pase de banda con un procedimiento distinto a los filtros previos.

![]()

Los argumentos son similares a los de Baxter-King, se puede seleccionar los periodos mínimos y máximos así como el número de observaciones que contribuyen al filtro con smaorder(). De nuevo, para mayor comprensión de la parte netamente estadística del filtro se debe revisar algún libro de econometría de series de tiempo. Veamos las series que se construyen.

![]()

#### 4.2.2 tsfilter bw

Por último, el filtro Butterworth es una opción adicional que tiene el comando tsfilter. No es tan usado como el resto de las opciones. 

![]()

Si comparamos las series generadas, la tendencia es más suavizada y el ciclo más volátil Hay más opciones de filtro de series, algunas más complejos como el filtro de Kalman u otros más simples en adaptar a stata como el filtro de Hamilton (ssc install hamiltonfilter).
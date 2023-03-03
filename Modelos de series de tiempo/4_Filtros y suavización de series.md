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


```
```
# Modelo de series de tiempo

## 7.  PRONÓSTICO
---------------------------------

Un valor pronosticado se puede ver como el estimador de la variable dependiente, ![]() yt. Este puede ser obtenido tanto dentro del rango de los datos (in-sample) como para valores de fechas fuera de los datos (out-of-sample).
En nuestro caso los datos están fijados entre 1994m7 y 2020m5. Los datos out-of-sample partirán desde 2020m6. Para generar los nuevos valores debemos expandir el tamaño de la base de datos con el comando. Siendo estrictos, llamaríamos a los valores dentro de la muestro como predicciones y a los valores fuera de la muestra como pronósticos.
Vamos a generar los valores para dos años a final de la muestra, es decir, desde 2020m6 hasta 2022m5. Para generar los nuevos espacios dentro de la muestra usamos el comando tsappend, add(24). Cómo usamos meses, 2 años equivalen a 24 meses.

![]()

Para generar el pronóstico usaremos un conjunto de comandos forecast. Para ello corremos el modelo y guardamos los resultados con estimates store seguido por el nombre que queremos ponerle, por ejemplo, ar. 

```
```

Seguimos los siguientes pasos:
- Nombramos el modelo que queremos pronosticas. En este caso, la llamamos arma. Para ello usamos el comando forecast create arma 
- Seleccionamos los datos previamente estimados y almacenados como ar. Para eso usamos forecast estimates ar.
- Opcionalmente podemos ver las variables consideradas en usando forecast describe
- Por último, estimamos el pronóstico con el comando forecast solve.

Veamos la base de datos

![]()

El resultado crea dos variables f_ti_g y _est_ar. El primero indica los valores pronosticados y la segunda es una dummy que indica si el pronóstico está dentro (1) o fuera (0) de la muestra. Como vemos los valores dentro de la muestra son iguales a los valores observados.
Grafiquemos los valores pronosticados:

![]()

La línea en rojo indica los valores pronosticados. Veamos el código que usamos:

```
```

Usamos twoway para graficar la serie de pronóstico fuera de la muestra junto a los datos observados. Adicionalmente cambiamos los colores de cada serie y editamos los ejes y títulos. Adicionalmente, usamos un comando nuevo tline para graficar una linea en un periodo específico. En este caso, creamos una linea en la última fecha.
Ahora veamos otros tópicos de series de tiempo. En las primeras partes hemos visto una introducción a las distintas posibilidades de Stata con respecto a las series de tiempo, así como un conjunto de herramientas de análisis de procesos ARMA. En esta parte vamos a complementar ese desarrollo básico con algunos tópicos relativamente más avanzados. Debido a esto, les pido de nuevo que revisen la teoría detrás de los tópicos que desarrollemos para que puedan contrastar las posibilidades de la programación con el análisis dado por la teoría. 
Comenzaremos viendo modelos ARCH y GARCH para luego pasar a modelos multivariados VAR y SVAR. Por último, analizaremos la presencia de cointegración en las series y revisaremos cómo aprovechar esta propiedad en las series.
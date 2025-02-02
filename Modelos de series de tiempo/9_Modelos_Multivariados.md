# Modelo de series de tiempo

## 9.  MODELOS MULTIVARIADOS
---------------------------------

En la parte previa de series de tiempo nos dedicamos a analizar algunas regresiones univariadas, es decir, en donde solo tenemos una variable dependiente. En esta parte aprenderemos algunos modelos multivariados. En estos modelos tenemos más de una variable dependiente. 

De esta manera, cada variable depende no solo de sus rezagos (como en los casos ARMA), sino, también en los rezagos del resto de variables dependientes. Esto con el objetivo de mejorar la estimación debido a que se está considerando mayor información relevante. 
En esta línea repasamos cómo implementar los siguientes modelos:

- VAR
- SVAR

Repasaremos parte de la teoría de los modelos con el objetivo de darle un contexto a los comandos que aprenderemos. Esto no reemplaza a una revisión profunda de los modelos por lo que sí tienen interés deberían revisarlo en algún libro de texto de econometría.

### 9.1 MODELOS VAR

Los modelos VAR se componen de un conjunto de ecuaciones simultáneas similares a los ARMA (también se pueden llamar VARMA cuando incluyen rezagos en la perturbación) por lo que hasta cierto punto el análisis es similar.

Adicionalmente, realizaremos algunos procedimientos nuevos referidos a la generación de funciones de impulso-respuesta y a la descomposición de la varianza del error con el objetivo de desenredar la relación entre el conjunto de variables dependientes. Partamos de un modelo básico VAR(1):

![]()

En donde yt y xt son las variables dependientes y eyt, ext son ruidos blancos para cada serie. También podemos expresar este modelo de manera matricial de la siguiente manera:

![]()

O también:

![]()

Al igual que en el caso ARMA, debemos verificar que las series yt y xt sean estacionarias. Por último, se asume que:

- ![]()
- ![]()
- ![]()
- ![]()

Tomemos las series de variación mes a mes de inversión minera junto a la serie de variación mes a mes en los términos de intercambio de la siguiente manera:

![]()

En donde: 

![]()

Los criterios de selección de rezagos son los mismos usamos para ver los rezagos de los modelos ARMA. En este caso podemos usar el comando varsoc para sistematizar el procedimiento que vimos previamente. Esto considerando que el comando varsoc solo compara modelos basados en rezagos de las dependientes. Debemos seleccionar las variables y el número máximo de rezagos a considerar.

```
```

![]()

El comando genera los criterios de información para cada conjunto de rezagos. El modelo seleccionado es el que tiene *. En este caso es el modelo con hasta el 2do rezagos.

![]()

Luego de seleccionar el número de rezagos podemos estimar el modelo con el comando var indicando el número de rezagos a considerar. Veamos la primera parte del resultado:

![]()

En la primera parte tenemos información general como el número de observaciones, los criterios de información y resultados parciales para cada ecuación dentro del sistema de ecuaciones.

En la segunda parte tenemos los coeficientes estimados:

![]()

A pesar de que los coeficientes no sean significativos igual serán usados para estimaciones futuras, por ejemplo para las funciones de impulso-respuesta, por lo que no nos enfocaremos en interpretar los coeficientes de manera individual. Para obtener la matriz de varianza-covarianza tenemos que recuperarla de la estimación:

![]()

Podemos ver que los errores de cada ecuación no son independientes entre si. Por lo que se mantiene cierta endogeneidad entre ambas ecuaciones a pesar de considerarlas simultáneamente. Veremos con los SVAR una posible solución para esto. A partir de estos resultados analizaremos dos tópicos adicionales: Causalidad a ala Granger y Funciones de Impulso-Respuesta.

#### 9.1.1 Causalidad a la Granger

Se dice que una variable xt causa a la Granger a yt si, dado el número de rezagos de yy , los rezagos de xt son conjuntamente significativos. Esta definición de causalidad no es la misma que se usa dentro del contexto de evaluación de impacto o de experimentos. Es una definición estadística particular. Para implementarlo usamos el comando vargranger luego de estimar el modelo.

![]()

Para cada ecuación, vargranger testea ‘causalidad a la Granger’ para cada variable y luego para todas las variables conjuntamente. La primera fila excluye la variable im mientras que la segunda considera todo. Es decir, en la primera fila se toma como hipótesis nula que todos los coeficientes, excluyendo im, son ceros mientras que en la segunda fila se testa que todos son ceros. La alternativa es que al menos uno es distinto a cero.
Para la primera ecuación, rechazamos la hipótesis nula de que todos los coeficientes son conjuntamente ceros. Es decir, los rezagos de la variación de los términos de intercambio y de la inversión minera ‘logran’ explicar parte de la variación actual de los términos de intercambio. Esto tiene sentido económico puesto que la inversión minera puede afectar el tipo de cambio y por ende el ratio de precio, es decir, los términos de intercambio. Contrariamente, tenemos que no podemos rechazar la hipótesis nula en la segunda ecuación. Por lo que la variación de los términos de intercambio no ‘causan a la Granger’ a la inversión minera.

#### 9.1.2 Funciones de Impulso-Respuesta 

Un segundo conjunto de estadísticos usados para evaluar los VAR consiste en ‘simular’ algún ‘shock’ al sistema con el objetivo de ver qué efectos tiene sobre las variables endógenas. Para esto usaremos la familia de comandos irf (irf significa Impulse Response Function). Este comando nos permite crear un archivo .irf en donde se almacenan los resultados del VAR. 

![]()

Por lo que primero debemos crear el archivo estableciendo algunas cosas. Veamos
Con irf create creamos un archivo .irf llamado var_irf. Dentro de este archivo podemos tener varias estimaciones de VAR guardadas por lo que a esta estimación en particular la llamamos irf_1. Adicionalmente, establecemos un horizonte de periodos de 36 (si estamos en meses esto sería igual a 3 años) y definimos que se reemplacen los archivos en cada corrida con el comando replace

![]()

Luego podemos usar algunas de las opciones de irf graph para presentarlos resultados que queremos:

![]()

Cada opción tiene un soporte teórico que permite interpretarlos por lo que les recomiendo que profundicen en ellas si tienen interés. En este caso haremos algunos ejemplos de estas opciones enfocándonos en la función de impulso-respuesta ortogonalizada, en su acumulada y descomposición de la varianza del error de predicción.
Usamos los siguientes códigos para estimar los tres gráficos:

```
```

- oirf: Para la función ortogonalizada de impulso-respuesta
- coirf: Para la función ortogonalizada acumulada de impulso-respuesta.
- fevd: Para la función de descomposición del error de predicción.

Adicionalmente, se puede indicar las funciones que sean los impulsos (es decir cuál término de error se genera el choque) y las respuestas (en qué variables evaluar). En este caso solo tenemos dos variables por lo que incluimos todo.

#### 9.1.2.1 oirf

Veamos el primer gráfico del cuadro. Se evalúa el ‘efecto’ de un choque en im sobre im (el segundo sería el efecto sobre ti). El eje Y nos indica el cambio en porcentajes de la variable mientras ante un cambio de 1 desviación estándar en el término de error mientras que el eje X indica los periodos. La línea del centro es el ‘efecto’ promedio mientras que la parte sombreada indica el intervalo de confianza. Ojo: en este escenario el valor es significativo si los intervalos de confianza no cruzan el eje X.

![]()

#### 9.1.2.2 coirf

La opción coirf permite presentar los resultados previos, pero de forma acumulada. En el caso anterior el efecto era parcial, es decir, para cada periodo. En este caso se presenta la suma consecutiva de efectos parciales. La interpretación sigue siendo la misma.

![]()

#### 9.1.2.3 fevd

La descomposición de la varianza del error de predicción (o forecast error variance decomposition, fevd) mide la fracción de la varianza del error de predicción de una variable endógena atribuible a un choque ortogonalizado. Es decir, queremos ver qué variable ‘explica más’ la varianza de cada endógena.

![]()

### 9.2 MODELOS SVAR

Al VAR visto previamente también se le puede conocer como VARreducido en el sentido de que representa una forma ‘estructural’ del modelo en donde se considere los efectos contemporáneos de las variables endógenas (ya no solo depende de los rezagos de las otras endógenas sino también del valor en el mismo periodo). 

Esta forma estructural se llama Structural VAR o SVAR. Su desarrollo es bastante amplio puesto que se puede desarrollar distintas maneras de estimar el VAR de manera estructural. En este caso veremos una forma general e introductoria de cómo estimarlos en Stata. Consideremos un VAR de la siguiente manera:

![]()
![]()

Si consideramos los efectos contemporáneos tendríamos un sistema como el siguiente:

![]()

En donde:

![]()
![]()
![]()

Entonces, el objetivo es estimar conjuntamente A, B y C pero no es posible debido a que no es posible identificarlos correctamente. Sobre este punto se puede desarrollar argumentos estadísticos que salen del tema de programación. En resumen, se necesita considerar algún criterio para poder identificar y estimar los parámetros estructurales. Estos criterios pueden considerar información de ‘corto plazo’ , de ‘largo plazo’ o de otro tipo.

#### 9.2.1 Descomposición de Cholesky

Un método de identificación común parte de asumir que B = I y restringir los valores de A para que sea una matriz triangular inferior de ceros. Por lo que se puede recuperar los valores de las variables a partir de una descomposición de Cholesky. Esta estrategia asume cierta causalidad de las variables, por ejemplo, si A es triangular inferior:

![]() 

Entonces yt no se ve afectada contemporáneamente por xt mientras que x depende de a02yt. Si consideramos que la inversión minera es más exógena que los términos de intercambio debido a que la primera depende de la demanda internacional entonces podemos asumir una estrategia como esta. Veamos cómo implementarlo en Stata.

Estimamos el SVAR con el comando svar. Este nos permite introducir restricciones de corto y largo plazo:

![]()

Para usar el comando debemos restringir los valores de las matrices A y B como lo hicimos en las ecuaciones. Para ello creamos las siguientes matrices:

```
```

En A fijamos el valor del elemento superior derecho a 0 mientras que en B fijamos los valores que no están en la diagonal en 0.
Usamos ambas matrices para estimar el SVAR de la siguiente manera:

```
```

Al igual que el VAR indicamos el número de rezagos. Adicionalmente usamos las opciones aeq() y beq() para usar las matrices que definimos previamente. De esta manera estimamos los parámetros:

![]()

Veamos los parámetros estimados creando matrices con los resultados recuperados:

![]()

Al igual que el VAR podemos usar toda esta información para estimar las funciones de impulso-respuesta estructurales. En este luego de crear el archivo .irf usamos la opción irf graph sirf para indicar que es el IRF estructural.

![]()
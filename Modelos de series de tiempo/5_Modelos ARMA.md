# Modelo de series de tiempo

## 1.  MODELOS ARMA
---------------------------------

Las series de tiempo tienen peculiaridades frente a los datos de corte transversal vistos previamente. Estos son datos de una misma unidad de observación a través del tiempo:

![]()

En donde t es el índice del tiempo. De este tipo de procesos se captura algo importante, los valores pasados afectan los valores presentes. Veamos un modelo simple:

![]()

A diferencia de un modelo de corte transversal, el supuesto de ![]() que sea i.i.d no se sostiene. Esto debido a que se tiene autocorrelación serial. Antes de pasar a los modelos ARMA veamos un modelo simple sobre el cuál avanzar.
La serie temporal más simple se llama ruido blanco, {et}~  i.i.d. en donde:

- E(et)=0, ∀t
- Var(et)=eɅ2, ∀t

Una serie de tiempo es lineal si:

![]()

En donde Ψ0=1 y et es ruido blanco. et es la nueva información que se adquiere en t, también llamada innovación o shock.   son los pesos de las innovaciones del pasado en el presente.
A partir de esta última ecuación se hace explícito que el valor de yt depende de los choques previos, así como del choque contemporáneo. Para delimitar mejor este tipo de procesos podemos plantear modelos del tipo ARMA. Veamos un poco de la teoría simple de los modelos antes de comenzar a estimarlos en el programa. 

### 5.1 AR

Los modelos AR o auto regresivos parten de asumir que las series de tiempo siguen un proceso del siguiente tipo:

![]()

En donde se tiene que {et} es una secuencia de errores de ruido blanco. Los modelos que veremos dependen del número de rezagos que consideramos. La ecuación previa indica la generalización del modelo con q rezagos. Veamos el ejemplo más simple con solo un rezago, AR(1).

![]()

En donde asumimos que |Φ1| < 1. Esta misma serie se puede expresar de la siguiente manera:

![]()

Esta expresión del proceso AR(1) nos permite ver que hay una ‘memoria infinita’; es decir, un choque, et tiene un efecto en todos los periodos posteriores.
Para entender de mejor manera este proceso encontramos sus principales momentos.

![]()
![]()

Ambos momentos difieren de los obtenidos en el ruido blanco. También podemos definir la función de autocovarianza y autocorrelación.

- Función de autocovarianza:

![]()

- Función de autocorrelación:

![]()

Ambas funciones serán de utilidad al momento de modelar las series. De la misma manera, es posible obtener estos momentos a partir de la versión generalizada del AR, AR(q). Antes de hacer algunas simulaciones en Stata veamos los modelos MA y ARMA

### 5.2 MA

Los modelos de medias móviles o moving average (MA) se definen de manera distinta al modelo MA. En vez de tener el rezago de la variable dependiente ahora podemos definir el rezago solo de la perturbación:

![]()

En donde {et} es un ruido blanco. Como vemos, las estructura de los rezagos tiene una forma distinta. Veamos los momentos de esta serie:

- ![]()
- ![]()

Además. podemos encontrar que:

![]()

![]()

Consideremos un proceso MA(1):

![]()

Entonces su media y varianza sería igual a: 

![]()

### 5.3 ARMA

Los modelos ARMA combinan ambos procesos. El caso generalizado se define como:

![]()

En donde et es un ruido blanco. Como vemos se tiene el conjunto de coeficientes ![]() del proceso AR y ![]() del proceso MA.

Hasta este punto solo hemos dado un pincelazo de toda la matemática detrás de los procesos autorregresivos y de medias móviles. Al igual que en otros temas, es necesario ahondar en la parte matemática de la mano con los temas de programación. Con esto en mente vamos a profundizar en la parte de programación de dos tópicos estadísticos; por una parte, analizaremos la presencia de estacionariedad y luego veremos cómo decidir el número de rezagos del modelo de acuerdo con los datos que queremos modelar. Antes de pasar a este diagnóstico de los modelos hagamos algunas simulaciones de los modelos vistos.

### 5.4 SIMULANDO LOS PROCESOS

En esta sección vamos a simular dos series simples bajo distintos valores de parámetros: AR(1) y MA(1), con dos objetivos. El primero es ver cómo cambian las series bajo distintos valores de parámetros. El segundo objetivo es aprender comandos nuevos. En este caso comenzaremos por definir un programa nuevo dentro de Stata, es decir un comando nuevo sobre el cuál evaluar algunos datos o parámetros. Definamos algunas condiciones previas. Ya conocemos la función de set more off y de clear.
Luego de crear el shell de los datos, podemos crear una función o comando nuevo que permita simular los datos. Para ello aprenderemos a usar el comando program. Este comando es relativamente avanzado, puesto que permite modificar y crear nuevos comandos a partir de las instrucciones que incluyamos dentro. 

Veamos el siguiente programa:

```
```

Para crear el programa iniciamos con program define seguido por el nombre, en este caso DGP (DGP viene de Data Generating Process o Proceso Generador de Datos); y, termina con end. Adicionalmente escribimos una linea previa, program drop GDP, que nos permite eliminar el programa llamado DGP de la memoria de Stata. 

Nuestro programa usará algunos parámetros:

- $dgp: Será un índice que permita identificar a la serie a crear, por ejemplo, yt1 o yt2.
- $T: El tamaño de la serie.
- $alpha0 y $alpha1: Son los parámetros vistos en la ecuación del MA(1).

Creamos un ruido blanco con valores entre 0 y 1 usando gen et = rnormal(0,1), luego la serie que almacenará los valores, yt$gdpt. Opcionalmente reemplazamos el valor inicial de la serie por 1 para que todas partan del mismo punto. Hasta este punto tenemos un ruido blanco y una serie vacía. El siguiente loop reemplaza los valores de yt$gdpt a partir de los parámetros y et de la siguiente manera:

![]()

Para definir el rezago de la perturbación restamos una unidad a la ubicación, i, entre corchetes.
Para que el programa corra debemos definir los parámetros. Como hemos fijado estos parámetros usando $, necesitamos usar globals para definirlos por lo que definimos los valores de los así como los nombres que usaremos para las series $dgp. En este caso crearemos 5 series (dgp=1(1)5) con 0=1 y 1=0.5. Dado que hemos fijado la ‘semilla’ al inicio del código cada serie saldrá siempre con los mismos valores. Es decir, yt1 siempre tendrá los mismos valores, yt2 también y así. 

Adicionalmente, yt1 será distintos a yt2.
Veamos:

```
```

Cada serie simulada sigue un proceso AR(1)

![]()

Grafiquemos las series.

![]()

Probemos aumentar el valor de α1 a un número mayor.

![]()

Ahora, sigamos un procedimiento similar para simular una serie AR(1).
El procedimiento es muy similar al del MA. La principal diferencia se encuentra al momento de definir el proceso. Ahora tenemos que definir los parámetros - y la ecuación de acuerdo a un AR(1).

```
```

En la ecuación vemos que se usa la siguiente fórmula:

![]()

Corramos algunas simulaciones:

![]()

Veamos qué ocurre si asumimos un 1 = 0.99.

![]()

Si consideramos Φ1 = 0.99 la serie empieza a diferir del comportamiento previo. En este caso, los valores empiezan a subir siguiendo una tendencia mientras que en el caso previo los valores circulan alrededor del promedio. Recordemos que el promedio es igual a 
![]()  por lo que ![]()

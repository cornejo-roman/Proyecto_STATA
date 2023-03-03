# Modelo de series de tiempo

## 1.  MANIPULANDO VARIABLES DE FECHA
---------------------------------

Para que se pueda tomar ventajas del conjunto de funciones que trae Stata se debe declarar previamente que el conjunto de datos son una serie de tiempo. Previamente hemos visto algo parecido al momento de declarar el diseño muestral de una encuesta- En este caso, la identificación es más fácil. Necesitamos saber cuál es la frecuencia de los datos, es decir, si son anuales, trimestrales, mensuales, por hora, por minutos, etc. Darle formato a la variable y usarla para declarar a los datos como de serie de tiempo usando el comando tsset. Veamos un ejemplo con datos simulados:



### 1.1 DATOS DE TIEMPO

Las series de tiempo pueden estar en distintas frecuencias, cada tipo de frecuencia puede ser cargada en Stata bajo un formato específico. Veamos los casos más importantes, datos trimestrales, datos mensuales y datos diarios (en el caso de datos anuales toda la discusión se hace mucho más fácil ya que no es necesario darle un formato especial).


![]()

Como vemos cada variable mide una frecuencia distinta. La primera comienza en el primer trimestre de 1960 (1960q1), mientras que la segunda comienza en enero de 1960 (1960m1) y la última serie comienza el primero de enero de 1960 (01jan1960, en donde jan viene de january o enero en inglés).
Hay distintos formatos que se pueden considerar, desde milisegundos hasta años: 


#### 1.5.2 ado-files

```
```

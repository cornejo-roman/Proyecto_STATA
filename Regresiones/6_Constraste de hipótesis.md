# Regresiones

### 6 CONTRASTE DE HIPÓTESIS

Luego de revisar cómo hacer regresiones básicas, repasamos cómo implementar pruebas de hipótesis en el programa. Para ello aprenderemos a usar el comando ttest.

### 6.1 TTEST

El comando ttest nos permite contrastar estadísticamente el valor de uno de los coeficientes estimados en las regresiones.

Comparemos la edad promedio en la muestra entre hombres y mujeres:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332853614_1132474590755978_1741336462206025599_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=RSlw77WfclMAX9i_Tyn&_nc_oc=AQmfZHOByPTsJZ4jtwCpMxUFrUHQuC2zPEaKojysv9Di5CHS1EMLHi7dNrLpvoWQgZ4gzKYvSzmZGMDbYAbK9j4c&_nc_ht=scontent.flim30-1.fna&oh=00_AfAVj6ZPHYzReQnqrtmrwsj8zIFdKX5Q22wZ7_Mi9tV8KQ&oe=64001660) 

La primera parte del resultado presenta estadísticos descriptivos para la variable edad con respecto a hombres y mujeres, así como para toda la muestra. La última fila presenta la diferencia de medias, así como su error estándar e intervalo de confianza.
La segunda parte del resultado presenta la definición de la variable diff, es decir la diferencia de promedios. Si no hubiera diferencias en el promedio de estas dos variables la diferencia debería ser estadísticamente indistinta de cero. Para ello, se plantea como hipótesis nula:

               H0 : diff = 0

Y, como hipótesis alternativa se plantean tres opciones a contrastar de manera separada:
Ha = diff < 0, es decir que la diferencia sea estadísticamente menor a cero
Ha = diff ! = 0, es decir que la diferencia sea distinta cero (mayor o menor)
Ha = diff > 0, es decir que la diferencia sea mayor a cero
Cada hipótesis alternativa tiene su respectivo p-value asociado. En este caso concluiríamos que rechazamos la hipótesis nula de que la diferencia sea igual a cero y no rechazamos que sea indistinta cero y menor a cero (las dos primeras hipótesis alternativas).
También podemos contrastar el valor de una variable con un valor fijo.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332554827_501819365483247_2894648869235426356_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=8RgvKSayBgMAX_qlF6i&_nc_ht=scontent.flim30-1.fna&oh=00_AfAcAabJ3Imd_uCVZamnDkOPyBWLaJUCKPEsFNeuFGRDwQ&oe=640133A0)

En este caso comparamos la edad promedio con 42.5. El contenido del resultado es similar al anterior. En este caso no podemos rechazar que el promedio de la variable sea igual a 42.5.
Hasta este puntos hemos usado el comando ttest con los datos sin considerar el diseño muestral. Ahora veamos como implementar un test de medias (un test de medias es un test en donde se compara el promedio de una variable entre grupos) usando el diseño de muestral.
Si consideramos el diseño muestral primero debemos estimar los promedios usando el prefijo svy:. Luego tenemos dos opciones, podemos usar el comando text (distinto a ttest) o usar el comando lincom (que hace el mismo test sobre una combinación lineal de los coeficientes). Veamos los dos casos. 

```
* Test de medias, considerando diseño muestral 
svy: mean p208a, over(p207)  coeflegend

test _b[hombre] = _b[mujer] // Usando el comando test

lincom _b[hombre] - _b[mujer] // Usando el comando lincom
*return list
display (r(estimate)/r(se))^2 // Comparamos el F en ambos casos
```
Al correr los promedios estimados usamos la opción coeflegend para ver la leyenda de cada coeficiente. Las leyendas de los coeficientes son _b[hombre] y _b[mujer] para hombre y mujer respectivamente. De esta manera comparamos el promedio para hombre y mujer en el primer caso usando test. En el segundo caso comparamos la diferencia de ambos con lincom. Al final usamos los resultados guardados para encontrar el F y compararlo con el F del test.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332555396_758173965919081_493073668183938713_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=7daH1Jix-lIAX8we--O&_nc_ht=scontent.flim30-1.fna&oh=00_AfBTfZxVuo-NfECrLsXa_VTX9VT2HaG-WDN7889dZhghaw&oe=640053AE)

En ambos casos el F es igual a 61.14 y el p-value indica que se rechaza la H0 de que sean iguales.

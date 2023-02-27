# Regresiones

### 3. DISEÑO MUESTRAL: SIMPLE Y COMPLEJO

### 3.1 DISEÑO MUESTRAL

Las encuestas son una herramienta muy importante en la recolección de datos. A diferencia de un censo, una encuesta se basa en método estadístico para recolectar cierta información considerando que esa cantidad de encuestados permite hacer inferencia sobre la situación de una unidad más grande como un distrito o un país. En este caso es bastante necesario revisar la documentación de las encuestas para tener un mejor entendimiento no solo de las variables en sí sino también del proceso de levantar esa información.

Antes de seguir hay algunas definiciones que aclarar:

- Weight: Es el peso que tiene cada observación en la muestra. En un diseño muestral simple, si consideramos probability weight, este peso es igual a N/n, en donde N es el número de elementos en la población y n= el número de elementos en la muestra. En un diseño muestral de dos etapas, es igual a f1f2 en donde cada uno indica el mismo concepto previo, pero para su respectiva etapa de muestreo. Si sumamos todos los pesos (o también llamados factores de expansión) obtendríamos un estimado del universo de observaciones.
- PSU: hace referencia a la unidad de muestreo primaria (primary sampling unit). Esta es la primera unidad en ser muestreada en el diseño. Por ejemplo, si queremos crear una muestra de colegios en Lima podemos comenzar tomando un muestra de UGEL-es (Unidades de Gestión Educativa Local) y luego hacer aleatorizar los colegios que estén dentro de las UGEL-es seleccionadas. En ese caso, el PSU sería las UGEL-es seleccionadas.
- Strata: Hace referencia a los estratos sobre los cuales se aleatoriza usados para mejorar la precisión de los estimadores. La estratificación funciona más efectivamente cuando la varianza de la variable dependiente es menor dentro de cada estrato que en la muestra completa.
- FPC: hace referencia a una corrección por población finita (Finite Population Correction) y es igual a ((N-n)/(N-1))1/2. Es usado cuando la fracción de muestral (n/N) se hace larga y se necesita ajustar los errores estándar estimados.

No necesariamente usaremos todas estas opciones al momento de definir el diseño muestral que manipularemos en el programa. En este caso no vamos a discutir como hacer un muestreo en sí pero sí como usar una base de datos con diseño muestral en el programa.

### 3.2 DECLARAR DISEÑO MUESTRAL: SVYSET

Para declarar que nuestra base de datos parte de un diseño muestral debemos usar el comando svyset al inicio de nuestro código.

Usemos el módulo de empleo de ENAHO para hacer algunos ejemplos con este comando.

```
* Declaramos el diseño muestral
/*
PSU    -> conglome
Weight -> fac500a
Strata -> estrato
*/
svyset conglome [pweight = fac500a], strata(estrato)

svydescribe
```

En este caso definimos los valores para PSU, Weight y Strata. Obviamos el valor para FPC. Ojo: el peso (también llamado factor de expansión o ponderador) puede varias de acuerdo al módulo de ENAHO. En este caso el factor de expansión se llama fac500a. Podemos describir los datos de la muestra usando svydescribe:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332207280_968700837377417_1232000091057440058_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=YfZ9Tu3NmJYAX8HQQBl&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfDWFFvXAR-w5rRGKsW6mZ0JXoR9SCtMjfGv8opn-zKkBg&oe=6400D15D)

Aquí observamos el número de estratos, de unidades y de observaciones por unidad. Así como otra información relacionada al diseño en sí. Luego de declarar que los datos parten de un diseño muestral podemos usar el prefijo svy: antes de los códigos usuales para que el comando considere el diseño muestral. Este prefijo se puede usar con muchos comandos, pero no con todos. Por lo que debe estar atento por si sale algún mensaje de error en la pantalla de resultado.
Comparemos los resultados de tabular los valores de la variable ocu500, condición laboral. El resultado de la proporción varía si usamos el prefijo svy: y si no lo usamos.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332458546_727453232087662_6973135303171896980_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=P_36kD9JKn8AX_L9hij&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfDzWZhWRLU7cp9mXkRwZFYH7G5fdNb7Mou4-vrJ1-uZ7g&oe=64002288)

Ahora comparemos una regresión simple. En este caso regresionaremos el Ingreso total (imputado, deflactado y anualizado) contra la edad y el género de la persona. 

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332383634_730923441849935_1301476409521845292_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=uFwu2vx947MAX-OXx13&_nc_ht=scontent.flim30-1.fna&oh=00_AfA6NBXfBADM_-kQ0xHquuciBmAjm7D4hPsloogdLLxrFA&oe=6400A926)

La pantalla de resultados también es distinta al resultado obtenido por una regresión sin diseño muestral. En este caso el análisis de suma de cuadrados no se presenta. En cambio se indica algunos datos relacionados al diseño muestral como el número de estratos y de PSU’s. En la la segunda sección vemos algunos datos nuevos, particularmente el Population size y los grados de libertad del diseño, Design df.
Si queremos obtener un estimador para sub grupos en la muestra debemos usar la opción ,subpop() dentro del prefijo. Estimemos el mismo modelo previo pero considerando solo observaciones para Lima Metropolitana. Previamente tenemos que crear una variable dicotómica, con valor 0 y 1, para Lima a partir de la variable dominio.

```
* Usando subpop para obtener estimado en Lima Metropolitana
gen lima = 1 if dominio==8
replace lima =0 if lima ==.

svy, subpop(lima): reg i524a1 p208a i.p207 /*este es el correcto a usar*/
 reg i524a1 p208a i.p207 if lima ==1 
```
De esta manera consideramos el diseño muestral en la selección de la sub muestra que queremos analizar.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332704201_6526145194081169_5267579352437812845_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=SAtNsR7KCu0AX_HTfTs&_nc_ht=scontent.flim30-1.fna&oh=00_AfBnMpXMVhNsk54Zch1lLLRpIzdr4Q9dWDRJ9jkyW8TksA&oe=63FF74CD)

Comparemos ahora cuáles son las diferencias entre estimar el mismo modelo sin considerar el diseño muestral, solo considerando las ponderaciones y considerando todo el diseño muestral:

```
* Comparamos la regresión simple, solo con pesos y con diseño muestral
* Para usar eststo y esttab debe instalar el paquete estout
ssc install estout
eststo clear
eststo: reg i524a1 p208a i.p207
eststo: reg i524a1 p208a i.p207 [pweight=fac500a]
eststo: svy: reg i524a1 p208a i.p207 /*la manera correcta de estimar*/
esttab
```

Para hacer la comparación vamos a conocer algunos comando nuevos. Una forma de almacenar resultados de manera rápida es usando eststo (esto viene de estimates store). Lo usamos como un prefijo adicional en la línea de regresión para almacenar los datos de estimación como los coeficientes, el estadístico t o el p-value. Como estamos almacenando información de manera consecutiva, cada vez que queremos volver a grabar un conjunto de información debemos usar el comando eststo clear. En el ejemplo, limpiamos los datos guardados y almacenamos los resultados de tres regresiones. Por último, usamos el comando esttab (viene de estimates tabulation) para tabular los resultados almanceados. La primera regresión es la regresión simple. La segunda es la misma pero solo consideramos el peso de cada observación (es decir el factor de expansión) con la opción entre corchetes [pweight = fac500a] (en este caso usamos pweight porque el peso del diseño el un probability wieght, hay más opciones que puede explorar). La tercera regresión considera todo el diseño muestral.
Cada columna indica cada regresión corrida. La tabla contiene los estimadores, su nivel de significancia expresado en * y en paréntesis los estadísticos t. De esta comparación vemos que la primera regresión genera estimadores distintos a los ‘correctos’ estimados al considerar todo el diseño muestral. Si solo consideramos el factor de expansión como un peso entonces obtenemos los coeficientes correctos pero no obtenemos los errores estándar correctos

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/326760116_513909834229033_6073462900597834061_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=kjkVJYAzmzsAX9FXOMU&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfCRqz_dfNyce3WKdJRGFax75Q1YS5hDlIjSRATlk4kl7w&oe=63FFB74C)

Ojo: Explore las opciones de esttab para editar esta tabla
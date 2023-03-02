# Regresiones

### 7. ENDOGENEIDAD EN LOS MODELO

### 7.1 ENDOGENEIDAD

Los problemas de endogeneidad son constantes al momento de estimar un modelo. Una forma fácil de entender la endogeneidad es considerar que hay una correlación entre una variable explicativa (incluida o no ) y el término de error. Es decir:  

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332504702_6015145821905581_1119396742081567860_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=B9LjBhBWBBwAX9vQw_2&_nc_ht=scontent.flim30-1.fna&oh=00_AfCfJvDbpEQgqZmaZQTcO-GENGINSGz5ynFjqGPyv-5X0w&oe=64006103)    

Definamos que esto puede ocurrir producto de:
- Sesgo por omisión de variables
- Simultaneidad entre variable dependiente e independiente
- Mala especificación del modelo
- Sesgo de selección

Veamos un ejemplo clásico de simultaneidad.
Consideremos una ecuación de oferta y otra de demanda:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332715277_1384255552385885_2379204510977484935_n.jpg?stp=cp0_dst-jpg&_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=jjoACHoyyoYAX-6cDX-&_nc_oc=AQk8jvIhQP8qWLBonqBZUotg5WYu6mf8QShwyLVKSmIX9t1gi9_8A0AUKi3XRFmGTOiSKkvRBvb_XqTCXCSNiBSc&_nc_ht=scontent.flim30-1.fna&oh=00_AfAv5Tm2MmD7YMsUKWEsT9HIiEPz0DAkjze_8DPbBIO7Yw&oe=64010DD2)
![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332712293_604589904842970_6701701700931586221_n.jpg?stp=cp0_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=sV131G8NV1wAX8Dbiql&_nc_ht=scontent.flim30-1.fna&oh=00_AfCQYaBGuOpw_K_fhxFELKcq9HgU2V5trUhUYt9sWNQ73w&oe=640093B9)

Si queremos estimar Qd sin considerar que P se determina simultáneamente en las ecuaciones entonces tendríamos problemas de endogeneidad. Si encontramos los valores de equilibrio de las variables obtenemos:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/329005082_3470901936510419_5077709203569983662_n.jpg?stp=cp0_dst-jpg&_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=SXPWgdggjNAAX-Wt_YS&_nc_ht=scontent.flim30-1.fna&oh=00_AfDUWiyTyzXkBQuYpN1S0JzHFKJbHR2SXV-WvN32UiYXZQ&oe=640105E0)
![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332716176_920579505802400_678298739888215844_n.jpg?stp=cp0_dst-jpg&_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=7Qy30kRnfUUAX-4ljLn&_nc_ht=scontent.flim30-1.fna&oh=00_AfC5ckH5mdqYm--FMvgPBplCgwCTDHorrb6GkThrgrFprA&oe=64015C9C)

A partir de esto, podemos verificar que:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332318150_519508413702849_1142811762465220882_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=pw-s4sUlJukAX9txuMI&_nc_ht=scontent.flim30-1.fna&oh=00_AfBS9FAzPHgd2fqc1un-fYRrypJbALXLIed_htqmAtUzqg&oe=63FF9D6A)

Por lo que no se cumpliría que ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332702769_1252923915336385_6657409678984550259_n.jpg?stp=cp0_dst-jpg&_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=gBKjeyKSiFIAX8ghT7u&_nc_ht=scontent.flim30-1.fna&oh=00_AfDgzsAJ0S21rpn5kBLtdUeqLz_4Qgs_uxN2aZgwv5IfQA&oe=64002CE3),  por lo tanto, hay endogeneidad

### 7.2 VARIABLES INSTRUMENTALES

Para resolver este problema podemos proponer un o un conjunto de variables instrumentales. Un instrumento debería no estar correlacionado con el término de error y solo afectar a la variable independiente mas no a la dependiente. Definamos a un instrumento como z. Comparemos distintos escenarios:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332697397_503515528525643_265573890760323748_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=soAP4vb7-2sAX-bZXrz&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfDUjfU8nz0qD5ZH-p6ITOUzOydl9-OFqfL0s-evKuH3Lw&oe=640197C3)

- Exogeneidad, cov(z,u)=0
- Relevancia, Corrz(z,x),x≠0 . Es decir que z tenga la capacidad de explicar x.

El uso de variables instrumentales se puede dar bajo distintos métodos de estimación, no solo bajo MCO. En este caso revisaremos cómo estimar el modelo básico usando dos métodos: Mínimo Cuadrado en 2 Etapas y el Método Generalizado de Momentos. 

### 7.3 PASO A PASO, IVREGRESS Y IVREG2

Comenzamos viendo la estimación por dos etapas. Consideremos a x1 como la variable endógena, x2 como otra variable explicativa no endógena, a z como la variable instrumental y a y como la variable dependiente. La primera etapa consiste en estimar:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332696885_543117437923353_5969481404646905437_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=zoiPWfeW_gcAX8HTizM&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfAPBpfEt6tBw5cG4ZgOkR5ZNchqwYodjdl37czq-N4mog&oe=640037B8)

A partir de esto se obtiene:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332580119_857274382000152_3142751520003689703_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_aid=0&_nc_ohc=_JAeWk7oV2sAX-6JHfy&_nc_ht=scontent.flim30-1.fna&oh=00_AfB9ZEhqZCLCl85JxJYyGY4GPevA6RDsnnvKzMFoiaq2XA&oe=6401652B)

Usamos el valor estimado de x1 para regresionar:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332697408_1279252509297609_6046591871171727331_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=yRCUjuRPCfoAX-XEErf&_nc_ht=scontent.flim30-1.fna&oh=00_AfAj9Vw7wH1AdiO2N7G42i4LYc15sEygZ02Dnzh5-XJe_g&oe=64006C44)

Podemos llegar a esta estimación paso a paso, estimando cada etapa, o usando un comando en particular. Hay dos comandos bastante usados, ivregress y ivreg2. Comparemos los tres caminos.

Como ejemplo tomemos los datos del estudio de Romer (1993) en donde se busca estimar la correlación entre la tasa de inflación de un país y su nivel de apertura comercial (controlado por el nivel de ingreso per cápita en logaritmo). Para ello planteamos un modelo simple:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332260019_1688774591541570_4750641327704924934_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=wzgecDCcGaAAX9J1bqd&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfB5Z74PYdrRpQBjx5D0kHoJy18jyC6cl2jNacEylYFTiQ&oe=64012DAD)

En este caso planteamos como variable instrumental al logaritmo de la extensión territorial del país. Veamos:

```
* Estimamos un modelo por MC2E

* Manualmente
reg open lland lpcinc 
predict open_hat, xb
reg inf open_hat lpcinc

* Usando ivregress
ivregress 2sls inf (open = lland) lpcinc

* Usando ivreg2
ivreg2 inf (open = lland) lpcinc
```

Si lo hacemos paso a paso, primero debemos estimar la primera etapa del modelo, luego predecir el valor de la variable endógena y, por último, usar esta nueva variable como regresor en la ecuación final. En el caso de ivregress debemos indicar que estime el modelo en dos etapa indicando 2sls:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332675962_1180619832590750_5698837841389207216_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=xB-fiOrR1i4AX8xXYgj&_nc_ht=scontent.flim30-1.fna&oh=00_AfDvfCQiQnaRO_mU2GLSjC0VXFLqbHNIk1OIodhLjhF5cA&oe=6401DE37)

Entre paréntesis debemos indicar la variable endógena y el o los instrumentos a usar. Fuera podemos indicar las variables explicativas que no son endógenas. En el caso de ivreg2 no es necesario indicar expresamente que se estime por dos etapas puesto que es la opción por default. Este último comando tiene una amplia cantidad de opciones disponibles para usar, así como un resultado acompañado de mayor información.
Al comparar los tres resultados obtenemos los mismos coeficientes y estadísticos. En el resultado de ivreg2 podemos ver la información usual sino también más información sobre algunos tests realizados. Regresaremos a estos test posteriormente.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332161135_604947761452221_7908653181058958762_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=JhI1GzXCOO0AX93GFdl&_nc_ht=scontent.flim30-1.fna&oh=00_AfAvHnHsw05pW95AUmNxqOydWThSjjv8Q9a27FSuBHL54A&oe=64017DA9)

En el resultado de ivreg2 podemos ver la información usual sino también mayor información sobre algunos tests realizados. Regresaremos a estos test posteriormente.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332512148_5932290493498014_4182605900052236939_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=F1mj4rH1x7QAX-SHQSV&_nc_ht=scontent.flim30-1.fna&oh=00_AfCUNMs5Qe0vRSxGCo-N4zq5QwuHuCBMqZUrRRkxnEhTCQ&oe=640202BB)

#### 7.3.1 Gmm 

El método generalizado de momentos estima el modelo de manera distinta al estimador de dos etapas. En este escenario se busca que los estimadores cumplan con:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332168954_1265504714378707_3638066314985912383_n.jpg?stp=cp0_dst-jpg&_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=loAYKTii0fQAX9jwAwd&_nc_ht=scontent.flim30-1.fna&oh=00_AfBNt5I4n_xScTaJ5ZhojAo6tDyqV2iZCpliuhQP3Bw1Ag&oe=64012D05)

Siendo g() la función generalizadora de momentos y   el vector de coeficientes a estimar. Este no es un método lineal como en el caso anterior. Veamos las diferencias de estimar el modelo considerando dos etapas y considerando el Método generalizado de momentos:

```
* Estimemos el modelo usando el método generalizado de momentos o GMM

eststo clear
eststo: ivregress 2sls inf (open = lland) lpcinc
eststo: ivregress gmm  inf (open = lland) lpcinc
esttab , mtitle("2SLS" "GMM")

```

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332624921_757725422157251_4450961197310592529_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=DqXYbgZfKZYAX_1tOiT&_nc_ht=scontent.flim30-1.fna&oh=00_AfCoOpHX9qh0oOtw-PTf7Hq97-ASrX0EnVQjtKre35JTEA&oe=640121A8)

En este caso vemos que el coeficiente estimado es igual pero los errores estándar son distintos. Esto se debe a que son dos maneras distintas de obtener los valores de los coeficientes.

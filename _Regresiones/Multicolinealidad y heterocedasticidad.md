# Regresiones

### 2. MULTICOLINEALIDAD Y HETEROCEDASTICIDAD

### 2.1 MULTICOLINEALIDAD

Cuando hay una relación lineal perfecta entre variables explicativas, los estimadores del modelo no pueden ser estimados. El término colinealidad implica que dos variables son casi una combinación lineal perfecta del otro. Cuando hay más de dos variables envueltas se llama multicolinealidad. Aunque los términos son mutuamente intercambiables. Que dos o más variables sean una combinación lineal de la otra significa que al sumar o restar algún valor en una de las variables se obtiene otra de las variables o una suma/resta de ellas. Un ejemplo muy simple se da en las variables dicotómicas. Por ejemplo, si Mujer = 1 cuando la observación es mujer y Mujer = 0 cuando la observación es hombre. Mientras que Hombre = 1 si la observación es hombre y = 0 en caso contrario. Entonces:

Mujer + Hombre = 1
Mujer = 1 – Hombre

Por lo que Mujer es una combinación lineal de Hombre y por ende no pueden entrar a la misma vez en una regresión. Es por esto que cuando se tienen una variable categórica de N categorías solo se consideran N − 1. + Esto también se puede dar en variables que no sea multicolineales por definición como en el caso del género. Veamos una forma de evaluar este problema en una regresión:
Consideremos un modelo similar al estimado previo, pero ahora considerando al PBI per cápita y al % de la población urbana como variables explicativas adicionales. Una forma de evaluar la multicolinealidad es usando el estadístico VIF, usado como post estimation luego de la regresión. Esto generó un valor VIF que se compara con el valor 10. Si es mayor a 10 entonces se tiene indicios de que esa variable es una combinación lineal de alguna otra variable.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332695130_1080059089641432_3655676833346470052_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=oD_xeRYLlXIAX8Et2mf&_nc_ht=scontent.flim30-1.fna&oh=00_AfA-gsaa9ksOG4eGzlN3KbzblbFeOo_WflqR5PUE6eotSg&oe=640037A2)

### 2.2 HETEROCEDASTICIDAD

La heterocedasticidad se relaciona con uno de los supuestos del modelo MCO. Si no se cumple que Var(i) = σ2 entonces no hay homocedasticidad en la regresión y por lo tanto se tiene errores heterocedásticos. Revisemos una forma de detectar la presencia de heterocedasticidad en la muestra de datos. El test de Breusch-Pagan, genera un estadístico chi2 que tiene como hipótesis nula que la varianza es constante mientras que en la hipótesis alternativa se tiene que la varianza de los errores son funciones multiplicativas de una o más variables del modelo. Para usar este test de usa el post-estimation hettest. El mismo resultado nos brinda información acerca de la forma de la hipótesis nula, del estadístico y del p-value asociado al estadístico

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332594546_578671857632145_3759953318936047171_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=X84I9TG4x3IAX9uIXNQ&_nc_ht=scontent.flim30-1.fna&oh=00_AfBF_VvDN3KGCf74kP0qqTvXCs5kT3aYhtyiWgtyLYRFBQ&oe=63FFEAE2)

En este caso, el p-value nos indica que rechacemos la hipótesis nula de varianza constante. Es decir, que tenemos una regresión heterocedástica. Esto no significa que necesariamente el modelo ya no sirva. Hay formas de solucionar los problemas de heterocedasticidad.

### 2.3 ERRORES ROBUSTOS

Una forma simple de resolver es usar la opción de errores estándar robustos del programa. Esta opción implementa el estimador de Huber-White en la matriz de varianza-covarianza de los coeficientes. Ojo: Esta opción solo afecta a los errores estándar pero no afecta al vector de estimadores (claro porque el ajuste no se da en el vector de coeficientes sino en la matriz de varianza/covarianza usada para obtener el error estándar). Se puede implementar usando solo , robust o vce(robust)

```
* Usar errores estándar robustos a la heterocedasticidad
reg life school gdp urban i.region, robust
reg life school gdp urban i.region,vce(robust)
```

Los coeficientes son iguales que antes

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332482177_1052708905686750_3646904409221516480_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=vqgu075GezAAX9hb-wk&_nc_oc=AQn_hbwla0fqm8tCCbYMlXSnhTSmOE-mrHKymisqPnoNZDJUysz-1FhmmWrMVnKiBtjj_RYB5Qjv1CH_h78XmXQs&_nc_ht=scontent.flim30-1.fna&oh=00_AfCQxxcO2S6XtWKqZMEjC0TULuAciL-wbl3Sz5dAM--8sQ&oe=63FFE590)


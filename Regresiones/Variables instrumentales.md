# Regresiones

### 8. ANALIZANDO LOS SUPUESTOS DE VARIABLES INSTRUMENTALES

¿Cómo podemos ver si los instrumentos cumplen con sus condiciones?

- Condición de relevancia, Corr(z,x)≠0 o , Cov(z,x)≠0.
Podemos construir un estadístico:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332711446_648076097084756_2097150292853891942_n.jpg?stp=cp0_dst-jpg&_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=C536c1Ydr5YAX9hybiB&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfBmzp3CsxzLw8ppsUDHc6JxPZ00ebePfy9rybSK2leD-g&oe=64010A27)

Y, luego, testear:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332702954_1280595059331518_4425663988698851128_n.jpg?stp=cp0_dst-jpg&_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=67Gz72bNZfYAX81fi-B&_nc_ht=scontent.flim30-1.fna&oh=00_AfBolzWXVXjPbxEMC2rXn7SV-9kMIGIkDPAEPfsXke4IhA&oe=64002099)
![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332719380_1379414779519901_8933702099785187204_n.jpg?stp=cp0_dst-jpg&_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=A4UAG9KsrIsAX-GcWLH&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfDCEzczkGgKy_6nBapTcxa1ZswiJubvKqBto-7NBJgTKQ&oe=6400686F)

- Condición de exogeneidad, Cov(z,u)=0. No se puede hacer un test sobre este supuesto. En cambio, debemos justificar de alguna manera que esto se cumpla. Bien siguiendo la teoría económica o alguna fuente de exogeneidad (como un experimento).


### 8.1 CONDICIÓN DE RELEVANCIA

Para verificar la condición de relevancia podemos verificar el estadístico F de  generado en la primera etapa de la regresión. Una regla rápida es verificar si el F es mayor a 10.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332780995_925399778657903_3194873532730320459_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=7RpIG4zgfX4AX8T4_nK&_nc_ht=scontent.flim30-1.fna&oh=00_AfAPdywXSWRzB56TxR8p0s1-2w6dQ50UBBv56u9osihaLQ&oe=64015E9D)   

Para ver los resultados de la primera etapa usamos la opción , first. Al final de esta primera parte vemos el test de F test of excluded instruments. El F es mayor a 10 por lo que podemos decir que el instrumento es relevante.
Si estamos ante un modelo sobreidentificado, es decir que hay más variables instrumentales que variables endógenas, entonces podemos aplicar otro tipo de test. Veamos el test de Sargan. Para ello consideremos como instrumento adicional una dummy = 1 cuando el país es petrolero. Este instrumento sería útil si asumimos que no afecta la inflación del país pero si la apertura comercial. En este caso la hipótesis nula es que ambos instrumentos, en conjunto, son válidos. Si rechazamos la H0 entonces tendríamos cierta evidencia a favor de dudar sobre la validez de los instrumentos usados, de manera conjunta.


![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332640240_1191053488438057_6031831212107068666_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=kl7PwXhrSqwAX-mRC7w&_nc_ht=scontent.flim30-1.fna&oh=00_AfBKGDoddNm5VtcJasod7D198dXpvF7X63Jjjpj3E_Wnig&oe=6400213F)

En este caso no podemos rechazar la nula por lo que el conjunto de instrumentos sería válido.

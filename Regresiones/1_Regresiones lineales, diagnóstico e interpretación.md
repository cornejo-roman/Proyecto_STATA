# Regresiones

### 1. REGRESIONES LINEALES, DIAGNÓSTICO E INTERPRETACIÓN DE LA ESTIMACIÓN

Stata ofrece una amplio rango de métodos de regresión. Una lista de parcial e inicial de posibilidades puede mostrarse al introducir help regress en la línea de comando. Esta primera sección de la semana se enfoca en regresiones lineales basadas en el método de mínimos cuadrados ordinarios (MCO o OLS, en inglés) obtenidas con el comando regress. Adicionalmente, usaremos dos tipos de herramientas de diagnósticos más. Los gráficos, ya revisados en la semana previa, y, datos de post-estimation. Esta opción, post-estimation, se refiere a información adicional generada en las regresiones que no se presenta necesariamente en la pantalla de resultados pero que puede ser extraíble usando ciertos comandos.

### 1.1 REGRESS

El comando más básico en términos de regresiones es regress. Este permite estimar un modelo bajo mínimos cuadrados ordinarios. Un modelo puede tomar la siguiente manera: 

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332580320_591963102440175_7762935977041542037_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=3rKcStPkUKoAX_Hj5TO&_nc_ht=scontent.flim30-1.fna&oh=00_AfB45NkGAgKOuIhFVqHSadd9Hz3CufTYSaHYpIwrjS0POg&oe=63FDFFE4)    (2)

En donde y es la variable dependiente o la variable de interés mientras que x es una variable independiente o explicativa. Los βs son coeficientes a estimar. Una forma de representar esta ecuación es mediante un gráfico:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332286411_737549347814839_2409712191016643216_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=5LiStvsKhBMAX-wCrGv&_nc_ht=scontent.flim30-1.fna&oh=00_AfCJqjbWetzdbDJAtOpBj5uq01u3aP9ZH0dPVBtVZuf-5Q&oe=6400C91F)

En este modelo super simple, podemos considerar que β0 es el intercepto mientras que β1 es la pendiente.
Si extendemos esta lógica a un modelo multivariado obtendríamos:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332536682_731755962006925_2139707756437891886_n.jpg?stp=cp0_dst-jpg&_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=K_EEGL0oYcQAX88YgJM&_nc_ht=scontent.flim30-1.fna&oh=00_AfBHMWu31g9-DKGtRF5TvW3mfz2Z4lfrqV2BPuX-zEK_Wg&oe=63FD5D9B)			(2)	           

En donde X es un vector de variables explicativas y B es un vector de coeficiente:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332536682_731755962006925_2139707756437891886_n.jpg?stp=cp0_dst-jpg&_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=K_EEGL0oYcQAX88YgJM&_nc_ht=scontent.flim30-1.fna&oh=00_AfBHMWu31g9-DKGtRF5TvW3mfz2Z4lfrqV2BPuX-zEK_Wg&oe=63FD5D9B)

Así (2) expresa la ecuación (1) en términos matriciales. Bajo (2) la forma del estimador de B (desde ahora en adelante toda variable que tenga ˆ representa el estimador de un coeficiente) es la siguiente:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332701920_917670522606616_8084458655990915636_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=jhXfF01R4D0AX8-4OOb&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfDqkVWe1u1ipuTm1IsnUXGxO3_qKm2aUX0fweYRJuthCw&oe=63FE5C6F)

Para obtener el estimador de (3) hay algunos supuestos que se deben seguir. Prestemos atención a:

- ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332354629_579410924241774_7661583937582295978_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=4j4WblgIbxUAX-PeqI4&_nc_ht=scontent.flim30-1.fna&oh=00_AfD_kciXLbBPENTNw2q0SJGIwMUvtTMJtWT7Ei8qWduB7g&oe=63FD45EB), es decir que la distribución condicional de los errores sea idéntica e independientemente (iid).  
- ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332618127_1168551797178604_7240802216835138777_n.jpg?stp=cp0_dst-jpg&_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=dkEakZpjI-YAX9eIjF7&_nc_ht=scontent.flim30-1.fna&oh=00_AfAFgzBZzoapSmn4Fsw83lZP_srtWGJrwaH6K6MMpBJzbw&oe=63FDD86A), s decir que el esperado del término de error condicional a las variables explicativas es igual a cero. Este supuesto también es llamado supuesto de exogeneidad. De no cumplirse entonces ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332724957_622065669929334_7648603513092360017_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=59DH7kfs_ZcAX8xjZev&_nc_ht=scontent.flim30-1.fna&oh=00_AfAUXUVzGQWEzh3v2SHooQg9L3SUypowWtl_NoZM4Ucqcg&oe=63FDFE2E)
- ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332694199_1387526042020179_7564860373204334582_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=FuYFgTJl6PoAX-Rz3OJ&_nc_ht=scontent.flim30-1.fna&oh=00_AfCvv3F1LaOlRkFu_N7QOnAlawcy_T7DBtQiq-N4xKIAoA&oe=63FD79C4), es decir que los errores sean esféricos. Una forma más simple de ver esto es asumiendo que los errores son:
  - Homocedasticos: ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332707654_571354471721020_5302153112366908146_n.jpg?stp=cp0_dst-jpg&_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=x2NqGvrDoZUAX-fgHOU&_nc_ht=scontent.flim30-1.fna&oh=00_AfCNV7Qut2ut1a9lB_qe80S4kPqASUfis92nR2XvLj1kmg&oe=63FDC258)
  - No autocorrelacionados ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332571650_559446872805010_8149674062191890659_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=kiiGvrpaFMMAX-xtmfC&_nc_ht=scontent.flim30-1.fna&oh=00_AfDItmewX5CIZzTpbLc-Zib5RLJuTg2R9gkzUJjRuVv7DQ&oe=63FD5DAE) 

Hay otro número de supuestos que dejaremos de lado de momento.
Luego de ver de manera muy rápida en qué consiste una estimación por MCO, podemos empezar a usar el comando regress. La forma más simple de este comando estima la ecuación (2) y presenta los resultados de (3) junto a otro conjunto de datos adicionales. Veamos las opciones básicas del comando en su sintaxis.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332301236_1202968370589286_7340123863648313783_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=RtvhW-jECXgAX9UMHEe&_nc_ht=scontent.flim30-1.fna&oh=00_AfDvadALvFaSZitxDsfkBRuSE2ujAjvhYwA_YIrA9wJgnA&oe=6400645D)

En este caso depvar hace referencia a la variables dependientes mientras que indepvars al conjunto de variables explicativas.
Tomemos la base de datos sobre indicadores de desarrollo humano para un corte de países como ejemplo. En esta base de datos tenemos información acerca de distintos indicadores como el de expectativas de vida al nacer, la escolaridad promedio, el PBI per cápita, la tasa de fertilidad, entre otros. Partamos planteando que esperamos una especie de correlación entre la expectativa de vida y la escolaridad en el corte de países. Probablemente esta correlación sea positiva, a mayor escolaridad mayor expectativa de vida. Comencemos viendo algunos descriptivos de los datos:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332688697_504566325201584_5201542892006717885_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=9GRiOwB76pMAX_dr8cx&_nc_ht=scontent.flim30-1.fna&oh=00_AfAFL5HUzb_IFkk65J3ibV8kQIRzDbdxP7WdD52cD9nJDA&oe=63FF1735)

La expectativa de vida en la muestra de países es de 68 años, con mucha variación de por medio, mientras que la escolaridad promedio es de 7.45 (es decir, en promedio se tiene sólo 7.5 años de educación). Veamos cómo varía esta variable entre regiones:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/333720974_503446778658241_5996994612560525274_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=quryjWN2o5oAX-dkxqO&_nc_oc=AQna-LQLh4b0J-_1Cabk8D0_hp5xxsMFPRliU6WXeetBRCLHjJrqEskl4QiUgsQy6cBQbzM1Svzas7faRVe7Rwmx&_nc_ht=scontent.flim30-1.fna&oh=00_AfA9iaaocaQ4wjkKnjNjuq_a5H87tlm5_LVJWG8FIkgExg&oe=640069F0)

Cómo es esperado, la expectativa de vida se relaciona con otras variables que pueden ser expresadas por la región de origen. Así, África exhibe los valores más bajos en mediana, seguido por Oceanía (considerando que hay claros outliers como Australia, Nueva Zelanda y Nauru) y Asia. Los valores en mediana más altos son para los países europeos. Ahora, veamos que obtenemos al regresionar la expectativa de vida con los años de escolaridad.
Veamos el resultado inicial y exploremos cada uno de los datos que nos brinda

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332555760_958963525266346_414282374836645046_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=T--dXRn_mdAAX-aoebc&_nc_ht=scontent.flim30-1.fna&oh=00_AfCdsv8WtEIFAfgmPBoLTmK2lncPEZXBXjpJrqyPRZKwuw&oe=63FFE91D)

En general, los resultados de regresiones tienen un orden similar por lo que esta segmentación puede, más o menos, extrapolarse a otros resultados.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332702778_1373452279881411_4893524262042995408_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=niPKVMHcEksAX8C4Ead&_nc_ht=scontent.flim30-1.fna&oh=00_AfDENwXIR2yGDicd76ISzNdHJ9a05rD-aY-waU2cQLLh1Q&oe=63FF3824)

Entre azul, tenemos:

- Source, expresa la fuente de variabilidad en el Model, Residual y Total. La variabilidad total (Total) está dividida en la variabilidad que puede ser ‘explicada’ por las variables independientes (Model) y la no ‘explicada’ por estas (Residual). Su suma equivale al Total.
- SS: Es la suma de cuadrados (Sum of Squares) asociada a cada fuente de variación. Recuerde que ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332516926_948054716332691_6928087430602738356_n.jpg?stp=cp0_dst-jpg&_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=K2ZZLPjSUAEAX_i_C-t&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfA8Ww_lHXawFUoiN7SWBKnGMq5Vitc67eaptLkLyOrpMg&oe=63FD81B3)
- df: Indica los grados de libertad (degrees of freedom) asociados a cada fuente de variabilidad. El grado de libertad del modelo es igual a N − k siendo N es el número de observaciones y k el número de variables explicativas agregadas al modelo. En este caso hay 188 observaciones y 187 grados de libertad en el modelo estimado.
- MS: Es el mean square y equivale a la división del SS entre los grados de libertad respectivos.
En este espacio se tiene resultados sobre el ajuste general del modelo.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332585708_735353298310559_4540185111113768329_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=GkPU6LWQRHQAX_yizCe&_nc_ht=scontent.flim30-1.fna&oh=00_AfBAGSfzaJ_k6kTU5iKTB95aTb_wNJmLrLp0qA7f4Q5uJw&oe=64004FB6)

- Number of obs, es el número de observaciones usados en la regresión. 
- F() y Prob > F : es el estadísticos F de significancia conjunta que busca evaluar si el modelo en conjunto es estadísticamente distinto a cero. Se obtiene dividiendo el Mean Square del Modelo con el Mean Square del Residuo. El segundo es el p-value asociado a este test de significancia conjunta.
- ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332694341_622798322989784_6457030191513922783_n.jpg?stp=cp0_dst-jpg&_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=z-gx10hTIg8AX_DlQsX&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfAXYv-lep4InKA-l_7ItKMRtEYJ8-WdVUiioH98m-wwmQ&oe=63FDD245) y ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332266454_724936105678410_4061171332211742709_n.jpg?stp=cp0_dst-jpg&_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=NTlHifD2VPoAX-iccyg&_nc_ht=scontent.flim30-1.fna&oh=00_AfBRZ2ji-5Yw5_g5CNBTDQOP2Zu8zAADtAvJgZNknfi9kQ&oe=63FE383D): El ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332694341_622798322989784_6457030191513922783_n.jpg?stp=cp0_dst-jpg&_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=z-gx10hTIg8AX_DlQsX&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfAXYv-lep4InKA-l_7ItKMRtEYJ8-WdVUiioH98m-wwmQ&oe=63FDD245) muestra la bondad de ajuste del modelo, es decir, que tanta variabilidad total es explicada por la variabilidad explicada. El segundo estadístico es una versión del ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332694341_622798322989784_6457030191513922783_n.jpg?stp=cp0_dst-jpg&_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=z-gx10hTIg8AX_DlQsX&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfAXYv-lep4InKA-l_7ItKMRtEYJ8-WdVUiioH98m-wwmQ&oe=63FDD245) que controla su aumento del aumento generado por un aumento en el número de observaciones en la muestra.
- Es la raíz del Error Medio cuadrático (Mean Square Error)

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332558999_508674998006509_800005024413379665_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=LznJi-9IuCQAX8OXcXP&_nc_ht=scontent.flim30-1.fna&oh=00_AfBHLcI3B1dhGtvId8-bRXbURHQNoKGBCianBq8aUZ1uxw&oe=64003D1B)

Esta última es la parte usualmente más analizada puesto que contiene a los coeficientes estimados y sus respectivos p-values. Cada columna indica: 

1. La variable dependiente, en este caso life
2. Son los coeficientes estimados del modelo. En este caso:
![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332704235_595440118720716_580013804865427392_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=730e14&_nc_ohc=HwRTXgyjAPEAX9Z6WSE&_nc_ht=scontent.flim30-1.fna&oh=00_AfAHYqpHVhHHzlaC4VGA7VxxiYk_05WENSpHoQRsNdjuQg&oe=63FD3A92)
![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332730462_749768880048376_8806728377401275870_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=iWfDzbnDVysAX8hnwHN&_nc_ht=scontent.flim30-1.fna&oh=00_AfCOIQ85OUOK_mqGX8XC4Adp4Sv4sibf0rkdMKxAo_T4xg&oe=63FD9153)
3. Los errores estándar asociados a cada coeficiente
4. t indica el estadístico t y se obtiene de la siguiente manera:
![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/328774966_951100069396218_6605197658446235997_n.jpg?stp=cp0_dst-jpg&_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=oQuaQ3eYru8AX9eLBrL&_nc_ht=scontent.flim30-1.fna&oh=00_AfCxOELl40qWeVSPNda5pPHUa4H5zekz7MnuyvOOoRnHVQ&oe=63FDD828)
5. En donde ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/329157681_893942705031116_5251487490175614942_n.jpg?stp=cp0_dst-jpg&_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=bQ7QkfJVxLUAX_e0PIT&_nc_ht=scontent.flim30-1.fna&oh=00_AfD4XDRkoA9-zRHSLPThhrOXPTfixyBzs0jWPd_Tu-_ZxA&oe=63FE41E6) es el estimador de los coeficientes, s.e.(![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/329157681_893942705031116_5251487490175614942_n.jpg?stp=cp0_dst-jpg&_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=bQ7QkfJVxLUAX_e0PIT&_nc_ht=scontent.flim30-1.fna&oh=00_AfD4XDRkoA9-zRHSLPThhrOXPTfixyBzs0jWPd_Tu-_ZxA&oe=63FE41E6)) es el error estándar delestimador y ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332391058_1873830286330949_1099233548427372101_n.jpg?stp=cp0_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=dfBlFqSUzREAX-an56p&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfADNAOlG3Uw3lu9zgx2oq5iOnmMpY03bpC7RmKE7t1G8Q&oe=63FE4C0E) es el valor que toma el coeficiente en la hipótesis nula, en el contexto de una regresión, ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332391058_1873830286330949_1099233548427372101_n.jpg?stp=cp0_dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=dfBlFqSUzREAX-an56p&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfADNAOlG3Uw3lu9zgx2oq5iOnmMpY03bpC7RmKE7t1G8Q&oe=63FE4C0E) = 0.
6. P>|t| indica el p-value asociado al test de significancia realizado sobre la variable individual.
Las dos últimas columnas indican los intervalos de confianza de cada estimador.

También podemos expresar esta regresión simple usando un gráfico de dispersión

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332377644_1671399656611179_718292337459944913_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=iAZr5Rf5yG0AX8BNK5y&_nc_ht=scontent.flim30-1.fna&oh=00_AfBCdRCpz6IumZpw2xHjB74MHHpic9lNnSaBgtkUmTsD9g&oe=63FEF919)

Para hacer este gráfico hemos usado una nueva opción, text(85 4 "predicted {it:life} = 50.36 + 2.45{it:school}"). Los números tomados como argumentos indican la posición en el gráfico de acuerdo a cada eje. El resto entre comillas indica el texto a presentarse. Adicionalmente usamos {it:life} para que se presente en cursiva (o italics) en inglés.

Antes de pasar a ver algunas opciones adicionales recordemos que la interpretación de los coeficientes estimados se limita a ser correlaciones condicionadas. Si la regresión se da en un ambiente de evaluación de impacto en donde la causalidad es probada entonces la correlación condicional pasa a ser un efecto causal entre las variables. De esta manera hablaremos de correlaciones y no ‘efectos’ al momento de interpretar las regresiones. Adicionalmente, hay que recordar que los coeficientes tienen una interpretación de acuerdo al valor que acompañen. Veamos una tabla de ayuda.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332425524_420387413630502_614771034057310901_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=xwDH1wugcXIAX9UnlSq&_nc_oc=AQkZSVueozolH2kGxh_TVzhtY06_r7fRSSczRpbv3r_8ZXQwyPSH5yvX4CX_tLrumRjNQYVxXc9PMF5S_-7gKNPl&_nc_ht=scontent.flim30-1.fna&oh=00_AfCui2YvzKbvJHxFBMywWdSP0H_vVAp1LKlIJ8pE6LmDjw&oe=64004B34)

También podemos usar los resultados para estimar valores de la variable dependiente. Es decir, cuál sería el valor de y condicional a distintos valores de x. Para ello usamos el comando margins seguido de las indicaciones para los valores que tome x. Consideremos que queremos obtener el valor de y, es decir, yˆ cuando los años de escolaridad pueden ir de 6 a 11 años. Dentro de la pantalla de resultados obtenemos:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332360453_926138595086251_2523769027864469239_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=NcaoeRefH1MAX_EUHNv&_nc_ht=scontent.flim30-1.fna&oh=00_AfDj0n3W9vGS2DLCQ14Izo2EIrLSNhno7haHS0E3Xlmoaw&oe=6400909D)

El resultado impreso tiene segmentos similares a los ya visto. En este caso una sección de información referida al número de observaciones y a los valores que se fijan para x y una sección de resultados en sí con columnas similares a las previas. También podemos graficar estos resultados usando el comando marginsplot.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332679864_743434293913833_3661687497979333065_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=PPd5aHO3SY8AX_heuCd&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfBuC3jgkoeq8tHhQcR4WEj6xXied1DPweFrnGdFEWNb-A&oe=63FEFC08)

Cada punto es la estimación promedio de la expectativa de vida para cada valor de años de escolaridad. Las barras que acompañan indican los intervalos de confianza.

### 1.2 POST-ESTIMATION

Las opciones de post-estimation hacen referencia a las opciones que se hacen disponibles para recuperar información presentada o no en los resultados o para manipularla. Un ejemplo de esto es el uso del comando margins previamente. Algunos de ellos hacen referencia a tests específicos del tipo de regresión que se lleva a cabo. El siguiente slide presenta algunas de las opciones de post-estimation para el comando regress. Algunas de ellas serán vistas posteriormente, por ejemplo, para realizar test. Ojo: Estos comandos se hacen disponibles luego de correr una regresión.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332691867_488586510150202_3946169316235929893_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=KhFG7r7r2sQAX8ET985&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfCHBch2V7nPDS8uNER8Ljlk-y9FAbJxl4cqyu8qruOGRw&oe=6400A802)

Veamos un ejemplo bastante usado de postestimation, el comando predict. Este sirve para obtener el estimador de la dependiente, de los residuos, etc. Para ver todas las opciones use la opción de ayuda.

```
* Regresión con categóricas
regress life school i.region c.school#i.region // Opción 1

regress life c.school##i.region				   // Opción 2
```

En este caso generamos una nueva variable que contenga los residuos de la regresión y otra con el estimado de la variable dependiente. Comparemos el valor observado y el valor estimado de la expectativa de vida.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332204808_880018626598310_7619566334402970211_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=KEtnwNbDfnYAX-TBPSs&_nc_oc=AQnw2daObSmupe0LRcQudtIZ7jxf9zGMAi2xj06dkdwfJ2rH_V-KOvtdL0hljFYSxetMjDo64b6_cEife1Fd7Gnv&_nc_ht=scontent.flim30-1.fna&oh=00_AfCchaUnK6PTLcR3E4WJ4UqoX-HNaNzEljv7EwzBMhz5Hg&oe=64005C67)

Explore el resto de las opciones de post-estimation disponibles no solo para el comando regress sino para el que necesite usar.

### 1.3 STORED RESULTS

stored results hace referencia a los resultados guardados producto de la regresión. Usualmente se presentan al final del texto en la ayuda del programa. Estos resultados almacenados pueden ser de tipo escalar o scalar, matricial o matrix, una macro (es decir alguna parte de la programación en sí) o una función o function. Estos resultados almacenados nos son útiles cuando tenemos que hacer un cálculo manual que implique algún dato estadístico de la regresión. En el siguiente slide vemos las opciones de resultados almacenados para el comando regress.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332515758_754286939230691_3052128547632818102_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=2Xd3NGbEAxEAX-KpzHk&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfCpZSAATOXuGYEZ9luf_T28_WKICM7wAwMT4FMJY4-0Yw&oe=63FEF03E)

Luego de correr una regresión podemos usar cada cado como si fuera una variable dentro de alguna expresión o también crear una nueva variable a partir de ellas. Para esto, si queremos manipular bien un scalar o una matriz debemos insertarlos de manera coherente a alguna expresión (como si fuera un local) o crear una variable adicional considerando que son escalares y matrices. Veamos algunos ejemplos:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332690054_544087964198015_9180253249420943101_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=s-yQExsCkQQAX8EX7FD&_nc_ht=scontent.flim30-1.fna&oh=00_AfAbIyEPw7n1etz4r3si6taKSEfY9rOdJTcS13ueCPxzJg&oe=64008516)

En este caso creamos un escalar (es decir solo un valor, frente a la variable que es una columna de datos) y una matriz (es decir un conjunto de datos de cierto tamaño) usando scalar y matrix seguido por los respectivos nuevos nombres e igualando a las variables indicadas en las opciones de resultados guardados. Para imprimir sus valores usamos el comando scalar list o matrix list.


### 1.4 VARIABLES CATEGORICAS E INTERACCIONES

En la regresión previa estimamos un modelo con dos variables continuas. Ahora consideremos una variable categórica. Para ello debemos recordar que los valores de las categóricas que se introduzcan tienen que ser 1 cuando se cumple cierta condición y 0 en caso contrario. Si hay más de dos categorías podemos crear el mismo número de variables dicotómicas a partir de los valores o podemos usar el prefijo "i." dentro de la regresión para que automáticamente se considere que categoría como una dummy separada.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332714108_722996025931888_5381089570174808165_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=QLoVBZ6ukFcAX9zboD4&_nc_ht=scontent.flim30-1.fna&oh=00_AfBlhrccCE6WA1RCqoJIbsd2ZnmNYIqFN7QwbfyD0Fgbnw&oe=6400318C)

En este caso hay cinco regiones, todas indicadas dentro de una misma variables. Debido a esto usamos i.region en vez de solo region en la regressión. De esta se considera una categoría base y se estiman las dummies restanto con respecto a la ignorada. En un sentido similar podemos agregar interacciones entre variables en la regresión. Estas interacciones ocurren al multiplicar variables en la regresión. Poe ejemplo:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332741068_1260308367919918_5000510566624093480_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=WLr2L7A36IoAX_FvFsZ&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfDPQzXQ3xD30nMxbvQxbiaywJCO3f2JsH8f8zqPKMm0HA&oe=63FD26AC)

En este caso estimamos un ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332698224_1363465971069362_1495320131439632875_n.jpg?stp=cp0_dst-jpg&_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=10FZGDmm5E8AX8U7nz_&_nc_ht=scontent.flim30-1.fna&oh=00_AfBWNF8LzB5AH0KPAGv-XPN1Zr_KhzgpfQVdsnk7vcasGA&oe=63FEA2A6) para cada región, es decir un ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332690022_956104199130662_833117335761079800_n.jpg?stp=cp0_dst-jpg&_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=mXn3g70fnEcAX9W6ddl&_nc_ht=scontent.flim30-1.fna&oh=00_AfD7jrilsrsrE6ok2jT8KXhXFg-AqjLh62vz6o6u006_ZA&oe=63FD59DE),r∀r. Adicionalmente, estimamos ![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332363571_1137980650211872_7493473181639267880_n.jpg?stp=cp0_dst-jpg&_nc_cat=105&ccb=1-7&_nc_sid=730e14&_nc_ohc=uFNLbQ_5kw8AX-lq8f9&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfB4Qa4YYCBmo5YnoyJFVtTjLmCJ7RJPCpbAZl_aozr7rw&oe=63FEAEFA),r para la interacción entre escolaridad y cada categoría de región. Para implementar esta regresión renemos dos opciones que generan exactamente lo mismo:

```
* Regresión con categóricas
regress life school i.region c.school#i.region // Opción 1

regress life c.school##i.region				   // Opción 2
```
El operador de interacción simple es #. Adicionalmente hay que indicar si la variable a interactuar es continua, usando el prefijo c., o si es categórica, usando el prefijo i.. En la segunda opción se realiza algo bastante similar pero más acotado, al usar ## estamos indicando que se estime no solo la interacción deseada sino también cada variable por separado. Cosa que hicimos a mano en la opción 1 usando, school i.region. Veamos el resultado:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332714108_722996025931888_5381089570174808165_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=QLoVBZ6ukFcAX9zboD4&_nc_ht=scontent.flim30-1.fna&oh=00_AfBlhrccCE6WA1RCqoJIbsd2ZnmNYIqFN7QwbfyD0Fgbnw&oe=6400318C)

En el resultado tenemos los coeficientes estimados para la variable categórica y también para las interacciones. Como indicamos que region es una variable categórica, se estima la interacción entre la continua y cada categoría. Si incluimos una interacción entre dos continuas solo se generaría 1 coeficiente estimado nuevo.

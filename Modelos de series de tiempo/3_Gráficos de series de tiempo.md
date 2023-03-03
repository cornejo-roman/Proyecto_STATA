# Modelo de series de tiempo

## 3.  GRÁFICOS DE SERIES DE TIEMPO
---------------------------------

Cuando declaramos la base de datos como series de tiempo podemos usar un comando nuevo para graficar series, tsline. Este comando es similar al que ya conocimos previamente, line, con la diferencia que ya no necesitamos indicarla fecha como 2da variable. Grafiquemos la participación de cada componente del PBI usando tsline y line solo para los años entre 1995 y 2015.

```
```

Por ejemplo:
- Usamos if tin(1995q1,2015q4) para denotar los trimestres que vamos a considerar 
- Si usamos xlabel() obtendríamos problemas ya que el programa no leería la fecha en sí sino el valor numérico que está detrás de la etiqueta. Para considerar los valores de las fechas usamos tlabel().

![]()

Hasta este punto hemos visto cómo manipular las variables de tiempo y como hacer algunos gráficos simples considerando estos datos. Ahora vamos a ver un primer conjunto de operaciones estadísticas bastante recurrentes cuando se usan datos temporales.
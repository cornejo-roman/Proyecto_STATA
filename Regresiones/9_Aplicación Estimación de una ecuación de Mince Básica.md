# Regresiones

### APLICACIÓN: ESTIMACIÓN DE UNA ECUACIÓN DE MINCER BÁSICA

Una ecuación de Mincer busca explicar el nivel de ingresos a partir del nivel de educación así como de otras variables. Consideremos el siguiente modelo:

*log (Ingreso)i = β0+ β1 Educacióni+ β3 HabilidadesInnatasi + ui*

Las habilidades innatas de las personas no son observables por lo que no pueden ser introducidas al modelo. A pesar de esto sí logran determinar el valor del ingreso. Si no consideramos a esta variable entonces estaríamos estimando un modelo como el siguiente:

*log (Ingreso)i = β0+ β1 Educaciónni + εi (1)*
En donde: *β3 HabilidadesInnatasi + ui= εi*

Si estimamos (1) entonces es esperable que E(Educacióni,εi)≠0 dado que las habilidades innatas se correlacionan con el nivel de educación de una personas. A partir de esto debemos de decidir un instrumento que nos permita estimar la ecuación.
Para estimar esta ecuación primero necesitamos juntar los módulos de empleo y de educación de la ENAHO. A partir de esta nueva base creamos una variable para los años de educación y una del logaritmo del ingreso total. Como instrumento proponemos el nivel educativo del jefe de hogar. Adicionalmente estimamos 4 modelos. Dos de ellos MCO directos (uno para toda la muestra y otro para solo los hijos/as de jefes/as de familiar) y otros dos modelos usando como variable instrumental el nivel educativo del jefe de hogar.

```

```

La calidad del resultado depende, en bastante proporción, de qué tan bien se justifique la exogeneidad de la variable instrumental. 

![]()
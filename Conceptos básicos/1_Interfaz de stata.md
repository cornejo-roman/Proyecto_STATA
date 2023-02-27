# Conceptos Básicos

### 1 CONOCIENDO LA INTERFAZ

### 1.1 LA INTERFAZ DE STATA
La interfaz de Stata se compone de distintas ventanas. Conozcamos algunas:

- Ventana de Resultados (Results Window)
Cuando comiences a usar Stata para analizar tus datos, todos tus comandos, resultados o mensajes de errores recientes aparecerán en la venta de resultados. El scroll del lado derecho puede ser usado para ver resultados previos que no están en la pantalla. Sin embargo, la ventana de resultado no mantiene todos los resultados generados. Por default, solo mantendrá alrededor de 500 líneas del resultado más reciente y eliminará los resultados más antiguos. Si deseas almacenar los resultados de algún archivo se debe usar un log-file.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332570585_513989257473306_2806426886409082827_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=om012FQ7FCUAX_XcUK0&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfCDgwR2fvIjJO_7xq5VJdcs2ljSkukTOkU0mznwntxJMg&oe=63FB09AD)

- Ventana de revisión (Review Window)
Esta ventana lista todos los comandos recientes. Si se le da click en algunos de ellos, este será copiado a la ventana de comandos en donde puede ser ejecutado al apretar Enter. si se le da doble click el comando se ejecutará.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332692577_522577966581770_9012004805686213097_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=730e14&_nc_ohc=bVu6T39W2NQAX_e31sT&_nc_ht=scontent.flim30-1.fna&oh=00_AfDD7n39OuemT58zwwvdN5YwH8ng-8coElCIc93Mb3wIaQ&oe=63FA8975)

- Ventana de Comando (Command Window)
Esta ventana permite introducir comandos que serán ejecutados de manera inmediata. También, puede usar comandos recientes apretando la tecla‘Page Up’ o ‘Page Down’ para regresar. Si se da doble click en una variable de la ventana de comandos, la variable aparecerá en la ventana de comandos.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332698462_723906356148996_6009008919160350347_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=1QKhhSeRmY8AX9T-9p4&_nc_ht=scontent.flim30-1.fna&oh=00_AfCfE0-m4Al-k9p19jvW6cbhNo7ZWcY9LqCWuTsvVuXBuQ&oe=63FB5F8E)

- Ventana de Variables (Variables Window)
Esta ventana lista todas las variables de la base de datos que se abre. Se puede aumentar el tamaño de esta ventana para poder ver el nombre completo. Las variables nuevas serán agregadas aquí; y, de igual manera, las variables eliminadas serán borradas de aquí. Se pueden insertar variables en la ventana de comandos haciendo doble click en la ventana de variables.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332369027_1409662043111978_4655858338339026326_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=X1ytUvY74noAX_1jvJc&_nc_ht=scontent.flim30-1.fna&oh=00_AfACwmHWpkfJIZMTfensTQgc6ISc5tlxe1VOCJUMsvGk_Q&oe=63F9BA50)

- Ventana de Propiedades (Properties Windows)
La ventana de propiedades provee información acerca de las variables abiertas en la base de datos. Si se da click a una variable en la ventana de variables, la ventana de propiedades dará información acerca de esta variable referida al nombre, la etiqueta y el tipo de variable así como otro tipo de información de la base.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332767163_1392696701499010_6201887571599521328_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=pd7URp1U5yoAX_GNbkv&_nc_ht=scontent.flim30-1.fna&oh=00_AfCEqwgVs1VGCT_8hEB59q5J7ONTGFF8rWc7godR8fHbnQ&oe=63FA7727)

- Navegador de datos (Data Browser)
El navegador de datos permite visualizar los datos como si fuera una hoja de cálculo. Una forma de acceder al navegador es escribiendo el  comando‘browse’ en la ventana de comando. Al acceder mediante‘browse’ solo se puede visualizar los datos, si se desea editar se debe acceder mediante el comando ‘edit’.

### 1.2 DO-FILES
En vez de introducir comandos de manera directa en la ventana de comandos, se puede crear un archivo de texto que contenga los comandos e instrucciones de Stata para que puedan ser ejecutados. Estos archivos son llamados do-files.
Trabajar de esta manera ofrece una serie de ventajas. Al escribir cada paso que se toma en el manejo y análisis de los datos en forma de un do-file, el trabajo se hace reproducible. De igual manera, el do-file facilita cualquier proceso de debugging (o limpieza de código) así como de edición de algunos comandos o comentarios. Lo contrario implicaría volver a realizar todo el análisis desde cero.
Para abrir el editor de do-files usamos el comando doedit en la ventana de comando. Abramos el editor de do-files:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332693406_525178159685712_6235588744939016269_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=Ifu-7wrAPO4AX-SVv-x&_nc_ht=scontent.flim30-1.fna&oh=00_AfA3OafMqmx3rxEyVaIDWO6yy3aF0P00jTVSBPUEos83uA&oe=63FA8A37)

Veamos cómo crear, guardar y correr un do-file. Luego de guardar un do-file, podemos ejecutarlo dentro de otro do-file mediante el comando do seguido por el nombre del archivo junto a la dirección de su respectiva carpeta. También puede utilizarse el comando run. Ambos comandos son útiles cuando se necesita ejecutar un conjunto de código almacenado en otro do-file. Mientras que el comando do genera un resultado visible en la ventana de resultados, el comando run ejecuta el mismo código pero sin generar un resultado en la ventana de resultados:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332722888_2153198504864844_8650008287896213015_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=QI-RQ1X1XZ0AX-gKbcB&_nc_ht=scontent.flim30-1.fna&oh=00_AfCIsXM-2N9C65cDmEZYgAmeYlfYq8K4723qu8WFVwqVeQ&oe=63FA6BE1)

#### 1.2.1 Comentarios en do-files

Hay cuatro maneras de incluir comentarios en un do-file:

- Comenzar una línea con ‘*’ , todo lo escrito después en la misma línea será ignorado.
- Comentar entre ‘/* */’, todo lo que esté dentro de estos delimitadores será ignorado.
- Comentar luego de //, todo lo escrito después en la misma línea será ignorado.
- Comentar luego de ///, todo lo escrito después en la misma línea será ignorado. Sin embargo, cuando se usa ///, la siguiente línea se junta con la línea previa. /// permite partir una línea de código largo en múltiples líneas.

Esta última forma de comentario permite hacer manejables y entendibles líneas de código largas.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332583804_924250388611182_8971652193317440190_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=uvKXD_NwQzoAX8GwW0y&_nc_ht=scontent.flim30-1.fna&oh=00_AfB9rb0ZCTJXWh1Zrn8pD9-7xZfqCma-5g4bFDQMnBmZ5g&oe=63FABAF0)

### 1.3 LOG-FILES
Un log-file graba todos los comandos y resultados de Stata de una sesión dada, con excepción de los gráficos. A veces es útil mantener una copia del trabajo que se ha realizado en algún proyecto para hacer revisión de los resultados o del estudio en sí.
Un log-file es un archivo separado con extensión ‘.log’ o ‘.smcl’ . Guardar los resultados en formato ‘.smcl’ (‘Stata Markup and Control Language file’) mantiene el formato de la ventana de resultados. Mientras que guardar los resultados en formato ‘.log’ remueve los resultados y los guardo en formato de texto simple para poder ser abierto en cualquier editor de texto. El formato ‘.smcl’ solo puede ser abierto en Stata.
Para almacenar los resultados de un do-file en un log-file usamos el comando log using seguido por nombre el log-file junto a la dirección en donde será almacenado. Al final del código, debemos cerrar el log-file con el comando log close. En el resultado anterior se obtuvo un log-file en formato smcl. Para guardarlo en formato ‘.log’ debemos usar la opción text al final del comando. Veamos:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332543668_3313733328891263_1242819275545221572_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=2dMg_DRJEhMAX_5oGBF&_nc_ht=scontent.flim30-1.fna&oh=00_AfDxXeqzU8eotIv_4dpQdFS881FsEVztKi0jaxUZCW0xBw&oe=63FB8A00)

### 1.4 COMANDO DE AYUDA

Una primera fuente de ayuda para entender la sintaxis de comandos no conocidos es revisar las opciones de ayuda de Stata. Veamos tres opciones:
- La opción Help en la pantalla genera un menú desplegable con distintas opciones de ayuda.
- El comando help permite ver la documentación de un comando en específico, de manera que tanto la descripción como las distintas opciones del comando aparecen.
- El comando search permite hacer una búsqueda de documentación a partir de una palabra clave.

### 1.5 FORMATOS DE STATA

Los archivos propios de stata se guardan en distintos formatos.
- Los do-files se guardan con extensión ‘.do’.
- Los archivos de datos se guardan con extensión ‘.dta’.
- La extensión ‘.ado’ contiene programas que se pueden correr en Stata. No todos los comandos que se usan se crean en un archivo ado (ado-file), para ver esto se puede usar la opción which. Este comando permite también identificar la carpeta de almacenamiento del ado-file.

Stata no solo puede trabajar con estos archivos, como veremos a través del curso Stata permite usar datos en otros formatos.

#### 1.5.1 Identificando archivos en una carpeta

Los archivos do-files aparecen como ‘Archivo DO’ en la carpeta en donde están:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332697564_1616124225569506_1152811903583549797_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=730e14&_nc_ohc=Z-LJmKvhTlwAX87HMXt&tn=Xc4MjXoFM9qCnvxH&_nc_ht=scontent.flim30-1.fna&oh=00_AfBH6bOyQSc1Z8ihqRQn_-wKMlkue-J66EdFC7R_g6wr7w&oe=63F9F122)

De igual manera, las bases de datos en formato ‘.dta’ también aparece como ‘Archivo DTA’:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332708694_908026323579445_6557128882366745187_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=730e14&_nc_ohc=vv2h0yAmvdwAX9jbPls&_nc_ht=scontent.flim30-1.fna&oh=00_AfBgj2fY1-Yk0GrDLOvt4GSio1kmjo2p0_MbBJ--vbrBNw&oe=63F9D2B6)

#### 1.5.2 ado-files

Usemos el comando which para ver la ubicación de un comando que será bastante usado a lo largo de las sesiones, regress.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332650712_416603100681221_4311065076686853140_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=730e14&_nc_ohc=Shb5EXXWPswAX9Q8PbJ&_nc_ht=scontent.flim30-1.fna&oh=00_AfBnUFh-bb_-2QsqdN8JoUS7lkMgA71Zu1wn7peJBgwcYA&oe=63FB439A)

Vayamos a la carpeta mencionada en la ventana de resultados para ver qué encontramos...

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332137886_590039022672510_509606951407755381_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=iO-vpBOnFbQAX-0wIEk&_nc_ht=scontent.flim30-1.fna&oh=00_AfAnuqiMUrQ9cmUd-a9o9XMMqjtzTUWqwjJnxLz78a5Dvw&oe=63FB06C8)

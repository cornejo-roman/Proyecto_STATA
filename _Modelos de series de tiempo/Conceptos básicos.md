# Conceptos básicos

## 1. Conociendo la interfaz

#### 1.1 La interfaz de Stata
La interfaz de Stata se compone de distintas ventanas. Conozcamos algunas:

- Ventana de Resultados (Results Window)
Cuando comiences a usar Stata para analizar tus datos, todos tus comandos, resultados o mensajes de errores recientes aparecerán en la venta de resultados. El scroll del lado derecho puede ser usado para ver resultados previos que no están en la pantalla. Sin embargo, la ventana de resultado no mantiene todos los resultados generados. Por default, solo mantendrá alrededor de 500 líneas del resultado más reciente y eliminará los resultados más antiguos. Si deseas almacenar los resultados de algún archivo se debe usar un log-file.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332527529_492225613088539_2520698541015876745_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=730e14&_nc_ohc=PBLJ7cvmb9oAX_6-z0W&_nc_ht=scontent.flim30-1.fna&oh=00_AfCWdTjV2xOz9g9j4IJc4sfVMWXIW0ppIwZoJbrWMSSkqw&oe=63F92F12)

- Ventana de revisión (Review Window)
Esta ventana lista todos los comandos recientes. Si se le da click en algunos de ellos, este será copiado a la ventana de comandos en donde puede ser ejecutado al apretar Enter. si se le da doble click el comando se ejecutará.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332686404_5343734889061304_8310820978300651141_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=730e14&_nc_ohc=P7eENW-HuSoAX9zJr0v&tn=lJkVIxVGC-6oz6eB&_nc_ht=scontent.flim30-1.fna&oh=00_AfBuKqCldKTkXCbQllP-AkvrxdshdXnByOEQs3wn9VugEg&oe=63F92511)

- Ventana de Comando (Command Window)
Esta ventana permite introducir comandos que serán ejecutados de manera inmediata. También, puede usar comandos recientes apretando la tecla‘Page Up’ o ‘Page Down’ para regresar. Si se da doble click en una variable de la ventana de comandos, la variable aparecerá en la ventana de comandos.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332491026_929575234845865_1850481531035855244_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=pl2PqZnQgNgAX-Yu5HO&_nc_ht=scontent.flim30-1.fna&oh=00_AfB7MqgMOmsV6YsgPmjp454r5JANa3JkHTy7XS3FsQcGIQ&oe=63FA8D93)

- Ventana de Variables (Variables Window)
Esta ventana lista todas las variables de la base de datos que se abre. Se puede aumentar el tamaño de esta ventana para poder ver el nombre completo. Las variables nuevas serán agregadas aquí; y, de igual manera, las variables eliminadas serán borradas de aquí. Se pueden insertar variables en la ventana de comandos haciendo doble click en la ventana de variables.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332689035_1891791061179497_3265846216447230712_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=H9fDDu7dYMkAX_od4IR&tn=lJkVIxVGC-6oz6eB&_nc_ht=scontent.flim30-1.fna&oh=00_AfCiNhZW1ZDmMQZ7C3jIs8nb7cl40E8HNMHt1WvQRe_4HA&oe=63FA95C0)

- Ventana de Propiedades (Properties Windows)
La ventana de propiedades provee información acerca de las variables abiertas en la base de datos. Si se da click a una variable en la ventana de variables, la ventana de propiedades dará información acerca de esta variable referida al nombre, la etiqueta y el tipo de variable así como otro tipo de información de la base.

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/329835211_719563573165121_3542529229248906310_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=730e14&_nc_ohc=3VFguWL5cjUAX-r3nyk&_nc_ht=scontent.flim30-1.fna&oh=00_AfACB6vuMSTVAzkBHs9rcASXU8FCfwOn4BUTynEHsfdDCA&oe=63FA9CAF)

- Navegador de datos (Data Browser)
El navegador de datos permite visualizar los datos como si fuera una hoja de cálculo. Una forma de acceder al navegador es escribiendo el  comando‘browse’ en la ventana de comando. Al acceder mediante‘browse’ solo se puede visualizar los datos, si se desea editar se debe acceder mediante el comando ‘edit’.

#### 1.2 DO-FILES
En vez de introducir comandos de manera directa en la ventana de comandos, se puede crear un archivo de texto que contenga los comandos e instrucciones de Stata para que puedan ser ejecutados. Estos archivos son llamados do-files.
Trabajar de esta manera ofrece una serie de ventajas. Al escribir cada paso que se toma en el manejo y análisis de los datos en forma de un do-file, el trabajo se hace reproducible. De igual manera, el do-file facilita cualquier proceso de debugging (o limpieza de código) así como de edición de algunos comandos o comentarios. Lo contrario implicaría volver a realizar todo el análisis desde cero.
Para abrir el editor de do-files usamos el comando doedit en la ventana de comando. Abramos el editor de do-files:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332709596_1360265531406080_5483872657562094677_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=8oooZqi9DKUAX9TGcjx&_nc_ht=scontent.flim30-1.fna&oh=00_AfBe9z92UFLzkzvX-aC_-BZpBgxK-vftDByKLpb8Q0PSfA&oe=63F94D36)

Veamos cómo crear, guardar y correr un do-file. Luego de guardar un do-file, podemos ejecutarlo dentro de otro do-file mediante el comando do seguido por el nombre del archivo junto a la dirección de su respectiva carpeta. También puede utilizarse el comando run. Ambos comandos son útiles cuando se necesita ejecutar un conjunto de código almacenado en otro do-file. Mientras que el comando do genera un resultado visible en la ventana de resultados, el comando run ejecuta el mismo código pero sin generar un resultado en la ventana de resultados:

![](https://scontent.flim30-1.fna.fbcdn.net/v/t39.30808-6/332702030_1586014175213973_2694427930321478608_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=yB9ajBfeWrgAX9AFwKq&_nc_ht=scontent.flim30-1.fna&oh=00_AfBFknIPEBdgHbyciK2cV0EetoHtCwBXEX7gRDdI2gHKpQ&oe=63FAC62F)


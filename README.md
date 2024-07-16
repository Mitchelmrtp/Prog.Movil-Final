# Aplicactivo móvil de un Sistema de Ventas

El sistema de ventas es una herramienta fundamental para cualquier negocio que involucre la compra y venta de productos. Esta base de datos está diseñada para gestionar eficientemente las transacciones comerciales, manteniendo un registro detallado de los clientes, proveedores, productos, compras y ventas. Al mismo tiempo, esto ayuda a tener una mejor gestión de la cantidad de ventas, stock y ganancias que se pueden obtener de la ventas de los diferentes productos.

![enter image description here](https://i.imgur.com/mIxmdGb.png)


## Entorno de desarrollo

Flutter es un SDK de código abierto desarrollado por Google, con características similares al entorno de desarrollo Kotlin. Sin embargo, destaca como una herramienta superior para la creación de aplicaciones móviles debido a su facilidad de aprendizaje y su entorno de trabajo más eficiente, que no requiere recursos excesivos.

### Instalación del Entorno de Desarrollo
#### Paso 1
Para iniciar, es necesario configurar el entorno de desarrollo. Para esto, se tiene que acceder a la página principal de Android Studio y proceder con la descarga del archivo de instalación y seguir una serie de procesos.
<img src="https://i.imgur.com/lL3OZm2.png" alt="" width="500" >
#### Paso 2
Una vez que hayas descargado el archivo, procederemos a instalarlo como cualquier otro software. 
<img src="https://i.imgur.com/TH7aM9Q.png" alt="" width="500" >
#### Paso 3
<img src="https://i.imgur.com/XxZnE5W.png" alt="" width="500" >

#### Paso 4
<img src="https://i.imgur.com/SwralHo.png" alt="" width="500" >

#### Paso 5
<img src="https://i.imgur.com/lGsSUda.png" alt="" width="500" >

#### Paso 6
<img src="https://i.imgur.com/PdYx0Bg.png" alt="" width="500" >

#### Paso 7
<img src="https://i.imgur.com/AOg8ReE.png" alt="" width="500" >

#### Paso 8
<img src="https://i.imgur.com/ptN4tvu.png" alt="" width="500" >

#### Paso 9
Para completar, se tiene que aceptar los acuerdos de licencia y darle al botón Finish.
<img src="https://i.imgur.com/prKzLk8.png" alt="" width="500" >

#### Paso 10
Por último, se tiene que instalar un complemento de dispositivo móvil virtual.
<img src="https://i.imgur.com/gb188UG.png" alt="" width="500" >

#### Paso 11
Para trabajar con Flutter, se tiene que descargar de preferencia la última versión desde su página web principal https://docs.flutter.dev/
<img src="https://i.imgur.com/XKLMOLG.png" alt="" width="500" >



## Diagrama de despliegue

<img src="https://i.imgur.com/oxrcuL4.png" alt="" width="500" >


## Requerimientos Funcionales


|           Requerimiento    |Descripción del requerimiento     |                                           |
|----------------|--------------------------------------|-------------|
|RF1             |`'Los usuarios deben poder registrarse en la aplicación móvil y tendrán que 	 proporcionar la información necesaria como nombre, dni, dirección y más'`            |          |
|RF2             |`"Los usuarios registrados podrán iniciar sesión mediante la credencial añadida a la hora del registro."`            |          |
|RF3             |`"Los usuarios podrán navegar mediante las diferentes opciones del aplicativo y visualizar los productos disponibles y organizarlos segun la categoría que deseen."`|          |
|RF4             |`"Los usuarios tendrán acceso una lupa de busqueda para poder buscar algún producto en especifico."`|          |
|RF5             |`"Los usuarion deben de tener la opción de verificar detalles completos sobre el articulo que deseen comprar como el nombre, descripción, precio y la cantidad de stock disponible."`|          |
|RF6             |`"Los usuarios deben de poder añadir cualquier producto que deseen al carrito de compras, gestionar la cantidad que quieran y eliminar en caso ya no deseen comprarlo."`|          |
|RF7             |`"Los usuarios deben de poder acceder al proceso de compra, proporcionar la información necesaria como nombre, dirección de envio, dni y número de teléfono"`|          |
|RF8             |`"El usuario podrá acceder a su historial de compras a través de la aplicación y en caso tenga una compra actual, verificar el seguimiento del mismo y descargar la boleta o recibo."`|          |
|RF9             |`"Los usuarios deben de poder gestionar el perfil que se hayan creado previamente, asi como la dirección, método pago, cambiar la contraseña y sus datos personales."`|          |
|RF10             |`"Los usuarios podrán añadir productos a un apartado de favoritos y visualizar todos lo que hayan incluido, asi como poder eliminar si  lo desea."`|          |
|RF11             |`"Los usuarios podrán acceder a un apartado donde puedan verificar todas las categorías existentes en el aplicativo."`|          |
|RF12             |`"Los usuarios podrás tener acceso a los diferentes canales de atención para consultas o dudas sobre su compra."`|          |


## Requerimientos No Funcionales


|           Requerimiento    |Descripción del requerimiento     |                                           |
|----------------|--------------------------------------|-------------|
|RNF1             |`'La aplicación debe ser fácil de usar mediante una interfaz intuitiva para que tengan una experiencia fluida.'`            |          |
|RNF2             |`"La aplicación debe estar correctamente optimizado para que pueda ejecutarse en cualquier dispositvo."`            |          |
|RNF3             |`"La aplicación debe de resguardar correctamente los datos personales de los usuarios mediante una seguridad robusta."`|          |
|RNF4             |`"La aplicación debe estar disponible para iOS y android para acceder a un mayor publico de posibles compradores."`|          |
|RNF5             |`"El sistema tiene que tener la capacidad de manejar el gran incremento de usuarion sin dejar de la lado el rendimiento del aplicativo."`|          |
|RNF6             |`"El aplicativo debe estar diseñado para un facil mantenimiento y actualización para añadir nuevas caracteristicas que se deseen implementar en el futuro."`|          |
|RNF7             |`"Los usuarios deben de poder acceder al proceso de compra, proporcionar la información necesaria como nombre, dirección de envio, dni y número de teléfono"`|          |
|RNF8             |`"El aplicativo debe de estar disponible en Google Play Store o en la AppStore para una fácil instalación."`|          |
|RNF9             |`"La aplicación tiene que estar optimizada para el consumo minimo de los datos móviles."`|          |



## Diagrama de Caso de uso (requerimientos funcionales)

  <img src="https://i.imgur.com/ZfUkw0N.png" alt="" width="600" >


## Descripción de casos de uso (Mockups)
### RF1: Registro de usuarios:
Cada nuevo usuario tiene la opción de registrarse en caso de no tener una cuenta para acceder a la aplicación. Para ello, deben ingresar sus datos personales, como nombres, apellidos y DNI, así como un correo electrónico válido para la verificación.
  <img src="https://i.imgur.com/2kUrbAm.png" alt="" width="200" >
### RF2: Inicio de Sesión:
Para tener acceso a compras con mayor seguridad se sugiere al usuario iniciar sesión para poder verificar la identidad del usuario y no tener problemas en el proceso de la compra y entrega del producto.
<img src="https://i.imgur.com/jEm9HxZ.png" alt="" width="200" >

### RF3: Visualización de Productos:
El usuario debe de poder ver todos los articulos disponibles y desplazarse por la diferentes opciones del aplicativo.
<img src="https://i.imgur.com/KgX34A2.png" alt="" width="200" >

### RF4: Búsqueda de Productos:
Para facilitar el acceso a un producto en especifico, se tiene la lupa de busqueda de la aplicación y al mismo tiempo, obtener los resultados más idoneos segun la palabra clave que se incerte dentro de la lupa.
<img src="https://i.imgur.com/ITqDgX1.png" alt="" width="200" >


### RF5: Detalles del Producto:
Para fortalecer la relación entre el cliente y la empresa, es mejor añadir los detalles más importante del producto y de esta manera, el cliente puede comparar con otros productos similares para llegar a una decisión final de compra.
<img src="https://i.imgur.com/NL9gKwn.png" alt="" width="350" >


### RF6: Carrito de Compras:
En este apartado es importante que el cliente pueda tener la opción de agregar la cantidad de articulos a comprar, eliminar del carro de compras y verificar el precio del producto para procedecer con la compra final.
<img src="https://i.imgur.com/FaWJ0mo.png" alt="" width="200" >

### RF7: Proceso de Compra:
En este proceso, es fundamental y de forma obligatoria solicitar al cliente que brinde todos sus datos personales, agregar una dirección correcta para la entrega y permitir que agregue un medio de pago. Del mismo modo, tener un resumen de la compra y verificar el costo final de la compra.
<img src="https://i.imgur.com/QrlERmd.png" alt="" width="200" >

### RF8: Historial de Compras:
El historial de compras proporciona a los clientes la capacidad de visualizar tanto las compras pasadas como las actuales, permitiendo un seguimiento completo del proceso de compra. Además de ver el historial de transacciones, los clientes tienen la opción de descargar las boletas de compra correspondientes. Esta funcionalidad garantiza una experiencia completa y transparente para los clientes, brindándoles acceso a la información necesaria y la documentación relevante para sus compras.
<img src="https://i.imgur.com/9d7MoSj.png" alt="" width="200" >

### RF9: Gestión de Perfil:
La gestión de perfil permite a los usuarios tener control total sobre su información personal. En esta sección, los usuarios pueden añadir, modificar o eliminar datos para asegurarse de que su perfil esté siempre actualizado y preciso. Esta funcionalidad garantiza que los usuarios puedan mantener su información personal de manera fácil y conveniente, asegurando una experiencia personalizada y precisa en la plataforma.
<img src="https://i.imgur.com/NTllirN.png" alt="" width="200" >

### RF10: Favoritos:
La sección de favoritos brinda a los usuarios la capacidad de acceder fácil y rápidamente a los productos que han marcado como favoritos. Además de facilitar la compra de productos preferidos, los usuarios tienen la opción de eliminar productos de su lista de favoritos si así lo desean.
<img src="https://i.imgur.com/9wVUm51.png" alt="" width="200" >

### RF11: Categorías:
En la opción de categorías, los usuarios pueden explorar un listado completo de todos los productos disponibles organizados según características específicas. Esta funcionalidad facilita la búsqueda del cliente al permitirles navegar por categorías temáticas y encontrar fácilmente los productos que se ajusten a sus necesidades y preferencias. 
<img src="https://i.imgur.com/0Vos4OE.png" alt="" width="200" >

### RF12: Canales de Atención:
Los canales de atención al cliente son los diferentes medios disponibles para que los usuarios se comuniquen con el servicio de atención por motivos de dudas o incovenientes por alguna compra realizada.
<img src="https://i.imgur.com/gQozQSg.png" alt="" width="200" >


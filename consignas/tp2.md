# Consigna TP2: Clases y Colecciones

## Objetivos

- Modelado usando objetos y/o clases adecuadamente.
- Trabajar con colecciones evitando soluciones poco declarativas para los problemas planteados.
- Poner en práctica las ideas de encapsulamiento, delegación y polimorfismo.

## Tareas

- :dna: Desarrollar lo necesario para cumplir con los requerimientos pedidos en el archivo `tp2/tp2.wlk`.
- :test_tube: Completar los métodos indicados en el archivo `tp2/tests_tp2.wtest` para la creación de objetos de prueba en base a tu modelo, de modo que los tests puedan ejecutarse. La idea es que tengas libertad para elegir cómo se modelan y configuran los objetos necesarios.

> :bulb: Recordá que podés ayudarte con la [guía de lenguajes](https://docs.google.com/document/d/e/2PACX-1vTlLkakSbp6ubcIq00PU4-Z96tg8CUSc8bO793_uftmiGjfkSn7Ug-F_y0-ieIWG6aWfuoHLJrRL8Fd/pub) y la [documentación oficial de Wollok](https://www.wollok.org/documentacion/wollokdoc/) (buscando los métodos bajo el título **Collection** vas a encontrar la descripción y ejemplos de uso de los mensajes de colecciones que son válidos tanto para listas como sets).

# Supermercado :shopping_cart: :chocolate_bar:	

Queremos hacer un sistema para hacer compras online de modo que se puedan agregar productos al carrito de compras, y hacer diversas consultas para analizar el estado de la compra.

Debemos contemplar dos tipos de productos distintos:
- De venta unitaria, a los cuales nos interesa poder configurarles el **nombre del producto** y el **precio unitario**.

  Por ejemplo, un producto podría tener como nombre `"Aceite de girasol"` y como precio unitario el valor `60.75`.

- De venta por peso, que nos interesa poder configurarles el **nombre del producto**, el **precio por kilo** y el **peso** (en kilogramos) que se está comprando. El precio a abonar por estos productos sería el precio por kilo multiplicado por el peso del producto.

  Por ejemplo, podríamos querer tener un producto por peso cuyo nombre sea `"Queso cremoso"`, el precio por kilo sea `320` y el peso sea `0.3` kilos. Por ende el valor que se debería abonar por ese producto debería ser: `320 * 0.3 => 96`.

## Requerimientos

- Necesitamos poder **agregar productos al carrito**, considerando que debe ser posible agregar un mismo producto al carrito varias veces, lo cual implica que se desea comprar esa cantidad del producto en cuestión.
- Queremos poder determinar:
  - si el carrito **está vacío**, que se cumple cuando no se le agregó ningún producto.
  - **cuántos productos hay** en el carrito en total (si se agrega 2 veces un mismo producto, debe contabilizarse 2 veces).
  - cuál es el **total a abonar** por los productos agregados al carrito.
  - cuál es el **producto más caro** de los que se agregaron al carrito.
    > :warning: En caso de que no hayan productos en el carrito, se espera que esta última consulta falle, ya que no hay una respuesta válida que se pueda dar en ese escenario.
- Además queremos obtener el **detalle de la compra**, que debería ser una **lista con las descripciones** de los productos que se agregaron al carrito, considerando que el detalle de la compra no debería tener descripciones repetidas, y se espera que estén en orden alfabético.

  Las descripciones de los productos dependen del tipo de producto que sea:
    - Para un producto unitario, la descripción es simplemente su nombre.
    - Para un producto de venta por peso, la descripción es un string con el formato: `"<nombre del producto> x <peso del droducto> kg"`.
    
      Por ejemplo, si tenemos un producto de venta por peso cuyo nombre es `"Queso cremoso"` y su peso es `0.3` kilos, la descripción debería ser: `"Queso cremoso x 0.3 kg"`

Los puntos de entrada para estos requerimientos ya están definidos. Dado un objeto `carrito`, que será único en el programa, se espera que se le puedan enviar los siguientes mensajes:

```Wollok
>>> carrito.agregar(producto)
>>> carrito.estaVacio()
>>> carrito.cantidadDeProductos()
>>> carrito.totalAAbonar()
>>> carrito.productoMasCaro()
>>> carrito.detalleDeCompra()
```

> :bulb: Recordá que los tests pueden ayudarte a entender mejor lo que se espera para cada requerimiento. Ante la duda, revisá cuál es el comportamiento esperado :wink:

## Pruebas automáticas :test_tube:

Para que el ejercicio esté completo se debe agregar lo necesario para que los tests en `tp2/tests_tp2.wtest` funcionen, considerando que:
  - Debe completarse el método `crearProductoDeVentaUnitaria(nombre, precioUnitario)`
  - Debe completarse el método `crearProductoDeVentaPorPeso(nombre, precioPorKilo, peso)`

Lo esperado para estos métodos es que **instancien** y **retornen** un producto de venta unitaria y de venta por peso repectivamente, con la configuración adecuada para usarlos desde los tests que ya se encuentran definidos.

## Checkpoint de autorevisión :mag::broom::repeat:

Si estás leyendo esto y todas las pruebas están pasando: :tada: **felicitaciones** :tada: tu solución está cumpliendo con la funcionalidad esperada.

> :exclamation: Si no lo hiciste todavía, asegurate de subir tus cambios de la misma forma que se explicó en el TP0, desde la vista de **Git Staging**.

Sin embargo, todavía hay algo más para hacer antes de dar por terminado el trabajo. No olvides que el desarrollo es un proceso iterativo, nadie pretende que quede todo impecable a la primera pasada :smile:

1. :mag: Revisá la solución en busca de cosas mejorables.
2. :broom: Si encontrás alguna mejora posible, realizala, volvé a correr las pruebas, y si todo está ok, volvé a subir la solución.
3. :repeat: Repetí los pasos anteriores hasta que estés conforme con el resultado.

Prestá especial atención a lo siguiente y evaluá si estás usando adecuadamente los conceptos del paradigma:

- **Encapsulamiento y delegación**: ¿las **responsabilidades** del carrito y los productos están bien repartidas? ¿el carrito te quedó **acoplado** a detalles internos de representación de los productos que no sean relevantes?

- **Polimorfismo**: ¿la representación elegida para los productos te permitió trabajar con ellos desentendiéndote del tipo de producto del que se trataba, o te quedó algún if para decidir qué hacer si es un producto de un tipo o de otro?

- **Estado interno redundante**: ¿Estás usando atributos para recordar valores que dependen de otros atributos que ya tenés?

  Recordá que el estado interno redundante implica más complejidad para asegurar que tu modelo se mantenga **consistente**. Aquellas cosas que puedan calcularse en el momento en el que se necesiten en base a otros datos que sí son independientes, es preferible **que se calculen** y no usar un atributo para recordar ese valor.

- **Atributos con valores default inapropiados**: No está bueno usar defaults para los atributos de una clase que no tengan realmente un buen valor por defecto. Es preferible optar por no inicializar esos atributos, de forma tal que al instanciar esa clase obligatoriamente haya que indicar cuál es el valor que querrías que tenga.

  Eso lleva a tener que pensar cuál es el valor más apropiado **al momento de instanciar el objeto** y no quede mal inicializado por un descuido.

- **Operaciones de conjuntos**: Asegurate de estar trabajando de forma declarativa y aprovechando las operaciones más adecuadas para cada problema.
  - Evitá el uso de `forEach` cuando tu objetivo final no sea producir un efecto sobre cada elemento de un conjunto.
  - Revisá la guía de lenguajes para verificar si aquellos problemas que lograste resolver no tienen otra variante más sencilla con operaciones de más alto nivel.

## Entrega de TP

Una vez que hayas subido tu solución para el trabajo práctico, recordá:
- crear un tag para que se corran las pruebas en el servidor de GitHub, como se explicaba en el TP0,
- crear un issue de entrega para avisar que ya está listo para revisar.

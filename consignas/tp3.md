# Consigna TP3: Herencia

## Objetivos

- Modeladr con clases y herencia adecuadamente, respetando la naturaleza de las entidades de dominio.
- Aprovechar los mecanismos de herencia y redefinición para reutilizar comportamiento.
- Usar y definir tests automáticos para validar la lógica pedida.

## Tareas

- :dna: Resolver la lógica pedida en el archivo `tp3/tp3.wlk`.
- :test_tube: Completar los **tests sin implementar** que están en los archivos con extensión `.wtest` dentro de la carpeta `src/tp3`.

# Naves Espaciales :rocket:

En un futuro distante, donde las actividades se derrollan en un ambiente interplanetario, nos piden un sistema que modele distintas naves.

## Punto de partida

Por ahora, tenemos modelados los siguientes tipos de naves:

- **Naves de carga**: conocemos la masa de la carga que está transportando, medida en toneladas. Se desea saber si la nave **está sobrecargada**, que sucede cuando su carga excede 100 toneladas. También nos interesa conocer su **velocidad máxima** que es de 100.000 kms/seg cuando no está sobrecargada y de 80.000 kms/seg cuando sí lo está.

  Cuando estas naves **reciben una amenaza** se deshacen de toda su carga, dejándola vacía.

- **Naves de pasajeros**: lleva consigo una determinada cantidad de pasajeros + 4 personas destinadas a ser personal de la nave. Se desea conocer la **velocidad máxima** a la que puede viajar, que es de 300.000 kms/seg divido por el tamaño de la tripulación (pasajeros + personal de la nave).

Ya tenemos esta parte del problema resuelta y testeada, pero necesitamos incorporar cambios y asegurar que esto siga funcionando.

> :bulb: El código original puede ser modificado libremente al desarrollar los nuevos requerimientos, siempre y cuando sigan funcionando las pruebas que ya se proveen.

Nos piden extender el sistema anterior para agregar nuevas funcionalidades. **Prestar especial atención en evitar repeticiones de lógica y modelar adecuadamente.**

## Parte 1: Exceso de velocidad

Necesitamos conocer la velocidad a la que está viajando una nave, la cual debe poder variar, y nos interesará saber si una nave está **excedida de velocidad** lo cual se cumple si su velocidad actual supera la velocidad máxima de la nave.

> Es esperable que si no se indica a qué velocidad está yendo una nave, la misma se encuentre detenida.

### Pruebas automáticas :test_tube:

Para que el ejercicio esté completo, más allá de implementar lo pedido en el archivo `src/tp3/tp3.wlk`, deben pasar los tests unitarios que se proveen en `src/tp3/tests_tp3_parte1.wtest` y además implementar las pruebas que faltan. Para ello se propone lo siguiente:

- Testear que una nave de carga que viaja a 75.000 kms/seg y está sobrecargada no está excedida de velocidad, mientras que una que viaja a 81.000 kms/seg sí lo está.
- Testear que una una nave de 6 pasajeros que va a 22.000 kms/seg no está excedida de velocidad, mientras que una que va a esa misma velocidad pero con 10 pasajeros sí lo está.

## Parte 2: Naves de carga de residuos radioactivos

Queremos incorporar un nuevo tipo de nave: las **naves de carga de residuos radioactivos**.

Estas son como las naves de carga que ya tenemos, sólo que se toman precauciones extra para evitar desparramar residuos radioactivos por todo el espacio. Por esto mismo, al **recibir una amenaza** no liberan su carga, sino que **frenan** (quedando su velocidad en 0), con la intención de a entregar la nave.

Además su **velocidad máxima** equivale al 75% de la de una nave de carga normal.

### Pruebas automáticas :test_tube:

Para que el ejercicio esté completo, más allá de implementar lo pedido en el archivo `src/tp3/tp3.wlk`, implementar las pruebas necesarias para verificar el comportamiento de las naves que cargan con residuos radioactivos en `src/tp3/tests_tp3_parte2.wtest`.

## Parte 3: Propulsión

Incorporar a las naves la capacidad de propulsarse, que incrementa su velocidad en 20000. Esto sólo debe ser posible si la nave no está excedida de velocidad. Tampoco deberían poder propulsarle las naves de carga de residuos radioactivos que están sobrecargadas, independientemente de la velocidad a la que estuvieran viajando, porque es demasiado riesgoso.

### Pruebas automáticas :test_tube:

Para que el ejercicio esté completo, más allá de implementar lo pedido en el archivo `src/tp3/tp3.wlk`, desarrollar las pruebas necesarias en `src/tp3/tests_tp3_parte3.wtest`.

> :bulb: Pensá cuál es la forma más adecuada de validar que una nave haya podido propulsarse o no. ¿Qué es lo esperado en cada escenario?

## Checkpoint de autorevisión :mag::broom::repeat:

Si estás leyendo esto, completaste la funcionalidad y las pruebas requeridas y todas están pasando, felicitaciones :tada: No olvides subir la solución que tenés hasta esta instancia!

Sin embargo, todavía hay algo más para hacer antes de dar por terminado el trabajo. No olvides que el desarrollo es un proceso iterativo, nadie pretende que quede todo impecable a la primera pasada :smile:

1. :mag: Revisá la solución en busca de cosas mejorables.
2. :broom: Si encontrás alguna mejora posible, realizala, volvé a correr las pruebas, y si todo está ok, volvé a subir la solución.
3. :repeat: Repetí los pasos anteriores hasta que estés conforme con el resultado.

Prestá especial atención a lo siguiente:

- **Repetición de lógica**: ¿te quedó lógica repetida entre las distintas naves? Asegurate de estar trabajando con **herencia** y estructurando tu solución para aprovechar el **method lookup** lo mejor posible.

- **Estado interno**: Revisá en qué lugares quedaron definidos los distintos atributos. Guiá tus decisiones en base a para qué naves tiene sentido recordar cada pieza de información y para cuáles no.

  > Por ejemplo, ¿sería correcto que las naves de pasajeros tengan también un atributo `carga`?

- **Naturaleza**: al usar herencia ¿estás pensando sólo el la mecánica de reutilización de código?

  :warning: Asegurate de que cada relación de subtipado **tenga sentido** desde un punto de vista de dominio. Por ejemplo, si tenés una clase A que hereda de una clase B preguntate si es cierto que una instancia de A también **es un** B.
  
  Si el día de mañana se incorporara lógica para los B, ¿sería esperable que la incorporen los A automáticamente, o sería una consecuencia inesperada de haber usado herencia incorrectamente?

- **Abstracciones**: ¿encontraste alguna idea de dominio que pueda servir en otros contextos? De ser así, ¿quiénes podrían beneficiarse de dicha abstracción? Analizá esto pensando en quiénes tendría sentido que entiendan cada mensaje.

- **Situaciones excepcionales**: ¿estás asegurando que ante escenarios inválidos el estado del sistema quede consistente y no se ignore el problema?

  Recordá que cada método debe hacer lo que promete, ni más ni menos, y si no puede cumplir con eso, debe fallar adecuadamente lo antes posible.

## Entrega de TP

Una vez que hayas subido tu solución para el trabajo práctico, recordá:
- crear un tag para que se corran las pruebas en el servidor de GitHub, como se explicaba en el TP0,
- crear un issue de entrega para avisar que ya está listo para revisar.

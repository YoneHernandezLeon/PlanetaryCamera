# PlanetaryCamera
Autor: Yone Hernández León

### Descripción de la aplicación
La aplicación consiste en una recreación de un sistema planetario ficticio, junto a la representación de una pequeña nave la cual podrá moverse y desde la que podremos ver el sistema planetario.

### Caracteristicas de la aplicación
Para la realización de esta aplicación primero se realizó el sistema planetario correctamente, y luego se implementó la camara situada en la nave y el movimiento de la misma. La aplicación tiene (aparte de la opción de ver el sistema y rotarlo con el ratón), la opción de cambiar de perspectiva (panoramica o primera persona desde la nave), la opción de mostrar u ocultar las órbitas, y la opción de resetear la posición de la nave a su lugar inicial.

### Decisiones adoptadas para la solución propuesta
Para el sistema planetario, primero se realizó la estrella central, y se implementó su rotación. A continuación se añadió un planeta y se calculó como debería ser su rotación alrededor de la estrella. Una vez calculada esta rotación, se colocaron el resto de los planetas (todos rotando en el mismo eje), y a dos de ellos se les añadió una luna (siguiendo la mecánica seguida con los planetas). Cuando todo estaba correctamente implementado, se cambiaron las rotaciónes de los planetas para que el sistema consiguiese un aspecto más aleatório y natural. Por último, se añadieron las texturas y las órbitas de cada planeta, así como la posibilidad de mover el sistema planetario utilizando el ratón.

Para el movimiento de la nave, primero se probó el cambio de ambos puntos de camara (panorámico y primera persona), y después de ciertos cálculos previos, se estableció la rotación horizontal de la cámara, luego la rotación vertical y luego la propulsión hacia delante. En esta parte del desarrollo de la aplicación fue en la que más fallos se encontraron debido al mal calculo inicial de las fórmulas de movimiento. Por último, se generó la nave y se mostraron en pantalla las instrucciones de uso de la aplicación.

### Resultado de la aplicación
![Animación 1](https://github.com/YoneHernandezLeon/PlanetaryCamera/blob/main/planetarysistemgif.gif?raw=true)

### Errores conocidos
La aplicación es completamente funcional y no tiene errores conocidos. Sin embargo, cabe destacar que no hay implementado un sistema de colisión o similar entre la nave y los planetas. Lo unico que ocurre es que la nave atraviesa los planetas que se le acercan, pero este comportamiento es completamente normal.

### Referencias
##### Fuente de letra:
- https://www.dafont.com/es/star-jedi.font
##### Lenguaje de programación:
- https://processing.org/reference/

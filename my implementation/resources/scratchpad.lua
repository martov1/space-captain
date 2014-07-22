
 
--scratch
object rendering
necesito armar un instances_draw()
tiene que dibujar PRIMERO las cosas que estan arriba de la pantalla y recursivamente las cosas que estan
mas abajo para que lo que esta abajo tape lo que esta arriba si es que ocupa mas de 1 tile hacia arriba
http://eliasdaler.wordpress.com/2013/11/20/z-order-in-top-down-2d-games/

para cada deck va a haber un array que va a contener los objetos en el orden que deben ser dibujados mediante un table.sort
que sera llamado una vez cada X segundos. los va a sortear definiendo cual tiene un Y mas alto que otro





---sctatch
DONE 2)make object creation panel work

press button --> sprite follows mouse and snaps to grid

on click  --> crear objeto


pasos para crear objeto:
DONE 1) crear la instancia en el array de instancias
DONE 2) si la instancia es un objeto y no otra cosa, agregarlo a un deck_array para facilitar el pathfinding
DONE 3) darle al objeto coordenadas en tiles para que pathfinder las use
4) modificar el collision map para que exista colision si el objeto la generase
5) dibujar el objeto en el mapa usando la objets layer
6) updatear el mapa, intentando hacerlo lo menos posible


on right click -->sprite does not follow mouse or snap to grid

---------- pathfinding

1) buscar el objeto requerido iterando en la tabla que contiene los objetos del deck actual
2) si no esta en el deck actual, chequear si existen las decks de arriba y abajo
3) si existen, buscar en una y despues en la otra, seleccionar cual primero al azar
4) cada vez que encontras un objeto, haces el pathfinding, hasta que encuentres el mas cercano en el deck actual o
si no hay ninguno en el deck actual, en el de arriba o el de abajo
5)una vez que en un deck encontraste el objeto mas cercano, navegar hasta el usando sus coordenadas



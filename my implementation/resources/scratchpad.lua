  function self:get_if_currently_inside_node(node)
    local A
    if node:getX() ==self.xtile and node:getY() ==self.ytile then 
      A = true

    else A = false 
      --  print (node:getX(), self.xtile,node:getY(),self.ytile , A)

    end 

    return A
  end

function self:move_to(startx, starty, endx, endy,start_deck,end_deck, speed)
    --print (startx, starty,endx,endy)
    if self.xtile == endx and self.ytile == endy then 
      print("endtile")
      self.end_reached = true 
      if self.y < (endy * tilewidth) then self.y=self.y + tilewidth*self.speed end
      if self.y > (endy * tilewidth) then self.y=self.y - tilewidth*self.speed end
      if self.x < (endx * tilewidth) then self.x= self.x + tilewidth*self.speed end
      if self.x > (endx * tilewidth) then self.x=self.x - tilewidth*self.speed end
--      http://gamedev.stackexchange.com/questions/31410/keeping-player-aligned-to-grid-in-pacman
      if self.x==endx*tilewidth and self.y==endy*tilewidth then 
        self.end_reached = false
        self.xdestination = nil
        self.ydestination = nil
        self.path = nil
        self.timer = 0
  print("ended")
      end
    else self.end_reached = false  end



      if self.end_reached == false  and self.path == nil and endx and endy then
        print("making path!")
        self.path = find_path(startx,starty,endx,endy,start_deck, end_deck)
        self:analize_path(self.path)
        self.step = 1

      end

      if self.end_reached == false and self.path ~= nil then
        print("there is a path")
        if self:get_if_currently_inside_node( self.navegation_nodes[self.step]) == false then
          
          self:move_towards(self.step,self.speed)
        end
        end
        if self:get_if_currently_inside_node( self.navegation_nodes[self.step]) and self.number_of_steps > self.step

        then self.step = self.step + 1 end
      end
  function self:move_towards(A,Speed)


    if self.y < (self.navegation_nodes[A]:getY() * tilewidth) then self.y=self.y + Speed end
    if self.y > (self.navegation_nodes[A]:getY() * tilewidth) then self.y=self.y - Speed end
    if self.x < (self.navegation_nodes[A]:getX() * tilewidth) then self.x= self.x + Speed end
    if self.x > (self.navegation_nodes[A]:getX() * tilewidth) then self.x=self.x - Speed end
    --    if self.y < (((self.navegation_nodes[A]:getY() -1) * tileheight)) then self.y=self.y + Speed end
    --    if self.y > (((self.navegation_nodes[A]:getY()-1) * tileheight)) then self.y=self.y - Speed end
    --    if self.x < (((self.navegation_nodes[A]:getX()-1) * tilewidth)) then self.x= self.x + Speed end
    --    if self.x > (((self.navegation_nodes[A]:getX() -1)* tilewidth)) then self.x=self.x - Speed end
  end

 
 
 
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



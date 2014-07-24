------CREWMAN OBJECT

clases.crewman = {}
function clases.crewman.mouse_pointer ()
  set_mouse_pointer(quads["A1x1.png12"], atlases["A1x1.png"],true)
end
function clases.crewman:create (x,y,deck)

  active_instances_counter =  active_instances_counter + 1 --this is used to assign every instance a unique ID
  local self = {} --create the instance

  self.x = x
  self.speed = 2
  self.y = y
  self.deck = deck
  self.id = active_instances_counter --unique ID of this instance
  self.xtile,self.ytile = determine_grid_coordinates(self)
  self.quad = quads["A1x1.png12"]
  self.atlas = atlases["A1x1.png"]
  self.navegation_nodes= {}
  self.path = nil
  self.number_of_steps = nil
  --here I add data to the instance
  self.datos = "charly!"
  self.name = "manzana"
  --existe manzana.deck para saber en que deck esta el objeto
  self.circulating = nil
  self.current_step = nil
  self.step = nil
  function show_self()
    for a,b in pairs (self) do print (a,b) end
  end
  function move_towards(A,Speed)

    if self.x < (self.navegation_nodes[A]:getX() * tilewidth) then self.x= self.x + Speed end
    if self.x > (self.navegation_nodes[A]:getX() * tilewidth) then self.x=self.x - Speed end
    if self.y < (self.navegation_nodes[A]:getY() * tilewidth) then self.y=self.y + Speed end
    if self.y > (self.navegation_nodes[A]:getY() * tilewidth) then self.y=self.y - Speed end
  end


  function analize_path(apath) --places all nodes in local variables and determines number of steps
    for node, count in apath:nodes() do

      self.navegation_nodes[count] = node
      self.number_of_steps = count
      self.current_step = 1
      --print(self.number_of_steps)

    end
  end

  function self:move_to(startx, starty, endx, endy,start_deck,end_deck, speed)

    if self.xtile == endx and self.ytile == endy then self.end_reached = true  else self.end_reached = false end 

    if self.end_reached == false  and self.path == nil then

      self.path = find_path(startx,starty,endx,endy,start_deck, end_deck)
      analize_path(self.path)
      self.step = 1

    end

    if self.end_reached == false and self.path ~= nil then
      if get_if_currently_inside_node( self.navegation_nodes[self.step]) == false then
        move_towards(self.step,0.01)
      end
      if get_if_currently_inside_node( self.navegation_nodes[self.step]) then self.step = self.step + 1 end
    end
  end






function determine_current_tile ()

  self.xtile,self.ytile = determine_grid_coordinates(self)

end
function get_if_currently_inside_node(node)
  local A
  if node:getX() ==self.xtile and node:getY() ==self.ytile then A = true
  else A = false end 

  return A
end

function self.update ()
  --  CREWMAN NEEDS ----
  determine_current_tile()
  self:move_to(self.xtile,self.ytile,10,10,self.deck,self.deck,0.01)

  --CREWMAN PATHFINDING 

  --moveto()




end
--aca inicializas sus funciones

function self:draw()

  love.graphics.draw(self.atlas, self.quad,self.x,self.y)
end



table.insert(active_instances.crewmen[deck] , self )
end



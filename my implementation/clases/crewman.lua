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

  function show_self()
    for a,b in pairs (self) do print (a,b) end
  end

  function self:move_to(startx, starty, endx, endy,start_deck,end_deck, speed)
   --if there is no current path, calculate one and index all nodes into a list named navegation_nodes
    if self.path == nil then self.path = find_path(startx,starty,endx,endy,start_deck, end_deck)
    	for node, count in self.path:nodes() do
      self.navegation_nodes[count] = node
      self.number_of_steps = count
      --print(self.number_of_steps)
      end
    
    else
    --if there is a path, move towards the first node until you are in it, then move to the next unless it's the destination
    local A = 1
    
    if self.navegation_nodes[A]:getX() == self.xtile and self.navegation_nodes[A]:getY() == self.ytile then
    else
     print (self.navegation_nodes[A+1])
     self.x = self.x + (self.navegation_nodes[A+1]:getX() * tilewidth) * speed
     self.y = self.y + (self.navegation_nodes[A+1]:getY() * tileheight) * speed 
     
   else 
      if A < self.number_of_steps then 
    A = A+1 end
   end
   
    --print(('Step: %d - x: %d - y: %d'):format(count, node:getX(), node:getY()))
    end

    
 
  end
  end
  function determine_current_tile ()
    
    self.xtile,self.ytile = determine_grid_coordinates(self)
    end

  function self.update ()
    --  CREWMAN NEEDS ----
    
    self:move_to(self.xtile,self.ytile,10,10,self.deck,self.deck,2)

    --CREWMAN PATHFINDING 

    --moveto()




  end
  --aca inicializas sus funciones

  function self:draw()

    love.graphics.draw(self.atlas, self.quad,self.x,self.y)
  end



  table.insert(active_instances.crewmen[deck] , self )
end



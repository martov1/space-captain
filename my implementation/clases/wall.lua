------------ Class wall -------------
clases.wall = {}
function clases.wall.mouse_pointer ()
  set_mouse_pointer(quads["A1x1.png11"], atlases["A1x1.png"],true)
end
function clases.wall:create (x,y,deck)
 
  active_instances_counter =  active_instances_counter + 1 --this is used to assign every instance a unique ID
  local self = {} --create the instance

  self.x = x
  self.path_obstruction = true
  
  self.y = y
  self.deck = deck
  self.id = active_instances_counter --unique ID of this instance
  self.xtile,self.ytile = determine_grid_coordinates(self)
  
  self.quad = quads["A1x1.png11"]
  self.atlas = atlases["A1x1.png"]


  --here I add data to the instance
  self.datos = "charly!"
  self.name = "wall"
  --existe wall.deck para saber en que deck esta el objeto
function obstruct_pathfinding()
  if self.path_obstruction == true then end
    
  
  end
function show_self()
  for a,b in pairs (self) do print (a,b) end
end

  function self.update ()
  
  end
  --aca inicializas sus funciones

  function self.draw()
    love.graphics.draw(self.atlas, self.quad,self.x,self.y)
  end

  table.insert(active_instances.furniture[deck] , self )
end



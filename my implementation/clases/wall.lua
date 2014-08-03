------------ Class wall -------------

--walls prevent the crewmen from calculating a path through them



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
function self:obstruct_pathfinding()
  if self.path_obstruction == true then 
    print (self.xtile,self.ytile)
    pathfinding_maps[current_deck][self.ytile][self.xtile] = 1
  else
    pathfinding_maps[current_deck][self.xtile][self.ytile] = 0
    end
    
    
  
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

  
  self:obstruct_pathfinding()
  table.insert(active_instances.furniture[deck] , self )
end



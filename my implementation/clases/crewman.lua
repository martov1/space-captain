------CREWMAN OBJECT

clases.crewman = {}
function clases.crewman.mouse_pointer ()
  set_mouse_pointer(quads["A1x1.png12"], atlases["A1x1.png"],true)
end
function clases.crewman:create (x,y,deck)

  active_instances_counter =  active_instances_counter + 1 --this is used to assign every instance a unique ID
  local self = {} --create the instance

  self.x = x
  self.speed = 0.01
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
  function self:show_self()
    for a,b in pairs (self) do print (a,b) end
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


  function self:analize_path(apath) --places all nodes in local variables and determines number of steps
    for node, count in apath:nodes() do

      self.navegation_nodes[count] = node
      self.number_of_steps = count
      self.current_step = 1
      --print(self.number_of_steps)

    end
  end

  function self:move_to(startx, starty, endx, endy,start_deck,end_deck, speed)
  
    if self.xtile == endx and self.ytile == endy then 
    
      self.end_reached = true 
    if self.y < (endy * tilewidth) then self.y=self.y + self.speed end
    if self.y > (endy * tilewidth) then self.y=self.y - self.speed end
    if self.x < (endx * tilewidth) then self.x= self.x + self.speed end
    if self.x > (endx * tilewidth) then self.x=self.x - self.speed end
    else self.end_reached = false 

    end 

    if self.end_reached == false  and self.path == nil then

      self.path = find_path(startx,starty,endx,endy,start_deck, end_deck)
      self:analize_path(self.path)
      self.step = 1

    end

    if self.end_reached == false and self.path ~= nil then

      if self:get_if_currently_inside_node( self.navegation_nodes[self.step]) == false then

        self:move_towards(self.step,self.speed)

      end
      if self:get_if_currently_inside_node( self.navegation_nodes[self.step]) and self.number_of_steps > self.step

      then self.step = self.step + 1 end
    end
  end






  function self:determine_current_tile ()

    self.xtile,self.ytile = determine_grid_coordinates(self)

  end
  function self:get_if_currently_inside_node(node)
    local A
    if node:getX() ==self.xtile and node:getY() ==self.ytile then 
      A = true

    else A = false 
    --  print (node:getX(), self.xtile,node:getY(),self.ytile , A)

    end 

    return A
  end

  function self:update ()
    --  CREWMAN NEEDS ----
    self:determine_current_tile()
    self:move_to(self.xtile,self.ytile,10,10,self.deck,self.deck,self.speed)

    --CREWMAN PATHFINDING 

    --moveto()




  end
  --aca inicializas sus funciones

  function self:draw()

    love.graphics.draw(self.atlas, self.quad,self.x,self.y)
  end



  table.insert(active_instances.crewmen[deck] , self )
end



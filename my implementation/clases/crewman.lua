------CREWMAN OBJECT

clases.crewman = {}
function clases.crewman.mouse_pointer ()
  set_mouse_pointer(quads["A1x1.png12"], atlases["A1x1.png"],true)
end
function clases.crewman:create (x,y,deck)

  active_instances_counter =  active_instances_counter + 1 --this is used to assign every instance a unique ID
  local self = {} --create the instance
  self.name = "crewman"
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
  self.description = "im a crewman!"
  --existe manzana.deck para saber en que deck esta el objeto
  self.circulating = nil
  self.current_step = nil
  self.step = nil
  self.xdestination = nil
  self.ydestination = nil
  self.timer = 0
  self.xdirection = nil 
  self.ydirection = nil
  self.step = 1
  function self:set_destination(endx, endy)
    if endx and endy then
      --print("destination",endx,endy)
      self.xdestination = endx
      self.ydestination = endy
      self.step = 1
      self.path = nil 
    end
  end
  function self:show_self()
    for a,b in pairs (self) do print (a,b) end
  end


  function self:analize_path(apath) --places all nodes in local variables and determines number of steps
    for node, count in apath:nodes() do

      self.navegation_nodes[count] = node
      self.number_of_steps = count
      self.step = 1
      self:get_direction(self.navegation_nodes[self.step])
      --print(self.number_of_steps)

    end
  end

  function self:determine_current_tile ()

    self.xtile,self.ytile = determine_grid_coordinates(self)

  end



  function self:navegate_to(endx,endy)
    assert (self.speed > 0, "speed in 0 or negative! >:C")
    --determino si llegue a mi destino
    --print (self.x,self.y,endx*tilewidth,endy*tileheight)
    if self.x ~= endx*tilewidth or self.y ~= endy*tileheight then 
      --si no llegue, determino si ya arme un path
      if self.path == nil then 
        --print ("arming path!")
        self.path = find_path(self.xtile,self.ytile,endx,endy) 
        self:analize_path(self.path)
        self:get_direction(self.navegation_nodes[self.step])
        --print ("path armed!")
      end  
      
      if self:arrived(self.navegation_nodes[self.step]) == true and self.navegation_nodes[self.step + 1] then --determino si llegue a un nodo, si llegue y existe otro, marco el otro como destino
      print("increasing from ", self.step," to " , self.step + 1)
        self.step = self.step+1 
         --calculo la direccion al siguiente nodo
      print ("step incresed to ", self.step)
      end
      --if im not in the destination node, move there
      if self:arrived(self.navegation_nodes[self.step]) == false then  
        self:get_direction(self.navegation_nodes[self.step])
        self:approach(self.navegation_nodes[self.step]) 
        --print ("aproaching") 
        end
   
    

 else 
      --si ya llegue, rompo el path
      if self.step ~= 1 or self.path ~= nil then
      print("end of path")
      self.step = 1
      self.path = nil 
      end
  end
end


  function self:get_direction(node)
    --print("getting direction")
    local endx, endy
    
  endx = node:getX()*tilewidth
endy = node:getY()*tileheight

local deltax = endx -  self.x 
local deltay = endy - self.y
if deltax < 0 then self.xdirection = -1 else self.xdirection = 1 end
if deltay < 0 then self.ydirection = -1 else self.ydirection = 1 end
--print ("direction vector is: ", self.xdirection , self.ydirection)
end

function self:arrived()
  --print("arrived() start")
  local endx, endy
endx = self.navegation_nodes[self.step]:getX()*tilewidth  
endy = self.navegation_nodes[self.step]:getY()*tileheight
local deltax = endx -  self.x 
local deltay = endy - self.y
--print(math.abs(deltax),(1+ math.abs(self.xdirection * self.speed )),math.abs(deltay),(1+ math.abs(self.ydirection * self.speed )) )
--if suficiently near, place on the exact position and return true
if math.abs(deltax) <= (1+ math.abs(self.xdirection * self.speed )) and math.abs(deltay) <= (1+ math.abs(self.ydirection * self.speed )) then 
  
  self.x = endx
  self.y = endy
  return true 
  else return false
  end


print("arrive end")
end


function self:approach (node)
   
  --print(self.xdirection,self.ydirection)
  self.x = self.x + (self.xdirection * self.speed )
  self.y = self.y + (self.ydirection * self.speed )
end







function self:update ()
  --  CREWMAN NEEDS ----
  self:determine_current_tile()

  if self.ydestination and self.xdestination then self:navegate_to(self.xdestination,self.ydestination) end

  --CREWMAN PATHFINDING 

  --moveto()




end
--aca inicializas sus funciones

function self:draw()

  love.graphics.draw(self.atlas, self.quad,self.x,self.y)
end



table.insert(active_instances.crewmen , self )
end



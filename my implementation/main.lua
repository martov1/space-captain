function love.load()
if arg[#arg] == "-debug" then require("mobdebug").start() end

require ("obj_manager");
 
 
 load_clases ()
 
end


function love.update(dt)
 
  instance_create ("manzanas",10,20) --DESARROLLANDO ESTA FUNCION
 
  
end


function love.draw ()
  
  
  
  
  end
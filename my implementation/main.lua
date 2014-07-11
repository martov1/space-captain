function love.load()
if arg[#arg] == "-debug" then require("mobdebug").start() end

require ("obj_manager");
 
 debugger = true
 load_clases ()
 testvalue = 0
end


function love.update(dt)

  create_manzana (10,20) --DESARROLLANDO ESTA FUNCION
 create_manzana (10,20)
 create_manzana (10,20)
 create_manzana (10,20)
 create_manzana (10,20)
 create_manzana (10,20)
 
   if (testvalue == 0) then
     testvalue = 1
     for i in pairs (active_instances) do
       print (i) end
     
     instance_show  (3,datos)
       
   end
   
end


function love.draw ()
  
  
  
  
  end
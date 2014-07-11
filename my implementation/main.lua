function love.load()
if arg[#arg] == "-debug" then require("mobdebug").start() end

require ("obj_manager");
require ("tests")
 load_clases ()
 
 --test values, used for debugging, non essential
 test = 1
 testvalue2 = 0
end


function love.update(dt)
if (test >= 1) then  -- runs a test if test = 1
  test = 0
  tests()
  end
   
end


function love.draw ()
  
  
  
  
  end
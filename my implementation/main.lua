function love.load()
if arg[#arg] == "-debug" then require("mobdebug").start() end
require ("ATL")
require ("obj_manager");
require ("tests")
 load_clases ()
 
 --test values, used for debugging, non essential
 test = 1 --if this value is bigger than 0 tests will be run
 
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
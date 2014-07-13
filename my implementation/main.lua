function love.load()
  --debuger
if arg[#arg] == "-debug" then require("mobdebug").start() end
--requires

require("loveframes/")
require ("input")
require ("ATL")
require ("obj_manager");
require ("tests")
 --loaders
 load_clases ()

 set_gui ("main_menu")
  load_guis ()
 --test values, used for debugging, non essential
 test = 1 --if this value is bigger than 0 tests will be run
 
 testvalue2 = 0


end





function love.update(dt)
  -- required stff
  loveframes.update(dt)
   tests()
   
   
  --end of required stuff
 
  

   
end




function love.draw ()
  loveframes.draw()
  
  
  
  end
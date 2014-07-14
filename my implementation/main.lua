function love.load()
  --debuger
if arg[#arg] == "-debug" then require("mobdebug").start() end


 --test values, used for debugging, non essential
 test = 1 --if this value is bigger than 0 tests will be run
 testvalue2 = 0
 draw_the_grid = false


--requires
require ("utilities")
require("loveframes/")
require ("input")
local sti = require("STI")
require ("obj_manager");
require ("tests")
 require("camera")
 
 --initialize needed variables
 map_translation_Y=0
 map_translation_X = 0
 
 --load stuff into memory
 load_clases ()
 load_guis ()
 set_gui ("main_menu")
 map_deck0 = sti.new("maps/untitled")

--- window configuration
love.window.setMode(800, 600, {resizable=true, vsync=false, minwidth=400, minheight=300})
 
 --experimental features


end





function love.update(dt)

  -- required stff
  loveframes.update(dt)
   tests()

   instances_update()
  --end of required stuff
      map_deck0:update(dt)

  

   
end




function love.draw ()

-- DRAW WORLD ---
camera:set()



map_deck0:draw()

draw_grid (map_deck0)

camera:unset()
----DRAW GUI ---
loveframes.draw()
end

function love.resize(w, h) --this stuff is called when window is resized, used mainly for GUI resizing
general_tabs:SetPos(0,h*(4/5))
general_tabs:SetSize(w,h*(1/5))
 construction_panel:SetSize (w,h*(1/5))
 rooms_panel:SetSize (w,h*(1/5))
  objects_panel:SetSize (w,h*(1/5))
  policy_panel:SetSize (w,h*(1/5))
  orders_panel:SetSize (w,h*(1/5))
   map_deck0:resize(w, h)
end
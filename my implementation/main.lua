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
sti = require("STI")
require ("obj_manager");
require ("tests")
 require("camera")
 require("GUI_manager")
 --initialize needed variables
 map_translation_Y=0
 map_translation_X = 0
 deck_loaded = false -- when the game is loaded, no decks (or maps) are currently loaded
 debug_menu_active = false
 --load stuff into memory
 load_clases () --this loades all clases from the clases directory
 debug_menu ()
 

--- window configuration
love.window.setMode(800, 600, {resizable=true, vsync=false, minwidth=400, minheight=300})
 
 --experimental features
 main_menu("activated")


end





function love.update(dt)

  -- required stff
  loveframes.update(dt)
   tests()

   instances_update()
  --end of required stuff
  if deck_loaded == true then
  for i,k in pairs (decks) do
      decks[i]:update(dt)
      
  end
  end

   
end




function love.draw ()


-- DRAW WORLD ---
camera:set()

    --draw the current deck deck
if deck_loaded == true then
  decks[current_deck]:draw(dt)
  love.graphics.print(current_deck, 0, 0) --shows current deck on screen
  end
  if draw_the_grid == true then draw_grid(decks[current_deck])end
   --decks



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
    orders_panel:SetSize (w,h*(1/5))
   
   
   if deck_loaded == true then
  for i in pairs (decks) do
      decks[i]:resize(w,h)
  end
  end
end
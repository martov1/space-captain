function love.load()
  --debuger
  if arg[#arg] == "-debug" then require("mobdebug").start() end



  --requires
  require("profiler")
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
  tilewidth = nil
  tileheight = nil
  current_pointer = nil
  --load stuff into memory
  load_atlases()


  load_clases () --this loades all clases from the clases directory



  --- window configuration
  love.window.setMode(800, 600, {resizable=true, vsync=false, minwidth=400, minheight=300})

  --experimental features
  main_menu("activated")
  set_mouse_pointer() --no arguments, so the current pointer is nil
  --test values, used for debugging, non essential
  test = 1 --if this value is bigger than 0 tests will be run
  testvalue2 = 1
  draw_the_grid = false
  debug_menu ()
  debug_menu:SetVisible (false)

end





function love.update(dt)

deltatime=dt
  -- tests()
if deck_loaded == true then
  
instances_update()
end
  -- required stuff
  loveframes.update(dt)

  --debug stuff
 
end




function love.draw ()


  -- DRAW WORLD ---
  camera:set()

  --draw the current deck deck
  if deck_loaded == true then

    decks[current_deck]:draw(dt)
    love.graphics.print(current_deck, 0, 0) --shows current deck on screen
    love.graphics.draw(atlases["A2x2.png"], quads["A2x2.png21"], 50, 50) --ejemplo de como dibujar un tile
    instances_draw()
     tests()
     
  end
  --draw the grid if necesary
  if draw_the_grid == true then draw_grid(decks[current_deck])end
  --test

  draw_current_pointer()



  camera:unset()
  ----DRAW GUI ---
  loveframes.draw()
  love.graphics.print("Current FPS: "..tostring(love.timer.getFPS( )), 10, 10)

end

function love.resize(w, h) --this stuff is called when window is resized, used mainly for GUI resizing
  if general_tabs then general_tabs:SetPos(0,h*(4/5))
    general_tabs:SetSize(w,h*(1/5))
    construction_panel:SetSize (w,h*(1/5))
    rooms_panel:SetSize (w,h*(1/5))
    objects_panel:SetSize (w,h*(1/5))
    orders_panel:SetSize (w,h*(1/5))
  end

  if deck_loaded == true then
    for i in pairs (decks) do
      decks[i]:resize(w,h)
    end
  end
end
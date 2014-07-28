local function object_selected() --checks if the user is selecting an instance
  if deck_loaded == true and  object_to_build_on_next_click == nil then
    local x,y =get_current_mouse_tile_coordinates()
    
    for index,crewman in pairs(active_instances.crewmen) do
--mouse_over_object(crewman,area_in_tiles)

--      if crewman.xtile == x and crewman.ytile == y then
--        print (crewman.xtile)
--        create_object_info_panel(crewman) break end

      end
    end
  end
  
  local function mouse_over_object(object,area_in_tiles)
 
    if object.x then
     
    if object.x >love.mouse.getX() and object.x < (love.mouse.getX() + tilewidth) then print ("jaja")
    end
  end
  end
  local function  build_object_on_next_click() --spawns an object on next click
    build_objects(mouse_x_position,mouse_Y_position,object_to_build_on_next_click,current_deck) 
  end


  local function cancel_build() --stop spawning objects on click
    if object_to_build_on_next_click ~= nil then
      set_mouse_pointer()
      object_to_build_on_next_click = nil
    end

  end
  local function left_click()
    build_object_on_next_click() --checks if an object needs to be built on next click
    --object_selected()
  end

  local function right_click()
    cancel_build()
    if debug_menu.hover then debug_right_click_menu() end
  end



  function love.mousepressed(x, y, button)

    if button == "l" then left_click() end
    if button == "r" then right_click() end
    loveframes.mousepressed(x, y, button)


  end





  function love.mousereleased(x, y, button)
    if button == "l" then mouse_pressed = false end

    -- your code

    loveframes.mousereleased(x, y, button)

  end

  function love.keypressed(key, unicode )


    loveframes.keypressed(key, isrepeat ) -- needed for loveframes

    if key == "down" then map_translation_Y = map_translation_Y - 20 end
    if key == "up" then map_translation_Y = map_translation_Y + 20 end
    if key == "left" then map_translation_X = map_translation_X + 20 end
    if key == "right" then map_translation_X = map_translation_X - 20 end

    if key == "s" and current_deck  ~= 1 then current_deck = current_deck -1 end
    if key == "w" and current_deck < number_of_decks then current_deck = current_deck +1 end
    if key == "tab" then --show / hide debug menu
      if debug_menu:GetVisible () == false then 
        debug_menu:SetVisible (true)
      else if debug_menu:GetVisible () == true then debug_menu:SetVisible (false)  end
    end
  end





  love.graphics.translate(map_translation_X,map_translation_Y)
end


function love.keyreleased(key)

  -- your code

  loveframes.keyreleased(key)

end

function love.textinput(text)

  -- your code

  loveframes.textinput(text)

end




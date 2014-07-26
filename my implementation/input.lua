function love.mousepressed(x, y, button)
  if button == "l" and object_to_build_on_next_click ~= nil then
    build_objects(mouse_x_position,mouse_Y_position,object_to_build_on_next_click,current_deck) 
 end
  if button == "r" and  object_to_build_on_next_click ~= nil then
    set_mouse_pointer()
    object_to_build_on_next_click = nil

  end

  loveframes.mousepressed(x, y, button)
  if debug_menu.hover and button == "r" then debug_right_click_menu() end

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



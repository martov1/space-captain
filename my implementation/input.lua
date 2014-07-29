
selection = nil
local lastclick = 0
local clickInterval = 0.3 --Number of seconds between double clicks 
local function debug_move_crewman_to(crewman,x,y)
  if crewman and x and y then
  crewman:set_destination(x,y)
  end
end
local function mouse_over_object(object)
  if object.x then
    if object.x <love.mouse.getX() and object.x > (love.mouse.getX() - tilewidth) then
      if object.y < love.mouse.getY() and object.y > (love.mouse.getY () - tileheight) then
        return true
      end
    end


  end
end


local function object_selected() --checks if the user is clicking an instance
  if deck_loaded == true and  object_to_build_on_next_click == nil then
    

    for index,crewman in pairs(active_instances.crewmen) do
      if  mouse_over_object(crewman) == true then

        return crewman

      end
    end
  end
end


local function open_properties_window (object)

  if object then

    create_object_info_panel(object)
  end
end

local function  build_object_on_next_click() --spawns an object on next click
  build_objects(mouse_x_position,mouse_y_position,object_to_build_on_next_click,current_deck) 
end


local function cancel_build() --stop spawning objects on click
  if object_to_build_on_next_click ~= nil then
    set_mouse_pointer()
    object_to_build_on_next_click = nil
  end

end
local function left_click()
 
  object_selected()
  build_object_on_next_click() --checks if an object needs to be built on next click
 
  selection = object_selected() --placed the selected object in a variable

end

local function double_left_click()
   open_properties_window(selection)
  
  end
local function right_click()
   if selection and selection.name == "crewman" then debug_move_crewman_to(selection,mouse_x_tile,mouse_y_tile)end
  cancel_build()
  if debug_menu.hover then  debug_right_click_menu() end

end



function love.mousepressed(x, y, button)

  if button == "l" then left_click() end
  if button == "r" then right_click() end
  
    if button=="l" then --Left click
        local time =  love.timer.getTime ()
        if time <= lastclick + clickInterval then
            double_left_click()
        else
            lastclick = time
        end
    end

  
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




function love.mousepressed(x, y, button)
 
    -- your code
 
    loveframes.mousepressed(x, y, button)
 
end
 
function love.mousereleased(x, y, button)
 
    -- your code
 
    loveframes.mousereleased(x, y, button)
 
end
 
function love.keypressed(key, unicode )
   
    
    loveframes.keypressed(key, unicode) -- needed for loveframes
    
if key == "down" then map_translation_Y = map_translation_Y - 20 end
if key == "up" then map_translation_Y = map_translation_Y + 20 end
if key == "left" then map_translation_X = map_translation_X + 20 end
if key == "right" then map_translation_X = map_translation_X - 20 end
if key == "s" then current_deck = current_deck -1 end
  if key == "w" then current_deck = current_deck +1 end



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



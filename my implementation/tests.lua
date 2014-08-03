
function show_loaded_clases ()

  for y,k in pairs (clases_list) do 
    print (clases_list[k] )
  end


end



function tests () -- for tests that only need to be called once

  print ("----------LOADED CLASES----------")
    show_loaded_clases()
    print("----------END OF LOADED CLASES------")

     for i,k in pairs(pathfinding_maps[current_deck][2]) do print (i,k)end


    end






    function runtime_tests() --for tests that need to be called every draw cycle
      if show_pathfinding_map == true then
        decks[current_deck]:drawCollisionMap(pathfinding_data[current_deck])
      end
      love.graphics.print("Current mouse tile: ".."X "..mouse_x_tile.." Y "..mouse_y_tile, 10, 30)
    end 

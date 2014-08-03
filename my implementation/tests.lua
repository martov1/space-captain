
function show_loaded_clases ()

  for y,k in pairs (clases_list) do 
    print (clases_list[k] )
  end


end



function tests ()

  print ("----------LOADED CLASES----------")
    show_loaded_clases()
    print("----------END OF LOADED CLASES------")

      for i,k in pairs(pathfinding_maps[1][1]) do print (i,k)end


    end






    function runtime_tests()
      if show_pathfinding_map == true then
        decks[current_deck]:drawCollisionMap(pathfinding_data[current_deck])
      end
    end 

------CREWMAN OBJECT


clases.crewman = {}
function clases.crewman.mouse_pointer ()
  --set_mouse_pointer(quads["A1x1.png11"], atlases["A1x1.png"],true)
end
function clases.crewman:create (x,y,deck)
 
  active_instances_counter =  active_instances_counter + 1 --this is used to assign every instance a unique ID
  local crewman_instance = {} --create the instance

  crewman_instance.x = x

  crewman_instance.y = y
  crewman_instance.deck = deck
  crewman_instance.id = active_instances_counter --unique ID of this instance
  --crewman_instance.xtile,crewman_instance.ytile = determine_grid_coordinates(crewman_instance,deck)
  crewman_instance.quad = quads["A1x1.png12"]
  crewman_instance.atlas = atlases["A1x1.png"]


  --here I add data to the instance
  crewman_instance.datos = "charly!"
  crewman_instance.name = "manzana"
  --existe manzana.deck para saber en que deck esta el objeto



  function crewman_instance.update ()


  end
  --aca inicializas sus funciones

  function crewman_instance.draw()

    love.graphics.draw(crewman_instance.atlas, crewman_instance.quad,crewman_instance.x,crewman_instance.y)
  end

  table.insert(active_instances.crewmen[current_deck] , crewman_instance )
end



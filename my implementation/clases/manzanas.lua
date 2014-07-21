------------ Class manzana -------------
clases.manzana = {}
function clases.manzana.mouse_pointer ()
  set_mouse_pointer(quads["A1x1.png11"], atlases["A1x1.png"],true)
end
function clases.manzana.create (x,y,deck)
  print (x,y,deck)
  active_instances_counter =  active_instances_counter + 1 --this is used to assign every instance a unique ID
  local manzana_instance = {} --create the instance

  manzana_instance.x = y

  manzana_instance.y = deck
  manzana_instance.deck = x
  manzana_instance.id = active_instances_counter --unique ID of this instance
  --manzana_instance.xtile,manzana_instance.ytile = determine_grid_coordinates(manzana_instance,deck)
  manzana_instance.quad = quads["A1x1.png11"]
  manzana_instance.atlas = atlases["A1x1.png"]


  --here I add data to the instance
  manzana_instance.datos = "charly!"
  manzana_instance.name = "manzana"
  --existe manzana.deck para saber en que deck esta el objeto



  function manzana_instance.update ()


  end
  --aca inicializas sus funciones

  function manzana_instance.draw()

    love.graphics.draw(manzana_instance.atlas, manzana_instance.quad,manzana_instance.x,manzana_instance.y)
  end

  table.insert(active_instances , manzana_instance )
end



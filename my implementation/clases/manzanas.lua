------------ Class manzana -------------
clases.manzana = {}
  
function clases.manzana.create (x,y,deck)
  print ("hola")
active_instances_counter =  active_instances_counter + 1 --this is used to assign every instance a unique ID
local manzana_instance = {} --create the instance
manzana_instance.x = x
manzana_instance.y = y
manzana_instance.deck = deck
manzana_instance.id = active_instances_counter --unique ID of this instance
manzana_instance.xtile,manzana_instance.ytile = determine_grid_coordinates(manzana_instance)
manzana_instance.tile = quads[A1x1.png11]
 
 

--here I add data to the instance
manzana_instance.datos = "charly!"
manzana_instance.name = "manzana"
--existe manzana.deck para saber en que deck esta el objeto



function manzana_instance.update ()


    end
--aca inicializas sus funciones

 function manzana_instance.draw()

   
 end
 
table.insert(active_instances , manzana_instance )
end

function clases.manzana.build ()
 set_mouse_pointer(quads["A1x1.png11"], atlases["A1x1.png"],true)

end

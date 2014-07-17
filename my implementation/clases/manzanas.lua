------------ OBJ manzana -------------

function create_manzana (x,y,deck)
active_instances_counter =  active_instances_counter + 1 --this is used to assign every instance a unique ID
local manzana = {} --create the instance
manzana.x = x
manzana.y = y
manzana.deck = deck
manzana.id = active_instances_counter --unique ID of this instance
manzana.xtile,manzana.ytile = determine_grid_coordinates(manzana)
manzana.tile = quads[A1x1.png11]
 
 

--here I add data to the instance
manzana.datos = "charly!"
manzana.name = "manzana"
--existe manzana.deck para saber en que deck esta el objeto



function manzana.update ()


    end
--aca inicializas sus funciones

 function manzana.draw()

   
 end
 
table.insert(active_instances , manzana )
end

function build_manzana ()
  
  end
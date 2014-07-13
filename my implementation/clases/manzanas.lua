------------ OBJ manzana -------------

function create_manzana (x,y)





active_instances_counter =  active_instances_counter + 1
local manzana = {}

manzana.id = active_instances_counter
manzana.datos = "charly!"
manzana.name = "manzana"
    function manzana.update ()


    end
--aca inicializas sus funciones


table.insert(active_instances , manzana )









end


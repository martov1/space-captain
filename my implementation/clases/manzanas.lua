------------ OBJ manzana -------------

function create_manzana (x,y)
active_instances.id = active_instances.id + 1
local manzana = {}

manzana.id = table.maxn(active_instances)
manzana.datos = "charly!"

--aca inicializas sus funciones


table.insert(active_instances , active_instances.id, manzana )
end


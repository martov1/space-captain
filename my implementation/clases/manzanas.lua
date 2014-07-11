------------ OBJ manzana -------------

function create_manzana (x,y)
active_instances.id = active_instances.id + 1
local manzana = {}
table.insert(active_instances , active_instances.id, manzana )
manzana.id = table.maxn(active_instances)
manzana.id = active_instances.id

--aca inicializas sus funciones



end


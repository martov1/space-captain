function create_wall (x,y)





active_instances_counter =  active_instances_counter + 1
local wall = {}

wall.id = active_instances_counter
wall.name = "wall"

    function wall.update ()


    end
--aca inicializas sus funciones


table.insert(active_instances , wall )









end


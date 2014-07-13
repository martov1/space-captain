 clases_list = {} --list of all clases in /clases
 clases_loader = love.filesystem.getDirectoryItems( "clases/")
 GUIloader= love.filesystem.getDirectoryItems( "guis/")
 active_instances = {} --contains all the created instances in the game
 files_list = {} --contains a list of clases files
 GUIs_list = {} --contains a list of loaded GUIs
 
 active_instances_counter = 0 -- every time an object is created this increases by 1 and the previous number is assigned as the created instance's unique ID number
 
 
 function load_clases () --load all object filenames into clases_list and subtract ".lua" on each name, then load all clases
    
   for i,k in pairs (clases_loader) do 
     x = string.gsub( k, ".lua", "")  
     clases_list[x]=x 
     require ("clases/" .. clases_list[x] )
     end

end


function instance_destroy (someid)
  
    active_instances[someid] = nil
end




function instance_modify (someid, variable, modification)
    local i
    local k
    local A
    A = active_instances[someid]
    A[variable] = modification
  end
    

function instance_show (someid)
 
 if (someid == nil) then
 for i,k in pairs (active_instances) do
 print (i,k.name) end
 
 
 else
 local A = active_instances[someid]
 for i,k in pairs (A) do print (i , k) end
 
 
 end
  
end




function set_gui (name_of_gui)
loveframes.SetState(name_of_gui )  
end
function load_guis ()
  
  for i,k in pairs (GUIloader) do 
     x = string.gsub( k, ".lua", "")  
     GUIs_list[x]=x 
     require ("guis/" .. GUIs_list[x] )
     end
  
  
end

function instances_update ()

  for k,i in pairs (active_instances) do
 if i.update then i:update() end 
end  

end



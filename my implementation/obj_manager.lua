 clases_list = {}
 loader = love.filesystem.getDirectoryItems( "clases/")
 active_instances = {}
 files_list = {}
 
 active_instances.id = 0
 
 
 function load_clases () --load all object filenames into clases_list and subtract ".lua" on each name, then load all clases
    
   for i,k in pairs (loader) do 
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
  
 local A = active_instances[someid]
 for i,k in pairs (A) do print (i , k) end
 
  
end



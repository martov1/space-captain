 clases_list = {}
 loader = love.filesystem.getDirectoryItems( "clases/")
 active_instances = {}
 files_list = {}

 function load_clases () --load all object filenames into clases_list and subtract ".lua" on each name, then load all clases
    
   for i,k in pairs (loader) do 
     x = string.gsub( k, ".lua", "")  
     clases_list[x]=x end


   for i,k in pairs (loader) do 
     files_list[k]=k 
     love.filesystem.load( "clases/" .. files_list[k] )  --load the clases in the /clases directory
     end


end




function instance_create (name, x, y) ---QUEDE ACA
  --check if there is such an object, error if it does not exist
  if clases_list[name] then 
    
  
   
    
    
    else error ("EL OBJETO ".. name .. " NO EXISTE") end
--create it




end
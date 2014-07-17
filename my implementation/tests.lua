
function show_loaded_clases ()
  
  for y,k in pairs (clases_list) do 
     print ("clases/" .. clases_list[k] )
     end
  

end

function show_guis ()
  for i,k in pairs (GUIloader) do 
     x = string.gsub( k, ".lua", "")  
     GUIs_list[x]=x 
     print ("guis/" .. GUIs_list[x] )
     end
  end

function tests ()
 if (test >= 1) then  -- runs a test if test = 1
  test = 0
   print ("LOADED CLASES")
 show_loaded_clases()
 print ("LOADED GUIS")
profiler = newProfiler()
profiler_activated = true
    profiler:start()
show_guis()


  end


end


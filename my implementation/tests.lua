
function show_loaded_clases ()
  
  for y,k in pairs (clases_list) do 
     print (clases_list[k] )
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
 
   print ("----------LOADED CLASES----------")
 show_loaded_clases()
 print("----------END OF LOADED CLASES------")

show_guis()


  end





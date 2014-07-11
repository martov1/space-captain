
function show_loaded_clases ()
  
  for y,k in pairs (clases_list) do 
     print ("clases/" .. clases_list[k] )
     end
  

end

function tests ()
 print ("LOADED CLASES")
 show_loaded_clases()


end
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


function draw_grid (map)
 
if draw_the_grid == true then
  local A
  local R
      love.graphics.setLineStyle('rough')      
      love.graphics.setColor(100,100,100)
  
  for R=0 ,map.width do --- draw vertical lines
    love.graphics.line( R*map.tilewidth,0, R*map.tilewidth,map.height*map.tileheight  )
    end   
    
    
    for A=0 , map.height do -- draw horizontal lines
    love.graphics.line( 0,A*map.tileheight,  map.width*map.tilewidth ,A*map.tileheight  )
    end
  end
end


function load_decks (ship) -- loads all files in  decks(maps) of the selected ship (located at maps/ships) into STI
  for i,k in pairs ( love.filesystem.getDirectoryItems( "maps/ships/"..ship )) do
  

  decks={}
   decks[i] = sti.new("maps/ships/"..ship.."/".."deck" ..i)
    
    deck_loaded = true
     
   end
  
  
  
  end
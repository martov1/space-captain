 clases_list = {} --contains a list of all clases in /clases folder
 clases_loader = love.filesystem.getDirectoryItems( "clases/")
 GUIloader= love.filesystem.getDirectoryItems( "guis/")
 active_instances = {} --contains all the created instances in the game
 files_list = {} --contains a list of clases files
 GUIs_list = {} --contains a list of loaded GUIs
 active_instances_counter = 0 -- every time an object is created this increases by 1 and the previous number is assigned as the created instance's unique ID number
 atlas_loader = love.filesystem.getDirectoryItems( "resources/tilemaps/atlases") --contains the names of the atlases files
 atlas_list={}
 atlases = {}
 quads = {}
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
 current_deck = 1
 decks={}
 
 local A
for A,B in pairs (love.filesystem.getDirectoryItems( "maps/ships/"..ship )) do
   decks[A] = sti.new("maps/ships/"..ship.."/".."deck" ..A)
   number_of_decks = A
 end
 
 deck_loaded = true
  tilewidth = decks[1].tilewidth
 tileheight = decks[1].tileheight
 make_quads()
 return (A)
 end

function determine_grid_coordinates(instance_or_object) --determines in what grid coordinates is an object based on it's current x,y and deck (so that if for whatever reason one deck were to be different in size to another, it wount crash)
 local grid_coordinates_x = math.floor(instance_or_object.x
   / decks[instance_or_object.deck].tilewidth) + 1--derermines X grid coordinate by dividing the current x coordinate of the object by the tilewidth of the current deck and then taking the whole number only
  local grid_coordinates_y = math.floor(instance_or_object.y / decks[instance_or_object.deck].tileheight) + 1 --here, but for Y
  return grid_coordinates_x,grid_coordinates_y
  end


function load_atlases () -- here I load all the atlases in resources/tilemaps/atlases
    for i,k in pairs (atlas_loader) do 
      atlases[k] = love.graphics.newImage("resources/tilemaps/atlases/".. k )
    --  for i,k in pairs (atlases) do print (i,k)end --activate this to list all loaded atlases in output
      
    end
  end

function make_quads () -- here the quads are made, this will need some touch when adding atlases
  local i,k,x,y
  for i,k in pairs (atlases) do
    --this block finds atlases with "1x1" in their file name and makes quads of 1 tile x 1 tile sin size. 
    --the tile size is determined by the "tilesize" variable, that get's it's data from deck[1]
    
    if string.find(i, "1x1") ~= nil then --if "1x1" is in the name of the file (file names are contained in "atlases")
      for x=1, atlases[i]:getWidth()/tilewidth do
        for y=1, atlases[i]:getHeight()/tileheight do
          
          quads[i..x..y] = love.graphics.newQuad( tilewidth*(x-1), tileheight*(y-1), tilewidth, tileheight, atlases[i]:          getWidth(), atlases[i]:getHeight())
        
        end
      end 
    end
   
    
  end
  --for i,k in pairs(quads) do print (i,k) end --prints the quads
end

function transform_into_grid_coordinates()
  
  
  end

--end of doc
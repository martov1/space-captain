 clases_list = {} --contains a list of all clases in /clases folder
 clases={} --contains all actual clases
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
    clases_loader = love.filesystem.getDirectoryItems( "clases/")
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
    --for i,k in pairs (atlases) do print (i,k)end --activate this to list all loaded atlases in output
      
    end
  end

function make_quads () -- automatically generates quads based on the atlases in resources/tilemaps/atlases, their name, size and the configured tilewidth and tileheigt if an atlas has 1x1 in it's filename then 1 tile by 1 tile quads will be made for the atlas, the name for each quad will be quads[(name of the atlas file)(x coordinate in tiles)(y coordinate in tiles)] for example,        quads[Atlas1x1.png12] is the image in the first tile in the second row, in the file "Atlas1x1.png"
  local i,k,x,y
  for i,k in pairs (atlases) do
    --this block finds atlases with "1x1" in their file name and makes quads of 1 tile x 1 tile sin size. 
    --the tile size is determined by the "tilesize" variable, that get's it's data from deck[1]
    
    if string.find(i, "1x1") ~= nil then --if "1x1" is in the name of the file (file names are contained in "atlases")
      for x=1, atlases[i]:getWidth()/tilewidth do
        for y=1, atlases[i]:getHeight()/tileheight do
          
          quads[i..x..y] = love.graphics.newQuad( tilewidth*(x-1), tileheight*(y-1), tilewidth, tileheight, atlases[i]:              getWidth(), atlases[i]:getHeight())
        
        end
      end 
    end
        --this block finds atlases with "2x1" in their file name and makes quads of 1 tile x 1 tile sin size. 
    --the tile size is determined by the "tilesize" variable, that get's it's data from deck[1]
    
    if string.find(i, "1x2") ~= nil then --if "1x2" is in the name of the file (file names are contained in "atlases")
      for x=1, atlases[i]:getWidth()/tilewidth do
        for y=1, atlases[i]:getHeight()/(tileheight*2) do 
          
          quads[i..x..y] = love.graphics.newQuad( tilewidth*(x-1), 2*tileheight*(y-1), tilewidth, tileheight*2, atlases[i]:          getWidth(), atlases[i]:getHeight())
        
        end
      end 
      
    end
    --this block finds atlases with "2X2" in their file name and makes quads of 1 tile x 1 tile sin size. 
    --the tile size is determined by the "tilesize" variable, that get's it's data from deck[1]
    if string.find(i, "2x2") ~= nil then --if "1x2" is in the name of the file (file names are contained in "atlases")
      for x=1, atlases[i]:getWidth()/tilewidth*2 do
        for y=1, atlases[i]:getHeight()/(tileheight*2) do
          
          quads[i..x..y] = love.graphics.newQuad( 2*tilewidth*(x-1), 2*tileheight*(y-1), tilewidth*2, tileheight*2, atlases[i]:          getWidth(), atlases[i]:getHeight())
        
        end
      end 
      
    end
  
  end
  --for i,k in pairs(quads) do print (i,k) end --prints the quads
end

function transform_into_grid_coordinates(x,y)
  local tileX,tileY
  tileX = math.floor(x/tilewidth)
  tileY = math.floor(y/tileheight)
  
  return tileX,tileY
  end

--end of doc
function get_current_mouse_tile_coordinates()
   local x,y
   
   x,y = transform_into_grid_coordinates(love.mouse.getX(),love.mouse.getY())
   return x,y
  
end



function build_objects (x, y,object) --spawns an instance of object in x and y coordinates
  if object_to_build_on_next_click then

tilex,tiley = transform_into_grid_coordinates(x,y)
tilex = tilex * tilewidth
tiley = tiley * tileheight
clases[object]:create(tilex,tiley,decks[current_deck])
   
    
 
 end
    
  
end

function instances_draw ()

  for k,i in pairs (active_instances) do
 if i.update then i:draw() end 
end  

end

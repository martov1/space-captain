clases_list = {} --contains a list of all clases in /clases folder
clases={} --contains all actual clases
active_instances = {} --contains all the created instances in the game
active_instances.crewmen = {} -- contains all crew members
active_instances.furniture = {}
files_list = {} --contains a list of clases files
active_instances_counter = 0 -- every time an object is created this increases by 1 and the previous number is assigned as the created instance's unique ID number
atlas_loader = love.filesystem.getDirectoryItems( "resources/tilemaps/atlases") --contains the names of the atlases files
atlas_list={}
atlases = {}
quads = {}
pathfinding_maps = {} -- holds each deck navegation map for pathfinding
function load_clases () --load all object filenames into clases_list and subtract ".lua" on each name, then load all clases
  clases_loader = love.filesystem.getDirectoryItems( "clases/")
  for i,k in pairs (clases_loader) do 
    x = string.gsub( k, ".lua", "")  
    clases_list[x]=x 
    require ("clases/" .. clases_list[x] )
  end

end


function instance_destroy (someid) -- TO DO


end







function instance_show (someid)

  if (someid == nil) then
    print ("FURNITURE type instances:")
    for i,k in pairs (active_instances.furniture) do

      for A,B in pairs (active_instances.furniture[i]) do
        print ("index: ",A,"object: ",B.name," in deck:  ",B.deck) 
      end
    end
    print ("CREWMEN type instances:")
    for A,B in pairs (active_instances.crewmen) do

      print ("index: ",A,"object: ",B.name)
    end
  end
end






function instances_update () --call the update function of all objects (on all decks)
  for A = 1 , number_of_decks do
    for k,i in pairs (active_instances.furniture[A]) do
      if i.update then i:update() end 

    end  
    for k,i in pairs (active_instances.crewmen) do

      if i.update then i:update() end 
    end  
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
  --here I load the maps into variables for later use
  decks={}
  local A
  for A,B in pairs (love.filesystem.getDirectoryItems( "maps/ships/"..ship )) do
    decks[A] = sti.new("maps/ships/"..ship.."/".."deck" ..A)
    --and determine how many decks does this ship have
    number_of_decks = A  
  end
  deck_loaded = true
  tilewidth = decks[1].tilewidth
  tileheight = decks[1].tileheight
  --using the info about tile size I got, I can now make the quads from the tilesets
  make_quads()
  --and count the number of decks so that I can make assign objects into lists sorted by deck
  for A=1, number_of_decks do
    active_instances.furniture[A] = {}
    pathfinding_maps[A] = {}

  end
  --for i,k in pairs (active_instances.furniture) do print(i,k) end

  load_pathfinding_map()
  return (A)
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
  tileX = math.ceil(x/tilewidth) 
  tileY = math.ceil(y/tileheight) 
  return tileX,tileY
end

--end of doc
function get_current_mouse_tile_coordinates()
  local x,y
  x,y = transform_into_grid_coordinates(mouse_x_position,mouse_y_position)
  
  
  mouse_x_tile = x 
  mouse_y_tile = y 
  return x,y
end

function build_objects (xtile, ytile,object,deck) --spawns an instance of object in x and y coordinates

  if object_to_build_on_next_click then
     --////-----------------------DIRTY BUG PATCH!!!!----------------------
     xtile = (xtile-1) * tilewidth ---- EL -1 NO DEBERIA HACER FALTA!
    ytile = (ytile-1) * tileheight ---- EL -1 NO DEBERIA HACER FALTA!
    -------------------------DIRTY BUG PATCH!!!!-------------------\\\\\\---
    clases[object]:create(xtile,ytile,deck)
  end

end

function instances_draw () --draws all the objects in the current deck (for now)
  --draw furniture
  for k,i in pairs (active_instances.furniture[current_deck]) do
    if i.draw then i:draw() end 
  end  
  --draw crewmen on top of furniture
  for k,i in pairs (active_instances.crewmen) do
    if i.deck == current_deck then
    if i.draw then i:draw() end 
    end
  end  
end


function load_pathfinding_map ()
  pathfinding_data = {}
  for A=1, number_of_decks do
    pathfinding_data[A] = decks[A]:getCollisionMap(2) --pathfinding map is the second layer of the tiled map
    pathfinding_maps[A] = pathfinding_data[A].data
  end
end

function find_path(startx,starty,endx,endy,start_deck, end_deck) 

  if start_deck == end_deck then 

    local map = pathfinding_maps[1]
    -- Value for walkable tiles
    local walkable = 0

    -- Library setup
    local Grid = require ("jumper/jumper.grid") -- The grid class
    local Pathfinder = require ("jumper/jumper.pathfinder") -- The pathfinder lass

    -- Creates a grid object
    local grid = Grid(map) 
    -- Creates a pathfinder object using Jump Point Search
    local myFinder = Pathfinder(grid, 'JPS', walkable) 

    -- Define start and goal locations coordinates


    -- Calculates the path, and its length
    local path = myFinder:getPath(startx, starty, endx, endy)
    if path then
      print ("path encontrado")
      for node, count in path:nodes() do
        print (node:getX(),node:getY())
      end	
    else print ("no path!")end
    return path
  end
  --> Output:
  --> Path found! Length: 8.83
  --> Step: 1 - x: 1 - y: 1
  --> Step: 2 - x: 1 - y: 3
  --> Step: 3 - x: 2 - y: 4
  --> Step: 4 - x: 4 - y: 4
  --> Step: 5 - x: 5 - y: 3
  --> Step: 6 - x: 5 - y: 1

end




  
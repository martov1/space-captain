function main_menu (activated)


main_menu_frame = loveframes.Create("frame")
main_menu_frame:SetWidth (400)
main_menu_frame:SetHeight(400)

--START button
local startbutton = loveframes.Create("button", main_menu_frame)
startbutton:SetWidth(200)
startbutton:CenterX ()
startbutton:SetY (main_menu_frame:GetHeight()*(2/10))
startbutton:SetText("new game")
startbutton.OnClick = function(object, x, y)
 general_gui ()
 


end
     

--LOAD button
local loadbutton = loveframes.Create("button", main_menu_frame)
loadbutton:SetWidth(200)
loadbutton:SetText("load")
loadbutton:CenterX ()
loadbutton:SetY (main_menu_frame:GetHeight()*(6/10))
loadbutton.OnClick = function(object, x, y)
map_load_frame:SetVisible (true)
end

--EXIT button
     local exitbutton = loveframes.Create("button", main_menu_frame)
exitbutton:SetWidth(200)
exitbutton:SetText("exit")
exitbutton:CenterX ()
exitbutton:SetY (main_menu_frame:GetHeight()*(8/10))
exitbutton.OnClick = function(object, x, y)
object:SetText("You clicked the button!")
love.event.quit()
end


-- end of main buttons


--load interface

map_load_frame = loveframes.Create("frame")
map_load_frame:SetName("Column map_load_list")
map_load_frame:SetSize(500, 300)
map_load_frame:SetVisible (false)
         
local map_load_list = loveframes.Create("columnlist", map_load_frame)
map_load_list:SetPos(5, 30)
map_load_list:SetSize(490, 265)
map_load_list:AddColumn("ship")
for i,k in pairs ( love.filesystem.getDirectoryItems( "maps/ships" ) ) do
  
  map_load_list:AddRow (k)
  
  end


map_load_list.OnRowClicked  = function (parent,row, rowdata)

load_decks(rowdata[1])
end

end



function general_gui (activated)
        --create a general_tabs object to hold the tabs
          general_tabs = loveframes.Create("tabs")
          general_tabs:SetPos(0,love.window.getHeight()*(4/5))
          general_tabs:SetSize(love.window.getWidth(),love.window.getHeight()*(1/5))
           
    -- create the panels that each tab will show, their size is controlled in love.resize, over main.lua
          construction_panel = loveframes.Create("panel")
         rooms_panel = loveframes.Create("panel")
         objects_panel = loveframes.Create("panel")
         
         orders_panel = loveframes.Create("panel")
     
     -- make the actual tabs inside the general_tabs object (they are asociated to the panels I just made.
        general_tabs:AddTab("Construction", construction_panel, "Construction" , "resources/gui images/box.png")
        general_tabs:AddTab("objects", objects_panel, "objects" , "resources/gui images/box.png")
        general_tabs:AddTab("rooms", rooms_panel, "rooms" , "resources/gui images/box.png")
        general_tabs:AddTab("orders", orders_panel, "orders" , "resources/gui images/box.png")
        
    --create the buttons that go into the pannels
        local construction_wall = loveframes.Create("imagebutton", construction_panel)
        construction_wall:SetImage("resources/gui images/wall.png")
        construction_wall:SetPos(0, 10)
        construction_wall:SizeToImage()
        construction_wall.OnClick = function(object, x, y)
      end
 end
function debug_menu (activated)

    debug_menu = loveframes.Create("frame")
    debug_menu:SetName("debugging")
    debug_menu:SetHeight(85)
    debug_menu:SetResizable (true)
    
    local checkbox1 = loveframes.Create("checkbox", debug_menu)
    checkbox1:SetText("show grid")
    checkbox1:SetPos(5, 30)
   checkbox1.OnChanged  = function(object, x, y)
draw_the_grid = checkbox1:GetChecked()
end

end
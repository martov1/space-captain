--create a general_tabs object to hold the tabs
      general_tabs = loveframes.Create("tabs")
      general_tabs:SetPos(0,love.window.getHeight()*(4/5))
      general_tabs:SetSize(love.window.getWidth(),love.window.getHeight()*(1/5))
      general_tabs:SetState("general_gui")
       
-- create the panels that each tab will show, their size is controlled in love.resize, over main.lua
     construction_panel = loveframes.Create("panel")
     rooms_panel = loveframes.Create("panel")
     objects_panel = loveframes.Create("panel")
     policy_panel = loveframes.Create("panel")
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

--debug menu

    local debug_menu = loveframes.Create("frame")
    debug_menu:SetName("debugging")
    debug_menu:SetHeight(85)
    debug_menu:SetState ("general_gui")
    debug_menu:SetResizable (true)
    local checkbox1 = loveframes.Create("checkbox", debug_menu)
    checkbox1:SetText("show grid")
    checkbox1:SetPos(5, 30)
   checkbox1.OnChanged  = function(object, x, y)
draw_the_grid = checkbox1:GetChecked()
end



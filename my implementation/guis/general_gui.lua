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
    

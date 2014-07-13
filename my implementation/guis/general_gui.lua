local general_tabs_frame = loveframes.Create("frame")
general_tabs_frame:SetName("Tabs")
general_tabs_frame:SetSize(500, 300)
general_tabs_frame:SetState ("general_gui")
general_tabs_frame (SetPos
local general_tabs = loveframes.Create("tabs", general_tabs_frame)
general_tabs:SetPos(5, 30)
general_tabs:SetSize(490, 265)
         
local images = {"accept.png", "add.png", "application.png", "building.png", "bin.png", "database.png", "box.png", "brick.png"}
         
for i=1, 20 do
    local image = "resources/images/" .. images[math.random(1, #images)]
    local panel = loveframes.Create("panel")
    panel.Draw = function()
    end
    local text1 = loveframes.Create("text", panel)
    text1:SetText("Tab " ..i)
    text1:SetAlwaysUpdate(true)
    text1.Update = function(object, dt)
        object:Center()
    end
    general_tabs:AddTab("Tab " ..i, panel, "Tab " ..i, image)
end
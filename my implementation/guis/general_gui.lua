local main_tabs = loveframes.Create("main_tabs")
main_tabs:SetName("Tabs")
main_tabs:SetSize(500, 300)
main_tabs:CenterWithinArea(unpack(demo.centerarea))
main_tabs:SetState("general")
         
local tabs = loveframes.Create("tabs", main_tabs)
tabs:SetPos(5, 30)
tabs:SetSize(490, 265)
tabs:SetState("general")

tabs:AddTab("tab1","tab2","tab3")

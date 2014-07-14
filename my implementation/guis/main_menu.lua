
-- main frame and load, start, exit buttons
local main_menu_frame = loveframes.Create("frame")
main_menu_frame:SetState("main_menu")
main_menu_frame:SetName("main menu")
main_menu_frame:SetWidth (400)
main_menu_frame:SetHeight(400)

local startbutton = loveframes.Create("button", main_menu_frame)
startbutton:SetWidth(200)
startbutton:CenterX ()
startbutton:SetY (main_menu_frame:GetHeight()*(2/10))
startbutton:SetText("new game")
startbutton.OnClick = function(object, x, y)
object:SetText("You clicked the button!")
playing = true
set_gui("general_gui")

end
     


local loadbutton = loveframes.Create("button", main_menu_frame)
loadbutton:SetWidth(200)
loadbutton:SetText("load")
loadbutton:CenterX ()
loadbutton:SetY (main_menu_frame:GetHeight()*(6/10))
loadbutton.OnClick = function(object, x, y)
map_load_frame:SetVisible (true)
end

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
map_load_frame:SetState("main_menu")
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


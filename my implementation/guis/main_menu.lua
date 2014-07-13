

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
object:SetText("You clicked the button!")
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



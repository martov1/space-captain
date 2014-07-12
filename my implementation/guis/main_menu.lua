local frame = loveframes.Create("frame")
frame:SetName("Mainmenu Frame")
frame:Center()
frame:SetState("mainmenu")
frame:SetDockZoneSize(800)
frame:SetResizable(true)



local button2 = loveframes.Create("button")
button2.OnClick = function()
		loveframes.SetState("general")
	end
button2:SetParent(frame)
button2:SetPos(60, 40)
button2:SetText("start")



local button3 = loveframes.Create("button")
button3:SetParent(frame)
button3:SetPos(60, 80)
button3:SetText("load")

local button4 = loveframes.Create("button")
button4:SetParent(frame)
button4:SetPos(60, 120)
button4:SetText("exit")
button4.OnClick = function()
		love.event.quit ()
	end



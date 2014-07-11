local parentframe = loveframes.Create("frame")
 
-- method 1 using loveframes.Create
local button1 = loveframes.Create("button", parentframe)
button1:SetPos(5, 35)
 
-- method 2 using SetParent
local button2 = loveframes.Create("button")
button2:SetParent(parentframe)
button2:SetPos(5, 35)
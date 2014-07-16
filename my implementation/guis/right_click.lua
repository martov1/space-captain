function debug_right_click_menu ()

	local submenu3 = loveframes.Create("menu")
	submenu3:AddOption("Option 1", false, function() end)
	submenu3:AddOption("Option 2", false, function() end)
		
	local submenu2 = loveframes.Create("menu")
	submenu2:AddOption("Option 1", false, function() end)
	submenu2:AddOption("Option 2", false, function() end)
	submenu2:AddOption("Option 3", false, function() end)
	submenu2:AddOption("Option 4", false, function() end)
		
	local submenu1 = loveframes.Create("menu")
	submenu1:AddSubMenu("Option 1", false, submenu3)
	submenu1:AddSubMenu("Option 2", "resources/images/brick.png", submenu2)
		
	local debug_right_click_menu = loveframes.Create("menu")
	debug_right_click_menu:AddOption("Option A", "resources/images/brick.png", function() end)
	debug_right_click_menu:AddOption("Option B", "resources/images/add.png", function() end)
	debug_right_click_menu:AddDivider()
	debug_right_click_menu:AddOption("Option C", "resources/images/building.png", function() end)
	debug_right_click_menu:AddOption("Option D", "resources/images/accept.png", function() end)
	debug_right_click_menu:AddDivider()
	debug_right_click_menu:AddSubMenu("Option E", false, submenu1)
	debug_right_click_menu:SetPos(x, y)
		
	loveframes.hoverobject.debug_right_click_menu = debug_right_click_menu
end
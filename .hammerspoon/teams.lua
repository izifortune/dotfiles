function minimiseWindow()
	for i, win in ipairs(hs.window.allWindows()) do
		if win:application():name() == "Microsoft Teams" and not win:isMaximizable() then
			win:minimize()
			break
		end
	end
end

local ws = hs.spaces.watcher.new(function(space)
	-- minimiseWindow()
	local win = hs.window.focusedWindow()
	if
		win:title() == "Microsoft Teams Notification" or string.find(win:title(), "Microsoft Teams Call in progress")
	then
		local wins = hs.window.visibleWindows()
		print("space change")
		local priority = {}
		local priorityCnt = 1
		for i, x in pairs(wins) do
			local appName = x:application():name()
			local isVisible = x:isVisible()
			-- First space
			if string.find(appName, "Alacritty") and isVisible then
				priority["Alacritty"] = x
			elseif string.find(x:application():name(), "Firefox") and isVisible then
				priority["Firefox"] = x
			elseif string.find(x:application():name(), "Teams") and isVisible then
				priority["Teams"] = x
			end
		end
		if priority["Alacritty"] then
			priority["Alacritty"]:focus()
		elseif priority["Firefox"] then
			priority["Firefox"]:focus()
		elseif priority["Teams"] then
			priority["Teams"]:focus()
		end
		-- for i, x in pairs(priority) do
		--   print(i, x:application())
		-- end
	end
	-- os.execute("sleep " .. tonumber(5))
end)

local appFilter = hs.window.filter

appFilter
	.new("Microsoft Teams Notification")
	-- :subscribe(appFilter.windowFocused, function(win)
	-- 	print(win)
	-- end)
	-- :subscribe(appFilter.windowUnfocused, function(win)
	-- 	print(win)
	-- end)
	:subscribe(
		appFilter.windowUnminimized,
		function(win)
			print(win)
			minimiseWindow()
		end
	)

-- local aw = hs.application.watcher.new(function(app, event)
-- 	print(app, event)
-- 	minimiseWindow()
-- end)

ws:start()
-- aw:start()

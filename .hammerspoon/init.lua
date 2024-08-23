-- setup push to talk

--- move to config

-- require 'modules'
-- hs.loadSpoon("MicMute")
-- hs.loadSpoon("AppBindings")
require("appbindings")
require("teams")
-- require 'wm'

--
local hyper = { "cmd", "alt", "ctrl" }
local ctrlShift = "ctrl shift"
local altShift = "alt shift"
local ctrlAlt = "ctrl alt"
local cmdShift = { "cmd", "shift" }
local cmd = { "cmd" }

-- function toggleMute()
-- 	local zoom = hs.application.find("us.zoom.xos")
-- 	local teams = hs.application.find("Microsoft Teams")
-- 	local teamsNotification = hs.application.find("Microsoft Teams Notification")
-- 	if teams ~= null or teamsNotification ~= null then
-- 		hs.eventtap.keyStroke({ "cmd", "shift" }, "m", 0, teams)
-- 	end
-- 	if not (zoom == nil) then
-- 		hs.eventtap.keyStroke({ "cmd", "shift" }, "a", 0, zoom)
-- 	end
-- end

function toggleMute()
	local mic = hs.audiodevice.defaultInputDevice()
	local state = not mic:muted()
	hs.fnutils.each(hs.audiodevice.allInputDevices(), function(device)
		device:setInputMuted(state)
	end)
	if mic:muted() then
		-- hs.alert("Muted")
	else
		-- hs.alert("Unmuted")
	end
end

-- Create a new hotkey
-- spoon.MicMute:bindHotkeys({
--   toggle = {hyper, 'j'},
-- })
hs.hotkey.bind(hyper, "j", function()
	-- spoon.MicMute:toggleMicMute()
	toggleMute()
end)

-- window hints
hs.hotkey.bind(hyper, "h", hs.hints.windowHints)

function yabai(args)
	hs
		.task
		-- Runs in background very fast
		.new("/opt/homebrew/bin/yabai", nil, function(ud, ...)
			print("stream", hs.inspect(table.pack(...)))
			return true
		end, args)
		:start()
end

-- Cursor Keys
-- Handled by hotkeys in keymaps
hs.hotkey.bind("cmd", "1", function()
	yabai({ "-m", "space", "--focus", "1" })
end)
hs.hotkey.bind("cmd", "2", function()
	yabai({ "-m", "space", "--focus", "2" })
end)
hs.hotkey.bind("cmd", "3", function()
	yabai({ "-m", "space", "--focus", "3" })
end)
hs.hotkey.bind("cmd", "4", function()
	yabai({ "-m", "space", "--focus", "4" })
end)
hs.hotkey.bind("cmd", "5", function()
	yabai({ "-m", "space", "--focus", "5" })
end)
hs.hotkey.bind("cmd", "6", function()
	yabai({ "-m", "space", "--focus", "6" })
end)
hs.hotkey.bind("cmd", "7", function()
	yabai({ "-m", "space", "--focus", "7" })
end)
-- Move window to space
hs.hotkey.bind(altShift, "1", function()
	yabai({ "-m", "window", "--space", "1" })
	yabai({ "-m", "space", "--focus", "1" })
end)
hs.hotkey.bind(altShift, "2", function()
	yabai({ "-m", "window", "--space", "2" })
	yabai({ "-m", "space", "--focus", "2" })
end)
hs.hotkey.bind(altShift, "3", function()
	yabai({ "-m", "window", "--space", "3" })
	yabai({ "-m", "space", "--focus", "3" })
end)
hs.hotkey.bind(altShift, "4", function()
	yabai({ "-m", "window", "--space", "4" })
	yabai({ "-m", "space", "--focus", "4" })
end)
hs.hotkey.bind(altShift, "5", function()
	yabai({ "-m", "window", "--space", "5" })
	yabai({ "-m", "space", "--focus", "5" })
end)
hs.hotkey.bind(altShift, "6", function()
	yabai({ "-m", "window", "--space", "6" })
	yabai({ "-m", "space", "--focus", "6" })
end)

-- Move focus
hs.hotkey.bind(ctrlShift, "j", function()
	yabai({ "-m", "window", "--focus", "south" })
end)
hs.hotkey.bind(ctrlShift, "k", function()
	yabai({ "-m", "window", "--focus", "north" })
end)
hs.hotkey.bind(ctrlShift, "h", function()
	yabai({ "-m", "window", "--focus", "west" })
end)
hs.hotkey.bind(ctrlShift, "l", function()
	yabai({ "-m", "window", "--focus", "east" })
end)

-- Move focus display
hs.hotkey.bind(cmdShift, "1", function()
	yabai({ "-m", "display", "--focus", "1" })
end)
hs.hotkey.bind(cmdShift, "2", function()
	yabai({ "-m", "display", "--focus", "2" })
end)

-- Move focus window to display
hs.hotkey.bind(ctrlShift, "1", function()
	yabai({ "-m", "window", "--display", "1" })
end)
hs.hotkey.bind(ctrlShift, "2", function()
	yabai({ "-m", "window", "--display", "2" })
end)
--
-- --- fullscreen
hs.hotkey.bind(ctrlShift, "f", function()
	yabai({ "-m", "window", "--toggle", "zoom-fullscreen" })
end)
hs.hotkey.bind(ctrlShift, "g", function()
	yabai({ "-m", "window", "--toggle", "zoom-parent" })
end)
--
-- -- Warp windows
--
hs.hotkey.bind(cmdShift, "j", function()
	yabai({ "-m", "window", "--warp", "south" })
end)
hs.hotkey.bind(cmdShift, "k", function()
	yabai({ "-m", "window", "--warp", "north" })
end)
hs.hotkey.bind(cmdShift, "h", function()
	yabai({ "-m", "window", "--warp", "west" })
end)
hs.hotkey.bind(cmdShift, "l", function()
	yabai({ "-m", "window", "--warp", "east" })
end)
--
-- hs.hotkey.bind(ctrlShift, "r", function()
-- 	yabai({ "-m", "space", "--rotate", "90" })
-- end)

hs.hotkey.bind(ctrlShift, "r", function()
	yabai({ "-m", "window", "--toggle", "split" })
end)

hs.hotkey.bind({ "ctrl", "shift" }, "t", function()
	hs.application.launchOrFocus("WezTerm")
end)

hs.hotkey.bind({ "ctrl", "shift" }, "a", function()
	-- print(hs.inspect.inspect(hs.window.allWindows()[5]))
	for i, win in ipairs(hs.window.allWindows()) do
		print(hs.inspect(win))
		print(win:application():title())
		print(hs.inspect(win:subrole()))
		print(i, win:isMaximizable())
		if win:application():name() == "Microsoft Teams" and not win:isMaximizable() then
			win:minimize()
			break
		end
	end
	-- print(hs.inspect.inspect(hs.window.allWindows()[6]))
	-- hs.application.launchOrFocus("Alfred 5")
end)

hs.hotkey.bind({ "ctrl", "shift" }, "y", function()
	hs.task.new("/opt/homebrew/bin/yabai", nil, function() end, { "--restart-service" }):start()
end)

hs.hotkey.bind({ "ctrl", "shift" }, "b", function()
	hs.application.launchOrFocus("Firefox Developer Edition")
end)

hs.hotkey.bind({ "ctrl", "shift" }, "m", function()
	hs.application.launchOrFocus("Microsoft Teams")
end)

-- Resize
hs.hotkey.bind({ "shift", "alt" }, "h", function()
	yabai({ "-m", "window", "--ratio", "rel:-0.2" })
end)
hs.hotkey.bind({ "shift", "alt" }, "l", function()
	yabai({ "-m", "window", "--ratio", "rel:0.2" })
end)
hs.hotkey.bind({ "shift", "alt" }, "b", function()
	yabai({ "-m", "space", "--balance" })
end)

-- hs.hotkey.bind("alt", "1", function ()
--   -- local t = os.execute('/usr/local/bin/yabai -m space --focus 1 | yabai -m query --spaces --space 1 | jq -r \'."last-window"\' | xargs yabai -m window --focus')
--   yabai.send(function(data)
--     print("done")
--     ans = data -- store it in a global so we can play with it in the console
--     print(data)
--   end, "-m space --focus 1")
-- end)
--
-- hs.hotkey.bind("alt", "2", function ()
--   -- local t = os.execute('/usr/local/bin/yabai -m space --focus 2 | yabai -m query --spaces --space 2 | jq -r \'."last-window"\' | xargs yabai -m window --focus')
--   print(t)
--   yabai.send(function(data)
--     print("done")
--     ans = data -- store it in a global so we can play with it in the console
--   end, "-m space --focus 2")
-- end)
--
-- hs.hotkey.bind("alt", "3", function ()
--   -- local t = os.execute('/usr/local/bin/yabai -m space --focus 3 | yabai -m query --spaces --space 3 | jq -r \'."last-window"\' | xargs yabai -m window --focus')
--   -- print(t)
--   yabai.send(function(data)
--     print("done")
--     ans = data -- store it in a global so we can play with it in the console
--   end, "-m space --focus 3")
-- end)
--
-- hs.hotkey.bind("alt", "4", function ()
--   -- local t = os.execute('/usr/local/bin/yabai -m space --focus 4 | yabai -m query --spaces --space 4 | jq -r \'."last-window"\' | xargs yabai -m window --focus')
--   -- print(t)
--   yabai.send(function(data)
--     print("done")
--     ans = data -- store it in a global so we can play with it in the console
--   end, "-m space --focus 4")
-- end)
--
-- yabai = require("yabai")
-- yabai.send(function(data)
--   print("done")
--   ans = data -- store it in a global so we can play with it in the console
-- end, "query", "--windows")
--
-- then after it returns, to verify:

-- print(ans)
-- hs.inspect(hs.json.decode(ans))

-- hs.window.animationDuration = 0

-- Auto-reload config on change.

function reloadConfig(files)
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			tearDownEventHandling()
			hs.reload()
		end
	end
end

-- -- Function to minimize Microsoft Teams notification window
function minimizeTeamsNotification()
	-- Get all windows
	local windows = hs.window.allWindows()

	for _, window in ipairs(windows) do
		print(window:application():title())
		-- Check if the window belongs to Microsoft Teams
		-- if window:application():name() == "Microsoft Teams" then
		--     -- Check if the window title matches the notification window pattern
		--     -- Adjust the pattern as needed to match your Teams notification window
		--     if window:title():match("Incoming call from") then
		--         -- Minimize the window
		--         window:minimize()
		--     end
		-- end
	end
end

-- Watch for window creation events
windowFilter = hs.window.filter.new()
windowFilter:subscribe(hs.window.filter.default, function(window)
	-- Check if the window belongs to Microsoft Teams
	print(window:title())
	if window:title():match("| Microsoft Teams") then
		window:minimize()
		-- window:minimize()
	end
end)
--
-- Optionally, set up a hotkey to manually trigger the minimize function
-- hs.hotkey.bind({ "cmd", "alt", "ctrl" }, "M", minimizeTeamsNotification)

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
-- stackline = require "stackline.stackline.stackline"
-- stackline:init()

--------------------------------
-- START VIM CONFIG
--------------------------------
-- local VimMode = hs.loadSpoon("VimMode")
-- local vim = VimMode:new()

-- vim:enterWithSequence("jk")

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
-- vim:disableForApp('Code')
-- vim:disableForApp('zoom.us')
-- vim:disableForApp('iTerm')
-- vim:disableForApp("iTerm2")
-- vim:disableForApp("Alacritty")
-- vim:disableForApp('Terminal')

-- local wf = hs.window.filter
-- -- alter the default windowfilter
-- wf_notif = wf.new() -- notification center alerts
-- wf_notif:subscribe(wf.windowCreated, function()
-- 	hs
-- 		.task
-- 		-- Runs in background very fast
-- 		.new("/usr/local/bin/yabai", nil, function()
-- 			return true
-- 		end, { "--start-service" })
-- 		:start()
-- end)

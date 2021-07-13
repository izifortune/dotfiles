-- setup push to talk

--- move to config

-- require 'modules'
--
local hyper = {"cmd", "alt", "ctrl"}
local cmd = {'cmd'}

-- Create a new hotkey
hs.hotkey.bind(hyper, "j", "Toggle mic", function ()
  hs.osascript.applescriptFromFile("/Users/fortunatof/scripts/toggle-mic.scpt")
end)

function yabai(args)

  -- Runs in background very fast
  hs.task.new("/usr/local/bin/yabai",nil, function(ud, ...)
    print("stream", hs.inspect(table.pack(...)))
    return true
  end, args):start()

end


-- Cursor Keys
hs.hotkey.bind("alt", "1", function() yabai({"-m", "space", "--focus", "1"}) end)
hs.hotkey.bind("alt", "2", function() yabai({"-m", "space", "--focus", "2"}) end)
hs.hotkey.bind("alt", "3", function() yabai({"-m", "space", "--focus", "3"}) end)
hs.hotkey.bind("alt", "4", function() yabai({"-m", "space", "--focus", "4"}) end)
hs.hotkey.bind("alt", "5", function() yabai({"-m", "space", "--focus", "5"}) end)
hs.hotkey.bind(hyper, "down", function() yabai({"-m", "window", "--focus", "south"}) end)
hs.hotkey.bind(hyper, "left", function() yabai({"-m", "window", "--focus", "west"}) end)
hs.hotkey.bind(hyper, "right", function() yabai({"-m", "window", "--focus", "east"}) end)

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

--
-- Auto-reload config on change.
--

-- function reloadConfig(files)
--   for _, file in pairs(files) do
--     if file:sub(-4) == '.lua' then
--       tearDownEventHandling()
--       hs.reload()
--     end
--   end
-- end
--
-- hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()
-- stackline = require "stackline.stackline.stackline"
-- stackline:init()

--------------------------------
-- START VIM CONFIG
--------------------------------
-- local VimMode = hs.loadSpoon("VimMode")
-- local vim = VimMode:new()

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
-- vim:disableForApp('Code')
-- vim:disableForApp('zoom.us')
-- vim:disableForApp('iTerm')
-- vim:disableForApp('iTerm2')
-- vim:disableForApp('Terminal')
-- vim:disableForApp('com.googlecode.iterm2')


-- If you want the screen to dim (a la Flux) when you enter normal mode
-- flip this to true.
-- vim:shouldDimScreenInNormalMode(false)
--
-- -- If you want to show an on-screen alert when you enter normal mode, set
-- -- this to true
-- vim:shouldShowAlertInNormalMode(true)
--
-- -- You can configure your on-screen alert font
-- vim:setAlertFont("Courier New")
--
-- -- Enter normal mode by typing a key sequence
-- vim:enterWithSequence('jk')

-- if you want to bind a single key to entering vim, remove the
-- :enterWithSequence('jk') line above and uncomment the bindHotKeys line
-- below:
--
-- To customize the hot key you want, see the mods and key parameters at:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
--
-- vim:bindHotKeys({ enter = { {'ctrl'}, ';' } })

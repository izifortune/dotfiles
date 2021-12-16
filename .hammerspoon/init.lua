-- setup push to talk

--- move to config

-- require 'modules'
hs.loadSpoon("MicMute")
require 'teams'
-- require 'wm'

--
local hyper = {'cmd', 'alt', 'ctrl'}
local ctrlShift = 'ctrl shift'
local altShift = 'alt shift'
local cmdShift = {'cmd', 'shift'}
local cmd = {'cmd'}

-- Create a new hotkey
-- spoon.MicMute:bindHotkeys({
--   toggle = {hyper, 'j'},
-- })
hs.hotkey.bind(hyper, "j", function ()
  spoon.MicMute:toggleMicMute();
end)

-- window hints
hs.hotkey.bind(hyper, 'h', hs.hints.windowHints)


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

hs.hotkey.bind(altShift, "1", function() yabai({"-m", "window", "--space", "1"}) yabai({"-m", "space", "--focus", "1"}) end)
hs.hotkey.bind(altShift, "2", function() yabai({"-m", "window", "--space", "2"}) yabai({"-m", "space", "--focus", "2"}) end)
hs.hotkey.bind(altShift, "3", function() yabai({"-m", "window", "--space", "3"}) yabai({"-m", "space", "--focus", "3"}) end)
hs.hotkey.bind(altShift, "4", function() yabai({"-m", "window", "--space", "4"}) yabai({"-m", "space", "--focus", "4"}) end)
hs.hotkey.bind(altShift, "5", function() yabai({"-m", "window", "--space", "5"}) yabai({"-m", "space", "--focus", "5"}) end)

hs.hotkey.bind(ctrlShift, "j", function() yabai({"-m", "window", "--focus", "south"}) end)
hs.hotkey.bind(ctrlShift, "k", function() yabai({"-m", "window", "--focus", "north"}) end)
hs.hotkey.bind(ctrlShift, "h", function() yabai({"-m", "window", "--focus", "west"}) end)
hs.hotkey.bind(ctrlShift, "l", function() yabai({"-m", "window", "--focus", "east"}) end)
--
-- --- fullscreen
hs.hotkey.bind(ctrlShift, "f", function() yabai({"-m", "window", "--toggle", "zoom-fullscreen"}) end)
--
-- -- Warp windows
--
hs.hotkey.bind(cmdShift, "j", function() yabai({"-m", "window", "--warp", "south"}) end)
hs.hotkey.bind(cmdShift, "k", function() yabai({"-m", "window", "--warp", "north"}) end)
hs.hotkey.bind(cmdShift, "h", function() yabai({"-m", "window", "--warp", "west"}) end)
hs.hotkey.bind(cmdShift, "l", function() yabai({"-m", "window", "--warp", "east"}) end)
--
-- hs.hotkey.bind(ctrlShift, "r", function() yabai({"-m", "space", "--rotate", "90"}) end)

hs.hotkey.bind({"ctrl", "shift"}, 't', function () hs.application.launchOrFocus("Alacritty") end)
hs.hotkey.bind({"ctrl", "shift"}, 'a', function () hs.application.launchOrFocus("Alfred 4") end)
hs.hotkey.bind({"ctrl", "shift"}, 'b', function () hs.application.launchOrFocus("Firefox") end)
hs.hotkey.bind({"ctrl", "shift"}, 'm', function () hs.application.launchOrFocus("Microsoft Teams") end)

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
    if file:sub(-4) == '.lua' then
      tearDownEventHandling()
      hs.reload()
    end
  end
end

hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()
-- stackline = require "stackline.stackline.stackline"
-- stackline:init()

--------------------------------
-- START VIM CONFIG
--------------------------------
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

vim:enterWithSequence('jk')

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
-- vim:disableForApp('Code')
-- vim:disableForApp('zoom.us')
-- vim:disableForApp('iTerm')
vim:disableForApp('iTerm2')
vim:disableForApp('Alacritty')
-- vim:disableForApp('Terminal')
-- vim:disableForApp('com.googlecode.iterm2')

function reloadConfig(files)
  doReload = false
  for _,file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end
myWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

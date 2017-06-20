local hyper = {"cmd", "alt", "ctrl"}
local cmd = {'cmd'}

hs.window.animationDuration = 0

-----------------------------------------------
-- hyper d for left one half window
-----------------------------------------------

hs.hotkey.bind({"cmd", "alt"}, 'Left', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- hyper g for right one half window
-----------------------------------------------

hs.hotkey.bind({"cmd", "alt"}, 'Right', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind({"cmd", "alt"}, 'down', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.y = max.y + (max.h / 2)
        f.x = max.x
        f.h = max.h / 2
        f.w = max.w
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind({"cmd", "alt"}, 'up', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.y = max.y
        f.x = max.x
        f.h = max.h / 2
        f.w = max.w
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- hyper f for fullscreen
-----------------------------------------------

hs.hotkey.bind({"cmd", "alt"}, 'f', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w
        f.h = max.h
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- hyper r for top left one quarter window
-----------------------------------------------

hs.hotkey.bind({"ctrl", "cmd"}, 'Left', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- hyper t for top right one quarter window
-----------------------------------------------

hs.hotkey.bind({"ctrl", "cmd"}, 'Right', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- hyper v for bottom Right one quarter window
-----------------------------------------------

hs.hotkey.bind({"ctrl", "cmd", "shift"}, 'Right', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x + (max.w / 2)
        f.y = max.y + (max.h / 2)
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

-----------------------------------------------
-- hyper c for bottom left one quarter window
-----------------------------------------------

hs.hotkey.bind({"ctrl", "cmd", "shift"}, 'Left', function()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        f.x = max.x
        f.y = max.y + (max.h / 2)
        f.w = max.w / 2
        f.h = max.h / 2
        win:setFrame(f)
    else
        hs.alert.show("No active window")
    end
end)

hs.hotkey.bind(hyper, 'Left', function()
  if hs.window.focusedWindow() then
      local win = hs.window.focusedWindow()
      win:moveOneScreenWest()
  else
      hs.alert.show("No active window")
  end
end)

hs.hotkey.bind(hyper, 'Right', function()
  if hs.window.focusedWindow() then
      local win = hs.window.focusedWindow()
      win:moveOneScreenEast()
  else
      hs.alert.show("No active window")
  end
end)

-----------------------------------------------
-- Reload config on write
-----------------------------------------------

function reload_config(files)
    hs.reload()
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
hs.alert.show("Config loaded")

-----------------------------------------------
-- Hyper i to show window hints
-----------------------------------------------

hs.hotkey.bind(cmd, 'e', function()
    hs.hints.windowHints()
end)

-----------------------------------------------
-- Hyper hjkl to switch window focus
-----------------------------------------------

-- hs.hotkey.bind(hyper, 'k', function()
--     if hs.window.focusedWindow() then
--         hs.window.focusedWindow():focusWindowNorth()
--     else
--         hs.alert.show("No active window")
--     end
-- end)

-- hs.hotkey.bind(hyper, 'j', function()
--     if hs.window.focusedWindow() then
--         hs.window.focusedWindow():focusWindowSouth()
--     else
--         hs.alert.show("No active window")
--     end
-- end)

-- hs.hotkey.bind(hyper, 'l', function()
--     if hs.window.focusedWindow() then
--     hs.window.focusedWindow():focusWindowEast()
--     else
--         hs.alert.show("No active window")
--     end
-- end)

-- hs.hotkey.bind(hyper, 'h', function()
--     if hs.window.focusedWindow() then
--         hs.window.focusedWindow():focusWindowWest()
--     else
--         hs.alert.show("No active window")
--     end
-- end)

hs.hotkey.bind(hyper, ';', function()
  hs.pasteboard.setContents('angular.element($0).scope()')
  hs.eventtap.keyStroke({"cmd"}, "v")
end)

hs.hotkey.bind(hyper, 'i', function()
  hs.pasteboard.setContents('angular.element(document.body).injector().get(\'Booking\')')
  hs.eventtap.keyStroke({"cmd"}, "v")
end)

hs.hotkey.bind(hyper, 'p', function()
  hs.pasteboard.setContents('stash pull-request development @giovagnolif @McElhinneys -o') 
  hs.eventtap.keyStroke({"cmd"}, "v")
end)

hs.hotkey.bind(hyper, 'l', function()
  hs.pasteboard.setContents('git --no-pager log origin/development.. --pretty=oneline --no-merges')
  hs.eventtap.keyStroke({"cmd"}, "v")
end)

hs.hotkey.bind(hyper, 'r', function()
  hs.pasteboard.setContents('grep -rl "string" "dir" | xargs sed -i "" regex')
  hs.eventtap.keyStroke({"cmd"}, "v")
end)

local tiling = require "hs.tiling"
local hotkey = require "hs.hotkey"
local mash = {"ctrl", "cmd"}

hotkey.bind(mash, "c", function() tiling.cycleLayout() end)
hotkey.bind(mash, "j", function() tiling.cycle(1) end)
hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)
hotkey.bind(mash, "f", function() tiling.goToLayout("fullscreen") end)
hotkey.bind(mash, "r", function() tiling.retile() end)

tiling.set('layouts', {
  'fullscreen', 'gp-vertical'
})

-- gp-vertical
-- If you want to set the layouts that are enabled
-- tiling.set('layouts', {
--   'fullscreen', 'main-vertical'
-- })
--

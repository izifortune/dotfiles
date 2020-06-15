local hyper = {"cmd", "alt", "ctrl"}
local cmd = {'cmd'}

hs.window.animationDuration = 0

-------------------------------------------------
---- hyper d for left one half window
-------------------------------------------------

--hs.hotkey.bind({"cmd", "alt"}, 'Left', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()

--        f.x = max.x
--        f.y = max.y
--        f.w = max.w / 2
--        f.h = max.h
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

-------------------------------------------------
---- hyper g for right one half window
-------------------------------------------------

--hs.hotkey.bind({"cmd", "alt"}, 'Right', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()

--        f.x = max.x + (max.w / 2)
--        f.y = max.y
--        f.w = max.w / 2
--        f.h = max.h
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

--hs.hotkey.bind({"cmd", "alt"}, 'down', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()

--        f.y = max.y + (max.h / 2)
--        f.x = max.x
--        f.h = max.h / 2
--        f.w = max.w
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

--hs.hotkey.bind({"cmd", "alt"}, 'up', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()

--        f.y = max.y
--        f.x = max.x
--        f.h = max.h / 2
--        f.w = max.w
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

-------------------------------------------------
---- hyper f for fullscreen
-------------------------------------------------

--hs.hotkey.bind({"cmd", "alt"}, 'f', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()

--        f.x = max.x
--        f.y = max.y
--        f.w = max.w
--        f.h = max.h
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

-------------------------------------------------
---- hyper r for top left one quarter window
-------------------------------------------------

--hs.hotkey.bind({"ctrl", "cmd"}, 'Left', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()

--        f.x = max.x
--        f.y = max.y
--        f.w = max.w / 2
--        f.h = max.h / 2
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

-------------------------------------------------
---- hyper t for top right one quarter window
-------------------------------------------------

--hs.hotkey.bind({"ctrl", "cmd"}, 'Right', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()

--        f.x = max.x + (max.w / 2)
--        f.y = max.y
--        f.w = max.w / 2
--        f.h = max.h / 2
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

-------------------------------------------------
---- hyper v for bottom Right one quarter window
-------------------------------------------------

--hs.hotkey.bind({"ctrl", "cmd", "shift"}, 'Right', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()

--        f.x = max.x + (max.w / 2)
--        f.y = max.y + (max.h / 2)
--        f.w = max.w / 2
--        f.h = max.h / 2
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

-------------------------------------------------
---- hyper c for bottom left one quarter window
-------------------------------------------------

--hs.hotkey.bind({"ctrl", "cmd", "shift"}, 'Left', function()
--    if hs.window.focusedWindow() then
--        local win = hs.window.focusedWindow()
--        local f = win:frame()
--        local screen = win:screen()
--        local max = screen:frame()

--        f.x = max.x
--        f.y = max.y + (max.h / 2)
--        f.w = max.w / 2
--        f.h = max.h / 2
--        win:setFrame(f)
--    else
--        hs.alert.show("No active window")
--    end
--end)

--hs.hotkey.bind(hyper, 'Left', function()
--  if hs.window.focusedWindow() then
--      local win = hs.window.focusedWindow()
--      win:moveOneScreenWest()
--  else
--      hs.alert.show("No active window")
--  end
--end)

--hs.hotkey.bind(hyper, 'Right', function()
--  if hs.window.focusedWindow() then
--      local win = hs.window.focusedWindow()
--      win:moveOneScreenEast()
--  else
--      hs.alert.show("No active window")
--  end
--end)

-------------------------------------------------
---- Reload config on write
-------------------------------------------------

--function reload_config(files)
--    hs.reload()
--end
--hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reload_config):start()
--hs.alert.show("Config loaded")


-------------------------------------------------
---- Hyper hjkl to switch window focus
-------------------------------------------------

---- hs.hotkey.bind(hyper, 'k', function()
----     if hs.window.focusedWindow() then
----         hs.window.focusedWindow():focusWindowNorth()
----     else
----         hs.alert.show("No active window")
----     end
---- end)

---- hs.hotkey.bind(hyper, 'j', function()
----     if hs.window.focusedWindow() then
----         hs.window.focusedWindow():focusWindowSouth()
----     else
----         hs.alert.show("No active window")
----     end
---- end)

---- hs.hotkey.bind(hyper, 'l', function()
----     if hs.window.focusedWindow() then
----     hs.window.focusedWindow():focusWindowEast()
----     else
----         hs.alert.show("No active window")
----     end
---- end)

---- hs.hotkey.bind(hyper, 'h', function()
----     if hs.window.focusedWindow() then
----         hs.window.focusedWindow():focusWindowWest()
----     else
----         hs.alert.show("No active window")
----     end
---- end)

--hs.hotkey.bind(hyper, ';', function()
--  hs.pasteboard.setContents('angular.element($0).scope()')
--  hs.eventtap.keyStroke({"cmd"}, "v")
--end)

--hs.hotkey.bind(hyper, 'i', function()
--  hs.pasteboard.setContents('angular.element(document.body).injector().get(\'Booking\')')
--  hs.eventtap.keyStroke({"cmd"}, "v")
--end)

--hs.hotkey.bind(hyper, 'p', function()
--  hs.pasteboard.setContents('stash pull-request development @giovagnolif @McElhinneys -o') 
--  hs.eventtap.keyStroke({"cmd"}, "v")
--end)

--hs.hotkey.bind(hyper, 'l', function()
--  hs.pasteboard.setContents('git --no-pager log origin/development.. --pretty=oneline --no-merges')
--  hs.eventtap.keyStroke({"cmd"}, "v")
--end)

--hs.hotkey.bind(hyper, 'r', function()
--  hs.pasteboard.setContents('grep -rl "string" "dir" | xargs sed -i "" regex')
--  hs.eventtap.keyStroke({"cmd"}, "v")
--end)

--local tiling = require "hs.tiling"
--local hotkey = require "hs.hotkey"
--local mash = {"ctrl", "cmd"}

--hotkey.bind(mash, "c", function() tiling.cycleLayout() end)
--hotkey.bind(mash, "j", function() tiling.cycle(1) end)
--hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
--hotkey.bind(mash, "space", function() tiling.promote() end)
--hotkey.bind(mash, "f", function() tiling.goToLayout("fullscreen") end)
--hotkey.bind(mash, "r", function() tiling.retile() end)

--tiling.set('layouts', {
--  'fullscreen', 'gp-vertical'
--})

---- gp-vertical
---- If you want to set the layouts that are enabled
---- tiling.set('layouts', {
----   'fullscreen', 'main-vertical'
---- })
----


hs.grid.setGrid('12x12') -- allows us to place on quarters, thirds and halves
hs.grid.setMargins({16, 16})
hs.window.animationDuration = 0 -- disable animations

local screenCount = #hs.screen.allScreens()
local logLevel = 'info' -- generally want 'debug' or 'info'
local log = hs.logger.new('wincent', logLevel)
local layoutType = 1

local grid = {
  topHalf = '0,0 12x6',
  topThird = '0,0 12x4',
  topTwoThirds = '0,0 12x8',
  rightHalf = '6,0 6x12',
  rightThird = '8,0 4x12',
  rightTwoThirds = '4,0 8x12',
  bottomHalf = '0,6 12x6',
  bottomThird = '0,8 12x4',
  bottomTwoThirds = '0,4 12x8',
  leftHalf = '0,0 6x12',
  leftThird = '0,0 4x12',
  leftTwoThirds = '0,0 8x12',
  topLeft = '0,0 6x6',
  topRight = '6,0 6x6',
  bottomRight = '6,6 6x6',
  bottomLeft = '0,6 6x6',
  fullScreen = '0,0 12x12',
  centeredBig = '3,3 6x6',
  centeredSmall = '4,4 4x4',
}

local layoutConfig = {
  _before_ = (function()
    hide('com.spotify.client')
  end),

  _after_ = (function()
    -- Make sure Textual appears in front of Skype, and iTerm in front of
    -- others.
    activate('com.codeux.irc.textual5')
    -- activate('io.alacritty')
  end),

  -- ['com.codeux.irc.textual5'] = (function(window)
  --   hs.grid.set(window, grid.fullScreen, internalDisplay())
  -- end),

  -- ['com.flexibits.fantastical2.mac'] = (function(window)
  --   hs.grid.set(window, grid.fullScreen, internalDisplay())
  -- end),

  ['com.google.Chrome'] = (function(window, forceScreenCount)
    local count = forceScreenCount or layoutType or screenCount
    if count == 1 then
      hs.grid.set(window, grid.fullScreen)
    else
      -- First/odd windows go on the RIGHT side of the screen.
      -- Second/even windows go on the LEFT side.
      -- (Note this is the opposite of what we do with Canary.)
      local windows = windowCount(window:application())
      local side = windows % 2 == 0 and grid.leftHalf or grid.rightHalf
      hs.grid.set(window, side, hs.screen.primaryScreen())
    end
  end),

  ['com.apple.Preview'] = (function(window, forceScreenCount)
    local count = forceScreenCount or layoutType or screenCount
    if count == 1 then
      hs.grid.set(window, grid.fullScreen)
    else
      -- First/odd windows go on the RIGHT side of the screen.
      -- Second/even windows go on the LEFT side.
      -- (Note this is the opposite of what we do with Canary.)
        local windows = windowCount(window:application())
        local side = grid.leftHalf
        hs.grid.set(window, side, hs.screen.primaryScreen())
      end
    end),

  ['org.mozilla.firefox'] = (function(window, forceScreenCount)
    local count = forceScreenCount or layoutType or screenCount
    if count == 1 then
      hs.grid.set(window, grid.fullScreen)
    else
      -- First/odd windows go on the RIGHT side of the screen.
      -- Second/even windows go on the LEFT side.
      -- (Note this is the opposite of what we do with Canary.)
      local windows = windowCount(window:application())
      local windowPosition = windowPosition(window:application(), window)
      log.wf(windows)
      log.wf(windowPosition)
      -- local map = {}
      -- table.insert(map[window:id()], window)
      -- for _, w in pairs(map) do
      --   log.wf('FIREFOX')
      --   log.wf(w:id())
      --   log.wf(w:title())
      --   if w:isStandard() and not window:isMinimized() then
      --     count = count + 1
      --   end
      -- end
      local side
      if windows > 1 then
        side = windowPosition == 0 and grid.topRight or grid.bottomRight
      else 
        side = grid.rightHalf
      end
      -- local side = grid.rightHalf
      hs.grid.set(window, side, hs.screen.primaryScreen())
      end
    end),

  ['com.microsoft.teams'] = (function(window, forceScreenCount)
    local count = forceScreenCount or layoutType or screenCount
    if count == 1 then
      hs.grid.set(window, grid.fullScreen)
    else
      -- First/odd windows go on the RIGHT side of the screen.
      -- Second/even windows go on the LEFT side.
      -- (Note this is the opposite of what we do with Canary.)
        local windows = windowCount(window:application())
        local side = grid.rightHalf
        hs.grid.set(window, side, hs.screen.primaryScreen())
      end
    end),

  ['com.google.Chrome.canary'] = (function(window, forceScreenCount)
    local count = forceScreenCount or layoutType or screenCount
    if count == 1 then
      hs.grid.set(window, grid.fullScreen)
    else
      -- First/odd windows go on the LEFT side of the screen.
      -- Second/even windows go on the RIGHT side.
      -- (Note this is the opposite of what we do with Chrome.)
      local windows = windowCount(window:application())
      local side = windows % 2 == 0 and grid.rightHalf or grid.leftHalf
      hs.grid.set(window, side, hs.screen.primaryScreen())
    end
  end),

  ['io.alacritty'] = (function(window, forceScreenCount)
    local count = forceScreenCount or layoutType or screenCount
    if count == 1 then
      hs.grid.set(window, grid.fullScreen)
    else
      hs.grid.set(window, grid.leftHalf, hs.screen.primaryScreen())
    end
  end),

  ['com.skype.skype'] = (function(window)
    hs.grid.set(window, grid.rightHalf, internalDisplay())
  end),
}

--
-- Utility and helper functions.
--

-- Returns the number of standard, non-minimized windows in the application.
--
-- (For Chrome, which has two windows per visible window on screen, but only one
-- window per minimized window).
function windowCount(app)
  local count = 0
  if app then
    for _, window in pairs(app:allWindows()) do
      if window:isStandard() and not window:isMinimized() then
        count = count + 1
      end
    end
  end
  return count
end

function windowPosition(app, window)
  local id = window:id()
  local count = 0
  if app then
    for _, w in pairs(app:allWindows()) do
      if w:isStandard() and not w:isMinimized() and id > w:id() then
        count = 1
      end
    end
  end
  return count
end

function hide(bundleID)
  local app = hs.application.get(bundleID)
  if app then
    app:hide()
  end
end

function activate(bundleID)
  local app = hs.application.get(bundleID)
  if app then
    app:activate()
  end
end

function isMailMateMailViewer(window)
  local title = window:title()
  return title == 'No mailbox selected' or
    string.find(title, '%(%d+ messages?%)')
end

function canManageWindow(window)
  local application = window:application()
  local bundleID = application:bundleID()

  -- Special handling for iTerm: windows without title bars are
  -- non-standard.
  return window:isStandard()
end

function internalDisplay()
  -- Fun fact: this resolution matches both the 13" MacBook Air and the 15"
  -- (Retina) MacBook Pro.
  return hs.screen.find('1440x900')
end

function activateLayout(forceScreenCount)
  layoutType = forceScreenCount
  layoutConfig._before_()

  for bundleID, callback in pairs(layoutConfig) do
    local application = hs.application.get(bundleID)
    if application then
      local windows = application:visibleWindows()
      for _, window in pairs(windows) do
        if canManageWindow(window) then
          callback(window, forceScreenCount)
        end
      end
    end
  end

  layoutConfig._after_()
end

-- Event-handling
--
-- This will become a lot easier once `hs.window.filter`
-- (http://www.hammerspoon.org/docs/hs.window.filter.html) moves out of
-- "experimental" status, but until then, using a manual approach as
-- demonstrated at: https://gist.github.com/tmandry/a5b1ab6d6ea012c1e8c5

local globalWatcher = nil
local watchers = {}
local events = hs.uielement.watcher

function handleGlobalEvent(name, eventType, app)
  if eventType == hs.application.watcher.launched then
    log.df('[event] launched %s', app:bundleID())
    watchApp(app)
  elseif eventType == hs.application.watcher.terminated then
    -- Only the PID is set for terminated apps, so can't log bundleID.
    local pid = app:pid()
    log.df('[event] terminated PID %d', pid)
    unwatchApp(pid)
  end
end

function handleAppEvent(element, event)
  if event == events.windowCreated then
    if pcall(function()
      log.df('[event] window %s created', element:id())
    end) then
      watchWindow(element)
    else
      log.wf('error thrown trying to access element in handleAppEvent')
    end
  else
    log.wf('unexpected app event %d received', event)
  end
end

function handleWindowEvent(window, event, watcher, info)
  log.wf('delete', event)
  if event == events.elementDestroyed then
    repositionAppWindows(window)
    log.df('[event] window %s destroyed', info.id)
    watcher:stop()
    watchers[info.pid].windows[info.id] = nil
  else
    log.wf('unexpected window event %d received', event)
  end
end

function repositionAppWindows(window) 
  local bundleID = window:application():bundleID()
  if layoutConfig[bundleID] then
    log.wf(window:application():bundleID())
    for _, w in pairs(window:application():allWindows()) do
      if w:isStandard() and not w:isMinimized() then
        layoutConfig[bundleID](w)
      end
    end
  end
end

function handleScreenEvent()
  -- Make sure that something noteworthy (display count) actually
  -- changed. We no longer check geometry because we were seeing spurious
  -- events.
  local screens = hs.screen.allScreens()
  if not (#screens == screenCount) then
    screenCount = #screens
    activateLayout(screenCount)
  end
end

function watchApp(app)
  local pid = app:pid()
  if watchers[pid] then
    log.wf('attempted watch for already-watched PID %d', pid)
    return
  end

  -- Watch for new windows.
  local watcher = app:newWatcher(handleAppEvent)
  watchers[pid] = {
    watcher = watcher,
    windows = {},
  }
  watcher:start({events.windowCreated})

  -- Watch already-existing windows.
  for _, window in pairs(app:allWindows()) do
    watchWindow(window)
  end
end

function unwatchApp(pid)
  local appWatcher = watchers[pid]
  if not appWatcher then
    log.wf('attempted unwatch for unknown PID %d', pid)
    return
  end

  appWatcher.watcher:stop()
  for _, watcher in pairs(appWatcher.windows) do
    watcher:stop()
  end
  watchers[pid] = nil
end

function watchWindow(window)
  local application = window:application()
  local bundleID = application:bundleID()
  local pid = application:pid()
  local windows = watchers[pid].windows
  if canManageWindow(window) then
    -- Do initial layout-handling.
    local bundleID = application:bundleID()
    if layoutConfig[bundleID] then
      layoutConfig[bundleID](window)
    end

    repositionAppWindows(window)

    -- Watch for window-closed events.
    local id = window:id()
    if id then
      if not windows[id] then
        local watcher = window:newWatcher(handleWindowEvent, {
          id = id,
          pid = pid,
        })
        windows[id] = watcher
        watcher:start({events.elementDestroyed})
      end
    end
  end
end

function initEventHandling()
  -- Watch for application-level events.
  globalWatcher = hs.application.watcher.new(handleGlobalEvent)
  globalWatcher:start()

  -- Watch already-running applications.
  local apps = hs.application.runningApplications()
  for _, app in pairs(apps) do
    if app:bundleID() ~= 'org.hammerspoon.Hammerspoon' then
      watchApp(app)
    end
  end

  -- Watch for screen changes.
  screenWatcher = hs.screen.watcher.new(handleScreenEvent)
  screenWatcher:start()
end

function tearDownEventHandling()
  globalWatcher:stop()
  globalWatcher = nil

  screenWatcher:stop()
  screenWatcher = nil

  for pid, _ in pairs(watchers) do
    unwatchApp(pid)
  end
end

initEventHandling()

local lastSeenChain = nil
local lastSeenWindow = nil

-- Chain the specified movement commands.
--
-- This is like the "chain" feature in Slate, but with a couple of enhancements:
--
--  - Chains always start on the screen the window is currently on.
--  - A chain will be reset after 2 seconds of inactivity, or on switching from
--    one chain to another, or on switching from one app to another, or from one
--    window to another.
--
function chain(movements)
  local chainResetInterval = 2 -- seconds
  local cycleLength = #movements
  local sequenceNumber = 1

  return function()
    local win = hs.window.frontmostWindow()
    local id = win:id()
    local now = hs.timer.secondsSinceEpoch()
    local screen = win:screen()

    if
      lastSeenChain ~= movements or
      lastSeenAt < now - chainResetInterval or
      lastSeenWindow ~= id
    then
      sequenceNumber = 1
      lastSeenChain = movements
    elseif (sequenceNumber == 1) then
      -- At end of chain, restart chain on next screen.
      screen = screen:next()
    end
    lastSeenAt = now
    lastSeenWindow = id

    hs.grid.set(win, movements[sequenceNumber], screen)
    sequenceNumber = sequenceNumber % cycleLength + 1
  end
end

--
-- Key bindings.
--

hs.hotkey.bind({'ctrl', 'alt'}, 'up', chain({
  grid.topHalf,
  grid.topThird,
  grid.topTwoThirds,
}))

hs.hotkey.bind({'ctrl', 'alt'}, 'right', chain({
  grid.rightHalf,
  grid.rightThird,
  grid.rightTwoThirds,
}))

hs.hotkey.bind({'ctrl', 'alt'}, 'down', chain({
  grid.bottomHalf,
  grid.bottomThird,
  grid.bottomTwoThirds,
}))

hs.hotkey.bind({'ctrl', 'alt'}, 'left', chain({
  grid.leftHalf,
  grid.leftThird,
  grid.leftTwoThirds,
}))

hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'up', chain({
  grid.topLeft,
  grid.topRight,
  grid.bottomRight,
  grid.bottomLeft,
}))

hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'down', chain({
  grid.fullScreen,
  grid.centeredBig,
  grid.centeredSmall,
}))

hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'f7', (function()
  hs.alert('One-monitor layout')
  activateLayout(1)
end))

hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'f8', (function()
  hs.alert('Two-monitor layout')
  activateLayout(2)
end))

hs.hotkey.bind({'ctrl', 'alt', 'cmd'}, 'f9', (function()
  hs.alert('Hammerspoon console')
  local apps = hs.application.runningApplications()
  for _, app in pairs(apps) do
    local bundleID = app:bundleID()
    if bundleID then
      log.wf(bundleID)
    end
  end
  hs.openConsole()
end))

-------------------------------------------------
---- Hyper i to show window hints
-------------------------------------------------

hs.hotkey.bind({'ctrl'}, 'e', function()
  hs.hints.windowHints()
end)

--
-- Auto-reload config on change.
--

function reloadConfig(files)
  for _, file in pairs(files) do
    if file:sub(-4) == '.lua' then
      tearDownEventHandling()
      hs.reload()
    end
  end
end

hs.pathwatcher.new(os.getenv('HOME') .. '/.hammerspoon/', reloadConfig):start()

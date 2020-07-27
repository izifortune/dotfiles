local logLevel = 'info' -- generally want 'debug' or 'info'
local log = hs.logger.new('wincent', logLevel)
-- CTRL TAB requires less effort
hs.hotkey.bind({"ctrl"}, "tab", function()
  hs.eventtap.keyStroke({"cmd"}, "tab")
end)

-- For Firefox and Chrome map ctrl-c and ctrl-v to cmd-c and cmd-v
function termMetaCombo (letter)
  return hs.hotkey.new({"ctrl"}, letter, nil, function()
    hs.eventtap.keyStroke({"cmd"}, letter)
  end)
end

termBinds = {
  termMetaCombo('c'),
  termMetaCombo('v'),
  termMetaCombo('w'),
  termMetaCombo('t'),
  termMetaCombo('r'),
  termMetaCombo('a'),
  termMetaCombo('e')
}

function enableBinds()
  -- hs.console.printStyledtext("term focused")
  for k,v in pairs(termBinds) do
    v:enable()
  end
end

function disableBinds()
  -- hs.console.printStyledtext("term unfocused")
  for k,v in pairs(termBinds) do
    v:disable()
  end
end

local wf=hs.window.filter

wf_firefox = wf.new{'Firefox'}
wf_firefox:subscribe(wf.windowFocused, enableBinds)
wf_firefox:subscribe(wf.windowUnfocused, disableBinds)

wf_chrome = wf.new{'Chrome'}
wf_chrome:subscribe(wf.windowFocused, enableBinds)
wf_chrome:subscribe(wf.windowUnfocused, disableBinds)

wf_chrome = wf.new{'Microsoft Teams'}
wf_chrome:subscribe(wf.windowFocused, enableBinds)
wf_chrome:subscribe(wf.windowUnfocused, disableBinds)

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



hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)
-- hs.hotkey.bind({"ctrl", "shift"}, 't', function () hs.application.launchOrFocus("Alacritty") end)
-- hs.hotkey.bind({"ctrl", "shift"}, 'f', function () hs.application.launchOrFocus("Firefox") end)

-- /usr/local/bin/yabai -m window --focus "$(/usr/local/bin/yabai -m query --spaces --space 1 | jq -r '."last-window"')" || /usr/local/bin/yabai -m space --focus 1
-- hs.hotkey.bind({"alt"}, "1", function () 
--   output, status, termType  = hs.execute('/usr/local/bin/yabai -m query --spaces --space 1 | jq -r \'."last-window"\'')
--   log.wf(output)
--   log.wf(status)
-- end )

-- hs.hotkey.bind({"alt"}, "h", function () os.execute('/usr/local/bin/yabai -m window --focus west') end )
-- hs.hotkey.bind({"alt"}, "j", function () os.execute('/usr/local/bin/yabai -m window --focus south') end )
-- hs.hotkey.bind({"alt"}, "k", function () os.execute('/usr/local/bin/yabai -m window --focus north') end )
-- hs.hotkey.bind({"alt"}, "l", function () os.execute('/usr/local/bin/yabai -m window --focus east') end )
-- hs.hotkey.bind({"alt"}, "1", function () hs.execute('/usr/local/bin/yabai -m space --focus 1') end )
-- package.json jq --arg b "$BOO" '. + { foo: $b }'
-- hs.hotkey.bind({"alt"}, "1", function () 
--   log.wf('test')
--   -- yabai -m query --spaces --space 1 | jq -r '."first-window"' | xargs yabai -m window --focus 
--   -- s = [[He said "It's a boy"; sure]]
--   -- os.execute(("echo %q"):format(s))
--   jq = [[."first-window"]]
--   output, test, t = os.execute(("yabai -m query --spaces --space 1 | jq -r '%q' | xargs yabai -m window --focus "):format(jq))
--   log.wf(tostring(output))
--   log.wf(test.."")
--   log.wf(t.."")
-- end )
-- hs.hotkey.bind({"alt"}, "2", function () os.execute('/usr/local/bin/yabai -m space --focus 2') end )
-- hs.hotkey.bind({"alt"}, "3", function () os.execute('/usr/local/bin/yabai -m space --focus 3') end )
-- hs.hotkey.bind({"alt"}, "4", function () os.execute('/usr/local/bin/yabai -m space --focus 4') end )
-- hs.hotkey.bind({"alt"}, "5", function () os.execute('/usr/local/bin/yabai -m space --focus 5') end )
-- hs.hotkey.bind({"alt"}, "6", function () os.execute('/usr/local/bin/yabai -m space --focus 6') end )

-------------------------------------------------
---- Hyper i to show window hints
-------------------------------------------------

hs.hotkey.bind({'ctrl'}, 'e', function()
  hs.hints.windowHints()
end)

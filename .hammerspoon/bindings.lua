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
  termMetaCombo('a')
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

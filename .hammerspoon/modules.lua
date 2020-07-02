--- Modules

local ptt = require 'pushToTalk'

ptt.start()

require 'window'
require 'bindings'
require 'menubar'

--- Spons


hs.loadSpoon('HSearch')

----------------------------------------------------------------------------------------------------
-- Register Hammerspoon Search
if spoon.HSearch then
  hs.hotkey.bind({ 'alt'}, 'g' , function()
    spoon.HSearch:toggleShow()
  end)
end

hs.loadSpoon('UnsplashRandom')

spoon.UnsplashRandom:init()

--- End Modules

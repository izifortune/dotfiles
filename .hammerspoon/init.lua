-- setup push to talk

--- move to config

-- require 'modules'
-- 
-- local hyper = {"cmd", "alt", "ctrl"}
-- local cmd = {'cmd'}



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
local VimMode = hs.loadSpoon("VimMode")
local vim = VimMode:new()

-- Configure apps you do *not* want Vim mode enabled in
-- For example, you don't want this plugin overriding your control of Terminal
-- vim
vim:disableForApp('Code')
vim:disableForApp('zoom.us')
vim:disableForApp('iTerm')
vim:disableForApp('iTerm2')
vim:disableForApp('Terminal')
vim:disableForApp('com.googlecode.iterm2')


-- If you want the screen to dim (a la Flux) when you enter normal mode
-- flip this to true.
vim:shouldDimScreenInNormalMode(false)

-- If you want to show an on-screen alert when you enter normal mode, set
-- this to true
vim:shouldShowAlertInNormalMode(true)

-- You can configure your on-screen alert font
vim:setAlertFont("Courier New")

-- Enter normal mode by typing a key sequence
vim:enterWithSequence('jk')

-- if you want to bind a single key to entering vim, remove the
-- :enterWithSequence('jk') line above and uncomment the bindHotKeys line
-- below:
--
-- To customize the hot key you want, see the mods and key parameters at:
--   https://www.hammerspoon.org/docs/hs.hotkey.html#bind
--
-- vim:bindHotKeys({ enter = { {'ctrl'}, ';' } })

--------------------------------
-- END VIM CONFIG
--------------------------------

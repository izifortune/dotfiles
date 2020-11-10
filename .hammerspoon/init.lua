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
stackline = require "stackline.stackline.stackline"
stackline:init()

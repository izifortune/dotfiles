-- local currentVolume

-- set currentVolume to input volume of (get volume settings)

if input volume of (get volume settings) is 0 then
  display notification "ON" with title "Mic"
  set volume input volume 100
else
display notification "OFF" with title "Mic"
  set volume input volume 0
end if

  -- if currentVolume = 0 then
  --   set volume input volume 100
  -- else
  --   set volume input volume 0
  -- end if

tell application "/Applications/Übersicht.app" to refresh widget id "simple-bar-data-jsx"

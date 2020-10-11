local currentVolume

set currentVolume to input volume of (get volume settings)

if currentVolume = 0 then
  set volume input volume 100
else
  set volume input volume 0
end if

tell application "Übersicht" to refresh widget id "simple-bar-data-jsx"

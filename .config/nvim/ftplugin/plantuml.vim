function PlantUMLSave() abort
  echom 'save plantuml'
  execute 'cd ' ..  getcwd()
  call system('plantuml ' .. expand("%:p"))
endfunction

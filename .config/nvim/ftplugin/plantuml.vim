function PlantUMLSave() abort
  echom 'save plantuml'
  " call system('plantuml ' .. expand("%:p"))
endfunction



augroup GenerateImage
  autocmd BufWritePost * silent call PlantUMLSave()
augroup END

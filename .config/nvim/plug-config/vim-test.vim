let g:root_markers = ['package.json', '.git/']

function! RunVimTest(cmd)
  " I guess this part could be replaced by projectionist#project_root
  for marker in g:root_markers
    let marker_file = findfile(marker, expand('%:p:h') . ';')
    if strlen(marker_file) > 0
      let g:test#project_root = fnamemodify(marker_file, ":p:h")
      break
    endif
    let marker_dir = finddir(marker, expand('%:p:h') . ';')
    if strlen(marker_dir) > 0
      let g:test#project_root = fnamemodify(marker_dir, ":p:h")
      break
    endif
  endfor

  execute a:cmd
endfunction

function! s:before_run() abort
  if !exists('g:test#project_root')
    for marker in g:root_markers
      let marker_file = findfile(marker, expand('%:p:h') . ';')
      if strlen(marker_file) > 0
        let g:test#project_root = fnamemodify(marker_file, ":p:h")
        break
      endif
      let marker_dir = finddir(marker, expand('%:p:h') . ';')
      if strlen(marker_dir) > 0
        let g:test#project_root = fnamemodify(marker_dir, ":p:h")
        break
      endif
    endfor
  endif
endfunction

" nnoremap <leader>tf :call <SID>RunVimTest('TestFile')<cr>
" nnoremap <leader>tn :call <SID>RunVimTest('TestNearest')<cr>
" nnoremap <leader>tf :call <SID>RunVimTest('TestSuite')<cr>
" nnoremap <leader>ts :call <SID>RunVimTest('TestFile')<cr>
" nnoremap <leader>tl :call <SID>RunVimTest('TestLast')<cr>
" nnoremap <leader>tv :call <SID>RunVimTest('TestVisit')<cr>

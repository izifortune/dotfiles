let g:zettelkasten = "~/code/knowledge/content/zettelkasten/"

command! NewZettel :execute ":e" zettelkasten . strftime("%Y%m%d%H%M") . ".md"

nnoremap <leader>nz :NewZettel<CR>

" command! ZettelTag lua require 'telescope'.zetteltags()
" command! Test lua require 'telescope'.MyTscopeNotesGrep()

command! ZettelTag call fzf#vim#grep(
     \   'rg --column --line-number --no-heading --color=always --smart-case -- "^#[a-z].*"', 1,
     \   fzf#vim#with_preview({ 'dir': zettelkasten }), <bang>0)



" fu! HandleFZF(file)
"     let filename = fnameescape(fnamemodify(a:file, ":t"))
"     let filename_wo_timestamp = fnameescape(fnamemodify(a:file, ":t:s/^[0-9]*-//"))
"     let mdlink = "[".filename_wo_timestamp."](".filename.")"
"     put=mdlink
"     let curfilename = fnameescape(expand("%:t"))
"     let curfilename_wo_timestamp = fnameescape(fnamemodify(expand("%"), ":t:s/^[0-9]*-//"))
"     let curmdlink = "[".curfilename_wo_timestamp."](".curfilename.")"
"     call writefile(add(readfile(filename), curmdlink), filename)
" endfunction
" 
" command! -nargs=1 HandleFZF :call HandleFZF(<f-args>)
" 
" inoremap <buffer> <C-X><C-F> <esc>:call fzf#run({'source': 'find .' , 'sink': 'HandleFZF'})<CR>A


" make_note_link: List -> Str
" returned string: [Title](YYYYMMDDHH.md)
function! s:make_note_link(l)
        " fzf#vim#complete returns a list with all info in index 0
        let line = split(a:l[0], ':')
        let ztk_id = l:line[0]
        let ztk_title = substitute(l:line[1], '\#\s\+', '', 'g')
        let mdlink = "[" . ztk_title ."](". ztk_id .")"
        let curfilename = fnameescape(expand("%:t"))
        let curfilename_title = trim(split(getline(1),'#')[-1])
        " backling disabled
        " let curmdlink = "[".curfilename_title."](".curfilename.")"
        " let filename = fnameescape(fnamemodify(ztk_id, ":t"))
        " call writefile(add(readfile(filename), curmdlink), filename)
        return mdlink
endfunction

" mnemonic link zettel
" command C-l z
inoremap <expr> <c-l>z fzf#vim#complete({
  \ 'source':  'rg --no-heading --smart-case  "^\# "',
  \ 'reducer': function('<sid>make_note_link'),
  \ 'options': '--multi --reverse --margin 15%,0',
  \ 'up':    5})

func! Zg() abort
  " cd! '' . g:zettelkasten
  let l:tags = systemlist('rg --column --no-heading --color=always --smart-case -- "^#[a-z].*"')
  for i in l:tags
    echom i
  endfor
  echo l:tags
endfun

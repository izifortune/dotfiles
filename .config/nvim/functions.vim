" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Pretty format JSON files
function s:formatJSON()
  execute "%!python -m json.tool"
  set syntax=json
endfunction

command FormatJSON call s:formatJSON()


" Follow paths js imports
set path=.,src
set suffixesadd=.js,.jsx,.ts

function! LoadMainNodeModule(fname)
  let nodeModules = "./node_modules/"
  let packageJsonPath = nodeModules . a:fname . "/package.json"

  if filereadable(packageJsonPath)
    return nodeModules . a:fname . "/" . json_decode(join(readfile(packageJsonPath))).main
  else
    return nodeModules . a:fname
  endif
endfunction

set includeexpr=LoadMainNodeModule(v:fname)

" Get a weblink of the current file in our company stash
function! WebLink() abort
  let @+ = "https://stash.ryanair.com:8443/projects/RA/repos/" . split(expand("%:p:h"), "/")[3] . "/browse/" . @%
endfunction

command WebLink :call WebLink()

command FullPath :echo @% 

" Save a image from the clipboard to markdown
command MarkdownClipboardImage :call MarkdownClipboardImage()

function! MarkdownClipboardImage() abort
  " Create `img` directory if it doesn't exist
  let img_dir = expand("%:p:h")  . '/img'
  echo img_dir
  if !isdirectory(img_dir)
    silent call mkdir(img_dir)
  endif

  " First find out what filename to use
  let index = 1
  let file_path = img_dir . "/image" . index . ".png"
  let vim_file_path = "img/image" . index . ".png"
  while filereadable(file_path)
    let index = index + 1
    let file_path = img_dir . "/image" . index . ".png"
    let vim_file_path = "img/image" . index . ".png"
  endwhile

  let clip_command = 'osascript'
  let clip_command .= ' -e "set png_data to the clipboard as «class PNGf»"'
  let clip_command .= ' -e "set referenceNumber to open for access POSIX path of'
  let clip_command .= ' (POSIX file \"' . file_path . '\") with write permission"'
  let clip_command .= ' -e "write png_data to referenceNumber"'

  silent call system(clip_command)
  if v:shell_error == 1
    normal! p
  else
    execute "normal! i![](" . vim_file_path . ")"
  endif
endfunction


" :autocmd FileType vimwiki map d :VimwikiMakeDiaryNote
function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
  end
endfunction

:command ToggleCalendar call ToggleCalendar()

" Format FORM Objects
function! FormatForm()
  execute ':%s/\\n//g'
  execute ':%s/\\"/"/g'
  execute ":FormatJSON"
endfunction

:command FormatForm call FormatForm()

let g:ackprg = 'ag --nogroup --nocolor --column'

" Format XML files
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

" Open a syntax-colored version of the current file
" suitable for copy-pasting into a presentation.
function! functions#keynote() abort
  if has('gui')
    setlocal nonumber
    setlocal norelativenumber
    TOhtml
    let l:tempfile=system('mktemp')
    execute 'saveas! ' . l:tempfile
    execute '!open -b com.google.Chrome ' . l:tempfile
    quit
  else
    echoerr 'functions#keynote() should be run from within a GUI instance of Vim'
  endif
endfunction

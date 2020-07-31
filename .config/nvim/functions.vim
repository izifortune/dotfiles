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


    " redirect command's output to the current line
function! RED(command)
    redir => output
    silent exec a:command
    redir END
    let @z = substitute(output, '^\n', '', '')
    execute "put z"
    return ''
endfunction

command! -nargs=1 RE call RED('<args>')

function GetURLTitle(url)
  " Bail early if the url obviously isn't a URL.
  if a:url !~ '^https\?://'
    return ""
  endif

  " Use Python/BeautifulSoup to get link's page title.
  let title = system("python3 -c \"import bs4, requests; print(bs4.BeautifulSoup(requests.get('" . a:url . "').content, 'lxml').title.text.strip())\"")

  " Echo the error if getting title failed.
  if v:shell_error != 0
    echom title
    return ""
  endif

  " Strip trailing newline
  return substitute(title, '\n', '', 'g')
endfunction

function PasteMDLink()
  let url = getreg("+")
  let title = GetURLTitle(url)
  let mdLink = printf("[%s](%s)", title, url)
  execute "normal! a" . mdLink . "\<Esc>"
endfunction

" Make a keybinding (mnemonic: "mark down paste")
nmap <Leader>mdp :call PasteMDLink()<cr>

function DiaryEntry()
    let date = strftime('%Y-%m-%d')
    execute "e ~/code/knowledge/content/diary/" . date . ".md"

endfunction
nmap <Leader>wi :call DiaryEntry()<cr>

" TODO finish off this function
function UpdateDiary()
  let lines = []
  let files = split(globpath('~/code/knowledge/content/diary/', '*.md'), '\n')
  call sort(files, 'N')
  call reverse(files)
  call remove(files, 'diary.md')
  execute "e ~/code/knowledge/content/diary/diary.md"
  execute "normal gg dG"
  let lineNumber = 0
  call append(lineNumber, '# Diary')
  let lineNumber += 2
  for file in files
    let markdownFile = split(file, '/')[-1]
    let linkName = split(markdownFile, '.md')[0]
    let firstLine = readfile(file, '',  1)[0]
    " TODO Check the month
    " Making sure that the line has a header
    if firstLine =~ '#'
      let title = trim(split(firstLine, '#')[-1])
      let entry = '- [' . title . '](' . markdownFile . ')'
      " call add(lines, )
      call append(lineNumber, entry)
      let lineNumber +=1
    endif
  endfor
  echo lines
endfunction

" Get the visual selection block and pass it to substitute
" Use this function when you want to use a star emoji
command! -range=% -nargs=0 StarIt '<,'>s/*/⭐/g

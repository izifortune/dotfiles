" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.org setlocal spell
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Pretty format JSON files
function s:formatJSON()
  execute "%!python3 -m json.tool"
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

command FullPath :echo @% | pbcopy

" Save a image from the clipboard to markdown
command MarkdownClipboardImage :call MarkdownClipboardImage()

function! MarkdownClipboardImage() abort
  " Create `img` directory if it doesn't exist
  let img_dir = expand("%:p:h")  . '/static'
  echo img_dir
  if !isdirectory(img_dir)
    silent call mkdir(img_dir)
  endif

  " First find out what filename to use
  let index = 1
  let file_path = img_dir . "/image" . index . ".png"
  let vim_file_path = "./static/image" . index . ".png"
  while filereadable(file_path)
    let index = index + 1
    let file_path = img_dir . "/image" . index . ".png"
    let vim_file_path = "./static/image" . index . ".png"
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
  let title = system('curl -s -L "' . a:url . '" | tr "\n" " "')
  let test = matchstr(title, '\ca <title>.*</title>')
  echo test



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
nnoremap <leader>mdp :call PasteMDLink()<cr>

function DiaryEntry()
    let date = strftime('%Y-%m-%d')
    execute "e ~/code/knowledge/content/diary/" . date . ".md"
endfunction
nnoremap <leader>wi :call DiaryEntry()<cr>
nnoremap <leader>w<leader>w :e ~/code/knowledge/content/diary/diary.md<cr>
nnoremap <leader>wv :e ~/code/knowledge/content/text-editors/vim/vim-journal.md<cr>
nnoremap <leader>wj :e ~/code/knowledge/content/text-editors/vim/vim-jira-journal.md<cr>

" TODO finish off this function
function UpdateDiary()
  let lines = []
  let files = split(globpath('~/code/knowledge/content/diary/', '*.md'), '\n')
  call sort(files, 'N')
  call reverse(files)
  call remove(files, 'diary.md')
  execute "e ~/code/knowledge/content/diary/diary.md"
  execute "normal gg dG"
  let lineNumber = -1
  call append(lineNumber, '# Diary')
  let lineNumber = 2
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

command -nargs=0 ItalianE %s/e'/è/g

" Get the visual selection block and pass it to substitute
" Use this function when you want to use a star emoji
command! -range=% -nargs=0 StarIt '<,'>s/*/⭐/g

command! Scratch lua require'tools'.makeScratch()
" command! Todos lua require'tools'.Todos()
command! -nargs=? Exec lua require'tools'.Exec(<f-args>)
command! Free set virtualedit=all


function! Tdd() abort
  let dir = getcwd()
  echo dir
  execute 'cd ~/code/knowledge/content/diary'
  " lua require 'izifortune.telescope'.todos()
  " call fzf#vim#grep(
  "     \   'rg --sortr created --column --line-number --no-heading --color=always --smart-case -- '.shellescape('\[ \]'), 1,
  "     \   fzf#vim#with_preview({ 'options': '--reverse' }), 0)
  " call fzf#run(
  "     \   fzf#wrap({'source': 'rg --sortr created --column --line-number --no-heading --color=always --smart-case -- '.shellescape('\[ \]')}, 0))
  call fzf#run({'source': fzf#vim#grep(
  \   'rg --sortr created --column --line-number --no-heading --color=always --smart-case -- '.shellescape('\[ \]'), 1,
  \   fzf#vim#with_preview({ 'options': '--reverse' }), 0), 'sink': 'tabedit'})
  execute 'cd ' . dir
endfunction

command! -bang Todos call Tdd()

function! NewDiarySection(title) abort
  exe 'norm! gg'
  if (strpart(getline('.'), 0, 1) ==? '#')
    exe 'norm! A' . ', ' .. a:title
  else
    exe 'norm! A' . '# ' .. a:title
  endif
  exe 'norm! oo## ' .. a:title
  exe 'norm! oo---O'
endfunction

command! -nargs=1 NewSection call NewDiarySection('<args>')

function! NewDocumentFun(title) abort
  exe 'norm! I- [' .. a:title .. '](' ..a:title .. '.md)'
endfunction

command! -nargs=1 NewDocument call NewDocumentFun('<args>')

" Go back to last misspelled word and pick first suggestion.
inoremap <C-L> <C-G>u<Esc>[s1z=`]a<C-G>u

" Select last misspelled word (typing will edit).
nnoremap <C-K> <Esc>[sve<C-G>
inoremap <C-K> <Esc>[sve<C-G>
snoremap <C-K> <Esc>b[sviw<C-G>

" Create a docx document from markdown in the same folder
function! MarkdownToDoc() abort
  let file = @%
  let directory = expand('%:p:h')
  let filename = expand('%:r')
  call system('pandoc ' .. file .. ' -o ' .. directory .. '/'.. filename .. '.docx')
endfunction

command! MarkdownToDoc call MarkdownToDoc()

function! MarkdownToFirefox() abort
  let path = expand('%:p')
  call system('/Applications/Firefox.app/Contents/MacOS/firefox ' .. path)
endfunction


function Testing() abort
  let message = '^@Creating ticket^@{"id":"1390702","key":"TP-26453","self":"https://jira.ryanair.com/rest/api/2/issue/1390702"}'
  echom split(message, '"')[7]
endfunction

function CreateJiraTicket(title) abort
  let pass = inputsecret('Enter password: ')
  let commandStdout = system('rcli jira -u fortunatof -a fortunatof -s "' .. a:title ..'"' .. ' -p TP <<< "'.. pass .. '"')
  echom commandStdout
  let ticketList =  split(commandStdout, '"')
  let ticket = ticketList[7]
  let @+ = ticket
endfunction

function MacroMode() abort
  set nowrapscan
endfunction

" function BeutifyJS()! abort
" ":%!js-beautify
" endfunction


command! -nargs=1 Silent
      \   execute 'silent !' . <q-args>
      \ | execute 'redraw!'

command! -range MarkdownToClipboard w ! pandoc -s | ~/scripts/pbcopyhtml
command! -range OrgToClipboardl w ! pandoc -f org -s | ~/scripts/pbcopyhtml

command! CreatePR ! ~/scripts/create-pr.js

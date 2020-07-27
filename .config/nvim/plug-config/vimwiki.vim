let g:vimwiki_list = [{'path': '~/code/knowledge/content/',
      \ 'syntax': 'markdown', 'ext': '.md'} ]

let g:vimwiki_global_ext = 0

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
  autocmd!
  " automatically update links on read diary
  autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end

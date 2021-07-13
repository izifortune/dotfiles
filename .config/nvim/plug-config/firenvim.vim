let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

augroup FireNvim
  au BufEnter github.com_*.txt set filetype=markdown
  au BufEnter outlook.office.com_*.txt set filetype=markdown
  au BufEnter stash.ryanair.com_*.txt set filetype=markdown
  au BufEnter confluence.ryanair.com_*.txt set filetype=markdown
  au BufEnter jira.ryanair.com_*.txt set filetype=markdown
augroup END

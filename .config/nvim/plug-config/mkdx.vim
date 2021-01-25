let g:mkdx#settings = { 'highlight': { 'enable': 0 },
      \ 'map': { 'prefix': '<leader>' },
      \ 'enter': { 'shift': 1 },
      \ 'links': { 'external': { 'enable': 1 } },
      \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
      \ 'fold': { 'enable': 1 },
      \ 'tab': { 'enable': 0 }}

command! WrapLink call mkdx#WrapLink()<cr>
command! DeadLinks call mkdx#QuickfixDeadLinks()<cr>
command! DeadHeaders call mkdx#QuickfixHeaders()<cr>
command! TOC call mkdx#QuickfixHeaders()<cr>

" Fix files with prettier, and then ESLint.
" Equivalent to the above.
let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \'*': ['remove_trailing_lines', 'trim_whitespace'],
      \'javascript': ['prettier'],
      \'markdown': ['remark-lint'],
      \'typescript': ['prettier'],
\}

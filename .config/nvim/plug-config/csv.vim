augroup filetypedetect
  au! BufRead,BufNewFile *.csv,*.dat	setfiletype csv
augroup END

" Formatting as a tablej
" aug CSV_Editing
"   au!
"   au BufRead,BufWritePost *.csv :%ArrangeColumn
"   au BufWritePre *.csv :%UnArrangeColumn
" aug end

let g:csv_bind_B = 1
let g:csv_highlight_column = 'y'

Plug 'chrisbra/csv.vim'

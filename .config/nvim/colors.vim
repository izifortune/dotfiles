" let base16colorspace=256

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
" colorscheme srcery

" let g:gruvbox_material_background = 'hard'

" colorscheme gruvbox-material

if exists('+termguicolors')
  set termguicolors
endif
let g:gruvbox_invert_selection='0'

" Transparency background for vim session
hi Normal guibg=NONE ctermbg=NONE
set background=dark
set t_Co=256

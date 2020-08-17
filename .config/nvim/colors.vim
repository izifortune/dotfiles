" let base16colorspace=256

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" let g:gruvbox_material_background = 'hard'

" colorscheme gruvbox-material

if exists('+termguicolors')
  set termguicolors
endif
let g:gruvbox_invert_selection='0'

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

" Transparency background for vim session
hi Normal guibg=NONE ctermbg=NONE

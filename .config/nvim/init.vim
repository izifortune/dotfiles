source $HOME/.config/nvim/plug-config/csv.vim

" source $HOME/.config/nvim/plug-config/polyglot.vim
source $HOME/.config/nvim/plug-config/mkdx.vim

source $HOME/.config/nvim/plugins.vim

source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/functions.vim

source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/zettel.vim

" source $HOME/.config/nvim/plug-config/nvim-lsputils.vim

source $HOME/.config/nvim/plug-config/airline.vim
source $HOME/.config/nvim/plug-config/ale.vim
" source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/context.vim
source $HOME/.config/nvim/plug-config/easy-align.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
" source $HOME/.config/nvim/plug-config/fzf.vim
" source $HOME/.config/nvim/plug-config/fzf-checkout.vim
source $HOME/.config/nvim/plug-config/git-gutter.vim
source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
source $HOME/.config/nvim/plug-config/rainbow.vim
source $HOME/.config/nvim/plug-config/tabularize.vim
source $HOME/.config/nvim/plug-config/vim-markdow-preview.vim
source $HOME/.config/nvim/plug-config/vim-markdown.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/vimwiki.vim
source $HOME/.config/nvim/plug-config/which-key.vim
" source $HOME/.config/nvim/plug-config/completion-nvim.vim
source $HOME/.config/nvim/plug-config/vim-floaterm.vim
source $HOME/.config/nvim/plug-config/weblink.vim
source $HOME/.config/nvim/plug-config/gina.vim
source $HOME/.config/nvim/plug-config/barbar.vim
source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/vim-indent-guides.vim
source $HOME/.config/nvim/plug-config/vim-bbye.vim
source $HOME/.config/nvim/plug-config/vim-languagetool.vim
source $HOME/.config/nvim/plug-config/nvim-treesitter.vim
source $HOME/.config/nvim/plug-config/plantuml-previewer.vim
source $HOME/.config/nvim/plug-config/nvim-tree.vim
" source $HOME/.config/nvim/plug-config/nerdtree.vim
" source $HOME/.config/nvim/plug-config/nvim-compe.vim
" source $HOME/.config/nvim/plug-config/nvim-lightbulb.vim






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
set spelllang=en_gb,it
" highlight clear SpellBad
" highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
" highlight clear SpellCap
" highlight SpellCap term=underline cterm=underline
" highlight clear SpellRare
" highlight SpellRare term=underline cterm=underline
" highlight clear SpellLocal
" highlight SpellLocal term=underline cterm=underline


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  set undodir=~/.vim_runtime/temp_dirs/undodir
  set undofile
catch
endtry


" Formatlist https://vimways.org/2018/formatting-lists-with-vim/
set formatlistpat=^\\s*                     " Optional leading whitespace
set formatlistpat+=[                        " Start character class
set formatlistpat+=\\[({]\\?                " |  Optionally match opening punctuation
set formatlistpat+=\\(                      " |  Start group
set formatlistpat+=[0-9]\\+                 " |  |  Numbers
set formatlistpat+=\\\|                     " |  |  or
set formatlistpat+=[a-zA-Z]\\+              " |  |  Letters
set formatlistpat+=\\)                      " |  End group
set formatlistpat+=[\\]:.)}                 " |  Closing punctuation
set formatlistpat+=]                        " End character class
set formatlistpat+=\\s\\+                   " One or more spaces
set formatlistpat+=\\\|                     " or
set formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points

lua require('globals')
lua require('izifortune.telescope')
lua require('izifortune.telescope.mappings')
lua require('izifortune.lsp')
lua require('lspkind').init()
lua require('statusline')
lua require('izifortune.nvim-compe')
lua require('izifortune.nvim-autopairs')

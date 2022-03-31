call plug#begin('~/.local/share/nvim/plugged')

source $HOME/.config/nvim/plug-config/csv.vim


source $HOME/.config/nvim/plugins.vim

source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/functions.vim

source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/zettel.vim


source $HOME/.config/nvim/plug-config/nvim-cmp.vim
source $HOME/.config/nvim/plug-config/mkdx.vim
source $HOME/.config/nvim/plug-config/context.vim
source $HOME/.config/nvim/plug-config/easy-align.vim
source $HOME/.config/nvim/plug-config/fugitive.vim
source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/markdown-preview.nvim.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/weblink.vim
" source $HOME/.config/nvim/plug-config/vimspector.vim
source $HOME/.config/nvim/plug-config/vim-languagetool.vim
source $HOME/.config/nvim/plug-config/plantuml-previewer.vim
source $HOME/.config/nvim/plug-config/nvim-tree.vim
source $HOME/.config/nvim/plug-config/trouble.vim
source $HOME/.config/nvim/plug-config/vim-table-mode.vim
source $HOME/.config/nvim/plug-config/lightbulb.vim
source $HOME/.config/nvim/plug-config/lightspeed.vim
source $HOME/.config/nvim/plug-config/focus.vim
" source $HOME/.config/nvim/plug-config/hop.vim
" source $HOME/.config/nvim/plug-config/wilder.vim
" source $HOME/.config/nvim/plug-config/neuron.vim
" source $HOME/.config/nvim/plug-config/nerdtree.vim
" source $HOME/.config/nvim/plug-config/nvim-compe.vim
" source $HOME/.config/nvim/plug-config/nvim-lightbulb.vim
source $HOME/.config/nvim/plug-config/nvim-spectre.vim
source $HOME/.config/nvim/plug-config/vim-maximizer.vim

" All of your Plugins must be added before the following line
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif




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

lua require('izifortune.myinit')

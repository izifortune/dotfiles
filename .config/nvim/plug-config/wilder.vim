call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? are enabled by default
call wilder#set_option('modes', ['/', '?', ':'])

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     [
        \       wilder#check({_, x -> empty(x)}),
        \       wilder#history(),
        \       wilder#result({
        \         'draw': [{_, x -> ' ' . x}],
        \       }),
        \     ],
        \     wilder#cmdline_pipeline(),
        \     wilder#search_pipeline(),
        \   ),
        \ ])

" 'highlighter' : applies highlighting to the candidates
call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ }))

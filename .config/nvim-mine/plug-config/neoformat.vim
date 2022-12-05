augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat prettier
augroup END

nnoremap <buffer> <F9> :w<CR>:execute '!gnuplot' shellescape(@%,1)<CR>
setlocal commentstring=#\ %s

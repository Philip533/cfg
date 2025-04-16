setlocal nospell
setlocal shiftwidth=2
setlocal softtabstop=2
nnoremap <buffer> <F9> :w<CR>:execute '!gfortran' shellescape(@%,1)<CR> :execute '!./a.out'<CR>

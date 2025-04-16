setlocal shiftwidth=4
setlocal softtabstop=4
set tabstop=4
setlocal nospell
nnoremap <buffer> <F9> :w<CR>:execute '!python3' shellescape(@%, 1)<CR>

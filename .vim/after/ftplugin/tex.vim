setlocal spell
hi clear SpellBad
hi SpellBad cterm=underline
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal conceallevel=1
setlocal concealcursor=c
nnoremap <buffer> <F9> :w<CR> :VimtexCompile <CR>

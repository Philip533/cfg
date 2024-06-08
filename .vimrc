"Autocmd groups for filetypes and loading {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
    autocmd FileType vim nnoremap <buffer> <localleader>f Vatzf
augroup END

augroup load_file
     autocmd BufRead * :let @/ = ""
augroup END

augroup filetype_fortran
     autocmd!
     autocmd FileType fortran nnoremap <buffer> <F9> :w<CR>:execute '!gfortran' shellescape(@%,1)<CR> :execute '!./a.out'<CR>
augroup END

augroup filetype_gnuplot
     autocmd!
     autocmd FileType gnuplot nnoremap <buffer> <F9> :w<CR>:execute '!gnuplot' shellescape(@%,1)<CR>
     autocmd FileType gnuplot setlocal commentstring=#\ %s
augroup END

augroup filetype_python
     autocmd!
     autocmd FileType python nnoremap <buffer> <F9> :w<CR>:execute '!python3' shellescape(@%, 1)<CR>
augroup END

augroup filetype_cpp
     autocmd!
     autocmd FileType c nnoremap <buffer> <F9> :w<CR>:execute '!g++' shellescape(@%, 1)<CR> : execute '!./a.out. <CR>
augroup END

augroup filetype_tex
     autocmd!
     autocmd FileType tex nnoremap <buffer> <localleader>c I%<esc>
augroup END

augroup filetype_bash
     autocmd!
     autocmd FileType sh nnoremap <buffer> <localleader>c I#<esc>
augroup END
"}}}

"Basic settings (tabsize, clipboard,etc) {{{
set number
set nofixeol
set hidden
set hlsearch incsearch
set relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set background=dark
set clipboard=unnamedplus
set encoding=utf-8
set wildmenu
set ttyfast
set updatetime=1000
set ignorecase
set smartcase
"}}}

"Mappings {{{
"Change splits faster
let mapleader=" "
set backspace=indent,eol,start
"Delete lines
noremap - dd

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"Enter new line in insert mode
inoremap <C-o> <Esc>o
inoremap <C-O> <Esc>O

"Go to end of line in insert mode
inoremap <C-A> <Esc>A

"Quickfix window stuff
nnoremap <silent><leader>cn :cn<CR>
nnoremap <silent><leader>cp :cp<CR>

"Rebind escape to jk
inoremap jk <esc>

"Move to start or end of line in normal mode
nnoremap L $
nnoremap H 0

"Delete a line in insert mode
inoremap <C-d> <esc> ddi

"Uppercase  word in insert mode
inoremap <C-u> <esc> viw U  
inoremap <C-e> <esc> viw ui

"Edit vimrc, zshrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sz :!source ~/.zshrc<CR>

"Change buffers
nnoremap <leader>bd :bd<CR>
nnoremap <localleader>b :ls<CR>:b<Space>
nnoremap <leader>th :!th<CR><CR>

"Live preview for LaTex
noremap <leader>lp :LLPStartPreview<CR>

"Close brackets for different types
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

"Gfortran compilation
nnoremap <leader>gf :!gfortran -Wall -fcheck=all -fmax-errors=1 -O3 -march=native -std=f2008<CR>

"Put word in speech marks
inoremap <C-s> <esc>bi"<esc>ea"

" Changes how to save and quit
nnoremap <Leader>w :w<ESC>
nnoremap <Leader>z :wq<CR>

"Nerdtree mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"}}}

"Plugins installed using plugged {{{
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'dracula/vim'
Plug 'honza/vim-snippets'
Plug 'jeyemhex/vim-castep'
Plug 'lervag/vimtex'
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'sirver/UltiSnips'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
call plug#end()
"}}}

"UltiSnip stuff {{{
let g:UltiSnipsExpandTrigger = '<S-t>'
let g:UltiSnipsJumpForwardTrigger = '<S-f>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/plugged/vim-snippets/UltiSnips']
"}}}

"Toggle fold column{{{
nnoremap <leader>f :call FoldColumnToggle()<cr>
function! FoldColumnToggle()
     if &foldcolumn
          setlocal foldcolumn=0
     else
          setlocal foldcolumn=4
     endif
endfunction
"}}}

"Quickfix toggle{{{

nnoremap <leader>q :call QuickfixToggle()<cr>

let g:quickfix_is_open = 0

function! QuickfixToggle()
     if g:quickfix_is_open
        cclose
          let g:quickfix_is_open = 0
          execute g:quickfix_return_to_window . "wincmd w"
     else
          let g:quickfix_return_to_window = winnr()
          copen
          let g:quickfix_is_open = 1
     endif
endfunction

"}}}

"Vimtex settings {{{
set conceallevel=1
  let g:vimtex_syntax_conceal = {
    \ 'accents': 1,
    \ 'ligatures': 1,
    \ 'cites': 1,
    \ 'fancy': 1,
    \ 'greek': 1,
    \ 'math_bounds': 1,
    \ 'math_delimiters': 0,
    \ 'math_fracs': 1,
    \ 'math_super_sub': 1,
    \ 'math_symbols': 0,
    \ 'sections': 1,
    \ 'styles': 1,
    \}
"Sets vimtex default reader
let g:vimtex_view_general_viewer = 'okular'
let maplocalleader = "\\"

nnoremap <localleader>wc :VimtexCountWords<CR>
"Fold shit for latex
let g:vimtex_quickfix_mode= 0
let g:vimtex_fold_enabled = 1
set fillchars=fold:\ 
"}}}

"Airline themes {{{
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

"Airline buffer stuff at top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tagbar#flags = ''
nmap <F8> :TagbarToggle<CR>
"}}}

"YouCompleteMe{{{
"
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_show_diagnostics_ui = 0
nnoremap <leader>[ :YcmCompleter GoToDefinition<CR>
" let g:ycm_filetype_blacklist = { 'tex': 1 }
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"}}}

"IndentLine{{{
let g:indentLine_char = '⸽'
let g:indentLine_setColors = 1

"}}}

"Aesthetics {{{
set termguicolors
let g:rainbow_active = 1

" Gruvbox stuff
let g:gruvbox_underline=1
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_vert_split="bg2"
syntax enable
colorscheme gruvbox

"Highlights folds in black and white so it's actually readable
" hi Folded cterm=NONE ctermfg=Black ctermbg=white guifg=White guibg=#32371f
hi Folded cterm=NONE ctermfg=Black ctermbg=white guifg=White guibg=#665c54
hi Search cterm=NONE guifg=White guibg=#665c54
hi CurSearch cterm=NONE guifg=White guibg=#665c54
hi Question cterm=NONE guifg=White guibg=#665c54
hi IncSearch cterm=NONE guifg=#ffffff guibg=Black

"Gitgutter colours
highlight GitGutterAdd    guifg=#009900 guibg=#282828
highlight GitGutterChange guifg=#bbbb00 guibg=#282828
highlight GitGutterDelete guifg=#ff2222 guibg=#282828

"Changes cursor type for insert mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
let &t_TI = ""
let &t_TE = ""
highlight LineNr term=bold cterm=NONE ctermfg=Black ctermbg=NONE gui=NONE guifg=White guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=Black ctermbg=NONE gui=NONE guifg=White guibg=NONE
highlight SignColumn term=bold cterm=NONE ctermfg=White ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

hi clear SpellBad
hi SpellBad cterm=underline
set spell
highlight YcmWarningLine guibg=#ffffff ctermbg=white guifg=#ffffff
highlight YcmWarningSign guibg=#ffffff ctermbg=white guifg=#ffffff
highlight YcmWarningSection guibg=#ffffff ctermbg=white guifg=#ffffff
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#282828
highlight Pmenusel ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#665c54
"Toggles highlighting for search
nnoremap <silent> _ :nohl<CR>
"}}}

"Ctags {{{
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
"}}}

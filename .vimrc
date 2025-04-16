"Basic settings (tabsize, clipboard,etc) {{{
set number
set nofixeol
set hidden
set hlsearch incsearch
set relativenumber
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
let mapleader=" "
set backspace=indent,eol,start

" Switch split
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

"Go to end of line in insert mode
inoremap <C-A> <Esc>A

"Rebind escape to jk
inoremap jk <esc>

"Move to start or end of line in normal mode
nnoremap L $
nnoremap H 0

"Edit vimrc, zshrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sz :!source ~/.zshrc<CR>

"Change buffers
nnoremap <leader>bd :bd<CR>
nnoremap <localleader>b :ls<CR>:b<Space>

" Open a new terminator instance in pwd using custom th script
nnoremap <leader>th :!th<CR><CR>

"Close brackets for different types
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

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
call plug#begin('~/.vim/plugged')
" Show diffs in signcolumn and jump between changes
Plug 'airblade/vim-gitgutter'
" Snippets for various things
Plug 'honza/vim-snippets'
" Highlight CASTEP input files
Plug 'jeyemhex/vim-castep'
" Latex
Plug 'lervag/vimtex'
" Rainbow brackets
Plug 'luochen1990/rainbow'
" Show function name on tagbar
Plug 'majutsushi/tagbar'
" Colour scheme
Plug 'morhetz/gruvbox'
" File navigation
Plug 'preservim/nerdtree'
" More snippets
Plug 'sirver/UltiSnips'
" Fold functions in python
Plug 'tmhedberg/SimpylFold'
" Quick commenting
Plug 'tpope/vim-commentary'
" Put things in brackets etc
Plug 'tpope/vim-surround'
" Autocompletion with LSP
Plug 'Valloric/YouCompleteMe'
" Line at bottom of screen
Plug 'vim-airline/vim-airline'
" Theme for airline
Plug 'vim-airline/vim-airline-themes'
" Little dots showing indent level
Plug 'Yggdroot/indentLine'
call plug#end()
"}}}

"UltiSnip stuff {{{
let g:UltiSnipsExpandTrigger = '<C-t>'
let g:UltiSnipsJumpForwardTrigger = '<C-f>'
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
set concealcursor=c
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

"Airline buffer stuff 
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
let g:ycm_semantic_triggers = {
\  'tex'  : ['\ref{','\cite{'],
\ }

nnoremap <leader>[ :YcmCompleter GoTo<CR>
let g:ycm_key_list_select_completion = ['<Tab>', '<Down>']
let g:mma_candy = 1
let g:ycm_global_ycm_extra_conf = '~/PhD/mudirac/.ycm_extra_conf.py'

" YouCompleteMe configuration options
let g:ycm_language_server =
    \[
    \   {
    \       'name': 'fortls',
    \       'cmdline': ['fortls', '--hover_language', 'fortran', '--notify_init', '--hover_signature', '--use_signature_help', '--include_dirs'],
    \       'filetypes': ['fortran'],
    \       'project_root_files': ['.fortls'],
    \   },
    \]
"}}}

"IndentLine{{{
let g:indentLine_char = '⸽'
let g:indentLine_setColors = 1
let g:indentLine_setConceal = 0
"}}}

"Aesthetics {{{
set termguicolors
let g:rainbow_active = 1

" Gruvbox stuff
let g:gruvbox_underline=1
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_vert_split="bg2"
colorscheme gruvbox

"Highlights folds in black and white so it's actually readable
hi Folded cterm=NONE ctermfg=Black ctermbg=white guifg=White
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

" Change colours of various things
highlight LineNr term=bold cterm=NONE ctermfg=Black ctermbg=NONE gui=NONE guifg=White guibg=NONE
highlight CursorLineNr term=bold cterm=NONE ctermfg=Black ctermbg=NONE gui=NONE guifg=White guibg=NONE
highlight SignColumn term=bold cterm=NONE ctermfg=White ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight YcmWarningLine guibg=#ffffff ctermbg=white guifg=#ffffff
highlight YcmWarningSign guibg=#ffffff ctermbg=white guifg=#ffffff
highlight YcmWarningSection guibg=#ffffff ctermbg=white guifg=#ffffff
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#282828
highlight Pmenusel ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#665c54

" Vimdiff settings{{{
set diffopt+=inline:word
"}}}

"Toggles highlighting for search
nnoremap <silent> _ :nohl<CR>
"}}}

"Ctags {{{
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"
"}}}

filetype plugin indent on

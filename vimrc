set nocompatible

" General
" ==========
let mapleader=","
inoremap jk <ESC>

" Editor
" ==========
set relativenumber
set wrap
set backspace=indent,eol,start
set completeopt=longest,menuone
set splitbelow
set splitright
set splitbelow
set splitright

" tabs and indents
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab
map <leader>ev :e $MYVIMRC<cr>
map <leader>sv :source $MYVIMRC<cr>

" Search and Navigation
" ==========
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l

nnoremap <leader>sh :leftabove vnew<CR>
nnoremap <leader>sl :rightbelow vnew<CR>
nnoremap <leader>sk :leftabove new<CR>
nnoremap <leader>sj :rightbelow new<CR>

" Refactoring
" ==========
map <leader>fr *:%s//
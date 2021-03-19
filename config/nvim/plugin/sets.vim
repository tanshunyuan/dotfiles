set guifont=Go\ Mono\ For\ Powerline:h20
set number relativenumber
set nocompatible
set hidden
set encoding=utf-8
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab

" Copy
vnoremap  <leader>y  "+y
set clipboard+=unnamedplus

" Or if you have Neovim >= 0.1.5
set background=dark
if (has("termguicolors"))
 set termguicolors
endif

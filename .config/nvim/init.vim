call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'mattn/emmet-vim'
call plug#end()

set number
set nocompatible
set hidden
set encoding=utf-8
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

"Coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  " \ 'coc-eslint', 
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-angular',
  \ 'coc-tsserver',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-python', 
  \ ]

"NerdTree
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeWinPos = 'right'
map <C-n> :NERDTreeToggle<CR>

"CtrlSpace
let g:CtrlSpaceDefaultMappingKey = "<C-space> "

"Which Key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

"Ale
"let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

"Lub SpaceVim KeyBindings
noremap <leader>fs :w<cr>
noremap <leader>qq :q<cr>
noremap <leader>qQ :q!<cr>
noremap <leader>pI :PlugInstall<cr>


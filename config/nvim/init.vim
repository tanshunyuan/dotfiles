call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'liuchengxu/vim-which-key'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mkitt/tabline.vim'
" Colorscheme
Plug 'joshdick/onedark.vim'
call plug#end()


" set guifont=SauceCodePro\ Nerd\ Font\ Mono\ 20
set guifont=Go\ Mono\ For\ Powerline:h20
set number relativenumber
set nocompatible
set hidden
set encoding=utf-8
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab

" Copy 
vnoremap  <leader>y  "+y
set clipboard+=unnamedplus

" Or if you have Neovim >= 0.1.5
set background=dark
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme onedark


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
noremap <leader>qQ :qa<cr>
noremap <leader>pI :PlugInstall<cr>
noremap <leader>pC :PlugClean<cr>
noremap <leader>pf :GFiles<cr>
nnoremap <silent> <C-b> :BLines<cr>
nnoremap <C-f> :Rg! 

" Tabs
noremap <leader>t :tabnew<cr>
nnoremap <silent> <leader>1 1gt
nnoremap <silent> <leader>2 2gt
nnoremap <silent> <leader>3 3gt
nnoremap <silent> <leader>4 4gt
nnoremap <silent> <leader>5 5gt
nnoremap <silent> <leader>6 6gt
nnoremap <silent> <leader>7 7gt
nnoremap <silent> <leader>8 8gt
nnoremap <silent> <leader>9 9gt

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <localleader>sv :vs<cr>
nnoremap <localleader>sh :sp<cr>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Tabline
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE
set guitablabel=\[%N\]\ %t\ %M 

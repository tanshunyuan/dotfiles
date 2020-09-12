
call plug#begin('~/.vim/plugged')
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
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

" Emmet
let g:user_emmet_leader_key='<C-E>'
let g:user_emmet_mode='a'  "enable all functions, which is equal to

"Coc
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Go to definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
  " \ 'coc-eslint',
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-angular',
  \ 'coc-tsserver',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-css',
  \ 'coc-cssmodules',
  \ ]

"NerdTree
let g:NERDTreeIgnore = ['^node_modules$']
let g:NERDTreeWinPos = 'right'
map <C-n> :NERDTreeToggle<CR>

"Which Key
let g:mapleader = "\<Space>"
let g:maplocalleader = ';'
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>

"Ale
" \   'typescript': ['prettier'],
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'typescript': ['eslint'],
\}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

"Lub SpaceVim KeyBindings
noremap <leader>fs :w<cr>
noremap <leader>fS :wa<cr>
noremap <leader>qq :q<cr>
noremap <leader>qQ :qa<cr>
noremap <leader>pI :PlugInstall<cr>
noremap <leader>pC :PlugClean<cr>
noremap <leader>pf :GFiles<cr>
noremap <leader>bl :Buffers<cr>
nnoremap <silent> <C-b> :BLines<cr>
nnoremap <C-f> :Rg! "

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
nnoremap <silent> <leader>m :e ++ff=dos

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

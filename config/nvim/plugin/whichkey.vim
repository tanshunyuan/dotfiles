"Which Key
let g:mapleader = "\<Space>"
let g:maplocalleader = ';'
set timeoutlen=500
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ';'<CR>

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

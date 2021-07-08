
call plug#begin('~/.vim/plugged')
" Launch screen
Plug 'mhinz/vim-startify'
" File manager
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" File finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" External LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Built In LSP
" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-compe'
" Text Navigation
Plug 'unblevable/quick-scope'
" Linting
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'liuchengxu/vim-which-key'
Plug 'mattn/emmet-vim'
" Configure tabs
Plug 'mkitt/tabline.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'iamcco/coc-tailwindcss',  {'do': 'yarn install --frozen-lockfile && yarn run build'}
" Colorscheme
Plug 'joshdick/onedark.vim'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
" Syntax Highlighting
Plug 'sheerun/vim-polyglot'
call plug#end()

" source ~/.config/nvim/plugin/lspconfig.vim
" luafile ~/.config/nvim/lua/plugins/compe-config.lua
" luafile ~/.config/nvim/lua/lspconfig/css-lsp.lua
" luafile ~/.config/nvim/lua/lspconfig/html-lsp.lua
" luafile ~/.config/nvim/lua/lspconfig/js-lsp.lua
" luafile ~/.config/nvim/lua/lspconfig/json-lsp.lua
" luafile ~/.config/nvim/lua/lspconfig/tailwindcss-lsp.lua
" luafile ~/.config/nvim/lua/lspconfig/sumneko_lua.lua

" Theme
source ~/.config/nvim/themes/onedark.vim
" source ~/.config/nvim/themes/spaceduck.vim

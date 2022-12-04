" {{{ Plugin
call plug#begin('~/.config/nvim/plugged')

  " Formatter
  Plug 'sbdchd/neoformat'

  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'

  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-treesitter/nvim-treesitter-context'

  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
  Plug 'onsails/lspkind-nvim'
  Plug 'L3MON4D3/LuaSnip'
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'rafamadriz/friendly-snippets'

  " Git
  Plug 'lewis6991/gitsigns.nvim'

  Plug 'morhetz/gruvbox'
  Plug 'catppuccin/nvim', {'as': 'catppuccin'}
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'rebelot/kanagawa.nvim'
  Plug 'folke/lsp-colors.nvim'
  " Plug 'sheerun/vim-polyglot'

  " Tree
  Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'kyazdani42/nvim-tree.lua'

  " Status line
  Plug 'nvim-lualine/lualine.nvim'
call plug#end()
" }}}

" {{{ Lua import
lua <<EOF
require("umaru")
EOF
" }}}

" {{{ Setting
let g:python3_host_prog = '$HOME/.asdf/shims/python3'
let g:completion_matching_stategy_list = ['exact', 'substring', 'fuzzy']
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_try_node_exe = 1

augroup fmt
  autocmd!
  " autocmd BufWritePre * undojoin | lua vim.lsp.buf.formatting_sync()
  autocmd BufWritePre * undojoin | Neoformat
augroup END
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
" }}}

" {{{ Mappings
" Toogle search highlight
nnoremap <F10> :set hlsearch!<CR>

" {{{ Resize split windows using arrow keys
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w><
noremap <c-right> <c-w>>
" }}}

" {{{ Moving line up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" }}}2

" {{{ Other
nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" }}}2
" }}}1


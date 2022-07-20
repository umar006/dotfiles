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
  Plug 'folke/lsp-colors.nvim'
  Plug 'joshdick/onedark.vim'
  Plug 'sheerun/vim-polyglot'

  " Tree
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'

  " Status line
  Plug 'nvim-lualine/lualine.nvim'
call plug#end()
" }}}

"C {{{ General
" hello front end masters
set path+=**

" Nice menu when typing `:find *.py`
set wildmenu
set wildmode=longest,list,full
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

set number
set relativenumber
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set smartindent
set cursorline
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=16
set sidescrolloff=8
set splitright
" set noshowmode
set signcolumn=yes
set isfname+=@-@
" set ls=0
set showtabline=2
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set completeopt=menu,menuone,noselect
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=90
set foldmethod=marker
set pumheight=20
set clipboard+=unnamedplus
" }}}

" {{{ Color scheme
syntax on
" colorscheme onedark
colorscheme gruvbox
" let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
" colorscheme catppuccin
set background=dark
highlight Normal guibg=none
" }}}

" {{{ Setting
" let g:python3_host_prog = '/home/reborn/.virtualenvs/boiler-plate/bin/python3'
let g:python3_host_prog = '$HOME/.asdf/shims/python3'
let g:completion_matching_stategy_list = ['exact', 'substring', 'fuzzy']
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | lua vim.lsp.buf.formatting_sync()
augroup END
autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc
" }}}

" {{{ Lua

" {{{ Colorscheme
lua << EOF
require("catppuccin").setup{}
EOF
" }}} 2
"
" {{{ Telescope
lua << EOF
require'telescope'.setup{}
require'telescope'.load_extension('fzf')
EOF
" }}} 2

" {{{ Gitsigns
lua << EOF
require'gitsigns'.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎+", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
    change = { hl = "GitSignsChange", text = "▎=", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}
EOF
" }}} 2

" {{{ Lualine
lua << EOF
require('lualine').setup {
    options = {
        theme = 'gruvbox',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = '' }
    }
}
EOF
" }}} 2

" {{{ Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}
EOF
" }}} 2

" {{{ Tree
lua << EOF
require'nvim-tree'.setup {
    disable_netrw = false,
    hijack_cursor = false,
    open_on_tab = false,
    actions = {
        open_file = {
            resize_window = true
        }
    },
    filters = {
        dotfiles = true,
    },
}
EOF
" }}} 2

" {{{ Web Devicons
lua << EOF
require'nvim-web-devicons'.setup {
    -- globally enable default icons (default to false)
    -- will get overriden by `get_icons` option
    default = true;
    }
EOF
" }}} 2

" {{{ Completion
lua << EOF
-- Setup lua-snip
local luasnip = require 'luasnip'
require("luasnip.loaders.from_vscode").lazy_load()

-- Setup nvim-cmp.
local cmp = require'cmp'
local source_mapping = {
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
    path = "[Path]",
}

local lspkind = require("lspkind")
local cmp_kinds = {
  Text = '  ',
  Method = '  ',
  Function = '  ',
  Constructor = '  ',
  Field = '  ',
  Variable = '  ',
  Class = '  ',
  Interface = '  ',
  Module = '  ',
  Property = '  ',
  Unit = '  ',
  Value = '  ',
  Enum = '  ',
  Keyword = '  ',
  Snippet = '  ',
  Color = '  ',
  File = '  ',
  Reference = '  ',
  Folder = '  ',
  EnumMember = '  ',
  Constant = '  ',
  Struct = '  ',
  Event = '  ',
  Operator = '  ',
  TypeParameter = '  ',
}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
    },
    formatting = {
        format = function(entry, vim_item)
            --vim_item.kind = lspkind.presets.default[vim_item.kind]
            vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
            local menu = source_mapping[entry.source.name]
            vim_item.menu = menu
            return vim_item
        end
    },
    sources = {
        { name = "nvim_lsp" },

        -- For luasnip user.
        { name = "luasnip" },
        { name = 'nvim_lsp_signature_help' },
        { name = "path" },
        { name = "buffer" },
    },
})
EOF
" }}} 2

" {{{ LSP
lua << EOF
local lspconfig = require 'lspconfig'
local util = require "lspconfig/util"
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require("lspconfig").tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require("lspconfig").pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require("lspconfig").gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls", "serve" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

require("lspconfig").dockerls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require("lspconfig").vimls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

require("lspconfig").html.setup{
    on_attach = on_attach,
    capabilities = capabilities
}
EOF
" }}} 2

" }}}

" {{{ Mappings
" Toogle search highlight
nnoremap <F10> :set hlsearch!<CR>
nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?

" {{{ Lua tree
nnoremap <c-b> :NvimTreeToggle<CR>
nnoremap <leader>b :NvimTreeFocus<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" }}}2

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

" {{{ Tabs
"" Open current directory
nmap te :tabedit
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
" }}}2

" {{{ Telescope config
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" }}}2

" {{{ Other
nnoremap Y yg$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
" }}}2
" }}}1


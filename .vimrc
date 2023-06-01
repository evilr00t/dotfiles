" File: ~/.vimrc

" Gotta be first
set nocompatible

filetype off

" TODO: Get rid of FZF
set rtp+=/usr/local/opt/fzf
call plug#begin()
"Plug 'itchyny/lightline.vim'
"Plug 'mengelbrecht/lightline-bufferline'
Plug 'scrooloose/nerdcommenter'
" Plug 'jbgutierrez/vim-better-comments'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vista.vim'
Plug 'vim-scripts/a.vim'
Plug 'folke/tokyonight.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'machakann/vim-highlightedyank'
Plug 'sheerun/vim-polyglot'
" Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'segeljakt/vim-silicon'
Plug 'rking/ag.vim'
Plug 'junegunn/goyo.vim'
Plug 'Pocco81/TrueZen.nvim'
Plug 'junegunn/limelight.vim' " <- Used by goyo to highlight current paragraph.
" Plug 'mhinz/vim-startify'
Plug 'phaazon/hop.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'scrooloose/nerdtree'
Plug 'yuttie/comfortable-motion.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'p00f/nvim-ts-rainbow'
Plug 'lewis6991/gitsigns.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'projekt0n/github-nvim-theme'
Plug 'folke/which-key.nvim'
Plug 'echasnovski/mini.nvim'
Plug 'pearofducks/ansible-vim'

call plug#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set wildmenu
set wildmode=longest,list,full
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*
set showmatch
set list
set listchars=tab:\|\ ,trail:▫
set hidden
" auto reloadfile
set autoread
set modeline
set wrap
" insensitive search
set ignorecase
set smartcase
set fileformats+=dos
set ffs=unix
set updatetime=50
set cmdheight=2
set scrolloff=8
set ttimeout        " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key
set textwidth=132

let mapleader = ","
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Vim should reload automatically when config file has been changed
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

set nofoldenable          " disable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
set colorcolumn=132
syntax on
" set mouse=a
"set formatoptions=tcqronj
set termguicolors

" Toggle this to "light" for light colorscheme
set background=dark

set t_Co=256

" Set the colorscheme
try
    "let g:gruvbox_material_transparent_background = 1
    "let g:gruvbox_material_background = 'soft'
    "let g:gruvbox_material_palette = 'mix'
    "let g:gruvbox_contrast_dark = 'medium'
    "let g:nvcode_termcolors=256
    "let g:tokyonight_style = "night"
    let g:tokyonight_italic_functions = 1
    colorscheme github_dark
    " Comments should be in italic style
    " hi Comment cterm=italic
    " Transparent background - use terminal background colour
    " hi Normal guibg=NONE ctermbg=NONE
catch
    colorscheme slate
endtry

hi Comment cterm=italic

" Always show statusbar
set laststatus=2

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set number relativenumber

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Open/close tagbar with \b
nmap <silent> <leader>T :TagbarToggle<CR>

" https://stackoverflow.com/questions/33465357/one-mapping-to-toggle-nerdtree-and-open-to-current-file-when-toggling-on
function MyNerdToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction
nmap <leader>r :call MyNerdToggle()<cr>

" move around buffer using <leader>[NUMBER]
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" close buffer using <leader>c[NUMBER]
nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

" Ctrl + _ for toggling comments
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
" Allows you to save files you opened without write permissions via sudo
cmap w!! %!sudo tee > /dev/null %


nnoremap <F5> "=strftime("%FT%T%z")<CR>P
inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>
" Remove all whitespaces
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
lua vim.api.nvim_set_keymap('n', '<leader>e', "<cmd>lua require'hop'.hint_words()<cr>", {})

" Undotree
nnoremap <F7> :UndotreeToggle<CR>
" Go back to terminal
nnoremap <leader>t :stop<CR>
" Run Python code
" nmap <buffer> <leader>r <Esc>:w<CR>:!clear;python %<CR>

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Yank without newline...
nnoremap Y y$

"start a search query by pressing \
nnoremap \  :Ag<space>
"search for word under cursor by pressing |
nnoremap \| :Ag <C-R><C-W><cr>:cw<cr>

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=~/.vimtags

let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:goyo_width = "85%"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"

""" FROM https://routley.io/posts/nine-months-with-vim/
" Open new splits to right and bottom
set splitbelow
set splitright

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" Shell like behavior(not recommended).
set completeopt=menuone,noselect

" Relative number toggle based on focus / mode
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" ----------------------------------------------------------------------------
" FILE TYPE TRIGGERS
" ----------------------------------------------------------------------------

" Reset all autocommands
augroup vimrc
autocmd!

" autoreload file if cursor does not move
au CursorHold,CursorHoldI * checktime
augroup END

set guicursor=i:block-blinkwait175-blinkoff150-blinkon175

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" use os x clipboard
set clipboard=unnamedplus
let g:limelight_conceal_ctermfg = 233
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_paragraph_span = 1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:silicon = {
      \ 'theme':              'Dracula',
      \ 'font':               'Fantasque Sans Mono',
      \ 'background':         '#aaaaff',
      \ 'shadow-color':       '#555555',
      \ 'line-pad':                   2,
      \ 'pad-horiz':                  0,
      \ 'pad-vert':                   0,
      \ 'shadow-blur-radius':         0,
      \ 'shadow-offset-x':            0,
      \ 'shadow-offset-y':            0,
      \ 'line-number':           v:true,
      \ 'round-corner':          v:true,
      \ 'window-controls':       v:true,
      \ }
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Because I want to see raw markdown when editing
let g:vim_markdown_conceal = 0

set showtabline=1
"let g:lightline#bufferline#min_buffer_count = 2
"let g:lightline#bufferline#show_number = 1
"let g:lightline = {
"      \ 'colorscheme': 'one',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"      \ },
"      \ 'component_function': {
"      \   'gitbranch': 'FugitiveHead',
"      \ },
"      \ 'tabline': {
"      \   'left': [ ['buffers'] ],
"      \   'right': [ ]
"      \ },
"      \ 'component_expand': {
"      \   'buffers': 'lightline#bufferline#buffers'
"      \ },
"      \ 'component_type': {
"      \   'buffers': 'tabsel'
"      \ }
"      \ }
"
"autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_fzf_preview = ['right:50%']

if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 2
endif

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let NERDTreeShowHidden=1

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true

lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>vd', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vws', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vrn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>vr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'i', '<leader>vf', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'rust_analyzer', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

require("which-key").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
}

require('gitsigns').setup {
  signs = {
      add          = {hl = 'GitSignsAdd'   , text = '+', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
      change       = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      delete       = {hl = 'GitSignsDelete', text = '-', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'}
    }
}
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

require'hop'.setup()

local cmp = require("cmp")
cmp.setup({
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      }),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
   },
   sources = {
      { name = "buffer" },
      { name = "nvim_lsp" },
      { name = "path" },
   },
})

vim.cmd([[
augroup NvimCmp
   au!
   au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
augroup END
]])


local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {}
    server:setup(opts)
end)

require'colorizer'.setup()
require('mini.animate').setup()
require('mini.basics').setup()
require('mini.pairs').setup()
require('mini.statusline').setup()
require('mini.cursorword').setup()
EOF


" File: .vimrc
" Original Author: Jake Zimmerman <jake@zimmerman.io>
" Author: Karol Czeryna <k@e-dot.uk>
" Update: 2019-08-19T10:44:36+0100
" How I configure Vim :P
"

" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" ----- Making Vim look good ------------------------------------------
Plugin 'itchyny/lightline.vim'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'metalelf0/supertab'
Plugin 'scrooloose/nerdcommenter'
Plugin 'python-mode/python-mode'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Yggdroot/indentLine'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plugin 'vim-ruby/vim-ruby'
Plugin 'stephpy/vim-yaml'
Plugin 'elzr/vim-json'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'xolox/vim-misc'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-endwise'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/a.vim'
" colorschemes !
Plugin 'morhetz/gruvbox'
Plugin 'sainnhe/gruvbox-material'
Plugin 'dracula/vim' " Dracula
Plugin 'drewtempelmeyer/palenight.vim'


Plugin 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plugin 'AndrewRadev/splitjoin.vim'

"Plugin 'Shougo/neocomplete'
" NeoVim does not have lua support... use proper completion tool!
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'deoplete-plugins/deoplete-jedi'
Plugin 'deoplete-plugins/deoplete-go', { 'do': 'make' }
Plugin 'davidhalter/jedi-vim'
Plugin 'Shougo/neco-syntax'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'szw/vim-maximizer'
"Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'
Plugin 'w0rp/ale'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'auxiliary/vim-layout'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'hashivim/vim-terraform'
Plugin 'cespare/vim-toml'
Plugin 'juliosueiras/vim-terraform-completion'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'
Plugin 'machakann/vim-highlightedyank'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'pearofducks/ansible-vim'
Plugin 't9md/vim-chef'
Plugin 'rodjek/vim-puppet'

" ---- Extras/Advanced plugins ----------------------------------------
" Easily surround chunks of text
Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
Plugin 'HTML-AutoCloseTag'
" All the other syntax plugins I use
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hashivim/vim-vagrant'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mattn/emmet-vim'
Plugin 'mhartington/oceanic-next'
Plugin 'agfline/c-syntax.vim'
Plugin 'segeljakt/vim-silicon'



call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set cursorline
set wildmenu
set lazyredraw
set showmatch
set list
set listchars=tab:\|\ ,trail:▫
set hidden
" auto reloadfile
set autoread
set ttyfast
set modeline
set wrap
" insensitive search
set ignorecase
set smartcase
set fileformats+=dos
set nofixendofline
set ffs=unix

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
set colorcolumn=81
syntax on
set mouse=a
set formatoptions=tcqronj
set termguicolors

" Toggle this to "light" for light colorscheme
set background=dark

set t_Co=256

" Set the colorscheme
try
  " let g:space_vim_dark_background = 233
  "  let g:gruvbox_material_transparent_background = 1
  " let g:gruvbox_contrast_dark = 'medium'
  " hi Comment cterm=italic
  " let g:oceanic_next_terminal_bold = 1
  " let g:oceanic_next_terminal_italic = 1
  colorscheme palenight
  hi Normal guibg=NONE ctermbg=NONE
  let g:palenight_terminal_italics=1
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
" 'hybrid' mode number
set number relativenumber



" LightLine Preferences
let g:tmuxline_powerline_separators = 0
let g:lightline = { 'colorscheme': 'palenight' }
" let g:lightline = {'colorscheme': 'one'}
"let g:lightline = {'colorscheme' : 'gruvbox_material'}

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap <Leader>b :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>q :Tags<CR>
" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0

" Whitespaces... oh gosh, i hate them...
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)
" Also highlight all tabs
"highlight Tabs ctermbg=darkgreen guibg=darkgreen
"match Tabs /\t/


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=~/.vimtags
" Sensible defaults
" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
" nmap <silent> <leader>T :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- pymode -----
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_virtualenv = 1
let g:pymode_indent = 0


"req ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

let g:vim_markdown_frontmatter = 1
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


nmap <leader>ne :NERDTree<cr>

nnoremap <F5> "=strftime("%FT%T%z")<CR>P
inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>
" Remove all whitespaces
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" Yank without newline...
nnoremap Y y$

""" FROM https://routley.io/posts/nine-months-with-vim/

" Open new splits to right and bottom
set splitbelow
set splitright

" Open the current file in a new vertial split with '='
nnoremap = :vsplit<cr>

" Easy split navigation
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Simplify using tabs using alt+<h/l> (Polish Pro)
nnoremap ł gT
nnoremap ķ gt
nnoremap T :tabnew<cr>

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e


" Shell like behavior(not recommended).
" set completeopt=longest,menuone,noinsert
set wildmode=longest,list,full

" ALE - Error and warning signs.
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
highlight SpecialKey ctermfg=124 guifg=#af3a03
let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'go': ['goimports'],
  \ 'markdown': ['markdownlint']
  \ }

" Custom ALE fixers
let g:ale_fixers = {
  \ 'go': ['goimports'],
  \ 'python': ['black'],
  \ 'javascript': ['prettier']
  \ }

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_highlights = 0

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" Ansible preferences
let g:ansible_extra_syntaxes = "sh.vim python.vim"
let g:ansible_extra_keywords_highlight = 1

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

au BufNewFile,BufRead *.cson    set ft=coffee
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.groovy    set syntax=Jenkinsfile
au BufNewFile,BufRead *.glsl    setf glsl
au BufNewFile,BufRead *.gyp     set ft=python
au BufNewFile,BufRead *.html    setlocal nocindent smartindent
au BufNewFile,BufRead *.i7x     setf inform7
au BufNewFile,BufRead *.ini     setf conf
au BufNewFile,BufRead *.input   setf gnuplot
au BufNewFile,BufRead *.json    set ft=json tw=0
au BufNewFile,BufRead *.template    set ft=yaml
au BufNewFile,BufRead *.less    setlocal ft=less nocindent smartindent
au BufNewFile,BufRead *.md      setlocal ft=markdown nolist spell
au BufNewFile,BufRead *.md,*.markdown setlocal foldlevel=999 tw=0 nocin
au BufNewFile,BufRead *.ni      setlocal ft=inform nolist ts=2 sw=2 noet
au BufNewFile,BufRead *.plist   setf xml
au BufNewFile,BufRead *.rb      setlocal noai
au BufNewFile,BufRead *.rxml    setf ruby
au BufNewFile,BufRead *.sass    setf sass
au BufNewFile,BufRead *.ttml    setf xml
au BufNewFile,BufRead *.vert,*.frag set ft=glsl
au BufNewFile,BufRead *.xml     setlocal ft=xml  ts=2 sw=2 et
au BufNewFile,BufRead *.zone    setlocal nolist ts=4 sw=4 noet
au BufNewFile,BufRead *.zsh     setf zsh
au BufNewFile,BufRead *templates/*.html setf htmldjango
au BufNewFile,BufRead .git/config setlocal ft=gitconfig nolist ts=4 sw=4 noet
au BufNewFile,BufRead .gitconfig* setlocal ft=gitconfig nolist ts=4 sw=4 noet
au BufNewFile,BufRead .vimlocal,.gvimlocal setf vim
au BufNewFile,BufRead .zshlocal setf zsh
au BufNewFile,BufRead /tmp/crontab* setf crontab
au BufNewFile,BufRead COMMIT_EDITMSG setlocal nolist nonumber
au BufNewFile,BufRead Makefile setlocal nolist
" au BufRead,BufNewFile *.yml,*.yaml set filetype=yaml.ansible
au FileType gitcommit setlocal nolist ts=4 sts=4 sw=4 noet textwidth=62
au FileType inform7 setlocal nolist tw=0 ts=4 sw=4 noet foldlevel=999
au FileType json setlocal conceallevel=0 foldmethod=syntax foldlevel=999
au FileType make setlocal nolist ts=4 sts=4 sw=4 noet
au FileType markdown syn sync fromstart

" autoreload file if cursor does not move
au CursorHold,CursorHoldI * checktime
augroup END

function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

let g:deoplete#enable_at_startup = 1

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:LanguageClient_serverCommands = {
    \'python' : ['pyls']
    \ }

" use os x clipboard
set clipboard=unnamed
let g:limelight_conceal_ctermfg = 233
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_paragraph_span = 1
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
let g:user_emmet_mode='a'    "enable all function in all mode.
augroup EmmetSettings
  autocmd! FileType html imap <tab> <plug>(emmet-expand-abbr)
augroup END

let g:gutentags_enabled = 0
let g:deoplete#sources#jedi#show_docstring = 1
" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


let g:python3_host_prog  = '/usr/local/bin/python3'

" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
let g:terraform_align=1

let g:silicon = {
      \ 'theme':              'Dracula',
      \ 'font':               'IBM Plex Mono',
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

" Ctrl + _ for toggling comments
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
if exists('$TMUX')
  autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
  autocmd VimLeave * call system("tmux setw automatic-rename")
endif

autocmd FileType go nmap <leader>t <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

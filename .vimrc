":AirlineTheme gruvbox_material File: .vimrc
" Original Author: Jake Zimmerman <jake@zimmerman.io>
" Author: Karol Czeryna <k@e-dot.uk>
" Update: 2020-06-07T17:13:28+0100
" How I configure Vim :P
"

" Gotta be first
set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'metalelf0/supertab'
Plugin 'scrooloose/nerdcommenter'
" Plugin 'python-mode/python-mode'
" Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Yggdroot/indentLine'
Plugin 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plugin 'junegunn/fzf.vim'
Plugin 'liuchengxu/vista.vim'
Plugin 'vim-scripts/a.vim'
Plugin 'sainnhe/gruvbox-material'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'mbbill/undotree'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'machakann/vim-highlightedyank'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'segeljakt/vim-silicon'
Plugin 'rking/ag.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim' " <- Used by goyo to highlight current paragraph.
Plugin 'mhinz/vim-startify'
Plugin 'easymotion/vim-easymotion'

call vundle#end()

filetype plugin indent on

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set wildmenu
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
set updatetime=100
set cmdheight=2
set scrolloff=8

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
" set mouse=a
"set formatoptions=tcqronj
set termguicolors

" Toggle this to "light" for light colorscheme
set background=dark

set t_Co=256

" Set the colorscheme
try
    let g:gruvbox_material_transparent_background = 1
    let g:gruvbox_material_background = 'soft'
    let g:gruvbox_material_palette = 'mix'
    "let g:gruvbox_contrast_dark = 'medium'
    "hi Comment cterm=italic
    colorscheme gruvbox-material
    "hi Normal guibg=NONE ctermbg=NONE
catch
    colorscheme slate
endtry



hi Comment cterm=italic

" Always show statusbar
set laststatus=2

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number relativenumber

" nmap <F8> :TagbarToggle<CR>
" nmap <F9> :bprev<CR>
" nmap <F10> :bnext<CR>
nmap <Leader>B :Buffers<CR>
nmap <Leader>h :History<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>F :Files<CR>
nmap <Leader>q :Tags<CR>
" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=~/.vimtags
" Open/close tagbar with \b
nmap <silent> <leader>T :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

"req ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
"hi clear SignColumn

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

nnoremap <F5> "=strftime("%FT%T%z")<CR>P
inoremap <F5> <C-R>=strftime("%FT%T%z")<CR>
" Remove all whitespaces
nnoremap <F6> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" coc
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'
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
let g:ale_list_window_size = 5

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

let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" use os x clipboard
set clipboard=unnamed
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

" Ctrl + _ for toggling comments
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

if exists('$TMUX')
  autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%:t"))
  autocmd VimLeave * call system("tmux setw automatic-rename")
endif

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--color-path="0;33"', <bang>0)
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Temporary just to get used to proper vim navigation
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Because I want to see raw markdown when editing
let g:vim_markdown_conceal = 0

"start a search query by pressing \
nnoremap \  :Ag<space>
"search for word under cursor by pressing |
nnoremap \| :Ag <C-R><C-W><cr>:cw<cr>

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
" rename variable
nmap <leader>rr <Plug>(coc-rename)
" project rename world
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }

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

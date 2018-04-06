" File: .vimrc
" Original Author: Jake Zimmerman <jake@zimmerman.io>
" Author: Karol Czeryna <k@e-dot.uk>
" Update: Mon 12 Mar 14:08:32 2018
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
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
"Plugin 'bling/vim-airline'
Plugin 'itchyny/lightline.vim'

" ----- Vim as a programmer's text editor -----------------------------
Plugin 'python-mode/python-mode'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'mitsuhiko/vim-python-combined'
Plugin 'junegunn/fzf.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-endwise'
Plugin 'majutsushi/tagbar'
" Plugin 'kien/ctrlp.vim' " since now on - we use ack.vim with fzf.vim
Plugin 'vim-scripts/a.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
Plugin 'sjl/badwolf'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
"Plugin 'Shougo/neocomplete'
" NeoVim does not have lua support... use proper completion tool!
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plugin 'zchee/deoplete-jedi'
Plugin 'zchee/deoplete-go'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'szw/vim-maximizer'
"Plugin 'sjl/gundo.vim'
Plugin 'mbbill/undotree'
Plugin 'w0rp/ale'
Plugin 'martinda/Jenkinsfile-vim-syntax'
Plugin 'auxiliary/vim-layout'
Plugin 'liuchengxu/space-vim-dark'

" ----- Working with Git ----------------------------------------------
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'hashivim/vim-terraform'

" ----- Other text editing features -----------------------------------
Plugin 'Raimondi/delimitMate'

" ----- man pages, tmux -----------------------------------------------
Plugin 'jez/vim-superman'
Plugin 'christoomey/vim-tmux-navigator'

" ----- Syntax plugins ------------------------------------------------
Plugin 'jez/vim-c0'
Plugin 'jez/vim-ispc'
Plugin 'kchmck/vim-coffee-script'
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'
Plugin 'tpope/vim-markdown'
Plugin 'pearofducks/ansible-vim'
Plugin 't9md/vim-chef'
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'

" ---- Extras/Advanced plugins ----------------------------------------
" Highlight and strip trailing whitespace
Plugin 'ntpeters/vim-better-whitespace'
" Easily surround chunks of text
Plugin 'tpope/vim-surround'
" Align CSV files at commas, align Markdown tables, and more
Plugin 'godlygeek/tabular'
" Automaticall insert the closing HTML tag
Plugin 'HTML-AutoCloseTag'
" Make tmux look like vim-airline (read README for extra instructions)
"Plugin 'edkolev/tmuxline.vim'
" All the other syntax plugins I use
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hashivim/vim-vagrant'
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'nanotech/jellybeans.vim'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}

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
set hidden
" auto reloadfile
set autoread
set ttyfast
set modeline
" don't wrap lines automagically... it's pissing me off!
set nowrap


let mapleader = ","
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
"inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-g>u\<Tab>"
"map <Leader> <Plug>(easymotion-prefix)

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
set colorcolumn=80
set textwidth=80
syntax on

set mouse=a

" ----- Plugin-Specific Settings --------------------------------------

" ----- altercation/vim-colors-solarized settings -----
" Toggle this to "light" for light colorscheme
set background=dark

" Uncomment the next line if your terminal is not configured for solarized
"let g:solarized_termcolors=256
set t_Co=256
"let g:PaperColor_Theme_Options = {
"  \   'theme': {
"  \     'default': {
"  \       'transparent_background': 1
"  \     }
"  \   }
"  \ }

let g:space_vim_dark_background = 233

" Set the colorscheme
" colorscheme PaperColor
colorscheme space-vim-dark
hi Comment cterm=italic

"if exists('$TMUX')
"      " gui term colours
"      set termguicolors
"
"      " set Vim-specific sequences for RGB colors
"      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"endif

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab



" ----- ctrlp ------
"
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Fancy arrow symbols, requires a patched font
" To install a patched font, run over to
"     https://github.com/abertsch/Menlo-for-Powerline
" download all the .ttf files, double-click on them and click "Install"
" Finally, uncomment the next line
"let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
"let g:airline_detect_paste=1

" Show airline for tabs too
"let g:airline#extensions#tabline#enabled = 1

" LightLine Preferences
let g:tmuxline_powerline_separators = 0
let g:lightline = {'colorscheme': 'Dracula'}

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :bprev<CR>
nmap <F10> :bnext<CR>
nmap ; :Buffers<CR>
nmap <Leader>f :Files<CR>
nmap <Leader>r :Tags<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 0


" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

" ----- pymode -----
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_lint_checkers = ['flake8']


" ----- airblade/vim-gitgutter settings -----
" Required after having changed the colorscheme
hi clear SignColumn
" In vim-airline, only display "hunks" if the diff is non-zero

" ----- Raimondi/delimitMate settings -----
let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END

let g:vim_markdown_folding_disabled=1
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:goyo_width = "85%"

"let g:UltiSnipsExpandTrigger="<c-l>"
"let g:UltiSnipsJumpForwardTrigger="<c-k>"
"let g:UltiSnipsJumpBackwardTrigger="<c-j>"

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1

let g:go_fmt_command = "gofmt"


nmap <leader>ne :NERDTree<cr>

nnoremap <F5> "=strftime("%c")<CR>P
inoremap <F5> <C-R>=strftime("%c")<CR>

inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
set completeopt=longest,menuone,preview
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" ALE - Error and warning signs.
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
highlight SpecialKey ctermfg=124 guifg=#af3a03

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" SuperTab
let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestHighlight=1
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" Ansible preferences
let g:ansible_extra_syntaxes = "sh.vim python.vim"
let g:ansible_extra_keywords_highlight = 1

" ----------------------------------------------------------------------------
" FILE TYPE TRIGGERS
" ----------------------------------------------------------------------------

" Reset all autocommands
augroup vimrc
autocmd!

au BufNewFile,BufRead *.cson    set ft=coffee
au BufNewFile,BufRead *.glsl    setf glsl
au BufNewFile,BufRead *.gyp     set ft=python
au BufNewFile,BufRead *.html    setlocal nocindent smartindent
au BufNewFile,BufRead *.i7x     setf inform7
au BufNewFile,BufRead *.ini     setf conf
au BufNewFile,BufRead *.input   setf gnuplot
au BufNewFile,BufRead *.json    set ft=json tw=0
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
au BufRead,BufNewFile *.yml,*.yaml set filetype=yaml.ansible

au FileType gitcommit setlocal nolist ts=4 sts=4 sw=4 noet
au FileType inform7 setlocal nolist tw=0 ts=4 sw=4 noet foldlevel=999
au FileType json setlocal conceallevel=0 foldmethod=syntax foldlevel=999
au FileType make setlocal nolist ts=4 sts=4 sw=4 noet
au FileType markdown syn sync fromstart
au Filetype gitcommit setlocal tw=80

" autoreload file if cursor does not move
au CursorHold,CursorHoldI * checktime

"python3 << EOF
"import vim
"import git
"def is_git_repo():
"     try:
"         _ = git.Repo('.', search_parent_directories=True).git_dir
"         return "1"
"     except:
"         return "0"
"vim.command("let g:pymode_rope = " + is_git_repo())
"EOF

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

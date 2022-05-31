:" 2lach
" termux android zsh

" Vimplug | https://github.com/junegunn/vim-plug
call plug#begin()
" Themes
Plug 'fugalh/desert.vim'
Plug 'gf3/molotov'
Plug 'pineapplegiant/spaceduck'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Format
Plug 'aonemd/fmt.vim'
Plug 'sbdchd/neoformat'
Plug 'machakann/vim-highlightedyank'
Plug 'tpope/vim-commentary'
" Autocomplete
Plug 'ycm-core/YouCompleteMe' " pkg i vim-python

" Shorthand notation
Plug 'junegunn/vim-easy-align'
" Vim filetree           | Lazyload
Plug 'preservim/nerdtree',{ 'on':'NERDTreeToggle' }

" Initialize plugin system
call plug#end()

" Turn on filetype detection plugin and indent
if exists(":filetype") == 2
				filetype plugin indent on
endif

" Always turn syntax highlighting on
" should come after filetype plugin command
if has("syntax")
				syntax on
endif

set t_Co=256
" dark background
set background=dark
" theme
colorscheme molotov

set termguicolors

" Make Vim more useful
set nocompatible

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed

" Enhance command-line completion
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
				set undodir=~/.vim/undo
endif
set undofile

" keep viminfo file in .vim dir
set viminfo+=n~/.vim/viminfo

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable line numbers
set number

" Highlight current line
set cursorline
highlight Cursorline guibg=black

" Make tabs as wide as two spaces
set tabstop=2

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Always show status line
set laststatus=2

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed
set showcmd

" Use relative line numbers
if exists("&relativenumber")
				set relativenumber
				au BufReadPost * set relativenumber
endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
				let save_cursor = getpos(".")
				let old_query = getreg('/')
				:%s/\s\+$//e
				call setpos('.', save_cursor)
				call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>

" Automatic commands
if has("autocmd")
				" Enable file type detection
				filetype on
				" Treat .json files as .js
				autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
				" Treat .md files as Markdown
				autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" Cursor Mode Settings
let &t_SI.="\e[4 q" "SI = INSERT mode
let &t_SR.="\e[3 q" "SR = REPLACE mode
let &t_EI.="\e[4 q" "EI = NORMAL mode (ELSE)

"Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"""""""""""""""""""""
" === NerdTREE ==== "
"""""""""""""""""""""
" show hidden files
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close vim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toogle with <Ctrl> + n
map <C-n> :NERDTreeToggle<CR>
				
:"""""""""""""""""""""
": ===  Airline ==== "
:"""""""""""""""""""""
let g:airline_theme='base16_solarized_light'
" 'random' google_dark google_light papercolor 'molotov'
" let g:airline_extensions = []

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_powerline_fonts = 1

let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#formatter = 'default'

"""""""""""""""""""""""""""""""
" === vim-highlightedyank === "
"""""""""""""""""""""""""""""""
if !exists('##TextYankPost')
				map Y <Plug>(highlightedyank)
				map y <Plug>(highlightedyank)
endif

let g:highlightedyank_highlight_duration = 450

""""""""""""""""""""""""""""
" === YOU COMPLETE ME  === "
""""""""""""""""""""""""""""
" change colors in ycm popup window
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#000087

" color charts for vim:
" http://www.calmar.ws/vim/256-xterm-24bit-rgb-color-chart.html

"""""""""""""""""""""""""""
" ===			fmt.vim			=== "
"""""""""""""""""""""""""""
let g:fmt_commands = {
												\ 'rust': 'rustfmt',
												\ 'go': 'gofmt -w',
												\ 'c': 'clang-format -i -style=google',
												\ 'cpp': 'clang-format -i -style=google',
												\ 'javascript': 'prettier --write',
												\ 'typescript': 'prettier --write',
												\ 'ruby': 'rufo',
												\ 'sh': 'shfmt -w',
												\ 'zsh': 'shfmt -w',
												\ }

autocmd! BufWrite * Fmt

" augroup fmt
"					autocmd!
"					autocmd BufWritePre * undojoin | Neoformat
" augroup END
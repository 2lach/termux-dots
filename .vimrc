" ~l/.vimrc
" 2lach 
" termux android zsh
"set relativenumber

" Vimplug
" https://github.com/junegunn/vim-plug
call plug#begin()

" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'

" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'
" Make sure you use single quotes

" Themes
Plug 'fugalh/desert.vim'
Plug 'cocopon/iceberg.vim'

Plug 'sbdchd/neoformat'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

Plug 'preservim/nerdtree'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" Initialize plugin system
call plug#end()


syntax enable
colorscheme desert 
"evening dracula snazzy ron

filetype on
set termguicolors
set t_Co=256

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

" keep viminfo file in .vim dir
set viminfo+=n~/.vim/viminfo

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4

" Enable line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight current line
set cursorline

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

" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
				" Enable file type detection
				filetype on
				" Treat .json files as .js
				autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
				" Treat .md files as Markdown
				autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

"""""""""""""""""""""
" === NerdTREE ==== "
"""""""""""""""""""""
" show hidden files
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" let g:NERDTreeWidth=15

" Automaticaly close vim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toogle with <Ctrl> + n
map <C-n> :NERDTreeToggle<CR>



" from:
" https://github.com/2lach/dotfiles-version-1/blob/master/linux/.vimrc
"-----
" vim:set ft=vim et sw=2:
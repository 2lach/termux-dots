" 
" Neovim config of
" 	Stefan Lachmann
" 	@2lach 
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins (using vim-plug)
source ~/.config/nvim/plugins.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""
" setup directories
"""""""""""""""""""

silent !mkdir -p ~/.config/nvim/_backup ~/.config/nvim/_temp ~/.config/nvim/_undo
set backupdir=~/.config/nvim/_backup    " where to put backup files
set directory=~/.config/nvim/_temp      " where to put swap files
set undodir=~/.config/nvim/_undo        " where to save undo histories
" keep viminfo file in .vim dir
set viminfo+=n~/.config/nvim/viminfo

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""

set clipboard+=unnamedplus              " use system clipboard
" set shortmess=at                        " Abbr mess +truncate when necessary
set encoding=utf-8 nobomb               " Use UTF-8 without BOM

set number
set rnu                                 " set relative number
set ruler                               " show ruler
set cursorline                          " Highlight cursorline
set showcmd                             " show cmdline input 
set wrap                                " handle long lines nicely.

set shiftwidth=2                        " an autoindent is two spaces
set tabstop=2                           " Make tabs as wide as two spaces
set modeline                            " Respect modeline in files
set modelines=4

set list                                " show invisible characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_    " display them
set noeol                               " Don’t add empty newlines at the end of files
set showmatch                           " show matching braces
set shell=$SHELL                        " current shell
set backspace=indent,eol,start          " Allow backspace in insert mode

set undofile
set undolevels=1000                     " How many undos
set undoreload=10000                    " number of lines to save for undo

set cmdheight=2                         " commandline window

"Tab in cmdline shows menu with buffers and filenames
" set wildchar=<Tab> wildmenu :wwildmode=full
set laststatus=2                        " Always show status line
set showmode                            " Show the current mode

if has('mouse')                         " enable mouse 
	set mouse=a
endif

" mode based cursor shape "
set guicursor=n-v:block-nCursor             " block in normal
set guicursor=r:block20-lCursor-blinkon250  " vertical in insert 
" blinking block in replace
set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon250-blinkoff250

syntax on                                " Enable syntax highlighting
set hidden                               " Allow backgrounding buffers 
set title                                " Show the filename in the window titlebar

" colorscheme
if (has("termguicolors"))
	set termguicolors
endif
colorscheme molotov
" colorscheme seoul256
" colorscheme OceanicNext 
" colorscheme dracula
"""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""" System settings
"""""""""""""""""
" open new split panes to right and below
set splitright
set splitbelow

" debug node issues
" let g:node_client_debug = 1

" disable perl from loading
let g:loaded_perl_provider=0
" python paths
let g:python_host_prog='/data/data/com.termux/files/usr/bin/python3'
let g:ruby_host_prog='/data/data/com.termux/files/usr/bin/ruby'
let g:go_host_prog='/data/data/com.termux/files/usr/bin/go'

autocmd BufWritePre *.py,*.yaml,*.yml,*.go,Dockerfile,*.json :CocCommand editor.action.formatDocument
""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""
" === Neoformat === "
"""""""""""""""""""""
let g:neoformat_try_formatprg = 1

" Have Neoformat only msg when there is an error
let g:neoformat_only_msg_on_error = 1
" Run all enabled formatters (by default Neoformat stops after the first formatter succeeds)
"let g:neoformat_run_all_formatters = 1

" enable shellformat
let g:shfmt_opt="-ci"

" xml
let g:neoformat_xml_tidy = {
	\ 'exe': 'tidy',
	\ 'args': ['-quiet',
	\          '-xml',
	\          '--indent auto',
	\          '--indent-spaces ' . shiftwidth(),
	\          '--vertical-space yes',
	\          '--tidy-mark no',
	\          '--wrap -1'
	\         ],
	\ 'stdin': 1,
	\ }

" format  on save with cpc.nvim + coc-prettier 
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END

"""""""""""""""""""""
" === Undo tree === "
"""""""""""""""""""""
nnoremap <C-u> :MundoToggle<CR>
let g:mundo_width = 40
" let g:mundo_preview_height = 40
let g:mundo_right = 1

"""""""""""""""""""""""
" === Vim airline === "
"""""""""""""""""""""""
" show tabline 
let g:airline#extensions#tabline#enabled = 1            " show open tabs
let g:airline#extensions#coc#enabled = 1                " show coc diagnostics

let w:airline_skip_empty_sections = 0
let g:airline_theme = 'oceanicnext'
let g:airline#extensions#branch#format = 0

"""""""""""""""""""""""""""""""
" === vim-highlightedyank === "
"""""""""""""""""""""""""""""""
if !exists('##TextYankPost')
	map Y <Plug>(highlightedyank)
	map y <Plug>(highlightedyank)
endif

let g:highlightedyank_highlight_duration = 550

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps / Keybindings 
"""""""""""""""""""""""

let mapleader = ','

" Yank to end of line
nnoremap Y y$

" Cut to eol
nnoremap C c$

" Delete to eol
nnoremap D d$

" save current file
nmap <space>w :write<CR>
" source current file
nmap <space>s :source %<CR>

" exit search hightlight
noremap <space><space> :set hlsearch! hlsearch?<cr> 

" Ctrl + x/z move between Buffers prev/next
nnoremap<C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" use Alt + (←/↑/↓/→) to navigate windows
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fixes & autocmds 
"""""""""""""""""""

" Reload icons after init source
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif

" set cursor to blinking underline on exit (iTerm2) tnx @gnachman!
au VimLeave * set guicursor=a:hor250-blinkon1

" save all files when focus is lost without warnings
augroup configgroup
	autocmd!

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins settings

source ~/.config/nvim/plugin-settings.vim

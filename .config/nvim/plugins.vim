""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""
"  auto-install vim-plug (if not already installed)
if empty(glob('$HOME/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	augroup nvim-plug-install
		autocmd VimEnter * PlugInstall
	augroup END
endif

call plug#begin('~/.config/nvim/plugged')

" === Intellisense === "
" https://github.com/neoclide/coc.nvim/wiki | " https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autocomplete
" Plug 'ycm-core/YouCompleteMe' 				" to heavy and works so - so

" === Syntax === "
Plug 'sheerun/vim-polyglot'							" syntax highlighting for almost *
" Plug 'HerringtonDarkholme/yats.vim'         		" Typescript syntax highlighting
" Plug 'mxw/vim-jsx'                          		" ReactJS JSX syntax highlighting
Plug 'peitalin/vim-jsx-typescript'				
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim' 		" Javascript libraries
Plug 'pangloss/vim-javascript'
Plug 'honza/dockerfile.vim'
Plug 'ap/vim-css-color'
Plug 'vim-syntastic/syntastic'										" Syntastic is a syntax checking plugin
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'

" === Utilities === "
Plug 'folke/which-key.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'												" tree explorer
Plug 'Xuyuanp/nerdtree-git-plugin'							" git status in nerdtree
Plug 'simnalamburt/vim-mundo'               		" undo tree
Plug 'tpope/vim-commentary'	 										" comment out/in lines (gcc || gc)
Plug 'github/copilot.vim'                           " github copilot

" Plug 'tpope/vim-surround'
Plug 'machakann/vim-highlightedyank'            " highlights yanks

"=== Formatting === "
Plug 'sbdchd/neoformat' 												" formatting for all the different file types | https://github.com/sbdchd/neoformat
Plug 'rbtnn/vim-vimscript_formatter' 						" vim script formatter

" === Git === "
Plug 'airblade/vim-gitgutter'										" show changes on line in the gutter
Plug 'tpope/vim-fugitive'												" https://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt

" === Airline Plugins === 
Plug 'vim-airline/vim-airline'            			  " Customized vim status line 
Plug 'vim-airline/vim-airline-themes'     			  " https://github.com/vim-airline/vim-airline-themes

" === UI === "
Plug 'junegunn/limelight.vim'            				  " Focus-writing

" Themes/Colorscheme
Plug 'mhartington/oceanic-next' 
Plug 'junegunn/seoul256.vim'   
Plug 'dracula/vim'						
Plug 'gf3/molotov'
Plug 'kyoz/purify', { 'rtp': 'vim' } 						" https://github.com/kyoz/purify/tree/master/vim
 
" === Icons === "
Plug 'ryanoasis/vim-devicons'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

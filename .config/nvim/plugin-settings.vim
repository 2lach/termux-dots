""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins settings
""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""
" === NeoMake ==== "
"""""""""""""""""""""
"  open the list automatically
let g:neomake_open_list = 2

"""""""""""""""""""""
" === NerdTREE ==== "
"""""""""""""""""""""
" show hidden files
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
let g:NERDTreeWidth=25
let g:NERDTreeWinSize = 24

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toogle with <Ctrl> + n
map <C-n> :NERDTreeToggle<CR> 

""""""""""""""""
" === fzf ==== "
""""""""""""""""
set rtp+=/usr/local/opt/fzf

" Open FZF with CTRL+p
nnoremap <C-P> :FZF<CR>
let g:fzf_action = {
	\ 'ctrl-t': 'tab split',
	\ 'ctrl-s': 'split',
	\ 'ctrl-v': 'vsplit'
	\}

" open the buffers on tab-tab
nnoremap <Tab><Tab> :Buffers<cr>

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

""""""""""""""""""""""
" === Limelight ==== "
""""""""""""""""""""""

" toogle with <ctrl> + l
map <C-l> :Limelight!!<CR>
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

""""""""""""""""""""""""""""""
" === gitgutter ==== "
""""""""""""""""""""""""""""""

let g:gitgutter_sign_added = '⇒'
let g:gitgutter_sign_modified = '⇔'
let g:gitgutter_sign_removed = '⇐'
let g:gitgutter_sign_modified_removed = '⇐'

""""""""""""""""""
" === coc.nvim ==== "
""""""""""""""""""

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
"  NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" List marketplace extensions  
nnoremap <silent><nowait> <space>m  :<C-u>CocList marketplace<CR>

set nocompatible
filetype plugin indent on
syntax on
set hidden

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_global_extensions = ['coc-solargraph']
" Coc.nvim settings
" Autoformat på save
autocmd BufWritePre *.py,*.yaml,*.yml,*.go,Dockerfile :CocCommand editor.action.formatDocument

" Optional: tabstopp och indentation per språk
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType dockerfile setlocal tabstop=2 shiftwidth=2 noexpandtab

" Coc.nvim keybindings (valfritt)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call CocActionAsync('doHover')<CR>

""""""""""""""""""
" === Neoformat ==== "
""""""""""""""""""
" Run all enabled formatters (by default Neoformat stops after the first formatter succeeds)
let g:neoformat_run_all_formatters = 1

" Have Neoformat only msg when there is an error
" let g:neoformat_only_msg_on_error = 1

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

let g:neoformat_javascriptreact_prettier = {
	\ 'exe': 'prettier',
	\ 'args': ['--stdin', '--stdin-filepath', '"%:p"'],
	\ 'stdin': 1,
	\ }


let g:neoformat_vim_vimscriptformatter = {
	\ 'exe': 'VimscriptFormatter',
	\ 'args': ['--stdin', '--stdin-filepath', '"%:VimscriptFormatter"'],
	\ 'stdin': 1,
	\ }

" enable shfmt
let g:shfmt_opt="-ci"

" format on save
augroup fmt
	autocmd!
	autocmd BufWritePre * undojoin | Neoformat
augroup END

""""""""""""""""""""""""
" === Undo tree ==== "
""""""""""""""""""""""""

nnoremap <C-u> :MundoToggle<CR>
let g:mundo_width = 60
let g:mundo_preview_height = 40
let g:mundo_right = 1

""""""""""""""""""""""""
" === Vim airline ==== "
""""""""""""""""""""""""

source ~/.config/nvim/space.vim
let g:airline#extensions#coc#show_coc_status = 1

""""""""""""""""""""""""
" === WhichKey ==== "
""""""""""""""""""""""""
map <C-w> :WhichKey<CR>
" https://github.com/folke/which-key.nvim
" :WhichKey " show all mappings
" :WhichKey <leader> " show all <leader> mappings
" :WhichKey <leader> v " show all <leader> mappings for VISUAL mode
" :WhichKey '' v " show ALL mappings for VISUAL mode

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" End Plugins settings:CocList marketplace
""""""""""""""""""""""""""""""""""""""""""""""""""""

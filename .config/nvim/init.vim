call plug#begin('~/.config/nvim/plugged')

Plug 'kien/ctrlp.vim'         " ctrl-p opens a fuzzy file opener
Plug 'sjl/gundo.vim'          " graphical undo tree
"Plug 'wellle/targets.vim'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'

"Git helpers
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " display modified lines
Plug 'Xuyuanp/nerdtree-git-plugin'

"IDE
Plug 'majutsushi/tagbar'      " tags
Plug 'scrooloose/nerdtree'    " file browser

"Syntax
"Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
"Plug 'scrooloose/syntastic'   " syntax checking
"Plug 'http://git.vhdltool.com/vhdl-tool/syntastic-vhdl-tool.git'
Plug 'neomake/neomake'        " async maker/syntax check

"Bling
Plug 'Lokaltog/vim-distinguished'
Plug 'bling/vim-airline'      " fancy status line

" Util
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'

call plug#end()

syntax on        " syntax highlighting

set backspace=2  " nvim, by default, doesn't backspace over lines, fix this
set tabstop=2    " a tab is 4 columns
set shiftwidth=2 " the number of spaces inserted for TAB
set expandtab    " convert tabs to spaces
set nu rnu       " line numbers
set incsearch    " incremental search
set ignorecase   " ignore case when searching (see smartcase)
set smartcase    " do not ignore case if pattern has mixed case (see ignorecase)
set hid          " do not ask to save the current buffer when opening/switching to another buffer
set scrolloff=3  " show at least 3 lines either side of the cursor
set laststatus=2 " display a status line
"set spell spelllang=en_us

"CtrlP configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <c-b> :CtrlPBuffer<CR>

"recommended Gundo configuration
nnoremap <F4> :GundoToggle<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Nerdtree
noremap <c-r> :NERDTreeToggle<CR>

" Tagbar
noremap <c-t> :TagbarToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled=1
" Color scheme settings
set background=dark
colorscheme distinguished

let g:tagbar_type_vhdl = {
    \ 'ctagsbin': 'vhdl-tool',
    \ 'ctagsargs': 'ctags -o -',
    \ 'ctagstype': 'vhdl',
    \ 'kinds' : [
        \'d:prototypes',
        \'b:package bodies',
        \'e:entities',
        \'a:architectures',
        \'t:types',
        \'p:processes',
        \'f:functions',
        \'r:procedures',
        \'c:constants',
        \'T:subtypes',
        \'r:records',
        \'C:components',
        \'P:packages',
        \'l:locals',
        \'i:instantiations',
        \'s:signals',
        \'v:variables:1:0'
    \ ],
    \ 'sro' : '::',
    \ 'kind2scope' : {
         \ 'a' : 'architecture',
         \ 'b' : 'packagebody',
         \ 'P' : 'package',
         \ 'p' : 'process'
    \ },
    \ 'scope2kinds' : {
         \ 'architecture' : 'a',
         \ 'packagebody'  : 'b',
         \ 'package'      : 'P',
         \ 'process'      : 'p'
    \ }
\}


let g:LanguageClient_serverCommands = {
	\ 'vhdl': ['/home/phil/bin/vhdl-tool', 'lsp'],
  \ 'python': ['/usr/bin/pyls'],
  \ 'sh': ['bash-language-server', 'start']
  \ }

let g:LanguageClient_autoStart = 1

nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

" Recommended syntastic configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"
"let g:syntastic_vhdl_checkers = ['vhdltool']

set cscopequickfix=s+,c+,d+,i+,t+,e+

let g:neomake_open_list = 2
autocmd! BufWritePost,BufRead * Neomake
let g:neomake_vhdl_vhdltool_maker = {
	\ 'exe': 'vhdl-tool',
	\ 'args': ['client', 'lint', '--compact'],
	\ 'errorformat': '%f:%l:%c:%t:%m',
	\ }
let g:neomake_vhdl_enabled_makers = ['vhdltool']


" Recommended syntastic configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_vhdl_checkers = ['vhdltool']

set cscopequickfix=s+,c+,d+,i+,t+,e+

hi search ctermbg=LightBlue


let g:easy_align_delimiters = {
\ ':': { 'pattern': ':', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ }

"Multicursor
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-m>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"Fugitive Git Wrapper
" :G        git status
" :Gpush    git push
" :Gpull    git pull
" :Gfetch   git fetch
" :Gedit
" :Gsplit
" :Gvsplit  
" :Gmerge   git merge
" :Grebase  git rebase
" :Gmove    git mv
" :Gblame   git blame
" :Gelete   git rm
" :Ggrep    git grep
" :Gclog    git log
" :Gllog    git log

call plug#begin('~/.config/nvim/plugged')

Plug 'bufkill.vim'            " dont close the window when killing a buffer
Plug 'airblade/vim-gitgutter' " display modified lines
Plug 'kien/ctrlp.vim'         " ctrl-p opens a fuzzy file opener
"Plug 'scrooloose/syntastic'   " syntax checking
Plug 'neomake/neomake'     
Plug 'sjl/gundo.vim'          " graphical undo tree
Plug 'bling/vim-airline'      " fancy status line
Plug 'Lokaltog/vim-distinguished'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'wellle/targets.vim'
"Plug 'http://git.vhdltool.com/vhdl-tool/syntastic-vhdl-tool.git'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-fugitive'

call plug#end()

syntax on        " syntax highlighting
map ; :

set backspace=2  " nvim, by default, doesn't backspace over lines, fix this
set tabstop=2    " a tab is 4 columns
set shiftwidth=2 " the number of spaces inserted for TAB
set expandtab    " convert tabs to spaces
set number       " line numbers
set incsearch    " incremental search
set ignorecase   " ignore case when searching (see smartcase)
set smartcase    " do not ignore case if pattern has mixed case (see ignorecase)
set hid          " do not ask to save the current buffer when opening/switching to another buffer
set scrolloff=3  " show at least 3 lines either side of the cursor
set laststatus=2 " display a status line

"CtrlP configuration
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <c-b> :CtrlPBuffer<CR>

"recommended Gundo configuration
nnoremap <F5> :GundoToggle<CR>

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
	\ 'args': ['client', 'lint'],
	\ 'errorformat': '%f:%l:%c:%t:%m',
	\ }
let g:neomake_vhdl_enabled_makers = ['vhdltool']

hi search ctermbg=LightBlue

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\ ':': { 'pattern': ':', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ }

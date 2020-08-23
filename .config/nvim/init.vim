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
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
"Plug 'scrooloose/syntastic'   " syntax checking
"Plug 'http://git.vhdltool.com/vhdl-tool/syntastic-vhdl-tool.git'
"Plug 'neomake/neomake'        " async maker/syntax check
"Plug 'dense-analysis/ale'

"Bling
Plug 'Lokaltog/vim-distinguished'
Plug 'bling/vim-airline'      " fancy status line

" Util
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'Yggdroot/indentLine'

"tools
Plug 'vimwiki/vimwiki'

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
let mapleader = ","
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
noremap <c-e> :NERDTreeToggle<CR>

" Tagbar
noremap <c-t> :TagbarToggle<CR>

" vhdl shortcuts

au FileType vhdl call ModeVHDL()

function! ModeVHDL()
  imap js STD_LOGIC
  imap jv STD_LOGIC_VECTOR
  imap jt DOWNTO

  "vhdl pretify
  iab ieee    IEEE
  iab std_logic_1164  STD_LOGIC_1164
  iab numeric_std     NUMERIC_STD
  iab osvvm           OSVVM
  iab context         CONTEXT
  iab work            WORK
  iab std_logic       STD_LOGIC
  iab std_logic_vector STD_LOGIC_VECTOR
  iab signed            SIGNED
  iab unsigned          UNSIGNED
  iab resize            RESIZE
  iab rising_edge       RISING_EDGE
  iab falling_edge      FALLING_EDGE
  
  iab abs               ABS
  iab access            ACCESS
  iab after             AFTER
  iab alias             ALIAS
  iab all               ALL
  iab and               AND
  iab architecture      ARCHITECTURE
  iab array             ARRAY
  iab assert            ASSERT
  iab attribute         ATTRIBUTE
  iab begin             BEGIN
  iab block             BLOCK
  iab body              BODY
  iab buffer            BUFFER
  iab bus               BUS
  iab case              CASE
  iab component         COMPONENT
  iab configuration     CONFIGURATION
  iab constant          CONSTANT
  iab disconnect        DISCONNECT
  iab downto            DOWNTO
  iab elsif             ELSIF
  iab else              ELSE
  iab end               END
  iab entity            ENTITY
  iab exit              EXIT
  iab file              FILE
  iab for               FOR
  iab function          FUNCTION
  iab generate          GENERATE
  iab generic           GENERIC
  iab group             GROUP
  iab guarded           GUARDED
  iab if                IF
  iab impure            IMPURE
  iab in                IN
  iab inertial          INERTIAL
  iab inout             INOUT
  iab is                IS
  iab label             LABEL
  iab library           LIBRARY
  iab linkage           LINKAGE
  iab literal           LITERAL
  iab loop              LOOP
  iab map               MAP
  iab mod               mod
  iab nand              NAND
  iab new               NEW
  iab next              NEXT
  iab nor               NOR
  iab not               NOT
  iab null              NULL
  iab of                OF
  iab on                ON
  iab open              OPEN
  iab or                OR
  iab others            OTHERS
  iab out               OUT
  iab package           PACKAGE
  iab port              PORT
  iab postponed         POSTPONED
  iab procedure         PROCEDURE
  iab process           PROCESS
  iab protected         PROTECTED
  iab pure              PURE
  iab range             RANGE
  iab record            RECORD
  iab register          REGISTER
  iab reject            REJECT
  iab return            RETURN
  iab rol               ROL
  iab ror               ROR
  iab select            SELECT
  iab severity          SEVERITY
  iab signal            SIGNAL
  iab shared            SHARED
  iab sla               SLA
  iab sli               SLI
  iab sra               SRA
  iab srl               SRL
  iab subtype           SUBTYPE
  iab then              THEN
  iab to                TO
  iab transport         TRANSPORT
  iab type              TYPE
  iab unaffected        UNAFFECTED
  iab units             UNITS
  iab until             UNTIL
  iab use               USE
  iab variable          VARIABLE
  iab wait              WAIT
  iab when              WHEN
  iab while             WHILE
  iab with              WITH
  iab xnor              XNOR
  iab xor               XOR

endfunction


" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1
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
	\ 'vhdl': ['hdl_checker', '--lsp'],
  \ 'verilog': ['hdl_checker', '--lsp'],
  \ 'systemverilog': ['hdl_checker', '--lsp'],
  \ 'sh': ['bash-language-server', 'start']
  \ }

let g:LanguageClient_autoStart = 1

nmap <F5> <Plug>(lcn-menu)
nmap <silent>K <Plug>(lcn-hover)
nmap <silent>gd <Plug>(lcn-definition)
nmap <silent><F2> <Plug>(lcn-rename)

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

"let g:neomake_open_list = 2
"autocmd! BufWritePost,BufRead * Neomake
"let g:neomake_vhdl_vhdltool_maker = {
"  \ 'exe': 'vhdl-tool',
"  \ 'args': ['client', 'lint', '--compact'],
"  \ 'errorformat': '%f:%l:%c:%t:%m',
"  \ }
"let g:neomake_vhdl_enabled_makers = ['vhdltool']

" VHDL
if executable('vhdl_ls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'vhdl_ls',
        \ 'cmd': {server_info->['vhdl_ls']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'vhdl_ls.toml'))},
        \ 'whitelist': ['vhdl'],
        \ })
endif

" vim-lsp signs are very useful in spotting bugs
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1

let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)



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



let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

set cmdheight=2
let g:echodoc_enable_at_startup = 1



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

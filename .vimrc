
call plug#begin('~/.config/nvim/plugged')
Plug 'kien/ctrlp.vim'         " ctrl-p opens a fuzzy file opener
Plug 'sjl/gundo.vim'          " graphical undo tree
Plug 'easymotion/vim-easymotion'
"Git helpers
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " display modified lines
"Plug 'vim-scripts/vim-svngutter'
"IDE
Plug 'majutsushi/tagbar'      " tags
Plug 'scrooloose/nerdtree'    " file browser
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
"Syntax
Plug 'dense-analysis/ale'
"Bling
Plug 'bling/vim-airline'      " fancy status line
"color
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
" util
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
"tools
Plug 'vimwiki/vimwiki'
call plug#end()

syntax on
filetype plugin indent on

"setlocal omnifunc=syntaxcomplete#Complete
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

"set autocomplete
set wildmenu
set wildmode=longest,list,full

set backspace=2  " vim, by default, doesn't backspace over lines, fix this
set tabstop=2    " a tab is 4 columns
set softtabstop=2
set expandtab
set shiftwidth=2 " the number of spaces inserted for TAB
set expandtab    " convert tabs to spaces
set nu rnu       " line numbers
set incsearch    " incremental search
set ignorecase   " ignore case when searching (see smartcase)
set hlsearch
set smartcase    " do not ignore case if pattern has mixed case (see ignorecase)
set hid          " do not ask to save the current buffer when opening/switching to another buffer
set scrolloff=3  " show at least 3 lines either side of the cursor
set laststatus=2 " display a status line
set cmdheight=2
"backups
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
"
let mapleader = ","
"shop partial command
set showcmd
"readability
set ruler
set cursorline

"prevent weird things from happening
set nocompatible


"indentation
set smartindent

"split modify
set splitbelow splitright

nnoremap <C-L> :nohl<CR><C-L>

"spell checking
map <C-o> :setlocal spell! spelllang=en_us,de_de<CR>

"split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"-----------------------------------------------------------------------
" Nerdtree
"-----------------------------------------------------------------------
noremap <C-e> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusWithFlags = 1

"-----------------------------------------------------------------------
" NerdCommenter
"-----------------------------------------------------------------------
vmap <C-\> <plug>NERDCommenterToggle
nmap <C-\> <plug>NERDCommenterToggle

"-----------------------------------------------------------------------
"CtrlP configuration
"-----------------------------------------------------------------------
"ignore gitignore files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <c-b> :CtrlPBuffer<CR>

"-----------------------------------------------------------------------
" GUNDO
"-----------------------------------------------------------------------
"recommended Gundo configuration
nnoremap <F4> :GundoToggle<CR>

"-----------------------------------------------------------------------
" easyalign
"-----------------------------------------------------------------------
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:easy_align_delimiters = {
\ ':': { 'pattern': ':', 'left_margin': 1, 'right_margin': 1, 'stick_to_left': 0 },
\ }


"-------------------------------------------------------------
" gitgutter
"-------------------------------------------------------------
let g:gitgutter_terminal_reports_focus=0
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap ghp <Plug>(GitGutterPreviewHunk)
nmap ght :GitGutterLineHighlightsToggle<CR>

"-------------------------------------------------------------
" Airline
"-------------------------------------------------------------
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1

"-------------------------------------------------------------
" Color scheme settings
"-------------------------------------------------------------
set background=dark
colorscheme iceberg
"-------------------------------------------------------------
"Multicursor
"-------------------------------------------------------------
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
"-------------------------------------------------------------
"vimwiki
"-------------------------------------------------------------
let g:vimwiki_list = [{'path': '~/Nextcloud/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
set cmdheight=2
let g:echodoc_enable_at_startup = 1

let g:ale_set_balloons =  1
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g :ALEPrevious<CR>
nmap <silent> ]g :ALENext<CR>

" Remap keys for gotos
nmap <silent> gd :ALEGoToDefinition<CR>
nmap <silent> gy :ALEGoToTypeDefinition<CR>
nmap <silent> gr :ALEFindReferences<CR>
" Remap for rename current word
nmap <F2> :ALERename<CR>
" Fix autofix problem of current line
nmap <leader>qf :ALEFix<CR>


"-------------------------------------------------------------
" VHDL
"-------------------------------------------------------------
call ale#linter#Define('vhdl', {
\   'name': 'rust-hdl',
\   'lsp': 'stdio',
\   'language': 'vhdl',
\   'executable': 'vhdl_ls',
\   'command': 'vhdl_ls',
\   'project_root': getcwd(),
\ })

let g:ale_linters = {
\  'vhdl': ['rust-hdl'],
\}
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"-----------------------------------------------------------------------
" vhdl shortcuts
"-----------------------------------------------------------------------
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
au FileType vhdl call ModeVHDL()

function! s:VHDLUppercaseKeyword(key)
    " Do not uppercase word if within a comment or string
    if synIDattr(synID(line("."),col(".")-1 ,0),"name") =~# 'vhdlComment\|vhdlString'
        return a:key
    else
        return toupper(a:key)
    endif
endfunction

function! ModeVHDL()
  imap sl  STD_LOGIC
  imap slv STD_LOGIC_VECTOR
  imap dt  DOWNTO
  imap --== --====================================================================

  "vhdl pretify
  iab <expr> <buffer> ieee              <SID>VHDLUppercaseKeyword('ieee')
  iab <expr> <buffer> std_logic_1164    <SID>VHDLUppercaseKeyword('std_logic_1164')
  iab <expr> <buffer> numeric_std       <SID>VHDLUppercaseKeyword('numeric_std')
  iab <expr> <buffer> osvvm             <SID>VHDLUppercaseKeyword('osvvm')
  iab <expr> <buffer> context           <SID>VHDLUppercaseKeyword('context')
  iab <expr> <buffer> work              <SID>VHDLUppercaseKeyword('work')
  iab <expr> <buffer> std_logic         <SID>VHDLUppercaseKeyword('std_logic')
  iab <expr> <buffer> std_logic_vector  <SID>VHDLUppercaseKeyword('std_logic_vector')
  iab <expr> <buffer> time              <SID>VHDLUppercaseKeyword('time')
  iab <expr> <buffer> integer           <SID>VHDLUppercaseKeyword('integer')
  iab <expr> <buffer> natural           <SID>VHDLUppercaseKeyword('natural')
  iab <expr> <buffer> positive          <SID>VHDLUppercaseKeyword('positive')
  iab <expr> <buffer> signed            <SID>VHDLUppercaseKeyword('signed')
  iab <expr> <buffer> unsigned          <SID>VHDLUppercaseKeyword('unsigned')
  iab <expr> <buffer> resize            <SID>VHDLUppercaseKeyword('resize')
  iab <expr> <buffer> rising_edge       <SID>VHDLUppercaseKeyword('rising_edge')
  iab <expr> <buffer> falling_edge      <SID>VHDLUppercaseKeyword('falling_edge')
  iab <expr> <buffer> abs               <SID>VHDLUppercaseKeyword('abs')
  iab <expr> <buffer> access            <SID>VHDLUppercaseKeyword('access')
  iab <expr> <buffer> after             <SID>VHDLUppercaseKeyword('after')
  iab <expr> <buffer> alias             <SID>VHDLUppercaseKeyword('alias')
  iab <expr> <buffer> all               <SID>VHDLUppercaseKeyword('all')
  iab <expr> <buffer> and               <SID>VHDLUppercaseKeyword('and')
  iab <expr> <buffer> architecture      <SID>VHDLUppercaseKeyword('architecture')
  iab <expr> <buffer> array             <SID>VHDLUppercaseKeyword('array')
  iab <expr> <buffer> assert            <SID>VHDLUppercaseKeyword('assert')
  iab <expr> <buffer> attribute         <SID>VHDLUppercaseKeyword('attribute')
  iab <expr> <buffer> begin             <SID>VHDLUppercaseKeyword('begin')
  iab <expr> <buffer> block             <SID>VHDLUppercaseKeyword('block')
  iab <expr> <buffer> body              <SID>VHDLUppercaseKeyword('body')
  iab <expr> <buffer> buffer            <SID>VHDLUppercaseKeyword('buffer')
  iab <expr> <buffer> bus               <SID>VHDLUppercaseKeyword('bus')
  iab <expr> <buffer> case              <SID>VHDLUppercaseKeyword('case')
  iab <expr> <buffer> component         <SID>VHDLUppercaseKeyword('component')
  iab <expr> <buffer> configuration     <SID>VHDLUppercaseKeyword('configuration')
  iab <expr> <buffer> constant          <SID>VHDLUppercaseKeyword('constant')
  iab <expr> <buffer> disconnect        <SID>VHDLUppercaseKeyword('disconnect')
  iab <expr> <buffer> downto            <SID>VHDLUppercaseKeyword('downto')
  iab <expr> <buffer> elsif             <SID>VHDLUppercaseKeyword('elsif')
  iab <expr> <buffer> else              <SID>VHDLUppercaseKeyword('else')
  iab <expr> <buffer> end               <SID>VHDLUppercaseKeyword('end')
  iab <expr> <buffer> entity            <SID>VHDLUppercaseKeyword('entity')
  iab <expr> <buffer> exit              <SID>VHDLUppercaseKeyword('exit')
  iab <expr> <buffer> file              <SID>VHDLUppercaseKeyword('file')
  iab <expr> <buffer> for               <SID>VHDLUppercaseKeyword('for')
  iab <expr> <buffer> function          <SID>VHDLUppercaseKeyword('function')
  iab <expr> <buffer> generate          <SID>VHDLUppercaseKeyword('generate')
  iab <expr> <buffer> generic           <SID>VHDLUppercaseKeyword('generic')
  iab <expr> <buffer> group             <SID>VHDLUppercaseKeyword('group')
  iab <expr> <buffer> guarded           <SID>VHDLUppercaseKeyword('guarded')
  iab <expr> <buffer> if                <SID>VHDLUppercaseKeyword('if')
  iab <expr> <buffer> impure            <SID>VHDLUppercaseKeyword('impure')
  iab <expr> <buffer> in                <SID>VHDLUppercaseKeyword('in')
  iab <expr> <buffer> inertial          <SID>VHDLUppercaseKeyword('inertial')
  iab <expr> <buffer> inout             <SID>VHDLUppercaseKeyword('inout')
  iab <expr> <buffer> is                <SID>VHDLUppercaseKeyword('is')
  iab <expr> <buffer> label             <SID>VHDLUppercaseKeyword('label')
  iab <expr> <buffer> library           <SID>VHDLUppercaseKeyword('library')
  iab <expr> <buffer> linkage           <SID>VHDLUppercaseKeyword('linkage')
  iab <expr> <buffer> literal           <SID>VHDLUppercaseKeyword('literal')
  iab <expr> <buffer> loop              <SID>VHDLUppercaseKeyword('loop')
  iab <expr> <buffer> map               <SID>VHDLUppercaseKeyword('map')
  iab <expr> <buffer> mod               <SID>VHDLUppercaseKeyword('MOD')
  iab <expr> <buffer> nand              <SID>VHDLUppercaseKeyword('nand')
  iab <expr> <buffer> new               <SID>VHDLUppercaseKeyword('new')
  iab <expr> <buffer> next              <SID>VHDLUppercaseKeyword('next')
  iab <expr> <buffer> nor               <SID>VHDLUppercaseKeyword('nor')
  iab <expr> <buffer> not               <SID>VHDLUppercaseKeyword('not')
  iab <expr> <buffer> null              <SID>VHDLUppercaseKeyword('null')
  iab <expr> <buffer> of                <SID>VHDLUppercaseKeyword('of')
  iab <expr> <buffer> on                <SID>VHDLUppercaseKeyword('on')
  iab <expr> <buffer> open              <SID>VHDLUppercaseKeyword('open')
  iab <expr> <buffer> or                <SID>VHDLUppercaseKeyword('or')
  iab <expr> <buffer> others            <SID>VHDLUppercaseKeyword('others')
  iab <expr> <buffer> out               <SID>VHDLUppercaseKeyword('out')
  iab <expr> <buffer> package           <SID>VHDLUppercaseKeyword('package')
  iab <expr> <buffer> port              <SID>VHDLUppercaseKeyword('port')
  iab <expr> <buffer> postponed         <SID>VHDLUppercaseKeyword('postponed')
  iab <expr> <buffer> procedure         <SID>VHDLUppercaseKeyword('procedure')
  iab <expr> <buffer> process           <SID>VHDLUppercaseKeyword('process')
  iab <expr> <buffer> protected         <SID>VHDLUppercaseKeyword('protected')
  iab <expr> <buffer> pure              <SID>VHDLUppercaseKeyword('pure')
  iab <expr> <buffer> range             <SID>VHDLUppercaseKeyword('range')
  iab <expr> <buffer> record            <SID>VHDLUppercaseKeyword('record')
  iab <expr> <buffer> register          <SID>VHDLUppercaseKeyword('register')
  iab <expr> <buffer> reject            <SID>VHDLUppercaseKeyword('reject')
  iab <expr> <buffer> return            <SID>VHDLUppercaseKeyword('return')
  iab <expr> <buffer> rol               <SID>VHDLUppercaseKeyword('rol')
  iab <expr> <buffer> ror               <SID>VHDLUppercaseKeyword('ror')
  iab <expr> <buffer> select            <SID>VHDLUppercaseKeyword('select')
  iab <expr> <buffer> severity          <SID>VHDLUppercaseKeyword('severity')
  iab <expr> <buffer> signal            <SID>VHDLUppercaseKeyword('signal')
  iab <expr> <buffer> shared            <SID>VHDLUppercaseKeyword('shared')
  iab <expr> <buffer> sla               <SID>VHDLUppercaseKeyword('sla')
  iab <expr> <buffer> sli               <SID>VHDLUppercaseKeyword('sli')
  iab <expr> <buffer> sra               <SID>VHDLUppercaseKeyword('sra')
  iab <expr> <buffer> srl               <SID>VHDLUppercaseKeyword('srl')
  iab <expr> <buffer> subtype           <SID>VHDLUppercaseKeyword('subtype')
  iab <expr> <buffer> then              <SID>VHDLUppercaseKeyword('then')
  iab <expr> <buffer> to                <SID>VHDLUppercaseKeyword('to')
  iab <expr> <buffer> transport         <SID>VHDLUppercaseKeyword('transport')
  iab <expr> <buffer> type              <SID>VHDLUppercaseKeyword('type')
  iab <expr> <buffer> unaffected        <SID>VHDLUppercaseKeyword('unaffected')
  iab <expr> <buffer> units             <SID>VHDLUppercaseKeyword('units')
  iab <expr> <buffer> unsigned          <SID>VHDLUppercaseKeyword('unsigned')
  iab <expr> <buffer> until             <SID>VHDLUppercaseKeyword('until')
  iab <expr> <buffer> use               <SID>VHDLUppercaseKeyword('use')
  iab <expr> <buffer> variable          <SID>VHDLUppercaseKeyword('variable')
  iab <expr> <buffer> wait              <SID>VHDLUppercaseKeyword('wait')
  iab <expr> <buffer> when              <SID>VHDLUppercaseKeyword('when')
  iab <expr> <buffer> while             <SID>VHDLUppercaseKeyword('while')
  iab <expr> <buffer> with              <SID>VHDLUppercaseKeyword('with')
  iab <expr> <buffer> xnor              <SID>VHDLUppercaseKeyword('xnor')
  iab <expr> <buffer> xor               <SID>VHDLUppercaseKeyword('xor')
  " attributes
  iab <expr> <buffer> high              <SID>VHDLUppercaseKeyword('high')
  iab <expr> <buffer> low               <SID>VHDLUppercaseKeyword('low')
  iab <expr> <buffer> range             <SID>VHDLUppercaseKeyword('range')
  iab <expr> <buffer> left              <SID>VHDLUppercaseKeyword('left')
  iab <expr> <buffer> right             <SID>VHDLUppercaseKeyword('right')
  iab <expr> <buffer> ascending         <SID>VHDLUppercaseKeyword('ascending')
  iab <expr> <buffer> image             <SID>VHDLUppercaseKeyword('image')
  iab <expr> <buffer> value             <SID>VHDLUppercaseKeyword('value')
  iab <expr> <buffer> pos               <SID>VHDLUppercaseKeyword('pos')
  iab <expr> <buffer> val               <SID>VHDLUppercaseKeyword('val')
  iab <expr> <buffer> succ              <SID>VHDLUppercaseKeyword('succ')
  iab <expr> <buffer> pred              <SID>VHDLUppercaseKeyword('pred')
  iab <expr> <buffer> leftof            <SID>VHDLUppercaseKeyword('leftof')
  iab <expr> <buffer> rightof           <SID>VHDLUppercaseKeyword('rightof')
  iab <expr> <buffer> instance_name     <SID>VHDLUppercaseKeyword('instance_name')
  " bool
  iab <expr> <buffer> boolean           <SID>VHDLUppercaseKeyword('boolean')
  iab <expr> <buffer> false             <SID>VHDLUppercaseKeyword('false')
  iab <expr> <buffer> true              <SID>VHDLUppercaseKeyword('true')
  " severity assertion
  iab <expr> <buffer> report            <SID>VHDLUppercaseKeyword('report')
  iab <expr> <buffer> severity          <SID>VHDLUppercaseKeyword('severity')
  iab <expr> <buffer> warning           <SID>VHDLUppercaseKeyword('warning')
  iab <expr> <buffer> error             <SID>VHDLUppercaseKeyword('error')
  iab <expr> <buffer> failure           <SID>VHDLUppercaseKeyword('failure')
endfunction

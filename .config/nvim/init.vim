call plug#begin('~/.config/nvim/plugged')

Plug 'kien/ctrlp.vim'         " ctrl-p opens a fuzzy file opener
Plug 'sjl/gundo.vim'          " graphical undo tree
"Plug 'wellle/targets.vim'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'

"Git helpers
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' " display modified lines

"IDE
Plug 'majutsushi/tagbar'      " tags
Plug 'scrooloose/nerdtree'    " file browser
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

"Syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'} " language client
"Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
"Plug 'scrooloose/syntastic'   " syntax checking
"Plug 'http://git.vhdltool.com/vhdl-tool/syntastic-vhdl-tool.git'
"Plug 'neomake/neomake'        " async maker/syntax check
"Plug 'dense-analysis/ale'

"Bling
Plug 'bling/vim-airline'      " fancy status line
"color
Plug 'Lokaltog/vim-distinguished'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'ajmwagar/vim-deus'
Plug 'whatyouhide/vim-gotham'
Plug 'arcticicestudio/nord-vim'
Plug 'artanikin/vim-synthwave84' 
Plug 'cocopon/iceberg.vim'
" Util
"Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'Yggdroot/indentLine'

"tools
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}



call plug#end()

syntax on        " syntax highlighting
filetype plugin indent on

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
set ruler
set cursorline
set splitbelow splitright
let mapleader = ","
"set spell spelllang=en_us
"Spellchecking
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

"-----------------------------------------------------------------------
" Tagbar
"-----------------------------------------------------------------------
noremap <c-t> :TagbarToggle<CR>

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

"-----------------------------------------------------------------------
" conqueror of completion (COC)
"-----------------------------------------------------------------------
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-sh', 
  \ 'coc-actions',
  \ 'coc-yaml',
  \ 'coc-texlab',
  \ 'coc-rome',
  \ 'coc-python',
  \ 'coc-markdownlint',
  \ 'coc-clangd'
  \ ]


"-----------------------------------------------------------------------
" vhdl shortcuts
"-----------------------------------------------------------------------
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
au FileType vhdl call ModeVHDL()

function! s:VHDLUppercaseKeyword(key)
    echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"
    " Do not uppercase word if within a comment or string
    if synIDattr(synID(line("."),col(".")-1 ,0),"name") =~# 'vhdlComment\|vhdlString'
        return a:key
    else
        return toupper(a:key)
    endif
endfunction

function! ModeVHDL()
  imap js STD_LOGIC
  imap jv STD_LOGIC_VECTOR
  imap jt DOWNTO
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

let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

set cscopequickfix=s+,c+,d+,i+,t+,e+

hi search ctermbg=LightBlue

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



let g:vimwiki_list = [{'path': '~/Nextcloud/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

set cmdheight=2
let g:echodoc_enable_at_startup = 1


"-------------------------------------------------------------
" Markdown preview
"-------------------------------------------------------------
nmap <leader>p <plug>MarkdownPreviewToggle

let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_clogal = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'qutebrowser'
let g:mkdp_echo_preview_url = 1
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false
    \ }
let g:mkdp_page_title = '「${name}」'


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
"
"
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


"let g:neomake_open_list = 2
"autocmd! BufWritePost,BufRead * Neomake
"let g:neomake_vhdl_vhdltool_maker = {
"  \ 'exe': 'vhdl-tool',
"  \ 'args': ['client', 'lint', '--compact'],
"  \ 'errorformat': '%f:%l:%c:%t:%m',
"  \ }
"let g:neomake_vhdl_enabled_makers = ['vhdltool']

" VHDL
"if executable('vhdl_ls')
"    au User lsp_setup call lsp#register_server({
"        \ 'name': 'vhdl_ls',
"        \ 'cmd': {server_info->['vhdl_ls']},
"        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'vhdl_ls.toml'))},
"        \ 'whitelist': ['vhdl'],
"        \ })
"endif

" vim-lsp signs are very useful in spotting bugs
"let g:lsp_signs_enabled = 1
"let g:lsp_diagnostics_echo_cursor = 1
"
"let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
"let g:ale_fix_on_save = 1

"nmap <silent> <C-k> <Plug>(ale_previous_wrap)
"nmap <silent> <C-j> <Plug>(ale_next_wrap)



" Recommended syntastic configuration
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_vhdl_checkers = ['vhdltool']
"
"let g:LanguageClient_serverCommands = {
"	\ 'vhdl': ['hdl_checker', '--lsp'],
"  \ 'verilog': ['hdl_checker', '--lsp'],
"  \ 'systemverilog': ['hdl_checker', '--lsp'],
"  \ 'sh': ['bash-language-server', 'start']
"  \ }
"
"let g:LanguageClient_autoStart = 1
"
"nmap <F5> <Plug>(lcn-menu)
"nmap <silent>K <Plug>(lcn-hover)
"nmap <silent>gd <Plug>(lcn-definition)
"nmap <silent><F2> <Plug>(lcn-rename)

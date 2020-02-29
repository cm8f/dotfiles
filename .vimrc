execute pathogen#infect()

set nocompatible

syntax on 
filetype plugin indent on

setlocal omnifunc=syntaxcomplete#Complete

"set autocomplete
set wildmenu 
set wildmode=longest,list,full

"shop partial command
set showcmd

"search configuration
set hlsearch
set ignorecase
set smartcase

"readability
set ruler
set cursorline
set number
set showcmd

"configure statusline 
set laststatus=2
set cmdheight=2

"prevent weird things from happending
set nocompatible

"configure tab stop
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

"indentation
set smartindent

"split modify
set splitbelow splitright

nnoremap <C-L> :nohl<CR><C-L>

"Spellchecking
map <C-o> :setlocal spell! spelllang=en_us<CR>

"split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
"nerdtree
map <F2> :NERDTreeToggle<CR>
map <F3> :TagbarToggle<CR>

"backups
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup


"syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_vhdl_checkers = ['ghdl']
let g:syntastic_c_checkers = ['gcc']

let g:syntastic_c_config_file = '.syntastic_c'

" gitgutter
let g:gitgutter_terminal_reports_focus=0

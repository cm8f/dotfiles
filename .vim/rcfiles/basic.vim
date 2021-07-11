" ----------------------------------------------------
" basic settings
" ----------------------------------------------------
syntax on        " syntax highlighting
filetype plugin indent on

"set autocomplete
set wildmenu
set wildmode=longest,list,full

set backspace=2  " nvim, by default, doesn't backspace over lines, fix this
set softtabstop=2
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
set cmdheight=2
"shop partial command
set showcmd
"readability
set ruler
set cursorline
" split reasonably
set splitbelow splitright

" tidy up backup/swap/undo
set undodir=~/.vim/undodir//
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

let mapleader = ","
"set spell spelllang=en_us
"Spellchecking
map <C-o> :setlocal spell! spelllang=en_us,de_de<CR>
" fix last spelling error
noremap <leader>sp :normal! mm[s1z=`m<CR>
" unhighlight
"nnoremap <C-L> :nohl<CR><C-L>

"split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

noremap <leader>h :tab term htop<CR>
noremap <leader>t :tab term<CR>

" Color scheme settings
set background=dark
colorscheme everforest

" Airline
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1

"let g:deoplete#enable_at_startup = 1
"autocmd CompleteDone * pclose!

set cscopequickfix=s+,c+,d+,i+,t+,e+

hi search ctermbg=LightBlue

"setlocal omnifunc=syntaxcomplete#Complete
let g:ale_completion_enabled = 1
set omnifunc=ale#completion#OmniFunc

:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
":command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

let g:rainbow_active = 1

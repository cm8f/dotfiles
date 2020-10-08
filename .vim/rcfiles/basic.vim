" ----------------------------------------------------
" basic settings
" ----------------------------------------------------
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

" tidy up backup/swap/undo
set undodir=~/.vim/undodir//
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

let mapleader = ","
"set spell spelllang=en_us
"Spellchecking
map <C-o> :setlocal spell! spelllang=en_us,de_de<CR>
" fix last spelling error
noremap <leader>sp :normal! mm[s1z=`m<CR>

"split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

noremap <leader>h :tab term htop<CR>
noremap <leader>t :tab term<CR>

" Color scheme settings
set background=dark
colorscheme iceberg

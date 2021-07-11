call plug#begin('~/.config/nvim/plugged')

Plug 'kien/ctrlp.vim'         " ctrl-p opens a fuzzy file opener
Plug 'sjl/gundo.vim'          " graphical undo tree
"Plug 'wellle/targets.vim'
Plug 'Shougo/echodoc.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'liuchengxu/vim-which-key'
Plug 'Shougo/neco-vim'
Plug 'Shougo/neoinclude.vim'
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
Plug 'kshenoy/vim-signature'
Plug 'vim-vdebug/vdebug'
if has('nvim') 
  "Syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " language client
  " Completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  " color
  Plug 'Lokaltog/vim-distinguished'
  Plug 'dylanaraps/wal.vim'
else 
  Plug 'dense-analysis/ale'
endif
"Bling
Plug 'bling/vim-airline'      " fancy status line
"color
Plug 'arcticicestudio/nord-vim'
Plug 'cocopon/iceberg.vim'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme' 
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'sainnhe/gruvbox-material'
Plug 'crusoexia/vim-dracula'
Plug 'sickill/vim-monokai'
Plug 'danilo-augusto/vim-afterglow'
" Util
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'frazrepo/vim-rainbow'
"tools
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'dstadelm/vim-vunit'

call plug#end()

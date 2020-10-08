source ~/.vim/rcfiles/plugins.vim

source ~/.vim/rcfiles/basic.vim
source ~/.vim/rcfiles/nerdtree.vim
source ~/.vim/rcfiles/nerdcommenter.vim
source ~/.vim/rcfiles/ctrlp.vim
source ~/.vim/rcfiles/gundo.vim
source ~/.vim/rcfiles/gitgutter.vim
source ~/.vim/rcfiles/tagbar.vim
source ~/.vim/rcfiles/coc.vim
source ~/.vim/rcfiles/vimwiki.vim
source ~/.vim/rcfiles/multicursor.vim
source ~/.vim/rcfiles/markdown-preview.vim
source ~/.vim/rcfiles/modevhdl.vim


"-------------------------------------------------------------
" Airline
"-------------------------------------------------------------
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#ale#enabled=1


let g:deoplete#enable_at_startup = 1
autocmd CompleteDone * pclose!

set cscopequickfix=s+,c+,d+,i+,t+,e+

hi search ctermbg=LightBlue


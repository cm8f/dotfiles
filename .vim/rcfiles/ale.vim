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

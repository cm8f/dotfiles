"-----------------------------------------------------------------------
"CtrlP configuration
"-----------------------------------------------------------------------
"ignore gitignore files
let g:ctrlp_user_command = ['__pycache__', 'vunit_out', '.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
nnoremap <c-b> :CtrlPBuffer<CR>

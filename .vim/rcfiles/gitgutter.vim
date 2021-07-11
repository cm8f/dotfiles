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
nmap ghp :GitGutterPreviewHunk<CR>

Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{last}' }
let g:slime_dont_ask_default = 1

nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>
nnoremap <Leader>e :IPythonCellExecuteCell<CR>
" nnoremap [c :IPythonCellPrevCell<CR>
" nnoremap ]c :IPythonCellNextCell<CR>
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" conflict with reloading vimrc
" nnoremap <Leader>r :IPythonCellRun<CR>


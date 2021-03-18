
" ============== telescope ===============
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ============== vimspector ===============
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

" ============== ipython-cell ===============

let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>
nnoremap <Leader>e :IPythonCellExecuteCell<CR>
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>
nmap <Leader>h <Plug>SlimeLineSend
xmap <Leader>h <Plug>SlimeRegionSend

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" conflict with reloading vimrc
" nnoremap <Leader>r :IPythonCellRun<CR>


" ================ nerdtree =================
map <C-b> :NERDTreeToggle<CR>
map <leader>b :NERDTreeFind<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" Prevent crashes? from https://github.com/preservim/nerdtree/wiki
let g:plug_window = 'noautocmd vertical topleft new'

" ============== markdown-preview ===============
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/dotfiles/vim/github-markdown.css'



" ================ airline  =================
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#tabline#enabled = 1


" ================ fugative  =================
nnoremap <leader>gs :Gstatus
nnoremap <leader>gdf :Gdiffsplit
nnoremap <leader>gc :Git commit


" ================ black  =================
" autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>


" ================ tagbar  =================
nmap <F8> :TagbarToggle<CR>


" ================ fzf =================
nnoremap <leader>p  :GFiles<CR>
nnoremap <leader>g :Rg<CR>


" ================ fzf-checkout =================
nnoremap <leader>gb :GBranches<CR>
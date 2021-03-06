
" ============== telescope ===============
nnoremap <C-p> :lua require('telescope-config').project_files()<CR>
nnoremap <C-g> :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ") })<CR>
nnoremap <leader>fd <cmd>lua require('telescope.builtin').file_browser()<cr>
nnoremap <leader>fr <cmd>lua require('telescope.builtin').lsp_references()<cr>
nnoremap <leader>gb <cmd>lua require('telescope.builtin').git_branches()<cr>
" nnoremap <leader>gg <cmd>lua require('telescope.builtin').git_status()<cr>
nnoremap <leader>tl <cmd>lua require('telescope.builtin').builtin()<cr>


" ============== which-key ===============
nnoremap <silent> <leader> :WhichKey ','<CR>
nnoremap <silent> <leader>] :WhichKey ']'<CR>
nnoremap <silent> <leader>[ :WhichKey '['<CR>


" ============== ipython-cell ===============

let g:slime_target = 'tmux'

" fix paste issues in ipython
let g:slime_python_ipython = 1
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{last}' }
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


" ================ file explorer =================
nnoremap <C-b> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

" this variable must be enabled for colors to be applied properly
set termguicolors 


" ============== markdown-preview ===============
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/dotfiles/vim/github-markdown.css'


" ================ airline  =================
let g:airline#extensions#coc#enabled = 0
let g:airline#extensions#tabline#enabled = 1


" ================ fugative  =================
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gdf :Gdiffsplit<CR>
nnoremap <leader>gc :Git commit
nnoremap <leader>gp :Git push origin HEAD


" ================ black  =================
" autocmd BufWritePre *.py execute ':Black'

let g:black_virtualenv = '~/.pyenv/versions/venv-tools/'
nnoremap <F9> :Black<CR>
" nnoremap <F9> :!black .<CR>


" ================ tagbar  =================
nmap <F8> :TagbarToggle<CR>


" ============== vimspector ===============
" nnoremap <leader>dd :call vimspector#Launch()<CR>
" nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
" nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
" nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
" nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
" nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
" nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
" nnoremap <leader>de :call vimspector#Reset()<CR>

" nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

" nmap <leader>dl <Plug>VimspectorStepInto
" nmap <leader>dj <Plug>VimspectorStepOver
" nmap <leader>dk <Plug>VimspectorStepOut
" nmap <leader>d_ <Plug>VimspectorRestart
" nnoremap <leader>d<space> :call vimspector#Continue()<CR>

" nmap <leader>drc <Plug>VimspectorRunToCursor
" nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
" nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint


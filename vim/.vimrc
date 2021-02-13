let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let need_to_install_plugins = 1
endif

set noswapfile
set splitright
set splitbelow
set tabstop=4 
set softtabstop=4 
set shiftwidth=4
set ignorecase " case insensitive search
set number rnu " relative line numbering

" vmap <silent> y y:call system("wl-copy", @@)<CR>
set clipboard=unnamedplus
xnoremap p pgvy

imap jj <Esc>
imap kj <Esc>
cmap jj <Esc>
cmap kj <Esc>


let mapleader=","
let maplocalleader="\\"

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

map :Vs :vs
map :Sp :sp

" close current buffer
nnoremap <leader>c :bp\|bd #<CR>

" enable pasting to actually work
set pastetoggle=<F2>

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" ; is useful for jumping within a line
" nnoremap ; :

"cycle buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

nnoremap <leader>r :so ~/.vimrc<CR>

set foldmethod=indent
set foldlevel=99

" Enable folding with spacebar
nnoremap <space> za

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'jlanzarotta/bufexplorer'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'mhinz/vim-startify'
Plug 'puremourning/vimspector'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

Plug 'joshdick/onedark.vim'

" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'airblade/vim-gitgutter'
" Plug 'jiangmiao/auto-pairs'
" Plug 'dense-analysis/ale'
call plug#end()

if need_to_install_plugins == 1
	echo "Installing plugins..."
	silent! PlugInstall
	echo "Done!"
	q
endif

" search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

let g:python3_host_prog = '~/.pyenv/versions/venv-tools/bin/python'

"tab completion on sub folders
set path +=**


"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead *.py
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set fileformat=unix

abbr pymain if __name__ == '__main__':

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

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


" ============== colors ===============
let g:gruvbox_invert_selection='0'
set background=dark
" colorscheme gruvbox
colorscheme onedark


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


" ================ black  =================
" autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>


" ================ tagbar  =================
nmap <F8> :TagbarToggle<CR>


" ================ fzf =================
nnoremap <leader>p  :GFiles<CR>
nnoremap <leader>g :Rg<CR>


" ================ fzf-checkout =================
nnoremap <leader>gc :GCheckout<CR>


" ================ nerdtree =================
map <C-b> :NERDTreeToggle<CR>
map <leader>b :NERDTreeFind<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1

" If more than one window and previous buffer was NERDTree, go back to it.
autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif

" Prevent crashes? from https://github.com/preservim/nerdtree/wiki
let g:plug_window = 'noautocmd vertical topleft new'


" ================ coc.nvim =================

let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-pyright']

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction


nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

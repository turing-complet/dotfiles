set nocompatible              " be iMproved, required
syntax enable
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set splitright
set splitbelow
set autoread
set tabstop=4 
set softtabstop=4 
set shiftwidth=4
set wildmenu
set incsearch
set autoindent
set number rnu " relative line numbering
filetype plugin indent on

" vmap <silent> y y:call system("wl-copy", @@)<CR>
" set clipboard=unnamedplus
" set laststatus=2

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
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'majutsushi/tagbar'
Plug 'cespare/vim-toml'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
" Plug 'drewtempelmeyer/palenight.vim'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'psf/black', { 'branch': 'stable' }
Plug 'vim-python/python-syntax'
" Plug 'jceb/vim-orgmode'

" Plug 'jupyter-vim/jupyter-vim' 
Plug 'benmills/vimux'
" Plug 'julienr/vim-cellmode'

call plug#end()



"tab completion on sub folders
set path +=**


"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

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

" ============== gruvbox ===============
let g:gruvbox_invert_selection='0'
set background=dark
colorscheme gruvbox 

" ============== ipython-shell ===============


function! StartPyShell()
    call VimuxRunCommand("ipython")
endfunction

function! PyShellSendLine()
  let line = substitute(substitute(escape(escape(getline('.'),'\'),'`'),"\t","  ",'g')," *$","",'g')
    call VimuxRunCommand(line)
endfunction

noremap <leader>ss :call StartPyShell()<CR> 
nnoremap <leader>l  :call PyShellSendLine()<CR>

" lies
" noremap <silent> <C-n> :call RunTmuxPythonCell(0)<CR>
" noremap <C-x> :call RunTmuxPythonAllCellsAbove()<CR>


" ============== python-syntax ===============
let g:python_highlight_all = 1
let g:python_version_2 = 0


" ================ black  =================
" autocmd BufWritePre *.py execute ':Black'
nnoremap <F9> :Black<CR>


" ================ tagbar  =================
nmap <F8> :TagbarToggle<CR>


" ================ fzf =================
nnoremap <leader>p  :GFiles<CR>
nnoremap <leader>g :Rg<CR>


" ================ nerdtree =================
map <C-b> :NERDTreeToggle<CR>
map <leader>b :NERDTreeFind<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeAutoDeleteBuffer=1


" ================ coc.nvim =================

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

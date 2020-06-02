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
filetype plugin indent on
" let g:netrw_banner = 0

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
" Plug 'tpope/vim-fugative'
Plug 'vim-utils/vim-man'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

nnoremap <C-p> :GFiles<CR>


"tab completion on sub folders
set path +=**

let mapleader=","

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"cycle buffers
nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprevious<CR>

map <C-b> :NERDTreeToggle<CR>

imap jj <Esc>
imap kj <Esc>
cmap jj <Esc>
cmap kj <Esc>
set rnu " relative line numbering

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

au BufNewFile,BufRead *.py
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set fileformat=unix

abbr pymain if __name__ == '__main__':

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

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


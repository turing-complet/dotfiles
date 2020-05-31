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
" Plug 'preservim/nerdtree'
" Plug 'tpope/vim-fugative'
Plug 'vim-utils/vim-man'
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
function! BuildYCM(info)
	" info is a dictionary with 3 fields
	" - name:   name of the plugin
	" - status: 'installed', 'updated', or 'unchanged'
	" - force:  set on PlugInstall! or PlugUpdate!
	if a:info.status == 'installed' || a:info.force
		!./install.py
	endif
endfunction
Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }

call plug#end()

nnoremap <C-p> :GFiles<CR>

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"tab completion on sub folders
set path +=**

let mapleader=" "

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"cycle buffers
nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprevious<CR>

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

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
	finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
	set nobackup		" do not keep a backup file, use versions instead
else
	set backup		" keep a backup file (restore to previous version)
	"  if has('persistent_undo')
	"    set undofile	" keep an undo file (undo changes after closing)
	"  endif
endif

if &t_Co > 2 || has("gui_running")
	" Switch on highlighting the last used search pattern.
	set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
	au!

	" For all text files set 'textwidth' to 78 characters.
	autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
	packadd! matchit
endif

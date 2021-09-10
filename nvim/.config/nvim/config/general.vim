set noswapfile
set undodir=~/.vim/undodir
set undofile
set splitright
set splitbelow
set expandtab
set smartindent
set tabstop=4 
set softtabstop=4 
set shiftwidth=4
set number rnu " relative line numbering
set exrc " per project vimrc
set guicursor=
set nohlsearch
set hidden " switch buffers without saving
set noerrorbells
set nowrap
set scrolloff=4
set signcolumn=yes
set colorcolumn=88
set updatetime=50
set timeoutlen=500
set switchbuf=useopen,usetab
set cursorline
set autowrite
set completeopt=menuone,noinsert,noselect
set shortmess+=c


" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
	set mouse=a
endif

" vmap <silent> y y:call system("wl-copy", @@)<CR>
set clipboard+=unnamedplus
xnoremap p pgvy

" enable pasting to actually work
set pastetoggle=<F2>

set foldmethod=indent
set foldlevel=99

"tab completion on sub folders
set path +=**

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'
if executable(s:clip)
	augroup WSLYank
		autocmd!
		autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
	augroup END
endif

autocmd! BufWinEnter quickfix setlocal nowinfixheight


abbr pymain if __name__ == '__main__':
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead *.py
			\ set shiftwidth=4 |
			\ set textwidth=88 |
			\ set expandtab |
			\ set fileformat=unix

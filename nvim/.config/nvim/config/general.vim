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
set shortmess+=c
set switchbuf=useopen,usetab
set cursorline

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

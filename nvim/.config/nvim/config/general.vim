set noswapfile
set splitright
set splitbelow
set tabstop=4 
set softtabstop=4 
set shiftwidth=4
set ignorecase " case insensitive search
set number rnu " relative line numbering

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

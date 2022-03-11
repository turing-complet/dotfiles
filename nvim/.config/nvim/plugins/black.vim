Plug 'psf/black', { 'branch': 'main' }

" autocmd BufWritePre *.py execute ':Black'
let g:black_virtualenv = '~/code/.env'
nnoremap <F9> :Black<CR>
" nnoremap <F9> :!black .<CR>

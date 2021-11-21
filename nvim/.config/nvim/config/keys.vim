imap jj <Esc>
imap kj <Esc>
cmap jj <Esc>
cmap kj <Esc>

let mapleader=","
let maplocalleader=","

" indent/unindent with tab/shift-tab
" nmap <Tab> >>
" nmap <S-tab> <<
" vmap <Tab> >gv
" vmap <S-Tab> <gv
"
" fix jumplist if needed
" nnoremap <C-t> <C-i>

map :Vs :vs
map :Sp :sp

" close current buffer
nnoremap <leader>c :bp\|bd #<CR>

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" ; is useful for jumping within a line
" nnoremap ; :

"cycle buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprev<CR>

" nnoremap <leader>cn :cnext<CR>
" nnoremap <leader>cp :cprev<CR>
nnoremap [j :cnext<CR>
nnoremap [k :cprev<CR>

nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>

" nnoremap <leader>ss :mksession! ~/.vim/sessions
" nnoremap <leader>sl :source ~/.vim/sessions

" Enable folding with spacebar
nnoremap <space> za

" search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap * *<c-o>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>wh <C-w>t<C-w>H
nnoremap <leader>wv <C-w>t<C-w>K


tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap Y y$

" undo break points
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap [ [<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" add to jumplist for >5 line number navs
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" :Cex !tox -e flake8
command! -nargs=+ Cex :redir => o | silent execute '<args>' | redir END | cex split(o, '\n') | copen

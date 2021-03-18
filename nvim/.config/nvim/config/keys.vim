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

" indent/unindent with tab/shift-tab
nmap <Tab> >>
nmap <S-tab> <<
imap <S-Tab> <Esc><<i
vmap <Tab> >gv
vmap <S-Tab> <gv

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
nnoremap <C-p> :bprevious<CR>

nnoremap <leader>r :so ~/.config/nvim/init.vim<CR>

" Enable folding with spacebar
nnoremap <space> za

" search selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
let need_to_install_plugins = 0
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	let need_to_install_plugins = 1
endif


call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-utils/vim-man'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'

Plug 'cespare/vim-toml'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'psf/black', { 'branch': 'stable' }
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }

Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'mhinz/vim-startify'
Plug 'gruvbox-community/gruvbox'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'puremourning/vimspector'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Plug 'dense-analysis/ale'
" Plug 'junegunn/gv.vim'
call plug#end()

if need_to_install_plugins == 1
	echo "Installing plugins..."
	silent! PlugInstall
	echo "Done!"
	q
endif


let g:python3_host_prog = '~/.pyenv/versions/venv-tools/bin/python'

" auto-pairs
au FileType python let b:AutoPairs = AutoPairsDefine({'f"' : '"', 'r"' : '"', 'b"' : '"'})

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead *.py
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set fileformat=unix

abbr pymain if __name__ == '__main__':


" ============== colors ===============
let g:gruvbox_invert_selection='0'
set background=dark
colorscheme gruvbox

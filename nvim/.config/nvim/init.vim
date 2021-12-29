set runtimepath^=~/.vim

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'folke/trouble.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-utils/vim-man'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'wellle/context.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'junegunn/limelight.vim'
" Plug 'junegunn/gv.vim'

Plug 'psf/black', { 'branch': 'main' }
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'vim-test/vim-test'

Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'gruvbox-community/gruvbox'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'

" Plug 'puremourning/vimspector'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
call plug#end()


let g:python3_host_prog = '~/.pyenv/versions/venv-tools/bin/python'


" ============== colors ===============
let g:gruvbox_invert_selection='0'
set background=dark
colorscheme gruvbox

source ~/.config/nvim/config/general.vim
source ~/.config/nvim/config/keys.vim
source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/lsp.vim
lua require('plugins')
" lua require('keys')

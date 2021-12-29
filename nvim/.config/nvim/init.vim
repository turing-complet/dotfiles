set runtimepath^=~/.vim
let mapleader=","
let maplocalleader=","

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'folke/trouble.nvim'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'vim-utils/vim-man'
Plug 'jlanzarotta/bufexplorer'
Plug 'wellle/context.vim'
Plug 'mhinz/vim-startify'
" Plug 'junegunn/gv.vim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

source ~/.config/nvim/plugins/telescope.vim
source ~/.config/nvim/plugins/fugitive.vim
source ~/.config/nvim/plugins/tagbar.vim
source ~/.config/nvim/plugins/gruvbox.vim
source ~/.config/nvim/plugins/auto-pairs.vim
source ~/.config/nvim/plugins/vim-test.vim
source ~/.config/nvim/plugins/which-key.vim
source ~/.config/nvim/plugins/ipython-cell.vim
source ~/.config/nvim/plugins/limelight.vim
source ~/.config/nvim/plugins/airline.vim
source ~/.config/nvim/plugins/markdown-preview.vim
source ~/.config/nvim/plugins/nvim-tree.vim
source ~/.config/nvim/plugins/black.vim
call plug#end()

set background=dark
colorscheme gruvbox

let g:python3_host_prog = '~/.pyenv/versions/venv-tools/bin/python'


source ~/.config/nvim/config/general.vim
source ~/.config/nvim/config/keys.vim
source ~/.config/nvim/config/lsp.vim
lua require('plugins')
" lua require('keys')

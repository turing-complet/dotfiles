set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
source ~/.config/nvim/config/general.vim
source ~/.config/nvim/config/keys.vim
source ~/.config/nvim/config/plugins.vim
source ~/.config/nvim/config/lsp.vim
lua require('plugins')

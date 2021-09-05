function moon
  weather Moon
end

function weather
  curl "http://wttr.in/$argv";
end

set PATH ~/.local/bin $PATH
set PATH ~/.pyenv/bin $PATH
set -x GOPATH /home/jon/code/golang
alias python3 python3.8
alias python python3
set -x PYTHONBREAKPOINT ipdb.set_trace

alias nvim=~/code/nvim.appimage
alias vim=nvim
alias vimrc="vim ~/.vimrc"
set -gx FZF_DEFAULT_COMMAND  'rg --files --hidden'
pyenv init - | source
fish_vi_key_bindings

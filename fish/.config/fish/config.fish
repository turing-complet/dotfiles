function moon
  weather Moon
end

function weather
  curl "http://wttr.in/$argv";
end

alias dc="docker-compose"
set PATH ~/.local/bin $PATH
set PATH ~/.pyenv/bin $PATH
set -x GOPATH /home/jon/code/golang
alias python3 python3.8
set -x PYTHONBREAKPOINT ipdb.set_trace

# set -x DOTNET_ROOT $HOME/dotnet
# set PATH $HOME/dotnet $PATH
set DOTNET_CLI_TELEMETRY_OPTOUT 1

alias kubectl="microk8s kubectl"
alias vimrc="vim ~/dotfiles/vim/.vimrc"
alias vim=nvim
alias gb="git branch -vv"
set -gx FZF_DEFAULT_COMMAND  'rg --files --hidden'
pyenv init - | source
fish_vi_key_bindings
